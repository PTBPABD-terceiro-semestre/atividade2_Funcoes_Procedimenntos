create procedure dbo.salaryHistogram @intervaloN int
as
begin
  declare @salarioMin numeric(10,2);
  declare @salarioMax numeric(10,2);
  declare @tamIntervalo numeric(10,2);

  select @salarioMin = min(salary) from instructor;
  select @salarioMax = max(salary) from instructor;
  set @tamIntervalo = (@salarioMax-@salarioMin)/@intervaloN;

  create table #Histograma(
    valorMinimo numeric(10,2),
    valorMaximo numeric(10,2),
    total int
  );

declare @i int;
while @i < @intervaloN
begin
  declare valorMin numeric(10,2) = @salarioMin + (@i * tamIntervalo);
  declare valorMax numeric(10,2) = @salarioMax + (@i * tamIntervalo);
  
end;
