// count neighbours that are 'on'
var count = 0;

for (var i =7; i > -1; i -= 1)
{
	if (buur[i].life_death = 1)
	{
		count += 1;
	}
}
return count;