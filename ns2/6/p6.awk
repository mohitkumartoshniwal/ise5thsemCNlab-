BEGIN{
tp=0;
ts=0;
up=0;
us=0;
}
{
ev=$1;
p=$5;
s=$6;
if(ev=="r")
{
if(p=="tcp")
{
tp++;
ts=s;
}
if(p=="cbr")
{
up++;
us=s;
}
}
}
END{
totp=tp*ts;
totu=up*us;
printf("throughput of tcp is : %d\n",totp/123.0);
printf("throughput of cbr is : %d\n",totu/124.0);
}