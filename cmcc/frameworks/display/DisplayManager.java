package android.os.display;

import android.content.Context;
import android.provider.Settings;
import android.util.Log;
import android.view.Display;
import android.os.DisplayOutputManager;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

//import com.softwinner.utils.Config;

public class DisplayManager {
    public static final int DISPLAY_STANDARD_1080P_60 = 0;
    public static final int DISPLAY_STANDARD_1080P_50 = 1;
    public static final int DISPLAY_STANDARD_1080P_30 = 2;
    public static final int DISPLAY_STANDARD_1080P_25 = 3;
    public static final int DISPLAY_STANDARD_1080P_24 = 4;
    public static final int DISPLAY_STANDARD_1080I_60 = 5;
    public static final int DISPLAY_STANDARD_1080I_50 = 6;
    public static final int DISPLAY_STANDARD_720P_60  = 7;
    public static final int DISPLAY_STANDARD_720P_50  = 8;
    public static final int DISPLAY_STANDARD_576P_50  = 9;
    public static final int DISPLAY_STANDARD_480P_60  = 10;
    public static final int DISPLAY_STANDARD_PAL      = 11;
    public static final int DISPLAY_STANDARD_NTSC     = 12;
    public static final int DISPLAY_UNKNOWN           = 0xFF;

    private DisplayOutputManager mOutputManager = null;
    private Context mCtx = null;
    private int[] mSupportList = null;

    /* for covert from standard to sunxi output mode */
    private Map<Integer, Integer> mStandard2outputMode = new HashMap<Integer, Integer>();
    private static final int DISPLAY_PRIMARY   = 0;
    private static final int DISPLAY_AUXILIARY = 1;

    /* delete this conndition */
    private int platform = 0;

    /** @hide */
    public DisplayManager(Context context) {
        mCtx = context;
        mOutputManager = (DisplayOutputManager)context.getSystemService(Context.DISPLAYOUTPUT_SERVICE);

	/*
        switch (Config.getTargetPlatform(Config.TARGET_BOARD_PLATFORM)) {
        case Config.PLATFORM_JAWS:
        case Config.PLATFORM_FIBER:
	*/
	switch (platform) {
        default:
            mSupportList = new int[11];
            mSupportList[0]  = DISPLAY_STANDARD_1080P_60;
            mSupportList[1]  = DISPLAY_STANDARD_1080P_50;
            mSupportList[2]  = DISPLAY_STANDARD_1080P_24;
            mSupportList[3]  = DISPLAY_STANDARD_1080I_60;
            mSupportList[4]  = DISPLAY_STANDARD_1080I_50;
            mSupportList[5]  = DISPLAY_STANDARD_720P_60;
            mSupportList[6]  = DISPLAY_STANDARD_720P_50;
            mSupportList[7]  = DISPLAY_STANDARD_576P_50;
            mSupportList[8]  = DISPLAY_STANDARD_480P_60;
            mSupportList[9]  = DISPLAY_STANDARD_PAL;
            mSupportList[10] = DISPLAY_STANDARD_NTSC;
        }
        initDisplayModeList();
    }

    /**
    *
    * @param standard
    *    {@link #DISPLAY_STANDARD_1080P_60}
    *    {@link #DISPLAY_STANDARD_1080P_50}
    *    {@link #DISPLAY_STANDARD_1080P_30}
    *    {@link #DISPLAY_STANDARD_1080P_25}
    *    {@link #DISPLAY_STANDARD_1080P_24}
    *    {@link #DISPLAY_STANDARD_1080I_60}
    *    {@link #DISPLAY_STANDARD_1080I_50}
    *    {@link #DISPLAY_STANDARD_720P_60}
    *    {@link #DISPLAY_STANDARD_720P_50}
    *    {@link #DISPLAY_STANDARD_576P_50}
    *    {@link #DISPLAY_STANDARD_480P_60}
    *    {@link #DISPLAY_STANDARD_PAL}
    *    {@link #DISPLAY_STANDARD_NTSC}
    *
    *@return
    */

