Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCA412838C
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714467426; cv=none; b=JDlUl06z39muBzw7CWEgsGHpQoA9etY450N55apW5CpBI0qz0PM/CHlY6KJG7UAglcVcc+Z5Mmy1yaYGHJ2HoTx1Eo+TFa5yAHwPAbrkgvJ3Nj4IPVQDvW32h6Gd7V5jvlc/bfGQ0xmATsWjzwMmrrGfGR6bbQo7vgZSmQU8tDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714467426; c=relaxed/simple;
	bh=watlBWlyCzFZgM/Jt3wSeDAwbPcfIbTL/EZg+8cGOGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YjbOsAzGLk6SuiS7Ju0jFvbVjVyrB/Wku77acXR0yoW49sAJpBAOoCh9OfImTJulwCpnU2rlqIXJNl9hc7k79ly4qk/gIfvRdTBJS//ndlOdIJwj2tAjHDFk+SMA0plgifal71CAawvv7rVM8QN0VmK4EMjxvffuSe91LTBgmLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1jIJ-0002qp-Nr; Tue, 30 Apr 2024 10:56:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1jIJ-00F8Dd-0G; Tue, 30 Apr 2024 10:56:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1jII-00C1np-2z;
	Tue, 30 Apr 2024 10:56:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] hwmon: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Tue, 30 Apr 2024 10:56:53 +0200
Message-ID: <20240430085654.1028864-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=45135; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=watlBWlyCzFZgM/Jt3wSeDAwbPcfIbTL/EZg+8cGOGI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhjSDTWGTiphfVr0Ty5zwIcExxmWSfKunOGvalGcbLc/nW Ya3BSt0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjARrvXs//147H2v81cEF3Ff cffKbf1VzVTyJr1fX1J876xLWzQVq9sSPq9pq53dG2f6nOO2scKt8EOZjQZpjsIXFxSmrv7/88p rzndL95/8tvIjR5XU2SN/7ea8k9oRXDmv7IvR5OS8yTWRu1pnqdbt79gaejRdraj8/Zs1HT8DTr jWCmeEpQmfMuDUEuq98OjGYvNj77yCTE+teBQjYbrD7If1D8WNhxtZOjZ/CPncx94102TtKeeJo cGeBi9D5idKvFvDt0Vlso9Z2NQbAXwWa4WFZ/5wsku62RHip12/Tu72se51yo3MEzymyr9xf3+w 5eix+okhHU1ZjVM8Ig4VXFnI18RcWO1tqpl67IlgT9RxAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 Documentation/hwmon/pmbus.rst      | 2 +-
 drivers/hwmon/ad7414.c             | 2 +-
 drivers/hwmon/adc128d818.c         | 2 +-
 drivers/hwmon/adm1026.c            | 2 +-
 drivers/hwmon/adm1029.c            | 2 +-
 drivers/hwmon/adm1177.c            | 2 +-
 drivers/hwmon/adt7410.c            | 4 ++--
 drivers/hwmon/adt7411.c            | 2 +-
 drivers/hwmon/adt7462.c            | 2 +-
 drivers/hwmon/adt7470.c            | 2 +-
 drivers/hwmon/asb100.c             | 2 +-
 drivers/hwmon/atxp1.c              | 2 +-
 drivers/hwmon/ds620.c              | 2 +-
 drivers/hwmon/emc2103.c            | 2 +-
 drivers/hwmon/emc2305.c            | 8 ++++----
 drivers/hwmon/emc6w201.c           | 2 +-
 drivers/hwmon/ftsteutates.c        | 2 +-
 drivers/hwmon/g760a.c              | 2 +-
 drivers/hwmon/g762.c               | 4 ++--
 drivers/hwmon/gl518sm.c            | 2 +-
 drivers/hwmon/gl520sm.c            | 2 +-
 drivers/hwmon/hih6130.c            | 2 +-
 drivers/hwmon/hs3001.c             | 2 +-
 drivers/hwmon/ina209.c             | 2 +-
 drivers/hwmon/ina238.c             | 2 +-
 drivers/hwmon/ina3221.c            | 2 +-
 drivers/hwmon/jc42.c               | 2 +-
 drivers/hwmon/lineage-pem.c        | 2 +-
 drivers/hwmon/lm73.c               | 2 +-
 drivers/hwmon/lm77.c               | 2 +-
 drivers/hwmon/lm87.c               | 2 +-
 drivers/hwmon/lm93.c               | 4 ++--
 drivers/hwmon/lm95241.c            | 2 +-
 drivers/hwmon/lm95245.c            | 4 ++--
 drivers/hwmon/ltc2945.c            | 2 +-
 drivers/hwmon/ltc2947-i2c.c        | 2 +-
 drivers/hwmon/ltc2990.c            | 2 +-
 drivers/hwmon/ltc2991.c            | 2 +-
 drivers/hwmon/ltc2992.c            | 2 +-
 drivers/hwmon/ltc4151.c            | 2 +-
 drivers/hwmon/ltc4215.c            | 2 +-
 drivers/hwmon/ltc4222.c            | 2 +-
 drivers/hwmon/ltc4245.c            | 2 +-
 drivers/hwmon/ltc4260.c            | 2 +-
 drivers/hwmon/ltc4261.c            | 2 +-
 drivers/hwmon/max127.c             | 2 +-
 drivers/hwmon/max1619.c            | 2 +-
 drivers/hwmon/max31730.c           | 2 +-
 drivers/hwmon/max31790.c           | 2 +-
 drivers/hwmon/max6620.c            | 2 +-
 drivers/hwmon/max6639.c            | 2 +-
 drivers/hwmon/max6642.c            | 2 +-
 drivers/hwmon/mc34vr500.c          | 2 +-
 drivers/hwmon/nct7802.c            | 2 +-
 drivers/hwmon/nct7904.c            | 2 +-
 drivers/hwmon/pcf8591.c            | 2 +-
 drivers/hwmon/pmbus/adm1266.c      | 2 +-
 drivers/hwmon/pmbus/adp1050.c      | 2 +-
 drivers/hwmon/pmbus/inspur-ipsps.c | 2 +-
 drivers/hwmon/pmbus/ir35221.c      | 2 +-
 drivers/hwmon/pmbus/ir36021.c      | 2 +-
 drivers/hwmon/pmbus/ir38064.c      | 8 ++++----
 drivers/hwmon/pmbus/irps5401.c     | 2 +-
 drivers/hwmon/pmbus/lt7182s.c      | 2 +-
 drivers/hwmon/pmbus/ltc3815.c      | 2 +-
 drivers/hwmon/pmbus/max15301.c     | 2 +-
 drivers/hwmon/pmbus/max16064.c     | 2 +-
 drivers/hwmon/pmbus/max20751.c     | 2 +-
 drivers/hwmon/pmbus/max31785.c     | 6 +++---
 drivers/hwmon/pmbus/max8688.c      | 2 +-
 drivers/hwmon/pmbus/mp2888.c       | 2 +-
 drivers/hwmon/pmbus/mp5990.c       | 2 +-
 drivers/hwmon/pmbus/mpq8785.c      | 2 +-
 drivers/hwmon/pmbus/pli1209bc.c    | 2 +-
 drivers/hwmon/pmbus/pm6764tr.c     | 2 +-
 drivers/hwmon/pmbus/pxe1610.c      | 6 +++---
 drivers/hwmon/pmbus/stpddc60.c     | 4 ++--
 drivers/hwmon/pmbus/tda38640.c     | 2 +-
 drivers/hwmon/pmbus/tps40422.c     | 2 +-
 drivers/hwmon/pmbus/tps546d24.c    | 2 +-
 drivers/hwmon/pmbus/xdp710.c       | 2 +-
 drivers/hwmon/pmbus/xdpe12284.c    | 6 +++---
 drivers/hwmon/pmbus/xdpe152c4.c    | 4 ++--
 drivers/hwmon/pt5161l.c            | 2 +-
 drivers/hwmon/sbrmi.c              | 2 +-
 drivers/hwmon/sbtsi_temp.c         | 2 +-
 drivers/hwmon/sht21.c              | 2 +-
 drivers/hwmon/sht4x.c              | 2 +-
 drivers/hwmon/smsc47m192.c         | 2 +-
 drivers/hwmon/stts751.c            | 2 +-
 drivers/hwmon/tc654.c              | 4 ++--
 drivers/hwmon/tc74.c               | 2 +-
 drivers/hwmon/tmp102.c             | 2 +-
 drivers/hwmon/tmp103.c             | 2 +-
 drivers/hwmon/tmp108.c             | 2 +-
 drivers/hwmon/w83791d.c            | 2 +-
 drivers/hwmon/w83792d.c            | 2 +-
 drivers/hwmon/w83793.c             | 2 +-
 drivers/hwmon/w83l785ts.c          | 2 +-
 drivers/hwmon/w83l786ng.c          | 2 +-
 100 files changed, 119 insertions(+), 119 deletions(-)

diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index eb1569bfa676..d477124cf67f 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -152,7 +152,7 @@ Emerson DS1200 power modules might look as follows::
   }
 
   static const struct i2c_device_id ds1200_id[] = {
-	{"ds1200", 0},
+	{"ds1200"},
 	{}
   };
 
diff --git a/drivers/hwmon/ad7414.c b/drivers/hwmon/ad7414.c
index 7f1bef59046f..f0b17e59827f 100644
--- a/drivers/hwmon/ad7414.c
+++ b/drivers/hwmon/ad7414.c
@@ -205,7 +205,7 @@ static int ad7414_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad7414_id[] = {
-	{ "ad7414", 0 },
+	{ "ad7414" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ad7414_id);
diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index 46e3c8c50765..8cd013d2c547 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -504,7 +504,7 @@ static void adc128_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adc128_id[] = {
-	{ "adc128d818", 0 },
+	{ "adc128d818" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adc128_id);
diff --git a/drivers/hwmon/adm1026.c b/drivers/hwmon/adm1026.c
index 581d8edf70ea..80d09b017d3b 100644
--- a/drivers/hwmon/adm1026.c
+++ b/drivers/hwmon/adm1026.c
@@ -1849,7 +1849,7 @@ static int adm1026_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adm1026_id[] = {
-	{ "adm1026", 0 },
+	{ "adm1026" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adm1026_id);
diff --git a/drivers/hwmon/adm1029.c b/drivers/hwmon/adm1029.c
index 9a465f3f71c8..761c13092488 100644
--- a/drivers/hwmon/adm1029.c
+++ b/drivers/hwmon/adm1029.c
@@ -379,7 +379,7 @@ static int adm1029_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adm1029_id[] = {
-	{ "adm1029", 0 },
+	{ "adm1029" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adm1029_id);
diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index 3390102d2d4a..8b2c965480e3 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -238,7 +238,7 @@ static int adm1177_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adm1177_id[] = {
-	{"adm1177", 0},
+	{"adm1177"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, adm1177_id);
diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index d15f64d4b6e7..3bf0e0a0882c 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -88,8 +88,8 @@ static int adt7410_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adt7410_ids[] = {
-	{ "adt7410", 0 },
-	{ "adt7420", 0 },
+	{ "adt7410" },
+	{ "adt7420" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, adt7410_ids);
diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index 45fe4e8aae4e..08d0effd97f7 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -697,7 +697,7 @@ static int adt7411_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adt7411_id[] = {
-	{ "adt7411", 0 },
+	{ "adt7411" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adt7411_id);
diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index 429566c4245d..174dfee47f7a 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -1809,7 +1809,7 @@ static int adt7462_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adt7462_id[] = {
-	{ "adt7462", 0 },
+	{ "adt7462" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adt7462_id);
diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index c4b3a4a18670..517248d2994e 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1304,7 +1304,7 @@ static void adt7470_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adt7470_id[] = {
-	{ "adt7470", 0 },
+	{ "adt7470" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adt7470_id);
diff --git a/drivers/hwmon/asb100.c b/drivers/hwmon/asb100.c
index 974521e9b6b4..14e7737866c2 100644
--- a/drivers/hwmon/asb100.c
+++ b/drivers/hwmon/asb100.c
@@ -213,7 +213,7 @@ static struct asb100_data *asb100_update_device(struct device *dev);
 static void asb100_init_client(struct i2c_client *client);
 
 static const struct i2c_device_id asb100_id[] = {
-	{ "asb100", 0 },
+	{ "asb100" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, asb100_id);
diff --git a/drivers/hwmon/atxp1.c b/drivers/hwmon/atxp1.c
index d1de020abec6..1c7e9a98b757 100644
--- a/drivers/hwmon/atxp1.c
+++ b/drivers/hwmon/atxp1.c
@@ -278,7 +278,7 @@ static int atxp1_probe(struct i2c_client *client)
 };
 
 static const struct i2c_device_id atxp1_id[] = {
-	{ "atxp1", 0 },
+	{ "atxp1" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, atxp1_id);
diff --git a/drivers/hwmon/ds620.c b/drivers/hwmon/ds620.c
index 4fc4df012fac..ce397042d90b 100644
--- a/drivers/hwmon/ds620.c
+++ b/drivers/hwmon/ds620.c
@@ -233,7 +233,7 @@ static int ds620_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ds620_id[] = {
-	{"ds620", 0},
+	{"ds620"},
 	{}
 };
 
diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
index b59472bbe5bf..60eddc7b0270 100644
--- a/drivers/hwmon/emc2103.c
+++ b/drivers/hwmon/emc2103.c
@@ -620,7 +620,7 @@ emc2103_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id emc2103_ids[] = {
-	{ "emc2103", 0, },
+	{ "emc2103" },
 	{ /* LIST END */ }
 };
 MODULE_DEVICE_TABLE(i2c, emc2103_ids);
diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 6ef733c0be16..4d39fbd83769 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -47,10 +47,10 @@ enum emc230x_product_id {
 };
 
 static const struct i2c_device_id emc2305_ids[] = {
-	{ "emc2305", 0 },
-	{ "emc2303", 0 },
-	{ "emc2302", 0 },
-	{ "emc2301", 0 },
+	{ "emc2305" },
+	{ "emc2303" },
+	{ "emc2302" },
+	{ "emc2301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, emc2305_ids);
diff --git a/drivers/hwmon/emc6w201.c b/drivers/hwmon/emc6w201.c
index 9a4f868bf1e6..1100c6e5daa7 100644
--- a/drivers/hwmon/emc6w201.c
+++ b/drivers/hwmon/emc6w201.c
@@ -464,7 +464,7 @@ static int emc6w201_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id emc6w201_id[] = {
-	{ "emc6w201", 0 },
+	{ "emc6w201" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, emc6w201_id);
diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index b74a2665e733..a3a07662e491 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -50,7 +50,7 @@
 static const unsigned short normal_i2c[] = { 0x73, I2C_CLIENT_END };
 
 static const struct i2c_device_id fts_id[] = {
-	{ "ftsteutates", 0 },
+	{ "ftsteutates" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fts_id);
diff --git a/drivers/hwmon/g760a.c b/drivers/hwmon/g760a.c
index b5edee00267b..39ae8f826417 100644
--- a/drivers/hwmon/g760a.c
+++ b/drivers/hwmon/g760a.c
@@ -197,7 +197,7 @@ static int g760a_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id g760a_id[] = {
-	{ "g760a", 0 },
+	{ "g760a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, g760a_id);
diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index fad69ef56c75..af1228708e25 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -44,8 +44,8 @@
 #define DRVNAME "g762"
 
 static const struct i2c_device_id g762_id[] = {
-	{ "g762", 0 },
-	{ "g763", 0 },
+	{ "g762" },
+	{ "g763" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, g762_id);
diff --git a/drivers/hwmon/gl518sm.c b/drivers/hwmon/gl518sm.c
index 03db6158b13a..9c68bc013950 100644
--- a/drivers/hwmon/gl518sm.c
+++ b/drivers/hwmon/gl518sm.c
@@ -642,7 +642,7 @@ static int gl518_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id gl518_id[] = {
-	{ "gl518sm", 0 },
+	{ "gl518sm" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, gl518_id);
diff --git a/drivers/hwmon/gl520sm.c b/drivers/hwmon/gl520sm.c
index 8bbc6a4f2928..972f4f8caa2b 100644
--- a/drivers/hwmon/gl520sm.c
+++ b/drivers/hwmon/gl520sm.c
@@ -885,7 +885,7 @@ static int gl520_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id gl520_id[] = {
-	{ "gl520sm", 0 },
+	{ "gl520sm" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, gl520_id);
diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
index a9726b5370fb..85af8299150a 100644
--- a/drivers/hwmon/hih6130.c
+++ b/drivers/hwmon/hih6130.c
@@ -233,7 +233,7 @@ static int hih6130_probe(struct i2c_client *client)
 
 /* Device ID table */
 static const struct i2c_device_id hih6130_id[] = {
-	{ "hih6130", 0 },
+	{ "hih6130" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, hih6130_id);
diff --git a/drivers/hwmon/hs3001.c b/drivers/hwmon/hs3001.c
index 01ea9a3062bc..24ed3fb9a43a 100644
--- a/drivers/hwmon/hs3001.c
+++ b/drivers/hwmon/hs3001.c
@@ -175,7 +175,7 @@ static const struct hwmon_chip_info hs3001_chip_info = {
 
 /* device ID table */
 static const struct i2c_device_id hs3001_ids[] = {
-	{ "hs3001", 0 },
+	{ "hs3001" },
 	{ },
 };
 
diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index d9b57a4b3e41..bd7b3380d847 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -576,7 +576,7 @@ static void ina209_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ina209_id[] = {
-	{ "ina209", 0 },
+	{ "ina209" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina209_id);
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 69289293bc38..855626f1bc01 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -616,7 +616,7 @@ static int ina238_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ina238_id[] = {
-	{ "ina238", 0 },
+	{ "ina238" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina238_id);
diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 2c9530b6f192..f0053f87e3e6 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -1031,7 +1031,7 @@ static const struct of_device_id ina3221_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, ina3221_of_match_table);
 
 static const struct i2c_device_id ina3221_ids[] = {
-	{ "ina3221", 0 },
+	{ "ina3221" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ina3221_ids);
diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index a00168fe569d..7092f8f025b8 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -609,7 +609,7 @@ static const struct dev_pm_ops jc42_dev_pm_ops = {
 #endif /* CONFIG_PM */
 
 static const struct i2c_device_id jc42_id[] = {
-	{ "jc42", 0 },
+	{ "jc42" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, jc42_id);
diff --git a/drivers/hwmon/lineage-pem.c b/drivers/hwmon/lineage-pem.c
index df69c380cde7..64a335a64a2e 100644
--- a/drivers/hwmon/lineage-pem.c
+++ b/drivers/hwmon/lineage-pem.c
@@ -502,7 +502,7 @@ static int pem_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pem_id[] = {
-	{"lineage_pem", 0},
+	{"lineage_pem"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pem_id);
diff --git a/drivers/hwmon/lm73.c b/drivers/hwmon/lm73.c
index 637d35c5ae23..581b01572e1b 100644
--- a/drivers/hwmon/lm73.c
+++ b/drivers/hwmon/lm73.c
@@ -220,7 +220,7 @@ lm73_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm73_ids[] = {
-	{ "lm73", 0 },
+	{ "lm73" },
 	{ /* LIST END */ }
 };
 MODULE_DEVICE_TABLE(i2c, lm73_ids);
diff --git a/drivers/hwmon/lm77.c b/drivers/hwmon/lm77.c
index 8b9862519178..80f7a6a3f9a2 100644
--- a/drivers/hwmon/lm77.c
+++ b/drivers/hwmon/lm77.c
@@ -337,7 +337,7 @@ static int lm77_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm77_id[] = {
-	{ "lm77", 0 },
+	{ "lm77" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm77_id);
diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index 2195a735d28e..03964127a12a 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -975,7 +975,7 @@ static int lm87_probe(struct i2c_client *client)
  */
 
 static const struct i2c_device_id lm87_id[] = {
-	{ "lm87", 0 },
+	{ "lm87" },
 	{ "adm1024", 0 },
 	{ }
 };
diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index 75bca805720e..be4853fad80f 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -2624,8 +2624,8 @@ static int lm93_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm93_id[] = {
-	{ "lm93", 0 },
-	{ "lm94", 0 },
+	{ "lm93" },
+	{ "lm94" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm93_id);
diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index 475551f5024b..4ad69a2de105 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -457,7 +457,7 @@ static int lm95241_probe(struct i2c_client *client)
 
 /* Driver data (common to all clients) */
 static const struct i2c_device_id lm95241_id[] = {
-	{ "lm95231", 0 },
+	{ "lm95231" },
 	{ "lm95241", 0 },
 	{ }
 };
diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index 17ff54bd4015..d293b4f15dc1 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -578,8 +578,8 @@ static int lm95245_probe(struct i2c_client *client)
 
 /* Driver data (common to all clients) */
 static const struct i2c_device_id lm95245_id[] = {
-	{ "lm95235", 0 },
-	{ "lm95245", 0 },
+	{ "lm95235" },
+	{ "lm95245" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm95245_id);
diff --git a/drivers/hwmon/ltc2945.c b/drivers/hwmon/ltc2945.c
index 45b87a863cae..3e0e0e0687bd 100644
--- a/drivers/hwmon/ltc2945.c
+++ b/drivers/hwmon/ltc2945.c
@@ -508,7 +508,7 @@ static int ltc2945_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ltc2945_id[] = {
-	{"ltc2945", 0},
+	{"ltc2945"},
 	{ }
 };
 
diff --git a/drivers/hwmon/ltc2947-i2c.c b/drivers/hwmon/ltc2947-i2c.c
index 33f574bf2ce7..176d710706dd 100644
--- a/drivers/hwmon/ltc2947-i2c.c
+++ b/drivers/hwmon/ltc2947-i2c.c
@@ -27,7 +27,7 @@ static int ltc2947_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ltc2947_id[] = {
-	{"ltc2947", 0},
+	{"ltc2947"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ltc2947_id);
diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index 1ad362c0fd2c..f1c1933c52cf 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -259,7 +259,7 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ltc2990_i2c_id[] = {
-	{ "ltc2990", 0 },
+	{ "ltc2990" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ltc2990_i2c_id);
diff --git a/drivers/hwmon/ltc2991.c b/drivers/hwmon/ltc2991.c
index 80a6e391f266..06750bb93c23 100644
--- a/drivers/hwmon/ltc2991.c
+++ b/drivers/hwmon/ltc2991.c
@@ -414,7 +414,7 @@ static const struct of_device_id ltc2991_of_match[] = {
 MODULE_DEVICE_TABLE(of, ltc2991_of_match);
 
 static const struct i2c_device_id ltc2991_i2c_id[] = {
-	{ "ltc2991", 0 },
+	{ "ltc2991" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ltc2991_i2c_id);
diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index 001799bc28ed..229aed15d5ca 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -922,7 +922,7 @@ static const struct of_device_id ltc2992_of_match[] = {
 MODULE_DEVICE_TABLE(of, ltc2992_of_match);
 
 static const struct i2c_device_id ltc2992_i2c_id[] = {
-	{"ltc2992", 0},
+	{"ltc2992"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ltc2992_i2c_id);
diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index f42ac3c9475e..fa66eda78efe 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -188,7 +188,7 @@ static int ltc4151_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ltc4151_id[] = {
-	{ "ltc4151", 0 },
+	{ "ltc4151" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc4151_id);
diff --git a/drivers/hwmon/ltc4215.c b/drivers/hwmon/ltc4215.c
index 66fd28f713ab..cce452711cec 100644
--- a/drivers/hwmon/ltc4215.c
+++ b/drivers/hwmon/ltc4215.c
@@ -245,7 +245,7 @@ static int ltc4215_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ltc4215_id[] = {
-	{ "ltc4215", 0 },
+	{ "ltc4215" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc4215_id);
diff --git a/drivers/hwmon/ltc4222.c b/drivers/hwmon/ltc4222.c
index 9098ef521739..f7eb007fd766 100644
--- a/drivers/hwmon/ltc4222.c
+++ b/drivers/hwmon/ltc4222.c
@@ -200,7 +200,7 @@ static int ltc4222_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ltc4222_id[] = {
-	{"ltc4222", 0},
+	{"ltc4222"},
 	{ }
 };
 
diff --git a/drivers/hwmon/ltc4245.c b/drivers/hwmon/ltc4245.c
index b90184a3e0ec..14593bc81e85 100644
--- a/drivers/hwmon/ltc4245.c
+++ b/drivers/hwmon/ltc4245.c
@@ -469,7 +469,7 @@ static int ltc4245_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ltc4245_id[] = {
-	{ "ltc4245", 0 },
+	{ "ltc4245" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc4245_id);
diff --git a/drivers/hwmon/ltc4260.c b/drivers/hwmon/ltc4260.c
index 52f7a809b27b..9750dc9aa336 100644
--- a/drivers/hwmon/ltc4260.c
+++ b/drivers/hwmon/ltc4260.c
@@ -163,7 +163,7 @@ static int ltc4260_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ltc4260_id[] = {
-	{"ltc4260", 0},
+	{"ltc4260"},
 	{ }
 };
 
diff --git a/drivers/hwmon/ltc4261.c b/drivers/hwmon/ltc4261.c
index 509e68176c7a..2cd218a6a3be 100644
--- a/drivers/hwmon/ltc4261.c
+++ b/drivers/hwmon/ltc4261.c
@@ -222,7 +222,7 @@ static int ltc4261_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ltc4261_id[] = {
-	{"ltc4261", 0},
+	{"ltc4261"},
 	{}
 };
 
diff --git a/drivers/hwmon/max127.c b/drivers/hwmon/max127.c
index da2289e3560a..a9aab8862f5e 100644
--- a/drivers/hwmon/max127.c
+++ b/drivers/hwmon/max127.c
@@ -329,7 +329,7 @@ static int max127_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max127_id[] = {
-	{ "max127", 0 },
+	{ "max127" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max127_id);
diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 500dc926a7a7..a89a519cf5d9 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -285,7 +285,7 @@ static int max1619_probe(struct i2c_client *new_client)
 }
 
 static const struct i2c_device_id max1619_id[] = {
-	{ "max1619", 0 },
+	{ "max1619" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max1619_id);
diff --git a/drivers/hwmon/max31730.c b/drivers/hwmon/max31730.c
index 7d237db6e57c..2f4b419b6c9e 100644
--- a/drivers/hwmon/max31730.c
+++ b/drivers/hwmon/max31730.c
@@ -345,7 +345,7 @@ max31730_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max31730_ids[] = {
-	{ "max31730", 0, },
+	{ "max31730" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max31730_ids);
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 3dc95196b229..13f020e71d3d 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -537,7 +537,7 @@ static int max31790_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max31790_id[] = {
-	{ "max31790", 0 },
+	{ "max31790" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max31790_id);
diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 5d12fb9c9786..13201fb755c9 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -493,7 +493,7 @@ static int max6620_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max6620_id[] = {
-	{ "max6620", 0 },
+	{ "max6620" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max6620_id);
diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index aa7f21ab2395..5dd0349e8bd0 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -610,7 +610,7 @@ static int max6639_resume(struct device *dev)
 }
 
 static const struct i2c_device_id max6639_id[] = {
-	{"max6639", 0},
+	{"max6639"},
 	{ }
 };
 
diff --git a/drivers/hwmon/max6642.c b/drivers/hwmon/max6642.c
index 8b2e4d6101a2..9302ab233910 100644
--- a/drivers/hwmon/max6642.c
+++ b/drivers/hwmon/max6642.c
@@ -291,7 +291,7 @@ static int max6642_probe(struct i2c_client *client)
  */
 
 static const struct i2c_device_id max6642_id[] = {
-	{ "max6642", 0 },
+	{ "max6642" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max6642_id);
diff --git a/drivers/hwmon/mc34vr500.c b/drivers/hwmon/mc34vr500.c
index 0c8fd3fce83e..84458e4533d8 100644
--- a/drivers/hwmon/mc34vr500.c
+++ b/drivers/hwmon/mc34vr500.c
@@ -235,7 +235,7 @@ static int mc34vr500_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mc34vr500_id[] = {
-	{ "mc34vr500", 0 },
+	{ "mc34vr500" },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mc34vr500_id);
diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index a0e664d5ebfe..97e8c6424403 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -1212,7 +1212,7 @@ static const unsigned short nct7802_address_list[] = {
 };
 
 static const struct i2c_device_id nct7802_idtable[] = {
-	{ "nct7802", 0 },
+	{ "nct7802" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nct7802_idtable);
diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index 8f867d4570e1..f1e6eda949ba 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -1161,7 +1161,7 @@ static int nct7904_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id nct7904_id[] = {
-	{"nct7904", 0},
+	{"nct7904"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, nct7904_id);
diff --git a/drivers/hwmon/pcf8591.c b/drivers/hwmon/pcf8591.c
index 66c76b28c9e0..167d2fe4d543 100644
--- a/drivers/hwmon/pcf8591.c
+++ b/drivers/hwmon/pcf8591.c
@@ -285,7 +285,7 @@ static int pcf8591_read_channel(struct device *dev, int channel)
 }
 
 static const struct i2c_device_id pcf8591_id[] = {
-	{ "pcf8591", 0 },
+	{ "pcf8591" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8591_id);
diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index ed0a7b9fae4b..2c4d94cc8729 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -490,7 +490,7 @@ static const struct of_device_id adm1266_of_match[] = {
 MODULE_DEVICE_TABLE(of, adm1266_of_match);
 
 static const struct i2c_device_id adm1266_id[] = {
-	{ "adm1266", 0 },
+	{ "adm1266" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adm1266_id);
diff --git a/drivers/hwmon/pmbus/adp1050.c b/drivers/hwmon/pmbus/adp1050.c
index ea08554662d5..20f22730fc01 100644
--- a/drivers/hwmon/pmbus/adp1050.c
+++ b/drivers/hwmon/pmbus/adp1050.c
@@ -29,7 +29,7 @@ static int adp1050_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adp1050_id[] = {
-	{"adp1050", 0},
+	{"adp1050"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, adp1050_id);
diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index dfeae68b5e52..3e3cc9a0f116 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -197,7 +197,7 @@ static int ipsps_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ipsps_id[] = {
-	{ "ipsps1", 0 },
+	{ "ipsps1" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ipsps_id);
diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index e3ee5c1bd967..503be59c6c7f 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -126,7 +126,7 @@ static int ir35221_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ir35221_id[] = {
-	{"ir35221", 0},
+	{"ir35221"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/ir36021.c b/drivers/hwmon/pmbus/ir36021.c
index a263afeb8ac1..5148c9187c9e 100644
--- a/drivers/hwmon/pmbus/ir36021.c
+++ b/drivers/hwmon/pmbus/ir36021.c
@@ -51,7 +51,7 @@ static int ir36021_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ir36021_id[] = {
-	{ "ir36021", 0 },
+	{ "ir36021" },
 	{},
 };
 MODULE_DEVICE_TABLE(i2c, ir36021_id);
diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 69e18cb468f6..d4bcc9c39774 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -53,10 +53,10 @@ static int ir38064_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ir38064_id[] = {
-	{"ir38060", 0},
-	{"ir38064", 0},
-	{"ir38164", 0},
-	{"ir38263", 0},
+	{"ir38060"},
+	{"ir38064"},
+	{"ir38164"},
+	{"ir38263"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/irps5401.c b/drivers/hwmon/pmbus/irps5401.c
index 146d32a35a7c..f0bdf55c95bf 100644
--- a/drivers/hwmon/pmbus/irps5401.c
+++ b/drivers/hwmon/pmbus/irps5401.c
@@ -44,7 +44,7 @@ static int irps5401_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id irps5401_id[] = {
-	{"irps5401", 0},
+	{"irps5401"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/lt7182s.c b/drivers/hwmon/pmbus/lt7182s.c
index 28afc5f15ae8..aebd97af2741 100644
--- a/drivers/hwmon/pmbus/lt7182s.c
+++ b/drivers/hwmon/pmbus/lt7182s.c
@@ -168,7 +168,7 @@ static int lt7182s_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lt7182s_id[] = {
-	{ "lt7182s", 0 },
+	{ "lt7182s" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, lt7182s_id);
diff --git a/drivers/hwmon/pmbus/ltc3815.c b/drivers/hwmon/pmbus/ltc3815.c
index f2023b17aa8d..f58a8cedb0d7 100644
--- a/drivers/hwmon/pmbus/ltc3815.c
+++ b/drivers/hwmon/pmbus/ltc3815.c
@@ -143,7 +143,7 @@ static int ltc3815_write_word_data(struct i2c_client *client, int page,
 }
 
 static const struct i2c_device_id ltc3815_id[] = {
-	{"ltc3815", 0},
+	{"ltc3815"},
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc3815_id);
diff --git a/drivers/hwmon/pmbus/max15301.c b/drivers/hwmon/pmbus/max15301.c
index 2cfaa62aedd6..c79cdf10bbec 100644
--- a/drivers/hwmon/pmbus/max15301.c
+++ b/drivers/hwmon/pmbus/max15301.c
@@ -23,7 +23,7 @@
 #include "pmbus.h"
 
 static const struct i2c_device_id max15301_id[] = {
-	{"bmr461", 0},
+	{"bmr461"},
 	{"max15301", 0},
 	{}
 };
diff --git a/drivers/hwmon/pmbus/max16064.c b/drivers/hwmon/pmbus/max16064.c
index a573a0ab9e48..98e2b5dd5841 100644
--- a/drivers/hwmon/pmbus/max16064.c
+++ b/drivers/hwmon/pmbus/max16064.c
@@ -91,7 +91,7 @@ static int max16064_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max16064_id[] = {
-	{"max16064", 0},
+	{"max16064"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/max20751.c b/drivers/hwmon/pmbus/max20751.c
index 6ebd71cd081b..8f23c1eb559e 100644
--- a/drivers/hwmon/pmbus/max20751.c
+++ b/drivers/hwmon/pmbus/max20751.c
@@ -32,7 +32,7 @@ static int max20751_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max20751_id[] = {
-	{"max20751", 0},
+	{"max20751"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 5d13bbfc8f47..09218dba8965 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -518,9 +518,9 @@ static int max31785_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max31785_id[] = {
-	{ "max31785", 0 },
-	{ "max31785a", 0 },
-	{ "max31785b", 0 },
+	{ "max31785" },
+	{ "max31785a" },
+	{ "max31785b" },
 	{ },
 };
 
diff --git a/drivers/hwmon/pmbus/max8688.c b/drivers/hwmon/pmbus/max8688.c
index ae8573fdf5ba..5d5b6aeefa80 100644
--- a/drivers/hwmon/pmbus/max8688.c
+++ b/drivers/hwmon/pmbus/max8688.c
@@ -171,7 +171,7 @@ static int max8688_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max8688_id[] = {
-	{"max8688", 0},
+	{"max8688"},
 	{ }
 };
 
diff --git a/drivers/hwmon/pmbus/mp2888.c b/drivers/hwmon/pmbus/mp2888.c
index 50662ed8e3d5..3b45f126b611 100644
--- a/drivers/hwmon/pmbus/mp2888.c
+++ b/drivers/hwmon/pmbus/mp2888.c
@@ -378,7 +378,7 @@ static int mp2888_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mp2888_id[] = {
-	{"mp2888", 0},
+	{"mp2888"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/mp5990.c b/drivers/hwmon/pmbus/mp5990.c
index 1dfbab25a064..5d1d5eac89da 100644
--- a/drivers/hwmon/pmbus/mp5990.c
+++ b/drivers/hwmon/pmbus/mp5990.c
@@ -158,7 +158,7 @@ static const struct of_device_id mp5990_of_match[] = {
 };
 
 static const struct i2c_device_id mp5990_id[] = {
-	{"mp5990", 0},
+	{"mp5990"},
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mp5990_id);
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 4e2549cc8120..7f87e117b49d 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -62,7 +62,7 @@ static int mpq8785_probe(struct i2c_client *client)
 };
 
 static const struct i2c_device_id mpq8785_id[] = {
-	{ "mpq8785", 0 },
+	{ "mpq8785" },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
diff --git a/drivers/hwmon/pmbus/pli1209bc.c b/drivers/hwmon/pmbus/pli1209bc.c
index c95433790b11..2c6c9ec2a652 100644
--- a/drivers/hwmon/pmbus/pli1209bc.c
+++ b/drivers/hwmon/pmbus/pli1209bc.c
@@ -141,7 +141,7 @@ static int pli1209bc_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pli1209bc_id[] = {
-	{"pli1209bc", 0},
+	{"pli1209bc"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/pm6764tr.c b/drivers/hwmon/pmbus/pm6764tr.c
index 2a16504c85b7..23f15b608dcf 100644
--- a/drivers/hwmon/pmbus/pm6764tr.c
+++ b/drivers/hwmon/pmbus/pm6764tr.c
@@ -48,7 +48,7 @@ static int pm6764tr_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pm6764tr_id[] = {
-	{"pm6764tr", 0},
+	{"pm6764tr"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pm6764tr_id);
diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
index e2790a682dc8..5ac476d3cdd2 100644
--- a/drivers/hwmon/pmbus/pxe1610.c
+++ b/drivers/hwmon/pmbus/pxe1610.c
@@ -127,9 +127,9 @@ static int pxe1610_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pxe1610_id[] = {
-	{"pxe1610", 0},
-	{"pxe1110", 0},
-	{"pxm1310", 0},
+	{"pxe1610"},
+	{"pxe1110"},
+	{"pxm1310"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/stpddc60.c b/drivers/hwmon/pmbus/stpddc60.c
index be9076dcc2db..34d0f06f4845 100644
--- a/drivers/hwmon/pmbus/stpddc60.c
+++ b/drivers/hwmon/pmbus/stpddc60.c
@@ -18,8 +18,8 @@
 #define STPDDC60_MFR_UV_LIMIT_OFFSET	0xe6
 
 static const struct i2c_device_id stpddc60_id[] = {
-	{"stpddc60", 0},
-	{"bmr481", 0},
+	{"stpddc60"},
+	{"bmr481"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, stpddc60_id);
diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
index c31889a036f0..044d5fbdf9eb 100644
--- a/drivers/hwmon/pmbus/tda38640.c
+++ b/drivers/hwmon/pmbus/tda38640.c
@@ -195,7 +195,7 @@ static int tda38640_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda38640_id[] = {
-	{"tda38640", 0},
+	{"tda38640"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tda38640_id);
diff --git a/drivers/hwmon/pmbus/tps40422.c b/drivers/hwmon/pmbus/tps40422.c
index ea0074a6b9fc..d99b9850ea36 100644
--- a/drivers/hwmon/pmbus/tps40422.c
+++ b/drivers/hwmon/pmbus/tps40422.c
@@ -31,7 +31,7 @@ static int tps40422_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tps40422_id[] = {
-	{"tps40422", 0},
+	{"tps40422"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/tps546d24.c b/drivers/hwmon/pmbus/tps546d24.c
index 69bbdb6c680b..520ca37269f7 100644
--- a/drivers/hwmon/pmbus/tps546d24.c
+++ b/drivers/hwmon/pmbus/tps546d24.c
@@ -42,7 +42,7 @@ static int tps546d24_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tps546d24_id[] = {
-	{"tps546d24", 0},
+	{"tps546d24"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps546d24_id);
diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c
index 11971a0e0d26..137854f9e9af 100644
--- a/drivers/hwmon/pmbus/xdp710.c
+++ b/drivers/hwmon/pmbus/xdp710.c
@@ -110,7 +110,7 @@ static const struct of_device_id xdp710_of_match[] = {
 };
 
 static const struct i2c_device_id xdp710_id[] = {
-	{"xdp710", 0},
+	{"xdp710"},
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, xdp710_id);
diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index 37d08dd427d5..facb1201aa43 100644
--- a/drivers/hwmon/pmbus/xdpe12284.c
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -164,9 +164,9 @@ static int xdpe122_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id xdpe122_id[] = {
-	{"xdpe11280", 0},
-	{"xdpe12254", 0},
-	{"xdpe12284", 0},
+	{"xdpe11280"},
+	{"xdpe12254"},
+	{"xdpe12284"},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/xdpe152c4.c b/drivers/hwmon/pmbus/xdpe152c4.c
index 235e6b41ae4c..7f3b31d4f033 100644
--- a/drivers/hwmon/pmbus/xdpe152c4.c
+++ b/drivers/hwmon/pmbus/xdpe152c4.c
@@ -44,8 +44,8 @@ static int xdpe152_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id xdpe152_id[] = {
-	{"xdpe152c4", 0},
-	{"xdpe15284", 0},
+	{"xdpe152c4"},
+	{"xdpe15284"},
 	{}
 };
 
diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
index 60361e39c474..b0d58a26d499 100644
--- a/drivers/hwmon/pt5161l.c
+++ b/drivers/hwmon/pt5161l.c
@@ -630,7 +630,7 @@ static const struct acpi_device_id __maybe_unused pt5161l_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, pt5161l_acpi_match);
 
 static const struct i2c_device_id pt5161l_id[] = {
-	{ "pt5161l", 0 },
+	{ "pt5161l" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pt5161l_id);
diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
index 4318f5121145..d48d8e5460ff 100644
--- a/drivers/hwmon/sbrmi.c
+++ b/drivers/hwmon/sbrmi.c
@@ -328,7 +328,7 @@ static int sbrmi_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sbrmi_id[] = {
-	{"sbrmi", 0},
+	{"sbrmi"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, sbrmi_id);
diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index a4181acb1aa6..3c839f56c460 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -218,7 +218,7 @@ static int sbtsi_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sbtsi_id[] = {
-	{"sbtsi", 0},
+	{"sbtsi"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, sbtsi_id);
diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
index 55c179475208..ad1b827ea782 100644
--- a/drivers/hwmon/sht21.c
+++ b/drivers/hwmon/sht21.c
@@ -278,7 +278,7 @@ static int sht21_probe(struct i2c_client *client)
 
 /* Device ID table */
 static const struct i2c_device_id sht21_id[] = {
-	{ "sht21", 0 },
+	{ "sht21" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sht21_id);
diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 4883755d4b1e..b8916d2735b5 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -276,7 +276,7 @@ static int sht4x_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sht4x_id[] = {
-	{ "sht4x", 0 },
+	{ "sht4x" },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, sht4x_id);
diff --git a/drivers/hwmon/smsc47m192.c b/drivers/hwmon/smsc47m192.c
index d20800a1f02b..21103af4e139 100644
--- a/drivers/hwmon/smsc47m192.c
+++ b/drivers/hwmon/smsc47m192.c
@@ -618,7 +618,7 @@ static int smsc47m192_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id smsc47m192_id[] = {
-	{ "smsc47m192", 0 },
+	{ "smsc47m192" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, smsc47m192_id);
diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
index 847c99376930..427a65dd6f19 100644
--- a/drivers/hwmon/stts751.c
+++ b/drivers/hwmon/stts751.c
@@ -72,7 +72,7 @@ static const int stts751_intervals[] = {
 };
 
 static const struct i2c_device_id stts751_id[] = {
-	{ "stts751", 0 },
+	{ "stts751" },
 	{ }
 };
 
diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index 42a9658f1bc2..39fe5836f237 100644
--- a/drivers/hwmon/tc654.c
+++ b/drivers/hwmon/tc654.c
@@ -550,8 +550,8 @@ static int tc654_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tc654_id[] = {
-	{"tc654", 0},
-	{"tc655", 0},
+	{"tc654"},
+	{"tc655"},
 	{}
 };
 
diff --git a/drivers/hwmon/tc74.c b/drivers/hwmon/tc74.c
index 03950670bd78..9984373a25fb 100644
--- a/drivers/hwmon/tc74.c
+++ b/drivers/hwmon/tc74.c
@@ -151,7 +151,7 @@ static int tc74_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tc74_id[] = {
-	{ "tc74", 0 },
+	{ "tc74" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tc74_id);
diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 2506c78590af..8af44a33055f 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -286,7 +286,7 @@ static int tmp102_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tmp102_dev_pm_ops, tmp102_suspend, tmp102_resume);
 
 static const struct i2c_device_id tmp102_id[] = {
-	{ "tmp102", 0 },
+	{ "tmp102" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp102_id);
diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
index a84c29a3a765..f271a03e05ae 100644
--- a/drivers/hwmon/tmp103.c
+++ b/drivers/hwmon/tmp103.c
@@ -197,7 +197,7 @@ static int tmp103_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tmp103_dev_pm_ops, tmp103_suspend, tmp103_resume);
 
 static const struct i2c_device_id tmp103_id[] = {
-	{ "tmp103", 0 },
+	{ "tmp103" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp103_id);
diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index d7a09ab2bc11..a82bbc959eb1 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -413,7 +413,7 @@ static int tmp108_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
 
 static const struct i2c_device_id tmp108_i2c_ids[] = {
-	{ "tmp108", 0 },
+	{ "tmp108" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 9681eaa06c8e..ace854b370a0 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -328,7 +328,7 @@ static void w83791d_print_debug(struct w83791d_data *data, struct device *dev);
 static void w83791d_init_client(struct i2c_client *client);
 
 static const struct i2c_device_id w83791d_id[] = {
-	{ "w83791d", 0 },
+	{ "w83791d" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, w83791d_id);
diff --git a/drivers/hwmon/w83792d.c b/drivers/hwmon/w83792d.c
index 69ce379a9e13..b0b5f60eea53 100644
--- a/drivers/hwmon/w83792d.c
+++ b/drivers/hwmon/w83792d.c
@@ -296,7 +296,7 @@ static void w83792d_print_debug(struct w83792d_data *data, struct device *dev);
 static void w83792d_init_client(struct i2c_client *client);
 
 static const struct i2c_device_id w83792d_id[] = {
-	{ "w83792d", 0 },
+	{ "w83792d" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, w83792d_id);
diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index 96bab94ba899..0acf6bd0227f 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -291,7 +291,7 @@ static void w83793_update_nonvolatile(struct device *dev);
 static struct w83793_data *w83793_update_device(struct device *dev);
 
 static const struct i2c_device_id w83793_id[] = {
-	{ "w83793", 0 },
+	{ "w83793" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, w83793_id);
diff --git a/drivers/hwmon/w83l785ts.c b/drivers/hwmon/w83l785ts.c
index 9c11ed69c055..df77b53a1b2f 100644
--- a/drivers/hwmon/w83l785ts.c
+++ b/drivers/hwmon/w83l785ts.c
@@ -74,7 +74,7 @@ static struct w83l785ts_data *w83l785ts_update_device(struct device *dev);
  */
 
 static const struct i2c_device_id w83l785ts_id[] = {
-	{ "w83l785ts", 0 },
+	{ "w83l785ts" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, w83l785ts_id);
diff --git a/drivers/hwmon/w83l786ng.c b/drivers/hwmon/w83l786ng.c
index 75874cf7851c..9b81bd406e05 100644
--- a/drivers/hwmon/w83l786ng.c
+++ b/drivers/hwmon/w83l786ng.c
@@ -741,7 +741,7 @@ w83l786ng_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id w83l786ng_id[] = {
-	{ "w83l786ng", 0 },
+	{ "w83l786ng" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, w83l786ng_id);
-- 
2.43.0

