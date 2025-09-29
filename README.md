# jenkins-pipeline-demo
# sample-devops-proj-assign-1
Just a demo project, contains some code written by somone else. I just need to test, that and run some basic pipelines on it.

Wrote the code files
Did add .
Did commit -m ""
did git push origin main
did git checout -b feature-branch
did git push origin feature branch

ran jenkins as docker contianer
docker run -d \
  --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts


accessed jenkins dashbroad using 
https://localhost 8080
it asked for admin password, to access that password do
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword

After getting the password from here and pasting in the jenkins dashboard, installed suggested plugins.

Run sonarqube as docker container
docker run -d --name sonarqube -p 9000:9000 sonarqube:lts-community


Login http://localhost:9000 → create a project sample-devops-project

Generate a token (e.g. sonar-token)

In Jenkins:

Go to Manage Jenkins → Credentials → Global

Add sonarqube-token as a Secret Text credential

Step 6: Run the Pipeline

Commit and push all files (app.js, package.json, Dockerfile, Jenkinsfile).

In Jenkins → Create a new Pipeline job → point it to your repo.

Run build → pipeline will:

Checkout ✅

npm install (build step) ✅

Run SonarQube scanner ✅

Build Docker image ✅