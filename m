Return-Path: <vadimp@mellanox.com>
Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, jiri@resnulli.us,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 1/2] Add support for Intel VID protocol VR13
Date: Tue, 29 Aug 2017 20:06:21 +0000
Message-Id: <1504037182-122747-2-git-send-email-vadimp@mellanox.com>
In-Reply-To: <1504037182-122747-1-git-send-email-vadimp@mellanox.com>
References: <1504037182-122747-1-git-send-email-vadimp@mellanox.com>
List-ID: <linux-hwmon@vger.kernel.org>

The below lists of VOUT_MODE command readout with their related VID
protocols, Digital to Analog Converter steps:
- VR13.0 mode, 10-mV DAC - 0x24
- VR13.0 mode, 5-mV DAC - 0x27

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index bfcb13b..4efa2bd 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -341,7 +341,7 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_STATUS_VMON	BIT(19)
 
 enum pmbus_data_format { linear = 0, direct, vid };
-enum vrm_version { vr11 = 0, vr12 };
+enum vrm_version { vr11 = 0, vr12, vr13 };
 
 struct pmbus_driver_info {
 	int pages;		/* Total number of pages */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 6ac89c9..302f0ae 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -557,6 +557,10 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
 		if (val >= 0x01)
 			rv = 250 + (val - 1) * 5;
 		break;
+	case vr13:
+		if (val >= 0x01)
+			rv = 500 + (val - 1) * 10;
+		break;
 	}
 	return rv;
 }
-- 
2.1.4
