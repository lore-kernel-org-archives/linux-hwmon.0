Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA984F5DF3
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896276; cv=none; b=neQbDS6gWF4MCCvFuxgBrJQ7Dp9qdG2zccU9sSfbvoH+GJjnt8o14cMcvH6u75oqVC8IHxjgADZ2UfAj0OFMG6W0KnHfg2PfOIUIp5q8MQf1+YOLY+XNt27Ia/S/r3f5zanZJ9cJ2fJ0cpcpGnqOaTWv1HeE9yP9eqJWRlC8nn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896276; c=relaxed/simple;
	bh=LKC1NuYLR9aO86h6ti96kyynrimHOImk73G7vHbkj0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dccoWsRudPD5uKYwAGtH1AtnT2jVa7TyhAM3iAUtucWMb9zoI6TIEwhOU/KSaNT4xoKRe9EmmMKl/hzscN3Q7hkOEVisZ6c7Yqa23Ylu5ZmaIRrUmx7L9qnN1XujFSr42wMmLOpYt/xjH4kVZDPxKp3wWGgNXbZ4SkBRPw11fjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=xht4ac3q; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="xht4ac3q"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c34bff61551so333621666b.2
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 05:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896271; x=1792501071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G00YG7FNX3IZ3pyrtpioSmQlRthZHGJ4uJgy/p0MtDE=;
        b=xht4ac3ql5onL/lGwKX6GXQZHzEyPxzCDnOJNZLjVOeBvdMP1vZlqvXVHOkNHoRHBB
         3BQAbPg59EHigueYScgGQw0VWiap3tYkqg58Tfd6MJFLZw1jmPid0uPuTyd+KeJvDZ9+
         aVgHtJ7WTsxrMC1gu2/hSCi0Syt/2y4OFBvxFQAYdPB2xvAlbk7nOI6mgX73GUyQRADs
         W5GB8OT9NHSLPviJ/fJsUiiIhIX3u88wTi3UfHDcAhz+eFlt93a2XOjrWGT8DpLbk1ZN
         YDy2iSYBUyt7hdC+pAeq9VH29PuOTPyv/s5lBTeZGO2MhCGtov18GlvXxvcGi5wSDobD
         Mlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896271; x=1792501071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G00YG7FNX3IZ3pyrtpioSmQlRthZHGJ4uJgy/p0MtDE=;
        b=UZLONJn/XTf5KcLZyEGXQ/YgnvojoKliQiC4yuoOU0BrUWGiliL8EOlVYoJAJ45iG+
         wjMgQRklguANj3vYOsI6BdJuNATs0aE4tHxuuOJS6iDQ5U4+ZIuzNLEks+zQm22CzcXr
         9iBONvh7/UfyA18sZIkQ8a8VzSdWzMK+50DILnOf45CrEb5d39qBZWcWrEDvhvDOFvLr
         18qvVLK8lPNyEDpXcskwa9VikbdbwcYwWx0Krmqt/Muiy+/EbCpQWYwpLchej3RVRXDE
         O2Ygn29CJ2Hui1W1OU63r9WxPd550tO94XySW2jld9/V3tuzUE9pKmfYz5Hs46Xram5p
         AyRA==
X-Forwarded-Encrypted: i=1; AKwUvBy7EHj8to6KYNUJIqdKeo84L0CjqWbs9VKKdo4HamuWhYu6T2StSg3Q9ZSMNUe+/DpE+JpXGsSiw07VlA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIY2FEwwSOG3oSRJsN5rbFlaSIwI0f9imk0nCUYXgg/SgvdL/GT
	96pinhx/yBLMHB0ZVaBQVRNSymeO4cbRyEnrz+ugdIPfhe9NzRMFShhvv6SnDwgCm+k=
X-Gm-Gg: AYBFou1ocM1i4mx9U5VTapqNqkbzsf9R3dOt+F4S7RwxP1Bk3qh4Vf5vd/jN5j3VmTW
	WeXexkvEzMlebw5HAbJDClX3cPQszA2oAYJBzcRfBsldi5WPibChY2ufZfKNx/Km2W1bp8uT02C
	6gyoJ2QipC5p+51Y2WBHusAq4j064v36hYv5McUeEy2El8rMWR6zD8LoggQv6Lkq4AaUfFP0Mbh
	UH6rdcspXRa6V5D1OM3hfhVk/T6Y3IJhZN4e3OKmHPwAKC1DTKF0S0qGz2+WIMmPcL0eLPE6mky
	RkcfCCFJ5MjdYHb2ZGZyWD9oVszAN33lBoKyu8o3PzO2Gkf08gCwxSUiHcA9+Jz/cV22i9MaQVJ
	hUZnwXn3MWDrC712RTMLp28i6zhQna+luiOSgwQv/ycduMVswOgw9wGcup77C/YcEWToMU3L1Nj
	p2K7R0BQNMQ58iiN1dtKopH4tIn73X/wHpRVlGO9GjBRUzuB2X96Ki6LGKhApVOgdO3UbzMoOuT
	zcUdZZKVgt00HCudhb6BLwNmGAlVQhvLqObWoniKOdxPe1r0BdSERG/ybLK4PYlb9q0WTMZUPWd
	rb0lYtvKg56J93dWXdhRV2vEQppvlW4=
