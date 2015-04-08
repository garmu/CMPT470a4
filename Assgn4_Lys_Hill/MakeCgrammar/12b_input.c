int newtest()
{
   int a,b;
   scanf("%d",&a);
   scanf("%d",&b);

   if (a > 0 && b > 0)
      printf("Both numbers are positive\n");
   if (a == 0 || b == 0)
      printf("At least one of the numbers = 0\n");
   if (!(a > 0) && !(b > 0))
      printf("Both numbers are negative\n");

  	if(fact > 0 && fact < 0) printf("Fact was true! \n");
   return 0;
}
