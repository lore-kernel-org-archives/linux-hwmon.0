Return-Path: <SRS0=eEP0=U3=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21C6C5B579
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Jun 2019 19:06:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8890B21670
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Jun 2019 19:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="BtCqfag6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfF1TG4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 Jun 2019 15:06:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37446 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfF1TG4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Jun 2019 15:06:56 -0400
Received: by mail-pf1-f194.google.com with SMTP id 19so3457759pfa.4
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Jun 2019 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id;
        bh=EAaJvSjh1Qpop8hD5TNRhAompNv+uu/0yQuR4dbAGMw=;
        b=BtCqfag6CgUBPhu5sudl+3cZtVwxSzKHkrRj0qUjA0J0YEIR+L9rGj4pB0jrpujBpa
         iqU6sb9cfxFscEyY7EJqlvyzYdik70Lb6Iq1y8DGmdjYEA7QTu7ugIm4zLryHHJFvcmZ
         FpsdFE/IjuiwnUzOrc2ayU0pW1pgoUF46YmYcLNRxgdPmwsBPxueiveazTFsXaCWUiMk
         nlUlslDs41ss9k2K27tsgS2b0+FkWg7m77ipEHVgN0A991mOlDCbmVVxgtQmhA3E7e9W
         fXU3ZBzFGVVuymtnDMIeKim4ld3myfL9hRyyKWfWLfzEZc+AtYGy67RnzzSZOTfwe3M4
         1wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EAaJvSjh1Qpop8hD5TNRhAompNv+uu/0yQuR4dbAGMw=;
        b=egHMQii7n/IvPQtAp3PrOsolZQPRZ35e4Sl4TfL3VNdI3OED0Iu1bxA150lQey1Vmr
         gu65dth7RJLniW17n0iWTsyHi418UPpvT4Wu4TVcczXUjm31x0uuywWZjJxQYEGHi7Fx
         muKf6n9SRatqsXLKS/N9SYTkbnKePjWoVEHjqv7po7tr0zElaN6wsant0RzANx72Mczf
         +TznvIppYv4Y7YTUpCR8Fj1/Yg7vFspluk9ss5YTljNTgLSa55aJTRakoV7vwYZ8v9vL
         0yyte8fMW7aXxfk9+YgttzALHYOv6ZAddvDFp6ghgLmyrAwygphK5gXWY16sv5t+W6Nx
         uUUw==
X-Gm-Message-State: APjAAAUmtEZ2z2HVPGN0wHtqTSqzubCUSoBS8VQ+O7XiegvRQVcJR1T6
        wYHDSh3viCZtgkqnXjmJLJZ15A==
X-Google-Smtp-Source: APXvYqwdQFkd/S16/hxxBxhoxi11tjqyKx6oL/z5Bn3SuXS74/P3jq36ODrQes85xzAi6ixO1dJZGA==
X-Received: by 2002:a63:2985:: with SMTP id p127mr10092292pgp.400.1561748815490;
        Fri, 28 Jun 2019 12:06:55 -0700 (PDT)
Received: from 60503ba3570b.aristanetworks.com ([208.66.251.34])
        by smtp.gmail.com with ESMTPSA id p2sm4032383pfb.118.2019.06.28.12.06.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 12:06:54 -0700 (PDT)
From:   Boyang Yu <byu@arista.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, deank@arista.com, ryant@arista.com,
        byu@arista.com
Subject: [PATCH v2] hwmon: (lm90) Fix max6658 sporadic wrong temperature reading
Date:   Fri, 28 Jun 2019 19:06:36 +0000
Message-Id: <20190628190636.5565-1-byu@arista.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

max6658 may report unrealistically high temperature during
the driver initialization, for which, its overtemp alarm pin
also gets asserted. For certain devices implementing overtemp
protection based on that pin, it may further trigger a reset to
the device. By reproducing the problem, the wrong reading is
found to be coincident with changing the conversion rate.

To mitigate this issue, set the stop bit before changing the
conversion rate and unset it thereafter. After such change, the
wrong reading is not reproduced. Apply this change only to the
max6657 kind for now, controlled by flag LM90_PAUSE_ON_CONFIG.

Signed-off-by: Boyang Yu <byu@arista.com>
---
 drivers/hwmon/lm90.c | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index e562a578f20e..bd00d8eac066 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -174,6 +174,7 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 #define LM90_HAVE_EMERGENCY_ALARM (1 << 5)/* emergency alarm		*/
 #define LM90_HAVE_TEMP3		(1 << 6) /* 3rd temperature sensor	*/
 #define LM90_HAVE_BROKEN_ALERT	(1 << 7) /* Broken alert		*/
+#define LM90_PAUSE_FOR_CONFIG	(1 << 8) /* Pause conversion for config	*/
 
 /* LM90 status */
 #define LM90_STATUS_LTHRM	(1 << 0) /* local THERM limit tripped */
@@ -367,6 +368,7 @@ static const struct lm90_params lm90_params[] = {
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
 	},
 	[max6657] = {
+		.flags = LM90_PAUSE_FOR_CONFIG,
 		.alert_alarms = 0x7c,
 		.max_convrate = 8,
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
@@ -567,6 +569,38 @@ static inline int lm90_select_remote_channel(struct i2c_client *client,
 	return 0;
 }
 
+static int lm90_write_convrate(struct i2c_client *client,
+			       struct lm90_data *data, int val)
+{
+	int err;
+	int config_orig, config_stop;
+
+	/* Save config and pause conversion */
+	if (data->flags & LM90_PAUSE_FOR_CONFIG) {
+		config_orig = lm90_read_reg(client, LM90_REG_R_CONFIG1);
+		if (config_orig < 0)
+			return config_orig;
+		config_stop = config_orig | 0x40;
+		if (config_orig != config_stop) {
+			err = i2c_smbus_write_byte_data(client,
+							LM90_REG_W_CONFIG1,
+							config_stop);
+			if (err < 0)
+				return err;
+		}
+	}
+
+	/* Set conv rate */
+	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, val);
+
+	/* Revert change to config */
+	if (data->flags & LM90_PAUSE_FOR_CONFIG && config_orig != config_stop)
+		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
+					  config_orig);
+
+	return err;
+}
+
 /*
  * Set conversion rate.
  * client->update_lock must be held when calling this function (unless we are
@@ -587,7 +621,7 @@ static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
 		if (interval >= update_interval * 3 / 4)
 			break;
 
-	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, i);
+	err = lm90_write_convrate(client, data, i);
 	data->update_interval = DIV_ROUND_CLOSEST(update_interval, 64);
 	return err;
 }
@@ -1593,8 +1627,7 @@ static void lm90_restore_conf(void *_data)
 	struct i2c_client *client = data->client;
 
 	/* Restore initial configuration */
-	i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE,
-				  data->convrate_orig);
+	lm90_write_convrate(client, data, data->convrate_orig);
 	i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
 				  data->config_orig);
 }
@@ -1611,12 +1644,13 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 	/*
 	 * Start the conversions.
 	 */
-	lm90_set_convrate(client, data, 500);	/* 500ms; 2Hz conversion rate */
 	config = lm90_read_reg(client, LM90_REG_R_CONFIG1);
 	if (config < 0)
 		return config;
 	data->config_orig = config;
 
+	lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
+
 	/* Check Temperature Range Select */
 	if (data->kind == adt7461 || data->kind == tmp451) {
 		if (config & 0x04)
-- 
2.17.1

