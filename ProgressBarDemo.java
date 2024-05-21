//progressbar
import java.awt.*;
import javax.swing.*;
class ProgressBarDemo extends JFrame {
    JProgressBar jb; int i = 0, num = 0;
    public ProgressBarDemo() {
        jb = new JProgressBar(0, 2000);
        jb.setBounds(100, 40, 160, 10);//x axis,y axis last 2 are length and width of bar
        jb.setValue(0);
        jb.setStringPainted(true);
        add(jb);
        setSize(300, 100); // Adjusted size for better visibility
        setLayout(null);      
    }
    public void iterate() {
        while (i <= 2000) {
            jb.setValue(i);
            i=i+20;
            try {
                Thread.sleep(100);
            } catch (Exception e) {
                
            }
        }}public static void main(String args[]) {
        ProgressBarDemo obj = new ProgressBarDemo();
        obj.setVisible(true);
        obj.iterate();
    }
}
