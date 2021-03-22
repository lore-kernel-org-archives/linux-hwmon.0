Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B855C433E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 10:36:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2640061930
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 10:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhCVKfw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Mar 2021 06:35:52 -0400
Received: from fallback22.m.smailru.net ([94.100.176.132]:60772 "EHLO
        fallback22.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhCVKfh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Mar 2021 06:35:37 -0400
X-Greylist: delayed 3365 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Mar 2021 06:35:37 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=NjdeelSbS/HsZ0HOjpTGSeBxVi3b2mwDgQTwQUvZpjA=;
        b=oJnwsbsLw2KOPsC/SQQ8aQPCzBBxHE13A8/JsVSi0L+TZfkPJghjgAD6Dq1415gHm6eDQRzHUXbeybqVQDUzzoQn69muXYzsMtp9n1V/XQSe25y9j2afKm/jCOpHQrZKHwgqYHoJh7NfLFyKcsg0CxY13b8lOjy1aE554h3Lw8g=;
Received: from [10.161.64.37] (port=43044 helo=smtp29.i.mail.ru)
        by fallback22.m.smailru.net with esmtp (envelope-from <gismatov.az@mail.ru>)
        id 1lOH21-0008Uj-K9
        for linux-hwmon@vger.kernel.org; Mon, 22 Mar 2021 12:39:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=NjdeelSbS/HsZ0HOjpTGSeBxVi3b2mwDgQTwQUvZpjA=;
        b=I0AFlZUazW+X9hBQ5TcGg+TEJNh76uRXOjhXixGjQSLAi4V8bg0KcP98a4rEH3PxYj6rlQ23n6NL/SWWm69LcLC5FRHvBJsNKw/J53KkGrLZ7w0NXJzzzDsDJ39Bs7Eq2Ne5eUR1bp/c/siMejhjQWh2Hyi5xyhpWvxu5IQT0Wg=;
Received: by smtp29.i.mail.ru with esmtpa (envelope-from <gismatov.az@mail.ru>)
        id 1lOH1n-0007wR-Ih; Mon, 22 Mar 2021 12:39:16 +0300
From:   Azat Gismatov <gismatov.az@mail.ru>
To:     jdelvare@suse.com
Cc:     Azat Gismatov <gismatov.az@mail.ru>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, linux-hwmon@vger.kernel.org
Subject: [PATCH] lm63: Added thermal zone support
Date:   Mon, 22 Mar 2021 12:39:04 +0300
Message-Id: <20210322093904.2340-1-gismatov.az@mail.ru>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95D6E7CC48CB1F5F179C48A9DDACBFB6F5347129BC2C9341C182A05F538085040325BE89511FEBAD492319FA50FCD0A5F7662FC7B67A639D65A58D830D6F7D915
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE768D1C4AD116E0413EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637040380BD28C1B15C8638F802B75D45FF914D58D5BE9E6BC131B5C99E7648C95C686AF563A045C75E897870564EA46A7F67E19B4903630BC9A471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7D38CA8945C5827839FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3643C8550F8485502117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF65E2844F79EE3F05BA3038C0950A5D36C8A9BA7A39EFB766EC990983EF5C0329BA3038C0950A5D36D5E8D9A59859A8B6FEFC3268A0BCC3973AA81AA40904B5D9DBF02ECDB25306B2B25CBF701D1BE8734AD6D5ED66289B5278DA827A17800CE73C4A48FD52A9EB7367F23339F89546C5A8DF7F3B2552694A6FED454B719173D6725E5C173C3A84C37964CC910C88DD5935872C767BF85DA2F004C906525384306FED454B719173D6462275124DF8B9C975FAC89DD1A0FDCBE5BFE6E7EFDEDCD789D4C264860C145E
X-C1DE0DAB: 8BD88D57C5CADBC8B2710865C3867510F06FF5FC0997E3F8A3B1A56EE2B804F6B226C914C996894645FD9D8A29397D6EFF55FE49A3C2BFCFC8C84E951CD0BE2F296C473AB1E14218EA052B563B0B06C67866D6147AF826D887B3DC525949C11A7B97CD3D98022055F972CCD2F8FE1EF1CFC4036BBF6A4EA93869C8B87B4BBB85CB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34FF70CCB59A6ED87038F927D96E72F60D3FF95EC8929FD1C6585A56DEA5C76CAFA87E49115464E0151D7E09C32AA3244C2EA4DB5F243E5FF5F8ECCF3A7BBF8A1FC86C126E7119A0FE8D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWJZv20R+6UhbtCRQbT3V4A==
X-Mailru-Sender: BC6B166D6148273F442A1BC247591E1E0B8E64D7A0E95356C06A9C494E43A8743CB4560455440C36410615E0A1CDF36092B3047B11A23679F4B3022216E064827AA22088860DD9FF158FA63D743E5FB4327D77830F209D78AE208404248635DF
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B43D3FA0ACCFBC07C6046E779C2B5E99972888A63633B1EFF4049FFFDB7839CE9EFA817F5924DFCA75C7744AA2C6220ED9A66AB984066D937CACCB3038C1465966
X-7FA49CB5: 0D63561A33F958A598607CED86D7B893A3FAE1B92865C4B0ED38A97F0A6463DA8941B15DA834481FA18204E546F3947CBFBFE0634520CEB9F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063711757D3C6D490C2A389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637801332F8CEA397F7D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636A7F4EDE966BC389F9E8FC8737B5C2249751A052095098A87089D37D7C0E48F6CCF19DD082D7633A0E7DDDDC251EA7DABAAAE862A0553A3920E30A4C9C8E338DAA82A894AE7C65F9E43847C11F186F3C5E7DDDDC251EA7DABCC89B49CDF41148F458B267F216095A92623479134186CDE6BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 8BD88D57C5CADBC8B2710865C3867510F06FF5FC0997E3F8A3B1A56EE2B804F6B226C914C996894645FD9D8A29397D6EFF55FE49A3C2BFCFC8C84E951CD0BE2F296C473AB1E14218EA052B563B0B06C67866D6147AF826D8E05449FBBEC2995A7302B8E15FC16BB0F972CCD2F8FE1EF1CFC4036BBF6A4EA93869C8B87B4BBB85CB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWJZv20R+6UjeM6uSeT7SJQ==
X-Mailru-MI: 1000
X-Mailru-Sender: A5480F10D64C9005DD084BBBA291661DB12AE21EDC3867DDC01902DFB2D4F0416CCF71F689FD47EE0AB41758C2E3D51FD6ED47CEAE8F7A876F194D2DE882C966E08AD13A84CB3945A0D7F5C328EC978D592DC799C9E688FC0DA7A0AF5A3A8387
X-Mras: Ok
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There are target systems where pwm controller is the lm63, but 
temperature sensors aren't connected to the lm63 (sensors are
part of CPU and supported by own linux driver). Automatic fan
control by the lm63 chip doesn't work for that systems.
Thermal zone is much more convenient for embedded systems, than
fan-control, or any other userspace software, because It allow
to get smaller software footprint. Also with thermal zone we
can store all cooling settings in devicetree, which is easier
to maintain for embedded systems, than some userspace software.
Added support property "pwm-mode" (pwm-mode = "manual") for
devicetree to use a manual pwm mode in the lm63 driver.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Azat Gismatov <gismatov.az@mail.ru>
---
 drivers/hwmon/lm63.c | 133 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 132 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 50f67265c71d..764bc528294f 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -34,7 +34,9 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/pwm.h>
 #include <linux/sysfs.h>