    public boolean isSupportStandard(int standard) {
        boolean support = false;

        if (isExistInSupportList(standard)) {
            int type = mOutputManager.getDisplayOutputType(DISPLAY_PRIMARY);
            switch (type) {
            case DisplayOutputManager.DISPLAY_OUTPUT_TYPE_HDMI:
                support = mOutputManager.isSupportHdmiMode(DISPLAY_PRIMARY,
                                        standard_to_sunxi_outputmode(standard));
                break;
            case DisplayOutputManager.DISPLAY_OUTPUT_TYPE_TV:
                support = (standard == DISPLAY_STANDARD_PAL) ||
                                (standard == DISPLAY_STANDARD_NTSC);
                break;
            default:
                Log.d("CMCC-WASU", "unknow output type: %d" + type);
                support = false;
                break;
            }
        }
        return support;
    }

    /**
    * @return
    */
    public int[] getAllSupportStandards() {
        int type = mOutputManager.getDisplayOutputType(DISPLAY_PRIMARY);

        if (type == DisplayOutputManager.DISPLAY_OUTPUT_TYPE_TV ||
                type == DisplayOutputManager.DISPLAY_OUTPUT_TYPE_HDMI) {
            int length = 0;
            int[] support = new int[64];
            int modes[] = mOutputManager.getSupportModes(DISPLAY_PRIMARY, type);
            for (int i = 0; i < modes.length; i++) {
                int standard = sunxi_outputmode_to_standard(modes[i]);
                if (isExistInSupportList(standard)) {
                    support[length++] = standard;
                }
            }
            return Arrays.copyOf(support, length);
        }
        return null;
    }

    /**
    *
    * @param standard
    * {@link #DISPLAY_STANDARD_1080P_60}
    * {@link #DISPLAY_STANDARD_1080P_50}
    * {@link #DISPLAY_STANDARD_1080P_30}
    * {@link #DISPLAY_STANDARD_1080P_25}
    * {@link #DISPLAY_STANDARD_1080P_24}
    * {@link #DISPLAY_STANDARD_1080I_60}
    * {@link #DISPLAY_STANDARD_1080I_50}
    * {@link #DISPLAY_STANDARD_720P_60}
    * {@link #DISPLAY_STANDARD_720P_50}
    * {@link #DISPLAY_STANDARD_576P_50}
    * {@link #DISPLAY_STANDARD_480P_60}
    *
    * {@link #DISPLAY_STANDARD_PAL} {@link #DISPLAY_STANDARD_NTSC}
    */
    public void setDisplayStandard(int standard) {
        if (!isSupportStandard(standard)) {
            Log.e("CMCC-WASU", "unsupport standard:" + standard);
            return;
        }

        int mode = standard_to_sunxi_outputmode(standard);
        mOutputManager.setDisplayOutputMode(DISPLAY_PRIMARY, mode);

        Log.d("CMCC-WASU", "setDisplayStandard:" + standard + ", outputtype:"
            + mOutputManager.getDisplayOutputType(DISPLAY_PRIMARY) + ", output mode:" + mode);
    }

    /**
    *
    * @return {@link #DISPLAY_STANDARD_1080P_60}
    * {@link #DISPLAY_STANDARD_1080P_50}
    * {@link #DISPLAY_STANDARD_1080P_30}
    * {@link #DISPLAY_STANDARD_1080P_25}
    * {@link #DISPLAY_STANDARD_1080P_24}
    * {@link #DISPLAY_STANDARD_1080I_60}
    * {@link #DISPLAY_STANDARD_1080I_50}
    * {@link #DISPLAY_STANDARD_720P_60}
    * {@link #DISPLAY_STANDARD_720P_50}
    * {@link #DISPLAY_STANDARD_576P_50}
    * {@link #DISPLAY_STANDARD_480P_60}
    *
    * {@link #DISPLAY_STANDARD_PAL}
    * {@link #DISPLAY_STANDARD_NTSC}
    */
    public int getCurrentStandard() {
        int mode = mOutputManager.getDisplayOutputMode(DISPLAY_PRIMARY);
        return sunxi_outputmode_to_standard(mode);
    }

    /**
    *
    * @param left
    * @param top
    * @param right
    * @param bottom
    */
    public void setScreenMargin(int left, int top, int right, int bottom) {
	int hpercent = changeFromCmcc(100-left);
	int vpercent = changeFromCmcc(100-top);
        mOutputManager.setDisplayMargin(DISPLAY_PRIMARY, hpercent, vpercent);
        Log.d("CMCC-WASU", String.format("setScreenMargin: left=%d, top=%d, right=%d, bottom=%d (sunxi margin: %d %d)",
                left, top, right, bottom, hpercent, vpercent));
    }

