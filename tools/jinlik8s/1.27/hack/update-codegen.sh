
#!/usr/bin/env bash
# 提高脚本健壮性
# 运行中出现任何命令失败退出、使用任何未定义变量退出以及管道中任何错误退出
set -o errexit
set -o nounset
set -o pipefail
# 设置环境变量
GOPATH=$(go env GOPATH)
SCRIPT_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
# CODEGEN_PKG取值是这样：如果外部指定了用外部，否则用这里定义的
CODEGEN_PKG=${CODEGEN_PKG:-$(echo ../code-generator)}

# 外部版本定义
# 只生成外部版本资源对象的deepcopy、client、lister以及informer对应的方法
if [ "$1" == "external" ]; then
bash "${CODEGEN_PKG}"/generate-groups.sh " \
# 生成对象，所有用all
deepcopy,client,lister,informer" \
# 输出路径，相对根路径
 $2/generated/external \
# 外部API路径，相对根路径
 $2/pkg/apis \
# 组和版本
 nexus:v1 \
# 输出的根路径
 --output-base "${GOPATH}/src" \
# 样板文件
 --go-header-file "${GOPATH}"/src/$2/hack/boilerplate.go.txt
fi
# 内部版本定义
# 生成内外部版本资源对象的deepcopy,client,lister,informer,conversion,defaulter,openapi对应的方法
if [ "$1" == "internal" ]; then
   # 调用code-generator包的generate-internal-groups.sh
GOPATH="${GOPATH}" bash "${CODEGEN_PKG}"/generate-internal-groups.sh \
# 生成对象
"deepcopy,client,lister,informer,conversion,defaulter" \
# 输出路径区别于openapi，相对根路径
 $2/generated/client \
# 内部API路径，相对根路径
 $2/pkg/apis \
# 外部API路径，相对根路径
 $2/pkg/apis \
# 组和版本
 nexus:v1 \
# 输出的根路径
 --output-base "${GOPATH}/src" \
# 样板文件
 --go-header-file "${GOPATH}"/src/$2/hack/boilerplate.go.txt
   # 调用code-generator包的generate-internal-groups.sh
GOPATH="${GOPATH}" bash "${CODEGEN_PKG}"/generate-internal-groups.sh \
# 单独生成openapi对象
"openapi" \
# 输出路径区别于其它对象，相对根路径
 $2/generated \
# 内部API路径，相对根路径
 $2/pkg/apis \
# 外部API路径，相对根路径
 $2/pkg/apis \
# 组和版本
 nexus:v1 \
# 输出的根路径
 --output-base "${GOPATH}/src" \
# 样板文件
 --go-header-file "${GOPATH}"/src/$2/hack/boilerplate.go.txt
fi
