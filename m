Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55780C77B7C
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 May 2023 13:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbjEENRh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 May 2023 09:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjEENRf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 May 2023 09:17:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962881E9AE
        for <linux-hwmon@vger.kernel.org>; Fri,  5 May 2023 06:17:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puvJP-0008EC-QJ; Fri, 05 May 2023 15:17:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puvJO-001JAc-G9; Fri, 05 May 2023 15:17:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puvJN-001WWy-Gy; Fri, 05 May 2023 15:17:25 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] hwmon: Switch i2c drivers back to use .probe()
Date:   Fri,  5 May 2023 15:17:18 +0200
Message-Id: <20230505131718.1210071-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=76112; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=XbVN4DH5VcPzC2EDNbYUNWtxWhTpzZbs6pEtdr3yPVE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVQHdvgmtZq4mnSR9lgoYtHT/YoSspgBdm374T xQGd2VyXieJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFUB3QAKCRCPgPtYfRL+ TkrgCACVu2/aMYQA3lXJFUaPE6ceGpBqEfFKGCOqTmJzOref7kovpe1kYP46RpxeRc9ZR5zhCJf qYFdfUGoMxcC0CPnsaUS8LAdi2HP2m0px0r9pUHzGtysd8TKkQnkbCh3dBdtc9q+tOCGPSJa/Rw P2Bba1vE4Bu0gjEOfapO4qbRHHY4lPQhH/5613ljKQot5bjpPLVB2PyArKyf59oEriUVbRykKy2 o7ExkdRFkUke59ZvP2oNhjmtaJi/bGtXmIMZXh2EI7Q1jU5PgAubabKowt6jnoKUAO5jhL3Is9j zhhWwOCtxeFugdqsgfgyWBaO1Nn4LK/jybRrCxhRax2xOuqj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/ad7414.c                  | 2 +-
 drivers/hwmon/ad7418.c                  | 2 +-
 drivers/hwmon/adc128d818.c              | 2 +-
 drivers/hwmon/adm1021.c                 | 2 +-
 drivers/hwmon/adm1025.c                 | 2 +-
 drivers/hwmon/adm1026.c                 | 2 +-
 drivers/hwmon/adm1029.c                 | 2 +-
 drivers/hwmon/adm1031.c                 | 2 +-
 drivers/hwmon/adm1177.c                 | 2 +-
 drivers/hwmon/adm9240.c                 | 2 +-
 drivers/hwmon/ads7828.c                 | 2 +-
 drivers/hwmon/adt7410.c                 | 2 +-
 drivers/hwmon/adt7411.c                 | 2 +-
 drivers/hwmon/adt7462.c                 | 2 +-
 drivers/hwmon/adt7470.c                 | 2 +-
 drivers/hwmon/adt7475.c                 | 2 +-
 drivers/hwmon/aht10.c                   | 2 +-
 drivers/hwmon/amc6821.c                 | 2 +-
 drivers/hwmon/asb100.c                  | 2 +-
 drivers/hwmon/asc7621.c                 | 2 +-
 drivers/hwmon/atxp1.c                   | 2 +-
 drivers/hwmon/dme1737.c                 | 2 +-
 drivers/hwmon/ds1621.c                  | 2 +-
 drivers/hwmon/ds620.c                   | 2 +-
 drivers/hwmon/emc1403.c                 | 2 +-
 drivers/hwmon/emc2103.c                 | 2 +-
 drivers/hwmon/emc2305.c                 | 2 +-
 drivers/hwmon/emc6w201.c                | 2 +-
 drivers/hwmon/f75375s.c                 | 2 +-
 drivers/hwmon/fschmd.c                  | 2 +-
 drivers/hwmon/ftsteutates.c             | 2 +-
 drivers/hwmon/g760a.c                   | 2 +-
 drivers/hwmon/g762.c                    | 2 +-
 drivers/hwmon/gl518sm.c                 | 2 +-
 drivers/hwmon/gl520sm.c                 | 2 +-
 drivers/hwmon/hih6130.c                 | 2 +-
 drivers/hwmon/ina209.c                  | 2 +-
 drivers/hwmon/ina238.c                  | 2 +-
 drivers/hwmon/ina2xx.c                  | 2 +-
 drivers/hwmon/ina3221.c                 | 2 +-
 drivers/hwmon/jc42.c                    | 2 +-
 drivers/hwmon/lineage-pem.c             | 2 +-
 drivers/hwmon/lm63.c                    | 2 +-
 drivers/hwmon/lm73.c                    | 2 +-
 drivers/hwmon/lm75.c                    | 2 +-
 drivers/hwmon/lm77.c                    | 2 +-
 drivers/hwmon/lm78.c                    | 2 +-
 drivers/hwmon/lm80.c                    | 2 +-
 drivers/hwmon/lm83.c                    | 2 +-
 drivers/hwmon/lm85.c                    | 2 +-
 drivers/hwmon/lm87.c                    | 2 +-
 drivers/hwmon/lm90.c                    | 2 +-
 drivers/hwmon/lm92.c                    | 2 +-
 drivers/hwmon/lm93.c                    | 2 +-
 drivers/hwmon/lm95234.c                 | 2 +-
 drivers/hwmon/lm95241.c                 | 2 +-
 drivers/hwmon/lm95245.c                 | 2 +-
 drivers/hwmon/ltc2945.c                 | 2 +-
 drivers/hwmon/ltc2947-i2c.c             | 2 +-
 drivers/hwmon/ltc2990.c                 | 2 +-
 drivers/hwmon/ltc2992.c                 | 2 +-
 drivers/hwmon/ltc4151.c                 | 2 +-
 drivers/hwmon/ltc4215.c                 | 2 +-
 drivers/hwmon/ltc4222.c                 | 2 +-
 drivers/hwmon/ltc4245.c                 | 2 +-
 drivers/hwmon/ltc4260.c                 | 2 +-
 drivers/hwmon/ltc4261.c                 | 2 +-
 drivers/hwmon/max127.c                  | 2 +-
 drivers/hwmon/max16065.c                | 2 +-
 drivers/hwmon/max1619.c                 | 2 +-
 drivers/hwmon/max1668.c                 | 2 +-
 drivers/hwmon/max31730.c                | 2 +-
 drivers/hwmon/max31760.c                | 2 +-
 drivers/hwmon/max31790.c                | 2 +-
 drivers/hwmon/max6620.c                 | 2 +-
 drivers/hwmon/max6621.c                 | 2 +-
 drivers/hwmon/max6639.c                 | 2 +-
 drivers/hwmon/max6642.c                 | 2 +-
 drivers/hwmon/max6650.c                 | 2 +-
 drivers/hwmon/max6697.c                 | 2 +-
 drivers/hwmon/mc34vr500.c               | 2 +-
 drivers/hwmon/mcp3021.c                 | 2 +-
 drivers/hwmon/nct6775-i2c.c             | 2 +-
 drivers/hwmon/nct7802.c                 | 2 +-
 drivers/hwmon/nct7904.c                 | 2 +-
 drivers/hwmon/occ/p8_i2c.c              | 2 +-
 drivers/hwmon/pcf8591.c                 | 2 +-
 drivers/hwmon/pmbus/adm1266.c           | 2 +-
 drivers/hwmon/pmbus/adm1275.c           | 2 +-
 drivers/hwmon/pmbus/bel-pfe.c           | 2 +-
 drivers/hwmon/pmbus/bpa-rs600.c         | 2 +-
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c | 2 +-
 drivers/hwmon/pmbus/dps920ab.c          | 2 +-
 drivers/hwmon/pmbus/fsp-3y.c            | 2 +-
 drivers/hwmon/pmbus/ibm-cffps.c         | 2 +-
 drivers/hwmon/pmbus/inspur-ipsps.c      | 2 +-
 drivers/hwmon/pmbus/ir35221.c           | 2 +-
 drivers/hwmon/pmbus/ir36021.c           | 2 +-
 drivers/hwmon/pmbus/ir38064.c           | 2 +-
 drivers/hwmon/pmbus/irps5401.c          | 2 +-
 drivers/hwmon/pmbus/isl68137.c          | 2 +-
 drivers/hwmon/pmbus/lm25066.c           | 2 +-
 drivers/hwmon/pmbus/lt7182s.c           | 2 +-
 drivers/hwmon/pmbus/ltc2978.c           | 2 +-
 drivers/hwmon/pmbus/ltc3815.c           | 2 +-
 drivers/hwmon/pmbus/max15301.c          | 2 +-
 drivers/hwmon/pmbus/max16064.c          | 2 +-
 drivers/hwmon/pmbus/max16601.c          | 2 +-
 drivers/hwmon/pmbus/max20730.c          | 2 +-
 drivers/hwmon/pmbus/max20751.c          | 2 +-
 drivers/hwmon/pmbus/max31785.c          | 2 +-
 drivers/hwmon/pmbus/max34440.c          | 2 +-
 drivers/hwmon/pmbus/max8688.c           | 2 +-
 drivers/hwmon/pmbus/mp2888.c            | 2 +-
 drivers/hwmon/pmbus/mp2975.c            | 2 +-
 drivers/hwmon/pmbus/mp5023.c            | 2 +-
 drivers/hwmon/pmbus/mpq7932.c           | 2 +-
 drivers/hwmon/pmbus/pim4328.c           | 2 +-
 drivers/hwmon/pmbus/pli1209bc.c         | 2 +-
 drivers/hwmon/pmbus/pm6764tr.c          | 2 +-
 drivers/hwmon/pmbus/pmbus.c             | 2 +-
 drivers/hwmon/pmbus/pxe1610.c           | 2 +-
 drivers/hwmon/pmbus/q54sj108a2.c        | 2 +-
 drivers/hwmon/pmbus/stpddc60.c          | 2 +-
 drivers/hwmon/pmbus/tda38640.c          | 2 +-
 drivers/hwmon/pmbus/tps40422.c          | 2 +-
 drivers/hwmon/pmbus/tps53679.c          | 2 +-
 drivers/hwmon/pmbus/tps546d24.c         | 2 +-
 drivers/hwmon/pmbus/ucd9000.c           | 2 +-
 drivers/hwmon/pmbus/ucd9200.c           | 2 +-
 drivers/hwmon/pmbus/xdpe12284.c         | 2 +-
 drivers/hwmon/pmbus/xdpe152c4.c         | 2 +-
 drivers/hwmon/pmbus/zl6100.c            | 2 +-
 drivers/hwmon/powr1220.c                | 2 +-
 drivers/hwmon/sbrmi.c                   | 2 +-
 drivers/hwmon/sbtsi_temp.c              | 2 +-
 drivers/hwmon/sht21.c                   | 2 +-
 drivers/hwmon/sht3x.c                   | 2 +-
 drivers/hwmon/sht4x.c                   | 2 +-
 drivers/hwmon/shtc1.c                   | 2 +-
 drivers/hwmon/smm665.c                  | 2 +-
 drivers/hwmon/smsc47m192.c              | 2 +-
 drivers/hwmon/stts751.c                 | 2 +-
 drivers/hwmon/tc654.c                   | 2 +-
 drivers/hwmon/tc74.c                    | 2 +-
 drivers/hwmon/thmc50.c                  | 2 +-
 drivers/hwmon/tmp102.c                  | 2 +-
 drivers/hwmon/tmp103.c                  | 2 +-
 drivers/hwmon/tmp108.c                  | 2 +-
 drivers/hwmon/tmp401.c                  | 2 +-
 drivers/hwmon/tmp421.c                  | 2 +-
 drivers/hwmon/tmp464.c                  | 2 +-
 drivers/hwmon/tmp513.c                  | 2 +-
 drivers/hwmon/tps23861.c                | 2 +-
 drivers/hwmon/w83773g.c                 | 2 +-
 drivers/hwmon/w83781d.c                 | 2 +-
 drivers/hwmon/w83791d.c                 | 2 +-
 drivers/hwmon/w83792d.c                 | 2 +-
 drivers/hwmon/w83793.c                  | 2 +-
 drivers/hwmon/w83795.c                  | 2 +-
 drivers/hwmon/w83l785ts.c               | 2 +-
 drivers/hwmon/w83l786ng.c               | 2 +-
 162 files changed, 162 insertions(+), 162 deletions(-)

