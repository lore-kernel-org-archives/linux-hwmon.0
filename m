Return-Path: <SRS0=z86d=QT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55B2C282C4
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 17:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B36F2222BB
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 17:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbHU+Udd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbfBLRzV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Feb 2019 12:55:21 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35334 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728481AbfBLRzV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Feb 2019 12:55:21 -0500
Received: by mail-pl1-f193.google.com with SMTP id p8so1663795plo.2
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Feb 2019 09:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=c1YGAbNesDA0b3kVisXSvm63bkzYBI9o0nezucIXyoU=;
        b=FbHU+UddYFbk1R8EudOb9Z/hG1OUpNrAARyIcq2maso4oVg+axAoj5sxskZK50Hm3u
         gf75x1YKCQZ8FuI6invLSsBg/u77IMxIkKZqJYUB3OomwuRU0jxK06vvSR5Kky+Kwf+D
         bZUmtBouOGAKHDq+Vt8+5walNduLvtPFthq1kujNb6tNTETQG5e7QlpcxFRJVgjKKi0Q
         ATkQl4YBbxTYku8QAhYr9oUjMgZWf31+I/owLwK9bcUT4l4B5FnNxqNq4lKIbSFDuoXq
         Nln8S4Ki7ksaJ5CuiXv19BHuA5TJNcvqaBLNwIg2U/c84GMXqpWwZj7znAjgjNEHsZu8
         UfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=c1YGAbNesDA0b3kVisXSvm63bkzYBI9o0nezucIXyoU=;
        b=UubBtvT33z641Wn6h5dz2qE6PpyGyPgMu1HMSfpYrcFqWgqGi4D8JG5jz1Zfyffp5R
         0K4yqPlE3f/G+Mu0OvlaZ2MYas4gTf+TjMOwzE4Ed2sNhcuNL3axW50rn+/h6BPYjbcF
         GGQTPZu6vr8FMpxxhU9IShHxj/gj5Pd1yZjdRsTTVmCFFffQIxHakB4tyiPp/M+0A2Tz
         mSx0Uc3c0Mw9GObAugceGApJWP6OqVK61g/cavmHMu4uOHLPNqm5b6eY99qvg10VDfKx
         v50oGBtBzQ6FCCcx0VgkaAwpcZP+zJ2/SVC2RW9PIMcwHEVb3GwsRgI+6ZMu3uUE3VTH
         7RLw==
X-Gm-Message-State: AHQUAuYOi8JMgCNCQ2LIgB3GwvtTciMiUYyiIVM1ETwIxEig+LxHNtXZ
        Y+FLCJsMR/8ROVH3cdEbmw8yJyPq
X-Google-Smtp-Source: AHgI3IaYevvGtRHyIh2KPNnEQ0Zl3Ah3H2hhfgUnMvGYvI+qGZ+Dhlc2GsZ3Aay6MQ7Ibsek8mqLWw==
X-Received: by 2002:a17:902:7e0d:: with SMTP id b13mr5227512plm.154.1549994119771;
        Tue, 12 Feb 2019 09:55:19 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i8sm29745980pgo.19.2019.02.12.09.55.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Feb 2019 09:55:18 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (ntc_thermistor) Convert to new hwmon API
Date:   Tue, 12 Feb 2019 09:55:16 -0800
Message-Id: <1549994116-6562-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use devm_hwmon_device_register_with_info() instead of
devm_hwmon_device_register_with_groups() to register the hwmon
device to simplify the code and make it easier to maintain.
As part of this change, thermal device registration is moved into
the hwmon core.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ntc_thermistor.c | 106 +++++++++++++++++++++++++----------------
 1 file changed, 66 insertions(+), 40 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 2823aff82c82..e4f9f7ce92fa 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -37,8 +37,6 @@
 #include <linux/iio/consumer.h>
 
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/thermal.h>
 
 struct ntc_compensation {
 	int		temp_c;
@@ -588,55 +586,87 @@ static int ntc_thermistor_get_ohm(struct ntc_data *data)
 	return -EINVAL;
 }
 
