Return-Path: <SRS0=Ylrj=SV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96062C10F14
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Apr 2019 00:57:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BF22214DA
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Apr 2019 00:57:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1Tkeg/9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfDSA5k (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 20:57:40 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:47056 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfDSA5j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 20:57:39 -0400
Received: by mail-qt1-f194.google.com with SMTP id z17so4126893qts.13
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 17:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=A7ADLanqBG+1FdBueiIwBG+hNKSR+YxlTJu1Z+4bN2Q=;
        b=j1Tkeg/99O4yGZH8/EBz61EWf5IiXjFOmrapMPxTwtUIATN5z/+A+s1ORy3lPWMQ43
         0KXhghxiOYVtFe5gXtXHW9wIKguHUp5iOupLLzKQVYnsZbDJ+JPG9J+2XnvqouN32hby
         XM5P1GXO8xkQDSRzHh4DUyszEL4MMTlREVnPCvK6hai+YUlSI25ipl0IOeLykmcESFK4
         1C0lVEB0oq9OB++cXflU9QkI8EXydBKWqWn/Imtt959oXi2ZXq60Xr0L0x6ffk8t2ClC
         6AJquZOei7zgl+gmxXkOUa3dH2dUEkDFw8FnwtkNYwVW7FejmxcwxWIfHpwSeGl5gGlw
         +l7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=A7ADLanqBG+1FdBueiIwBG+hNKSR+YxlTJu1Z+4bN2Q=;
        b=EEaBl9Y2XgrNbQpJXTMak3TC35/8IkTERkcW6fjJZQ275rNLQWTH5c5O1YzAiFeTrb
         Y+MSDRl3q1IdRg5yaxIbmgyllciHQYrhzUdA3DExA8zERiAZMZeQv7sp4DtCNFg/WqYp
         sTeLWc8Nztxoko5DhSf2THh45syMRlDO3e5IF4bo+l4gG903N9pwkJPnTkyZ4eM0TJCO
         vyae0sv4CxFJkNS0kfcVNQFJ/jspJ9hkJfpUTzqZxYyZmAYu/n4akWzK2sBHtmuynf48
         MiKuifDRnRi14YfPJnKTkSpU/EpwEuJJ+Po6Qe/aMCxml852JRG0xWBj2H5U4ZfMYyRg
         0p6Q==
X-Gm-Message-State: APjAAAXoYQYjwFRvILGRhsJUiyAjoWzozP+2mpxoavEZkiIN9acMq9H3
        13oCBi5mTlt9I6mdcMU/dpjzQ2PhRPCamg==
X-Google-Smtp-Source: APXvYqxmoFBHzjx9+sxlmge1IW8adFcj5viQ7mNMmpJonx5fsZvTIxWElK2shS5wqye+BTDxTz20MQ==
X-Received: by 2002:ac8:2b83:: with SMTP id m3mr1018489qtm.305.1555635458368;
        Thu, 18 Apr 2019 17:57:38 -0700 (PDT)
Received: from jfddesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id x13sm1606877qts.93.2019.04.18.17.57.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 17:57:37 -0700 (PDT)
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v4] hwmon: max6650: add thermal cooling device capability
Date:   Thu, 18 Apr 2019 20:57:22 -0400
Message-Id: <20190419005722.14541-1-jeff.dagenais@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418220210.GA17561@roeck-us.net>
References: <20190418220210.GA17561@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This allows max6650 devices to be referenced in dts as a cooling device.

The pwm value seems duplicated in cooling_dev_state but since pwm goes
through rounding logic into data->dac, it is modified and messes with
the thermal zone state algorithms. It's also better to serve a cache
value, thus avoiding periodic actual i2c traffic.

Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
---
Changes in v2:
        - Removed left-over debug printk.
Changes in v3:
        - Add missing dependency in Kconfig
Changes in v4:
	- Remove useless comment "thermal cooling device callbacks"
	- fix max6650_set_cur_state signature declaration style
	- Only warn when thermal_of_cooling_device_register fails

 drivers/hwmon/Kconfig   |  1 +
 drivers/hwmon/max6650.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d0f1dfe2bcbb..46d69fcdd48b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -898,6 +898,7 @@ config SENSORS_MAX6642
 config SENSORS_MAX6650
 	tristate "Maxim MAX6650 sensor chip"
 	depends on I2C
