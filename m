Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411D7C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Feb 2022 21:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240267AbiBCV25 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Feb 2022 16:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238002AbiBCV25 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Feb 2022 16:28:57 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5A4C061714
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Feb 2022 13:28:56 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id o12so12691223eju.13
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Feb 2022 13:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ugYCAVPn0koF9AfHZU6uzIzYJb5IFT7I3GxNngv9Xcw=;
        b=L8l93yru0Irk1X53rN4Pa/EXdVowzYRCJs5RLdy9mVVqeZ83AJW6r/f7gRCiIIYcBv
         IRyxpe7VOp5sKs92sOg1TdOWU4fkSaLdWhYffsIxoxyIbiQ2W9/d9H5JplBB2rIt9ys/
         L9DIdb/Yug1xXPrjw8oxrlKTVJFoiBhbpPW84Ze2gSwz0v1r9qPENmFxGLuMbQVSrO6/
         aBAEZfbJM5rqCe2my83F40K54VsDxuS8Zi7SwGGomYc+9+H5LrMmRaOqPs2mBya9xZOK
         OCnaJCHLiSujQ50qbCAhdHgEACjp+oerJ4hwWWx0ep1I1FfH847WX49xh3zAnD4hhgJA
         P2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ugYCAVPn0koF9AfHZU6uzIzYJb5IFT7I3GxNngv9Xcw=;
        b=POGGoiccZq7sHaoekIiLLTAs1NfqZAPxerHy03AJkmCmNj5AGknQ12JrPjUYcO/6cI
         zWVThdafR/nR6mxL3CuGmd83ge25z5BpokBQgbzsifR2Ygpd+fqQY+34HrUyuYJWSn1k
         l165D68+jSPt9dFbl97xxUJ7wdWTYa3RHNmorlGUVomGvCJcPKz7z4sAeCT+0HpBTzjc
         Ky/umL6RstO/FREuw0Dc7SaCOAODi0YY58FFpGcKrXCsSVM7Jh7WAifJJqP95cH+de8o
         2RHk9WYEgZvaPrkiwiJBh8ZzIzKQTORwXXzLm3lFfygqTXPXlocx6OmVjGIgJPyKMf/F
         4INw==
X-Gm-Message-State: AOAM532U8fm4zbzuCbLVaK+3m2Mp/LhSCvA8HqT71sdijh6fUe7TSy61
        UvD9tSlZNuwMP/+MFTiSm4W5PwIScPQ=
X-Google-Smtp-Source: ABdhPJzxcYaLER+h2HuPonLFX5i8uglGvKJA8zzpxmUv/hXke3iEI7ritW94Ohm5SR2ZS2MOpK/QzQ==
X-Received: by 2002:a17:906:30c9:: with SMTP id b9mr31743263ejb.377.1643923735065;
        Thu, 03 Feb 2022 13:28:55 -0800 (PST)
Received: from debian64.daheim (pd9e292b0.dip0.t-ipconnect.de. [217.226.146.176])
        by smtp.gmail.com with ESMTPSA id i6sm16018eja.132.2022.02.03.13.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 13:28:54 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1nFjev-00106n-Ut;
        Thu, 03 Feb 2022 22:28:53 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1] hwmon: (tc654) Add thermal_cooling device support
Date:   Thu,  3 Feb 2022 22:28:53 +0100
Message-Id: <20220203212853.238739-1-chunkeey@gmail.com>
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

Note: Driver uses imply THERMAL. The driver previously worked fine with
just the hwmon interface. Now, if CONFIG_THERMAL is not selected, the
devm_thermal_of_cooling_device_register() will be a
"return ERR_PTR(-ENODEV)" stub.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 drivers/hwmon/Kconfig |  1 +
 drivers/hwmon/tc654.c | 95 +++++++++++++++++++++++++++++++++++--------
 2 files changed, 79 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8df25f1079ba..aa570bb05b38 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1135,6 +1135,7 @@ config SENSORS_MLXREG_FAN
 config SENSORS_TC654
 	tristate "Microchip TC654/TC655 and compatibles"
 	depends on I2C
+	imply THERMAL
 	help
 	  If you say yes here you get support for TC654 and TC655.
 	  The TC654 and TC655 are PWM mode fan speed controllers with
diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index cf2a3acd5c91..bf7aae62477a 100644
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
+		       const char *buf, size_t count)
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
@@ -477,7 +526,19 @@ static int tc654_probe(struct i2c_client *client)
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
+		cdev = devm_thermal_of_cooling_device_register(dev,
+				dev->of_node, client->name, hwmon_dev,
+				&tc654_fan_cool_ops);
+		return PTR_ERR_OR_ZERO(cdev);
+	}
+
+	return 0;
 }
 
 static const struct i2c_device_id tc654_id[] = {
-- 
2.34.1