-static int ntc_read_temp(void *data, int *temp)
+static int ntc_read(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long *val)
 {
+	struct ntc_data *data = dev_get_drvdata(dev);
 	int ohm;
 
-	ohm = ntc_thermistor_get_ohm(data);
-	if (ohm < 0)
-		return ohm;
-
-	*temp = get_temp_mc(data, ohm);
-
-	return 0;
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			ohm = ntc_thermistor_get_ohm(data);
+			if (ohm < 0)
+				return ohm;
+			*val = get_temp_mc(data, ohm);
+			return 0;
+		case hwmon_temp_type:
+			*val = 4;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
-static ssize_t ntc_type_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static umode_t ntc_is_visible(const void *data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
 {
-	return sprintf(buf, "4\n");
+	if (type == hwmon_temp) {
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_type:
+			return 0444;
+		default:
+			break;
+		}
+	}
+	return 0;
 }
 
-static ssize_t ntc_temp_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
-{
-	struct ntc_data *data = dev_get_drvdata(dev);
-	int ohm;
+static const u32 ntc_chip_config[] = {
+	HWMON_C_REGISTER_TZ,
+	0
+};
 
-	ohm = ntc_thermistor_get_ohm(data);
-	if (ohm < 0)
-		return ohm;
+static const struct hwmon_channel_info ntc_chip = {
+	.type = hwmon_chip,
+	.config = ntc_chip_config,
+};
 
-	return sprintf(buf, "%d\n", get_temp_mc(data, ohm));
-}
+static const u32 ntc_temp_config[] = {
+	HWMON_T_INPUT, HWMON_T_TYPE,
+	0
+};
 
-static SENSOR_DEVICE_ATTR_RO(temp1_type, ntc_type, 0);
-static SENSOR_DEVICE_ATTR_RO(temp1_input, ntc_temp, 0);
+static const struct hwmon_channel_info ntc_temp = {
+	.type = hwmon_temp,
+	.config = ntc_temp_config,
+};
 
-static struct attribute *ntc_attrs[] = {
-	&sensor_dev_attr_temp1_type.dev_attr.attr,
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	NULL,
+static const struct hwmon_channel_info *ntc_info[] = {
+	&ntc_chip,
+	&ntc_temp,
+	NULL
 };
-ATTRIBUTE_GROUPS(ntc);
 
-static const struct thermal_zone_of_device_ops ntc_of_thermal_ops = {
-	.get_temp = ntc_read_temp,
+static const struct hwmon_ops ntc_hwmon_ops = {
+	.is_visible = ntc_is_visible,
+	.read = ntc_read,
+};
+
+static const struct hwmon_chip_info ntc_chip_info = {
+	.ops = &ntc_hwmon_ops,
+	.info = ntc_info,
 };
 
 static int ntc_thermistor_probe(struct platform_device *pdev)
 {
-	struct thermal_zone_device *tz;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *of_id =
 			of_match_device(of_match_ptr(ntc_match), dev);
@@ -697,8 +727,9 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	data->comp   = ntc_type[pdev_id->driver_data].comp;
 	data->n_comp = ntc_type[pdev_id->driver_data].n_comp;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, pdev_id->name,
-							   data, ntc_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, pdev_id->name,
+							 data, &ntc_chip_info,
+							 NULL);
 	if (IS_ERR(hwmon_dev)) {
 		dev_err(dev, "unable to register as hwmon device.\n");
 		return PTR_ERR(hwmon_dev);
@@ -707,11 +738,6 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	dev_info(dev, "Thermistor type: %s successfully probed.\n",
 		 pdev_id->name);
 
-	tz = devm_thermal_zone_of_sensor_register(dev, 0, data,
-						  &ntc_of_thermal_ops);
-	if (IS_ERR(tz))
-		dev_dbg(dev, "Failed to register to thermal fw.\n");
-
 	return 0;
 }
 
-- 
2.7.4

