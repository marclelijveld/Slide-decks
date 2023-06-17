--Generate datetime in the past, with value as days ago since today
INSERT INTO dbo.Timestamps (Timestamp)
VALUES (convert(varchar, DATEADD(day, -69, getdate()), 120))

--Generate datetime for today
INSERT INTO dbo.Timestamps (Timestamp)
VALUES (convert(varchar, getdate(), 120))