-- SQLite
-- 1. Tools table
CREATE TABLE Tools (
    Tool_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Tool_Name TEXT NOT NULL,
    Primary_Function TEXT
);

INSERT INTO Tools (Tool_Name, Primary_Function)
VALUES 
('MetaWorks', 'Multi-marker biodiversity assessment'),
('Cutadapt', 'Pre-processing (Adapter & Primer trimming)'),
('DADA2', 'Denoising (ASV generation) & Error modeling'),
('VSEARCH', 'Clustering, Merging, & Chimera detection'),
('BLAST', 'Taxonomic Alignment'),
('Vegan (R)', 'Ecological Statistics');

-- 2. Papers table
CREATE TABLE Papers (
    Paper_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Citation TEXT NOT NULL
);

INSERT INTO Papers (Citation)
VALUES 
('Petit-Marty et al.'),
('Ariza et al. (2022)'),
('Macher et al. (2023)'),
('dos Santos & Blabolil (2025)');

-- 3. Pipelines table (MISSING in your version)
CREATE TABLE Pipelines (
    Pipeline_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Pipeline_Name TEXT NOT NULL
);

INSERT INTO Pipelines (Pipeline_Name)
VALUES 
('QIIME 2'),
('OBITools'),
('MiFish');

-- 4. Markers table (MISSING in your version)
CREATE TABLE Markers (
    Marker_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Marker_Name TEXT NOT NULL,
    Target_Taxa TEXT
);

INSERT INTO Markers (Marker_Name, Target_Taxa)
VALUES 
('COI', 'Animals'),
('12S', 'Fish'),
('trnL', 'Plants');

-- 5. Junction table
CREATE TABLE Pipeline_Markers (
    Pipeline_ID INTEGER,
    Marker_ID INTEGER,
    FOREIGN KEY(Pipeline_ID) REFERENCES Pipelines(Pipeline_ID),
    FOREIGN KEY(Marker_ID) REFERENCES Markers(Marker_ID)
);

-- 6. Relationships (NOW these IDs actually exist)
INSERT INTO Pipeline_Markers (Pipeline_ID, Marker_ID) VALUES (2, 3); -- OBITools - trnL
INSERT INTO Pipeline_Markers (Pipeline_ID, Marker_ID) VALUES (3, 2); -- MiFish - 12S
INSERT INTO Pipeline_Markers (Pipeline_ID, Marker_ID) VALUES (1, 1); -- QIIME 2 - COI

-- 7. Query
SELECT 
    Pipelines.Pipeline_Name, 
    Markers.Marker_Name, 
    Markers.Target_Taxa
FROM Pipeline_Markers
JOIN Pipelines ON Pipeline_Markers.Pipeline_ID = Pipelines.Pipeline_ID
JOIN Markers ON Pipeline_Markers.Marker_ID = Markers.Marker_ID;

