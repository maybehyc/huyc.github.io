package serializable;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

/**
 * Created by apple on 2018/4/2.
 */

public class  Message implements Serializable
{
    private static final long serialVersionUID = 1L;

    private int uid;
    private int content;

    public void setUid(int width){
        this.uid  = width;
    }
    public void setContent(int height){
        this.content = height;
    }

    public static void main(String[] args){
        Message myBox = new Message();
        myBox.setUid(1);
        myBox.setContent(20);

        try{
            FileOutputStream fs = new FileOutputStream("message.txt");
            ObjectOutputStream os =  new ObjectOutputStream(fs);
            os.writeObject(myBox);
            os.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

}