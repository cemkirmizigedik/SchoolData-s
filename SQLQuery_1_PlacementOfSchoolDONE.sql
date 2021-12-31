--Cleansed Dataset
SELECT p.sl_no AS Placement
	--,[gender]
	,CASE p.gender
		WHEN 'F'
			THEN 'Female'
		WHEN 'M'
			THEN 'Male'
		END AS Gender
	,(p.ssc_p / 100) AS SecendorySchoolPercentage
	,p.ssc_b AS BoardOfEducation
	,(p.hsc_p / 100) AS HigherSchoolPercentage
	,p.hsc_b AS HigherBoardOfEducation
	,p.hsc_s AS SHigherSecEducation
	,(p.degree_p / 100) AS DegreePercentage
	,p.degree_t AS DegreeType
	,p.workex AS WorkExperiment
	--,[etest_p]
	,LEFT(p.specialisation, CHARINDEX('t', specialisation, 1)) AS [First Specialisation]
	-- ,RIGHT(specialisation,CHARINDEX('&',REVERSE(specialisation))) as [Second Specialisation]
	,CASE p.specialisation
		WHEN 'Mkt&HR'
			THEN 'HR'
		WHEN 'Mkt&Fin'
			THEN 'Fin'
		END AS [Second Specialisation]
	,p.specialisation
	--,a.mba_p  AS MasterDegreePercentage
	,LEFT(p.mba_p, 2) AS MDPercent
	,p.STATUS
	,p.salary
FROM [AfterSchoolPlacement].[dbo].[Placement_Data_Full_Class] AS p
	--where a.status like 'Pl%'
