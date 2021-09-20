***Containerized Jenkins Pipeline to push Docker Image into Docker hub using AWS***

**Prerequisities**

•  AWS Account
•  IAM User Admin

*DESCRIPTION*

We need to first Create Manual EC2 Instance on AWS.

For an Instance, we have to write Terraform files such as main.tf, security_group.tf, createinstance.tf, provider.tf, variables.tf. These files will contain our code that we want to create, supporting variables, inbound and outbound traffic, regions.

**Create a Access Key and Secret Key**

IAM>>Users>>Choose User name>>Security Credentials>>Click Create access key. An Access Key and Secret Key would be auto-generated. Save these in local machine for furture reference while launch of Instance.

**Create a Key Pair**

Open Terminal and go into directory of Terraform files. Enter ssh-keygen and key pair would be auto-generated and stored in the folder.

**Launch an Amazon EC2 Instance**

•  Open Terrminal and enter in to the Terraform directory where the files are stored.

•  Using Terraform commands, launch an EC2 instance. Commands to be used are: *terraform init*, *terraform plan*, *terraform apply* 

•  Open the Amazon EC2 console choosing EC2 under Compute. You can see an Instance running. Open it and you can view all the details declared in the    files.

**Install and Configure Jenkins on EC2 Instance**

Connect the Linux instance:

•  After launching instance: can connect to it and use it the way would need in local machine.

•  Before connecting to instance >>> get the public DNS name of the instance using the Amazon EC2 console>>>Select the instance and locate Public DNS.

*Using Linux for connecting the instance*

Go to Terminal and enter into Terraform directory. Using below command, we can connect to the instance.
 ssh <public DNS> -l ubuntu –i <customkeypairname>
 sudo -s and we enter into root directory.

**Installing Jenkins**

*JCasC*
-Jenkins Configration as code

•  Provides the ability to define the whole config as simple , human friendly , plain text
•  The ability to reproduce or restore a full envi within minutes based on automation manged as code :config as code
•  yaml syntax
•  without a manual step config can validate and applied to jenkins controller in fully reproducible way

1. config all jenkins initial setup
2. supports most plugins without extra development effort

*Steps to install jenkins*

1. Open ubuntu terminal

2. check whether docker is installed or not.If not, install docker

3. After installation check the version using docker --version

4. Now we have to pull the jenkins from the docker hub using following command docker pull jenkins/jenkins

5. Once image pulled and check by using docker images

6. Once image is created we have to run the container using docker run -d --name myjenkins -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker jenkins/jenkins this is locally running
sudo chmod 777 /var/run/docker.sock - Changing permissions

**Configure Jenkins**

Connect to http://<your_server_public_DNS>:8080 check in any browser.

Now it will be able to access Jenkins through its management interface: As prompted, enter the password found in /var/lib/jenkins/secrets/initialAdminPassword.

Use the following command to display this password:

7. After running the container we get the password. If we did not get, type docker logs <container ID> on Terminal.

8. To unlock jenkins use the step 7 process

9. After unlocking install all dependencies.
        Manage Jenkins>> Manage Plugins.

        Available tab>> select Git Integration, Docker, Docker Pipeline and click Install without restart.

**Jenkins Pipeline**

We need to write Jenkinsfile using declarative pipeline script. This must include the git source, few docker commands to build and run docker image. Also include a command to push it into Docker hub as this is the main aim of our project.

•  We need to write Jenkinsfile using declarative pipeline script. This must include the git source, few docker commands to build and run docker image. Also include a command to push it into Docker hub as this is the main aim of our project.

•  Create a pipeline project in Jenkins. Go to Jenkins Dashboard>New Item>Enter Project name>Select Pipeline>Ok.

•  Enter Description, select GitHub project>Enter project URL

•  Go to Pipeline>Select Pipeline Script from SCM>SCM-Git>Enter Repository URL>Credentials>Add-Jenkins>Enter Username, password and custom ID of Git>Add.

•  Branch has to be changed to *\main as it is the new update of Git and Jenkins by default reads *\master.

•  We have to configure Dockerhub credentials as it is a sensitive information which can’t be shared directly in our file which would be published to Github. For this, Select Pipeline syntax>Sample Step>WithCredentials>Binding>Add-Secret text>Enter Variable>Credentials>Add-Jenkins>Kind>Secret text>Under Secret, Enter dockerhub password>ID-Custom ID>Add>Generate Pipeline Script. This has to be entered in Jenkinsfile.

•  Click on Save and the Click on Build Now and the build would be successful.

***Web Application: Node-js***

Node.js is an open source, cross-platform JavaScript runtime environment that can execute JavaScript code outside of a web browser. It contains default files like index.js, package.json, package-lock.json.

1. index.js: It typically handles your app startup, routing and other functions of your application and does require other modules to add functionality.
2. package.json: It lists the packages your project depends on, specific versions of a package that project can use using semantic versioning rules makes our build reproducible, and therefore easier to share with other developers.
3. package-lock.json: It is automatically generated for any operations where npm modifies either the node_modules tree, or package. json.

*Installation of Node-js*
sudo apt-get install nodejs, 
sudo apt-get install npm, 
npm init, 
npm install express --save

We can also write a Dockerfile to install nodejs application by reading the other files.

**Implementation**

Docker pull from Dockerhub (When build was successful, an image of nodejs app has been pushed into dockerhub repository).

docker run -it -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker -p 3000:3000 manisharayudu12/project1:4 (From my Dockerhub repository)

**OUTPUT**

The tool listens to the port 3000 and exposes a http endpoint and returns the docker containers running locally containing information from each container.

http://<your_server_public_DNS>:3000
OR Use: curl http://<your_server_public_DNS>:3000

You will be able to see the text that you have given in your index.js file.

![WhatsApp Image 2021-09-20 at 7 30 30 PM](https://user-images.githubusercontent.com/83665305/134047400-56518f21-6f1b-49d1-ad4e-efd4e648e1b8.jpeg)

