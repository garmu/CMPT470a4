int main()
{
   char car;
   printf("Which one is your favourite car:\n");
   printf("a) Ford\n");
   printf("b) Chev\n");
   printf("c) Tesla\n");
   scanf("%c",&fruit);
   switch (fruit)
   {
      case 'a':
         printf("You like Ford\n");
         break;
      case 'b':
         printf("You like Chev\n");
         break;
      case 'c':
         printf("You like Telsa\n");
         if(tesla >= 0 || ford < 1)
            printf("Go buy one!\n");
         break;
      default:
         printf("You entered an invalid choice\n");
   }
   return 0;
}
