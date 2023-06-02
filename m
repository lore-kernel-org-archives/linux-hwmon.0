Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E00C77B7A
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jun 2023 21:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbjFBVfG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Jun 2023 17:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236503AbjFBVfE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Jun 2023 17:35:04 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4F6E72
        for <linux-hwmon@vger.kernel.org>; Fri,  2 Jun 2023 14:34:52 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2568fc3d8a9so1229466a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 02 Jun 2023 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685741691; x=1688333691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xAKOI5KT0x2RZ7fcgJr0ntdfvsIv4g5vVGgKw+JsGjM=;
        b=lDQJKfpLiILO2f/My2kBkFJoABO3TE3IuGPU3XuV/WTvtGhKxSQdSqwgTq1kV7SYYW
         x9mNYbst8Dz/YPhti/ZKKoyRQQGHI8Tcg4eTJO8xlqvCmw3Oe2sieNgrLNy4uJxKlDzP
         42Lp4k6G6X8ElGhbTuF+o66DlmziloruDSOfZ/YhslbzitMtonJutStnWMStwnmjPYA7
         8xYRCQ80HU7t2x161o2nU/rRESxRgyX/jG6KuBCopig46wQFeGeNCi2tpHU5GRZhsXo1
         omOckJlUm2jvji0PyocKqdu4WE3iN6LXA14MNLq6uLLxJ4DsFLTt2Ybcq/bOWNS5+0hV
         nQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685741691; x=1688333691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAKOI5KT0x2RZ7fcgJr0ntdfvsIv4g5vVGgKw+JsGjM=;
        b=YPOjnh9QFCyJKIuZWKP0RRb3nbu6m36oYlp4PS4wo4PLQppg3LgqegL2Ubk7nCFxF4
         6vmG+7YNPbW46Y/O7VWEpdx2V2wLLUWQ9KQli6lJ0QfxDOH84vkLY7YypUtUd+hjsUfN
         7QD9almXDFyLxhKPsZhUqEXYe/UBysORf3athGCkUGhREtMHaWOS8W/wLbIbMXpAPJ/7
         oXA3GmUqRbYx+eFGfqtcPXXB/K1WCoA9zqx05uB2pnpVHBpQk5EJKrmULRyykQShLEFu
         wAFdnBZ39K7GURUSg937aoepUXIUK7lnPXZ3PYz/+4VTekbYuY96LDquzlqTC32uAm/n
         059g==
X-Gm-Message-State: AC+VfDwSMQ8RySAL64r3JMObC5Y4ZjTEUKQ3MueTxcDm8TMQ7cC4eRMV
        7azF5gu/R+ssCXTfgYBA4egJiHK6oHI=
X-Google-Smtp-Source: ACHHUZ6OXkEKYaGU65zTSFkPOBCHITtQq9tKh+/VnIJhXJlXBsBU0HTDtHNTiaP2usEpWA++15kw5A==
X-Received: by 2002:a17:90a:4fe6:b0:257:a8bf:b2ec with SMTP id q93-20020a17090a4fe600b00257a8bfb2ecmr848043pjh.45.1685741690956;
        Fri, 02 Jun 2023 14:34:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h14-20020a17090adb8e00b00250aa8ef89csm1682216pjv.18.2023.06.02.14.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 14:34:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Chu Lin <linchuyuan@google.com>, Arthur Korn <akorn@google.com>,
        Xiuyan Han <lilyhan@google.com>, Willy Tu <wltu@google.com>,
        Gregory Sizikov <gsizikov@google.com>,
        Zichao Ye <yezichao@google.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus/adm1275) Fix problems with temperature monitoring on ADM1272
Date:   Fri,  2 Jun 2023 14:34:47 -0700
Message-Id: <20230602213447.3557346-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The PMON_CONFIG register on ADM1272 is a 16 bit register. Writing a 8 bit
value into it clears the upper 8 bits of the register, resulting in
unexpected side effects. Fix by writing the 16 bit register value.

Also, it has been reported that temperature readings are sometimes widely
inaccurate, to the point where readings may result in device shutdown due
to errant overtemperature faults. Improve by enabling temperature sampling.

While at it, move the common code for ADM1272 and ADM1278 into a separate
function, and clarify in the error message that an attempt was made to
enable both VOUT and temperature monitoring.

Last but not least, return the error code reported by the underlying I2C
controller and not -ENODEV if updating the PMON_CONFIG register fails.
After all, this does not indicate that the chip is not present, but an
error in the communication with the chip.

Fixes: 4ff0ce227a1e ("hwmon: (pmbus/adm1275) Add support for ADM1272")
Fixes: 9da9c2dc57b2 ("hwmon: (adm1275) enable adm1272 temperature reporting")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/adm1275.c | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index b358d137c76f..49d59b745afe 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -37,10 +37,13 @@ enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
 
 #define ADM1272_IRANGE			BIT(0)
 
+#define ADM1278_TSFILT			BIT(15)
 #define ADM1278_TEMP1_EN		BIT(3)
 #define ADM1278_VIN_EN			BIT(2)
 #define ADM1278_VOUT_EN			BIT(1)
 
+#define ADM1278_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN | ADM1278_TSFILT)
+
 #define ADM1293_IRANGE_25		0
 #define ADM1293_IRANGE_50		BIT(6)
 #define ADM1293_IRANGE_100		BIT(7)
@@ -462,6 +465,22 @@ static const struct i2c_device_id adm1275_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adm1275_id);
 
+/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
+static int adm1275_enable_vout_temp(struct i2c_client *client, int config)
+{
+	int ret;
+
+	if ((config & ADM1278_PMON_DEFCONFIG) != ADM1278_PMON_DEFCONFIG) {
+		config |= ADM1278_PMON_DEFCONFIG;
+		ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG, config);
+		if (ret < 0) {
+			dev_err(&client->dev, "Failed to enable VOUT/TEMP1 monitoring\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
 static int adm1275_probe(struct i2c_client *client)
 {
 	s32 (*config_read_fn)(const struct i2c_client *client, u8 reg);
@@ -615,19 +634,10 @@ static int adm1275_probe(struct i2c_client *client)
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 
-		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
-		if ((config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) !=
-		    (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) {
-			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
-			ret = i2c_smbus_write_byte_data(client,
-							ADM1275_PMON_CONFIG,
-							config);
-			if (ret < 0) {
-				dev_err(&client->dev,
-					"Failed to enable VOUT monitoring\n");
-				return -ENODEV;
-			}
-		}
+		ret = adm1275_enable_vout_temp(client, config);
+		if (ret)
+			return ret;
+
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |= PMBUS_HAVE_VIN;
 		break;
@@ -684,19 +694,9 @@ static int adm1275_probe(struct i2c_client *client)
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 
-		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
-		if ((config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) !=
-		    (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) {
-			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
-			ret = i2c_smbus_write_word_data(client,
-							ADM1275_PMON_CONFIG,
-							config);
-			if (ret < 0) {
-				dev_err(&client->dev,
-					"Failed to enable VOUT monitoring\n");
-				return -ENODEV;
-			}
-		}
+		ret = adm1275_enable_vout_temp(client, config);
+		if (ret)
+			return ret;
 
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |= PMBUS_HAVE_VIN;
-- 
2.39.2

