CREATE VIEW highmarkers as
	select TOP (select count(*) from Изучение where Оценка = 5) s.Фамилия + ' ' + s.Имя + ' ' + s.Отчество as N'ФИО', s.КодГруппы as N'Номер группы', d.Семестр, d.Название from Студенты as s
		join Изучение as e
			on e.НомерЗачетнойКнижкиСтудента = s.НомерЗачетнойКнижки
		join Дисциплины as d
			on d.ID = e.КодДисциплины
		where e.Оценка like 5
		order by d.Семестр, s.КодГруппы