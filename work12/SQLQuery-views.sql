drop view if exists dbo.highmarkers

-- �������� � ������������� ���������, ��������� ������ �� ��������. �������
-- �.�.�., ����� ������ � �������. ������������ �� ��������� � �������. 
go
create view highmarkers as
	select t.�������, t.���, t.��������, t.���������, t.�������
	from (
		select s.�������, s.���, S.��������, s.���������, d.�������, AVG(e.������) avgMark
		from �������� as e
			join ���������� as d 
				on e.������������� = d.ID
			join �������� as s 
				on e.��������������������������� = s.�������������������
		  group by s.�������, s.���, s.��������, s.���������, d.�������) as t
	where t.avgMark = 3
	group by t.�������, t.���, t.��������, t.���������, t.�������;
go
select * from highmarkers;