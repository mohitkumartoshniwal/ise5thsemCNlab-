BEGIN {
dc=0;
}
{
ev=$1;
if (ev=="d")
dc++;
}
END{
printf("total no of packets dropped due to traffic is : %d",dc);
}