    /**
    *
    * @return int[]
    *
    */

    public int[] getScreenMargin() {
        int[] percent = mOutputManager.getDisplayMargin(DISPLAY_PRIMARY);
        int[] ret = new int[4];
        ret[0] = 100 - changeToCmcc(percent[0]);
        ret[1] = 100 - changeToCmcc(percent[1]);
        ret[2] = ret[0];
        ret[3] = ret[1];

        Log.d("CMCC-WASU", "getScreenMargin("
            + ret[0] + "," + ret[1] + ","
            + ret[2] + "," + ret[3] + ")"
            + " sunxi margin: " + percent[0] + ", " + percent[1]);
        return ret;
    }

    private int changeFromCmcc(int value) {

        if (value < 0) {
            return 0;
        } else if (value > 100) {
            return 100;
        }
        /*
        switch (Config.getTargetPlatform(Config.TARGET_BOARD_PLATFORM)) {
        case Config.PLATFORM_JAWS:
        case Config.PLATFORM_DOLPHIN:
            //change 0~100 to 100~50
            //(50 + (value-0)*(100-50)/(100-0))
            return 50 + (100 - value) / 2;
        */
        switch (platform) {
        default:
            return value / 2 + 50;
        }
    }

    private int changeToCmcc(int value) {
        /*
        switch (Config.getTargetPlatform(Config.TARGET_BOARD_PLATFORM)) {
        case Config.PLATFORM_JAWS:
        case Config.PLATFORM_DOLPHIN:
            //change 50~100 to 100 ~ 0,
            //(0 + (value-50)*(100-0)/(100-50))
            return 100 - (value - 50) * 2;
        */
        switch (platform) {
        default:
            return (value - 50) * 2;
        }
    }

    /**
    *
    */
    public void saveParams() {
        int type = mOutputManager.getDisplayOutputType(DISPLAY_PRIMARY);
        int mode = mOutputManager.getDisplayOutputMode(DISPLAY_PRIMARY);

        //mOutputManager.saveDisplayResolution(DISPLAY_PRIMARY, type, mode);
        int[] percent = mOutputManager.getDisplayMargin(DISPLAY_PRIMARY);

        /*
        Settings.System.putInt(mCtx.getContentResolver(),
                Settings.System.DISPLAY_AREA_H_PERCENT, percent[0]);
        Settings.System.putInt(mCtx.getContentResolver(),
                Settings.System.DISPLAY_AREA_V_PERCENT, percent[1]);
        */
        Log.d("CMCC-WASU", String.format("saveParams:  type=%d, mode=%d, hpercent=%d, vpercent=%d",
                type, mode, percent[0], percent[1]));
    }

    private void initDisplayModeList() {
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_1080P_60), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_1080P_60HZ));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_1080P_50), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_1080P_50HZ));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_1080P_30), Integer.valueOf(-1));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_1080P_25), Integer.valueOf(-1));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_1080P_24), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_1080P_24HZ));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_1080I_60), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_1080I_60HZ));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_1080I_50), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_1080I_50HZ));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_720P_60 ), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_720P_60HZ));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_720P_50 ), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_720P_50HZ));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_576P_50 ), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_576P));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_480P_60 ), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_480P));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_PAL     ), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_PAL ));
        mStandard2outputMode.put(Integer.valueOf(DISPLAY_STANDARD_NTSC    ), Integer.valueOf(DisplayOutputManager.DISPLAY_TVFORMAT_NTSC));
    }

    private int standard_to_sunxi_outputmode(int standard) {
        Integer mode = mStandard2outputMode.get(standard);
        if (mode != null)
            return mode.intValue();
        return -1;
    }

    private int sunxi_outputmode_to_standard(int outputmode) {
        int standard = DISPLAY_UNKNOWN;
        Iterator entries = mStandard2outputMode.entrySet().iterator();

        while (entries.hasNext()) {
            Map.Entry entry = (Map.Entry)entries.next();
            if (((Integer)entry.getValue()).intValue() == outputmode) {
                standard = ((Integer)entry.getKey()).intValue();
                break;
            }
        }
        return standard;
    }

    private boolean isExistInSupportList(int standard) {
        for (int i = 0; i < mSupportList.length; i++) {
            if (mSupportList[i] == standard)
                return true;
        }
        return false;
    }
}
