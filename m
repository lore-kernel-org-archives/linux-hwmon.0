Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1780647126E
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935759; cv=none; b=S7aJmHem1gsZQf8A8pvKU1kCqXdlpJCoIgZG7XICGNqEB6U0OKQPu4STjE8HY4/by43DyPSs739R/97Q/x0u6KG+IUzyauiGmY7CKvbAiaO8H9jWc87K1leicpGYz5loRlIEgM1FiJ/3B+zUZMgX64AP6PYnw06u449XpEdD4uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935759; c=relaxed/simple;
	bh=6Sz4Q0ABr5Tfip31KyIIcvrudC0SDzp/CSjmJxU7CSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QHIjK4qLJNgdFCa6W8Gb92dm4J7kMEEMJ9LyIy1dnx07KAGvGU/jYCAiAxgp3lQKCk1nKUp7Me2BeGwlMYhI/zMin/TU/ktsqvnk2yxJj9vyhkRB0ekw1iXOKef6fE7/Xzs5Uvefx12FtTPqHDw77uczT3gDg5HSYoe8nKJ3tfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIVfKMeB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIVfKMeB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso879206a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 06:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785935754; x=1786540554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mof0gXHLBACZ9mYjnIwYKuzUS/R9hysxBWyHkqLlLTg=;
        b=fIVfKMeBxh2GTX0g9jspWdrlay5rqJAUbbY5ZOyBL4kDB9UThb9yxj+gj2sclLXpKV
         1jTomK2FzMOh0Dj8Qs3F+0Dciik4oEK0IdkyIKanSuz5C3cJOW2hM6/JnPeQWmOsc589
         YPXHo1dQfWFb0jnfbMnT7sSeO6nWxEmq97oeuxBA5HhpK8rS9IRwmpqchNDJ8FtGGnXE
         xnJOIyERzqRqMum4WqijDFWXRneyqV3OCWOFNzsf/Qvm1tgYsaKr1bopoe7QJFOgM/3C
         X2XZMEJ/wDfIUjS+flM6RXlrp7xBB6408Kl/yjwN3IucDtXuOiKEAiddLXDsWPX1UrlE
         fLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935754; x=1786540554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mof0gXHLBACZ9mYjnIwYKuzUS/R9hysxBWyHkqLlLTg=;
        b=oTbHUnRflYDrGPtDKXx3Htwu4XF5fdgXganxImQbKlkN8sfqis+UP1RBFCfpnE5msx
         ZWpMF6c7neJoLBBgo7qXYXEBuXcuXUAXnYQzlrfCU2q7z0s3JC+q4TyEjkHYwyFkBM42
         99sKoho0mYfNwTPK42h8LVXwg9CtkdEjIFiutX7OKuVh3hLmhc4gfp9NyJxZuZciwYh4
         AVBF21KtnyfFClAfvvyqhnGBthdfKSS+ntKq+9SsSu+5lsaWWudwqF/qRw6qpS5VC4II
         OsBkbZ4Ox1mwKev8cnQjmxY83sr7LcqLBuvHpU40SbNbkJdQhkqJulTvmHfTZ/XhuZXG
         ul2Q==
X-Gm-Message-State: AOJu0YzGOSrGRQAX/9XT+2Q0jCgS3o9+596JY0WWR8SXi5OpaJ6bXnPY
	RhU47OUTCupZV+wRhBVrQYZiLGB/8ULD3Qq3HEkTmzpwtLo7Bvc6JJSi
