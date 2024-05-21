//Jbutton
import java.io.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
class JDemo extends JFrame implements ActionListener
{
    JButton b1,b2;
    public JDemo()
    {
        b1=new JButton("ok");
        b2=new JButton("exit");
       
        setSize(600,600);
        
        setVisible(true);
        Container c=this.getContentPane();
        c.setLayout(new FlowLayout());
        c.add(b1);
        c.add(b2);
        b1.addActionListener(this);
        b2.addActionListener(this);

    }
    public void actionPerformed(ActionEvent ae)
    {
        if(ae.getSource()==b1)
        System.out.println("ok");
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