+#include <linux/thermal.h>
 #include <linux/types.h>
 
 /*
@@ -97,6 +99,8 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
 #define LM63_MAX_CONVRATE_HZ		32
 #define LM96163_MAX_CONVRATE_HZ		26
 
+#define MAX_SENSORS	2
+
 /*
  * Conversions and various macros
  * For tachometer counts, the LM63 uses 16-bit values.
@@ -173,8 +177,15 @@ struct lm63_data {
 	bool lut_temp_highres;
 	bool remote_unsigned; /* true if unsigned remote upper limits */
 	bool trutherm;
+	struct pwm_chip chip;
+	struct lm63_thermal_sensor thermal_sensor[MAX_SENSORS];
 };
 
+static inline struct lm63_data *to_pwm(struct pwm_chip *chip)
+{
+	return container_of(chip, struct lm63_data, chip);
+}
+
 static inline int temp8_from_reg(struct lm63_data *data, int nr)
 {
 	if (data->remote_unsigned)
@@ -1015,9 +1026,15 @@ static void lm63_init_client(struct lm63_data *data)
 {
 	struct i2c_client *client = data->client;
 	struct device *dev = &client->dev;
+	const char *pwm_mode;
 	u8 convrate;
 
 	data->config = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG1);
+	pwm_mode = of_get_property(dev->of_node, "pwm-mode", NULL);
+	if (pwm_mode) {
+		if (!strcmp(pwm_mode, "manual"))
+			i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN, 0x20);
+	}
 	data->config_fan = i2c_smbus_read_byte_data(client,
 						    LM63_REG_CONFIG_FAN);
 
