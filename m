Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0688C77B73
	for <linux-hwmon@archiver.kernel.org>; Sat, 27 May 2023 09:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjE0JsY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 27 May 2023 05:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbjE0JsV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 May 2023 05:48:21 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3628FC3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 May 2023 02:48:14 -0700 (PDT)
IronPort-SDR: 6471d1dc_a6xg4UgR5SeshzaxEIT/a0ZJbuH/bnwCYuXTwDG7+p7u/Og
 IRcu4Om8f3pGkXBlw3ndD084M28ZOM+4s2rxS3w==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BFAwBj0XFkjPQc8jxaHgEBCxIMSYE7C4IvglG1dg8BD?=
 =?us-ascii?q?wEBRAQBAYUGhV8mNwYOAQIEAQEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGBBQBA?=
 =?us-ascii?q?QEBQEWFaA2GBysLAQ0BATcBKIEVARKCfoJdrVYzgQGCCAEBBoJlmmuBXwmBQ?=
 =?us-ascii?q?gGME4EZgzeBPD+BToEVgTyCLYsGjlmDXIlegTBygSM/aYECAgkCEWeBDghng?=
 =?us-ascii?q?XRAAg1WCwtlgSaBMYEvAgIRPhVVYxoSARMDBwQCgQgQLwcEMykGCRkxJwZWB?=
 =?us-ascii?q?xcWJAkTFUQHhAQDCoEpYgMJAwcFSUADCxgNFjoRLDUUHywggQkYYwSCAAoHJ?=
 =?us-ascii?q?CSffFo0gj8qknuPA6I+hBKBXZ8iTYFIqAgul2AgozqELwIKBxaBeYF/TR8Zg?=
 =?us-ascii?q?yJPAxkPjiAZghWRUWM7AgcLAQEDCYtGAQE?=
IronPort-PHdr: A9a23:mUGLgR1wLfA73eRPsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23: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
 QryJlWrVvRp/qxUeA==
IronPort-HdrOrdr: A9a23:ftbkCakH89ar1nVEnHxbKZCAwYbpDfIC3DAbv31ZSRFFG/Fw9/
 rFoB3U737JYVEqKRYdcbLpAsS9qBbnmaKdjrNhXotKMDOIhILKFvAH0WKd+UyDJ8SWzIc0vp
 uIGJIfNDSfNzZHZUmW2njfLz9Z+qjjzEmxv5al855yd3AQV0i+1XYBNu5LencGPDV7OQ==
X-Talos-CUID: 9a23:cWVmFG9yf5EfuVlJtFmVv2IQB9wCIkLw9Ujvem6UDX1JZpyWd0DFrQ==
X-Talos-MUID: 9a23:QvjMjwSxCM1WCLuTRXTPqw9cNORC/pi+BRhdrZgFoO6oN3V/bmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 27 May 2023 19:18:13 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 34R9lwBD2268999
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 27 May 2023 19:48:07 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 34R9lwBD2268999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1685180887; bh=FWTD6d37O4UVINOVYWn4qw3aOyQpBj/aHqy0/HVVL0c=;
        h=From:To:Cc:Subject:Date:From;
        b=r5UW1Hk9JpoAeYxePDJkfPTZTtgDdsfPu6hGFbEEriACQDQ1Sk5RqUzhbvMJHVfDg
         RKWEBPWXI/09OImNM1yMRpMu1nI4bhxbRdWtt/aWYdwVXTJ8JFYByJYCzN0Tsn9HFm
         77T7t2JlDIr9xkmCHu5C+O/0Fc5oFm/BcnjfBK/JU/SJZZSIdeSliLIsX4XzwYd6NL
         C9uAqyAvTOhA14je2pmOOhQ+ZkJIAPbICJrztY0ZboYUnIdIw6FxMiSsUKJwdUGSpL
         DnTopDBVkgc/ShssS6YHWvZOQXDvu6T8vR4YTlwDzkzoUP5BO5b/UI3BNFdONnTFE7
         85JolnN8i/3RA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 1/1] hwmon: (it87) Generalise support for FAN_CTL ON/OFF
Date:   Sat, 27 May 2023 19:47:56 +1000
Message-Id: <20230527094756.3464256-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 27 May 2023 19:48:07 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Support for FAN_CTL ON/OFF is currently disabled only for IT8603E but
there are severl chips that don't support the configuration bits to turn
off fan control entirely.  Generalise this support for any chip.

Add feature flag FEAT_FANCTL_ONOFF for chips that support configuration
bits for management of fan control off and assign all chips that support
the configuration.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

Changes since v1:
 * Combine into a single patch following review.

