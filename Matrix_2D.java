//row wise sum and column wise sume of a maytrix
import java.io.*;
class Matrix_2D
{
    public static void main(String args[])
    {
        DataInputStream din=new DataInputStream(System.in);
        int[][] array;
        int m,n,i,j;
       try
        {
        System.out.println("enter the no of rows");
        m=Integer.parseInt(din.readLine());
        System.out.println("enter the no of columns");
        n=Integer.parseInt(din.readLine());
        System.out.println("enter the element of matrix");
        array=new int[m][n];
        for(i=0;i<m;i++)
        {
            for(j=0;j<n;j++)
            {
                array[i][j]=Integer.parseInt(din.readLine());
            }
        }
        for(i=0;i<m;i++)
        {
            for(j=0;j<n;j++)
            {
                System.out.print(array[i][j]+" ");
            }
System.out.println();
        }
System.out.println("row wise sum:");
for(i=0;i<m;i++)
        {
            int rowsum=0;
            for(j=0;j<n;j++)
            {
                rowsum+=array[i][j];
            }
            System.out.println("row"+(i+1)+"="+rowsum);

        }
        System.out.println("column wise sum:");
        for(j=0;j<m;j++)
                {
                    int colsum=0;
                    for(i=0;i<n;i++)
                    {
                        colsum+=array[i][j];
                    }
                    System.out.println("col"+(i+1)+"="+colsum);
        
                }        
    }catch(IOException e)
    {

    }
}
}
