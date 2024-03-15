import java.io.DataInputStream;
class SumOfTwo{
public static void main(String args[])
{
 try{
     DataInputStream in=new DataInputStream(System.in);
System.out.println("enter 1st no:");
int a=Integer.parseInt(in.readLine());
System.out.println("enter 2nd no:");
int b=Integer.parseInt(in.readLine());
System.out.println("sum="+(a+b));
}catch(Exception e){}
}
}
