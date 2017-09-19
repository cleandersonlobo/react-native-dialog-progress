package com.dialogprogress;

import android.app.Activity;

import android.app.ProgressDialog;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

public class DialogProgressModule extends ReactContextBaseJavaModule {
    private ProgressDialog progressDialog;

    public DialogProgressModule(ReactApplicationContext reactContext) {
        super(reactContext);

    }

    @Override
    public String getName() {
        return "DialogProgress";
    }


    @ReactMethod
    public void show(ReadableMap map, final Promise promise){
         if(map == null){
                return;
          }
          Activity context = this.getCurrentActivity();
          String title = map.hasKey("title") ? map.getString("title") : null;
          String message = map.hasKey("message") ? map.getString("message") : null;
          boolean isCancelable = map.hasKey("isCancelable") ? map.getBoolean("isCancelable") : false;
          if(this.progressDialog==null){
              this.progressDialog = ProgressDialog.show(context, title, message, false, isCancelable);
          }
          if(!this.progressDialog.isShowing()){
              this.progressDialog.show();
              this.progressDialog.setTitle(title);
              this.progressDialog.setMessage(message);
              this.progressDialog.setCancelable(isCancelable);
              promise.resolve("OK");
          }else{
              this.progressDialog.setTitle(title);
              this.progressDialog.setTitle(title);
              this.progressDialog.setMessage(message);
              this.progressDialog.setCancelable(isCancelable);
              promise.resolve("OK");
          }


    }

    @ReactMethod
    public void hide(Promise promise){
          try {
              if(this.progressDialog.isShowing()){
                  this.progressDialog.dismiss();
                  this.progressDialog=null;
              }
              promise.resolve("HIDE");
          }catch (Exception e){
              promise.reject("error");
          }
    }
  
}