package com.huyc.learn.ui.activity;

import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.TextView;

import com.huyc.learn.R;
import com.huyc.learn.annotation.ViewById;
import com.huyc.learn.annotation.ViewUtils;
import com.huyc.learn.biz.personcenter.IUserLoginView;
import com.huyc.learn.biz.personcenter.LoginPresenter;
import com.huyc.learn.constant.Event;
import com.huyc.learn.ui.base.BaseActivity;

public class LoginActivity extends BaseActivity implements IUserLoginView {

    /**
     * 用户名
     */
    @ViewById(R.id.et_phone)
    private EditText userName;

    /**
     * 用户密码
     */
    @ViewById(R.id.et_password)
    private EditText password;

    /**
     * 登录
     */
    @ViewById(R.id.tv_login)
    private TextView login;

    private LoginPresenter mUserLoginPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setContentView(R.layout.activity_login);
        ViewUtils.inject(this);
        super.onCreate(savedInstanceState);

        presenter = mUserLoginPresenter = new LoginPresenter();
        mUserLoginPresenter.attachView(this);

    }

    @Override
    public void initViews() {
//        userName = (EditText) findViewById(R.id.et_phone);
//        password = (EditText) findViewById(R.id.et_password);
//        login = (TextView) findViewById(R.id.tv_login);
    }

    @Override
    public void initListeners() {
        login.setOnClickListener(new OnClickListener() {

            @Override
            public void onClick(View v) {
                switch (v.getId()) {
                    case R.id.tv_login:
                        startActivity(MainActivity.class,null);
                        //13914786934   123456  可以登录
//                        mUserLoginPresenter.login(userName.getText().toString(), password.getText().toString());
                        break;
                }
            }

        });
    }

    @Override
    public void initData() {

    }

//    @Override
//    public void setHeader() {
//        super.setHeader();
//        title.setText("登录");
//    }

    @Override
    public void onEventMainThread(Event event) {
        super.onEventMainThread(event);
        switch (event){
            case IMAGE_LOADER_SUCCESS:
                clearEditContent();
                break;
        }
    }

    @Override
    public void clearEditContent() {
        userName.setText("");
        password.setText("");
    }

    @Override
    public void onError(String errorMsg, String code) {
        showToast(errorMsg);
    }

    @Override
    public void onSuccess() {
        startActivity(MainActivity.class,null);
    }

    @Override
    public void showLoading() {

    }

    @Override
    public void hideLoading() {

    }

    @Override
    public void onClick(View view) {

    }

//    @OnClick(R.id.tv)
//    public void onClick(View view) {
//        Toast.makeText(this, "AbnerMing", Toast.LENGTH_LONG).show();
//    }
}
