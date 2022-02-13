Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD20C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Feb 2022 00:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbiBMArl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Feb 2022 19:47:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbiBMArk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Feb 2022 19:47:40 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1111860054
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Feb 2022 16:47:36 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id jg20so5257331ejc.3
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Feb 2022 16:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mcjHssrhQlWhBXi/uniOBpuJ3klG0mfxZRLPtoOyx4U=;
        b=mnf9gQbEzGcTsBz10kfOHr+ZD76PSQgUIJ45GQ5ZGx1+Saui7x+ClPWpOM+/sbixQz
         QwI/O/qzGBpeDrWVCES+XyMenbLOHXROHMlkSM0xPlY2ZnQc4KoS9pQx7NzRgiiRVaUL
         +T9ZfkY4h3EB04LlE+5bh6jSPDKnRULVXaOwR/briVmvGIvHumCGvcqKqGyKeQmbA+14
         Ex0TrLYH8g+NymIdsdRCWHlKq2AGLIEJdhsE/JJh1E2tiCgaBd27D8F+Icswq00kBSpW
         K9llAia4SiiNf1IKEg+idOshhdIY4m9Y57BL7I0vX6LceB8edkua/X4P8oX5r2Te3nHq
         Ekiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mcjHssrhQlWhBXi/uniOBpuJ3klG0mfxZRLPtoOyx4U=;
        b=7WIQROUdwMUhryRprz6ptbcrpT6bGaN8w6A2ipsNEd7qP4nskEA+SGrwJ5GxcxkMU2
         6IwUpFV3ApqXrBRtGkvF+7G8lwMEZYSGaKj7fysD7wDRcLzrDDMerpiWLvzkTGOeVlER
         +n+EsEZNsscpk8koGwPJgau5bXViVTd7iwSz23ahRAYZwzJpS35Yi0Ft57z013lmczvX
         F/wKTXWrB4fmJtWQZiZDJ0EtVjsUCMtrjkFbjsjjle9iFlrdW30fJYUKvEAeBFnLqHe8
         plf0p30XZDCm4hTdhGO5cII8x15CmnacZAqOTXBI1bvzf7Vjk8QO35fVlnNp4Cy306hZ
         fNIA==
X-Gm-Message-State: AOAM530SadohI+WbPdjuzYSnQ3eEm7KvGkl4z/mI1egvuqViSpaNaMfW
        ZMzhCWXXWbgWlH9yMG2LgizcNoZaFWE=
X-Google-Smtp-Source: ABdhPJzQian0rlzVKoLZNAnQ3IY4XNK3+iFAMvb//kLtA/Q3T1d7+gXx3zFIPStH1trzmQL/xvbKww==
X-Received: by 2002:a17:906:b151:: with SMTP id bt17mr6384202ejb.657.1644713254444;
        Sat, 12 Feb 2022 16:47:34 -0800 (PST)
Received: from debian64.daheim (p4fd09148.dip0.t-ipconnect.de. [79.208.145.72])
        by smtp.gmail.com with ESMTPSA id ev23sm7513620ejc.215.2022.02.12.16.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 16:47:33 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1nJ337-00A9rf-6k;
        Sun, 13 Feb 2022 01:47:33 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3] hwmon: (tc654) Add thermal_cooling device support
Date:   Sun, 13 Feb 2022 01:47:33 +0100
Message-Id: <20220213004733.2421193-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2 -> v3: - spelling fixes
	  - set duty_cycle=0 when in SDM
	  - TC654_COOLING_MAX_STATES => TC654_COOLING_MAX_STATE

Note: I've checked if the setting the duty_cycle to 0 when
switching off makes a difference. The result was: No.

When it was switched back on: The fan(s) will always do a
"full second on full blast". The TC654/TC655's datasheet
describes this in "4.3 Fan Start-up" as follows:

"Since the fan is at a rest position, the fan’s inertia must
be overcome to get it started. The best way to accomplish this
is to apply the full rated voltage to the fan for one second."
---
 drivers/hwmon/tc654.c | 104 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index cf2a3acd5c91..814bc6a4d251 100644
--- a/drivers/hwmon/tc654.c
+++ b/drivers/hwmon/tc654.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/thermal.h>
 #include <linux/util_macros.h>
 
 enum tc654_regs {
@@ -384,28 +385,20 @@ static ssize_t pwm_show(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", pwm);
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
 
-	if (val == 0)
+	if (val == 0) {
 		data->config |= TC654_REG_CONFIG_SDM;
-	else
+		data->duty_cycle = 0;
+	} else {
 		data->config &= ~TC654_REG_CONFIG_SDM;
-
-	data->duty_cycle = find_closest(val, tc654_pwm_map,
-					ARRAY_SIZE(tc654_pwm_map));
+		data->duty_cycle = val - 1;
+	}
 
 	ret = i2c_smbus_write_byte_data(client, TC654_REG_CONFIG, data->config);
 	if (ret < 0)
@@ -416,6 +409,24 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
 
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
+	if (val > 0)
+		val = find_closest(val, tc654_pwm_map, ARRAY_SIZE(tc654_pwm_map)) + 1;
+
+	ret = _set_pwm(data, val);
 	return ret < 0 ? ret : count;
 }
 
@@ -447,6 +458,58 @@ static struct attribute *tc654_attrs[] = {
 
 ATTRIBUTE_GROUPS(tc654);
 
+/*
+ * thermal cooling device functions
+ *
+ * Account for the "ShutDown Mode (SDM)" state by offsetting
+ * the 16 PWM duty cycle states by 1.
+ *
+ * State  0 =   0% PWM | Shutdown - Fan(s) are off
+ * State  1 =  30% PWM | duty_cycle =  0
+ * State  2 = ~35% PWM | duty_cycle =  1
+ * [...]
+ * State 15 = ~95% PWM | duty_cycle = 14
+ * State 16 = 100% PWM | duty_cycle = 15
+ */
+#define TC654_MAX_COOLING_STATE	16
+
+static int tc654_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	*state = TC654_MAX_COOLING_STATE;
+	return 0;
+}
+
+static int tc654_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	struct tc654_data *data = tc654_update_client(cdev->devdata);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	if (data->config & TC654_REG_CONFIG_SDM)
+		*state = 0;	/* FAN is off */
+	else
+		*state = data->duty_cycle + 1;	/* offset PWM States by 1 */
+
+	return 0;
+}
+
+static int tc654_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	struct tc654_data *data = tc654_update_client(cdev->devdata);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return _set_pwm(data, clamp_val(state, 0, TC654_MAX_COOLING_STATE));
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
@@ -477,7 +540,18 @@ static int tc654_probe(struct i2c_client *client)
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

