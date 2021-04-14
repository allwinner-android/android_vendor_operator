package cmccwasu.systemserver;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.SystemProperties;
import android.provider.Settings;
import android.util.Log;

public class Receiver extends BroadcastReceiver {
    private static final String TAG = "CMCC-WASU";
    
    private Context mContext = null;
    private class SettingObserver extends ContentObserver {

        SettingObserver(Handler handler) {
            super(handler);
            // TODO Auto-generated constructor stub
            
            Log.d(TAG, "---------- SettingObserver");
        }
        private void observe() {
            ContentResolver resolver = mContext.getContentResolver();
            Log.d(TAG, "---------- SettingObserver");
            resolver.registerContentObserver(Settings.System.getUriFor(
                Settings.Secure.DEFAULT_SCREEN_RATIO), false, this);
            resolver.registerContentObserver(Settings.System.getUriFor(
                Settings.Secure.DEFAULT_PLAYER_QUALITY), false, this);
            
            update();
        }

        @Override
        public void onChange(boolean selfChange) {
            Log.d(TAG, "---------- SettingObserver");
            update();
        }
        
        public void update() {
            //
            final ContentResolver cr = mContext.getContentResolver();
            
            Log.d(TAG, "---------- SettingObserver");
            String val = Settings.Secure.getString(cr,
                Settings.Secure.DEFAULT_SCREEN_RATIO);
            if (val == null) {
                val = "1";
            } else if (val.length() == 0) {
                val = "1";
            }
            SystemProperties.set("epg.default_screen_ratio", val);
            Log.v(TAG, "set default_screen_ratio = " + val);
            
            val = Settings.Secure.getString(cr, Settings.Secure.DEFAULT_PLAYER_QUALITY);
            if (val == null) {
                val = "0";
            } else if (val.length() == 0) {
                val = "0";
            }
            SystemProperties.set("epg.default_player_quality", val);
            Log.v(TAG, "set default_player_quality = " + val);
        }
    }
    
    @Override
    public void onReceive(Context context, Intent intent) {
                mContext = context;
                final ContentResolver cr = mContext.getContentResolver();
        
        //
        Log.d(TAG, "system boot complete, do some init work here");
        
        String val = Settings.Secure.getString(cr, Settings.Secure.DEFAULT_SCREEN_RATIO);
        if (val == null) {
            val = "1";
        } else if (val.length() == 0) {
            val = "1";
        }
        SystemProperties.set("epg.default_screen_ratio", val);
        Log.v(TAG, "boot complete, set default_screen_ratio = " + val);
        
        val = Settings.Secure.getString(cr, Settings.Secure.DEFAULT_PLAYER_QUALITY);
        if (val == null) {
            val = "0";
        } else if (val.length() == 0) {
            val = "0";
        }
        SystemProperties.set("epg.default_player_quality", val);
        Log.v(TAG, "boot complete, set default_player_quality = " + val);
        
        //
        SettingObserver observer = new SettingObserver(new Handler());
        observer.observe();
    }
}
