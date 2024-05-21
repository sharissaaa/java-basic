import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

class JDemo extends JFrame implements ActionListener {
    JButton b1, b2;
    JTextArea textArea;

    public JDemo() {
        b1 = new JButton("ok");
        b2 = new JButton("exit");
        textArea = new JTextArea(10, 40); // Create JTextArea with rows and columns

        setSize(600, 600);
        setVisible(true);
        Container c = this.getContentPane();
        c.setLayout(new FlowLayout());
        c.add(b1);
        c.add(b2);
        c.add(new JScrollPane(textArea)); // Wrap the JTextArea in a JScrollPane and add it to the content pane
        b1.addActionListener(this);
        b2.addActionListener(this);
    }

    public void actionPerformed(ActionEvent ae) {
        if (ae.getSource() == b1)
            System.out.println("ok");
        else
            System.exit(0);
    }
}

class JButtonTextArea {
    public static void main(String args[]) {
        JDemo obj = new JDemo();
    }
}
