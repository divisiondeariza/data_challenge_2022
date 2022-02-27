## Dashboard Deployment

## AWS - Deploying the app to an EC2 instance

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

Finally, open up a browser and launch the URL http://instance-ip:8050, and the app should be accessible from over the Internet.

Server Instance URL:


#On EC2 instance (Linux Ubuntu 18.04.3) installations maded:

#Install packages:

`sudo apt install git python3`

`sudo apt-get install postgresql libpq-dev postgresql-client postgresql-client-common`

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

`pwd # The folder where is located the app is: /home/ubuntu/data_challenge_2022/`

#Execute the app as a background process:

`nohup python3 app.py &`

#this generate a file called: `nohub.out` with the log of execution.

