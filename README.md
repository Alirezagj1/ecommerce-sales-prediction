fication target is imbalanced, evaluation focused not only on accuracy but also on Precision, Recall, F1-score, and ROC-AUC.

Visualizations

The modeling notebook includes visualizations for model evaluation and interpretation, including:

- Feature Importance
- Actual vs. Predicted Values
- Residual Plot
- Confusion Matrix
- ROC Curve
- Target Distribution

Key Findings

The analysis showed that historical customer purchasing behavior provides useful information for predicting future revenue and purchase activity.

Regression

For the final Linear Regression model:

- "TotalRevenue" had the strongest coefficient.
- "AverageOrderValue" and "AverageQuantityPerOrder" also showed strong influence.

Classification

For the final Logistic Regression model:

- "NumberOfOrders" was the strongest feature according to the model coefficients.

How to Run

1. Clone the Repository

git clone <repository-url>
cd ecommerce-sales-prediction

2. Download the Dataset

Download the Online Retail dataset from the UCI Machine Learning Repository:

https://archive.ics.uci.edu/dataset/352/online+retail

Place the downloaded raw dataset inside:

data/raw/

3. Install Dependencies

pip install -r requirements.txt

4. Set Up SQL Server

Create a SQL Server database named:

SalesPredictionDB

Run the SQL scripts in the following order:

sql/database_schema.sql
sql/feature_engineering.sql

5. Configure the SQL Connection

Update the SQL Server connection settings in the notebooks according to your local SQL Server configuration.

6. Run the Notebooks

Run the notebooks in the following order:

01_data_exploration.ipynb
        ↓
02_sql_database.ipynb
        ↓
03_modeling.ipynb

Project Status

Completed — Final Version