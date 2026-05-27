Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F13EEAC0;
	Wed, 27 May 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876646; cv=none; b=ds4TKmdPJeXVLamaG+LPB1UFP+rUeWO/jQxgb9VNHdEuePLFQoBvm+YEDAly0JN4fzZLmB8MnW1wyhpLvPsuX02VH/F+wTmysbEkUC2/tko5/lICE+16YFtB0yTj72ySZbMvYriL/7vlIOHpE97pFAkxN+jJ5CmLqOkGF1/xMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876646; c=relaxed/simple;
	bh=6Ljgb3qJ11KxGXZpAFUQc8EgE/A3N5ZfFInpHrDnodk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=TwftAPg6q5Pp7RTQiEOltXxMXNarjc5m5wQT+dCKZ4P7o/OMV/hSOXpPkQEZosYweCQqbt0Nfg3VcLPY9bSozjs9LIuUU+3Pxr/ElYFxvX0pMFPV96cHOdX4/WPU4nCi5Zigd6a+GSZTcKXUOUtNQbt0QLdWRshcxx8Zn2+htng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=LmF/cS6a; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="LmF/cS6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779876625;
	bh=8Cf81lhtAi0RVcSxpEzSD/R/SmrCeDfjt5rc0iDZBuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LmF/cS6aTsT4w05d3O+tmfbJu+L+80JQrvt2jJE4HLFeOCQWWiQr1KIvHds/0W6MF
	 B0ndVprd3weeShD4NJG91sfA/Cu+QXk8mOmMsQzyZ8s+w/jO0IeX/895R8atu8HpmJ
	 JWaALlRabfQlOGQyu3/LJKEIG1MKrt7x4hjdZboU=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 29704417; Wed, 27 May 2026 18:10:23 +0800
X-QQ-mid: xmsmtpt1779876624tvh9qhc7g
Message-ID: <tencent_75F6B92FD7C3883C6E762A08C842AF971307@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnL4cj2yrGO2r9BSEhFAxS4CT1tqJMlTIBpXkBaxBPMHE0diPtNNw
	 Kl6I0teZQ1wpB5YyDtuHxhqhJCGo+UqrVSO9otrskD8CAcL9zlO/TLxw9UIlNTn1yQ6PTB8/mIKF
	 AjRzK+rMao5oMp8ZbRAz5849mX/ZLZnictLpGXdbxZERHWLbK79OvgKVE/YPb/KWRRWGoPwwlKcs
	 11Wqr4yMakuqdIop/yjNhDhAivnJkWzwk5YRS3J9SmQgHIijYQNT/w/SDxr1cSXtut1OkUh8KOvB
	 aGnbf4zizbi2d0+uGaAR+zwOCay+CC1ZP1YPLhm+B9RWIhDrqkKiHiMjxjWjomz1ybiy/Gs1P8Jy
	 IyRne3XbVWlPtkOCWB6q8Uz4QSxyJ6+5X7YRQbXqBOpf/xDBgS6+YYc3/1umdn0jOWApjMVf3oSM
	 eqkJufq8oUXukRkxmER/xN7nTsK1iUGSI4UzrNcGtnikyjNMuciilHvgNCQPAl+JcxBR8hSUDeV1
	 adoTM5H8cpCRmC+BErmiCyh7cT1KzOL+GDHjgwwkuzV/P/Y5l94KVSmIhY6d0O2TqKziZlzanUNj
	 91x1gQabppExFgIH6B5dEx7qBFUcWiSvoWC6q+6N259vsjQg3UNH7kXR8ZhT6yYX/cCT3JFCnHlC
	 7BzyrTO52VZ/kHji3hLu9JCv6fDI0D1qnmVBclREkSRNZLPGiCfQ8nw6sw7g79Y577x5pAIn0F8n
	 i0qn0FmFirQ4BD1mlnFRaphJMk6VyCL09711aNxp+bz7OKn/lBulN/a5ZJULxTiuQEWwH0wb5KRz
	 876VmGyFI/mjdfri/2YCCXH02J1m+isSIIn4Jai7te6lnTGGPFHICI7sFMWkPMnCT58pETLx+qPo
	 jrqulCpv9x7JaXCSuSFUdE/TIMMga/61xnMyEHO1nkRfUf7U6v84wL5KYxf+ya7XueyE1OrtcqtG
	 QBXsZa9CZLxa8EViCMfERy7tDdrkw/5J6XNk95hiPNWzi6XZqNlInyuHmpPWIUTv+uld/7bUTnGI
	 6d097joisWc2CuaOxOvFi+r3NM52k=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 1/4] hwmon: (gpd-fan): drop global driver data and use per-device allocation
