Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F5FC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Feb 2022 19:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbiBFTFW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Feb 2022 14:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiBFTFV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 Feb 2022 14:05:21 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEFC1C06173B
        for <linux-hwmon@vger.kernel.org>; Sun,  6 Feb 2022 11:05:20 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id w14so25504820edd.10
        for <linux-hwmon@vger.kernel.org>; Sun, 06 Feb 2022 11:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHE1T//c1O5XpnPOZmLsq7sGCvgprbczeVe58chbPBM=;
        b=iXaQMoUQFsZM6wkyOMk22XlKKlqSK5505QRvxFBElAqfF4sFlZUXbBDgiPW6pyDAex
         d9mosRdyaXEeLR3OiomWOQ9nzXrtJ/P5TBBkQ43SeRMKfwW4luTQsecI/p3GUk2/TL9g
         8B+0DQ1kkD+gttgGUl+OE+nBqpuAM/lgmkvuC9wqund8oAN0rqNZVbYh0aBxXcrS21KS
         rC6G850NShMCGgfaiiv8EJ7bph8j7G9EOV6coJyJ/3AwFRXfKeIukUh7nVv+CyEkoYaL
         /7zsKJNsjd6y/73SqViu5Q0tpDxICkbk1gIxx/tyLNH+8Sk3koFohnrb3bzLh6u3L+Ae
         ShaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHE1T//c1O5XpnPOZmLsq7sGCvgprbczeVe58chbPBM=;
        b=2TVtGy3infxyasEJsO11hjNyEKp8OsbobTuSoeKEnU+ZV13Vvd7BKSHz4MBre6tBcc
         GNZXF5U18VfdK+BhlxOIxOmqCtcswTP2DKvr9pe9+S8cdUXMxDPdlCF4Grc8o4QkB9DX
         qBvpTiYAxuM8GttZUNY045cIHgrePZ1wTglXl0UdLEr8ZUcNLSi+HlztYEz1FrrIiwgZ
         DuhtLV9remdpIgipyePAzNRt2lOn/yxY0BJ/yDx54D1pIUs81Hp8DWn9DgUPsZwDW/Nd
         CmgqL78/HXpPqLxNqpjyGYrC9bjngcieaW/GLIsrNVynS9ezr9A1MDrvLercP9ESnjFM
         bqJg==
X-Gm-Message-State: AOAM533VBfFU/Jg2bs/bCJFa4HSCJ7aZ9FwxyZ42rgS13CVa8hQNQJ7g
        nbyxTm+0WKZW7S1oPILvCk7969Nj2u0=
X-Google-Smtp-Source: ABdhPJx3rsGnp7DAt6e6bsSjRkBFqs9RTyQPGegG47oNiF/rf2FDWQ+Hu/Z7qJhCFcFPT37bqKo7ug==
X-Received: by 2002:a05:6402:219:: with SMTP id t25mr10214006edv.62.1644174318584;
        Sun, 06 Feb 2022 11:05:18 -0800 (PST)
Received: from debian64.daheim (pd9e294e9.dip0.t-ipconnect.de. [217.226.148.233])
        by smtp.gmail.com with ESMTPSA id q5sm802209eds.82.2022.02.06.11.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 11:05:18 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1nGmqb-001Gx3-RA;
        Sun, 06 Feb 2022 20:05:17 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] hwmon: (tc654) Add thermal_cooling device support
Date:   Sun,  6 Feb 2022 20:05:17 +0100
Message-Id: <20220206190517.303483-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adds thermal_cooling device support to the tc654/tc655
driver. This make it possible to integrate it into a
device-tree supported thermal-zone node as a
cooling device.

I have been using this patch as part of the Netgear WNDR4700
Centria NAS Router support within OpenWrt since 2016.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
v1 -> v2: - Drop imply THERMAL
	  - aligned ( so . everything is lining up
---
 drivers/hwmon/tc654.c | 94 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 77 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index cf2a3acd5c91..c8f511a60769 100644
--- a/drivers/hwmon/tc654.c
+++ b/drivers/hwmon/tc654.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/thermal.h>
 #include <linux/util_macros.h>
 
 enum tc654_regs {
@@ -367,36 +368,30 @@ static ssize_t pwm_mode_store(struct device *dev, struct device_attribute *da,
 static const int tc654_pwm_map[16] = { 77,  88, 102, 112, 124, 136, 148, 160,
 				      172, 184, 196, 207, 219, 231, 243, 255};
 
+static int get_pwm(struct tc654_data *data)
+{
+	if (data->config & TC654_REG_CONFIG_SDM)
+		return 0;
+	else
+		return tc654_pwm_map[data->duty_cycle];
+}
+
 static ssize_t pwm_show(struct device *dev, struct device_attribute *da,
 			char *buf)
 {
 	struct tc654_data *data = tc654_update_client(dev);
-	int pwm;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	if (data->config & TC654_REG_CONFIG_SDM)
-		pwm = 0;
-	else
-		pwm = tc654_pwm_map[data->duty_cycle];
-
-	return sprintf(buf, "%d\n", pwm);
+	return sprintf(buf, "%d\n", get_pwm(data));
 }
 
-static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
-			 const char *buf, size_t count)
+static int _set_pwm(struct tc654_data *data, unsigned long val)
 {
-	struct tc654_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long val;
 	int ret;
 
-	if (kstrtoul(buf, 10, &val))
-		return -EINVAL;
-	if (val > 255)
-		return -EINVAL;
-
 	mutex_lock(&data->update_lock);
 
 	if (val == 0)
@@ -416,6 +411,22 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
 
 out:
 	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
+			 const char *buf, size_t count)
+{
+	struct tc654_data *data = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+	if (val > 255)
+		return -EINVAL;
+
+	ret = _set_pwm(data, val);
 	return ret < 0 ? ret : count;
 }
 
@@ -447,6 +458,44 @@ static struct attribute *tc654_attrs[] = {
 
 ATTRIBUTE_GROUPS(tc654);
 
+/* cooling device */
+
+static int tc654_get_max_state(struct thermal_cooling_device *cdev,
+			       unsigned long *state)
+{
+	*state = 255;
+	return 0;
+}
+
+static int tc654_get_cur_state(struct thermal_cooling_device *cdev,
+			       unsigned long *state)
+{
+	struct tc654_data *data = tc654_update_client(cdev->devdata);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	*state = get_pwm(data);
+	return 0;
+}
+
+static int tc654_set_cur_state(struct thermal_cooling_device *cdev,
+			       unsigned long state)
+{
+	struct tc654_data *data = tc654_update_client(cdev->devdata);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return _set_pwm(data, clamp_val(state, 0, 255));
+}
+
+static const struct thermal_cooling_device_ops tc654_fan_cool_ops = {
+	.get_max_state = tc654_get_max_state,
+	.get_cur_state = tc654_get_cur_state,
+	.set_cur_state = tc654_set_cur_state,
+};
+
 /*
  * device probe and removal
  */
@@ -477,7 +526,18 @@ static int tc654_probe(struct i2c_client *client)
 	hwmon_dev =
 	    devm_hwmon_device_register_with_groups(dev, client->name, data,
 						   tc654_groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	if (IS_ENABLED(CONFIG_THERMAL)) {
+		struct thermal_cooling_device *cdev;
+
+		cdev = devm_thermal_of_cooling_device_register(dev, dev->of_node, client->name,
+							       hwmon_dev, &tc654_fan_cool_ops);
+		return PTR_ERR_OR_ZERO(cdev);
+	}
+
+	return 0;
 }
 
 static const struct i2c_device_id tc654_id[] = {
-- 
2.34.1

