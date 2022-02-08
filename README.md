# Data Challenge 2022: 
## Data Engineer - Data Scientist - Data Analyst
## Data Challenge – New Joiners

## Description

Every new Data Engineer / Science / Analyst hired at Endava has the chance to go through the “Data Challenge”; where they can learn about quality standards, methodologies, and tools that they can user or apply in the future projects.

Our goal as a discipline is to enhance our technical knowledge, encourage our members to know different approaches (polyglot): i.e.: Apache Spark, Talend, Databricks, and other related tools; also expand their knowledge on cloud-based solutions (AWS (Amazon Web Services), Azure, GCP (Google Cloud Platform), etc.)

Endava data team designed this challenge to get or increase your knowledge in some specific areas, included but not limited to databases, data modelling, date warehouse and SQL topics; Data Acquisition, Data Transformation, ETL, Data Clean, Databases Design, Data Services and Deployment techniques on the cloud.

## General Requirements 

•	Follow code best practices.

•	Follow cloud development best practices.

•	Follow the minimum Web Content Accessibility Guidelines.

•	All back-end services must be deployed on AWS / Azure / GCP (Personal Accounts, could be complete with free tier but you can go out of it if you want).

•	All the code must be in a repository that judges can access.


## Final Demo

After completing your challenge, you might be invited to present it to the data – development – creative leadership team.

-------

# Data Challenge

Endava data team designed this challenge to get or increase the knowledge in some specific areas, included but not limited to databases, data modelling, date warehouse and SQL topics; Data Acquisition, Data Transformation, ETL, Data Clean, Databases Design, Data Services and Deployment techniques on the cloud.

# Data modelling

Using the dataset provided in the Kaggle link below, model a Datawarehouse that could answer the questions in Dashboard for sales management section below:

Optional: use an ETL (e.g., Talend) for the data modelling purpose

https://www.kaggle.com/olistbr/brazilian-ecommerce#olist_orders_dataset.csv

The dataset is a test dataset provided by Olist Store, an ecommerce store.

The dataset contains:

•	100 k orders

•	order view from multiple dimensions

•	order status

•	price

•	payment

•	customer location

•	product attributes

•	reviews written by customer

•	geolocation dataset that relates Brazilian zip codes to lat/lng coordinates

•	an order has one or many order items

-------

# Dashboard for sales management

Design Sales Management Dashboards containing KPIs and visual data representation that answer the following questions:

Where does most revenue come from? – Geographical / visual representation

Which Regions/cities pay more for transportation?

What is the Average Delivery Time for orders? Split on product category (English)

What is the Orders Average Review Score? By Region/City and product category

What is the percentage of delayed orders? Can we relate that to the score given by customers?

Which categories are most sold in quantity?

What is the payment method distribution on number of orders and order value?

What is the product and freight value by date? – separate view

## Suggested KPI: 

•	# Total Orders, Total Sales ($)

•	Top categories by price average

•	Top cities by price average

•	Order status (time taken for delivery)

•	Payment type distribution

•	Freight cost by item cost

•	Product attributes

•	Reviews written by customers (negative / positive)

•	Geolocation dataset that relates Brazilian zip codes to lat/lng coordinates.

## Filters to be included in the dashboard:


Timeframe: List of value – year / quarter / month / day

Customer location/city: List of values - list of cities

Hint: Use a Geo Json technology / Parquet files to show the Geographical / Visual representation

---------

# Steps to follow up the solution

## STEP 1: DATASET

Develop a Case study, explain and describe the data. Store the information from the given dataset on a Database (use any RDMS you are familiar with) and use Data frame (a dataset). Review the dataset, make data preparation, clean (if apply) and make an Entity Relationship Diagram.

Use Python 3 and Python libraries and/or any RDBMS to make your ER diagram.

## STEP 2: ANALYSIS

Analyze the information to answer the questions related on the dashboard from the dataset, use a notebook: Google Collab, or on the cloud GCP/AWS/Azure notebook tool for the analysis and transformation Jupyter notebook / Anaconda on any cloud provider compute image: (i.e.: EC2 on AWS for example).