Date: Wed, 27 May 2026 18:10:18 +0800
X-OQ-MSGID: <30b7d47e26389bd5e1d64e8835df8e75b8d10f91.1779876412.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779876412.git.xiaopei01@kylinos.cn>
References: <cover.1779876412.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

replace the global state gpd_driver_priv with per-device private data
(struct gpd_fan_data) allocated in probe. This allows the driver to
support multiple instances in the future and aligns with kernel best
practices.

No functional change intended.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changs in v2: platform_create_bundle pass a driver_data pointer
---
 drivers/hwmon/gpd-fan.c | 209 ++++++++++++++++++++++------------------
 1 file changed, 115 insertions(+), 94 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 80de5f20781e..7284babd4f5c 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -40,12 +40,11 @@ enum FAN_PWM_ENABLE {
 	AUTOMATIC	= 2,
 };
 
-static struct {
+struct gpd_fan_data {
 	enum FAN_PWM_ENABLE pwm_enable;
 	u8 pwm_value;
-
 	const struct gpd_fan_drvdata *drvdata;
-} gpd_driver_priv;
+};
 
 struct gpd_fan_drvdata {
 	const char *board_name; // Board name for module param comparison
@@ -249,10 +248,10 @@ static const struct gpd_fan_drvdata *gpd_module_drvdata[] = {
 };
 
 // Helper functions to handle EC read/write
-static void gpd_ecram_read(u16 offset, u8 *val)
+static void gpd_ecram_read(const struct gpd_fan_drvdata *drvdata, u16 offset, u8 *val)
 {
-	u16 addr_port = gpd_driver_priv.drvdata->addr_port;
-	u16 data_port = gpd_driver_priv.drvdata->data_port;
+	u16 addr_port = drvdata->addr_port;
+	u16 data_port = drvdata->data_port;
 
 	outb(0x2E, addr_port);
 	outb(0x11, data_port);
@@ -270,10 +269,10 @@ static void gpd_ecram_read(u16 offset, u8 *val)
 	*val = inb(data_port);
 }
 
-static void gpd_ecram_write(u16 offset, u8 value)
+static void gpd_ecram_write(const struct gpd_fan_drvdata *drvdata, u16 offset, u8 value)
 {
-	u16 addr_port = gpd_driver_priv.drvdata->addr_port;
-	u16 data_port = gpd_driver_priv.drvdata->data_port;
+	u16 addr_port = drvdata->addr_port;
+	u16 data_port = drvdata->data_port;
 
 	outb(0x2E, addr_port);
 	outb(0x11, data_port);
@@ -291,198 +290,198 @@ static void gpd_ecram_write(u16 offset, u8 value)
 	outb(value, data_port);
 }
 
-static int gpd_generic_read_rpm(void)
+static int gpd_generic_read_rpm(struct gpd_fan_data *data)
 {
-	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
+	const struct gpd_fan_drvdata *drvdata = data->drvdata;
 	u8 high, low;
 
-	gpd_ecram_read(drvdata->rpm_read, &high);
-	gpd_ecram_read(drvdata->rpm_read + 1, &low);
+	gpd_ecram_read(drvdata, drvdata->rpm_read, &high);
+	gpd_ecram_read(drvdata, drvdata->rpm_read + 1, &low);
 
 	return (u16)high << 8 | low;
 }
 
-static int gpd_wm2_read_rpm(void)
+static int gpd_wm2_read_rpm(struct gpd_fan_data *data)
 {
+	const struct gpd_fan_drvdata *drvdata = data->drvdata;
+
 	for (u16 pwm_ctr_offset = GPD_PWM_CTR_OFFSET;
 	     pwm_ctr_offset <= GPD_PWM_CTR_OFFSET + 2; pwm_ctr_offset++) {
 		u8 PWMCTR;
 
-		gpd_ecram_read(pwm_ctr_offset, &PWMCTR);
+		gpd_ecram_read(drvdata, pwm_ctr_offset, &PWMCTR);
 
 		if (PWMCTR != 0xB8)
-			gpd_ecram_write(pwm_ctr_offset, 0xB8);
+			gpd_ecram_write(drvdata, pwm_ctr_offset, 0xB8);
 	}
 
-	return gpd_generic_read_rpm();
+	return gpd_generic_read_rpm(data);
 }
 
 // Read value for fan1_input
-static int gpd_read_rpm(void)
+static int gpd_read_rpm(struct gpd_fan_data *data)
 {
-	switch (gpd_driver_priv.drvdata->board) {
+	switch (data->drvdata->board) {
 	case win4_6800u:
 	case win_mini:
 	case duo:
 	case mpc2:
-		return gpd_generic_read_rpm();
+		return gpd_generic_read_rpm(data);
 	case win_max_2:
-		return gpd_wm2_read_rpm();
+		return gpd_wm2_read_rpm(data);
 	}
 
 	return 0;
 }
 
-static int gpd_wm2_read_pwm(void)
+static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
 {
-	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
+	const struct gpd_fan_drvdata *drvdata = data->drvdata;
 	u8 var;
 
-	gpd_ecram_read(drvdata->pwm_write, &var);
+	gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
 
 	// Match gpd_generic_write_pwm(u8) below
 	return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
 }
 
 // Read value for pwm1
-static int gpd_read_pwm(void)
+static int gpd_read_pwm(struct gpd_fan_data *data)
 {
-	switch (gpd_driver_priv.drvdata->board) {
+	switch (data->drvdata->board) {
 	case win_mini:
 	case duo:
 	case win4_6800u:
 	case mpc2:
-		switch (gpd_driver_priv.pwm_enable) {
+		switch (data->pwm_enable) {
 		case DISABLE:
 			return 255;
 		case MANUAL:
-			return gpd_driver_priv.pwm_value;
+			return data->pwm_value;
 		case AUTOMATIC:
 			return -EOPNOTSUPP;
 		}
 		break;
 	case win_max_2:
-		return gpd_wm2_read_pwm();
+		return gpd_wm2_read_pwm(data);
 	}
 	return 0;
 }
 
 // PWM value's range in EC is 1 - pwm_max, cast 0 - 255 to it.
-static inline u8 gpd_cast_pwm_range(u8 val)
+static inline u8 gpd_cast_pwm_range(const struct gpd_fan_drvdata *drvdata, u8 val)
 {
-	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
-
 	return DIV_ROUND_CLOSEST(val * (drvdata->pwm_max - 1), 255) + 1;
 }
 
-static void gpd_generic_write_pwm(u8 val)
+static void gpd_generic_write_pwm(struct gpd_fan_data *data, u8 val)
 {
-	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
+	const struct gpd_fan_drvdata *drvdata = data->drvdata;
 	u8 pwm_reg;
 
-	pwm_reg = gpd_cast_pwm_range(val);
-	gpd_ecram_write(drvdata->pwm_write, pwm_reg);
+	pwm_reg = gpd_cast_pwm_range(drvdata, val);
+	gpd_ecram_write(drvdata, drvdata->pwm_write, pwm_reg);
 }
 
-static void gpd_duo_write_pwm(u8 val)
+static void gpd_duo_write_pwm(struct gpd_fan_data *data, u8 val)
 {
-	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
+	const struct gpd_fan_drvdata *drvdata = data->drvdata;
 	u8 pwm_reg;
 
-	pwm_reg = gpd_cast_pwm_range(val);
-	gpd_ecram_write(drvdata->pwm_write, pwm_reg);
-	gpd_ecram_write(drvdata->pwm_write + 1, pwm_reg);
+	pwm_reg = gpd_cast_pwm_range(drvdata, val);
+	gpd_ecram_write(drvdata, drvdata->pwm_write, pwm_reg);
+	gpd_ecram_write(drvdata, drvdata->pwm_write + 1, pwm_reg);
 }
 
 // Write value for pwm1
-static int gpd_write_pwm(u8 val)
+static int gpd_write_pwm(struct gpd_fan_data *data, u8 val)
 {
-	if (gpd_driver_priv.pwm_enable != MANUAL)
+	if (data->pwm_enable != MANUAL)
 		return -EPERM;
 
-	switch (gpd_driver_priv.drvdata->board) {
+	switch (data->drvdata->board) {
 	case duo:
-		gpd_duo_write_pwm(val);
+		gpd_duo_write_pwm(data, val);
 		break;
 	case win_mini:
 	case win4_6800u:
 	case win_max_2:
 	case mpc2:
-		gpd_generic_write_pwm(val);
+		gpd_generic_write_pwm(data, val);
 		break;
 	}
 
 	return 0;
 }
 
-static void gpd_win_mini_set_pwm_enable(enum FAN_PWM_ENABLE pwm_enable)
+static void gpd_win_mini_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE pwm_enable)
 {
 	switch (pwm_enable) {
 	case DISABLE:
-		gpd_generic_write_pwm(255);
+		gpd_generic_write_pwm(data, 255);
 		break;
 	case MANUAL:
-		gpd_generic_write_pwm(gpd_driver_priv.pwm_value);
+		gpd_generic_write_pwm(data, data->pwm_value);
 		break;
 	case AUTOMATIC:
-		gpd_ecram_write(gpd_driver_priv.drvdata->pwm_write, 0);
+		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
 		break;
 	}
 }
 
-static void gpd_duo_set_pwm_enable(enum FAN_PWM_ENABLE pwm_enable)
+static void gpd_duo_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE pwm_enable)
 {
 	switch (pwm_enable) {
 	case DISABLE:
-		gpd_duo_write_pwm(255);
+		gpd_duo_write_pwm(data, 255);
 		break;
 	case MANUAL:
-		gpd_duo_write_pwm(gpd_driver_priv.pwm_value);
+		gpd_duo_write_pwm(data, data->pwm_value);
 		break;
 	case AUTOMATIC:
-		gpd_ecram_write(gpd_driver_priv.drvdata->pwm_write, 0);
+		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
 		break;
 	}
 }
 
-static void gpd_wm2_set_pwm_enable(enum FAN_PWM_ENABLE enable)
+static void gpd_wm2_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE enable)
 {
-	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
+	const struct gpd_fan_drvdata *drvdata = data->drvdata;
 
 	switch (enable) {
 	case DISABLE:
-		gpd_generic_write_pwm(255);
-		gpd_ecram_write(drvdata->manual_control_enable, 1);
+		gpd_generic_write_pwm(data, 255);
+		gpd_ecram_write(drvdata, drvdata->manual_control_enable, 1);
 		break;
 	case MANUAL:
-		gpd_generic_write_pwm(gpd_driver_priv.pwm_value);
-		gpd_ecram_write(drvdata->manual_control_enable, 1);
+		gpd_generic_write_pwm(data, data->pwm_value);
+		gpd_ecram_write(drvdata, drvdata->manual_control_enable, 1);
 		break;
 	case AUTOMATIC:
-		gpd_ecram_write(drvdata->manual_control_enable, 0);
+		gpd_ecram_write(drvdata, drvdata->manual_control_enable, 0);
 		break;
 	}
 }
 
 // Write value for pwm1_enable
-static void gpd_set_pwm_enable(enum FAN_PWM_ENABLE enable)
+static void gpd_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE enable)
 {
 	if (enable == MANUAL)
 		// Set pwm_value to max firstly when switching to manual mode, in
 		// consideration of device safety.
-		gpd_driver_priv.pwm_value = 255;
+		data->pwm_value = 255;
 
-	switch (gpd_driver_priv.drvdata->board) {
+	switch (data->drvdata->board) {
 	case win_mini:
 	case win4_6800u:
 	case mpc2:
-		gpd_win_mini_set_pwm_enable(enable);
+		gpd_win_mini_set_pwm_enable(data, enable);
 		break;
 	case duo:
-		gpd_duo_set_pwm_enable(enable);
+		gpd_duo_set_pwm_enable(data, enable);
 		break;
 	case win_max_2:
-		gpd_wm2_set_pwm_enable(enable);
+		gpd_wm2_set_pwm_enable(data, enable);
 		break;
 	}
 }
@@ -505,15 +504,16 @@ static umode_t gpd_fan_hwmon_is_visible(__always_unused const void *drvdata,
 	return 0;
 }
 
-static int gpd_fan_hwmon_read(__always_unused struct device *dev,
+static int gpd_fan_hwmon_read(struct device *dev,
 			      enum hwmon_sensor_types type, u32 attr,
 			      __always_unused int channel, long *val)
 {
+	struct gpd_fan_data *data = dev_get_drvdata(dev);
 	int ret;
 
 	if (type == hwmon_fan) {
 		if (attr == hwmon_fan_input) {
-			ret = gpd_read_rpm();
+			ret = gpd_read_rpm(data);
 
 			if (ret < 0)
 				return ret;
@@ -524,10 +524,10 @@ static int gpd_fan_hwmon_read(__always_unused struct device *dev,
 	} else if (type == hwmon_pwm) {
 		switch (attr) {
 		case hwmon_pwm_enable:
-			*val = gpd_driver_priv.pwm_enable;
+			*val = data->pwm_enable;
 			return 0;
 		case hwmon_pwm_input:
-			ret = gpd_read_pwm();
+			ret = gpd_read_pwm(data);
 
 			if (ret < 0)
 				return ret;
@@ -540,27 +540,29 @@ static int gpd_fan_hwmon_read(__always_unused struct device *dev,
 	return -EOPNOTSUPP;
 }
 
-static int gpd_fan_hwmon_write(__always_unused struct device *dev,
+static int gpd_fan_hwmon_write(struct device *dev,
 			       enum hwmon_sensor_types type, u32 attr,
 			       __always_unused int channel, long val)
 {
+	struct gpd_fan_data *data = dev_get_drvdata(dev);
+
 	if (type == hwmon_pwm) {
 		switch (attr) {
 		case hwmon_pwm_enable:
 			if (!in_range(val, 0, 3))
 				return -EINVAL;
 
-			gpd_driver_priv.pwm_enable = val;
+			data->pwm_enable = val;
 
-			gpd_set_pwm_enable(gpd_driver_priv.pwm_enable);
+			gpd_set_pwm_enable(data, data->pwm_enable);
 			return 0;
 		case hwmon_pwm_input:
 			if (!in_range(val, 0, 256))
 				return -EINVAL;
 
-			gpd_driver_priv.pwm_value = val;
+			data->pwm_value = val;
 
-			return gpd_write_pwm(val);
+			return gpd_write_pwm(data, val);
 		}
 	}
 
@@ -584,26 +586,27 @@ static struct hwmon_chip_info gpd_fan_chip_info = {
 	.info = gpd_fan_hwmon_channel_info
 };
 
-static void gpd_win4_init_ec(void)
+static void gpd_win4_init_ec(struct gpd_fan_data *data)
 {
+	const struct gpd_fan_drvdata *drvdata = data->drvdata;
 	u8 chip_id, chip_ver;
 
-	gpd_ecram_read(0x2000, &chip_id);
+	gpd_ecram_read(drvdata, 0x2000, &chip_id);
 
 	if (chip_id == 0x55) {
-		gpd_ecram_read(0x1060, &chip_ver);
-		gpd_ecram_write(0x1060, chip_ver | 0x80);
+		gpd_ecram_read(drvdata, 0x1060, &chip_ver);
+		gpd_ecram_write(drvdata, 0x1060, chip_ver | 0x80);
 	}
 }
 
-static void gpd_init_ec(void)
+static void gpd_init_ec(struct gpd_fan_data *data)
 {
 	// The buggy firmware won't initialize EC properly on boot.
 	// Before its initialization, reading RPM will always return 0,
 	// and writing PWM will have no effect.
 	// Initialize it manually on driver load.
-	if (gpd_driver_priv.drvdata->board == win4_6800u)
-		gpd_win4_init_ec();
+	if (data->drvdata->board == win4_6800u)
+		gpd_win4_init_ec(data);
 }
 
 static int gpd_fan_probe(struct platform_device *pdev)
@@ -611,7 +614,9 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const struct resource *region;
 	const struct resource *res;
-	const struct device *hwdev;
+	struct device *hwdev;
+	struct gpd_fan_data *data;
+	const struct gpd_fan_drvdata *match;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
@@ -624,24 +629,42 @@ static int gpd_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EBUSY,
 				     "Failed to request region\n");
 
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	match = dev_get_platdata(dev);
+	if (!match)
+		return -EINVAL;
+
+	data->drvdata = match;
+	data->pwm_enable = AUTOMATIC;
+	data->pwm_value = 255;
+
+	dev_set_drvdata(dev, data);
+
 	hwdev = devm_hwmon_device_register_with_info(dev,
 						     DRIVER_NAME,
-						     NULL,
+						     data,
 						     &gpd_fan_chip_info,
 						     NULL);
 	if (IS_ERR(hwdev))
 		return dev_err_probe(dev, PTR_ERR(hwdev),
 				     "Failed to register hwmon device\n");
 
-	gpd_init_ec();
+	gpd_init_ec(data);
 
 	return 0;
 }
 
-static void gpd_fan_remove(__always_unused struct platform_device *pdev)
+static void gpd_fan_remove(struct platform_device *pdev)
 {
-	gpd_driver_priv.pwm_enable = AUTOMATIC;
-	gpd_set_pwm_enable(AUTOMATIC);
+	struct gpd_fan_data *data = dev_get_drvdata(&pdev->dev);
+
+	if (data) {
+		data->pwm_enable = AUTOMATIC;
+		gpd_set_pwm_enable(data, AUTOMATIC);
+	}
 }
 
 static struct platform_driver gpd_fan_driver = {
@@ -668,6 +691,7 @@ static int __init gpd_fan_init(void)
 	if (!match) {
 		const struct dmi_system_id *dmi_match =
 			dmi_first_match(dmi_table);
+
 		if (dmi_match)
 			match = dmi_match->driver_data;
 	}
@@ -675,10 +699,6 @@ static int __init gpd_fan_init(void)
 	if (!match)
 		return -ENODEV;
 
-	gpd_driver_priv.pwm_enable = AUTOMATIC;
-	gpd_driver_priv.pwm_value = 255;
-	gpd_driver_priv.drvdata = match;
-
 	struct resource gpd_fan_resources[] = {
 		{
 			.start = match->addr_port,
@@ -690,7 +710,8 @@ static int __init gpd_fan_init(void)
 	gpd_fan_platform_device = platform_create_bundle(&gpd_fan_driver,
 							 gpd_fan_probe,
 							 gpd_fan_resources,
-							 1, NULL, 0);
+							 1,
+							 match, sizeof(*match));
 
 	if (IS_ERR(gpd_fan_platform_device)) {
 		pr_warn("Failed to create platform device\n");
-- 
2.25.1

