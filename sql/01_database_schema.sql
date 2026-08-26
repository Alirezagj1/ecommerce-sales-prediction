CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
	Country NVARCHAR(100)
);

CREATE TABLE Products (
	StockCode NVARCHAR(50) PRIMARY KEY,
	Description NVARCHAR(100)
);

CREATE TABLE Invoices (
	InvoiceNo NVARCHAR(20) PRIMARY KEY,
	CustomerID INT NOT NULL,
	InvoiceDate	DATETIME2 NOT NULL,

	CONSTRAINT FK_Invoices_Customers
		FOREIGN KEY (CustomerID)
		REFERENCES Customers(CustomerID)
);

CREATE TABLE InvoiceItems (
	InvoiceItemID INT IDENTITY(1,1) PRIMARY KEY,
	InvoiceNo NVARCHAR(20) NOT NULL,
	StockCode NVARCHAR(50) NOT NULL,
	Quantity INT NOT NULL,
	UnitPrice DECIMAL NOT NULL,
	Revenue DECIMAL NOT NULL,
	
	CONSTRAINT FK_InvoiceItems_Invoices
		FOREIGN KEY (InvoiceNo)
		REFERENCES Invoices(InvoiceNo),

	CONSTRAINT FK_Invoices_Products
		FOREIGN KEY (StockCode)
		REFERENCES Products(StockCode)
);