## Dashboard Deployment - Deploying the app to an computational instance


## AWS - Amazon Web Services - Amazon EC2 Definition:

Virtual servers offered as a web-service that are highly configurable, scalable, and accessible via a point-and-click management console on AWS. 
Amazon has eliminated much of the heavy lifting traditionally required to set up the hardware, software, memory, networking, permissions, storage, security, etc. needed for dedicated computation while maintaining an abundant set of configuration options allowing to tailor a server to the specific needs.


## Use the EC2 

For computationally expensive tasks that a personal machine cannot handle.

For time consuming tasks that need to run in parallel without sacrificing performance on the personal machine.

For repetitive tasks that need to run automatically -- based on time, constraints, or external signals from other web-services or systems.



## Configuration options (step by step):

Setting up and connecting to an instance:

1. Start by signing in to AWS (https://signin.aws.amazon.com/)  using the root user credentials.

Note: Must need a setup an AWS account: user information, email and need a valid credit card.

2. Navigate to the EC2 Management Console (Services > Compute > EC2) and click the “Launch Instance” button. 

<img width="958" alt="imagen" src="https://user-images.githubusercontent.com/17050990/155895061-02105b21-be89-4e07-89b2-ef32dacfc5e7.png">

3. Then it shows a wizard that will walk through the major categories of options required to configure the instance. 
To begin, must choose an Amazon Machine Image (AMI). This is essentially a template that describes the operating system, application server, and any additional software packages we want pre-installed on the virtual server. There are many AMI’s, some created and supported by Amazon, others by community users, and many that have been optimized for specific purpose.
For this case, will choose: `Amazon Linux 2 AMI (HVM) Kernel 4.14 , SSD Volume Type.`

<img width="1401" alt="aws_AMI_instance" src="https://user-images.githubusercontent.com/17050990/156034381-91586287-1e7b-4ebe-99b3-1f564bed0aa6.png">


4. Specify the instance type. There is a wide selection of types which vary in CPU size, memory, storage, and networking capacity and are broadly organized into four families: Storage optimized, Memory optimized, Compute optimized, or General Purpose. Choose a small, General Purpose instance type. 

<img width="1184" alt="imagen" src="https://user-images.githubusercontent.com/17050990/155895109-4ab9deab-3448-4198-9549-1f2794250b9a.png">


5. For further configuration,  the next steps accept the default configuration and click the “Review and Launch” button followed by “Launch”. 

<img width="1008" alt="imagen" src="https://user-images.githubusercontent.com/17050990/155895132-d32d72f9-91a4-48bc-ba84-c8c09644827d.png">

After the launch, then go to the Instances list, and wait until the instance is running and provisioned (running and status check on green):

<img width="1178" alt="aws_instances_list" src="https://user-images.githubusercontent.com/17050990/156036434-142d3146-9018-4dc3-ba68-8d142ffb0a3d.png">



## Setup SSH access:

Select “Create a new key pair”, name it, download it, and then Launch the instance. 

<img width="708" alt="imagen" src="https://user-images.githubusercontent.com/17050990/155895138-4b0bd0e9-887e-4b7e-a5bb-731dec28a171.png">


Connect to the new launched instance using SSH and the key pair already just downloaded by following steps outlined here:
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html

To run this app on an EC2 instance which is going to be available and reachable over the Internet.
Now going to deploy the code to an EC2 instance and make sure it's in the same VPC.

After downloaded the key file: `my-key.pem`, then on the command line change the permissions for the key file and execute for SSH access:

`chmod 400 my-key.pem`

`ssh -i "my-key.pem" ec2-user@ec2-xx-xx-xx-xx.compute-1.amazonaws.com`

<img width="984" alt="aws_ec2_connected" src="https://user-images.githubusercontent.com/17050990/156036108-993a14ec-2047-475f-ba8c-5e8d3001a5b0.png">


## Getting app files ready

Get the `app.py` file on the instance and run it with `python3 app.py`. This runs a debug server, which will be exposing to the Internet. 

After create a git repository locally and on Github where the code will be hosted: https://github.com/marioceron/data_challenge_2022.git
Then need to get the requirements.txt file ready to install all the required libraries on the server. 

First on local machine clone the Github repository:  https://github.com/marioceron/data_challenge_2022.git

On the terminal and run these commands:

`pip freeze > requirements.txt`

`git init`

`git add .`

`git commit -m "Added app.py, assets folder: css file, data folder: dataset raw files and src folder: config.py, data.py and plot.py files (source files)"`

`git remote add origin https://github.com/marioceron/data_challenge_2022.git`

`git push origin master --set-upstream`

This is going to create a requirements.txt file based on the libraries being used, initialize a git repository, and commit our files to it. 
Then push this to the remote github repository.

Check if see a server running prompt much like the one on the local machine. 

The one step left is to allow the EC2 security group to be world accessible. 
In the AWS sonsole, make port 8050 accessible from 0.0.0.0, which will let anyone connect to the server: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/authorizing-access-to-an-instance.html

When go to option "Security Groups" above "NETWORK & SECURITY" in navigation menu on left. It will show up the security group as before. Click on it, it will show a split screen where the one is above has 2 tabs: Details and Inbound. Go to Inbound, in port range input 8050.

<img width="1154" alt="aws_security_group_port_8050" src="https://user-images.githubusercontent.com/17050990/156034287-6aa8e587-da3c-49a5-83e5-e4573d98d97d.png">


Finally, open up a browser and launch the URL `http://instance-ip:8050` and the app should be accessible from over the Internet.

Server Instance: <a href="http://ec2-52-73-95-211.compute-1.amazonaws.com:8050/" target="_blank"> URL </a>

`http://ec2-52-73-95-211.compute-1.amazonaws.com:8050/`

# Install Base Packages:

#On EC2 instance (Linux Ubuntu 18.04.3) run this installations commands:

`sudo apt install git python3`

`sudo apt-get update`

`sudo apt-get install python3-pip`

#If your instance is different (CentOS for example) the installations commands are:

`sudo yum update`

`sudo yum install git-all`

`sudo yum install python3-pip`



# Install python libraries:

`pip3 install pandas`

`pip3 install numpy`

`pip3 install dash`

`pip3 install pathlib2`

`pip3 install statsmodels` 

#Check installations and modules installed:

`pyhton3 --version`

`Python 3.7.10`

`pip3 list`

`Package     --         Version`

`----- -------`

`dash                 2.2.0`

`dash-core-components 2.0.0`

`dash-html-components 2.0.0`

`dash-table           5.0.0`

`docutils             0.14`

`Flask                2.0.3`

`Flask-Compress       1.10.1`

`numpy                1.21.5`

`packaging            21.3`

`pandas               1.3.5`

`pathlib2             2.3.7.1`

`pip                  20.2.2`

`plotly               5.6.0`

`pyparsing            3.0.7`

`pystache             0.5.4`

`python-daemon        2.2.3`

`python-dateutil      2.8.2`

`pytz                 2021.3`

`scipy                1.7.3`

`setuptools           49.1.3`

`simplejson           3.2.0`

`statsmodels          0.13.2`

`----- -------`

# Clone the repository:

`git clone https://github.com/marioceron/data_challenge_2022.git`

`cd data_challenge_2022`

#Set up requirements:

`pip3 install -r requirements.txt`

#Unzip the data processed:

`unzip data_challenge_2022/dashboard/data/processed/olist_orders_dataset.csv.zip`

#Note: If need more files or heavier files like dataset can use this command:

#Optional: Copy files from local:

`scp -i /path/my-key.pem /path/to/file ec2-user@ec2-xx-xx-xx-xx.compute-1.amazonaws.com:~/path/to/location`


#check the path:

`cd dashboard`

`pwd` 

#The folder where is located the app is:

`/home/ubuntu/data_challenge_2022/dashboard/  or /home/ec2-user/data_challenge_2022/dashboard/`

# Execute the app as a background process:

`nohup python3 app.py &`

#this generate a file called: `nohub.out` with the log of execution.


#Do not forget to shutdown the instance after presented over time, this will generate undesirable costs.

