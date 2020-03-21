SELECT AmbID, Count(Category) FROM Ambulance NATURAL JOIN Calls WHERE Ambulance.AmbID=Calls.Ambulance_AmbID and Calls.Category="Emergent"  GROUP BY AmbID Order BY AmbID ASC;
+-------+----------+
| AmbID | Category |
+-------+----------+
|  1000 |        1 |
|  1010 |        1 |
|  1040 |        1 |
|  1050 |        1 |
|  1060 |        2 |
|  1070 |        3 |
|  1080 |        3 |
|  1090 |        1 |
|  1100 |        3 |
|  1110 |        2 |
|  1120 |        3 |
|  1140 |        1 |
+-------+----------+




SELECT AmbID, GROUP_CONCAT(FName,' ',LName,) AS Patient Name from Ambulance NATURAL JOIN Calls NATURAL JOIN Patient where Ambulance.AmbID=Calls.Ambulance_AmbID AND Calls.CallNum=Patient.Calls_CallNum GROUP BY AmbID Order By AmbID;
+-------+----------------------------------------------------------+
| AmbID | Name                                                     |
+-------+----------------------------------------------------------+
|  1000 | Mark James                                               |
|  1010 | Shantal Brown,Nicole Walrus                              |
|  1020 | Taneka Brown,Richard Hutton                              |
|  1030 | Shelly Lyon                                              |
|  1040 | George Clay,Sarah Reynolds                               |
|  1050 | Lavorsker Green,Johnathan Hall                           |
|  1060 | Jefferey Mabus,Jocelyn Lemus,Quintavis Burley,Troy Heath |
|  1070 | Howard Stern,Erik Talgot,Stallisha Williams,Drew Vaughn  |
|  1080 | Jarvis Pettis,Gary Stallings,Chandler Riggs              |
|  1090 | Crystal Benson                                           |
|  1100 | Fred Floyd,Ashley Mortimer,Leon Nelson                   |
|  1110 | Betsy Davis,Quintaysha Wright                            |
|  1120 | Minnie Braswell,Jamar Carrothers,Bill Ramsey             |
|  1130 | Dennis Braswell,Jillian Sartain,Ruth Bayer               |
|  1140 | Robert Robertson,Collin McLemore                         |
+-------+----------------------------------------------------------+
