/*
 * Copyright (C) 2011 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.net.pppoe;


import android.content.Context;
import android.net.DhcpInfo;
import android.net.ethernet.EthernetDevInfo;
import android.net.ethernet.EthernetManager;

public class PppoeManager {
    private static final String TAG = "PppoeManager";

    private EthernetManager mEthManager;

    public static final String MSTAR_PPPOE_STATE_CONNECT = "connect";
    public static final String MSTAR_PPPOE_STATE_DISCONNECT = "disconnect";
    public static final String MSTAR_PPPOE_STATE_CONNECTING = "connecting";
    public static final String MSTAR_PPPOE_STATE_DISCONNECTING = "disconnecting";
    public static final String MSTAR_PPPOE_STATE_AUTHFAILED = "authfailed";
    public static final String MSTAR_PPPOE_STATE_LINKTIMEOUT = "linktimeout";
    public static final String MSTAR_PPPOE_STATE_FAILED = "failed";

    public static final int MSG_PPPOE_CONNECT = 0;
    public static final int MSG_PPPOE_DISCONNECT = 1;
    public static final int MSG_PPPOE_CONNECTING = 2;
    public static final int MSG_PPPOE_DISCONNECTING = 3;
    public static final int MSG_PPPOE_AUTH_FAILED = 4;
    public static final int MSG_PPPOE_TIME_OUT = 5;
    public static final int MSG_PPPOE_FAILED = 6;

    public static final String PPPOE_STATE_ACTION = "PPPOE_STATE_CHANGED";
    public static final String PPPOE_STATE_STATUE = "PppoeStatus";

    public static final String PPPOE_STATE_CHANGED_ACTION = "PPPOE_STATE_CHANGED";
    public static final String EXTRA_PPPOE_STATE = "pppoe_state";
    public static final String EXTRA_PPPOE_ERRMSG = "pppoe_errmsg";

    public static final int PPPOE_STATE_DISABLED = 1;
    public static final int PPPOE_STATE_ENABLED = 0;

    public static final int PPPOE_STATE_UNKNOWN = EthernetManager.PPPOE_STATE_UNKNOWN;
    public static final int PPPOE_STATE_CONNECT = EthernetManager.PPPOE_STATE_CONNECT;
    public static final int PPPOE_STATE_DISCONNECT = EthernetManager.PPPOE_STATE_DISCONNECT;
    public static final int PPPOE_STATE_CONNECTING = EthernetManager.PPPOE_STATE_CONNECTING;

    public static final int EVENT_CONNECT_SUCCESSED = 0;
    public static final int EVENT_CONNECT_FAILED = 1;
    public static final int EVENT_CONNECT_DISCONNECTED = 2;
    public static final int EVENT_CONNECT_STARTED = 3;

    public static final String PPPOE_CONNECT_MODE_DHCP = "dhcp";
    public static final String PPPOE_CONNECT_MODE_MANUAL = "manual";

    /**
     * function:PppoeManager constructor
     */
    public PppoeManager(Context context) {
        mEthManager = EthernetManager.getInstance();
    }

    /**
     *function:connectPppoe
     */
    public void connectPppoe(final String account, final String password, final String ifnet) {
        EthernetDevInfo devInfo = new EthernetDevInfo();
        devInfo.setMode(EthernetManager.ETHERNET_CONNECT_MODE_PPPOE);
        devInfo.setUsername(account);
        devInfo.setPasswd(password);
        mEthManager.setEthernetMode(EthernetManager.ETHERNET_CONNECT_MODE_PPPOE, devInfo);
    }

    /**
     *function:disconnectPppoe
     */
    public void disconnectPppoe() {
        /*
         * we teardown ethernet before reconnect
         * so we don't need disconnect
         */
    }

    /**
     *function:set pppoe status
     */
    private void setPppoeStatus(int status, boolean sendBroadcast) {
        /*
         * do nothing
         */
    }

    /**
     *function:get pppoe status
     */
    public int getPppoeStatus() {
        return mEthManager.getPppoeStatus();
    }

    public synchronized void connect(String name, String pswd, String ifaceName) {
        connectPppoe(name, pswd, ifaceName);
    }

    public synchronized void disconnect(String ifaceName) {
        disconnectPppoe();
    }

    public synchronized void setPppoeMode(String mode, DhcpInfo info) {
        /*
         * do nothing
         */
    }

    public synchronized String getPppoeMode() {
        return PPPOE_CONNECT_MODE_DHCP;
    }

    public int getPppoeState() {
        return getPppoeStatus();
    }

    public boolean isPppoeDeviceUp() {
        return true;
    }

    public DhcpInfo getDhcpInfo() {
        return mEthManager.getDhcpInfo();
    }

}
