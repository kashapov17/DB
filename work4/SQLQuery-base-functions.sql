﻿use [Торговая компания];

begin transaction
	-- Вывести количество сделок, зафиксированных в БД.
		select count(*) as N'Число сделок' 
			from [Сделка];
	go
	-- Определить среднее арифметическое значение количества товаров на складе.
		select avg([Количество]) as N'Среднее количество товаров на складе' 
			from [Склад];
	go
	-- Определить общее количество товаров на складе.
		select sum([Количество]) as N'Общее количество товаров на складе' 
			from [Склад];
	go
	-- Определить максимальное количество товаров на складе.
		select max([Количество]) as N'Максимальное количество одного товара на складе' 
			from [Склад];
	go
	-- Вывести значение косинуса для угла 60º.
		select sin(PI()/3) as N'Синус 60 градусов';
	go
	-- Получить целое случайное число в диапазоне [-7; 2].
		select (rand()*9-7) as N'Случайное значение на отрезке [-7, 2]';
		-- случайное целое в этом же диапазоне	
		select ((abs(checksum(newid())) % 10)-7) as N'Случайное целое значение на отрезке [-7, 2]';
	go
	-- Определить (вывести в виде числа от 1 до 7) текущий день недели.
		select datepart(dw, getdate()) as N'Номер дня недели';
commit transaction