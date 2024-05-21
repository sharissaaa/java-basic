//mouse events
import java.awt.*;
import java.awt.event.*;

class MouseDemo extends Frame implements MouseListener, MouseMotionListener {
    String msg="";
    int mousex, mousey;
    
    MouseDemo() {
        addMouseListener(this);
        addMouseMotionListener(this);
        setSize(300, 300);
        setVisible(true);
    }

    public void mouseClicked(MouseEvent me) {
        mousex = me.getX();
        mousey = me.getY();
        msg = "Mouse clicked";
        repaint();
    }

    public void mouseMoved(MouseEvent me) {
        showStatus("Mouse moving status at " + me.getX() + ", " + me.getY());
    }

    
    public void mousePressed(MouseEvent me) {}
    public void mouseReleased(MouseEvent me) {}
    public void mouseEntered(MouseEvent me) {}
    public void mouseExited(MouseEvent me) {}

    
    public void mouseDragged(MouseEvent me) {}

    public void paint(Graphics g) {
        g.drawString(msg, mousex, mousey);
    }

    public static void main(String[] args) {
        new MouseDemo();
    }
}
