Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B842C38142
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Jan 2023 06:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjA1GEQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Jan 2023 01:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbjA1GEP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Jan 2023 01:04:15 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E8A7388F33
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2023 22:04:13 -0800 (PST)
IronPort-SDR: 3SXw8OffwzkTqydqY8/vFmXDZH19N2wtNnVY/G8znFpZ3tDlRRLs9KI8KP1OpBCC91h2wO5dZR
 B7AYp2WdOwKI9xXguhuaE6F8VBJ7WkQzd+wSOPUmYyQ7Enfj6y6SMoeaDup0Yt/maM1GOItXNh
 tEbH6ikY763KXkeDOx15aOOfAXRpTTUx38gc5JPpGwjpUEPRWz4eyNZ1sQe+/TSh/tGfyc+K68
 JhrkUMPWm/9XW9WnXNzk/5rNmIMxxMcVHrX/o4jjZP4wOs5TJBtOLDOQh6o9d2+SrXsnVyvhWt
 dz++v8lvb5Z+enRF8q1BPann
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BtAABJutRj//Qc8jxaHQEBAQEJARIBBQUBSYEyCAELA?=
 =?us-ascii?q?YIsgmCMbaZAgX4PAQ8BAUQEAQGFBwKFJSY0CQ4BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBgEBAQEBAQYEgSoHC1IHC1gHB4FBC4FhEwsDMQ2GVgIBAycLAQ0BATcBD?=
 =?us-ascii?q?xk4VwYBEoJ+gyOqbjOBAYIIAQEGgmKaZ4FeCYFAAYthgRSDNnpDP4FOhH2LA?=
 =?us-ascii?q?5tzCoE5d4ElDkx6gQ8CCQIRdHkDCQMHBUlAAwsYDRYyChMsNQsLShAbGhsHg?=
 =?us-ascii?q?QYqKBUDBAQDAgYTAyACDSgxFAQpEw0nJmkJAgMiXwUDAwQoLQk/ByYkPAdWN?=
 =?us-ascii?q?wYCDx83BgMJAwIfUHEvEhIFAwsVKkcECDYFBhw2EgIIDxIPLEMOQjc0EwZcA?=
 =?us-ascii?q?SkLDhEDUEYZbgSCDAoGKSaeTnEBgQ6VXo5YoWODfoFSnn5MgUSna5dPIKMch?=
 =?us-ascii?q?CsCCgcWgWKCFU0fGTuCZ08BAgEBAQ0BAgEBAwECAQEBCQEBAQGOHYIskUthO?=
 =?us-ascii?q?wIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:fs8mERGphnkCR+8uSo14jZ1GfhYY04WdBeZdwpAml6kIeb6q4JrlJ
 kCZ6PBwyl7FG4zGuLpNkeGDtafmVCQb5IqZ9moPdZtQWloEkZAYkwB6UpGMAEGpIKK1P35jT
 pZJXgY9rXqwaRc9JQ==
