#include<stdio.h>
void dij(int c[20][20],int n,int s)
{
int nn,ne,vis[20],d[20],i,j,p[20],min=999;
for(i=1;i<=n;i++)
{
vis[i]=0;
d[i]=c[s][i];
p[i]=s;
}
d[s]=0;
vis[s]=1;
ne=1;
while(ne<n)
{
for(i=1,min=999;i<=n;i++)
if(d[i]<min&&!vis[i])
{
min=d[i];
nn=i;
}
vis[nn]=1;
for(i=1;i<=n;i++)
if(!vis[i])
if(c[nn][i]+min<d[i])
{
d[i]=c[nn][i]+min;
p[i]=nn;
}
ne++;
}
for(i=1;i<=n;i++)
if(i!=s)
{
printf("\negde from %d is %d",i,d[i]);
printf("\npath is %d",i);
j=i;
do
{
j=p[j];
printf("-->%d",j);
}
while(j!=s);
}
}
void main()
{
int i,j,s,c[20][20],n;
printf("\nenter the no of nodes");
scanf("%d",&n);
printf("\nenter the adj matrix:\n");
for(i=1;i<=n;i++)
for(j=1;j<=n;j++)
{
scanf("%d",&c[i][j]);
if(c[i][j]==0)
c[i][j]=999;
}
printf("\nenter the source node:");
scanf("%d",&s);
dij(c,n,s);
}