diff --git a/drivers/hwmon/ad7414.c b/drivers/hwmon/ad7414.c
index 0afb89c4629d..7f1bef59046f 100644
--- a/drivers/hwmon/ad7414.c
+++ b/drivers/hwmon/ad7414.c
@@ -221,7 +221,7 @@ static struct i2c_driver ad7414_driver = {
 		.name	= "ad7414",
 		.of_match_table = of_match_ptr(ad7414_of_match),
 	},
-	.probe_new = ad7414_probe,
+	.probe = ad7414_probe,
 	.id_table = ad7414_id,
 };
 
diff --git a/drivers/hwmon/ad7418.c b/drivers/hwmon/ad7418.c
index 22bdb7e5b9e0..ffe81e445010 100644
--- a/drivers/hwmon/ad7418.c
+++ b/drivers/hwmon/ad7418.c
@@ -306,7 +306,7 @@ static struct i2c_driver ad7418_driver = {
 		.name	= "ad7418",
 		.of_match_table = ad7418_dt_ids,
 	},
-	.probe_new	= ad7418_probe,
+	.probe		= ad7418_probe,
 	.id_table	= ad7418_id,
 };
 
diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index 97b330b6c165..46e3c8c50765 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -521,7 +521,7 @@ static struct i2c_driver adc128_driver = {
 		.name	= "adc128d818",
 		.of_match_table = of_match_ptr(adc128_of_match),
 	},
-	.probe_new	= adc128_probe,
+	.probe		= adc128_probe,
 	.remove		= adc128_remove,
 	.id_table	= adc128_id,
 	.detect		= adc128_detect,