IronPort-Data: A9a23:UuGSLq7l9kcn7PBzhblNMAxRtBrBchMFZxGqfqrLsTDasY5as4F+v
 mpMDDqFaPnYYmPwLY0gPtmz9BxQvpSEy4JqHgVkrn83EiNG8peeCInAcUz9MynIIsSYQU9qt
 p1GYISRJ8luEif1q0b2ONANj1ElhfnSHOaU5M0om8xVbVU5IMv0oUs7w4bVuqYx3Z7hRVnlV
 era+6UzAnf8s9JJGjt8B5yr+EsHUMva4Fv0jnRmDRyclAK2e9E9VfrzFInpR5fKatA88t2SG
 44v+IqEElbxpH/BPD8EfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1hUp/0120c95NJ
 Nplh9+TewkxP5H3tcsGCRV1M3BXE4xY9+qSSZS/mZT7I0zueXrw2LNlFkgpM4oC9qB6BHwI9
 PBeIS1lghKr2brwmu7hDLM8wJ5/cKEHP6tG0p1k5T/DBPAlaZvZSrrE4sVUmjo1m4ZPEbDXe
 qL1bBIzME2YO0cWawh/5JQWh7mTm0OnTQBkp2nNjpM7wVaO4SJ6+e24WDbSUofSHpUPxBfwS
 nj912D4BAwKcdyAzD2D2myji/WJni7hXo8WUrqi+ZZChFyV23w7EhobXlj+vOL/jEOiM/pdJ
 0EQ5CM0oIAp6VemCNL6WnWFTGWs4EZZAYYKVrdqrVvRluzP/w+FB2NCUiZOaZots8pwTCFCO
 kK1c83BN39MgrONSE6m25iP9z+fGXk8A04canpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ0cJ
 RjU9EDSYJ1N0KY2O7WHEUPvxmn39seQEmbZ8i2OAzv/tlsnDGKwT9bwgWU3+8qsO66wczFtV
 lA/isSY4fFm4XqlznTVGI3h8JmP6unNCzrBnV4nIJAl+i/FxpJOVd4IpWsifgIzYoNeJWOve
 1PapQJaooNLM3rsZqhyJYusYyjL8UQCPYi5Phw3RoAVCnSUSONh1Hs2DaJ39zqz+HXAaYllZ
 f+mnT+EVB73yc1PlVJavds1374x3TwZzmjOX539xBnP+ePAOyLFFetfagXTNLBRAEa4TOP9r
 Y432yyilUg3bQECSnOGmWLuBQpVdiNgWMqeRzJ/K7/ZelMO9J4d5w/5mut6K9Y/zsy5Z8/U5
 n71W0lExUD5iGGvFOl5Qi4LVV4uNL4hxU8G0dsEZAjziyh/Pdrxts/ytfIfJNEayQCq9tYsJ
 9FtRilKKqonpu3v92tPYJ/jgpZlcRj31wuCMzD8MGo0ZZd/SQvT9pnpexap9SVIBzfu7Zkyp
 Lip1wX6R5sfRl08U5yMOan/lgK87SoHheZ/f0rUOd0NKk/ix4hdLXCjhPEAPJBeIBrO8TKWy
 gKKDEpKvuLKuYI0roXEiPnc/YekGudzBGRAGGzf4erkPCXW5DPzk4RaWfmGeirREm7x5eOja
 aNc0qikYvEAmV9Ltat6EqpqlPxhvYG+/O8Dnwk9RSfFdVWmDL9kM0Kq58gXu/0f3KJdtCu3R
 lmLpItQN4KJD8W5QlQfExV0PO2M2MYdliTW8flocl7x4zV6/eTbXEhfY0uMhShaIOcnOY8p2
 7166sQX9xf5gQAjLdiBlCwS+mGRaH0MFaw678lIDIjugwst61dDfZ2FVHCsusDUO4wdPxl4O
 CKQiYrDm69YmBjIfU0zIn6Rj+BTsotf6hlFwWgLK0mNhteY1OQ82wdc8GprQwkJnA9L1fl/Z
 jpiO0Fvfv/coW8t3pQZGjr8XlsdWFuC5kXtylBPiHXWTg+jUWmLJXBkYbSB+0UQ8mR9eDlH/
 ejGlzy/AG26JZD8jnkoREpoi/3/VtgtpAfMr8b2Tc2KEq4zbSfhnqLzN3EDrAHqAJ1tiUDKz
 QWwED2ctUEm2fYsnpAG
IronPort-HdrOrdr: A9a23:l422YKPGP4FYscBcThujsMiBIKoaSvp037BK7SpMoNJuE/Bw8P
 re5cjyt3fP5Qr5PUtNpTnuAtjifZqxz/FICMwqTNOftWrdyQ2Vxf9ZnOnfKlTbckWUygce79
 YGT0EUMr3N5DZB4/oTb2SDYq4dKaG8gcWVbP/lvgtQpB9RGtxdBthCe32m+pwffng9OaYE
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 28 Jan 2023 16:33:38 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30S63ChB2973396
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 28 Jan 2023 17:03:34 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30S63ChB2973396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674885815; bh=M2MVaha1xLw9k0+IL2I0shECySHA7DuKZiKIFVRIjkE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NpqK9ibpR4r69g+SxPn2Ev/pcYENxcaMQvD55437z3iYx8Gz1/crtRM6A1YJGa7uc
         Aqi8LWmDXxGcCRK7bE+1VIh2V9w8TvDRqqVT+OLhoFkg8cLoF/0cBmsVbAhj8c3hzC
         scBFJKSZcLJnzEa2REp7rHSnk2iLmGykZ+jmveKy4QDAeTZ2ECbpQCZztmBArR1OMb
         Lq6ofYsGECUQR1tpWJR5tnZ8dcAB1Qp4jKGSzP2P5BJrl1c6O+C2iXTSlN0VY2HXfO
         xeAfi/RIVhOG70iYTt6D0kx+Gdm7m8xwfB95vwzXzbPX27u/vH+wsNkLqxETBi7weW
         90Ii7NNP0+PoQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 3/7] hwmon: (it87) List full chip model name
