Return-Path: <SRS0=qGwe=UT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066C5C43613
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Jun 2019 19:26:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1ED72082C
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Jun 2019 19:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="PSmDp6h8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfFTT0L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Jun 2019 15:26:11 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44638 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbfFTT0L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Jun 2019 15:26:11 -0400
Received: by mail-pf1-f193.google.com with SMTP id t16so2201110pfe.11
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Jun 2019 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id;
        bh=SPQHwndhpaVF2ho38xil6G4q4+qciQi13AEfJH07lTQ=;
        b=PSmDp6h8405bleqr0GGfZqaNHzomutjJpACdqPm6f5jnBCnfGCZvVMcaoyIx1R51bb
         BBo197jM6uL3GchIhCqOFCC4GON9BCWkjl6rUl2RC/oNLQKhKHcIVFKnD52IgnOWxy2n
         97a61wTiYRf5xkYXAxGPViqerPQWt4i/IakIaeNosbtuyIjiwfxCyXT3Z6ZXQFoXfrXd
         69jNjnLXl6Rde6KSvL5jlFQhLUBXLjxPFXvFJWhFsgDnyr4KoLQANbJfT0jxLY18k5sR
         n40PO7PT++FwL071HEg44ZgM4r3FvPBoWsPWb+lBaahv38CtqQUDS0se3T+25BPcpms/
         RPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SPQHwndhpaVF2ho38xil6G4q4+qciQi13AEfJH07lTQ=;
        b=BXD3lFbardEbjtMR/sz2gLgwWGFotH2S8HlWNINTzI4jRdmcpqeQgZDCz0OHE48E+I
         F71kcqreskLfHmC5LTZLPloGsNdKkmXeNGpW+k7cOW7qQro39YnvuTaAiyzm6q6c+UNz
         P4Ey0g6Nw7QFC8oJcZjcdR6Awcr7z0CZWXQ29Kpd7hUrJNR8vVeoO+MPEVNN45CpsE/s
         45e7lEHjgdZcgtYeDIPpKpgwdEbYHbX3QLV9TK9+02aZl2ykqKjaPvm6WVFtVpvb/vwa
         8vU7gqBzVFWuEPTcwhIJrMNR7D3Err56DtQeXWJsIPD+ZLlvejkSM+yYrFLQCOTqAXEJ
         dzug==
X-Gm-Message-State: APjAAAVpkMiCouH+05RpqfC5IqXEyWvXnxzW/aOWr9dX2RvvhsVmLnc8
        zOa4fvT0Tnj5PTgFSuEOPMZ+Tg==
X-Google-Smtp-Source: APXvYqwvA5Di+qoUleoEVSsVNaRtB0lvoAfM9Tj6iczjDwHj7hFNOviqjNK0hq+a49UeucbcMtOMXA==
X-Received: by 2002:aa7:8e17:: with SMTP id c23mr2068424pfr.227.1561058770651;
        Thu, 20 Jun 2019 12:26:10 -0700 (PDT)
Received: from 60503ba3570b.aristanetworks.com ([208.66.251.34])
        by smtp.gmail.com with ESMTPSA id d187sm270977pfa.38.2019.06.20.12.26.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 12:26:10 -0700 (PDT)
From:   Boyang Yu <byu@arista.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, deank@arista.com, ryant@arista.com,
        byu@arista.com
Subject: [PATCH] hwmon: (lm90) Fix max6658 sporadic wrong temperature reading
Date:   Thu, 20 Jun 2019 19:25:25 +0000
Message-Id: <20190620192525.4557-1-byu@arista.com>
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
wrong reading is not reproduced. As the issue is only found on
max6658, apply this change only to the max6657 kind.

Signed-off-by: Boyang Yu <byu@arista.com>
---
 drivers/hwmon/lm90.c | 54 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index e562a578f20e..de551c51a908 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -567,6 +567,35 @@ static inline int lm90_select_remote_channel(struct i2c_client *client,
 	return 0;
 }
 
+static int max6657_write_convrate(struct i2c_client *client, int val)
+{
+	int err_c = 0;
+	int err;
+	int config_orig, config_stop;
+
+	/* Save config and stop conversion*/
+	config_orig = lm90_read_reg(client, LM90_REG_R_CONFIG1);
+	if (config_orig < 0)
+		return config_orig;
+	config_stop = config_orig | 0x40;
+	if (config_orig != config_stop) {
+		err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
+						config_stop);
+		if (err < 0)
+			return err;
+	}
+
+	/* Set conv rate */
+	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, val);
+
+	/* Revert change to config */
+	if (config_orig != config_stop)
+		err_c = i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
+						  config_orig);
+
+	return err < 0 ? err : err_c;
+}
+
 /*
  * Set conversion rate.
  * client->update_lock must be held when calling this function (unless we are
@@ -587,7 +616,11 @@ static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
 		if (interval >= update_interval * 3 / 4)
 			break;
 
-	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, i);
+	if (data->kind == max6657)
+		err = max6657_write_convrate(client, i);
+	else
+		err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, i);
+
 	data->update_interval = DIV_ROUND_CLOSEST(update_interval, 64);
 	return err;
 }
@@ -1593,8 +1626,11 @@ static void lm90_restore_conf(void *_data)
 	struct i2c_client *client = data->client;
 
 	/* Restore initial configuration */
-	i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE,
-				  data->convrate_orig);
+	if (data->kind == max6657)
+		max6657_write_convrate(client, data->convrate_orig);
+	else
+		i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE,
+					  data->convrate_orig);
 	i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
 				  data->config_orig);
 }
@@ -1602,6 +1638,7 @@ static void lm90_restore_conf(void *_data)
 static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 {
 	int config, convrate;
+	int err;
 
 	convrate = lm90_read_reg(client, LM90_REG_R_CONVRATE);
 	if (convrate < 0)
@@ -1611,12 +1648,21 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 	/*
 	 * Start the conversions.
 	 */
-	lm90_set_convrate(client, data, 500);	/* 500ms; 2Hz conversion rate */
+	/* 500ms; 2Hz conversion rate */
+	if (data->kind != max6657)
+		lm90_set_convrate(client, data, 500);
+
 	config = lm90_read_reg(client, LM90_REG_R_CONFIG1);
 	if (config < 0)
 		return config;
 	data->config_orig = config;
 
+	if (data->kind == max6657) {
+		err = lm90_set_convrate(client, data, 500);
+		if (err < 0)
+			return err;
+	}
+
 	/* Check Temperature Range Select */
 	if (data->kind == adt7461 || data->kind == tmp451) {
 		if (config & 0x04)
-- 
2.17.1

