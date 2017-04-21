node {
  def imageTag = "registry.aliyuncs.com/xiaolu-img/nginx:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"
  checkout scm
  withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
    sh("docker login -u ${env.DOCKER_USERNAME} -p ${env.DOCKER_PASSWORD} registry.aliyuncs.com")
  }
  if (env.BRANCH_NAME == "ui-master") {
    sh("mkdir -p data/console")
    sh('docker run --rm -v "$PWD":/workspace registry.aliyuncs.com/xiaolu-img/xiaolusys-ui:console-master cp -rf /var/www/console /workspace/data/console')
    sh("mkdir -p data/site_media")
    sh('docker run --rm -v "$PWD":/workspace registry.aliyuncs.com/xiaolu-img/xiaolusys-ui:master cp -rf /var/www/static /workspace/data/site_media')
    sh("mkdir -p data/mall")
    sh('docker run --rm -v "$PWD":/workspace registry.aliyuncs.com/xiaolu-img/xiaolusys-ui:mall cp -rf /var/www/mall /workspace/data/mall')
  }
  if (env.BRANCH_NAME == "ui-staging") {
    sh("mkdir -p data/console")
    sh('docker run --rm -v "$PWD":/workspace registry.aliyuncs.com/xiaolu-img/xiaolusys-ui:console-staging cp -rf /var/www/console /workspace/data/console')
    sh("mkdir -p data/site_media")
    sh('docker run --rm -v "$PWD":/workspace registry.aliyuncs.com/xiaolu-img/xiaolusys-ui:staging cp -rf /var/www/static /workspace/data/site_media')
    sh("mkdir -p data/mall")
    sh('docker run --rm -v "$PWD":/workspace registry.aliyuncs.com/xiaolu-img/xiaolusys-ui:mall cp -rf /var/www/mall /workspace/data/mall')
  }
  sh("docker build -t ${imageTag} .")
  sh("docker push ${imageTag}")
  if (env.BRANCH_NAME == "ui-master") {
    sh("sed -ie 's/IMAGE_TAG/${env.BRANCH_NAME}.${env.BUILD_NUMBER}/g' static-deployment.yaml")
    sh("kubectl apply -f static-deployment.yaml -n default")
  } 
  
  if (env.BRANCH_NAME == "ui-staging") {
    sh("sed -ie 's/IMAGE_TAG/${env.BRANCH_NAME}.${env.BUILD_NUMBER}/g' static-staging-deployment.yaml")
    sh("kubectl apply -f static-staging-deployment.yaml -n default")
  }

  if (env.BRANCH_NAME == "k8s") {
    sh("sed -ie 's/IMAGE_TAG/${env.BRANCH_NAME}.${env.BUILD_NUMBER}/g' nginx-deployment.yaml")
    sh("kubectl apply -f nginx-deployment.yaml -n default")
  }
}