diff --git a/drivers/hwmon/adm1021.c b/drivers/hwmon/adm1021.c
index 2dc45e958730..7c15398ebb37 100644
--- a/drivers/hwmon/adm1021.c
+++ b/drivers/hwmon/adm1021.c
@@ -488,7 +488,7 @@ static struct i2c_driver adm1021_driver = {
 	.driver = {
 		.name	= "adm1021",
 	},
-	.probe_new	= adm1021_probe,
+	.probe		= adm1021_probe,
 	.id_table	= adm1021_id,
 	.detect		= adm1021_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/adm1025.c b/drivers/hwmon/adm1025.c
index 2984c4f98496..389382d54752 100644
--- a/drivers/hwmon/adm1025.c
+++ b/drivers/hwmon/adm1025.c
@@ -559,7 +559,7 @@ static struct i2c_driver adm1025_driver = {
 	.driver = {
 		.name	= "adm1025",
 	},
-	.probe_new	= adm1025_probe,
+	.probe		= adm1025_probe,
 	.id_table	= adm1025_id,
 	.detect		= adm1025_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/adm1026.c b/drivers/hwmon/adm1026.c
index 1f084f708743..581d8edf70ea 100644
--- a/drivers/hwmon/adm1026.c
+++ b/drivers/hwmon/adm1026.c
@@ -1859,7 +1859,7 @@ static struct i2c_driver adm1026_driver = {
 	.driver = {
 		.name	= "adm1026",
 	},
-	.probe_new	= adm1026_probe,
+	.probe		= adm1026_probe,
 	.id_table	= adm1026_id,
 	.detect		= adm1026_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/adm1029.c b/drivers/hwmon/adm1029.c
index eaf6e5e04aac..9a465f3f71c8 100644
--- a/drivers/hwmon/adm1029.c
+++ b/drivers/hwmon/adm1029.c
@@ -389,7 +389,7 @@ static struct i2c_driver adm1029_driver = {
 	.driver = {
 		.name = "adm1029",
 	},
-	.probe_new	= adm1029_probe,
+	.probe		= adm1029_probe,
 	.id_table	= adm1029_id,
 	.detect		= adm1029_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index b42797bcb5b4..88c7e0d62d08 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -1068,7 +1068,7 @@ static struct i2c_driver adm1031_driver = {
 	.driver = {
 		.name = "adm1031",
 	},
-	.probe_new	= adm1031_probe,
+	.probe		= adm1031_probe,
 	.id_table	= adm1031_id,
 	.detect		= adm1031_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index be17a26a84f1..4e34797d51c9 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -255,7 +255,7 @@ static struct i2c_driver adm1177_driver = {
 		.name = "adm1177",
 		.of_match_table = adm1177_dt_ids,
 	},
-	.probe_new = adm1177_probe,
+	.probe = adm1177_probe,
 	.id_table = adm1177_id,
 };
 module_i2c_driver(adm1177_driver);
diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 40e3558d3709..c4e565aa91b1 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -819,7 +819,7 @@ static struct i2c_driver adm9240_driver = {
 	.driver = {
 		.name	= "adm9240",
 	},
-	.probe_new	= adm9240_probe,
+	.probe		= adm9240_probe,
 	.id_table	= adm9240_id,
 	.detect		= adm9240_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 7246198f0901..1932613ec095 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -208,7 +208,7 @@ static struct i2c_driver ads7828_driver = {
 	},
 
 	.id_table = ads7828_device_ids,
-	.probe_new = ads7828_probe,
+	.probe = ads7828_probe,
 };
 
 module_i2c_driver(ads7828_driver);
diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index 0cebf6777239..952506779336 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -100,7 +100,7 @@ static struct i2c_driver adt7410_driver = {
 		.name	= "adt7410",
 		.pm	= pm_sleep_ptr(&adt7x10_dev_pm_ops),
 	},
-	.probe_new	= adt7410_i2c_probe,
+	.probe		= adt7410_i2c_probe,
 	.id_table	= adt7410_ids,
 	.address_list	= I2C_ADDRS(0x48, 0x49, 0x4a, 0x4b),
 };
diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index bf5c5618f8d0..e5e427416b2e 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -706,7 +706,7 @@ static struct i2c_driver adt7411_driver = {
 	.driver		= {
 		.name		= "adt7411",
 	},
-	.probe_new = adt7411_probe,
+	.probe = adt7411_probe,
 	.id_table = adt7411_id,
 	.detect = adt7411_detect,
 	.address_list = normal_i2c,
diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index 9c0235849d4b..429566c4245d 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -1819,7 +1819,7 @@ static struct i2c_driver adt7462_driver = {
 	.driver = {
 		.name	= "adt7462",
 	},
-	.probe_new	= adt7462_probe,
+	.probe		= adt7462_probe,
 	.id_table	= adt7462_id,
 	.detect		= adt7462_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 927f8df05b7c..2603a59e12b7 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1314,7 +1314,7 @@ static struct i2c_driver adt7470_driver = {
 	.driver = {
 		.name	= "adt7470",
 	},
-	.probe_new	= adt7470_probe,
+	.probe		= adt7470_probe,
 	.remove		= adt7470_remove,
 	.id_table	= adt7470_id,
 	.detect		= adt7470_detect,
diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 6e4c92b500b8..36766825cb18 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1821,7 +1821,7 @@ static struct i2c_driver adt7475_driver = {
 		.name	= "adt7475",
 		.of_match_table = of_match_ptr(adt7475_of_match),
 	},
-	.probe_new	= adt7475_probe,
+	.probe		= adt7475_probe,
 	.id_table	= adt7475_id,
 	.detect		= adt7475_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 9babd69d54a3..dec83e1a3373 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -334,7 +334,7 @@ static struct i2c_driver aht10_driver = {
 	.driver = {
 		.name = "aht10",
 	},
-	.probe_new  = aht10_probe,
+	.probe      = aht10_probe,
 	.id_table   = aht10_id,
 };
 
diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 3bfd12ff4b3c..2a7a4b6b0094 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -939,7 +939,7 @@ static struct i2c_driver amc6821_driver = {
 	.driver = {
 		.name	= "amc6821",
 	},
-	.probe_new = amc6821_probe,
+	.probe = amc6821_probe,
 	.id_table = amc6821_id,
 	.detect = amc6821_detect,
 	.address_list = normal_i2c,
diff --git a/drivers/hwmon/asb100.c b/drivers/hwmon/asb100.c
index ce4da836765c..974521e9b6b4 100644
--- a/drivers/hwmon/asb100.c
+++ b/drivers/hwmon/asb100.c
@@ -223,7 +223,7 @@ static struct i2c_driver asb100_driver = {
 	.driver = {
 		.name	= "asb100",
 	},
-	.probe_new	= asb100_probe,
+	.probe		= asb100_probe,
 	.remove		= asb100_remove,
 	.id_table	= asb100_id,
 	.detect		= asb100_detect,
diff --git a/drivers/hwmon/asc7621.c b/drivers/hwmon/asc7621.c
index 54595454537b..87e186700849 100644
--- a/drivers/hwmon/asc7621.c
+++ b/drivers/hwmon/asc7621.c
@@ -1191,7 +1191,7 @@ static struct i2c_driver asc7621_driver = {
 	.driver = {
 		.name = "asc7621",
 	},
-	.probe_new = asc7621_probe,
+	.probe = asc7621_probe,
 	.remove = asc7621_remove,
 	.id_table = asc7621_id,
 	.detect = asc7621_detect,
diff --git a/drivers/hwmon/atxp1.c b/drivers/hwmon/atxp1.c
index 118297ea1dcf..d1de020abec6 100644
--- a/drivers/hwmon/atxp1.c
+++ b/drivers/hwmon/atxp1.c
@@ -288,7 +288,7 @@ static struct i2c_driver atxp1_driver = {
 	.driver = {
 		.name	= "atxp1",
 	},
-	.probe_new	= atxp1_probe,
+	.probe		= atxp1_probe,
 	.id_table	= atxp1_id,
 };
 
diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index 66c48f70fae7..cdbf3dff9172 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -2528,7 +2528,7 @@ static struct i2c_driver dme1737_i2c_driver = {
 	.driver = {
 		.name = "dme1737",
 	},
-	.probe_new = dme1737_i2c_probe,
+	.probe = dme1737_i2c_probe,
 	.remove = dme1737_i2c_remove,
 	.id_table = dme1737_id,
 	.detect = dme1737_i2c_detect,
diff --git a/drivers/hwmon/ds1621.c b/drivers/hwmon/ds1621.c
index e803d6393b9e..21b635046521 100644
--- a/drivers/hwmon/ds1621.c
+++ b/drivers/hwmon/ds1621.c
@@ -384,7 +384,7 @@ static struct i2c_driver ds1621_driver = {
 	.driver = {
 		.name	= "ds1621",
 	},
-	.probe_new	= ds1621_probe,
+	.probe		= ds1621_probe,
 	.id_table	= ds1621_id,
 };
 
diff --git a/drivers/hwmon/ds620.c b/drivers/hwmon/ds620.c
index 82d7c3d58f49..2b09536630cb 100644
--- a/drivers/hwmon/ds620.c
+++ b/drivers/hwmon/ds620.c
@@ -245,7 +245,7 @@ static struct i2c_driver ds620_driver = {
 	.driver = {
 		   .name = "ds620",
 	},
-	.probe_new = ds620_probe,
+	.probe = ds620_probe,
 	.id_table = ds620_id,
 };
 
diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index 61d59189a6d1..bb7c859e799d 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -454,7 +454,7 @@ static struct i2c_driver sensor_emc1403 = {
 		.name = "emc1403",
 	},
 	.detect = emc1403_detect,
-	.probe_new = emc1403_probe,
+	.probe = emc1403_probe,
 	.id_table = emc1403_idtable,
 	.address_list = emc1403_address_list,
 };
diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
index 361cf9292456..b59472bbe5bf 100644
--- a/drivers/hwmon/emc2103.c
+++ b/drivers/hwmon/emc2103.c
@@ -653,7 +653,7 @@ static struct i2c_driver emc2103_driver = {
 	.driver = {
 		.name	= "emc2103",
 	},
-	.probe_new	= emc2103_probe,
+	.probe		= emc2103_probe,
 	.id_table	= emc2103_ids,
 	.detect		= emc2103_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index f65467fbd86c..c3b6460de6bf 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -615,7 +615,7 @@ static struct i2c_driver emc2305_driver = {
 	.driver = {
 		.name = "emc2305",
 	},
-	.probe_new = emc2305_probe,
+	.probe = emc2305_probe,
 	.remove	  = emc2305_remove,
 	.id_table = emc2305_ids,
 	.address_list = emc2305_normal_i2c,
diff --git a/drivers/hwmon/emc6w201.c b/drivers/hwmon/emc6w201.c
index bcd93f0fe982..9a4f868bf1e6 100644
--- a/drivers/hwmon/emc6w201.c
+++ b/drivers/hwmon/emc6w201.c
@@ -474,7 +474,7 @@ static struct i2c_driver emc6w201_driver = {
 	.driver = {
 		.name	= "emc6w201",
 	},
-	.probe_new	= emc6w201_probe,
+	.probe		= emc6w201_probe,
 	.id_table	= emc6w201_id,
 	.detect		= emc6w201_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/f75375s.c b/drivers/hwmon/f75375s.c
index 64fbb8cf687c..8c572bb64f5d 100644
--- a/drivers/hwmon/f75375s.c
+++ b/drivers/hwmon/f75375s.c
@@ -129,7 +129,7 @@ static struct i2c_driver f75375_driver = {
 	.driver = {
 		.name = "f75375",
 	},
-	.probe_new = f75375_probe,
+	.probe = f75375_probe,
 	.remove = f75375_remove,
 	.id_table = f75375_id,
 	.detect = f75375_detect,
diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
index e1f426e86f36..b30512a705a7 100644
--- a/drivers/hwmon/fschmd.c
+++ b/drivers/hwmon/fschmd.c
@@ -241,7 +241,7 @@ static struct i2c_driver fschmd_driver = {
 	.driver = {
 		.name	= "fschmd",
 	},
-	.probe_new	= fschmd_probe,
+	.probe		= fschmd_probe,
 	.remove		= fschmd_remove,
 	.id_table	= fschmd_id,
 	.detect		= fschmd_detect,
diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index 25afd9167a34..f1727b498c23 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -678,7 +678,7 @@ static struct i2c_driver fts_driver = {
 		.name = "ftsteutates",
 	},
 	.id_table = fts_id,
-	.probe_new = fts_probe,
+	.probe = fts_probe,
 	.detect = fts_detect,
 	.address_list = normal_i2c,
 };
diff --git a/drivers/hwmon/g760a.c b/drivers/hwmon/g760a.c
index 36717b524dbd..b5edee00267b 100644
--- a/drivers/hwmon/g760a.c
+++ b/drivers/hwmon/g760a.c
@@ -206,7 +206,7 @@ static struct i2c_driver g760a_driver = {
 	.driver = {
 		.name	= "g760a",
 	},
-	.probe_new = g760a_probe,
+	.probe = g760a_probe,
 	.id_table = g760a_id,
 };
 
diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 64a0599b2da5..87d3209569d6 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -1079,7 +1079,7 @@ static struct i2c_driver g762_driver = {
 		.name = DRVNAME,
 		.of_match_table = of_match_ptr(g762_dt_match),
 	},
-	.probe_new = g762_probe,
+	.probe = g762_probe,
 	.id_table = g762_id,
 };
 
diff --git a/drivers/hwmon/gl518sm.c b/drivers/hwmon/gl518sm.c
index 95286c40f55a..03db6158b13a 100644
--- a/drivers/hwmon/gl518sm.c
+++ b/drivers/hwmon/gl518sm.c
@@ -652,7 +652,7 @@ static struct i2c_driver gl518_driver = {
 	.driver = {
 		.name	= "gl518sm",
 	},
-	.probe_new	= gl518_probe,
+	.probe		= gl518_probe,
 	.id_table	= gl518_id,
 	.detect		= gl518_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/gl520sm.c b/drivers/hwmon/gl520sm.c
index 394da4ac977c..8bbc6a4f2928 100644
--- a/drivers/hwmon/gl520sm.c
+++ b/drivers/hwmon/gl520sm.c
@@ -895,7 +895,7 @@ static struct i2c_driver gl520_driver = {
 	.driver = {
 		.name	= "gl520sm",
 	},
-	.probe_new	= gl520_probe,
+	.probe		= gl520_probe,
 	.id_table	= gl520_id,
 	.detect		= gl520_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
index 3a7582824f94..a9726b5370fb 100644
--- a/drivers/hwmon/hih6130.c
+++ b/drivers/hwmon/hih6130.c
@@ -249,7 +249,7 @@ static struct i2c_driver hih6130_driver = {
 		.name = "hih6130",
 		.of_match_table = of_match_ptr(hih6130_of_match),
 	},
-	.probe_new   = hih6130_probe,
+	.probe       = hih6130_probe,
 	.id_table    = hih6130_id,
 };
 
diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index 9b58655d2de4..c558143e5285 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -594,7 +594,7 @@ static struct i2c_driver ina209_driver = {
 		.name	= "ina209",
 		.of_match_table = of_match_ptr(ina209_of_match),
 	},
-	.probe_new	= ina209_probe,
+	.probe		= ina209_probe,
 	.remove		= ina209_remove,
 	.id_table	= ina209_id,
 };
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 50eb9c5e132e..da723d33d307 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -633,7 +633,7 @@ static struct i2c_driver ina238_driver = {
 		.name	= "ina238",
 		.of_match_table = of_match_ptr(ina238_of_match),
 	},
-	.probe_new	= ina238_probe,
+	.probe		= ina238_probe,
 	.id_table	= ina238_id,
 };
 
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 00fc70305a89..90e5371b9a97 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -717,7 +717,7 @@ static struct i2c_driver ina2xx_driver = {
 		.name	= "ina2xx",
 		.of_match_table = of_match_ptr(ina2xx_of_match),
 	},
-	.probe_new	= ina2xx_probe,
+	.probe		= ina2xx_probe,
 	.id_table	= ina2xx_id,
 };
 
diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index f3a4c5633b1e..071f80115a35 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -1010,7 +1010,7 @@ static const struct i2c_device_id ina3221_ids[] = {
 MODULE_DEVICE_TABLE(i2c, ina3221_ids);
 
 static struct i2c_driver ina3221_i2c_driver = {
-	.probe_new = ina3221_probe,
+	.probe = ina3221_probe,
 	.remove = ina3221_remove,
 	.driver = {
 		.name = INA3221_DRIVER_NAME,
diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 8523bf974310..3f3a34fe9f7a 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -629,7 +629,7 @@ static struct i2c_driver jc42_driver = {
 		.pm = JC42_DEV_PM_OPS,
 		.of_match_table = of_match_ptr(jc42_of_ids),
 	},
-	.probe_new	= jc42_probe,
+	.probe		= jc42_probe,
 	.remove		= jc42_remove,
 	.id_table	= jc42_id,
 	.detect		= jc42_detect,
diff --git a/drivers/hwmon/lineage-pem.c b/drivers/hwmon/lineage-pem.c
index ef5a49cd9149..df69c380cde7 100644
--- a/drivers/hwmon/lineage-pem.c
+++ b/drivers/hwmon/lineage-pem.c
@@ -511,7 +511,7 @@ static struct i2c_driver pem_driver = {
 	.driver = {
 		   .name = "lineage_pem",
 		   },
-	.probe_new = pem_probe,
+	.probe = pem_probe,
 	.id_table = pem_id,
 };
 
diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 9ab2cab4c710..6972454eb4e0 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -1164,7 +1164,7 @@ static struct i2c_driver lm63_driver = {
 		.name	= "lm63",
 		.of_match_table = of_match_ptr(lm63_of_match),
 	},
-	.probe_new	= lm63_probe,
+	.probe		= lm63_probe,
 	.id_table	= lm63_id,
 	.detect		= lm63_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm73.c b/drivers/hwmon/lm73.c
index b6433ae2d75c..637d35c5ae23 100644
--- a/drivers/hwmon/lm73.c
+++ b/drivers/hwmon/lm73.c
@@ -277,7 +277,7 @@ static struct i2c_driver lm73_driver = {
 		.name	= "lm73",
 		.of_match_table = lm73_of_match,
 	},
-	.probe_new	= lm73_probe,
+	.probe		= lm73_probe,
 	.id_table	= lm73_ids,
 	.detect		= lm73_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index bcc3adcb3af1..3e5475a015d5 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -945,7 +945,7 @@ static struct i2c_driver lm75_driver = {
 		.of_match_table = of_match_ptr(lm75_of_match),
 		.pm	= LM75_DEV_PM_OPS,
 	},
-	.probe_new	= lm75_probe,
+	.probe		= lm75_probe,
 	.id_table	= lm75_ids,
 	.detect		= lm75_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm77.c b/drivers/hwmon/lm77.c
index 645cb2191abe..8b9862519178 100644
--- a/drivers/hwmon/lm77.c
+++ b/drivers/hwmon/lm77.c
@@ -348,7 +348,7 @@ static struct i2c_driver lm77_driver = {
 	.driver = {
 		.name	= "lm77",
 	},
-	.probe_new	= lm77_probe,
+	.probe		= lm77_probe,
 	.id_table	= lm77_id,
 	.detect		= lm77_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm78.c b/drivers/hwmon/lm78.c
index 694e171cab7f..b739c354311b 100644
--- a/drivers/hwmon/lm78.c
+++ b/drivers/hwmon/lm78.c
@@ -662,7 +662,7 @@ static struct i2c_driver lm78_driver = {
 	.driver = {
 		.name	= "lm78",
 	},
-	.probe_new	= lm78_i2c_probe,
+	.probe		= lm78_i2c_probe,
 	.id_table	= lm78_i2c_id,
 	.detect		= lm78_i2c_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
index 35db0b97f912..63c7831bd3e1 100644
--- a/drivers/hwmon/lm80.c
+++ b/drivers/hwmon/lm80.c
@@ -633,7 +633,7 @@ static struct i2c_driver lm80_driver = {
 	.driver = {
 		.name	= "lm80",
 	},
-	.probe_new	= lm80_probe,
+	.probe		= lm80_probe,
 	.id_table	= lm80_id,
 	.detect		= lm80_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index 616449f2cc50..bccd08099cb6 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -454,7 +454,7 @@ static struct i2c_driver lm83_driver = {
 	.driver = {
 		.name	= "lm83",
 	},
-	.probe_new	= lm83_probe,
+	.probe		= lm83_probe,
 	.id_table	= lm83_id,
 	.detect		= lm83_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 8d33c2484755..8540178f5b74 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -1698,7 +1698,7 @@ static struct i2c_driver lm85_driver = {
 		.name   = "lm85",
 		.of_match_table = of_match_ptr(lm85_of_match),
 	},
-	.probe_new	= lm85_probe,
+	.probe		= lm85_probe,
 	.id_table	= lm85_id,
 	.detect		= lm85_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index 818fb6195245..2195a735d28e 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -994,7 +994,7 @@ static struct i2c_driver lm87_driver = {
 		.name	= "lm87",
 		.of_match_table = lm87_of_match,
 	},
-	.probe_new	= lm87_probe,
+	.probe		= lm87_probe,
 	.id_table	= lm87_id,
 	.detect		= lm87_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 6498d5acf705..90101c236f35 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2972,7 +2972,7 @@ static struct i2c_driver lm90_driver = {
 		.of_match_table = of_match_ptr(lm90_of_match),
 		.pm	= pm_sleep_ptr(&lm90_pm_ops),
 	},
-	.probe_new	= lm90_probe,
+	.probe		= lm90_probe,
 	.alert		= lm90_alert,
 	.id_table	= lm90_id,
 	.detect		= lm90_detect,
diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index 2ff3044a677d..46579a3e1715 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -330,7 +330,7 @@ static struct i2c_driver lm92_driver = {
 	.driver = {
 		.name	= "lm92",
 	},
-	.probe_new	= lm92_probe,
+	.probe		= lm92_probe,
 	.id_table	= lm92_id,
 	.detect		= lm92_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index 4cf50d5f4f59..75bca805720e 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -2635,7 +2635,7 @@ static struct i2c_driver lm93_driver = {
 	.driver = {
 		.name	= "lm93",
 	},
-	.probe_new	= lm93_probe,
+	.probe		= lm93_probe,
 	.id_table	= lm93_id,
 	.detect		= lm93_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index b4a9d0c223c4..67b9d7636ee4 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -720,7 +720,7 @@ static struct i2c_driver lm95234_driver = {
 	.driver = {
 		.name	= DRVNAME,
 	},
-	.probe_new	= lm95234_probe,
+	.probe		= lm95234_probe,
 	.id_table	= lm95234_id,
 	.detect		= lm95234_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index f1ed777a8735..90a4305c790d 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -468,7 +468,7 @@ static struct i2c_driver lm95241_driver = {
 	.driver = {
 		.name	= DEVNAME,
 	},
-	.probe_new	= lm95241_probe,
+	.probe		= lm95241_probe,
 	.id_table	= lm95241_id,
 	.detect		= lm95241_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index c433f0af2d31..88600ba2f523 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -597,7 +597,7 @@ static struct i2c_driver lm95245_driver = {
 		.name	= "lm95245",
 		.of_match_table = of_match_ptr(lm95245_of_match),
 	},
-	.probe_new	= lm95245_probe,
+	.probe		= lm95245_probe,
 	.id_table	= lm95245_id,
 	.detect		= lm95245_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/ltc2945.c b/drivers/hwmon/ltc2945.c
index 3494f7261ebf..45b87a863cae 100644
--- a/drivers/hwmon/ltc2945.c
+++ b/drivers/hwmon/ltc2945.c
@@ -519,7 +519,7 @@ static struct i2c_driver ltc2945_driver = {
 		.name = "ltc2945",
 		.of_match_table = of_match_ptr(ltc2945_of_match),
 	},
-	.probe_new = ltc2945_probe,
+	.probe = ltc2945_probe,
 	.id_table = ltc2945_id,
 };
 
diff --git a/drivers/hwmon/ltc2947-i2c.c b/drivers/hwmon/ltc2947-i2c.c
index 96852bc8a964..33f574bf2ce7 100644
--- a/drivers/hwmon/ltc2947-i2c.c
+++ b/drivers/hwmon/ltc2947-i2c.c
@@ -38,7 +38,7 @@ static struct i2c_driver ltc2947_driver = {
 		.of_match_table = ltc2947_of_match,
 		.pm = pm_sleep_ptr(&ltc2947_pm_ops),
 	},
-	.probe_new = ltc2947_probe,
+	.probe = ltc2947_probe,
 	.id_table = ltc2947_id,
 };
 module_i2c_driver(ltc2947_driver);
diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index 689f788b8563..1ad362c0fd2c 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -268,7 +268,7 @@ static struct i2c_driver ltc2990_i2c_driver = {
 	.driver = {
 		.name = "ltc2990",
 	},
-	.probe_new = ltc2990_i2c_probe,
+	.probe = ltc2990_i2c_probe,
 	.id_table = ltc2990_i2c_id,
 };
 
diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index 69341de397cb..ef323f294dc4 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -928,7 +928,7 @@ static struct i2c_driver ltc2992_i2c_driver = {
 		.name = "ltc2992",
 		.of_match_table = ltc2992_of_match,
 	},
-	.probe_new = ltc2992_i2c_probe,
+	.probe = ltc2992_i2c_probe,
 	.id_table = ltc2992_i2c_id,
 };
 
diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index e3ac004c1ed1..f42ac3c9475e 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -205,7 +205,7 @@ static struct i2c_driver ltc4151_driver = {
 		.name	= "ltc4151",
 		.of_match_table = of_match_ptr(ltc4151_match),
 	},
-	.probe_new	= ltc4151_probe,
+	.probe		= ltc4151_probe,
 	.id_table	= ltc4151_id,
 };
 
diff --git a/drivers/hwmon/ltc4215.c b/drivers/hwmon/ltc4215.c
index fa43d26ddd4f..66fd28f713ab 100644
--- a/drivers/hwmon/ltc4215.c
+++ b/drivers/hwmon/ltc4215.c
@@ -255,7 +255,7 @@ static struct i2c_driver ltc4215_driver = {
 	.driver = {
 		.name	= "ltc4215",
 	},
-	.probe_new	= ltc4215_probe,
+	.probe		= ltc4215_probe,
 	.id_table	= ltc4215_id,
 };
 
diff --git a/drivers/hwmon/ltc4222.c b/drivers/hwmon/ltc4222.c
index d2027ca5c925..9098ef521739 100644
--- a/drivers/hwmon/ltc4222.c
+++ b/drivers/hwmon/ltc4222.c
@@ -210,7 +210,7 @@ static struct i2c_driver ltc4222_driver = {
 	.driver = {
 		   .name = "ltc4222",
 		   },
-	.probe_new = ltc4222_probe,
+	.probe = ltc4222_probe,
 	.id_table = ltc4222_id,
 };
 
diff --git a/drivers/hwmon/ltc4245.c b/drivers/hwmon/ltc4245.c
index 5088d28b3a7c..73c9bd67c383 100644
--- a/drivers/hwmon/ltc4245.c
+++ b/drivers/hwmon/ltc4245.c
@@ -479,7 +479,7 @@ static struct i2c_driver ltc4245_driver = {
 	.driver = {
 		.name	= "ltc4245",
 	},
-	.probe_new	= ltc4245_probe,
+	.probe		= ltc4245_probe,
 	.id_table	= ltc4245_id,
 };
 
diff --git a/drivers/hwmon/ltc4260.c b/drivers/hwmon/ltc4260.c
index 75e89cec381e..52f7a809b27b 100644
--- a/drivers/hwmon/ltc4260.c
+++ b/drivers/hwmon/ltc4260.c
@@ -173,7 +173,7 @@ static struct i2c_driver ltc4260_driver = {
 	.driver = {
 		   .name = "ltc4260",
 		   },
-	.probe_new = ltc4260_probe,
+	.probe = ltc4260_probe,
 	.id_table = ltc4260_id,
 };
 
diff --git a/drivers/hwmon/ltc4261.c b/drivers/hwmon/ltc4261.c
index b91cc4fe84e5..509e68176c7a 100644
--- a/drivers/hwmon/ltc4261.c
+++ b/drivers/hwmon/ltc4261.c
@@ -233,7 +233,7 @@ static struct i2c_driver ltc4261_driver = {
 	.driver = {
 		   .name = "ltc4261",
 		   },
-	.probe_new = ltc4261_probe,
+	.probe = ltc4261_probe,
 	.id_table = ltc4261_id,
 };
 
diff --git a/drivers/hwmon/max127.c b/drivers/hwmon/max127.c
index 0e21e7e6bbd2..6e32569a6c13 100644
--- a/drivers/hwmon/max127.c
+++ b/drivers/hwmon/max127.c
@@ -339,7 +339,7 @@ static struct i2c_driver max127_driver = {
 	.driver = {
 		.name	= "max127",
 	},
-	.probe_new	= max127_probe,
+	.probe		= max127_probe,
 	.id_table	= max127_id,
 };
 
diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index daa5d8af1e69..aa38c45adc09 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -600,7 +600,7 @@ static struct i2c_driver max16065_driver = {
 	.driver = {
 		.name = "max16065",
 	},
-	.probe_new = max16065_probe,
+	.probe = max16065_probe,
 	.id_table = max16065_id,
 };
 
diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 445c77197f69..500dc926a7a7 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -305,7 +305,7 @@ static struct i2c_driver max1619_driver = {
 		.name	= "max1619",
 		.of_match_table = of_match_ptr(max1619_of_match),
 	},
-	.probe_new	= max1619_probe,
+	.probe		= max1619_probe,
 	.id_table	= max1619_id,
 	.detect		= max1619_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index 9f748973d6a3..c4a02edefbee 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -435,7 +435,7 @@ static struct i2c_driver max1668_driver = {
 	.driver = {
 		  .name	= "max1668",
 		  },
-	.probe_new = max1668_probe,
+	.probe = max1668_probe,
 	.id_table = max1668_id,
 	.detect	= max1668_detect,
 	.address_list = max1668_addr_list,
diff --git a/drivers/hwmon/max31730.c b/drivers/hwmon/max31730.c
index 746a767c9fc6..c519002588ff 100644
--- a/drivers/hwmon/max31730.c
+++ b/drivers/hwmon/max31730.c
@@ -427,7 +427,7 @@ static struct i2c_driver max31730_driver = {
 		.of_match_table = of_match_ptr(max31730_of_match),
 		.pm	= pm_sleep_ptr(&max31730_pm_ops),
 	},
-	.probe_new	= max31730_probe,
+	.probe		= max31730_probe,
 	.id_table	= max31730_ids,
 	.detect		= max31730_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index 06d5f39dc33d..6a03c3e43f86 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -584,7 +584,7 @@ static struct i2c_driver max31760_driver = {
 		.of_match_table = max31760_of_match,
 		.pm = pm_ptr(&max31760_pm_ops)
 	},
-	.probe_new	= max31760_probe,
+	.probe		= max31760_probe,
 	.id_table	= max31760_id
 };
 module_i2c_driver(max31760_driver);
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 20bf5ffadefe..9816ed7ae91b 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -544,7 +544,7 @@ MODULE_DEVICE_TABLE(i2c, max31790_id);
 
 static struct i2c_driver max31790_driver = {
 	.class		= I2C_CLASS_HWMON,
-	.probe_new	= max31790_probe,
+	.probe		= max31790_probe,
 	.driver = {
 		.name	= "max31790",
 	},
diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 202b6438179d..09d456782d34 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -503,7 +503,7 @@ static struct i2c_driver max6620_driver = {
 	.driver = {
 		.name	= "max6620",
 	},
-	.probe_new	= max6620_probe,
+	.probe		= max6620_probe,
 	.id_table	= max6620_id,
 };
 
diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index 7821132e17fa..0ef73cd3e0c0 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -554,7 +554,7 @@ static struct i2c_driver max6621_driver = {
 		.name = MAX6621_DRV_NAME,
 		.of_match_table = of_match_ptr(max6621_of_match),
 	},
-	.probe_new	= max6621_probe,
+	.probe		= max6621_probe,
 	.id_table	= max6621_id,
 };
 
diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 9b895402c80d..caf527154fca 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -624,7 +624,7 @@ static struct i2c_driver max6639_driver = {
 		   .name = "max6639",
 		   .pm = pm_sleep_ptr(&max6639_pm_ops),
 		   },
-	.probe_new = max6639_probe,
+	.probe = max6639_probe,
 	.id_table = max6639_id,
 	.detect = max6639_detect,
 	.address_list = normal_i2c,
diff --git a/drivers/hwmon/max6642.c b/drivers/hwmon/max6642.c
index 47ea34ff78f3..8b2e4d6101a2 100644
--- a/drivers/hwmon/max6642.c
+++ b/drivers/hwmon/max6642.c
@@ -301,7 +301,7 @@ static struct i2c_driver max6642_driver = {
 	.driver = {
 		.name	= "max6642",
 	},
-	.probe_new	= max6642_probe,
+	.probe		= max6642_probe,
 	.id_table	= max6642_id,
 	.detect		= max6642_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index f8d4534ce172..3c3065b3b6ec 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -819,7 +819,7 @@ static struct i2c_driver max6650_driver = {
 		.name	= "max6650",
 		.of_match_table = of_match_ptr(max6650_dt_match),
 	},
-	.probe_new	= max6650_probe,
+	.probe		= max6650_probe,
 	.id_table	= max6650_id,
 };
 
diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 2895cea54193..3a67778f111c 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -786,7 +786,7 @@ static struct i2c_driver max6697_driver = {
 		.name	= "max6697",
 		.of_match_table = of_match_ptr(max6697_of_match),
 	},
-	.probe_new = max6697_probe,
+	.probe = max6697_probe,
 	.id_table = max6697_id,
 };
 
diff --git a/drivers/hwmon/mc34vr500.c b/drivers/hwmon/mc34vr500.c
index 6268e973049c..7e451b0ec725 100644
--- a/drivers/hwmon/mc34vr500.c
+++ b/drivers/hwmon/mc34vr500.c
@@ -251,7 +251,7 @@ static struct i2c_driver mc34vr500_driver = {
 		   .name = "mc34vr500",
 		   .of_match_table = of_match_ptr(mc34vr500_of_match),
 		    },
-	.probe_new = mc34vr500_probe,
+	.probe = mc34vr500_probe,
 	.id_table = mc34vr500_id,
 };
 
diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
index e093b1998296..f3761609f5ce 100644
--- a/drivers/hwmon/mcp3021.c
+++ b/drivers/hwmon/mcp3021.c
@@ -198,7 +198,7 @@ static struct i2c_driver mcp3021_driver = {
 		.name = "mcp3021",
 		.of_match_table = of_match_ptr(of_mcp3021_match),
 	},
-	.probe_new = mcp3021_probe,
+	.probe = mcp3021_probe,
 	.id_table = mcp3021_id,
 };
 
diff --git a/drivers/hwmon/nct6775-i2c.c b/drivers/hwmon/nct6775-i2c.c
index e1bcd1146191..8acd83e1e009 100644
--- a/drivers/hwmon/nct6775-i2c.c
+++ b/drivers/hwmon/nct6775-i2c.c
@@ -183,7 +183,7 @@ static struct i2c_driver nct6775_i2c_driver = {
 		.name = "nct6775-i2c",
 		.of_match_table = of_match_ptr(nct6775_i2c_of_match),
 	},
-	.probe_new = nct6775_i2c_probe,
+	.probe = nct6775_i2c_probe,
 	.id_table = nct6775_i2c_id,
 };
 
diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index a175f8283695..9339bfc02a3e 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -1223,7 +1223,7 @@ static struct i2c_driver nct7802_driver = {
 		.name = DRVNAME,
 	},
 	.detect = nct7802_detect,
-	.probe_new = nct7802_probe,
+	.probe = nct7802_probe,
 	.id_table = nct7802_idtable,
 	.address_list = nct7802_address_list,
 };
diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index ecc5db0011a3..8dbfe18ef3cd 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -1171,7 +1171,7 @@ static struct i2c_driver nct7904_driver = {
 	.driver = {
 		.name = "nct7904",
 	},
-	.probe_new = nct7904_probe,
+	.probe = nct7904_probe,
 	.id_table = nct7904_id,
 	.detect = nct7904_detect,
 	.address_list = normal_i2c,
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 9e1744fccb35..06095975f5c8 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -246,7 +246,7 @@ static struct i2c_driver p8_i2c_occ_driver = {
 		.name = "occ-hwmon",
 		.of_match_table = p8_i2c_occ_of_match,
 	},
-	.probe_new = p8_i2c_occ_probe,
+	.probe = p8_i2c_occ_probe,
 	.remove = p8_i2c_occ_remove,
 };
 
diff --git a/drivers/hwmon/pcf8591.c b/drivers/hwmon/pcf8591.c
index 1dbe209ae13f..66c76b28c9e0 100644
--- a/drivers/hwmon/pcf8591.c
+++ b/drivers/hwmon/pcf8591.c
@@ -294,7 +294,7 @@ static struct i2c_driver pcf8591_driver = {
 	.driver = {
 		.name	= "pcf8591",
 	},
-	.probe_new	= pcf8591_probe,
+	.probe		= pcf8591_probe,
 	.remove		= pcf8591_remove,
 	.id_table	= pcf8591_id,
 };
diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 1ac2b2f4c570..aba70330b319 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -502,7 +502,7 @@ static struct i2c_driver adm1266_driver = {
 		   .name = "adm1266",
 		   .of_match_table = adm1266_of_match,
 		  },
-	.probe_new = adm1266_probe,
+	.probe = adm1266_probe,
 	.id_table = adm1266_id,
 };
 
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 3b07bfb43e93..b358d137c76f 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -832,7 +832,7 @@ static struct i2c_driver adm1275_driver = {
 	.driver = {
 		   .name = "adm1275",
 		   },
-	.probe_new = adm1275_probe,
+	.probe = adm1275_probe,
 	.id_table = adm1275_id,
 };
 
diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
index 4100eefb7ac3..fa5070ae26bc 100644
--- a/drivers/hwmon/pmbus/bel-pfe.c
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -120,7 +120,7 @@ static struct i2c_driver pfe_pmbus_driver = {
 	.driver = {
 		   .name = "bel-pfe",
 	},
-	.probe_new = pfe_pmbus_probe,
+	.probe = pfe_pmbus_probe,
 	.id_table = pfe_device_id,
 };
 
diff --git a/drivers/hwmon/pmbus/bpa-rs600.c b/drivers/hwmon/pmbus/bpa-rs600.c
index f2d4e378a775..0dce26c35556 100644
--- a/drivers/hwmon/pmbus/bpa-rs600.c
+++ b/drivers/hwmon/pmbus/bpa-rs600.c
@@ -196,7 +196,7 @@ static struct i2c_driver bpa_rs600_driver = {
 		.name = "bpa-rs600",
 		.of_match_table = of_match_ptr(bpa_rs600_of_match),
 	},
-	.probe_new = bpa_rs600_probe,
+	.probe = bpa_rs600_probe,
 	.id_table = bpa_rs600_id,
 };
 
diff --git a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
index f546f0c12497..4dd3b6686d6a 100644
--- a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
+++ b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
@@ -119,7 +119,7 @@ static struct i2c_driver ahe50dc_fan_driver = {
 		   .name = "ahe50dc_fan",
 		   .of_match_table = of_match_ptr(ahe50dc_fan_of_match),
 	},
-	.probe_new = ahe50dc_fan_probe,
+	.probe = ahe50dc_fan_probe,
 	.id_table = ahe50dc_fan_id,
 };
 module_i2c_driver(ahe50dc_fan_driver);
diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
index d3941f6eb29a..f7ff3e4650b7 100644
--- a/drivers/hwmon/pmbus/dps920ab.c
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -195,7 +195,7 @@ static struct i2c_driver dps920ab_driver = {
 		   .name = "dps920ab",
 		   .of_match_table = of_match_ptr(dps920ab_of_match),
 	},
-	.probe_new = dps920ab_probe,
+	.probe = dps920ab_probe,
 };
 
 module_i2c_driver(dps920ab_driver);
diff --git a/drivers/hwmon/pmbus/fsp-3y.c b/drivers/hwmon/pmbus/fsp-3y.c
index aec294cc72d1..31594ba37ad7 100644
--- a/drivers/hwmon/pmbus/fsp-3y.c
+++ b/drivers/hwmon/pmbus/fsp-3y.c
@@ -283,7 +283,7 @@ static struct i2c_driver fsp3y_driver = {
 	.driver = {
 		   .name = "fsp3y",
 		   },
-	.probe_new = fsp3y_probe,
+	.probe = fsp3y_probe,
 	.id_table = fsp3y_id
 };
 
diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index e3294a1a54bb..567058817c17 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -641,7 +641,7 @@ static struct i2c_driver ibm_cffps_driver = {
 		.name = "ibm-cffps",
 		.of_match_table = ibm_cffps_of_match,
 	},
-	.probe_new = ibm_cffps_probe,
+	.probe = ibm_cffps_probe,
 	.id_table = ibm_cffps_id,
 };
 
diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index 0f614e8d95f6..dfeae68b5e52 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -215,7 +215,7 @@ static struct i2c_driver ipsps_driver = {
 		.name = "inspur-ipsps",
 		.of_match_table = of_match_ptr(ipsps_of_match),
 	},
-	.probe_new = ipsps_probe,
+	.probe = ipsps_probe,
 	.id_table = ipsps_id,
 };
 
diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index a6cf98e49666..e3ee5c1bd967 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -136,7 +136,7 @@ static struct i2c_driver ir35221_driver = {
 	.driver = {
 		.name	= "ir35221",
 	},
-	.probe_new	= ir35221_probe,
+	.probe		= ir35221_probe,
 	.id_table	= ir35221_id,
 };
 
diff --git a/drivers/hwmon/pmbus/ir36021.c b/drivers/hwmon/pmbus/ir36021.c
index 4dca4767f571..382ba6b6031a 100644
--- a/drivers/hwmon/pmbus/ir36021.c
+++ b/drivers/hwmon/pmbus/ir36021.c
@@ -68,7 +68,7 @@ static struct i2c_driver ir36021_driver = {
 		.name = "ir36021",
 		.of_match_table = of_match_ptr(ir36021_of_id),
 	},
-	.probe_new = ir36021_probe,
+	.probe = ir36021_probe,
 	.id_table = ir36021_id,
 };
 
diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 09276e397194..871c322d3d51 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -78,7 +78,7 @@ static struct i2c_driver ir38064_driver = {
 		   .name = "ir38064",
 		   .of_match_table = of_match_ptr(ir38064_of_match),
 		   },
-	.probe_new = ir38064_probe,
+	.probe = ir38064_probe,
 	.id_table = ir38064_id,
 };
 
diff --git a/drivers/hwmon/pmbus/irps5401.c b/drivers/hwmon/pmbus/irps5401.c
index de3449e4d77a..146d32a35a7c 100644
--- a/drivers/hwmon/pmbus/irps5401.c
+++ b/drivers/hwmon/pmbus/irps5401.c
@@ -54,7 +54,7 @@ static struct i2c_driver irps5401_driver = {
 	.driver = {
 		   .name = "irps5401",
 		   },
-	.probe_new = irps5401_probe,
+	.probe = irps5401_probe,
 	.id_table = irps5401_id,
 };
 
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 1a8caff1ac5f..7e53fb1d5ea3 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -323,7 +323,7 @@ static struct i2c_driver isl68137_driver = {
 	.driver = {
 		   .name = "isl68137",
 		   },
-	.probe_new = isl68137_probe,
+	.probe = isl68137_probe,
 	.id_table = raa_dmpvr_id,
 };
 
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 09792cd03d9f..929fa6d34efd 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -568,7 +568,7 @@ static struct i2c_driver lm25066_driver = {
 		   .name = "lm25066",
 		   .of_match_table = of_match_ptr(lm25066_of_match),
 	},
-	.probe_new = lm25066_probe,
+	.probe = lm25066_probe,
 	.id_table = lm25066_id,
 };
 
diff --git a/drivers/hwmon/pmbus/lt7182s.c b/drivers/hwmon/pmbus/lt7182s.c
index 4cfe476fc92d..28afc5f15ae8 100644
--- a/drivers/hwmon/pmbus/lt7182s.c
+++ b/drivers/hwmon/pmbus/lt7182s.c
@@ -183,7 +183,7 @@ static struct i2c_driver lt7182s_driver = {
 		.name = "lt7182s",
 		.of_match_table = of_match_ptr(lt7182s_of_match),
 	},
-	.probe_new = lt7182s_probe,
+	.probe = lt7182s_probe,
 	.id_table = lt7182s_id,
 };
 
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 91df8e895147..73a86f4d6472 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -927,7 +927,7 @@ static struct i2c_driver ltc2978_driver = {
 		   .name = "ltc2978",
 		   .of_match_table = of_match_ptr(ltc2978_of_match),
 		   },
-	.probe_new = ltc2978_probe,
+	.probe = ltc2978_probe,
 	.id_table = ltc2978_id,
 };
 
diff --git a/drivers/hwmon/pmbus/ltc3815.c b/drivers/hwmon/pmbus/ltc3815.c
index 8e13a7ddcb42..f2023b17aa8d 100644
--- a/drivers/hwmon/pmbus/ltc3815.c
+++ b/drivers/hwmon/pmbus/ltc3815.c
@@ -199,7 +199,7 @@ static struct i2c_driver ltc3815_driver = {
 	.driver = {
 		   .name = "ltc3815",
 		   },
-	.probe_new = ltc3815_probe,
+	.probe = ltc3815_probe,
 	.id_table = ltc3815_id,
 };
 
diff --git a/drivers/hwmon/pmbus/max15301.c b/drivers/hwmon/pmbus/max15301.c
index 0b6f88428ea8..2cfaa62aedd6 100644
--- a/drivers/hwmon/pmbus/max15301.c
+++ b/drivers/hwmon/pmbus/max15301.c
@@ -178,7 +178,7 @@ static struct i2c_driver max15301_driver = {
 	.driver = {
 		   .name = "max15301",
 		   },
-	.probe_new = max15301_probe,
+	.probe = max15301_probe,
 	.id_table = max15301_id,
 };
 
diff --git a/drivers/hwmon/pmbus/max16064.c b/drivers/hwmon/pmbus/max16064.c
index 94f869039071..a573a0ab9e48 100644
--- a/drivers/hwmon/pmbus/max16064.c
+++ b/drivers/hwmon/pmbus/max16064.c
@@ -102,7 +102,7 @@ static struct i2c_driver max16064_driver = {
 	.driver = {
 		   .name = "max16064",
 		   },
-	.probe_new = max16064_probe,
+	.probe = max16064_probe,
 	.id_table = max16064_id,
 };
 
diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index 6724f723f74c..9b0177409109 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -357,7 +357,7 @@ static struct i2c_driver max16601_driver = {
 	.driver = {
 		   .name = "max16601",
 		   },
-	.probe_new = max16601_probe,
+	.probe = max16601_probe,
 	.id_table = max16601_id,
 };
 
diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index ba39f03c6374..7bcf27995033 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -776,7 +776,7 @@ static struct i2c_driver max20730_driver = {
 		.name = "max20730",
 		.of_match_table = max20730_of_match,
 	},
-	.probe_new = max20730_probe,
+	.probe = max20730_probe,
 	.id_table = max20730_id,
 };
 
