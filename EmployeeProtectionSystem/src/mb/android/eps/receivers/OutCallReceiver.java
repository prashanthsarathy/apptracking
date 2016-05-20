package mb.android.eps.receivers;

import mb.android.eps.common.SharedValues;
import mb.android.eps.util.SmsSender;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class OutCallReceiver extends BroadcastReceiver {
	private static final String ACTION = "android.intent.action.NEW_OUTGOING_CALL";


	public void onReceive(Context context, Intent intent) {
		if (intent.getAction().equals(ACTION)) {
			SharedValues.isOgCall = true;
			
			String outNum = "Unknown";
			if (getResultData() != null) {
				SharedValues.ogCallNumber = getResultData();
			}
			//new SmsSender(SharedValues.OG_CALL, outNum, null).start();
		}
	}

}
