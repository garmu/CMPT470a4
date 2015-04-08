int checkpass()
{
			int mark;
		char fail;
   scanf("%d",&mark);
				if (mark > 50){
					fail = 'n';
					printf("Woo!");
				}
      
   else{
	   fail = 'y';
	   printf("OOOPPPS");
   }
      
   return 0;
}
