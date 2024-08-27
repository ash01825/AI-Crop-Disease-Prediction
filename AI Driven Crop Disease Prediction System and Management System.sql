CREATE TABLE Crops (
    crop_id INT PRIMARY KEY,
    crop_name VARCHAR(100),
    scientific_name VARCHAR(255),
    growing_season VARCHAR(100),
    region VARCHAR(100)
);

select * from Crops;

CREATE TABLE Diseases (
    disease_id INT PRIMARY KEY,
    disease_name VARCHAR(100),
    symptoms TEXT,
    affected_crops INT,
    causal_organism VARCHAR(255),
    disease_image BYTEA,
    FOREIGN KEY (affected_crops) REFERENCES Crops(crop_id));

select * from Diseases;

CREATE TABLE PredictionModels (
    model_id INT PRIMARY KEY,
    model_name VARCHAR(100),
    algorithm_used VARCHAR(100),
    accuracy FLOAT,
    training_data_size INT,
    model_file BYTEA,
    date_created DATE);

select * from PredictionModels;

CREATE TABLE Interventions (
    intervention_id INT PRIMARY KEY,
    disease_id INT,
    intervention_type VARCHAR(100),
    description TEXT,
    effectiveness_rating FLOAT,
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id));

select * from Interventions;

CREATE TABLE SensorData (
    sensor_id INT PRIMARY KEY,
    crop_id INT,
    sensor_type VARCHAR(100),
    data_value FLOAT,
    timestamp1 DATE,
	timestamp2 TIME,
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id));

select * from SensorData;

CREATE TABLE Farmers (
    farmer_id INT PRIMARY KEY,
    farmer_name VARCHAR(100),
    region VARCHAR(100),
    contact_info VARCHAR(255));

select * from Farmers;

CREATE TABLE Predictions (
    prediction_id INT PRIMARY KEY,
    model_id INT,
    crop_id INT,
    prediction_result VARCHAR(100),
    confidence_score FLOAT,
    timestamp1 DATE,
	timestamp2 TIME,
    FOREIGN KEY (model_id) REFERENCES PredictionModels(model_id),
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id));

select * from Predictions;

CREATE TABLE ManagementHistory (
    management_id INT PRIMARY KEY,
    farmer_id INT,
    crop_id INT,
    disease_id INT,
    intervention_id INT,
    date_of_intervention DATE,
    outcome VARCHAR(100),
    FOREIGN KEY (farmer_id) REFERENCES Farmers(farmer_id),
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id),
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id),
    FOREIGN KEY (intervention_id) REFERENCES Interventions(intervention_id));

select * from ManagementHistory;