diff --git a/drivers/hwmon/pmbus/max20751.c b/drivers/hwmon/pmbus/max20751.c
index 2272dc8c2e38..6ebd71cd081b 100644
--- a/drivers/hwmon/pmbus/max20751.c
+++ b/drivers/hwmon/pmbus/max20751.c
@@ -42,7 +42,7 @@ static struct i2c_driver max20751_driver = {
 	.driver = {
 		   .name = "max20751",
 		   },
-	.probe_new = max20751_probe,
+	.probe = max20751_probe,
 	.id_table = max20751_id,
 };
 
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 95d79a64b483..f9aa576495a5 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -394,7 +394,7 @@ static struct i2c_driver max31785_driver = {
 		.name = "max31785",
 		.of_match_table = max31785_of_match,
 	},
-	.probe_new = max31785_probe,
+	.probe = max31785_probe,
 	.id_table = max31785_id,
 };
 
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index ea7609058a12..fe7f6b1b0985 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -520,7 +520,7 @@ static struct i2c_driver max34440_driver = {
 	.driver = {
 		   .name = "max34440",
 		   },
-	.probe_new = max34440_probe,
+	.probe = max34440_probe,
 	.id_table = max34440_id,
 };
 
diff --git a/drivers/hwmon/pmbus/max8688.c b/drivers/hwmon/pmbus/max8688.c
index 5e66c28c0b71..ae8573fdf5ba 100644
--- a/drivers/hwmon/pmbus/max8688.c
+++ b/drivers/hwmon/pmbus/max8688.c
@@ -182,7 +182,7 @@ static struct i2c_driver max8688_driver = {
 	.driver = {
 		   .name = "max8688",
 		   },
-	.probe_new = max8688_probe,
+	.probe = max8688_probe,
 	.id_table = max8688_id,
 };
 
