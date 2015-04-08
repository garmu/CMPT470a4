int main()
{
   int mark;
   char pass;
   scanf("%d",&mark);
   if (mark > 40)
   {
      pass = 'y';
      printf("You passed");
	  if(mark > 80) printf("Amazing!");
   }
   else
   {
      pass = 'n';
      printf("You failed");
	  if(mark < 0) printf("... how is that even possible???");
   }
   return 0;
}
