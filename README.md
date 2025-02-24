
# Tokyo Olympics Data Analytics | Azure End-To-End Analytics Engineering Project 

**Project Background**

This project analyses Tokyo Olympics 2021 data using Azure Data Factory (ADF), Azure Databricks, and Azure Synapse Analytics. The goal is to ingest, transform, and load data from multiple sources into a centralized data warehouse, enabling the analytics team to derive meaningful insights and build predictive models. The project demonstrates the integration of Azure services to create a fully automated data pipeline.

**Key Business Metrics**

* **Dataset:** Tokyo Olympics 2021 data (athletes, medals, teams, etc.). (Source(Kaggle): [2021 Olympics in Tokyo](https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo))
* **Data Sources:** CSV files stored in GitHub.
* **Business Goal:** Provide actionable insights into Olympics performance, medal distribution, and athlete statistics.

**Data Structure & Initial Checks**

The dataset consists of the following tables:

**Source Data:**

* Athletes: Information about individual athletes.
* Entries Gender: Athlete distribution by gender.
* Medals: Medal distribution by country and event.
* Teams: Team participation and performance.
* Coaches: Coaching staff details.

**Destination:**

* Azure Data Lake Storage Gen2: For raw and transformed data.
* Azure Synapse Analytics: For final reporting and analysis.

<img width="1377" alt="tokyoDB" src="https://github.com/user-attachments/assets/7e5db195-95ed-4c7e-84db-bf5c566bc72c">

**Executive Summary**

**Overview of Findings**

This project successfully implemented a fully automated data pipeline to ingest, transform, and analyze Tokyo Olympics 2021 data. Key findings include:

* **Data Integration:** Data ingestion from GitHub into Azure Data Lake Gen2.
* **Data Transformation:** Robust transformation of raw data using Azure Databricks.
* **Centralized Reporting:** Loading of transformed data into Azure Synapse Analytics for SQL-based analysis.
* **Visualization:** Insights were visualized using SQL scripts in Azure Synapse.

**Insights Deep Dive**

**Category 1: Athlete Participation (Most Athletes Per Country)**

<img width="1031" alt="topathletespercountry" src="https://github.com/user-attachments/assets/f13185fc-c947-4cb9-af04-912be2cc2c63">

* **Finding:** The United States of America has the highest number of athletes participating, followed by Australia, Germany, and Canada.
* **Supporting Data:** The "Most Athletes Per Country" bar chart shows the total number of athletes for each country, with the United States at the top.
* **Implication:** This indicates the scale of athlete participation and potential investment in sports by these countries.

**Category 2: Medal Distribution (Total Medals Won by Country)**

<img width="1025" alt="medalsbycountry" src="https://github.com/user-attachments/assets/d2f786f4-d3e1-44f0-8fd9-2fc9b7a2e137">

* **Finding:** The United States of America leads in total medals won, followed by the People's Republic of China and Japan.
* **Supporting Data:** The "Total medals won by each country (Gold, Silver, Bronze)" chart shows the distribution of gold, silver, and bronze medals, with the United States having the highest bars.
* **Implication:** This highlights the dominance of these countries in the Olympics, reflecting their strong sports programs and athlete development.

**Category 3: Overall Medal Count (Top Countries with Highest Medal Count)**

<img width="1030" alt="20countriestotalmedals" src="https://github.com/user-attachments/assets/60f94845-6702-4963-b887-ff005ce2b2b0">

* **Finding:** The United States of America significantly leads in total medal count, far surpassing other countries.
* **Supporting Data:** The area chart shows a very high peak for the United States, with a steep decline for the following countries.
* **Implication:** This highlights the exceptional performance of the United States and their strong presence in the Olympics.

**Category 4: Athlete Distribution by Discipline (Average Athletes Per Discipline)**

<img width="1028" alt="avgathletesperdiscipline" src="https://github.com/user-attachments/assets/12fa9002-a163-4101-a3ee-79f7186b6d81">

* **Finding:** Athletics has the highest average number of athletes per discipline, significantly exceeding other sports.
* **Supporting Data:** The bar chart shows a very long bar for Athletics, indicating a much higher average athlete count compared to other disciplines.
* **Implication:** This highlights the popularity and scale of Athletics in the Olympics, likely due to the variety of events and high participation rates.

**Category 5: Gender Distribution by Discipline (Top Entry Counts by Gender)**

<img width="1076" alt="entriespergender" src="https://github.com/user-attachments/assets/1686b316-5d3d-4beb-ab6e-da912b052172">