X-Gm-Gg: AR+sD11IGo9dgs/NvkuYhoBvGAZdZBGiSraHHcrDrajzZGMhJxLzyqyxZ+kxQL90VcW
	5cns0QN1af9PnMcqi0qY9ZqrkYMeXCCOkuTcve4sZPgAkDe2Z6upc/irywut6Vg9B2rPeXUXQM0
	zIY2tWQhgcWJRl0e75WZwniy3L/RQN3SBcMA1ax9s5Vh0QIkFH7xlOO87bz4yGMNwtuyrf2+voH
	PYn2UKIvTQ3WQd98bo8DQif9c9jgHCJuNugomV4VQInKVCh2D+rN9rEE3iFXiXz/AbQujdi+aCT
	oPMsLr/uAME6q5gS6Yi5+1gnZlE7NTMMWZGRyqZ3ijMG2nz9OMPm2f/bwjXEqRDsTfJXy3bX0ND
	PZNRu5lRwFe1jgl2cRMNdUwpxQMLczrYPD7WlaZZFo60Wyq0VhUSS4EVdhEMLmcfF/DB0O8bvox
	oc2TUe2GRePaYUcz22qpFw3yOLwRz32T9SUR6o+j0Z2KYoFLcPS+CBUe6kczmQYIN11CTeWn3FS
	M1hNjx2QZM=
