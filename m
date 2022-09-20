Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67713C54EE9
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Sep 2022 13:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbiITN47 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Sep 2022 09:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbiITN4n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2022 09:56:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0641211C11
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 06:56:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oadjr-0005fF-BN; Tue, 20 Sep 2022 15:56:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oadjr-001s8T-PG; Tue, 20 Sep 2022 15:56:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oadjp-002Erf-ET; Tue, 20 Sep 2022 15:56:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Roger Lucas <vt8231@hiddenengine.co.uk>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/2] hwmon: vt8231: Reorder symbols to get rid of a few forward declarations
Date:   Tue, 20 Sep 2022 15:56:17 +0200
Message-Id: <20220920135617.1046361-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920135617.1046361-1-u.kleine-koenig@pengutronix.de>
References: <20220920135617.1046361-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7198; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wWDsUtM76UYOd0N1gERP9JXGZ8MA/oqe9jWzTSmDqXM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjKcZ9O1wcElD9MC3Xy1EEGlQoA5f05jmxO6C7A+5g ETdkiB+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYynGfQAKCRDB/BR4rcrsCcVDB/ 0REynv6pCjVIT51NWh6F2xXh6kfz/Vs9QHyegzTzwK2JRcXmbckrmj64ZljTs48bGqmkhGPVyzBHJt qeTuktAVdpXfcc3Fz2jqk41sMnSDU6tYjWmJEhhzw9mvuhtzC/WsKoOO8tQvZqfqA73nOcM4EFsRqC BnaRHQDDXZC7tcxo/w8DpBoXjpbwQKMl2aTDi0X46V0W93gGvh7entjEqDKG236bAgWF1u8oPv0LU3 fSt7C1incj65lg1wwqhNif/NAsrvBi6cIIlfyullJn9AsWseXUFqy9Iy8eNjwTRaVSKkIQvrM1zLIS 7n0ftN9CcaRFqTKR94ylqsmkl8P+9c
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

Reorder the functions and variables to get rid of 5 forward declarations.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/vt8231.c | 188 ++++++++++++++++++++---------------------
 1 file changed, 91 insertions(+), 97 deletions(-)

diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index d84f7db74889..3b7f8922b0d5 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -164,10 +164,6 @@ struct vt8231_data {
 };
 
 static struct pci_dev *s_bridge;
-static int vt8231_probe(struct platform_device *pdev);
-static int vt8231_remove(struct platform_device *pdev);
-static struct vt8231_data *vt8231_update_device(struct device *dev);
-static void vt8231_init_device(struct vt8231_data *data);
 
 static inline int vt8231_read_value(struct vt8231_data *data, u8 reg)
 {
@@ -180,6 +176,74 @@ static inline void vt8231_write_value(struct vt8231_data *data, u8 reg,
 	outb_p(value, data->addr + reg);
 }
 
+static struct vt8231_data *vt8231_update_device(struct device *dev)
+{
+	struct vt8231_data *data = dev_get_drvdata(dev);
+	int i;
+	u16 low;
+
+	mutex_lock(&data->update_lock);
+
+	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	    || !data->valid) {
+		for (i = 0; i < 6; i++) {
+			if (ISVOLT(i, data->uch_config)) {
+				data->in[i] = vt8231_read_value(data,
+						regvolt[i]);
+				data->in_min[i] = vt8231_read_value(data,
+						regvoltmin[i]);
+				data->in_max[i] = vt8231_read_value(data,
+						regvoltmax[i]);
+			}
+		}
+		for (i = 0; i < 2; i++) {
+			data->fan[i] = vt8231_read_value(data,
+						VT8231_REG_FAN(i));
+			data->fan_min[i] = vt8231_read_value(data,
+						VT8231_REG_FAN_MIN(i));
+		}
+
+		low = vt8231_read_value(data, VT8231_REG_TEMP_LOW01);
+		low = (low >> 6) | ((low & 0x30) >> 2)
+		    | (vt8231_read_value(data, VT8231_REG_TEMP_LOW25) << 4);
+		for (i = 0; i < 6; i++) {
+			if (ISTEMP(i, data->uch_config)) {
+				data->temp[i] = (vt8231_read_value(data,
+						       regtemp[i]) << 2)
+						| ((low >> (2 * i)) & 0x03);
+				data->temp_max[i] = vt8231_read_value(data,
+						      regtempmax[i]);
+				data->temp_min[i] = vt8231_read_value(data,
+						      regtempmin[i]);
+			}
+		}
+
+		i = vt8231_read_value(data, VT8231_REG_FANDIV);
+		data->fan_div[0] = (i >> 4) & 0x03;
+		data->fan_div[1] = i >> 6;
+		data->alarms = vt8231_read_value(data, VT8231_REG_ALARM1) |
+			(vt8231_read_value(data, VT8231_REG_ALARM2) << 8);
+
+		/* Set alarm flags correctly */
+		if (!data->fan[0] && data->fan_min[0])
+			data->alarms |= 0x40;
+		else if (data->fan[0] && !data->fan_min[0])
+			data->alarms &= ~0x40;
+
+		if (!data->fan[1] && data->fan_min[1])
+			data->alarms |= 0x80;
+		else if (data->fan[1] && !data->fan_min[1])
+			data->alarms &= ~0x80;
+
+		data->last_updated = jiffies;
+		data->valid = true;
+	}
+
+	mutex_unlock(&data->update_lock);
+
+	return data;
+}
+
 /* following are the sysfs callback functions */
 static ssize_t in_show(struct device *dev, struct device_attribute *attr,
 		       char *buf)
