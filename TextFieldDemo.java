//textfield
import java.io.*;
import java.awt.*;
import java.awt.event.*;
class CTF extends Frame implements ActionListener{
    Button b1,b2;
    TextField t1,t2;
    public CTF()
    {
        super("text field..");
        t1=new TextField(10);
        t2=new TextField(10);
        b1=new Button("move");
        b2=new Button("exit");
        setLayout(new FlowLayout());
        setSize(600,600);
        setVisible(true);
        add(b1);
        add(b2);
        add(t1);
        add(t2);
        b1.addActionListener(this);
        b2.addActionListener(this);

        
    }
    public void actionPerformed(ActionEvent ae)
    {
        if(ae.getSource()==b1)
        {
            String str=t1.getText();
            t1.setText("");
            t2.setText(str);

        }
        else
        System.exit(0);
    }
    
}
class TextFieldDemo
{
    public static void main(String args[])
    {
        CTF obj=new CTF();
        

    }
}
