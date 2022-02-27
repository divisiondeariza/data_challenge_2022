## Dashboard Deployment - Deploying the app to an computational instance


## AWS - Amazon Web Services - Amazon EC2 Definition:

Virtual servers offered as a web-service that are highly configurable, scalable, and accessible via a point-and-click management console on AWS. 
Amazon has eliminated much of the heavy lifting traditionally required to set up the hardware, software, memory, networking, permissions, storage, security, etc. needed for dedicated computation while maintaining an abundant set of configuration options allowing to tailor a server to the specific needs.


## Use the EC2 

For computationally expensive tasks that your personal machine cannot handle.

For time consuming tasks you want to run in parallel without sacrificing performance on your personal machine.

For repetitive tasks that need to run automatically -- based on time, constraints, or external signals from other web-services or systems.



## Configuration options (step by step):

Setting up and connecting to an instance:

1. Start by signing in to AWS using the root user credentials.

2. Navigate to the EC2 Management Console (Services > Compute > EC2) and click the “Launch Instance” button. 

3. Then it shows a wizard that will walk through the major categories of options required to configure the instance. 

4. To begin, must choose an Amazon Machine Image (AMI). This is essentially a template that describes the operating system, application server, and any additional software packages we want pre-installed on the virtual server. There are many AMI’s, some created and supported by Amazon, others by community users, and many that have been optimized for specific purpose. For this case, will choose Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type

5. Specify the instance type. There is a wide selection of types which vary in CPU size, memory, storage, and networking capacity and are broadly organized into four families: Storage optimized, Memory optimized, Compute optimized, or General Purpose. Choose a small, General Purpose instance type. 

6. For further configuration,  the steps 3-7 accept the default configuration and click the “Review and Launch” button followed by “Launch”. 

## Setup SSH access:

Select “Create a new key pair”, name it, download it, and then Launch the instance. 

Connect to the new launched instance using SSH and the key pair already just downloaded by following steps outlined here:
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html



To run this app on an EC2 instance which is going to be available and reachable over the Internet.
Now going to deploy the code to an EC2 instance and make sure it's in the same VPC.

## Getting app files ready

Get the app.py file on the instance and run it with `python3 app.py`. This runs a debug server, which for the purpose of this case we will be exposing to the Internet. 

After create a git repository locally and on Github where the code will be hosted: https://github.com/marioceron/data_challenge_2022.git
Then need to get the requirements.txt file ready to install all the required libraries on the server. 

First on local machine clone the Github repository:  https://github.com/marioceron/data_challenge_2022.git

On the terminal and run these commands:

`pip freeze > requirements.txt`

`git init`

`git add -a`

`git commit -m "Added app.py file"`

`git remote add origin https://github.com/marioceron/data_challenge_2022.git`

`git push origin master --set-upstream`

This is going to create a requirements.txt file based on the libraries being used, initialize a git repository, and commit our files to it. 
Then push this to the remote github repository.

Check if see a server running prompt much like the one on the local machine. 

The one step left is to allow the EC2 security group to be world accessible. 
In the AWS sonsole, make port 8050 accessible from 0.0.0.0, which will let anyone connect to the server: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/authorizing-access-to-an-instance.html

Finally, open up a browser and launch the URL `http://instance-ip:8050` and the app should be accessible from over the Internet.

Server Instance URL:


#On EC2 instance (Linux Ubuntu 18.04.3) installations maded:

#Install packages:

`sudo apt install git python3`

`sudo apt-get update`

`sudo apt-get install python3-pip`

#Install python libraries:

`pip3 install pandas`

`pip3 install numpy`

`pip3 install dash`

`pip3 install pathlib2`

`pip3 install statsmodels` 

#Clone the repository:

`git clone https://github.com/marioceron/data_challenge_2022.git`


`cd data_challenge_2022`

#Set up requirements:

`pip3 install -r requirements.txt`

#check the path:

`cd dashboard`

`pwd # The folder where is located the app is: /home/ubuntu/data_challenge_2022/dashboard/`

#Execute the app as a background process:

`nohup python3 app.py &`

#this generate a file called: `nohub.out` with the log of execution.

