select s1.Name as Name1, s2.Name as Name2 from Student s1, Student s2 
where s1.Address = s2.Address and s1.Id <> s2.Id
order by s1.Tuoi 
