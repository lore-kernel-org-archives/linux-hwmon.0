Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F2EC6FA82
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 07:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiIVHtT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 03:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiIVHtS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 03:49:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7225B5A6E
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 00:49:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1obGxO-0005GZ-8H; Thu, 22 Sep 2022 09:49:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1obGxO-002D8t-B5; Thu, 22 Sep 2022 09:49:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1obGxL-002fH5-V1; Thu, 22 Sep 2022 09:49:11 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     kernel@pengutronix.de, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: sis5595: Reorder symbols to get rid of a few forward declarations
Date:   Thu, 22 Sep 2022 09:49:00 +0200
Message-Id: <20220922074900.2763331-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220922074900.2763331-1-u.kleine-koenig@pengutronix.de>
References: <20220922074900.2763331-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6777; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=U+vVyr5QQrNC2Ry6ieNLCy+nvhmxWTKiNubmGCV0GtI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjLBNpKIdVE8T4yVOEDioWpzAReVjeiaRBNrMgMjVg xm5BCj2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYywTaQAKCRDB/BR4rcrsCbvTCA CcIDpX8tC33qyxXOX9MHKaCbpXLdQtz7vAzvhFZF2pKyTq99icyyUtPjfqgHrxFotHwYugwEVGYoZD 3NlOpZ4j0rp4p2/9rNduY8w2R0hjISlIlQPm+KHVnB0L3gE38VBU5SSbnVCEQaQb6T8qOZS7mw6fhQ Pdzp48899Sd2DVgGDq/R4tXnlslyjBn+hEmsOoZOIH/tqo67EA2HTBA4tkOS/qLq6ev1Jpxg7VOGQJ 87qPBgsVoYUy5EttunO5Ou3fEus8w0Nz5olVT9tEktlke9uFBg+GK4g3ypQTAsyn6nDueqQ/SNxDod DzcfMdrzgTbtftgfUgM4JAdy9K+VIY
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

Reorder the functions and variables to get rid of 6 forward declarations.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/sis5595.c | 176 +++++++++++++++++++---------------------
 1 file changed, 84 insertions(+), 92 deletions(-)

