﻿use [Торговая компания];	

begin transaction
	-- Сортировать поставщиков в алфавитном (обратном) порядке.
		select [Наименование] as N'Сортировка в обратном алфавитном порядке' 
			from [Поставщик] 
			order by [Наименование] desc
	go
	-- Вывести поставщика(ов) с самым длинным названием.
		select top 1 [Наименование] as N'Самое длинное наименование поставщика' 
			from [Поставщик] 
			order by len([Наименование]) desc
	go
	-- Вывести всех покупателей с фамилией, начинающейся на букву «В».
		select [Имя],[Фамилия],[Отчество] 
			from [Клиент] 
			where [Фамилия] Like N'В%';
		-- на букву «М»
		select [Имя],[Фамилия],[Отчество] 
			from [Клиент] 
			where [Фамилия] Like N'М%';
	go
	-- Вывести всех покупателей с фамилией, начинающейся с букв в диапазоне от "В" до "К", где вторая буква «о» ->
		select [Имя],[Фамилия],[Отчество] 
			from [Клиент] 
			where [Фамилия] like N'_о%' and [Фамилия] between N'В%' and N'К%';
	go
	-- Определите количество сделок за текущий календарный месяц.
		-- за текущий месяц
		select count(*) as N'Количество сделок за текущий месяц' 
			from [Сделка] 
			where month([Дата])=month(getdate());
		-- за февраль
		select count(*) as N'Количество сделок за февраль' 
			from [Сделка] 
			where month([Дата])=month('2021-02-03');
	go
	-- Определите количество сделок, зафиксированных в заданные дни недели (например, по вторникам и средам).
		declare @day1 as nvarchar(10) = datename(dw,'2021-03-01'); -- понедельник
		declare @day2 as nvarchar(10) = datename(dw, getdate());
		select count(*) as N'Количество сделок, которые были в понедельник и в день текущей недели' 
			from [Сделка] 
			where datename(dw, [Дата]) = @day1 or datename(dw, [Дата]) = @day2;
commit transaction
