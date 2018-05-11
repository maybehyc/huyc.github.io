package com.example.apple.myapplication.ui.base;

import android.content.Context;
import android.view.View;

import com.example.apple.myapplication.util.ToastUtil;

/**
 * Created by apple on 2018/5/7.
 */

public class PresentationLayerFuncHelper implements PresentationLayerFunc {
    private Context context;

    public PresentationLayerFuncHelper(Context context) {
        this.context = context;
    }

    @Override
    public void showToast(String msg) {
        ToastUtil.showShortToast(context, msg);
    }

    @Override
    public void showProgressDialog() {

    }

    @Override
    public void hideProgressDialog() {

    }

    @Override
    public void showSoftKeyboard(View focusView) {

    }

    @Override
    public void hideSoftKeyboard() {

    }
}
