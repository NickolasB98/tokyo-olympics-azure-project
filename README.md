
# Tokyo Olympics Data Analytics | Azure End-To-End Data Engineering Project 



## Description
This project provides a data engineering and anlytical journey on the Tokyo Olympic dataset. Starting with a CSV on GitHub, the data is ingested into the Azure ecosystem via Azure Data Factory. It's initially stored in Azure Data Lake Storage Gen2, then transformed in Azure Databricks. The enriched data, once again housed in ADLS Gen2, undergoes advanced analytics in Azure Synapse. The insights are finally visualized in Azure Synapse or Power BI, offering a comprehensive view of the dataset.

## Architecture 
<img src="Images/Architecture.png">

## Dataset Used 
This contains the details of over 11,000 athletes, with 47 disciplines, along with 743 Teams taking part in the 2021(2020) Tokyo Olympics.
This dataset contains the details of the Athletes, Coaches, Teams participating as well as the Entries by gender. It contains their names, countries represented, discipline, gender of competitors, name of the coaches.

Source(Kaggle): [2021 Olympics in Tokyo](https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo)

## Azure Services Used
1. **Azure Data Factory:** For data ingestion from GitHub.
2. **Azure Data Lake Storage Gen2**: As the primary data storage solution.
3. **Azure Databricks:** For data transformation tasks.
4. **Azure Synapse Analytics:** To perform in-depth data analytics.
   
## Workflow 

### Initial Setup
1. Sign in to Azure Subscription account.
2. Create a Resource Group 'tokyo-olympics-rg' to house and manage all the Azure resources associated with this project. 
3. Within the created resource group, set up a storage account. This is specifically configured to leverage Azure Data Lake Storage(ADLS) Gen2 capabilities.
4. Create a Container inside this storage account to hold the project's data. Two directories 'raw' and 'transformed' are created to store raw data and transformed data.
   
<img width="1427" alt="containers" src="https://github.com/user-attachments/assets/3068ed5c-3054-4c8d-9d34-7a2ea51d7201">

### Data Ingestion using Azure Data Factory
1. Create an Azure Data Factory workspace within the previously established resource group.
2. After setting up the workspace, launch the Azure Data Factory Studio. 
3. Upload the Tokyo Olympics dataset from kaggle to GitHub.
4. Within the studio, initialize a new data integration pipeline. Now use the task Copy Data to move data efficiently between various supported sources and destinations.
5. Configuring the Data Source with an HTTP template as we are using HTTP request to get the data from the GitHub repo.
6. Establishing the Linked Service for source.
7. Configuring the File Format for and setting up the Linked Service Sink.
8. Repeat the above steps to load all the datasets.
9. You can connect all the copy data activities and run them all at once.
   
<img width="1086" alt="Screenshot at Aug 09 21-31-54" src="https://github.com/user-attachments/assets/962f7276-9276-4b2c-8eff-b6891ff9e608">



10. After the pipeline completes its execution, navigate to your Azure Data Lake Storage Gen2. Dive into the "raw" folder and validate that the files, like "athletes.csv", "medals.csv", etc., are present and populated with the expected data.

<img width="1422" alt="raw_container" src="https://github.com/user-attachments/assets/c558e89c-ca18-4190-99b3-3ce967fde567">


### Data Transformation using Azure Databricks
1. Navigate to Azure Databricks within the Azure portal, create a workspace within the previously established resource group, and launch it.
2. Configuring Compute in Databricks
3. Create a new notebook within Databricks and rename it appropriately, reflecting its purpose or the dataset it pertains to.
4. Establishing a Connection to Azure Data Lake Storage (ADLS)
5. Using the credentials (Client ID, Tenant ID, Secret), write the appropriate code in the Databricks notebook to mount ADLS. It is recommended to not reveal your secret value if the project is to be shared. Utilize the Azure Key Vault for this purpose. Fill in the name of your container, and the folder accordingly.

<img width="1010" alt="image" src="https://github.com/user-attachments/assets/c1b380b2-14d9-46fe-b443-a1905f3a93d9">

6. Use the spark.read to Read the Data from the Raw Folder. Spark automatically detects the schema of the tables with the option 'inferSchema'.
   
<img width="1099" alt="spark read from raw container" src="https://github.com/user-attachments/assets/2647dcaa-bf65-4071-9779-b968935507eb">


7. Write Transformed Data to ADLS Gen2.

<img width="1013" alt="spark write to transformed container" src="https://github.com/user-attachments/assets/ea745998-ecda-4082-bf88-bf7322456a46">


<img width="1399" alt="transformed_container" src="https://github.com/user-attachments/assets/cb31ff2a-f9cc-4fa2-b852-bc7ffdf301be">

The output data was consolidated into a single file within the 'transformed' folder, indicating that the data processing job likely executed with only one partition.

<img width="1405" alt="athletes_spark_job_transformation" src="https://github.com/user-attachments/assets/6abbbca4-f9d4-4913-a552-5f37149de114">
 
Refer to below notebook to transformations and code used to mount ADLS Gen2 to Databricks.

[Tokyo Olympics Transformation.ipynb](https://github.com/shubhammirajkar/tokyo_olympic_de_project/blob/main/Tokyo%20Olympics%20Transformation.ipynb)

### Setting Up and Using Azure Synapse Analytics
1. Creating a Synapse Analytics Workspace.
2. Within Workspace navigate to the "Data" section, choose "Lake Database"  and create a Database "TokyoDB"
3. Create a Table from the Data Lake's Transformed folder within your ADLS Gen2 storage.

<img width="1377" alt="tokyoDB" src="https://github.com/user-attachments/assets/2a8f1a35-1ad8-4f16-a057-ca1f73f648ef">

 
### Performing Data Analysis on the Transformed Data

Create SQL scripts to Perform Exploratory data analysis.
You can also use PowerBI to generate your analysis reports.

#### Most Athletes Per Country:

<img width="1060" alt="image" src="https://github.com/user-attachments/assets/ebde1ced-e7f0-4fb2-bd32-8349e25d541f">


#### Total medals won by each country (Gold, Silver, Bronze):

<img width="1043" alt="image" src="https://github.com/user-attachments/assets/4698cf6e-a5b4-4eba-8d7a-2c5bfd7d1189">


#### Top 20 Counties with the highest Medals count (total):

<img width="1039" alt="image" src="https://github.com/user-attachments/assets/93a0f848-091c-4864-bbf7-15e3bb31f420">


####  Average athletes per Discipline:

<img width="1036" alt="image" src="https://github.com/user-attachments/assets/775f5473-2705-4351-af54-11b88b65e550">


#### Top 40 entry counts by gender for each Discipline:

<img width="976" alt="image" src="https://github.com/user-attachments/assets/b376302f-da44-4f76-8e51-7c631ca06e01">

<img width="759" alt="image" src="https://github.com/user-attachments/assets/684b3870-69de-4ecc-8902-8eb796516b14">


#### Top 10 countries with the most Coaches: 

<img width="1015" alt="image" src="https://github.com/user-attachments/assets/abb86621-6ffe-400a-9031-e4d4243b84c0">

#### Top 10 disciplines with the most Coaches:

<img width="1044" alt="image" src="https://github.com/user-attachments/assets/044dcb96-3875-4269-8bbd-aa59cf0f4f0d">


Refer to the SQL scripts used for data exploration and analysis in Azure Synapse Analytics:


