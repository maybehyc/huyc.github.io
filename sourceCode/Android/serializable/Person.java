package serializable;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by apple on 2018/4/2.
 */

public class Person implements Parcelable {
    private int id;
    private String name;
    private String sex;

    public Person() {

    }

    //从parcel中读取数据
    public Person(Parcel source) {
        id = source.readInt();
        name = source.readString();
        sex = source.readString();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    //将数据写入实例化parcel对象
    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(id);
        dest.writeString(name);
        dest.writeString(sex);
    }

    //这个方法用于创建位掩码通常直接返回0
    @Override
    public int describeContents() {
        return 0;
    }


    public static final Parcelable.Creator<Person> CREATOR = new Creator<Person>() {

        @Override
        public Person createFromParcel(Parcel source) {
            // TODO Auto-generated method stub
            return new Person(source);
        }

        @Override
        public Person[] newArray(int size) {
            // TODO Auto-generated method stub
            return new Person[size];
        }
    };
}

public interface Parcelable

{

    //内容描述接口，基本不用管

    public int describeContents();

    //写入接口函数，打包

    public void writeToParcel(Parcel dest, int flags);

    //读取接口，目的是要从Parcel中构造一个实现了Parcelable的类的实例处理。因为实现类在这里还是不可知的，所以需要用到模板的方式，继承类名通过模板参数传入

    //为了能够实现模板参数的传入，这里定义Creator嵌入接口,内含两个接口函数分别返回单个和多个继承类实例

    public interface Creator<T>

    {

        public T createFromParcel(Parcel source);

        public T[] newArray(int size);

    }

}