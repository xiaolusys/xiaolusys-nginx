node {
  def imageTag = "registry.aliyuncs.com/xiaolu-img/nginx:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"
  checkout scm
  withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
    sh("docker login -u ${env.DOCKER_USERNAME} -p ${env.DOCKER_PASSWORD} registry.aliyuncs.com")
  }
  sh("docker build -t ${imageTag} .")
  sh("docker push ${imageTag} .")
  sh("sed -ie 's/IMAGE_TAG/${env.BRANCH_NAME}.${env.BUILD_NUMBER}/g' nginx-deployment.yaml")
  sh("kubectl apply -f nginx-deployment.yaml -n default")
}