X-Received: by 2002:a17:907:3eaa:b0:c2b:4142:2db1 with SMTP id a640c23a62f3a-c31aa0d82b6mr1330656966b.40.1791896271123;
        Tue, 13 Oct 2026 05:57:51 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:50 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/6] hwmon: sparx5: add LAN969x fan monitoring support
Date: Tue, 13 Oct 2026 14:56:27 +0200
Message-ID: <20261013125735.1542349-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x contains a tachometer input alongside its Sparx5-compatible
temperature sensor.

Use match data to map and initialize the additional fan controller
register region only for the LAN969x hardware-monitor compatible. Read
the optional pulses-per-revolution property from the fan child and expose
the measured speed through fan1_input.

Leave existing Sparx5 and LAN969x temperature-only device trees
unchanged.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/hwmon/sparx5-temp.rst |   8 +++
 drivers/hwmon/Kconfig               |   7 +-
 drivers/hwmon/sparx5-temp.c         | 108 +++++++++++++++++++++++++---
 3 files changed, 110 insertions(+), 13 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index 0140809089542..1256d37e1c091 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -15,6 +15,9 @@ Supported chips:
 
 Author: Lars Povlsen <lars.povlsen@microchip.com>
 
+The driver also supports the Microchip LAN969x temperature sensor and fan
+tachometer through the microchip,lan9691-hwmon compatible.
+
 Description
 -----------
 
@@ -30,4 +33,9 @@ The following attributes are supported.
 
 ======================= ========================================================
 temp1_input		Die temperature (in millidegree Celsius.)
+fan1_input              Fan speed in RPM (LAN969x only).
 ======================= ========================================================
+
+The tachometer counts pulses over one-second intervals, independently of the
+PWM output. The fan child's pulses-per-revolution property specifies how many
+pulses represent one revolution; it defaults to two.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a4756..01ac166380905 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -649,11 +649,12 @@ config SENSORS_I5K_AMB
 	  will be called i5k_amb.
 
 config SENSORS_SPARX5
-	tristate "Sparx5 SoC temperature sensor"
+	tristate "Sparx5 and LAN969x SoC hardware monitoring"
 	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
 	help
-	  If you say yes here you get support for temperature monitoring
-	  with the Microchip Sparx5 SoC.
+	  If you say yes here you get support for temperature monitoring on
+	  Microchip Sparx5 and LAN969x SoCs, as well as fan monitoring on
+	  LAN969x SoCs.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called sparx5-temp.
diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index 0fd5c147f8167..922c3c33a049a 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -9,8 +9,11 @@
 #include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define TEMP_CTRL		0
 #define TEMP_CFG		4
@@ -20,9 +23,26 @@
 #define  TEMP_STAT_VALID	BIT(12)
 #define  TEMP_STAT_TEMP		GENMASK(11, 0)
 
+#define FAN_CFG			0
+#define  FAN_CFG_GATE_ENA	BIT(2)
+#define  FAN_CFG_STAT_MODE	BIT(0)
+#define FAN_PWM_FREQ		4
+#define  FAN_PWM_FREQ_CYCLES	GENMASK(27, 16)
+#define FAN_CNT			8
+#define  FAN_CNT_DATA		GENMASK(15, 0)
+
+#define FAN_TACH_INTERVAL_HZ	100000
+
+struct s5_match_data {
+	bool has_fan;
+};
+
 struct s5_hwmon {
 	void __iomem *base;
+	void __iomem *fan;
 	struct clk *clk;
+	unsigned long clk_rate;
+	u32 pulses_per_revolution;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -37,6 +57,24 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static void s5_fan_enable(struct s5_hwmon *hwmon)
+{
+	u32 cycles, val;
+
+	cycles = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_TACH_INTERVAL_HZ);
+	cycles = clamp_val(cycles, 1, FIELD_MAX(FAN_PWM_FREQ_CYCLES));
+
+	val = readl(hwmon->fan + FAN_PWM_FREQ);
+	val &= ~FAN_PWM_FREQ_CYCLES;
+	val |= FIELD_PREP(FAN_PWM_FREQ_CYCLES, cycles);
+	writel(val, hwmon->fan + FAN_PWM_FREQ);
+
+	/* Count all tachometer pulses over one-second intervals. */
+	val = readl(hwmon->fan + FAN_CFG);
+	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
+	writel(val, hwmon->fan + FAN_CFG);
+}
+
 static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
 {
 	int value;
@@ -62,6 +100,17 @@ static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
 	return 0;
 }
 
