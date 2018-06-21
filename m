Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:38325 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932675AbeFUXhu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Jun 2018 19:37:50 -0400
Received: by mail-pl0-f67.google.com with SMTP id d10-v6so2488405plo.5
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Jun 2018 16:37:50 -0700 (PDT)
From: Kun Yi <kunyi@google.com>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: rlippert@google.com, benjaminfair@google.com,
        Kun Yi <kunyi@google.com>
Subject: [PATCH] hwmon (pmbus/max34440): Add support for MAX34451.
Date: Thu, 21 Jun 2018 16:37:27 -0700
Message-Id: <20180621233727.76577-1-kunyi@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

MAX34451 is a 16-Channel Voltage/Current Monitor and 12-Channel
Sequencer.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 Documentation/hwmon/max34440   | 16 ++++++---
 drivers/hwmon/pmbus/Kconfig    |  2 +-
 drivers/hwmon/pmbus/max34440.c | 62 ++++++++++++++++++++++++++++++++--
 3 files changed, 72 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/max34440 b/Documentation/hwmon/max34440
index 9ba6587b7657..b2de8fa49273 100644
--- a/Documentation/hwmon/max34440
+++ b/Documentation/hwmon/max34440
@@ -16,6 +16,11 @@ Supported chips:
     Prefixes: 'max34446'
     Addresses scanned: -
     Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX34446.pdf
+  * Maxim MAX34451
+    PMBus 16-Channel V/I Monitor and 12-Channel Sequencer/Marginer
+    Prefixes: 'max34451'
+    Addresses scanned: -
+    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
   * Maxim MAX34460
     PMBus 12-Channel Voltage Monitor & Sequencer
     Prefix: 'max34460'
@@ -36,9 +41,10 @@ Description
 This driver supports hardware monitoring for Maxim MAX34440 PMBus 6-Channel
 Power-Supply Manager, MAX34441 PMBus 5-Channel Power-Supply Manager
 and Intelligent Fan Controller, and MAX34446 PMBus Power-Supply Data Logger.
-It also supports the MAX34460 and MAX34461 PMBus Voltage Monitor & Sequencers.
-The MAX34460 supports 12 voltage channels, and the MAX34461 supports 16 voltage
-channels.
+It also supports the MAX34451, MAX34460, and MAX34461 PMBus Voltage Monitor &
+Sequencers. The MAX34451 supports monitoring voltage or current of 12 channels
+based on GIN pins. The MAX34460 supports 12 voltage channels, and the MAX34461
+supports 16 voltage channels.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus for details on PMBus client drivers.
@@ -93,7 +99,7 @@ curr[1-6]_max		Maximum current. From IOUT_OC_WARN_LIMIT register.
 curr[1-6]_crit		Critical maximum current. From IOUT_OC_FAULT_LIMIT register.
 curr[1-6]_max_alarm	Current high alarm. From IOUT_OC_WARNING status.
 curr[1-6]_crit_alarm	Current critical high alarm. From IOUT_OC_FAULT status.
-curr[1-4]_average	Historical average current (MAX34446 only).
+curr[1-4]_average	Historical average current (MAX34446/34451 only).
 curr[1-6]_highest	Historical maximum current.
 curr[1-6]_reset_history	Write any value to reset history.
 
@@ -123,5 +129,7 @@ temp[1-8]_reset_history	Write any value to reset history.
 			temp7 and temp8 attributes only exist for MAX34440.
 			MAX34446 only supports temp[1-3].
 
+MAX34451 supports attribute groups in[1-16] (or curr[1-16] based on input pins)
+and temp[1-5].
 MAX34460 supports attribute groups in[1-12] and temp[1-5].
 MAX34461 supports attribute groups in[1-16] and temp[1-5].
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index e71aec69e76e..a82018aaf473 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -130,7 +130,7 @@ config SENSORS_MAX34440
 	default n
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
-	  MAX34440, MAX34441, MAX34446, MAX34460, and MAX34461.
+	  MAX34440, MAX34441, MAX34446, MAX34451, MAX34460, and MAX34461.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called max34440.
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 74a1f6f68fb3..f879b9457c78 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -27,7 +27,7 @@
 #include <linux/i2c.h>
 #include "pmbus.h"
 
-enum chips { max34440, max34441, max34446, max34460, max34461 };
+enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
 
 #define MAX34440_MFR_VOUT_PEAK		0xd4
 #define MAX34440_MFR_IOUT_PEAK		0xd5
@@ -67,7 +67,7 @@ static int max34440_read_word_data(struct i2c_client *client, int page, int reg)
 					   MAX34440_MFR_VOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_IOUT_AVG:
-		if (data->id != max34446)
+		if (data->id != max34446 && data->id != max34451)
 			return -ENXIO;
 		ret = pmbus_read_word_data(client, page,
 					   MAX34446_MFR_IOUT_AVG);
@@ -143,7 +143,7 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 	case PMBUS_VIRT_RESET_IOUT_HISTORY:
 		ret = pmbus_write_word_data(client, page,
 					    MAX34440_MFR_IOUT_PEAK, 0);
-		if (!ret && data->id == max34446)
+		if (!ret && (data->id == max34446 || data->id == max34451))
 			ret = pmbus_write_word_data(client, page,
 					MAX34446_MFR_IOUT_AVG, 0);
 
@@ -325,6 +325,61 @@ static struct pmbus_driver_info max34440_info[] = {
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
 	},
+	[max34451] = {
+		.pages = 21,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.format[PSC_TEMPERATURE] = direct,
+		.format[PSC_CURRENT_OUT] = direct,
+		.m[PSC_VOLTAGE_OUT] = 1,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = 3,
+		.m[PSC_CURRENT_OUT] = 1,
+		.b[PSC_CURRENT_OUT] = 0,
+		.R[PSC_CURRENT_OUT] = 2,
+		.m[PSC_TEMPERATURE] = 1,
+		.b[PSC_TEMPERATURE] = 0,
+		.R[PSC_TEMPERATURE] = 2,
+		.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[3] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[4] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[5] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[6] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[7] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[8] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[9] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[10] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[11] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[12] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[13] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[14] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[15] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[16] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34440_read_byte_data,
+		.read_word_data = max34440_read_word_data,
+		.write_word_data = max34440_write_word_data,
+	},
 	[max34460] = {
 		.pages = 18,
 		.format[PSC_VOLTAGE_OUT] = direct,
@@ -413,6 +468,7 @@ static const struct i2c_device_id max34440_id[] = {
 	{"max34440", max34440},
 	{"max34441", max34441},
 	{"max34446", max34446},
+	{"max34451", max34451},
 	{"max34460", max34460},
 	{"max34461", max34461},
 	{}
-- 
2.18.0.rc2.346.g013aa6912e-goog

