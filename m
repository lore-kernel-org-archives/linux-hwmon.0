Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F75C32771
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 13:57:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiIXN5z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Sep 2022 09:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiIXN5z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Sep 2022 09:57:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BBCE513E
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 06:57:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oc5fD-0005Gw-6u; Sat, 24 Sep 2022 15:57:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oc5fC-002ewz-F9; Sat, 24 Sep 2022 15:57:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oc5fA-003E11-DO; Sat, 24 Sep 2022 15:57:48 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/2] hwmon: sis5595: Reorder symbols to get rid of a few forward declarations
Date:   Sat, 24 Sep 2022 15:57:38 +0200
Message-Id: <20220924135738.234051-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220924135738.234051-1-u.kleine-koenig@pengutronix.de>
References: <20220924135738.234051-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7409; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/WlUxm1TFK5TMeDgjOqRyDZbCkx0aUuQqJWC7X1dZsM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjLwzP0vqMiYUTKVqf/5j3EdctBFT/03KKytyHqJB0 PVCIuC+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYy8MzwAKCRDB/BR4rcrsCf7EB/ 47tbyt7YVPp2VBPcnIsuPsNoHZ2HL1v/DXn9Nuv0w7DUPAS5mmj4pIewdUQGZLRj1mjAIxIrHaHTAU mG0m9WvscZRIkVhV/qPWuWY4GGLMxZCFhQg0OZINAU6Tadsi7t9G4ySajFxrxCS/FlwEEVbFznzt2A kdXVA+wD5wnN4hJuc7K1mawMuA1PDiaf+K609Ixc9ZOzP7OKSQ0LoeKXmuNTHfbDPENkUHS1r/tUIX FkIGKQY2zLvAfzQ1li9aL48B1/kL1pR4jIv4rRX/8wxwkWmNHHKNn+OWKe88clayxDiWJPtyzDSWnn dXb+SYwx2wGmmsHqQQplj3/zUj4mQx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Declarations for static symbols are useless repetition unless there are
cyclic dependencies.

Reorder the functions and variables to get rid of 4 forward declarations.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/via686a.c | 194 +++++++++++++++++++---------------------
 1 file changed, 94 insertions(+), 100 deletions(-)

