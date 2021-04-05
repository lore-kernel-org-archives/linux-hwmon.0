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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD8FC433B4
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Apr 2021 12:56:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A772461399
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Apr 2021 12:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbhDEM4a (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Apr 2021 08:56:30 -0400
Received: from fallback17.m.smailru.net ([94.100.176.130]:34416 "EHLO
        fallback17.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhDEM4a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Apr 2021 08:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=rr6oxK4bfxRKdMIVM2fxkiZQFmYokpjlCBZl864fF6M=;
        b=AfoWCL1M395XfQ2LldfFT6guHIxlyam8LNj5Or2FwXgMPExlmDmz60gmOpMkHko4E/TSePG+ybQpF8qb2+cRIbgVs1Nq6hd3g3darlj7s1Gf1XoJ8k404KzDKjiZVX4vRl2GR2uewYsHSr4MQk+ceimaF+teBVi0oON2PQuPoGg=;
Received: from [10.161.22.24] (port=50650 helo=smtp54.i.mail.ru)
        by fallback17.m.smailru.net with esmtp (envelope-from <gismatov.az@mail.ru>)
        id 1lTOmE-0000r3-LZ
        for linux-hwmon@vger.kernel.org; Mon, 05 Apr 2021 15:56:23 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=rr6oxK4bfxRKdMIVM2fxkiZQFmYokpjlCBZl864fF6M=;
        b=iE92dAJoxXpgENzGHRYL9+KKFx3ZQuj7/UjQOAFh5sEUV1EMXWtZEoh3Ps+7rIvhMqk/Uhxree2w5xx3b1plGcfgiGPYoLYcW72k0JATjNTqkFbeEP9hjvdVLCyAnIAjryhP0HXe3EyzGomAMQbhzArsh6etaPeL9LaTGBgYJ6g=;
Received: by smtp54.i.mail.ru with esmtpa (envelope-from <gismatov.az@mail.ru>)
        id 1lTOlr-0000yo-EM; Mon, 05 Apr 2021 15:55:59 +0300
From:   Azat Gismatov <gismatov.az@mail.ru>
To:     jdelvare@suse.com
Cc:     Azat Gismatov <gismatov.az@mail.ru>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, linux-hwmon@vger.kernel.org
Subject: [PATCH] lm63: Added thermal zone support
Date:   Mon,  5 Apr 2021 15:55:22 +0300
Message-Id: <20210405125522.2814-1-gismatov.az@mail.ru>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9ED7173E37F4E32947427BE79D20CABD433B5E0F054050395182A05F538085040B28989B9EA4DBBB8260CDA6B34BC63B3AB45803D10892EA7D650513F24B284AE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F10646C0E1989908EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DEEC83A7CF8598608638F802B75D45FF914D58D5BE9E6BC131B5C99E7648C95C16EE06F5A270FE6AFB3957FCDFADC3F6D9196596150634B3A471835C12D1D9774AD6D5ED66289B5278DA827A17800CE764603B5C71CE8B8F9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3A7AC412AE061D850117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFC622C41C1E00DAE1BA3038C0950A5D36C8A9BA7A39EFB766EC990983EF5C0329BA3038C0950A5D36D5E8D9A59859A8B6B9CFF1386A28814A76E601842F6C81A1F004C906525384307823802FF610243DF43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A392EE3A9D0FB4FE0F997934044CEE80936843847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 8BD88D57C5CADBC8B2710865C3867510F06FF5FC0997E3F8A3B1A56EE2B804F6B226C914C996894645FD9D8A29397D6EFF55FE49A3C2BFCFC8C84E951CD0BE2F296C473AB1E14218EA052B563B0B06C67866D6147AF826D81F448FA8BEDE1D8A9BEA5FFEA513BD2CF972CCD2F8FE1EF1CFC4036BBF6A4EA9B34B8309BF3CB3F7BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C02783DDD5A45DEFA5807D90CB1C45CEE6FF34A9FF10454C7C9F949B871F5042E3C09E5A05D88D9C1D7E09C32AA3244C63AAAB47467243742E906AB5BC54BB18853296C06374E6028D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojM00ve/f+0ok5sxuKlcL9lg==
X-Mailru-Sender: BC6B166D6148273FE469AD695B26BD30B1BD464C410C136E57D5CC704B2CD463FFDE29ECC361E668410615E0A1CDF36092B3047B11A23679F4B3022216E064827AA22088860DD9FF158FA63D743E5FB4327D77830F209D78AE208404248635DF
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4DF7173A40FF1347DA6106AACE9855D495A14DAA8ABFFBC8C049FFFDB7839CE9EEAEE7218277C81E58DC5D4DB1ECEF3E8714DFA9F68661956E746889F081586D5
X-7FA49CB5: 0D63561A33F958A5B20D953CB496F115E5C7BF3C4F1416BA9748E964D135AAC98941B15DA834481FA18204E546F3947C9FFED5BD9FB41755F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637AD21106AC922757F389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637AEEE038640289DEED81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636AAAE862A0553A392EE3A9D0FB4FE0F997934044CEE80936843847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 8BD88D57C5CADBC8B2710865C3867510F06FF5FC0997E3F8A3B1A56EE2B804F6B226C914C996894645FD9D8A29397D6EFF55FE49A3C2BFCFC8C84E951CD0BE2F296C473AB1E14218EA052B563B0B06C67866D6147AF826D8F88EED8085D5A23A6A28EC6930380481F972CCD2F8FE1EF1CFC4036BBF6A4EA9B34B8309BF3CB3F7BDAD6C7F3747799A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojM00ve/f+0onjVMSsQOH/bA==
X-Mailru-MI: 1000
X-Mailru-Sender: A5480F10D64C90054EBC784E05B22290581CE1E4B7FAC40544E4532105CCB4B66ECF975C7BB2667F0AB41758C2E3D51FD6ED47CEAE8F7A876F194D2DE882C966E08AD13A84CB3945A0D7F5C328EC978D592DC799C9E688FC0DA7A0AF5A3A8387
X-Mras: Ok
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There are target systems where temperature sensor in the lm63
is not the only temperature sensor in the system used to make
thermal decisions. For example temperature sensors aren't
connected to the lm63 (sensors are part of CPU and supported
by own linux driver). So automatic fan control by the lm63 chip
doesn't work for that systems.
Using of thermal zone is much more convenient for embedded
systems, than fan-control, or any other userspace software,
because It allow to get smaller software footprint. Also with
thermal zone we can store all cooling settings in devicetree,
which is easier to maintain for embedded systems, than some
userspace software.
Added support to use manual pwm mode by  property  in device
tree "#pwm-cells" (#pwm-cells = <2>). This property checkes
the presence of a pwm chip. If the property is set in the
device tree, we will use the manual pwm mode by default. From
the user mode it will not be possible to change automatical
mode in the sysfs attributes. So pwm_chip_add () is used. In
the device tree lable pwm_fan is used as a cooling device,
it has a "pwms" property in description which is a link to
the pwm device label. Driver pwm-fan registers thermal_zone
cooling device.
Example lm96163, pwm-fan device tree:
pwm: lm96163@4c {
	compatible = "national,lm96163";
	reg = <0x4c>;
	#pwm-cells = <2>;
	/* 0 - one sensor, 1 - many sensors */
	#thermal-sensor-cells = <1>;
};
fan: pwm_fan {
	compatible = "pwm-fan";
	/* arg 0 - pwm chip; arg 1 - pwm_id; arg 2 - period*/
	pwms = <&pwm 0 100>;
	#cooling-cells = <2>;
	cooling-levels = <0 25 128 255>;
};

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Azat Gismatov <gismatov.az@mail.ru>
---
 drivers/hwmon/lm63.c | 121 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 50f67265c71d..7d685cc4c0bc 100644
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
@@ -131,6 +135,12 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
 
 enum chips { lm63, lm64, lm96163 };
 
+struct lm63_thermal_sensor {
+	struct lm63_data *data;
+	struct thermal_zone_device *tz;
+	unsigned int sensor_id;
+};
+
 /*
  * Client data (each client gets its own)
  */
@@ -173,8 +183,15 @@ struct lm63_data {
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
@@ -421,6 +438,9 @@ static ssize_t pwm1_enable_store(struct device *dev,
 	unsigned long val;
 	int err;
 
+	if (of_get_property(dev->of_node, "#pwm-cells", NULL))
+		return -EPERM;
+
 	err = kstrtoul(buf, 10, &val);
 	if (err)
 		return err;
@@ -1018,6 +1038,8 @@ static void lm63_init_client(struct lm63_data *data)
 	u8 convrate;
 
 	data->config = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG1);
+	if (of_get_property(dev->of_node, "#pwm-cells", NULL))
+		i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN, 0x20);
 	data->config_fan = i2c_smbus_read_byte_data(client,
 						    LM63_REG_CONFIG_FAN);
 
@@ -1087,6 +1109,96 @@ static void lm63_init_client(struct lm63_data *data)
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
+	struct lm63_data *data = arg;
+
+	pwmchip_remove(&data->chip);
+}
+
+static void lm63_init_pwm(struct lm63_data *data)
+{
+	struct i2c_client *client = data->client;
+	int ret;
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
+		return;
+	}
+
+	devm_add_action_or_reset(&client->dev, lm63_pwm_remove, data);
+}
+
+static int lm63_get_temp(void *data, int *temp)
+{
+	struct lm63_thermal_sensor *thermal_sensor = data;
+
+	*temp = i2c_smbus_read_byte_data(thermal_sensor->data->client,
+			LM63_REG_LOCAL_TEMP + thermal_sensor->sensor_id) * 1000;
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
+	}
+}
+
 static const struct i2c_device_id lm63_id[];
 
 static int lm63_probe(struct i2c_client *client)
@@ -1126,7 +1238,14 @@ static int lm63_probe(struct i2c_client *client)
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data, data->groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	lm63_init_thermal(data);
+	if (IS_ENABLED(CONFIG_PWM))
+		lm63_init_pwm(data);
+
+	return 0;
 }
 
 /*
-- 
2.20.1

