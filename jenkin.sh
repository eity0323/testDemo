mvn clean package -Dmaven.test.skip=true
mv target/*.war ROOT.war
REGISTRY_HOST=registry.pass:443
USER_NAME=eity0323
CI_BUILD REF NAME=master
IMAGE=testdemo
buildtime=$(date +%Y%m%d%H%M%S)
 docker login -u $USER_NAME -p Eity0323 -e kevin@qq.com $REGISTRY_HOST
 docker build -t registry.pass:443/${USER_NAME}/${IMAGE}:{buildtime} -f Dockerfile .
 docker login -u $USER_NAME -p Eity0323 -e kevin@qq.com $REGISTRY_HOST
 docker push registry.paas:443/${USER_NAME}/${IMAGE}:{buildtime}
result='curl -X POST \ -d "registry=${REGISTRY_HOST}&userName=$USER_NAME&image=$IMAGE&tag=${buildtime}&startPort=8080&desout=180000&start_time=120000&stop_time=120000&destory_time=120000" \http://172.16.49.81:5081/svn/ws/registry/registResourceFromCI'
echo $result
if [ "$result" == '{"result":true}'];then
echo success
else
exit 1
fi 