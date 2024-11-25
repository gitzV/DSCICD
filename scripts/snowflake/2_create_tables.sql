-- Create DIRECT_SPEND table for storing aws s3 data

CREATE OR REPLACE TABLE DIRECT_SPEND (
    POnumber INT,
    lineitem INT,
    date VARCHAR(30),
    vendor VARCHAR(255),
    material VARCHAR(255),
    plant VARCHAR(255),
    unit VARCHAR(10),
    price DECIMAL(18, 2),
    currency VARCHAR(30),
    doc_type VARCHAR(100),
    payment_type VARCHAR(100)
);


-- Create hub_plant table
CREATE or replace TABLE hub_plant (
    plant_pk INT AUTOINCREMENT PRIMARY KEY,
    plant_nk VARCHAR(50) NOT NULL,  -- Unique natural key (e.g., PLANT003-LA)
    plant VARCHAR(50) NOT NULL,
    effective_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create hub_vendor table
CREATE OR REPLACE TABLE hub_vendor (
    vendor_pk INT AUTOINCREMENT PRIMARY KEY,
    vendor_nk VARCHAR(50) NOT NULL,  -- Unique natural key (e.g., VENDOR123)
    vendor VARCHAR(100) NOT NULL,
    effective_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create hub_material table
CREATE OR REPLACE TABLE hub_material (
    material_pk INT AUTOINCREMENT PRIMARY KEY,
    material_nk VARCHAR(50) NOT NULL,  -- Unique natural key (e.g., MATERIAL123)
    material VARCHAR(100) NOT NULL,
    effective_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- Create sat_po_trans table
CREATE OR REPLACE TABLE sat_po_trans (
    sat_po_trans_pk INT AUTOINCREMENT PRIMARY KEY,  -- Unique primary key for the satellite
    plant_fk INT,  -- Foreign key to hub_plant
    vendor_fk INT, -- Foreign key to hub_vendor
    material_fk INT, -- Foreign key to hub_material
    POnumber VARCHAR(50),  -- Purchase Order Number
    lineitem INT,  -- Line item number
    date VARCHAR(50),  -- Purchase Order Date
    unit VARCHAR(50),  -- Quantity of the material
    price DECIMAL(18, 2),  -- Unit Price
    currency VARCHAR(10),  -- Currency used
    doc_type VARCHAR(50),  -- Document Type
    payment_type VARCHAR(50),  -- Payment Type
    effective_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp when the record was inserted or updated
    expiration_date TIMESTAMP
);
