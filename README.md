
JAVA NOTES APP – STEP BY STEP DEPLOYMENT GUIDE
=============================================

PHASE 1: EC2 SETUP
1. Create EC2 Ubuntu 22.04 instance
2. Open ports: 22, 8080, 3306
3. SSH into EC2:
   ssh -i mykey.pem ubuntu@EC2_PUBLIC_IP

PHASE 2: SERVER CONFIGURATION
1. Upload script:
   scp setup-notes-app.sh ubuntu@EC2_PUBLIC_IP:/home/ubuntu/
2. Run:
   chmod +x setup-notes-app.sh
   ./setup-notes-app.sh
3. Reboot:
   sudo reboot

PHASE 3: APPLICATION DEPLOYMENT
1. Upload project zip
2. Unzip and build:
   mvn clean package
3. Run app:
   java -jar target/notes-app-1.0.0.jar

PHASE 4: DOCKER DEPLOYMENT
1. docker build -t notes-app .
2. docker run -d -p 8080:8080 notes-app

PHASE 5: JENKINS
1. Access Jenkins:
   http://EC2_PUBLIC_IP:8080
2. Get password:
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
3. Create pipeline using Jenkinsfile

TEST API:
POST /api/notes
GET /api/notes

INTERVIEW EXPLANATION:
"I automated server setup using Bash, containerized the app using Docker,
and deployed it on AWS EC2 with Jenkins CI/CD."