+static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
+{
+	u32 count;
+
+	count = readl_relaxed(hwmon->fan + FAN_CNT);
+	count = FIELD_GET(FAN_CNT_DATA, count);
+	*val = count * 60 / hwmon->pulses_per_revolution;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		   u32 attr, int channel, long *val)
 {
@@ -72,6 +121,10 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		if (attr == hwmon_temp_input)
 			return s5_read_temp(hwmon, val);
 		break;
+	case hwmon_fan:
+		if (attr == hwmon_fan_input && hwmon->fan)
+			return s5_read_fan(hwmon, val);
+		break;
 	default:
 		break;
 	}
@@ -82,12 +135,15 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 			     u32 attr, int channel)
 {
-	if (type != hwmon_temp)
-		return 0;
+	const struct s5_hwmon *hwmon = _data;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		return 0444;
+	switch (type) {
+	case hwmon_temp:
+		return attr == hwmon_temp_input ? 0444 : 0;
+	case hwmon_fan:
+		if (hwmon->fan && attr == hwmon_fan_input)
+			return 0444;
+		return 0;
 	default:
 		return 0;
 	}
@@ -96,6 +152,7 @@ static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 static const struct hwmon_channel_info * const s5_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
 	NULL
 };
 
@@ -111,10 +168,15 @@ static const struct hwmon_chip_info s5_chip_info = {
 
 static int s5_temp_probe(struct platform_device *pdev)
 {
+	const struct s5_match_data *match_data;
+	struct device *dev = &pdev->dev;
 	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
+	struct device_node *fan_np __free(device_node) = NULL;
 
-	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
+	match_data = device_get_match_data(dev);
+
+	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return -ENOMEM;
 
@@ -122,14 +184,32 @@ static int s5_temp_probe(struct platform_device *pdev)
 	if (IS_ERR(hwmon->base))
 		return PTR_ERR(hwmon->base);
 
-	hwmon->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (match_data && match_data->has_fan) {
+		hwmon->fan = devm_platform_ioremap_resource_byname(pdev, "fan");
+		if (IS_ERR(hwmon->fan))
+			return PTR_ERR(hwmon->fan);
+
+		hwmon->pulses_per_revolution = 2;
+		fan_np = of_get_available_child_by_name(dev->of_node, "fan");
+		if (fan_np)
+			of_property_read_u32(fan_np, "pulses-per-revolution",
+					     &hwmon->pulses_per_revolution);
+		if (!hwmon->pulses_per_revolution ||
+		    hwmon->pulses_per_revolution > 4)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid pulses-per-revolution\n");
+	}
+
+	hwmon->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(hwmon->clk))
 		return PTR_ERR(hwmon->clk);
+	hwmon->clk_rate = clk_get_rate(hwmon->clk);
 
 	s5_temp_enable(hwmon);
+	if (hwmon->fan)
+		s5_fan_enable(hwmon);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-							 "s5_temp",
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "s5_temp",
 							 hwmon,
 							 &s5_chip_info,
 							 NULL);
@@ -137,7 +217,15 @@ static int s5_temp_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+static const struct s5_match_data lan969x_match_data = {
+	.has_fan = true,
+};
+
 static const struct of_device_id s5_temp_match[] = {
+	{
+		.compatible = "microchip,lan9691-hwmon",
+		.data = &lan969x_match_data,
+	},
 	{ .compatible = "microchip,sparx5-temp" },
 	{},
 };
@@ -154,5 +242,5 @@ static struct platform_driver s5_temp_driver = {
 module_platform_driver(s5_temp_driver);
 
 MODULE_AUTHOR("Lars Povlsen <lars.povlsen@microchip.com>");
-MODULE_DESCRIPTION("Sparx5 SoC temperature sensor driver");
+MODULE_DESCRIPTION("Sparx5 SoC hardware monitoring driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