diff --git a/drivers/hwmon/pmbus/mp2888.c b/drivers/hwmon/pmbus/mp2888.c
index 24e5194706cf..50662ed8e3d5 100644
--- a/drivers/hwmon/pmbus/mp2888.c
+++ b/drivers/hwmon/pmbus/mp2888.c
@@ -395,7 +395,7 @@ static struct i2c_driver mp2888_driver = {
 		.name = "mp2888",
 		.of_match_table = of_match_ptr(mp2888_of_match),
 	},
-	.probe_new = mp2888_probe,
+	.probe = mp2888_probe,
 	.id_table = mp2888_id,
 };
 
diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 51986adfbf47..2109b0458a8b 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -757,7 +757,7 @@ static struct i2c_driver mp2975_driver = {
 		.name = "mp2975",
 		.of_match_table = of_match_ptr(mp2975_of_match),
 	},
-	.probe_new = mp2975_probe,
+	.probe = mp2975_probe,
 	.id_table = mp2975_id,
 };
 
diff --git a/drivers/hwmon/pmbus/mp5023.c b/drivers/hwmon/pmbus/mp5023.c
index 791a06c3c54a..c4c4324d2b74 100644
--- a/drivers/hwmon/pmbus/mp5023.c
+++ b/drivers/hwmon/pmbus/mp5023.c
@@ -56,7 +56,7 @@ static struct i2c_driver mp5023_driver = {
 		   .name = "mp5023",
 		   .of_match_table = of_match_ptr(mp5023_of_match),
 	},