+	depends on THERMAL || THERMAL=n
 	help
 	  If you say yes here you get support for the MAX6650 / MAX6651
 	  sensor chips.
diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 61135a2d0cff..137395ea5e95 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -40,6 +40,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/of_device.h>
+#include <linux/thermal.h>
 
 /*
  * Insmod parameters
@@ -113,6 +114,7 @@ module_param(clock, int, 0444);
 struct max6650_data {
 	struct i2c_client *client;
 	const struct attribute_group *groups[3];
+	struct thermal_cooling_device *cooling_dev;
 	struct mutex update_lock;
 	int nr_fans;
 	char valid; /* zero until following fields are valid */
@@ -125,6 +127,7 @@ struct max6650_data {
 	u8 count;
 	u8 dac;
 	u8 alarm;
+	unsigned long cooling_dev_state;
 };
 
 static const u8 tach_reg[] = {
@@ -694,6 +697,63 @@ static int max6650_init_client(struct max6650_data *data,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_THERMAL)
+
+static int max6650_get_max_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	*state = 255;
+
+	return 0;
+}
+
+static int max6650_get_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	struct max6650_data *data = cdev->devdata;
+
+	*state = data->cooling_dev_state;
+
+	return 0;
+}
+
+static int max6650_set_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long state)
+{
+	struct max6650_data *data = cdev->devdata;
+	struct i2c_client *client = data->client;
+	int err;
+
+	state = clamp_val(state, 0, 255);
+
+	mutex_lock(&data->update_lock);
+
+	if (data->config & MAX6650_CFG_V12)
+		data->dac = 180 - (180 * state)/255;
+	else
+		data->dac = 76 - (76 * state)/255;
+
+	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, data->dac);
+
+	if (!err) {
+		max6650_set_operating_mode(data, state ?
+						   MAX6650_CFG_MODE_OPEN_LOOP :
+						   MAX6650_CFG_MODE_OFF);
+		data->cooling_dev_state = state;
+	}
+
+	mutex_unlock(&data->update_lock);
+
+	return err < 0 ? err : 0;
+}
+
+static const struct thermal_cooling_device_ops max6650_cooling_ops = {
+	.get_max_state = max6650_get_max_state,
+	.get_cur_state = max6650_get_cur_state,
+	.set_cur_state = max6650_set_cur_state,
+};
+#endif
+
 static int max6650_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -709,6 +769,7 @@ static int max6650_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	data->client = client;
+	i2c_set_clientdata(client, data);
 	mutex_init(&data->update_lock);
 	data->nr_fans = of_id ? (int)(uintptr_t)of_id->data : id->driver_data;
 
@@ -727,7 +788,33 @@ static int max6650_probe(struct i2c_client *client,
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
 							   client->name, data,
 							   data->groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	err = PTR_ERR_OR_ZERO(hwmon_dev);
+	if (err)
+		return err;
+
+#if IS_ENABLED(CONFIG_THERMAL)
+	data->cooling_dev =
+		thermal_of_cooling_device_register(client->dev.of_node,
+						   id->name, data,
+						   &max6650_cooling_ops);
+	if (IS_ERR(data->cooling_dev))
+		dev_warn(&client->dev,
+			 "thermal cooling device register failed: %d\n",
+			 PTR_ERR(data->cooling_dev));
+	else
+		thermal_cdev_update(data->cooling_dev);
+#endif
+	return 0;
+}
+
+static int max6650_remove(struct i2c_client *client)
+{
+	struct max6650_data *data = i2c_get_clientdata(client);
+
+	if (!IS_ERR(data->cooling_dev))
+		thermal_cooling_device_unregister(data->cooling_dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id max6650_id[] = {
@@ -743,6 +830,7 @@ static struct i2c_driver max6650_driver = {
 		.of_match_table = of_match_ptr(max6650_dt_match),
 	},
 	.probe		= max6650_probe,
+	.remove		= max6650_remove,
 	.id_table	= max6650_id,
 };
 
-- 
2.11.0

