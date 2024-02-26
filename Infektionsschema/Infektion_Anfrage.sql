select *
from Person ungetesteter
where not exists(select *
				 from Virentest testliste 
				 where ungetesteter.PersonId = testliste.PersonID) --erste Bedingung: Person X noch nich getestet
				 
and not exists (select  * 
				from MitgliedIn zugehörige
				where zugehörige.PersonID = ungetesteter.personID
				and exists (select *
							  from Virentest testliste, MitgliedIn anderesMitglied
							  where anderesMitglied.PersonID = testliste.PersonID --Testinformationen des anderen Mitglieds
							  and anderesMitglied.GruppeID = zugehörige.GruppeID --Gruppe des anderen Mitglieds = Gruppe von Person X
							  and testliste.Testergebnis = 'positiv')) --Prädikat wird verneint: Es existiert ein positiv getester
							 											 --und wir fordern, dass es ihn nicht in der sozialen Gruppe gibt.
								

	  