diff --git a/drivers/hwmon/via686a.c b/drivers/hwmon/via686a.c
index b17121881235..37d7374896f6 100644
--- a/drivers/hwmon/via686a.c
+++ b/drivers/hwmon/via686a.c
@@ -323,9 +323,6 @@ struct via686a_data {
 
 static struct pci_dev *s_bridge;	/* pointer to the (only) via686a */
 
-static int via686a_probe(struct platform_device *pdev);
-static int via686a_remove(struct platform_device *pdev);
-
 static inline int via686a_read_value(struct via686a_data *data, u8 reg)
 {
 	return inb_p(data->addr + reg);
@@ -337,8 +334,76 @@ static inline void via686a_write_value(struct via686a_data *data, u8 reg,
 	outb_p(value, data->addr + reg);
 }
 
-static struct via686a_data *via686a_update_device(struct device *dev);
-static void via686a_init_device(struct via686a_data *data);
+static void via686a_update_fan_div(struct via686a_data *data)
+{
+	int reg = via686a_read_value(data, VIA686A_REG_FANDIV);
+	data->fan_div[0] = (reg >> 4) & 0x03;
+	data->fan_div[1] = reg >> 6;
+}
+
+static struct via686a_data *via686a_update_device(struct device *dev)
+{
+	struct via686a_data *data = dev_get_drvdata(dev);
+	int i;
+
+	mutex_lock(&data->update_lock);
+
+	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	    || !data->valid) {
+		for (i = 0; i <= 4; i++) {
+			data->in[i] =
+			    via686a_read_value(data, VIA686A_REG_IN(i));
+			data->in_min[i] = via686a_read_value(data,
+							     VIA686A_REG_IN_MIN
+							     (i));
+			data->in_max[i] =
+			    via686a_read_value(data, VIA686A_REG_IN_MAX(i));
+		}
+		for (i = 1; i <= 2; i++) {
+			data->fan[i - 1] =
+			    via686a_read_value(data, VIA686A_REG_FAN(i));
+			data->fan_min[i - 1] = via686a_read_value(data,
+						     VIA686A_REG_FAN_MIN(i));
+		}
+		for (i = 0; i <= 2; i++) {
+			data->temp[i] = via686a_read_value(data,
+						 VIA686A_REG_TEMP[i]) << 2;
+			data->temp_over[i] =
+			    via686a_read_value(data,
+					       VIA686A_REG_TEMP_OVER[i]);
+			data->temp_hyst[i] =
+			    via686a_read_value(data,
+					       VIA686A_REG_TEMP_HYST[i]);
+		}
+		/*
+		 * add in lower 2 bits
+		 * temp1 uses bits 7-6 of VIA686A_REG_TEMP_LOW1
+		 * temp2 uses bits 5-4 of VIA686A_REG_TEMP_LOW23
+		 * temp3 uses bits 7-6 of VIA686A_REG_TEMP_LOW23
+		 */
+		data->temp[0] |= (via686a_read_value(data,
+						     VIA686A_REG_TEMP_LOW1)
+				  & 0xc0) >> 6;
+		data->temp[1] |=
+		    (via686a_read_value(data, VIA686A_REG_TEMP_LOW23) &
+		     0x30) >> 4;
+		data->temp[2] |=
+		    (via686a_read_value(data, VIA686A_REG_TEMP_LOW23) &
+		     0xc0) >> 6;
+
+		via686a_update_fan_div(data);
+		data->alarms =
+		    via686a_read_value(data,
+				       VIA686A_REG_ALARM1) |
+		    (via686a_read_value(data, VIA686A_REG_ALARM2) << 8);
+		data->last_updated = jiffies;
+		data->valid = true;
+	}
+
+	mutex_unlock(&data->update_lock);
+
+	return data;
+}
 
 /* following are the sysfs callback functions */
 
@@ -656,13 +721,23 @@ static const struct attribute_group via686a_group = {
 	.attrs = via686a_attributes,
 };
 
-static struct platform_driver via686a_driver = {
-	.driver = {
-		.name	= DRIVER_NAME,
-	},
-	.probe		= via686a_probe,
-	.remove		= via686a_remove,
-};
+static void via686a_init_device(struct via686a_data *data)
+{
+	u8 reg;
+
+	/* Start monitoring */
+	reg = via686a_read_value(data, VIA686A_REG_CONFIG);
+	via686a_write_value(data, VIA686A_REG_CONFIG, (reg | 0x01) & 0x7F);
+
+	/* Configure temp interrupt mode for continuous-interrupt operation */
+	reg = via686a_read_value(data, VIA686A_REG_TEMP_MODE);
+	via686a_write_value(data, VIA686A_REG_TEMP_MODE,
+			    (reg & ~VIA686A_TEMP_MODE_MASK)
+			    | VIA686A_TEMP_MODE_CONTINUOUS);
+
+	/* Pre-read fan clock divisor values */
+	via686a_update_fan_div(data);
+}
 
 /* This is called when the module is loaded */
 static int via686a_probe(struct platform_device *pdev)
@@ -721,94 +796,13 @@ static int via686a_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static void via686a_update_fan_div(struct via686a_data *data)
-{
-	int reg = via686a_read_value(data, VIA686A_REG_FANDIV);
-	data->fan_div[0] = (reg >> 4) & 0x03;
-	data->fan_div[1] = reg >> 6;
-}
-
-static void via686a_init_device(struct via686a_data *data)
-{
-	u8 reg;
-
-	/* Start monitoring */
-	reg = via686a_read_value(data, VIA686A_REG_CONFIG);
-	via686a_write_value(data, VIA686A_REG_CONFIG, (reg | 0x01) & 0x7F);
-
-	/* Configure temp interrupt mode for continuous-interrupt operation */
-	reg = via686a_read_value(data, VIA686A_REG_TEMP_MODE);
-	via686a_write_value(data, VIA686A_REG_TEMP_MODE,
-			    (reg & ~VIA686A_TEMP_MODE_MASK)
-			    | VIA686A_TEMP_MODE_CONTINUOUS);
-
-	/* Pre-read fan clock divisor values */
-	via686a_update_fan_div(data);
-}
-
-static struct via686a_data *via686a_update_device(struct device *dev)
-{
-	struct via686a_data *data = dev_get_drvdata(dev);
-	int i;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
-		for (i = 0; i <= 4; i++) {
-			data->in[i] =
-			    via686a_read_value(data, VIA686A_REG_IN(i));
-			data->in_min[i] = via686a_read_value(data,
-							     VIA686A_REG_IN_MIN
-							     (i));
-			data->in_max[i] =
-			    via686a_read_value(data, VIA686A_REG_IN_MAX(i));
-		}
-		for (i = 1; i <= 2; i++) {
-			data->fan[i - 1] =
-			    via686a_read_value(data, VIA686A_REG_FAN(i));
-			data->fan_min[i - 1] = via686a_read_value(data,
-						     VIA686A_REG_FAN_MIN(i));
-		}
-		for (i = 0; i <= 2; i++) {
-			data->temp[i] = via686a_read_value(data,
-						 VIA686A_REG_TEMP[i]) << 2;
-			data->temp_over[i] =
-			    via686a_read_value(data,
-					       VIA686A_REG_TEMP_OVER[i]);
-			data->temp_hyst[i] =
-			    via686a_read_value(data,
-					       VIA686A_REG_TEMP_HYST[i]);
-		}
-		/*
-		 * add in lower 2 bits
-		 * temp1 uses bits 7-6 of VIA686A_REG_TEMP_LOW1
-		 * temp2 uses bits 5-4 of VIA686A_REG_TEMP_LOW23
-		 * temp3 uses bits 7-6 of VIA686A_REG_TEMP_LOW23
-		 */
-		data->temp[0] |= (via686a_read_value(data,
-						     VIA686A_REG_TEMP_LOW1)
-				  & 0xc0) >> 6;
-		data->temp[1] |=
-		    (via686a_read_value(data, VIA686A_REG_TEMP_LOW23) &
-		     0x30) >> 4;
-		data->temp[2] |=
-		    (via686a_read_value(data, VIA686A_REG_TEMP_LOW23) &
-		     0xc0) >> 6;
-
-		via686a_update_fan_div(data);
-		data->alarms =
-		    via686a_read_value(data,
-				       VIA686A_REG_ALARM1) |
-		    (via686a_read_value(data, VIA686A_REG_ALARM2) << 8);
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-
-	mutex_unlock(&data->update_lock);
-
-	return data;
-}
+static struct platform_driver via686a_driver = {
+	.driver = {
+		.name	= DRIVER_NAME,
+	},
+	.probe		= via686a_probe,
+	.remove		= via686a_remove,
+};
 
 static const struct pci_device_id via686a_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C686_4) },
-- 
2.37.2

