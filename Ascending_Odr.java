import java.io.*;
class Ascending_Odr
{
	public static void main(String args[])
	{
		DataInputStream din=new DataInputStream(System.in);
    int[] array;
        int size;

    try{
        System.out.println("enter the size of the array");
        size =Integer.parseInt(din.readLine());
 array=new int[size];
        System.out.println("enter the array elements");
        for(int i=0;i<size;i++)
        {
            array[i]=Integer.parseInt(din.readLine());
        }
        System.out.println("entered array is:");
        for(int i=0;i<size;i++)
        {
            System.out.println(array[i]);
        }
        int temp;
        for(int i=0;i<size;i++)
        {
            for(int j=i+1;j<size;j++)
            {
                    if(array[j]<array[i])
                    {
                        temp=array[j];
                        array[j]=array[i];
                        array[i]=temp;
                    }
            }
        }
        System.out.println("sorted array is:");
        for(int i=0;i<size;i++)
        {
            System.out.println(array[i]);
        }

    }catch(IOException e)
    {
        System.out.println("error");
    }
    }
}        