-	.probe_new = mp5023_probe,
+	.probe = mp5023_probe,
 };
 
 module_i2c_driver(mp5023_driver);
diff --git a/drivers/hwmon/pmbus/mpq7932.c b/drivers/hwmon/pmbus/mpq7932.c
index ff939881dc3b..865d42edda1a 100644
--- a/drivers/hwmon/pmbus/mpq7932.c
+++ b/drivers/hwmon/pmbus/mpq7932.c
@@ -145,7 +145,7 @@ static struct i2c_driver mpq7932_regulator_driver = {
 		.name = "mpq7932",
 		.of_match_table = mpq7932_of_match,
 	},
-	.probe_new = mpq7932_probe,
+	.probe = mpq7932_probe,
 	.id_table = mpq7932_id,
 };
 module_i2c_driver(mpq7932_regulator_driver);
diff --git a/drivers/hwmon/pmbus/pim4328.c b/drivers/hwmon/pmbus/pim4328.c
index 273ff6e57654..31d9ae06379a 100644
--- a/drivers/hwmon/pmbus/pim4328.c
+++ b/drivers/hwmon/pmbus/pim4328.c
@@ -221,7 +221,7 @@ static struct i2c_driver pim4328_driver = {
 	.driver = {
 		   .name = "pim4328",
 		   },
-	.probe_new = pim4328_probe,
+	.probe = pim4328_probe,
 	.id_table = pim4328_id,
 };
 
