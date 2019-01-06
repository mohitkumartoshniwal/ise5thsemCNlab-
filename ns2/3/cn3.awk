BEGIN {
stcp=0;
sudp=0;
rtcp=0;
rudp=0;
dt=0;
du=0;
}
{
pkt=$5;
event=$1;
if(pkt=="cbr") { sudp++;}
if(pkt=="tcp") { stcp++;}
if(pkt=="cbr" && event=="r"){rudp++;}
if(pkt=="tcp" && event=="r"){rtcp++;}
if(pkt=="cbr" && event=="d"){du++;}
if(pkt=="tcp" && event=="d"){dt++;}
}
END {
printf("No of packets sent\nTcp : %d\nUdp : %d\n",stcp,sudp);
printf("No of packets received\nTcp : %d\nUdp : %d\n",rtcp,rudp);
printf("No of packets dropped\nTcp : %d\nUdp : %d\n",dt,du);
}


