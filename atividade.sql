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

declare @i int = 0;
while @i < @intervaloN
begin
  declare @valorMin numeric(10,2);
  set @valorMin = @salarioMin + (@i * @tamIntervalo);
  declare @valorMax numeric(10,2);
  set @valorMax = @salarioMin + ((@i+1) * @tamIntervalo);

insert into #Histograma (valorMinimo, valorMaximo, total) select @valorMin, @valorMax, count(*) from instructor where salary >= @valorMin and salary < @valorMax;

set @i = @i + 1;
end

update #Histograma set total = total + (select count(*) from instructor where salary = @salarioMax) where valorMaximo = @salarioMax;

end