diff --git a/drivers/hwmon/pmbus/pli1209bc.c b/drivers/hwmon/pmbus/pli1209bc.c
index 05b4ee35ba27..7d8bd3167b21 100644
--- a/drivers/hwmon/pmbus/pli1209bc.c
+++ b/drivers/hwmon/pmbus/pli1209bc.c
@@ -134,7 +134,7 @@ static struct i2c_driver pli1209bc_driver = {
 		   .name = "pli1209bc",
 		   .of_match_table = of_match_ptr(pli1209bc_of_match),
 		   },
-	.probe_new = pli1209bc_probe,
+	.probe = pli1209bc_probe,
 	.id_table = pli1209bc_id,
 };
 
diff --git a/drivers/hwmon/pmbus/pm6764tr.c b/drivers/hwmon/pmbus/pm6764tr.c
index e0bbc8a30d21..2a16504c85b7 100644
--- a/drivers/hwmon/pmbus/pm6764tr.c
+++ b/drivers/hwmon/pmbus/pm6764tr.c
@@ -64,7 +64,7 @@ static struct i2c_driver pm6764tr_driver = {
 		   .name = "pm6764tr",
 		   .of_match_table = of_match_ptr(pm6764tr_of_match),
 		   },
-	.probe_new = pm6764tr_probe,
+	.probe = pm6764tr_probe,
 	.id_table = pm6764tr_id,
 };
 
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index d0d386990af5..ec40c5c59954 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -252,7 +252,7 @@ static struct i2c_driver pmbus_driver = {
 	.driver = {
 		   .name = "pmbus",
 		   },
-	.probe_new = pmbus_probe,
+	.probe = pmbus_probe,
 	.id_table = pmbus_id,
 };
 
diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
index 52bee5de2988..e2790a682dc8 100644
--- a/drivers/hwmon/pmbus/pxe1610.c
+++ b/drivers/hwmon/pmbus/pxe1610.c
@@ -139,7 +139,7 @@ static struct i2c_driver pxe1610_driver = {
 	.driver = {
 			.name = "pxe1610",
 			},
-	.probe_new = pxe1610_probe,
+	.probe = pxe1610_probe,
 	.id_table = pxe1610_id,
 };
 
diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index d3ba12951324..b830f3b02bcc 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -412,7 +412,7 @@ static struct i2c_driver q54sj108a2_driver = {
 		.name = "q54sj108a2",
 		.of_match_table = q54sj108a2_of_match,
 	},
-	.probe_new = q54sj108a2_probe,
+	.probe = q54sj108a2_probe,
 	.id_table = q54sj108a2_id,
 };
 
diff --git a/drivers/hwmon/pmbus/stpddc60.c b/drivers/hwmon/pmbus/stpddc60.c
index 357b9d9d896b..be9076dcc2db 100644
--- a/drivers/hwmon/pmbus/stpddc60.c
+++ b/drivers/hwmon/pmbus/stpddc60.c
@@ -237,7 +237,7 @@ static struct i2c_driver stpddc60_driver = {
 	.driver = {
 		   .name = "stpddc60",
 		   },
-	.probe_new = stpddc60_probe,
+	.probe = stpddc60_probe,
 	.id_table = stpddc60_id,
 };
 
diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
index c3e781319cd1..450b0273fb59 100644
--- a/drivers/hwmon/pmbus/tda38640.c
+++ b/drivers/hwmon/pmbus/tda38640.c
@@ -62,7 +62,7 @@ static struct i2c_driver tda38640_driver = {
 		.name = "tda38640",
 		.of_match_table = of_match_ptr(tda38640_of_match),
 	},
-	.probe_new = tda38640_probe,
+	.probe = tda38640_probe,
 	.id_table = tda38640_id,
 };
 
diff --git a/drivers/hwmon/pmbus/tps40422.c b/drivers/hwmon/pmbus/tps40422.c
index 31bb83c0ef3e..ea0074a6b9fc 100644
--- a/drivers/hwmon/pmbus/tps40422.c
+++ b/drivers/hwmon/pmbus/tps40422.c
@@ -42,7 +42,7 @@ static struct i2c_driver tps40422_driver = {
 	.driver = {
 		   .name = "tps40422",
 		   },
-	.probe_new = tps40422_probe,
+	.probe = tps40422_probe,
 	.id_table = tps40422_id,
 };
 
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 81b9d813655a..ef99005a3af5 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -299,7 +299,7 @@ static struct i2c_driver tps53679_driver = {
 		.name = "tps53679",
 		.of_match_table = of_match_ptr(tps53679_of_match),
 	},
-	.probe_new = tps53679_probe,
+	.probe = tps53679_probe,
 	.id_table = tps53679_id,
 };
 
diff --git a/drivers/hwmon/pmbus/tps546d24.c b/drivers/hwmon/pmbus/tps546d24.c
index 435f94304ad8..69bbdb6c680b 100644
--- a/drivers/hwmon/pmbus/tps546d24.c
+++ b/drivers/hwmon/pmbus/tps546d24.c
@@ -59,7 +59,7 @@ static struct i2c_driver tps546d24_driver = {
 		   .name = "tps546d24",
 		   .of_match_table = of_match_ptr(tps546d24_of_match),
 	   },
-	.probe_new = tps546d24_probe,
+	.probe = tps546d24_probe,
 	.id_table = tps546d24_id,
 };
 
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 3daaf2237832..ba712ff7666f 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -695,7 +695,7 @@ static struct i2c_driver ucd9000_driver = {
 		.name = "ucd9000",
 		.of_match_table = of_match_ptr(ucd9000_of_match),
 	},
-	.probe_new = ucd9000_probe,
+	.probe = ucd9000_probe,
 	.id_table = ucd9000_id,
 };
 
diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index 3ad375a76f3e..a82847945508 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -200,7 +200,7 @@ static struct i2c_driver ucd9200_driver = {
 		.name = "ucd9200",
 		.of_match_table = of_match_ptr(ucd9200_of_match),
 	},
-	.probe_new = ucd9200_probe,
+	.probe = ucd9200_probe,
 	.id_table = ucd9200_id,
 };
 
diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index 32bc7736d609..37d08dd427d5 100644
--- a/drivers/hwmon/pmbus/xdpe12284.c
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -185,7 +185,7 @@ static struct i2c_driver xdpe122_driver = {
 		.name = "xdpe12284",
 		.of_match_table = of_match_ptr(xdpe122_of_match),
 	},
-	.probe_new = xdpe122_probe,
+	.probe = xdpe122_probe,
 	.id_table = xdpe122_id,
 };
 
diff --git a/drivers/hwmon/pmbus/xdpe152c4.c b/drivers/hwmon/pmbus/xdpe152c4.c
index b8a36ef73e45..235e6b41ae4c 100644
--- a/drivers/hwmon/pmbus/xdpe152c4.c
+++ b/drivers/hwmon/pmbus/xdpe152c4.c
@@ -63,7 +63,7 @@ static struct i2c_driver xdpe152_driver = {
 		.name = "xdpe152c4",
 		.of_match_table = of_match_ptr(xdpe152_of_match),
 	},
-	.probe_new = xdpe152_probe,
+	.probe = xdpe152_probe,
 	.id_table = xdpe152_id,
 };
 
diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index e9df0c56d91e..83458df0d0cf 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -461,7 +461,7 @@ static struct i2c_driver zl6100_driver = {
 	.driver = {
 		   .name = "zl6100",
 		   },
-	.probe_new = zl6100_probe,
+	.probe = zl6100_probe,
 	.id_table = zl6100_id,
 };
 
diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index f77dc6db31ac..b868f17ad1bc 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -327,7 +327,7 @@ static struct i2c_driver powr1220_driver = {
 	.driver = {
 		.name	= "powr1220",
 	},
-	.probe_new	= powr1220_probe,
+	.probe		= powr1220_probe,
 	.id_table	= powr1220_ids,
 };
 
diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
index 8ea5a4d3219f..8991653050a4 100644
--- a/drivers/hwmon/sbrmi.c
+++ b/drivers/hwmon/sbrmi.c
@@ -347,7 +347,7 @@ static struct i2c_driver sbrmi_driver = {
 		.name = "sbrmi",
 		.of_match_table = of_match_ptr(sbrmi_of_match),
 	},
-	.probe_new = sbrmi_probe,
+	.probe = sbrmi_probe,
 	.id_table = sbrmi_id,
 };
 
diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index 4c37de846f93..220f1be05b11 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -238,7 +238,7 @@ static struct i2c_driver sbtsi_driver = {
 		.name = "sbtsi",
 		.of_match_table = of_match_ptr(sbtsi_of_match),
 	},
-	.probe_new = sbtsi_probe,
+	.probe = sbtsi_probe,
 	.id_table = sbtsi_id,
 };
 
diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
index f50b90198f23..55c179475208 100644
--- a/drivers/hwmon/sht21.c
+++ b/drivers/hwmon/sht21.c
@@ -285,7 +285,7 @@ MODULE_DEVICE_TABLE(i2c, sht21_id);
 
 static struct i2c_driver sht21_driver = {
 	.driver.name = "sht21",
-	.probe_new   = sht21_probe,
+	.probe       = sht21_probe,
 	.id_table    = sht21_id,
 };
 
diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 8305e44d9ab2..1dab3002728b 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -743,7 +743,7 @@ MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
 static struct i2c_driver sht3x_i2c_driver = {
 	.driver.name = "sht3x",
-	.probe_new   = sht3x_probe,
+	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
 
diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 13e042927bf8..d0cf018b5e75 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -291,7 +291,7 @@ static struct i2c_driver sht4x_driver = {
 		.name = "sht4x",
 		.of_match_table = sht4x_of_match,
 	},
-	.probe_new	= sht4x_probe,
+	.probe		= sht4x_probe,
 	.id_table	= sht4x_id,
 };
 
diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
index 18546ebc8e9f..1f96e94967ee 100644
--- a/drivers/hwmon/shtc1.c
+++ b/drivers/hwmon/shtc1.c
@@ -279,7 +279,7 @@ static struct i2c_driver shtc1_i2c_driver = {
 		.name = "shtc1",
 		.of_match_table = shtc1_of_match,
 	},
-	.probe_new    = shtc1_probe,
+	.probe        = shtc1_probe,
 	.id_table     = shtc1_id,
 };
 
