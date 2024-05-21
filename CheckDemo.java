//checkbox
import java.io.*;
import java.awt.*;
import java.awt.event.*;
class checkbox extends Frame implements ActionListener
{
    Checkbox c1,c2;
    Button b1;
    public checkbox()
    {
        c1=new Checkbox("M");
        c2=new Checkbox("F");
        b1=new Button("exit");
        add(c1);
        add(c2);
        add(b1);
        setSize(600,600);
        setLayout(new FlowLayout());
        setVisible(true);
        b1.addActionListener(this);
    }
    public void actionPerformed(ActionEvent ae)
    {
        if(ae.getSource()==b1)
        System.exit(0);
    }
}
class CheckDemo
{
    public static void main(String args[])
    {
        checkbox obj=new checkbox();

    }
}
