package com.huyc.learn.ui.activity;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.apple.learn.R;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private ListView lv;
    private BaseAdapter adapter;//要实现的类
    private List<String> userList = new ArrayList<String>();//实体类
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        lv = (ListView)findViewById(R.id.listView1);

        userList.add("软件测试");
        userList.add("服务器开发");
        userList.add("Android");
        userList.add("iOS");
        userList.add("Web前端");

        adapter = new BaseAdapter() {
            @Override
            public int getCount() {
                // TODO Auto-generated method stub
                return userList.size();//数目
            }

            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                LayoutInflater inflater = MainActivity.this.getLayoutInflater();
                View view;

                if (convertView==null) {
                    //因为getView()返回的对象，adapter会自动赋给ListView
                    view = inflater.inflate(R.layout.item, null);
                }else{
                    view=convertView;
                    Log.i("info","有缓存，不需要重新生成"+position);
                }
                TextView tv1 = (TextView) view.findViewById(R.id.Textviewname);//找到Textviewname
                tv1.setText(userList.get(position));//设置参数
                return view;
            }
            @Override
            public long getItemId(int position) {//取在列表中与指定索引对应的行id
                return 0;
            }
            @Override
            public Object getItem(int position) {//获取数据集中与指定索引对应的数据项
                return null;
            }
        };
        lv.setAdapter(adapter);

        //获取当前ListView点击的行数，并且得到该数据
        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                TextView tv1 = (TextView) view.findViewById(R.id.Textviewname);//找到Textviewname
                String str = tv1.getText().toString();//得到数据
                Toast.makeText(MainActivity.this, "" + str, Toast.LENGTH_SHORT).show();//显示数据


//                Intent it = new Intent(MainActivity.this, list0.class); //
//                Bundle b = new Bundle();
//                b.putString("we",str);  //string
//                // b.putSerializable("dd",str);
//                // it.putExtra("str_1",str);
//                it.putExtras(b);
//                startActivity(it);


            }
        });
    }
}