@@ -1087,6 +1104,108 @@ static void lm63_init_client(struct lm63_data *data)
 		(data->config_fan & 0x20) ? "manual" : "auto");
 }
 
+static int lm63_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+				const struct pwm_state *state)
+{
+	struct lm63_data *data = to_pwm(chip);
+	struct i2c_client *client = data->client;
+	int ret = -EINVAL;
+	u8 pwm_mode;
+	u8 val;
+
+	mutex_lock(&data->update_lock);
+	pwm_mode = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG_FAN);
+	if (!(pwm_mode >> 5)) {
+		mutex_unlock(&data->update_lock);
+		return -EPERM;
+	}
+
+	if (state->period > 1) {
+		val = state->duty_cycle * 255 / (state->period - 1);
+		val = clamp_val(val, 0, 255);
+		val = data->pwm_highres ? val :
+				(val * data->pwm1_freq * 2 + 127) / 255;
+		ret = i2c_smbus_write_byte_data(client, LM63_REG_PWM_VALUE, val);
+	}
+
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static const struct pwm_ops lm63_pwm_ops = {
+	.apply = lm63_pwm_apply,
+	.owner = THIS_MODULE,
+};
+
+static void lm63_pwm_remove(void *arg)
+{
+	struct i2c_client *client = arg;
+	struct lm63_data *data = i2c_get_clientdata(client);
+
+	pwmchip_remove(&data->chip);
+}
+
+static int lm63_init_pwm(struct lm63_data *data)
+{
+	struct i2c_client *client = data->client;
+	int ret;
+
+	ret = devm_add_action(&client->dev, lm63_pwm_remove, client);
+	if (ret)
+		return ret;
+
+	/* Initialize chip */
+
+	data->chip.dev = &client->dev;
+	data->chip.ops = &lm63_pwm_ops;
+	data->chip.base = -1;
+	data->chip.npwm = 1;
+
+	ret = pwmchip_add(&data->chip);
+	if (ret < 0) {
+		dev_warn(&client->dev, "pwmchip_add() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int lm63_get_temp(void *data, int *temp)
+{
+	struct lm63_thermal_sensor *thermal_sensor = data;
+
+	mutex_lock(&thermal_sensor->data->update_lock);
+	*temp = i2c_smbus_read_byte_data(thermal_sensor->data->client,
+			LM63_REG_LOCAL_TEMP + thermal_sensor->sensor_id) * 1000;
+	mutex_unlock(&thermal_sensor->data->update_lock);
+
+	return 0;
+}
+
+static const struct thermal_zone_of_device_ops lm63_tz_ops = {
+	.get_temp = lm63_get_temp,
+};
+
+static void lm63_init_thermal(struct lm63_data *data)
+{
+	struct i2c_client *client = data->client;
+	struct lm63_thermal_sensor *thermal_sensor;
+	unsigned int i;
+
+	thermal_sensor = data->thermal_sensor;
+	for (i = 0; i < MAX_SENSORS; i++, thermal_sensor++) {
+		thermal_sensor->data = data;
+		thermal_sensor->sensor_id = i;
+		thermal_sensor->tz = devm_thermal_zone_of_sensor_register(&client->dev,
+						 i, thermal_sensor, &lm63_tz_ops);
+
+		if (IS_ERR(thermal_sensor->tz)) {
+			dev_warn(&client->dev, "unable to register thermal sensor %ld\n",
+				 PTR_ERR(thermal_sensor->tz));
+		}
+	}
+}
+
 static const struct i2c_device_id lm63_id[];
 
 static int lm63_probe(struct i2c_client *client)
@@ -1095,6 +1214,7 @@ static int lm63_probe(struct i2c_client *client)
 	struct device *hwmon_dev;
 	struct lm63_data *data;
 	int groups = 0;
+	int ret;
 
 	data = devm_kzalloc(dev, sizeof(struct lm63_data), GFP_KERNEL);
 	if (!data)
@@ -1126,7 +1246,18 @@ static int lm63_probe(struct i2c_client *client)
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data, data->groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	i2c_set_clientdata(client, data);
+	lm63_init_thermal(data);
+	if (IS_ENABLED(CONFIG_PWM)) {
+		ret = lm63_init_pwm(data);
+		if (ret)
+			lm63_pwm_remove(data);
+	}
+
+	return 0;
 }
 
 /*
-- 
2.20.1