diff --git a/drivers/hwmon/sis5595.c b/drivers/hwmon/sis5595.c
index 013f87da6fff..b0b05fd12221 100644
--- a/drivers/hwmon/sis5595.c
+++ b/drivers/hwmon/sis5595.c
@@ -192,21 +192,75 @@ struct sis5595_data {
 
 static struct pci_dev *s_bridge;	/* pointer to the (only) sis5595 */
 
-static int sis5595_probe(struct platform_device *pdev);
-static int sis5595_remove(struct platform_device *pdev);
+/* ISA access must be locked explicitly. */
+static int sis5595_read_value(struct sis5595_data *data, u8 reg)
+{
+	int res;
 
-static int sis5595_read_value(struct sis5595_data *data, u8 reg);
-static void sis5595_write_value(struct sis5595_data *data, u8 reg, u8 value);
-static struct sis5595_data *sis5595_update_device(struct device *dev);
-static void sis5595_init_device(struct sis5595_data *data);
+	mutex_lock(&data->lock);
+	outb_p(reg, data->addr + SIS5595_ADDR_REG_OFFSET);
+	res = inb_p(data->addr + SIS5595_DATA_REG_OFFSET);
+	mutex_unlock(&data->lock);
+	return res;
+}
 
-static struct platform_driver sis5595_driver = {
-	.driver = {
-		.name	= DRIVER_NAME,
-	},
-	.probe		= sis5595_probe,
-	.remove		= sis5595_remove,
-};
+static void sis5595_write_value(struct sis5595_data *data, u8 reg, u8 value)
+{
+	mutex_lock(&data->lock);
+	outb_p(reg, data->addr + SIS5595_ADDR_REG_OFFSET);
+	outb_p(value, data->addr + SIS5595_DATA_REG_OFFSET);
+	mutex_unlock(&data->lock);
+}
+
+static struct sis5595_data *sis5595_update_device(struct device *dev)
+{
+	struct sis5595_data *data = dev_get_drvdata(dev);
+	int i;
+
+	mutex_lock(&data->update_lock);
+
+	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	    || !data->valid) {
+
+		for (i = 0; i <= data->maxins; i++) {
+			data->in[i] =
+			    sis5595_read_value(data, SIS5595_REG_IN(i));
+			data->in_min[i] =
+			    sis5595_read_value(data,
+					       SIS5595_REG_IN_MIN(i));
+			data->in_max[i] =
+			    sis5595_read_value(data,
+					       SIS5595_REG_IN_MAX(i));
+		}
+		for (i = 0; i < 2; i++) {
+			data->fan[i] =
+			    sis5595_read_value(data, SIS5595_REG_FAN(i));
+			data->fan_min[i] =
+			    sis5595_read_value(data,
+					       SIS5595_REG_FAN_MIN(i));
+		}
+		if (data->maxins == 3) {
+			data->temp =
+			    sis5595_read_value(data, SIS5595_REG_TEMP);
+			data->temp_over =
+			    sis5595_read_value(data, SIS5595_REG_TEMP_OVER);
+			data->temp_hyst =
+			    sis5595_read_value(data, SIS5595_REG_TEMP_HYST);
+		}
+		i = sis5595_read_value(data, SIS5595_REG_FANDIV);
+		data->fan_div[0] = (i >> 4) & 0x03;
+		data->fan_div[1] = i >> 6;
+		data->alarms =
+		    sis5595_read_value(data, SIS5595_REG_ALARM1) |
+		    (sis5595_read_value(data, SIS5595_REG_ALARM2) << 8);
+		data->last_updated = jiffies;
+		data->valid = true;
+	}
+
+	mutex_unlock(&data->update_lock);
+
+	return data;
+}
 
 /* 4 Voltages */
 static ssize_t in_show(struct device *dev, struct device_attribute *da,
@@ -569,6 +623,15 @@ static const struct attribute_group sis5595_group_temp1 = {
 	.attrs = sis5595_attributes_temp1,
 };
 
+/* Called when we have found a new SIS5595. */
+static void sis5595_init_device(struct sis5595_data *data)
+{
+	u8 config = sis5595_read_value(data, SIS5595_REG_CONFIG);
+	if (!(config & 0x01))
+		sis5595_write_value(data, SIS5595_REG_CONFIG,
+				(config & 0xf7) | 0x01);
+}
+
 /* This is called when the module is loaded */
 static int sis5595_probe(struct platform_device *pdev)
 {
@@ -658,85 +721,6 @@ static int sis5595_remove(struct platform_device *pdev)
 	return 0;
 }
 
-/* ISA access must be locked explicitly. */
-static int sis5595_read_value(struct sis5595_data *data, u8 reg)
-{
-	int res;
-
-	mutex_lock(&data->lock);
-	outb_p(reg, data->addr + SIS5595_ADDR_REG_OFFSET);
-	res = inb_p(data->addr + SIS5595_DATA_REG_OFFSET);
-	mutex_unlock(&data->lock);
-	return res;
-}
-
-static void sis5595_write_value(struct sis5595_data *data, u8 reg, u8 value)
-{
-	mutex_lock(&data->lock);
-	outb_p(reg, data->addr + SIS5595_ADDR_REG_OFFSET);
-	outb_p(value, data->addr + SIS5595_DATA_REG_OFFSET);
-	mutex_unlock(&data->lock);
-}
-
-/* Called when we have found a new SIS5595. */
-static void sis5595_init_device(struct sis5595_data *data)
-{
-	u8 config = sis5595_read_value(data, SIS5595_REG_CONFIG);
-	if (!(config & 0x01))
-		sis5595_write_value(data, SIS5595_REG_CONFIG,
-				(config & 0xf7) | 0x01);
-}
-
-static struct sis5595_data *sis5595_update_device(struct device *dev)
-{
-	struct sis5595_data *data = dev_get_drvdata(dev);
-	int i;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
-
-		for (i = 0; i <= data->maxins; i++) {
-			data->in[i] =
-			    sis5595_read_value(data, SIS5595_REG_IN(i));
-			data->in_min[i] =
-			    sis5595_read_value(data,
-					       SIS5595_REG_IN_MIN(i));
-			data->in_max[i] =
-			    sis5595_read_value(data,
-					       SIS5595_REG_IN_MAX(i));
-		}
-		for (i = 0; i < 2; i++) {
-			data->fan[i] =
-			    sis5595_read_value(data, SIS5595_REG_FAN(i));
-			data->fan_min[i] =
-			    sis5595_read_value(data,
-					       SIS5595_REG_FAN_MIN(i));
-		}
-		if (data->maxins == 3) {
-			data->temp =
-			    sis5595_read_value(data, SIS5595_REG_TEMP);
-			data->temp_over =
-			    sis5595_read_value(data, SIS5595_REG_TEMP_OVER);
-			data->temp_hyst =
-			    sis5595_read_value(data, SIS5595_REG_TEMP_HYST);
-		}
-		i = sis5595_read_value(data, SIS5595_REG_FANDIV);
-		data->fan_div[0] = (i >> 4) & 0x03;
-		data->fan_div[1] = i >> 6;
-		data->alarms =
-		    sis5595_read_value(data, SIS5595_REG_ALARM1) |
-		    (sis5595_read_value(data, SIS5595_REG_ALARM2) << 8);
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-
-	mutex_unlock(&data->update_lock);
-
-	return data;
-}
-
 static const struct pci_device_id sis5595_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_503) },
 	{ 0, }
@@ -801,6 +785,14 @@ static int sis5595_device_add(unsigned short address)
 	return err;
 }
 
+static struct platform_driver sis5595_driver = {
+	.driver = {
+		.name	= DRIVER_NAME,
+	},
+	.probe		= sis5595_probe,
+	.remove		= sis5595_remove,
+};
+
 static int sis5595_pci_probe(struct pci_dev *dev,
 				       const struct pci_device_id *id)
 {
-- 
2.37.2