Date:   Sat, 28 Jan 2023 17:03:04 +1100
Message-Id: <20230128060308.1549707-4-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230128060308.1549707-1-frank@crawford.emu.id.au>
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 28 Jan 2023 17:03:35 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

ITE model names do not always match the chip ID.

Convert from just adding a suffix to specifying the full model name.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v3:
 * No change.

v2:
 * No change.

---
 drivers/hwmon/it87.c | 46 ++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 45d4b5ee3701..1d9f0c6dfeb9 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -277,7 +277,7 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 
 struct it87_devices {
 	const char *name;
-	const char * const suffix;
+	const char * const model;
 	u32 features;
 	u8 peci_mask;
 	u8 old_peci_mask;
@@ -313,24 +313,24 @@ struct it87_devices {
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
 		.name = "it87",
-		.suffix = "F",
+		.model = "IT87F",
 		.features = FEAT_OLD_AUTOPWM,	/* may need to overwrite */
 	},
 	[it8712] = {
 		.name = "it8712",
-		.suffix = "F",
+		.model = "IT8712F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_VID,
 						/* may need to overwrite */
 	},
 	[it8716] = {
 		.name = "it8716",
-		.suffix = "F",
+		.model = "IT8716F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2,
 	},
 	[it8718] = {
 		.name = "it8718",
-		.suffix = "F",
+		.model = "IT8718F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2,
@@ -338,7 +338,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8720] = {
 		.name = "it8720",
-		.suffix = "F",
+		.model = "IT8720F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2,
@@ -346,7 +346,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8721] = {
 		.name = "it8721",
-		.suffix = "F",
+		.model = "IT8721F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
@@ -356,7 +356,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8728] = {
 		.name = "it8728",
-		.suffix = "F",
+		.model = "IT8728F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2,
@@ -364,7 +364,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8732] = {
 		.name = "it8732",
-		.suffix = "F",
+		.model = "IT8732F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
@@ -373,7 +373,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8771] = {
 		.name = "it8771",
-		.suffix = "E",
+		.model = "IT8771E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2,
@@ -385,7 +385,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8772] = {
 		.name = "it8772",
-		.suffix = "E",
+		.model = "IT8772E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2,
@@ -397,28 +397,28 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8781] = {
 		.name = "it8781",
-		.suffix = "F",
+		.model = "IT8781F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
 		.old_peci_mask = 0x4,
 	},
 	[it8782] = {
 		.name = "it8782",
-		.suffix = "F",
+		.model = "IT8782F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
 		.old_peci_mask = 0x4,
 	},
 	[it8783] = {
 		.name = "it8783",
-		.suffix = "E/F",
+		.model = "IT8783E/F",
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2,
 		.old_peci_mask = 0x4,
 	},
 	[it8786] = {
 		.name = "it8786",
-		.suffix = "E",
+		.model = "IT8786E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2,
@@ -426,7 +426,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8790] = {
 		.name = "it8790",
-		.suffix = "E",
+		.model = "IT8790E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_CONF_NOEXIT,
@@ -434,7 +434,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8792] = {
 		.name = "it8792",
-		.suffix = "E",
+		.model = "IT8792E/IT8795E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_CONF_NOEXIT,
@@ -443,7 +443,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8603] = {
 		.name = "it8603",
-		.suffix = "E",
+		.model = "IT8603E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
@@ -451,7 +451,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8620] = {
 		.name = "it8620",
-		.suffix = "E",
+		.model = "IT8620E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
@@ -460,7 +460,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8622] = {
 		.name = "it8622",
-		.suffix = "E",
+		.model = "IT8622E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
@@ -469,7 +469,7 @@ static const struct it87_devices it87_devices[] = {
 	},
 	[it8628] = {
 		.name = "it8628",
-		.suffix = "E",
+		.model = "IT8628E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
@@ -2516,8 +2516,8 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	err = 0;
 	sio_data->sioaddr = sioaddr;
 	sio_data->revision = superio_inb(sioaddr, DEVREV) & 0x0f;
-	pr_info("Found IT%04x%s chip at 0x%x, revision %d\n", chip_type,
-		it87_devices[sio_data->type].suffix,
+	pr_info("Found %s chip at 0x%x, revision %d\n",
+		it87_devices[sio_data->type].model,
 		*address, sio_data->revision);
 
 	/* in7 (VSB or VCCH5V) is always internal on some chips */
-- 
2.39.1

