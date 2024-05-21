import java.io.*;
import javax.swing.*;
import java.awt.event.*;
public class JDemo extends JFrame 
{
    JButton b1,b2;
    public JDemo()
    {
        b1.new JButton("ok");
        b2.new JButton("exit");
        add(b1);
        add(b2);
        setSize(600,600);
        setVisible(true);
        setLayout(new FlowLayout());
        b1.addActionListener(this);
        b2.addActionListener(this);

    }
    public void actionPerformed(ActionEvent ae)
    {
        if(ae.getSource()=b1)
        system.out.println("ok");
        else
        System.exit(0);
    }
}
class JButtonDemo
{
    public static void main(String args[])
    {
        JDemo obj=new JDemo();
    }
}