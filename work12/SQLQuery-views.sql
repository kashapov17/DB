CREATE VIEW highmarkers as
	select TOP (select count(*) from �������� where ������ = 5) s.������� + ' ' + s.��� + ' ' + s.�������� as N'���', s.��������� as N'����� ������', d.�������, d.�������� from �������� as s
		join �������� as e
			on e.��������������������������� = s.�������������������
		join ���������� as d
			on d.ID = e.�������������
		where e.������ like 5
		order by d.�������, s.���������