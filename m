Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AB3C10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B6E4214DA
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGXnM9SU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388369AbfDRUFC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 16:05:02 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46821 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbfDRUFC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 16:05:02 -0400
Received: by mail-qt1-f193.google.com with SMTP id z17so3481233qts.13
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 13:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ap+x4gbuD8hgSSe1XdHMulceKKWb7aU1PbstbNjGV2o=;
        b=kGXnM9SU9JtaU5DmBcEjyZ3mZTDhXURUeMpiDqY16LOzGEOfujRC4vcB2/+E7n/UUf
         fCjt+QahhJRuJC/dCqb6e2Ju8KQRB7lbfEXw1Dc5zOEW6ddOj7lkMZqJNpzywRzBY+lo
         lAW2Fs60j2MncyvszsIlQaoz1eN6BMNCIR6TDkLUhH2Zts2hBIBuj5FVhan17LG1ScEZ
         DnU1l1lVSft+XfmheVePlqWTdVH86jo3+pNMVODoQl0hh0YrSMbmQGLczP2vmoijMzrt
         AS7T2vuhGv2ldoQudkiBcd+mNcjR1pWO1b8j2KQvrUthqDQQVQiBVFfbUsupTYUF3qxO
         TSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ap+x4gbuD8hgSSe1XdHMulceKKWb7aU1PbstbNjGV2o=;
        b=WNbtbyGfg3Gs0lK263/vSetbAhjwuQSy3M8M/8DXW0cPRaKxV3X4CC4tVkPjw4jLxf
         UtD+wJ+p94pPreO/DPcOmNnL282n8bHL+WQZiC2eEG0xtvE0PYYIMCAltK2rkxe9K0o5
         l0Gi3GfawCxJFUmACiSlKYjzpXw3N2/lDv2tfhf5yvO4E8Q98QHVmICN9mQ4l+gLVj8H
         3MKdjFOrevINOEj80aIriST9cvqocD1VsqV0hyZFATx6ueDV5/0PbgT78OJctqhOupQd
         VoIdZKE3MprLTuoybket22D/K45cTg9U9aZZ4lUuBbGY7gcwUYZCdYRJBr4JR3pyh8v2
         C8mA==
X-Gm-Message-State: APjAAAVNbwcVhQAizn99OTES4nO3fLaDrn+wCZn5yP5CcefuY2MN2N3F
        59uPGdH8gDFOI5fu/7DqbN/ThUgDFwcVoQ==
X-Google-Smtp-Source: APXvYqxb0733H/kpptP+CKxmiwclg0iOoK/OqOSs5dEgU+Tm/X2xjIUCw9oI/UYeHLD4LZaRXpJ10Q==
X-Received: by 2002:ac8:33b8:: with SMTP id c53mr74917874qtb.11.1555617900985;
        Thu, 18 Apr 2019 13:05:00 -0700 (PDT)
Received: from jfddesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id q51sm1981664qtc.38.2019.04.18.13.04.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 13:05:00 -0700 (PDT)
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v3] hwmon: max6650: add thermal cooling device capability
Date:   Thu, 18 Apr 2019 16:04:52 -0400
Message-Id: <20190418200452.5703-1-jeff.dagenais@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
References: <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
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
        Removed left-over debug printk.
Changes in v3:
        Add missing dependency in Kconfig

 drivers/hwmon/Kconfig   |  1 +
 drivers/hwmon/max6650.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 91 insertions(+), 1 deletion(-)

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
index 61135a2d0cff..f1cbbaaa1206 100644
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
+/* thermal cooling device callbacks */
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
+static int
+max6650_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
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
 
@@ -727,7 +788,34 @@ static int max6650_probe(struct i2c_client *client,
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
+	if (IS_ERR(data->cooling_dev)) {
+		err = PTR_ERR(data->cooling_dev);
+		dev_err(&client->dev,
+			"Failed to register as cooling device (%d)\n", err);
+		return err;
+	}
+
+	thermal_cdev_update(data->cooling_dev);
+#endif
+	return 0;
+}
+
+static int max6650_remove(struct i2c_client *client)
+{
+	struct max6650_data *data = i2c_get_clientdata(client);
+
+	thermal_cooling_device_unregister(data->cooling_dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id max6650_id[] = {
@@ -743,6 +831,7 @@ static struct i2c_driver max6650_driver = {
 		.of_match_table = of_match_ptr(max6650_dt_match),
 	},
 	.probe		= max6650_probe,
+	.remove		= max6650_remove,
 	.id_table	= max6650_id,
 };
 
-- 
2.11.0

