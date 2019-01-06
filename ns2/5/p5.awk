BEGIN {
ur=0;
ud=0;
tr=0;
td=0;
}
{
ev=$1;
pt=$5;
if(ev=="r" && pt=="tcp")
tr++;
if(ev=="d" && pt=="tcp")
td++;
if(ev=="r" && pt=="cbr")
ur++;
if(ev=="d" && pt=="cbr")
ud++;
}
END {
printf("no of packet rec from tcp : %d",tr);
printf("no of paceket drop from tcp : %d",td);
printf("no of pack rec from cbr : %d",ur);
printf("no of pack drop freom cbr : %d",ud);
}