---
 drivers/hwmon/it87.c | 63 ++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 4c3641d28a6a..5deff5e5f693 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -320,31 +320,34 @@ struct it87_devices {
 #define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
+#define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
 		.name = "it87",
 		.model = "IT87F",
-		.features = FEAT_OLD_AUTOPWM,	/* may need to overwrite */
+		.features = FEAT_OLD_AUTOPWM | FEAT_FANCTL_ONOFF,
+		/* may need to overwrite */
 	},
 	[it8712] = {
 		.name = "it8712",
 		.model = "IT8712F",
-		.features = FEAT_OLD_AUTOPWM | FEAT_VID,
-						/* may need to overwrite */
+		.features = FEAT_OLD_AUTOPWM | FEAT_VID | FEAT_FANCTL_ONOFF,
+		/* may need to overwrite */
 	},
 	[it8716] = {
 		.name = "it8716",
 		.model = "IT8716F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
-		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2,
+		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 	},
 	[it8718] = {
 		.name = "it8718",
 		.model = "IT8718F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8720] = {
@@ -352,7 +355,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8720F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8721] = {
@@ -361,7 +364,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x05,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -370,7 +373,8 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8728F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
-		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2,
+		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
 	[it8732] = {
@@ -379,7 +383,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FOUR_FANS
-		  | FEAT_FOUR_PWM,
+		  | FEAT_FOUR_PWM | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -388,7 +392,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8771E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 				/* PECI: guesswork */
 				/* 12mV ADC (OHM) */
 				/* 16 bit fans (OHM) */
@@ -400,7 +404,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8772E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 				/* PECI (coreboot) */
 				/* 12mV ADC (HWSensors4, OHM) */
 				/* 16 bit fans (HWSensors4, OHM) */
@@ -411,21 +415,24 @@ static const struct it87_devices it87_devices[] = {
 		.name = "it8781",
 		.model = "IT8781F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
-		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
+		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8782] = {
 		.name = "it8782",
 		.model = "IT8782F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
-		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
+		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8783] = {
 		.name = "it8783",
 		.model = "IT8783E/F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
-		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
+		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
+		  | FEAT_FANCTL_ONOFF,
 		.old_peci_mask = 0x4,
 	},
 	[it8786] = {
@@ -433,7 +440,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8786E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
 	[it8790] = {
@@ -441,7 +448,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8790E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2 | FEAT_CONF_NOEXIT,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 	},
 	[it8792] = {
@@ -449,7 +456,8 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8792E/IT8795E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
-		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_CONF_NOEXIT,
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
+		  | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -467,7 +475,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
-		  | FEAT_SIX_TEMP | FEAT_VIN3_5V,
+		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
 	[it8622] = {
@@ -486,7 +494,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
-		  | FEAT_SIX_TEMP | FEAT_VIN3_5V,
+		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
 	[it87952] = {
@@ -494,7 +502,8 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT87952E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
-		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_CONF_NOEXIT,
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
+		  | FEAT_CONF_NOEXIT,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -534,6 +543,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
+#define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -1240,11 +1250,12 @@ static SENSOR_DEVICE_ATTR(temp3_type, S_IRUGO | S_IWUSR, show_temp_type,
 
 static int pwm_mode(const struct it87_data *data, int nr)
 {
-	if (data->type != it8603 && nr < 3 && !(data->fan_main_ctrl & BIT(nr)))
-		return 0;				/* Full speed */
+	if (has_fanctl_onoff(data) && nr < 3 &&
+	    !(data->fan_main_ctrl & BIT(nr)))
+		return 0;			/* Full speed */
 	if (data->pwm_ctrl[nr] & 0x80)
-		return 2;				/* Automatic mode */
-	if ((data->type == it8603 || nr >= 3) &&
+		return 2;			/* Automatic mode */
+	if ((!has_fanctl_onoff(data) || nr >= 3) &&
 	    data->pwm_duty[nr] == pwm_to_reg(data, 0xff))
 		return 0;			/* Full speed */
 
@@ -1481,7 +1492,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 		return err;
 
 	if (val == 0) {
-		if (nr < 3 && data->type != it8603) {
+		if (nr < 3 && has_fanctl_onoff(data)) {
 			int tmp;
 			/* make sure the fan is on when in on/off mode */
 			tmp = it87_read_value(data, IT87_REG_FAN_CTL);
@@ -1521,7 +1532,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 		data->pwm_ctrl[nr] = ctrl;
 		it87_write_value(data, IT87_REG_PWM[nr], ctrl);
 
-		if (data->type != it8603 && nr < 3) {
+		if (has_fanctl_onoff(data) && nr < 3) {
 			/* set SmartGuardian mode */
 			data->fan_main_ctrl |= BIT(nr);
 			it87_write_value(data, IT87_REG_FAN_MAIN_CTRL,
-- 
2.40.1

