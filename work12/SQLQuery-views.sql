drop view if exists dbo.highmarkers

-- Показать в представлении студентов, сдававших сессии на «Отлично». Вывести
-- Ф.И.О., номер группы и семестр. Группировать по семестрам и группам. 
go
create view highmarkers as
	select t.Фамилия, t.Имя, t.Отчество, t.КодГруппы, t.Семестр
	from (
		select s.Фамилия, s.Имя, S.Отчество, s.КодГруппы, d.Семестр, AVG(e.Оценка) avgMark
		from Изучение as e
			join Дисциплины as d 
				on e.КодДисциплины = d.ID
			join Студенты as s 
				on e.НомерЗачетнойКнижкиСтудента = s.НомерЗачетнойКнижки
		  group by s.Фамилия, s.Имя, s.Отчество, s.КодГруппы, d.Семестр) as t
	where t.avgMark = 3
	group by t.Фамилия, t.Имя, t.Отчество, t.КодГруппы, t.Семестр;
go
select * from highmarkers;