diff --git a/drivers/hwmon/smm665.c b/drivers/hwmon/smm665.c
index c36bdbe423de..026c76f8c22e 100644
--- a/drivers/hwmon/smm665.c
+++ b/drivers/hwmon/smm665.c
@@ -694,7 +694,7 @@ static struct i2c_driver smm665_driver = {
 	.driver = {
 		   .name = "smm665",
 		   },
-	.probe_new = smm665_probe,
+	.probe = smm665_probe,
 	.remove = smm665_remove,
 	.id_table = smm665_id,
 };
diff --git a/drivers/hwmon/smsc47m192.c b/drivers/hwmon/smsc47m192.c
index 70d2152234e2..d20800a1f02b 100644
--- a/drivers/hwmon/smsc47m192.c
+++ b/drivers/hwmon/smsc47m192.c
@@ -628,7 +628,7 @@ static struct i2c_driver smsc47m192_driver = {
 	.driver = {
 		.name	= "smsc47m192",
 	},
-	.probe_new	= smsc47m192_probe,
+	.probe		= smsc47m192_probe,
 	.id_table	= smsc47m192_id,
 	.detect		= smsc47m192_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
index 2f67c6747ead..847c99376930 100644
--- a/drivers/hwmon/stts751.c
+++ b/drivers/hwmon/stts751.c
@@ -821,7 +821,7 @@ static struct i2c_driver stts751_driver = {
 		.name	= DEVNAME,
 		.of_match_table = of_match_ptr(stts751_of_match),
 	},
-	.probe_new	= stts751_probe,
+	.probe		= stts751_probe,
 	.id_table	= stts751_id,
 	.detect		= stts751_detect,
 	.alert		= stts751_alert,
diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index 54cd33d09688..42a9658f1bc2 100644
--- a/drivers/hwmon/tc654.c
+++ b/drivers/hwmon/tc654.c
@@ -561,7 +561,7 @@ static struct i2c_driver tc654_driver = {
 	.driver = {
 		   .name = "tc654",
 		   },
-	.probe_new = tc654_probe,
+	.probe = tc654_probe,
 	.id_table = tc654_id,
 };
 
diff --git a/drivers/hwmon/tc74.c b/drivers/hwmon/tc74.c
index ace55da97fc2..03950670bd78 100644
--- a/drivers/hwmon/tc74.c
+++ b/drivers/hwmon/tc74.c
@@ -160,7 +160,7 @@ static struct i2c_driver tc74_driver = {
 	.driver = {
 		.name	= "tc74",
 	},
-	.probe_new = tc74_probe,
+	.probe = tc74_probe,
 	.id_table = tc74_id,
 };
 
diff --git a/drivers/hwmon/thmc50.c b/drivers/hwmon/thmc50.c
index 81cdb012993c..68ba26bc9014 100644
--- a/drivers/hwmon/thmc50.c
+++ b/drivers/hwmon/thmc50.c
@@ -420,7 +420,7 @@ static struct i2c_driver thmc50_driver = {
 	.driver = {
 		.name = "thmc50",
 	},
-	.probe_new = thmc50_probe,
+	.probe = thmc50_probe,
 	.id_table = thmc50_id,
 	.detect = thmc50_detect,
 	.address_list = normal_i2c,
diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 2bf496a62206..93421f7ed221 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -301,7 +301,7 @@ static struct i2c_driver tmp102_driver = {
 	.driver.name	= DRIVER_NAME,
 	.driver.of_match_table = of_match_ptr(tmp102_of_match),
 	.driver.pm	= pm_sleep_ptr(&tmp102_dev_pm_ops),
-	.probe_new	= tmp102_probe,
+	.probe		= tmp102_probe,
 	.id_table	= tmp102_id,
 };
 
diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
index 56d5cbf36a45..6c90c1b45590 100644
--- a/drivers/hwmon/tmp103.c
+++ b/drivers/hwmon/tmp103.c
@@ -214,7 +214,7 @@ static struct i2c_driver tmp103_driver = {
 		.of_match_table = of_match_ptr(tmp103_of_match),
 		.pm	= pm_sleep_ptr(&tmp103_dev_pm_ops),
 	},
-	.probe_new	= tmp103_probe,
+	.probe		= tmp103_probe,
 	.id_table	= tmp103_id,
 };
 
diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index acb4ba750b09..4ecd8ddc6427 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -432,7 +432,7 @@ static struct i2c_driver tmp108_driver = {
 		.pm	= pm_sleep_ptr(&tmp108_dev_pm_ops),
 		.of_match_table = of_match_ptr(tmp108_of_ids),
 	},
-	.probe_new	= tmp108_probe,
+	.probe		= tmp108_probe,
 	.id_table	= tmp108_i2c_ids,
 };
 
diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index f358ba679626..91f2314568cf 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -766,7 +766,7 @@ static struct i2c_driver tmp401_driver = {
 		.name	= "tmp401",
 		.of_match_table = of_match_ptr(tmp4xx_of_match),
 	},
-	.probe_new	= tmp401_probe,
+	.probe		= tmp401_probe,
 	.id_table	= tmp401_id,
 	.detect		= tmp401_detect,
 	.address_list	= normal_i2c,
diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 45fd7fb5ee01..3cde3916ab6d 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -487,7 +487,7 @@ static struct i2c_driver tmp421_driver = {
 		.name	= "tmp421",
 		.of_match_table = of_match_ptr(tmp421_of_match),
 	},
-	.probe_new = tmp421_probe,
+	.probe = tmp421_probe,
 	.id_table = tmp421_id,
 	.detect = tmp421_detect,
 	.address_list = normal_i2c,
diff --git a/drivers/hwmon/tmp464.c b/drivers/hwmon/tmp464.c
index 7814f39bd1a3..e96050384ee8 100644
--- a/drivers/hwmon/tmp464.c
+++ b/drivers/hwmon/tmp464.c
@@ -699,7 +699,7 @@ static struct i2c_driver tmp464_driver = {
 		.name	= "tmp464",
 		.of_match_table = of_match_ptr(tmp464_of_match),
 	},
-	.probe_new = tmp464_probe,
+	.probe = tmp464_probe,
 	.id_table = tmp464_id,
 	.detect = tmp464_detect,
 	.address_list = normal_i2c,
diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 7d5f7441aceb..099ef3a37e3e 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -760,7 +760,7 @@ static struct i2c_driver tmp51x_driver = {
 		.name	= "tmp51x",
 		.of_match_table = tmp51x_of_match,
 	},
-	.probe_new	= tmp51x_probe,
+	.probe		= tmp51x_probe,
 	.id_table	= tmp51x_id,
 };
 
diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
index 68c77c493270..bc6a55c6a4a2 100644
--- a/drivers/hwmon/tps23861.c
+++ b/drivers/hwmon/tps23861.c
@@ -581,7 +581,7 @@ static const struct of_device_id __maybe_unused tps23861_of_match[] = {
 MODULE_DEVICE_TABLE(of, tps23861_of_match);
 
 static struct i2c_driver tps23861_driver = {
-	.probe_new		= tps23861_probe,
+	.probe			= tps23861_probe,
 	.remove			= tps23861_remove,
 	.driver = {
 		.name		= "tps23861",
diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
index 88d11dc5feb9..6dc0c831711f 100644
--- a/drivers/hwmon/w83773g.c
+++ b/drivers/hwmon/w83773g.c
@@ -295,7 +295,7 @@ static struct i2c_driver w83773_driver = {
 		.name	= "w83773g",
 		.of_match_table = of_match_ptr(w83773_of_match),
 	},
-	.probe_new = w83773_probe,
+	.probe = w83773_probe,
 	.id_table = w83773_id,
 };
 
diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index dacabf25e83f..b33f382f238d 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -1585,7 +1585,7 @@ static struct i2c_driver w83781d_driver = {
 		.name = "w83781d",
 		.of_match_table = w83781d_of_match,
 	},
-	.probe_new	= w83781d_probe,
+	.probe		= w83781d_probe,
 	.remove		= w83781d_remove,
 	.id_table	= w83781d_ids,
 	.detect		= w83781d_detect,
diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index eaf691365023..9681eaa06c8e 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -338,7 +338,7 @@ static struct i2c_driver w83791d_driver = {
 	.driver = {
 		.name = "w83791d",
 	},
-	.probe_new	= w83791d_probe,
+	.probe		= w83791d_probe,
 	.remove		= w83791d_remove,
 	.id_table	= w83791d_id,
 	.detect		= w83791d_detect,
diff --git a/drivers/hwmon/w83792d.c b/drivers/hwmon/w83792d.c
index 6d160eee1446..69ce379a9e13 100644
--- a/drivers/hwmon/w83792d.c
+++ b/drivers/hwmon/w83792d.c
@@ -306,7 +306,7 @@ static struct i2c_driver w83792d_driver = {
 	.driver = {
 		.name = "w83792d",
 	},
-	.probe_new	= w83792d_probe,
+	.probe		= w83792d_probe,
 	.remove		= w83792d_remove,
 	.id_table	= w83792d_id,
 	.detect		= w83792d_detect,
diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index a4926d907198..96bab94ba899 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -301,7 +301,7 @@ static struct i2c_driver w83793_driver = {
 	.driver = {
 		   .name = "w83793",
 	},
-	.probe_new	= w83793_probe,
+	.probe		= w83793_probe,
 	.remove		= w83793_remove,
 	.id_table	= w83793_id,
 	.detect		= w83793_detect,
diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
index 84ff5c57e98c..c446e00db658 100644
--- a/drivers/hwmon/w83795.c
+++ b/drivers/hwmon/w83795.c
@@ -2255,7 +2255,7 @@ static struct i2c_driver w83795_driver = {
 	.driver = {
 		   .name = "w83795",
 	},
-	.probe_new	= w83795_probe,
+	.probe		= w83795_probe,
 	.remove		= w83795_remove,
 	.id_table	= w83795_id,
 
diff --git a/drivers/hwmon/w83l785ts.c b/drivers/hwmon/w83l785ts.c
index f3622de0d96f..9c11ed69c055 100644
--- a/drivers/hwmon/w83l785ts.c
+++ b/drivers/hwmon/w83l785ts.c
@@ -84,7 +84,7 @@ static struct i2c_driver w83l785ts_driver = {
 	.driver = {
 		.name	= "w83l785ts",
 	},
-	.probe_new	= w83l785ts_probe,
+	.probe		= w83l785ts_probe,
 	.remove		= w83l785ts_remove,
 	.id_table	= w83l785ts_id,
 	.detect		= w83l785ts_detect,
diff --git a/drivers/hwmon/w83l786ng.c b/drivers/hwmon/w83l786ng.c
index 5597e1c2d95c..75874cf7851c 100644
--- a/drivers/hwmon/w83l786ng.c
+++ b/drivers/hwmon/w83l786ng.c
@@ -751,7 +751,7 @@ static struct i2c_driver w83l786ng_driver = {
 	.driver = {
 		   .name = "w83l786ng",
 	},
-	.probe_new	= w83l786ng_probe,
+	.probe		= w83l786ng_probe,
 	.id_table	= w83l786ng_id,
 	.detect		= w83l786ng_detect,
 	.address_list	= normal_i2c,

base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
-- 
2.39.2

