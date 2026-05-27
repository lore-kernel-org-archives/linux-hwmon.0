Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9C23D16FD;
	Wed, 27 May 2026 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869585; cv=none; b=hvn+qz5+TTgQPERDLS2ovtmXQESi9Fyv93fL6I3MOrkWL96UjLI9k4iU4MiyAw7eDd3+6Kc8jsUeImq+cfqYYlh+4qqXK3s1fMhqmWrbX5g4S+DjkXmgHUZQMkzwnqR8JjRCKuEGlhqx9r2EJ4SIiwzmkdm16L5ZjiNV24n8Mo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869585; c=relaxed/simple;
	bh=94PjWL+reArZmvriCLwdjtv0h7kjmntzdIzRbZGdYDU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=EvU5kUzktaSoNKfH655OtiIdMqVhiubGCHFHDaAWFwBFmiROqfK5zR2S5GX2khru9I4b8NAmOlc5zPHY4JU2dLSaBHPcwCelexIX6PhPI2UjdKWMNY6oZKm8UIEQ/dFgVYxM8nwxnh774Zkx6XwwMMVzoT1PL1aYA7Ur9jkz89k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=i9Sdw+Yv; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="i9Sdw+Yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779869580;
	bh=g9A1ZIUGJw7AHQATuPfmxIOUa0Vlk9vhzJBEFASTYXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i9Sdw+YvsDFqund/kFJfebakxo+tYDsk0T8N9Q2Wk+SzYkDq79hqMT+GRvdy24Bmk
	 ki8J8yeMgAus0XYZedPlFBuZLCr7eNj2DTmQ3/xsyqBbS7uxDNHSXfrjQbx3In+8T3
	 HoUIVnfutR/CRu1NAVoeX/MPoJnGUltY4KGP0iiI=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 339BD2B7; Wed, 27 May 2026 16:12:57 +0800
X-QQ-mid: xmsmtpt1779869578t943nk9ps
Message-ID: <tencent_E54E78E6CA5D212364B95FA8BC2061BD3009@qq.com>
X-QQ-XMAILINFO: OYfs7Sg8y+Cvwp0Uh+R13f73N9y0My19I3bhqpjURKRejjAzMeSDM5kuaITjsd
	 D8dZ54Sk0o2Ubg8yBJLWD7CFM1G4KX6FMm+BEuQ96hPegqakKi877LWtGKfmJY65TiynhOaEgT3d
	 oRZd6kbm/ydLqt5Vhe5hBbCIvTxH8ifORebHnfptiv90UwLhuHWv/qX0+o8ATXJmIe80ThmaSJgW
	 ynfWc1TiW1RzFEfYGlSrxu/fR5zBIhFHmWp8qy2h9/viLzeOKLNfZXSLkU1GvBGE/ppT+0FzCAW4
	 ICMjXQCQmSewE6cTzsFqd9bfifPGT8DvcypUXXRgjj5Dvkx5SOG7b2Tt+ufD3Gb8lVR6PoZSlKCq
	 8LEUS4FEIdZaYIDSSfn93TyooBlj/nCF7vopKYP/Hs+FoC2ok9GRfidsCuPxISkFlVei6ICaH5fB
	 xYFi+Bv/Ubyrn2qNK4f61W5UM9w8EAIsDLUPh/ZYHvBGpgtKgiAKk+a2DTyAQ/fL+AiGduxaHE6y
	 u8iSKp6UOKCCkFvORXuU1RyUVX39wN+lqTuHoETWghwfRKPy4X479xFBqC/QJPnCfvpGV0XT7xG/
	 XPhtPfAc/u9oS6iUeKbKyIBVPTp+NBDDdBX2C5tfWUkQ0/ig02omzrw+cor1hTT3t99tIx+F4aSf
	 3LB7Q9X40bkFzEp+5vxFbvJLmv2xkULLO6xGfI8Dm/wm5T7uTD0XFHnxeDMXzgfGIqOzDZ2bV95X
	 Z/EG3HdnncHD2nNbMtUPTfmftccIat4YlHJkLpcg/ubOo5BnKNvti55HiTDk+hT3OxA6OMiUxojo
	 sMmTWl1owIpb1PzxugIVjDOvMxEoBWRVm1+8RzVMCivJrla57fhs4ETY+NTP+V9Q1TYm7x4oZhOD
	 /YwxsH5BN1BSpqc0iab++YR7TpWUOJTQLe3Pue9ImtCK24HqsJ3IitnllrK+sM8wjVO11YFppwGt
	 g9Dia7NxLOjL3XJ1gLX/NbxiO5wyse7ayhf+2t0UPkJni0qhClfi2eKDx1skOxpIrvxqtOHxyriA
	 BLSMkuzQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 1/3] hwmon: (gpd-fan): drop global driver data and use per-device allocation
Date: Wed, 27 May 2026 16:10:54 +0800
X-OQ-MSGID: <30b7d47e26389bd5e1d64e8835df8e75b8d10f91.1779868768.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779868768.git.xiaopei01@kylinos.cn>
References: <cover.1779868768.git.xiaopei01@kylinos.cn>
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
changs in v2: 
1.move gpd_init_ec before register hwmon device
2.platform_create_bundle pass a driver_data  pointer to
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

