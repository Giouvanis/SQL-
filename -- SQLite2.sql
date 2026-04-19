-- SQLite
-- 1. Create the detailed Table 1 for Genetic Markers
CREATE TABLE Genetic_Markers (
    Marker_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Marker TEXT NOT NULL,
    Associated_Databases TEXT,
    Notes TEXT,
    Referenced_Papers TEXT
);

-- 2. Insert the exact data from your thesis into the table
INSERT INTO Genetic_Markers (Marker, Associated_Databases, Notes, Referenced_Papers)
VALUES 
('COI', 'BOLD / GenBank', 'Standard barcode for metazoan identification; high species-level resolution in animals.', 'Ershova E.A. et al. (2023); Macher T.-H. et al. (2023); Petit-Marty N. et al. (2023)'),
('12S', 'BOLD / GenBank / Fish mitochondrial reference libraries', 'Commonly used for vertebrate and fish detection; short amplicons suitable for degraded eDNA.', 'Mena S. et al. (2024); dos Santos R.A. (2025)'),
('16S', 'SILVA / GenBank / MIDORI', 'Primarily used for prokaryotes; also applied to specific vertebrate groups.', 'Lynggaard C. et al. (2022); Svenningsen A.K.N. et al. (2022)'),
('18S', 'SILVA / PR2', 'Curated databases for eukaryotic microbes and protists; broad taxonomic coverage.', 'Shen Y. et al. (2024); Qiu C. et al. (2023)'),
('28S', 'SILVA / GenBank', 'Large subunit rRNA marker for eukaryotic identification; higher phylogenetic resolution than 18S in some taxa.', 'Petit-Marty N. et al. (2023); Shen Y. et al. (2024)'),
('ITS', 'UNITE / GenBank', 'Primary barcode for fungal identification; high interspecific variability.', 'Bollmann-Giolai A. et al. (2022); Metris A. et al. (2023)'),
('trnL', 'Plant reference libraries / BOLD / GenBank', 'Widely used chloroplast marker for plant DNA; short fragments suitable for degraded samples.', 'Ariza M. et al. (2022); Leontidou K. et al. (2024)');

-- 3. Run a quick query to see your beautiful new table!
SELECT * FROM Genetic_Markers;

-- ==========================================
-- CREATE & POPULATE TABLE 2: BIOINFORMATICS TOOLS
-- ==========================================

CREATE TABLE Bioinformatics_Tools (
    Tool_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Tool_Algorithm TEXT NOT NULL,
    Primary_Function TEXT,
    Markers_Used_With TEXT,
    Referenced_Papers TEXT
);

INSERT INTO Bioinformatics_Tools (Tool_Algorithm, Primary_Function, Markers_Used_With, Referenced_Papers)
VALUES 
('MetaWorks', 'Multi-marker biodiversity assessment', '12S, 16S, 18S, 28S, ITS, COI, rbcL', 'Petit-Marty, Porter'),
('Cutadapt', 'Pre-processing (Adapter & Primer trimming)', 'All', 'Macher, Kirse, Bista, Clark'),
('DADA2', 'Denoising (ASV generation) & Error modeling', '12S, 16S, 18S, COI, ITS', 'Ariza, Callahan, Petit-Marty'),
('VSEARCH', 'Clustering, Merging, & Chimera detection', '12S, 16S, 18S, COI, ITS', 'Petit-Marty, Rognes, Macher'),
('BLAST', 'Taxonomic Alignment (Matching reads to databases)', '12S, 16S, 18S, COI, ITS', 'Maggio, Thomas, Sigsgaard'),
('Vegan (R)', 'Ecological Statistics (Alpha/Beta Diversity, NMDS, PERMANOVA)', '12S, 18S', 'Svenningsen et al., Qiu et al.');

-- ==========================================
-- CREATE & POPULATE TABLE 3: PIPELINES/FRAMEWORKS
-- ==========================================

CREATE TABLE Bioinformatics_Pipelines (
    Pipeline_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Pipeline_Framework TEXT NOT NULL,
    Markers_Analyzed TEXT,
    Key_Observation TEXT,
    Referenced_Papers TEXT
);

INSERT INTO Bioinformatics_Pipelines (Pipeline_Framework, Markers_Analyzed, Key_Observation, Referenced_Papers)
VALUES 
('QIIME / QIIME 2', 'COI, 12S, 18S, trnL', 'The "generalist" platform used most frequently across all marker types. Highly modular and reproducible.', 'Boyen, Ariza, Petit-Marty, Callahan'),
('OBITools', '12S, 16S, ITS, COI, trnL', 'Shows a strong preference for plant (trnL) metabarcoding studies. Uses a stepwise, LCA-based assignment.', 'Boyer, Petit-Marty, Ariza'),
('Mothur', '12S, 16S, 18S', 'Classical, comprehensive pipeline historically used for OTU-based clustering; essential for legacy dataset compatibility.', 'Schloss, Petit-Marty'),
('USEARCH', '12S, 16S, 18S, COI, ITS', 'Powerful closed-source amplicon engine for clustering and chimera detection; often underpins other pipelines for speed.', 'Petit-Marty, Edgar, Bista, Osathanunkul'),
('MiFish / MitoFish', '12S', 'Specialized, validated workflow designed specifically for high-accuracy fish eDNA detection.', 'Miya, Macher 2023, dos Santos, Sigsgaard'),
('Anacapa Toolkit', '12S, COI, 16S, Cytb', 'Used in comparative studies for vertebrate detection; highly effective at generating custom reference libraries.', 'Curd, Petit-Marty, dos Santos');

-- ==========================================
-- RUN A QUICK CHECK TO SEE YOUR TABLES
-- ==========================================
SELECT * FROM Bioinformatics_Tools;
SELECT * FROM Bioinformatics_Pipelines;