* **Finding:** Athletics has the highest entry counts for both female and male athletes, with a relatively balanced gender distribution.
* **Supporting Data:** The bar chart shows Athletics with the tallest bars for both female and male counts, and the bars are of similar height.
* **Implication:** This highlights the popularity and scale of Athletics in the Olympics, with strong participation from both genders.

**Category 6: Coaching Staff Distribution by Country (Top 10 Countries with Most Coaches)**

<img width="1026" alt="topcoachespercountry" src="https://github.com/user-attachments/assets/d43ca8e0-2d5f-4d0e-ac2b-07ebe12e9ef2">

* **Finding:** Japan has the highest number of coaches, significantly exceeding other countries in the top 10.
* **Supporting Data:** The bar chart shows Japan with the longest bar, indicating a much higher coach count compared to other nations.
* **Implication:** This suggests a strong emphasis on coaching and athlete support in Japan, potentially contributing to their overall athletic success.

**Category 7: Coaching Staff Distribution by Discipline (Top 10 Disciplines with Most Coaches)**

<img width="1020" alt="topcoachesperdiscipline" src="https://github.com/user-attachments/assets/bbc7f31a-1330-4aad-9320-997ad4e1627a">

* **Finding:** Basketball has the highest number of coaches, significantly exceeding other disciplines in the top 10.
* **Supporting Data:** The bar chart shows Basketball with the longest bar, indicating a much higher coach count compared to other disciplines.
* **Implication:** This suggests a strong emphasis on coaching and athlete support in Basketball, potentially due to team size, strategic complexity, or high competition.

**Recommendations**

Based on the insights above, we recommend the following actions:

* **Talent Development:** Invest in training programs for young athletes to build future medalists.
* **Resource Allocation:** Allocate resources to high-performing sports and teams to maintain dominance.
* **Coaching Programs:** Expand coaching staff and training facilities to support athlete development.
* **Data-Driven Decisions:** Use data analytics to identify emerging trends and optimize performance strategies.

**Assumptions and Caveats**

* **Assumption 1:** Data from the Tokyo Olympics 2021 is accurate and complete.
* **Assumption 2:** The data reflects only the 2021 Olympics and may not be applicable to other events.
* **Assumption 3:** Team size and coaching staff data are consistent across all countries.

**Tools and Technologies Used**

* **Data Integration/Ingestion:** Azure Data Factory (ADF)
* **Data Transformation:** Azure Databricks (PySpark)
* **Data Storage:** Azure Data Lake Storage Gen2
* **Data Analysis:** Azure Synapse Analytics
* **Visualization:** Power BI (optional)

**Solution Architecture**

**Overview**

The architecture involves:

* **Data Ingestion:** Ingesting data from GitHub into Azure Data Lake Gen2 using ADF.
* **Data Transformation:** Transforming data using Azure Databricks.
* **Data Loading:** Loading transformed data into Azure Synapse Analytics.
* **Reporting:** Visualizing data using Azure Synapse and Power BI.

![Architecture](https://github.com/user-attachments/assets/697a0821-19b9-417e-8092-69781dc1f2c9)

**Project Execution Flow**

* **Data Ingestion:** Ingest raw data from GitHub into Azure Data Lake Gen2 using ADF.
* **Data Transformation:** Clean and transform data using Azure Databricks.
* **Data Loading:** Load transformed data into Azure Synapse Analytics.
* **Reporting:** Create interactive dashboards in Azure Synapse and Power BI for analysis and visualization.



## Optional Reading - Project Workflow Analysis

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

 
**Please look at the notebook below for the whole mounting and transformation script.**

[Tokyo Olympics Transformation.ipynb](https://github.com/NickolasB98/tokyo-olympics-project/blob/main/Tokyo%20Olympic%20Transformation.ipynb)

### Setting Up and Using Azure Synapse Analytics
1. Creating a Synapse Analytics Workspace.
2. Within Workspace navigate to the "Data" section, choose "Lake Database"  and create a Database "TokyoDB"
3. Create the Tables from the Data Lake's Transformed folder within your ADLS Gen2 storage.

<img width="1377" alt="tokyoDB" src="https://github.com/user-attachments/assets/7e5db195-95ed-4c7e-84db-bf5c566bc72c">

**Refer to the SQL scripts used for data exploration and analysis in Azure Synapse Analytics:**

[SQLscript.sql](https://github.com/NickolasB98/tokyo-olympics-project/blob/main/SQLscript.sql)
