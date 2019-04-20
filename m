Return-Path: <SRS0=/An6=SW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ADFC282E1
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 03:02:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B9EA6208C0
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 03:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6rf/Osv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfDTDCv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Apr 2019 23:02:51 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37131 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfDTDCv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Apr 2019 23:02:51 -0400
Received: by mail-qt1-f193.google.com with SMTP id z16so7153234qtn.4
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Apr 2019 20:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+P63k3AYp3Mpk/iF6dwLcDM5tqkgeIfFXin2hy96sp4=;
        b=V6rf/Osvtt6KRN6f02J+nxUEuAHPMpLpoMzDeSl5T2hSA07i5wURGZSKzJzhN/97eT
         LQQHzDjhsNlh98t8xVjOEdWTpa/rIJcXQNOuEMthadjEp7QqgCT/da7A8p/wU64xf5pM
         yDuLNq/duvOcmODpv8N9s2mG8dVPhcF4cksSVfiJlFkSg9Unjqxhvcr2azoICgxIXx5V
         I7bEdWTiGf0AJKwbRKIEPX7cR8oMSBAZPyhOMhbV3VbawfginOuTCHWQSVjMQURKqUjt
         328wLZrN80uFes1fnk+1QFwbMQtNl1z7Dl719ldpv9gyzfyxALyV+3jJ3xwfEs8/vAfi
         qpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+P63k3AYp3Mpk/iF6dwLcDM5tqkgeIfFXin2hy96sp4=;
        b=hIrNUnN36F4TApOVi2yV1ave8oiLV2/HorcL81dfidfm/ftabXzV1Eerh/qyYmv+e8
         lo4s+TyW9BRmu8972NTzfUi2dlaBI26X+IiJAXx5LT5/Pq6EFmlxyvkZSVna1pbSimdC
         //ZWsXfUdvumMfn5R0Bb6rgfmawBWDS/KRm8GDdLGWaU4xfpjTwyfn3/xkoGGc21VZOg
         gc76qKu5O/6MCKW+13+GgiKr1uq2Yg5oYSuEctwP4BCYNRNzXBRV1oqmMEUgTBKFmqst
         f5ZP6+g/asKw7etNY2ZyXUZyn9mrmwEw+WnV3O85cK6xsbDUj/Ll4jdBop1RJYQAj/EQ
         bFtA==
X-Gm-Message-State: APjAAAUjyFOxS+dz4kqZMC06mI6MH7ur4CbNOANEa3sKsnT1FOHExI0L
        h0bSHGp05Dsvduus+quFsL11HM/pdh4=
X-Google-Smtp-Source: APXvYqy2WJA7CDpxk/DxUMompcA4Cdw1SfRfpQ0F7vPvoXuah5Mseq1ZCjcWO6CNAjDfqcIuCcPzhA==
X-Received: by 2002:ac8:fb0:: with SMTP id b45mr6166424qtk.293.1555729369467;
        Fri, 19 Apr 2019 20:02:49 -0700 (PDT)
Received: from jfddesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id x5sm3145928qki.26.2019.04.19.20.02.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Apr 2019 20:02:48 -0700 (PDT)
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v5] hwmon: max6650: add thermal cooling device capability
Date:   Fri, 19 Apr 2019 23:02:33 -0400
Message-Id: <20190420030233.4651-1-jeff.dagenais@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <201904192317.2UiQUP23%lkp@intel.com>
References: <201904192317.2UiQUP23%lkp@intel.com>
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
Changes in v5:
	- Use switch to non-const client->name to prevent compiler warning
	- fix incorrect length of printk format long int

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
index 61135a2d0cff..0607d54f8090 100644
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
 
@@ -727,7 +788,34 @@ static int max6650_probe(struct i2c_client *client,
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
 							   client->name, data,
 							   data->groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	err = PTR_ERR_OR_ZERO(hwmon_dev);
+	if (err)
+		return err;
+
+
+#if IS_ENABLED(CONFIG_THERMAL)
+	data->cooling_dev =
+		thermal_of_cooling_device_register(client->dev.of_node,
+						   client->name, data,
+						   &max6650_cooling_ops);
+	if (IS_ERR(data->cooling_dev))
+		dev_warn(&client->dev,
+			 "thermal cooling device register failed: %ld\n",
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
@@ -743,6 +831,7 @@ static struct i2c_driver max6650_driver = {
 		.of_match_table = of_match_ptr(max6650_dt_match),
 	},
 	.probe		= max6650_probe,
+	.remove		= max6650_remove,
 	.id_table	= max6650_id,
 };
 
-- 
2.11.0

