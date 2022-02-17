USE Formula1
GO

--Driver'larý ve Takimlarini Gösterme
SELECT D.Name, D.Surname, D.Nationality, C.ConstructorName	
FROM Driver D INNER JOIN Constructor C
ON C.ConstructorID = D.ConstructorID
ORDER BY C.ConstructorID DESC

--Takimlarin Sponsorlarini ve Sponsorluk Ücretlerini Gösterme
SELECT C.ConstructorName, S.SponsorName, S.Category, CS.[SponsorshipFee($M/perYear)]
FROM Constructor C INNER JOIN ConstructorsSponsor CS
ON C.ConstructorID = CS.ConstructorID
INNER JOIN Sponsor S
ON S.SponsorID = CS.SponsorID
ORDER BY C.ConstructorID

--Safety Car olan yarislari gösterme
SELECT R.RaceID, CR.Name, LC.Country, R.SafetyCar
FROM Race R INNER JOIN Circuit CR 
ON R.CircuitID = CR.CircuitID
INNER JOIN Location LC
ON LC.LocationID = CR.LocationID
WHERE R.SafetyCar = 'True'

--Driver Points
SELECT D.Name, D.Surname, SUM(RS.Point) AS Points
FROM Driver D INNER JOIN Result RS 
ON D.DriverID = RS.DriverID
GROUP BY D.DriverID, D.Name, D.Surname
ORDER BY Points DESC

--Maasi $12M fazla olan Driver'lar
SELECT *
FROM Driver 
WHERE [Salary($Million)]>12