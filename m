Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDC435C184;
	Sun,  5 Apr 2026 08:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775378439; cv=none; b=N/szSAx0Dqvmc0P9AnG9hfmEMDsmnDeKqCzJRaYS9sOp6xu+SwETRHX+cT7IvGJyCPr4YeadhG5D6zFKwp8oBF62KvYZclqRpX/bOEoyAWqvNXvbhC6XAu78FQyVZGdG51i8Otmd9w/oROrK4z37U6ThTMbExV7AtVJNMRl3IPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775378439; c=relaxed/simple;
	bh=LfuHsYjfnq+hxcRlZAtpMp3NbsfwQjcKyi4IHRE9Vfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q5UueN8FWhr3JvrSW/aKe5vsfbc1AfYRLoAZdCabP+tZ4ajfL/D6RWGphBlNb0Ob/+0BowVsdEVjQlPoxD2gCqDBxNu+ESw2lADI5zLf8tfgZz/jGKuBvnWUIndck2RrMHxYqC1TYFFnsPRB/rOsvXBnEzelL5TzyNq7bsBsq3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 157b4c6630cb11f1aa26b74ffac11d73-20260405
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d774e2f5-83ea-4d1b-9ccd-23afe017b6e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:2f613d850e09bc1394558676d112d20f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 157b4c6630cb11f1aa26b74ffac11d73-20260405
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 327466018; Sun, 05 Apr 2026 16:40:22 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 1/3] hwmon: (gpd-fan): remove global variable gpd_driver_priv
Date: Sun,  5 Apr 2026 16:40:16 +0800
Message-Id: <8b19b6bd73d0f9659d41cbeec6fcdfd4ddf59035.1775378028.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1775378028.git.xiaopei01@kylinos.cn>
References: <cover.1775378028.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the global state gpd_driver_priv with per-device private data
(struct gpd_fan_data) allocated in probe. This allows the driver to
support multiple instances in the future and aligns with kernel best
practices.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hwmon/gpd-fan.c | 211 ++++++++++++++++++++++------------------
 1 file changed, 116 insertions(+), 95 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 80de5f20781e..5a9d07cd29ab 100644
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
+	const struct gpd_fan_drvdata **match_ptr;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
@@ -624,24 +629,42 @@ static int gpd_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EBUSY,
 				     "Failed to request region\n");
 
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	match_ptr = dev_get_platdata(dev);
+	if (!match_ptr)
+		return -EINVAL;
+	data->drvdata = *match_ptr;
+
+	data->pwm_enable = AUTOMATIC;
+	data->pwm_value = 255;
+
+	dev_set_drvdata(dev, data);
+
+	gpd_init_ec(data);
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
-
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
+							 &match, sizeof(match));
 
 	if (IS_ERR(gpd_fan_platform_device)) {
 		pr_warn("Failed to create platform device\n");
-- 
2.25.1