@@ -753,29 +817,11 @@ static const struct attribute_group vt8231_group = {
 	.attrs = vt8231_attributes,
 };
 
-static struct platform_driver vt8231_driver = {
-	.driver = {
-		.name	= DRIVER_NAME,
-	},
-	.probe	= vt8231_probe,
-	.remove	= vt8231_remove,
-};
-
-static const struct pci_device_id vt8231_pci_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8231_4) },
-	{ 0, }
-};
-
-MODULE_DEVICE_TABLE(pci, vt8231_pci_ids);
-
-static int vt8231_pci_probe(struct pci_dev *dev,
-				      const struct pci_device_id *id);
-
-static struct pci_driver vt8231_pci_driver = {
-	.name		= DRIVER_NAME,
-	.id_table	= vt8231_pci_ids,
-	.probe		= vt8231_pci_probe,
-};
+static void vt8231_init_device(struct vt8231_data *data)
+{
+	vt8231_write_value(data, VT8231_REG_TEMP1_CONFIG, 0);
+	vt8231_write_value(data, VT8231_REG_TEMP2_CONFIG, 0);
+}
 
 static int vt8231_probe(struct platform_device *pdev)
 {
@@ -865,79 +911,21 @@ static int vt8231_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static void vt8231_init_device(struct vt8231_data *data)
-{
-	vt8231_write_value(data, VT8231_REG_TEMP1_CONFIG, 0);
-	vt8231_write_value(data, VT8231_REG_TEMP2_CONFIG, 0);
-}
-
-static struct vt8231_data *vt8231_update_device(struct device *dev)
-{
-	struct vt8231_data *data = dev_get_drvdata(dev);
-	int i;
-	u16 low;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
-		for (i = 0; i < 6; i++) {
-			if (ISVOLT(i, data->uch_config)) {
-				data->in[i] = vt8231_read_value(data,
-						regvolt[i]);
-				data->in_min[i] = vt8231_read_value(data,
-						regvoltmin[i]);
-				data->in_max[i] = vt8231_read_value(data,
-						regvoltmax[i]);
-			}
-		}
-		for (i = 0; i < 2; i++) {
-			data->fan[i] = vt8231_read_value(data,
-						VT8231_REG_FAN(i));
-			data->fan_min[i] = vt8231_read_value(data,
-						VT8231_REG_FAN_MIN(i));
-		}
 
-		low = vt8231_read_value(data, VT8231_REG_TEMP_LOW01);
-		low = (low >> 6) | ((low & 0x30) >> 2)
-		    | (vt8231_read_value(data, VT8231_REG_TEMP_LOW25) << 4);
-		for (i = 0; i < 6; i++) {
-			if (ISTEMP(i, data->uch_config)) {
-				data->temp[i] = (vt8231_read_value(data,
-						       regtemp[i]) << 2)
-						| ((low >> (2 * i)) & 0x03);
-				data->temp_max[i] = vt8231_read_value(data,
-						      regtempmax[i]);
-				data->temp_min[i] = vt8231_read_value(data,
-						      regtempmin[i]);
-			}
-		}
-
-		i = vt8231_read_value(data, VT8231_REG_FANDIV);
-		data->fan_div[0] = (i >> 4) & 0x03;
-		data->fan_div[1] = i >> 6;
-		data->alarms = vt8231_read_value(data, VT8231_REG_ALARM1) |
-			(vt8231_read_value(data, VT8231_REG_ALARM2) << 8);
-
-		/* Set alarm flags correctly */
-		if (!data->fan[0] && data->fan_min[0])
-			data->alarms |= 0x40;
-		else if (data->fan[0] && !data->fan_min[0])
-			data->alarms &= ~0x40;
-
-		if (!data->fan[1] && data->fan_min[1])
-			data->alarms |= 0x80;
-		else if (data->fan[1] && !data->fan_min[1])
-			data->alarms &= ~0x80;
-
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
+static struct platform_driver vt8231_driver = {
+	.driver = {
+		.name	= DRIVER_NAME,
+	},
+	.probe	= vt8231_probe,
+	.remove	= vt8231_remove,
+};
 
-	mutex_unlock(&data->update_lock);
+static const struct pci_device_id vt8231_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8231_4) },
+	{ 0, }
+};
 
-	return data;
-}
+MODULE_DEVICE_TABLE(pci, vt8231_pci_ids);
 
 static int vt8231_device_add(unsigned short address)
 {
@@ -1042,6 +1030,12 @@ static int vt8231_pci_probe(struct pci_dev *dev,
 	return -ENODEV;
 }
 
+static struct pci_driver vt8231_pci_driver = {
+	.name		= DRIVER_NAME,
+	.id_table	= vt8231_pci_ids,
+	.probe		= vt8231_pci_probe,
+};
+
 static int __init sm_vt8231_init(void)
 {
 	return pci_register_driver(&vt8231_pci_driver);
-- 
2.37.2

