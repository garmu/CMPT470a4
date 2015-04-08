int main()
{
   int i,times,a;
   scanf("%d",&times);
   i = 20;
   while (i > times)
   {
      i--;
      printf("%d\n",i);
      for(a = 0; a < i; i++)
      	printf("%d\n", i);
   }
   return 0;
}