Use the Python tools to analyze the data: pandas, NumPy, csv, requests, etc.
Plot the dashboard on Python visualization tools: matplotlib, seaborn

Explain and show the process consistently.

## STEP 3: DASHBOARD DEVELOPMENT

Analyze the information to answer the questions related to the dashboard from the dataset, you can do it in any of these 3 ways:
 
## DATA ANALYST (EN):

1.	Analyze the data on Power BI and /or Tableau public (you can use DAX libraries for Power BI as well) and publish your dashboard on the cloud: (i.e.: SharePoint site with your Microsoft employee personal account or Public Tableau site) 

2.	Use an Excel Spreadsheet with filters and /or pivot tables required.

3.	Use Dash (Plotly) or any other libraries (frameworks like Flask, Django) for a dynamic dashboard. For example, select a city from a dropdown menu and a Time frame window.

Explain and show the process consistently.

For the cloud deployment considerations, you must use any of these 3 cloud providers: AWS, Azure or GCP and deploy the dashboard on a compute instance (use the free tier for this).

Hint: First develop your dashboard locally and then update on the cloud (here you can ask for help on how to achieve this).

## STEP 4: PIPELINE DEVELOPMENT – DATA ENGINEER (EN)

Create a Pipeline on Python / Apache Spark and /or inside the instance on the cloud provider (GCP/AWS/Azure) to UPDATE / ADD / DELETE in real time with new data provided on the Original Dataset format.

Make the automation of your notebook on STEP 2 and ingest the new data automatically on the Dashboard (ADD / DEL / UPDATE).

Create a different Mock data sample like the dataset provided to test your solution, user any automation tool or made manually, to show how to update the new dataset changes reflected on the dashboard.

## STEP 5: MACHINE LEARNING – DATA SCIENCE (EN)

With the dataset analyzed from STEP 2, which variables are the most weighted features to help the Brazilian e-commerce company to expand to other regions (featured engineering or PCA (Principal Component Analysis) and show the Correlation heatmap / matrix for the features. 

You can make a model predict a relevant variable, choose one of these options:
 
1. Make a model for classifying the regions against the profit (as prediction variable) on time range specific, to help the company if they must invest/expand or not on the region (investing if the profits are high).
 
2. Make a model for Shipment time prediction where the prediction variable must be the: estimated delivery time against the key features previously calculated.

Define how you are going to perform the experimentation for each model, before starting. Split the dataset into training, test, and validation sets.
You can consider among other variables.

-	Optimization strategy
	
-	Type of regularization
	
-	Batch size	

-	Regularization
	
-	Number of iterations 

-	Learning rate

-	Architecture

Finally identify under which parameters you can compare the models.

The models to be made are the following:

- Pose a solution using SVM (Support Vector Machine) and/or KNN

- Pose a solution using neural networks and/or Logistic regression
 
- Pose a solution using random forest and/or XG Boost
 
- Any other model you want


After performing these approximations, analyze if the desired results were obtained, if the cleaning techniques were adequate, plot the results obtained and compare them between the three models. 


This is an example of a working dashboard:

Power BI Example:

 ![image](https://user-images.githubusercontent.com/17050990/153085531-8b623f2d-4993-4672-bf7c-2ebff5d9fed3.png)



Tableau Example:

https://public.tableau.com/app/profile/marien.abeli/viz/Olist_16207865690910/Story1

-----

# General Considerations

## GIT
•	Use a proper git branching strategy, you will be provided with bitbucket credentials to develop this challenge or use a personal git account.


## Notes (Python)

•	Framework could be Flask or Django the architecture should be proposed by you.

•	Follow Clean Code principles (Installing Sonar Lint in IntelliJ can help).

•	Unit testing is expected with a coverage of at least 80% on service classes (Unitest, Pytest) on the code developed.

•	Code Tools: Jupyter Notebooks / Anaconda, Kaggle Notebooks, Google Collab, PyCharm, Visual Studio code, Jet Brains.

•	If you use microservices architecture, you will need to provide diagrams and documentation of your solution design. And use Postman to test your API calls.

•	PEP8 coding standard.