X-Received: by 2002:a17:90b:17c6:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-3903c59330amr6273573a91.9.1785935753895;
        Wed, 05 Aug 2026 06:15:53 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([189.4.123.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673a9e4sm18292261eec.18.2026.08.05.06.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:15:52 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 05 Aug 2026 10:15:19 -0300
Subject: [hwmon-next PATCH v6 3/4] hwmon: (adt7470) Expose fan control via
 PWM framework
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-adt7470_thermalzone-v6-3-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
In-Reply-To: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

The ADT7470 features four PWM outputs designed to control fans.
Previously, these were only accessible through the legacy hwmon
sysfs interface.

Expose the ADT7470 fan control lines through the generic PWM framework.
This allows generic PWM consumers described in Device Tree, such as
"pwm-fan", to use the device through the "#pwm-cells" property.  This is
particularly necessary for boards where the ADT7470 external temperature
sensors are not populated and the chip is used strictly as a fan
controller (e.g., Edgecore ECS-2100-52T switches). In such setups,
delegating control to the generic PWM subsystem allows the kernel's
thermal framework to manage the fans based on unrelated temperature
zones, such as internal SoC sensors.

When a PWM consumer applies a new PWM state, the driver automatically
switches the corresponding PWM channel to manual mode so that the
requested duty cycle takes effect. The duty cycle specified by the PWM
framework is internally converted to the 0-255 scale expected by the
hardware registers.

To prevent conflicting access, the hwmon PWM sysfs attributes are hidden
when the device is registered with PWM framework support (i.e. when
"#pwm-cells" is present in DT and CONFIG_PWM is reachable).

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/Kconfig   |   1 +
 drivers/hwmon/adt7470.c | 194 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 194 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 6b71e3304b4f..0d6bd117d14d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -224,6 +224,7 @@ config SENSORS_ADT7462
 config SENSORS_ADT7470
 	tristate "Analog Devices ADT7470"
 	depends on I2C
+	depends on PWM || PWM=n
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the Analog Devices
diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 87ddd7b8ddae..eeec3db0da88 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -22,6 +22,9 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/util_macros.h>
+#include <linux/pwm.h>
+#include <linux/cleanup.h>
+#include <linux/math64.h>
 
 /* Addresses to scan */
 static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
@@ -164,6 +167,7 @@ struct adt7470_data {
 	char			limits_valid;
 	unsigned long		sensors_last_updated;	/* In jiffies */
 	unsigned long		limits_last_updated;	/* In jiffies */
+	bool			use_pwm_framework;
 
 	int			num_temp_sensors;	/* -1 = probe */
 	int			temperatures_probed;
@@ -887,6 +891,133 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 	return err;
 }
 
+struct adt7470_pwm_wfhw {
+	u8 val;
+};
+
+static int adt7470_pwm_round_waveform_tohw(struct pwm_chip *chip,
+					   struct pwm_device *pwm,
+					   const struct pwm_waveform *wf,
+					   void *_wfhw)
+{
+	struct adt7470_data *data = pwmchip_get_drvdata(chip);
+	struct adt7470_pwm_wfhw *wfhw = _wfhw;
+	u64 actual_period;
+
+	if (wf->duty_length_ns == 0) {
+		wfhw->val = 0;
+		return 0;
+	}
+
+	/*
+	 * The PWM frequency (period) is a single chip-wide setting shared by
+	 * all 4 channels, so it cannot be changed on a per-pwm_device basis
+	 * through this API. The duty cycle is rounded against the currently
+	 * configured hardware period rather than the period requested in
+	 * @wf; round_waveform_fromhw() reports the actual resulting
+	 * waveform back so the core/consumer can detect a mismatch.
+	 */
+	actual_period = DIV_ROUND_UP_ULL(NSEC_PER_SEC, data->pwm_freq);
+
+	if (actual_period > wf->period_length_ns)
+		/* period too short */
+		return 1;
+
+	if (wf->duty_length_ns >= actual_period) {
+		wfhw->val = ADT7470_PWM_MAX;
+	} else {
+		wfhw->val = mul_u64_u64_div_u64(wf->duty_length_ns,
+						ADT7470_PWM_MAX,
+						actual_period);
+	}
+
+	return 0;
+}
+
+static int adt7470_pwm_round_waveform_fromhw(struct pwm_chip *chip,
+					     struct pwm_device *pwm,
+					     const void *_wfhw,
+					     struct pwm_waveform *wf)
+{
+	struct adt7470_data *data = pwmchip_get_drvdata(chip);
+	const struct adt7470_pwm_wfhw *wfhw = _wfhw;
+
+	wf->period_length_ns = DIV_ROUND_UP_ULL(NSEC_PER_SEC, data->pwm_freq);
+	wf->duty_offset_ns = 0;
+	wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->val * wf->period_length_ns,
+					      ADT7470_PWM_MAX);
+	return 0;
+}
+
+static int adt7470_pwm_read_waveform(struct pwm_chip *chip,
+				     struct pwm_device *pwm,
+				     void *_wfhw)
+{
+	struct adt7470_data *data = pwmchip_get_drvdata(chip);
+	struct device *dev = regmap_get_device(data->regmap);
+	struct adt7470_pwm_wfhw *wfhw = _wfhw;
+
+	data = adt7470_update_device(dev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	/*
+	 * No lock needed: like the other hwmon_ops read callbacks in this
+	 * driver (e.g. adt7470_pwm_read()), this only does a single byte
+	 * read from the cache populated by adt7470_update_device().
+	 */
+	wfhw->val = data->pwm[pwm->hwpwm];
+
+	return 0;
+}
+
+static int adt7470_pwm_write_waveform(struct pwm_chip *chip,
+				      struct pwm_device *pwm,
+				      const void *_wfhw)
+{
+	struct adt7470_data *data = pwmchip_get_drvdata(chip);
+	const struct adt7470_pwm_wfhw *wfhw = _wfhw;
+	unsigned int pwm_auto_reg_mask;
+	int err;
+
+	if (pwm->hwpwm % 2)
+		pwm_auto_reg_mask = ADT7470_PWM2_AUTO_MASK;
+	else
+		pwm_auto_reg_mask = ADT7470_PWM1_AUTO_MASK;
+
+	guard(mutex)(&data->lock);
+
+	if (data->pwm[pwm->hwpwm] == wfhw->val &&
+	    data->pwm_automatic[pwm->hwpwm] == 0)
+		return 0;
+
+	/* Put the PWM channel in manual mode before updating it. */
+	err = regmap_update_bits(data->regmap,
+				 ADT7470_REG_PWM_CFG(pwm->hwpwm),
+				 pwm_auto_reg_mask, 0);
+	if (err < 0)
+		return err;
+
+	data->pwm_automatic[pwm->hwpwm] = 0;
+
+	err = regmap_write(data->regmap,
+			   ADT7470_REG_PWM(pwm->hwpwm), wfhw->val);
+	if (err < 0)
+		return err;
+
+	data->pwm[pwm->hwpwm] = wfhw->val;
+
+	return 0;
+}
+
+static const struct pwm_ops adt7470_pwm_ops = {
+	.sizeof_wfhw = sizeof(struct adt7470_pwm_wfhw),
+	.round_waveform_tohw = adt7470_pwm_round_waveform_tohw,
+	.round_waveform_fromhw = adt7470_pwm_round_waveform_fromhw,
+	.read_waveform = adt7470_pwm_read_waveform,
+	.write_waveform = adt7470_pwm_write_waveform,
+};
+
 static ssize_t pwm_max_show(struct device *dev,
 			    struct device_attribute *devattr, char *buf)
 {
@@ -1107,6 +1238,10 @@ static struct attribute *adt7470_attrs[] = {
 	&dev_attr_alarm_mask.attr,
 	&dev_attr_num_temp_sensors.attr,
 	&dev_attr_auto_update_interval.attr,
+	NULL
+};
+
+static struct attribute *adt7470_pwm_attrs[] = {
 	&sensor_dev_attr_force_pwm_max.dev_attr.attr,
 	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
@@ -1131,7 +1266,32 @@ static struct attribute *adt7470_attrs[] = {
 	NULL
 };
 
-ATTRIBUTE_GROUPS(adt7470);
+static const struct attribute_group adt7470_group = {
+	.attrs = adt7470_attrs,
+};
+
+static umode_t adt7470_pwm_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct adt7470_data *data = dev_get_drvdata(dev);
+
+	if (data->use_pwm_framework)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group adt7470_pwm_group = {
+		.attrs = adt7470_pwm_attrs,
+		.is_visible = adt7470_pwm_is_visible,
+};
+
+static const struct attribute_group *adt7470_groups[] = {
+		&adt7470_group,
+		&adt7470_pwm_group,
+		NULL,
+};
 
 static int adt7470_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			int channel, long *val)
@@ -1166,6 +1326,7 @@ static int adt7470_write(struct device *dev, enum hwmon_sensor_types type, u32 a
 static umode_t adt7470_is_visible(const void *_data, enum hwmon_sensor_types type,
 				  u32 attr, int channel)
 {
+	const struct adt7470_data *data = _data;
 	umode_t mode = 0;
 
 	switch (type) {
@@ -1198,6 +1359,14 @@ static umode_t adt7470_is_visible(const void *_data, enum hwmon_sensor_types typ
 		}
 		break;
 	case hwmon_pwm:
+		/* Hide all pwm attributes if this device is exposed to the PWM
+		 * framework
+		 */
+		if (data->use_pwm_framework) {
+			mode = 0;
+			break;
+		}
+
 		switch (attr) {
 		case hwmon_pwm_input:
 		case hwmon_pwm_enable:
@@ -1328,6 +1497,29 @@ static int adt7470_probe(struct i2c_client *client)
 
 	data->pwm_freq = (u32)freq_val;
 
+	data->use_pwm_framework = false;
+
+	if (device_property_present(dev, "#pwm-cells")) {
+		if (IS_REACHABLE(CONFIG_PWM)) {
+			struct pwm_chip *chip;
+
+			chip = devm_pwmchip_alloc(dev, ADT7470_PWM_COUNT, 0);
+			if (IS_ERR(chip))
+				return PTR_ERR(chip);
+
+			chip->ops = &adt7470_pwm_ops;
+			pwmchip_set_drvdata(chip, data);
+
+			err = devm_pwmchip_add(dev, chip);
+			if (err)
+				return dev_err_probe(dev, err, "failed to register PWM chip\n");
+
+			data->use_pwm_framework = true;
+		} else {
+			dev_warn(dev, "#pwm-cells present but CONFIG_PWM disabled. HWMON PWM attributes not hidden.\n");
+		}
+	}
+
 	/* Register sysfs hooks */
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &adt7470_chip_info,

-- 
2.55.0

