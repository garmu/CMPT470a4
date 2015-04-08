int test()
{
   int i,times, a;
   scanf("%d",&times);
   i = 20;
   do
   {
      i--;
      printf("%d\n",i);
      if(i <= 10)
         a = 5;
   }
   while (i <= times);
   return 0;
}
