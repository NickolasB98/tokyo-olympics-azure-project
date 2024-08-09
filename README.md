
# Tokyo Olympics Data Analytics | Azure End-To-End Data Engineering Project 



## Description
This project comprehensively explores the Tokyo Olympics dataset, employing a data engineering and analytics pipeline. Commencing with a CSV file hosted on GitHub, the data is ingested into the Azure ecosystem via Azure Data Factory. Subsequently, it undergoes a data transformation within Azure Databricks before being securely stored in Azure Data Lake Storage Gen2. Interactive analytics are then performed on the enriched dataset using SQL scripts in Azure Synapse, culminating in insightful visualizations generated through Azure Synapse (or Power BI).

## Architecture 

![Architecture](https://github.com/user-attachments/assets/697a0821-19b9-417e-8092-69781dc1f2c9)


## Dataset Used 
The dataset encompasses a detailed profile of over 11,000 athletes, spanning 47 disciplines, and representing 743 teams that participated in the 2021 Tokyo Olympics. It provides granular information on athletes, coaches, teams, and competition entries, including names, countries, disciplines, genders, and coach details.

Source(Kaggle): [2021 Olympics in Tokyo](https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo)

## Azure Services Used
1. **Azure Data Factory:** For data ingestion from GitHub.
2. **Azure Data Lake Storage Gen2**: As the primary data storage solution.
3. **Azure Databricks:** For data transformation tasks.
4. **Azure Synapse Analytics:** To perform in-depth data analytics.
   
## Workflow 

### Initial Setup
1. Sign in to your Azure Subscription account.
2. Create a Resource Group 'tokyo-olympics-rg' to house and manage all the Azure resources associated with this project. 
3. Within the created resource group, set up a storage account. This is configured to leverage Azure Data Lake Storage(ADLS) Gen2 capabilities.
4. Create a Container inside this storage account to hold the project's data. Two directories 'raw' and 'transformed' are created to store raw and transformed data.
   
<img width="1427" alt="containers" src="https://github.com/user-attachments/assets/33cc47ee-ba81-4038-9b5f-7e22343ecc81">

### Data Ingestion using Azure Data Factory
1. Workspace Creation: An Azure Data Factory workspace is established within the designated resource group.
2. Data Factory Studio Initialization: The Azure Data Factory Studio is launched for pipeline configuration.
3. Dataset Upload: The Tokyo Olympics dataset, initially sourced from Kaggle, is uploaded to GitHub for version control and accessibility.
4. Data Integration Pipeline: A new data integration pipeline is created within the Data Factory Studio to orchestrate the data movement.
5. Copy Data Activity: The Copy Data activity is employed to efficiently transfer data between supported sources and destinations.
6. Data Source Configuration: An HTTP-based data source is configured to retrieve data from the GitHub repository.
7. Linked Service Establishment: A linked service is created to connect to the data source.
8. File Format and Sink Configuration: The file format is defined, and a linked service is established for the data sink (Azure Data Lake Storage Gen2).
9. Pipeline Execution: All configured copy data activities are executed concurrently to expedite the data ingestion process.
   
<img width="1438" alt="Screenshot at Aug 10 01-00-22" src="https://github.com/user-attachments/assets/e7fa415d-0aa7-4028-a416-7be54ec8b13d">


10. After the pipeline completes its execution, navigate to your Azure Data Lake Storage Gen2. Dive into the "raw" folder and validate that the files, like "athletes.csv", "medals.csv", etc., are present and populated with the expected data.

<img width="1422" alt="raw_container" src="https://github.com/user-attachments/assets/ba8cf0e4-562b-49bd-826e-84c86b925c87">


### Data Transformation using Azure Databricks
1. Navigate to Azure Databricks within the Azure portal, create a workspace within the previously established resource group, and launch it.
2. Configuring Compute in Databricks
3. Create a new notebook within Databricks and rename it appropriately, reflecting its purpose or the dataset it pertains to.
4. Establishing a Connection to Azure Data Lake Storage (ADLS)
5. For the connection between the storage account and Databricks to succeed, we need to create an application 'App Tokyo' in Azure App Registrations and collect the credentials (Client ID, Tenant ID, as well as create a Client Secret and get its value).

![Screenshot at Aug 10 00-44-02](https://github.com/user-attachments/assets/50b2dc3f-9c21-4b2f-9589-31c4829e080c)

6. Go to the IAM Access Control in the ADLS settings and give the Blob Storage Data Contributor role to the 'App Tokyo' application.

<img width="1022" alt="tokyoolympicssa role contribution" src="https://github.com/user-attachments/assets/a8b4292f-b464-4928-b60d-db57e60a0657">

7. Using the credentials (Client ID, Tenant ID, Secret), write the appropriate code in the Databricks notebook to mount ADLS. It is recommended that you don't share your secret value if the project is to be shared. Utilize the Azure Key Vault for this purpose. Fill in the name of your container, and the folder accordingly.

<img width="1010" alt="Screenshot at Aug 10 01-03-26" src="https://github.com/user-attachments/assets/36c8e3a1-41cc-4431-88b8-b61d66a4e447">


8. Use the 'spark.read' to Read the Data from the Raw Folder. Spark automatically detects the schema of the tables with the option 'inferSchema'.
   
<img width="1099" alt="spark read from raw container" src="https://github.com/user-attachments/assets/634c0a9f-ac6b-48a6-b965-05fcd59b76cb">


9. Write Transformed Data to ADLS Gen2.

<img width="1013" alt="spark write to transformed container" src="https://github.com/user-attachments/assets/0f73f10a-b976-4a3e-95d7-ff6891e162b6">

<img width="1399" alt="transformed_container" src="https://github.com/user-attachments/assets/ba610127-b3e5-4fe6-aeb5-26906342766d">

The output data was consolidated into a single file within the 'transformed' folder, indicating that the data processing job likely executed with only one partition.

<img width="1414" alt="Screenshot at Aug 10 01-05-47" src="https://github.com/user-attachments/assets/cf6b28c3-a387-4de5-bb0a-a0f2a763dafb">

 
* Please take a look at the notebook below for the whole mounting and transformation script. *

[Tokyo Olympics Transformation.ipynb](https://github.com/NickolasB98/tokyo-olympics-project/blob/main/Tokyo%20Olympic%20Transformation.ipynb)

### Setting Up and Using Azure Synapse Analytics
1. Creating a Synapse Analytics Workspace.
2. Within Workspace navigate to the "Data" section, choose "Lake Database"  and create a Database "TokyoDB"
3. Create the Tables from the Data Lake's Transformed folder within your ADLS Gen2 storage.

<img width="1377" alt="tokyoDB" src="https://github.com/user-attachments/assets/7e5db195-95ed-4c7e-84db-bf5c566bc72c">

 
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

[SQLscript.sql](https://github.com/NickolasB98/tokyo-olympics-project/blob/main/SQLscript.sql)
