Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A84F4F7975
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896277; cv=none; b=ELQ2XnrJhGdTRBG6gZn7O1YC0VsV6479LWzLGoDbFcbtc0VIyb4S+rPe0NCIHOnjr2JqSJLN97j1EmCeMniyQfSdfqJSaCG3/vSALud/Fvsi+KXEj0uUl7kGPz0JlWuuLJEUoOaCjhBM7XYsODf1MN3mVzX6dFrkKkWArT/sFwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896277; c=relaxed/simple;
	bh=DHc0g/F3EUpG2x9KhyBTLKsKLa4+6ERGRdXRqP7TCP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qomSKNkaBikBEA4TRdgy2G7vIRyUs9kh6ZCtwb6IY4S+Pkq5ncVhi3/0ylyUMXo7AxLHLOf60zb7PiHNoSPtI9YkgY27qe5Ys9Hd4mKisjKlBpigP0sjm/KcezNMeb+uI0aJeeMJ21uKiC14YufeLsCkWKW7iJw0NJkGxXgWYgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=PnR/HATf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="PnR/HATf"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso410561166b.3
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 05:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896272; x=1792501072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kx/NaHtDqW/DqxLCYs2+7QWMT+PtyYPSsJHTFDdyCUA=;
        b=PnR/HATfRdGTAFHaGNiqKw5q6n74v04ma3Y9Pfhm0pVNJ5aFYt/Bfz8Ytt48k1yYDc
         lFvvMhbdkolUmUlq0GLF88LWw+uMF+snU1+mmqsdD58FwiXvvmkDNfK1guBiOPxJ3GeD
         9p5a2N/GsaIS60QijOcUZW7pM0C22+Uib8S1wOzMDg1mBVRygE5ep8MiCMPC1q3BmG4T
         xsca1F+EudO0WOWLRfbMpJ5+EJ7Pf5K8e6+THk3pqdKYY4Nk38U++Dd3SIyfeeD57CZm
         VcsfOD2EC+OmDa0DKFUMRZHyf37vI+Fin+NBKp8jce1NfBhiN6WhgyGYaXFxg78Pt3RI
         knYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896272; x=1792501072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kx/NaHtDqW/DqxLCYs2+7QWMT+PtyYPSsJHTFDdyCUA=;
        b=X5kWovYMYHF2mZcV8dL+st0v3PlBXzeJHRREM2os2n8e45KmcL1iDOkpbkmVoU6V8p
         IB7/Rr+B1Zj9mMsxCiOxAD7tCO4/CQOhlqlOiq5zXIcDWmH1MJzWmoP/4IDNd2hk1qP4
         CChi1mGRCJKYhWHDKhxa2rJzR3fMdxHD3CMFi9693rZVCA4I67XE/256LDd0SYwg+E2A
         3Tmjg0z4N7n6WnBEFS3Trx95JU/7UZYcKzNS6Rao+pKaU3uhKcJxZhT4AcDO13XWd5WH
         PzH5Mt638sNLO1K2lCR+1XW2zASehU3mSdICwsL/oGfH55iS9gc7iXi7JNIwiA1hOLhy
         3FjA==
X-Forwarded-Encrypted: i=1; AKwUvBzDFDfmnVl2KymI/Z2pLTtdDnO3TwdTwQlvMjwyggGY0fxBq3nXgcRob9oEYDc8qZgYSgxwLoPIPYw06g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJHfhrnCYij3yfXMx0MBI6wWdfs0oOMzSalK/XGhy16n6vH8m5/
	mRKJQRJKoZo3lgQkC6uimvKbVWfph+M0yfWgrFr+KDQkFiDGR13nPAldQF3UrTEoYsI=
X-Gm-Gg: AYBFou2oonp3wCpl6U+gZRnzIpbumPnYyngWj7YNMypR/sYHHzjmtFWjXZa266xYzqE
	r/6Uir5+LT+YJUn/qZsz6XJENojxEZOevhOdsc51Hkbc3HJtCzCWVbwIB+hrZ69JBdquUVvxpCJ
	rQasc6KKUAyiE5LDQq2KZ4be+6iWdCRjoQEibICv02QkCbqipoa2StkQt0200JKfHjJjbrb2HYS
	+9PRuujYDpJzI90SfKBlTCDgd00k3rDQnysCpQYmabe16f7nG/C1aTOf3mRrWDbLfyUSU5r43Xx
	sWIj/CuvF90Gwr1SlDTbwPpzWRMH0XCJhbAiDYIUieHPCff/6la6ZbTYyiLv6Chad1MZ6JH3uoe
	s1TRr+TZx9ODqW3sLaw1iwHuRa397eQO9MJB4NhAa7abxDOv+HEdouBB7If12pXqeM7F6xPOjQb
	bjb2t4FWMD8IZmOgnJD0wq9LWXT3giGqCMGOm6fYXMiyoXN3gooe/l8UK+ITr8MekOW2vNIgj3v
	dLWr9B7ArhkgrnafwkbMVSG6ndFk//2l2bJstqXGq+iLObCQ8E13w4FdyXqKTYO7M556lkZ/fFy
	OC1rzcvvzFCvV6OWAK6UeT2fZFWR7Hf9ksrOboVnBQ==
X-Received: by 2002:a17:907:c78b:b0:c37:c0dd:6642 with SMTP id a640c23a62f3a-c37c0dd6c88mr39677766b.37.1791896272427;
        Tue, 13 Oct 2026 05:57:52 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:51 -0700 (PDT)
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
Subject: [PATCH 4/6] hwmon: sparx5: add LAN969x PWM support
Date: Tue, 13 Oct 2026 14:56:28 +0200
Message-ID: <20261013125735.1542349-4-robert.marko@sartura.hr>
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

The LAN969x fan controller provides an 8-bit PWM output with a
programmable frequency and polarity.

Expose pwm1 and pwm1_freq, and serialize fan controller register access.
Parse the fan child node's standard PWM specifier and use its period and
polarity flags to configure the hardware.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/hwmon/sparx5-temp.rst |   9 ++
 drivers/hwmon/Kconfig               |   2 +-
 drivers/hwmon/sparx5-temp.c         | 183 ++++++++++++++++++++++++++--
 3 files changed, 184 insertions(+), 10 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index 1256d37e1c091..a1f8218e68794 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -34,8 +34,17 @@ The following attributes are supported.
 ======================= ========================================================
 temp1_input		Die temperature (in millidegree Celsius.)
 fan1_input              Fan speed in RPM (LAN969x only).
+pwm1                    PWM duty cycle, from 0 to 255 (LAN969x only).
+pwm1_freq               PWM frequency in Hz (LAN969x only).
 ======================= ========================================================
 
 The tachometer counts pulses over one-second intervals, independently of the
 PWM output. The fan child's pulses-per-revolution property specifies how many
 pulses represent one revolution; it defaults to two.
+
+On LAN969x, the fan child's pwms property selects the initial PWM period and
+polarity. The output is dedicated to this fan and is not available to external
+PWM consumers. The pwm1 value describes the logical duty cycle independently
+of the output polarity. Frequency requests are rounded to the nearest
+hardware divider value; requests outside the divider range are rejected.
+pwm1_freq reports the resulting frequency.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 01ac166380905..e0cd6195d5b45 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -653,7 +653,7 @@ config SENSORS_SPARX5
 	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  If you say yes here you get support for temperature monitoring on
-	  Microchip Sparx5 and LAN969x SoCs, as well as fan monitoring on
+	  Microchip Sparx5 and LAN969x SoCs, as well as the fan controller on
 	  LAN969x SoCs.
 
 	  This driver can also be built as a module. If so, the module
diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index 922c3c33a049a..5130140e1b579 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -11,10 +11,13 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
+#include <dt-bindings/pwm/pwm.h>
+
 #define TEMP_CTRL		0
 #define TEMP_CFG		4
 #define  TEMP_CFG_CYCLES	GENMASK(24, 15)
@@ -24,14 +27,18 @@
 #define  TEMP_STAT_TEMP		GENMASK(11, 0)
 
 #define FAN_CFG			0
+#define  FAN_CFG_DUTY_CYCLE	GENMASK(23, 16)
+#define  FAN_CFG_INV_POL	BIT(3)
 #define  FAN_CFG_GATE_ENA	BIT(2)
 #define  FAN_CFG_STAT_MODE	BIT(0)
 #define FAN_PWM_FREQ		4
 #define  FAN_PWM_FREQ_CYCLES	GENMASK(27, 16)
+#define  FAN_PWM_FREQ_DIV	GENMASK(15, 0)
 #define FAN_CNT			8
 #define  FAN_CNT_DATA		GENMASK(15, 0)
 
 #define FAN_TACH_INTERVAL_HZ	100000
+#define FAN_PWM_FREQ_SCALE	256
 
 struct s5_match_data {
 	bool has_fan;
@@ -41,8 +48,11 @@ struct s5_hwmon {
 	void __iomem *base;
 	void __iomem *fan;
 	struct clk *clk;
+	struct mutex lock; /* protects fan controller state and registers */
 	unsigned long clk_rate;
 	u32 pulses_per_revolution;
+	u32 pwm_frequency;
+	bool pwm_inverted;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -71,7 +81,9 @@ static void s5_fan_enable(struct s5_hwmon *hwmon)
 
 	/* Count all tachometer pulses over one-second intervals. */
 	val = readl(hwmon->fan + FAN_CFG);
-	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
+	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA | FAN_CFG_INV_POL);
+	if (hwmon->pwm_inverted)
+		val |= FAN_CFG_INV_POL;
 	writel(val, hwmon->fan + FAN_CFG);
 }
 
@@ -111,6 +123,34 @@ static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static int s5_read_pwm(struct s5_hwmon *hwmon, long *val)
+{
+	u32 data;
+
+	mutex_lock(&hwmon->lock);
+	data = readl_relaxed(hwmon->fan + FAN_CFG);
+	mutex_unlock(&hwmon->lock);
+	*val = FIELD_GET(FAN_CFG_DUTY_CYCLE, data);
+
+	return 0;
+}
+
+static int s5_read_pwm_freq(struct s5_hwmon *hwmon, long *val)
+{
+	unsigned long rate;
+	u32 divider;
+
+	divider = readl_relaxed(hwmon->fan + FAN_PWM_FREQ);
+	divider = FIELD_GET(FAN_PWM_FREQ_DIV, divider);
+	if (!divider)
+		return -ENODATA;
+
+	rate = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_PWM_FREQ_SCALE);
+	*val = DIV_ROUND_CLOSEST(rate, divider);
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		   u32 attr, int channel, long *val)
 {
@@ -125,6 +165,18 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		if (attr == hwmon_fan_input && hwmon->fan)
 			return s5_read_fan(hwmon, val);
 		break;
+	case hwmon_pwm:
+		if (!hwmon->fan)
+			break;
+		switch (attr) {
+		case hwmon_pwm_input:
+			return s5_read_pwm(hwmon, val);
+		case hwmon_pwm_freq:
+			return s5_read_pwm_freq(hwmon, val);
+		default:
+			break;
+		}
+		break;
 	default:
 		break;
 	}
@@ -132,6 +184,69 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 	return -EOPNOTSUPP;
 }
 
+static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+{
+	u32 data;
+
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	mutex_lock(&hwmon->lock);
+
+	data = readl_relaxed(hwmon->fan + FAN_CFG);
+	data &= ~FAN_CFG_DUTY_CYCLE;
+	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, val);
+	writel_relaxed(data, hwmon->fan + FAN_CFG);
+
+	mutex_unlock(&hwmon->lock);
+
+	return 0;
+}
+
+static int s5_write_pwm_freq(struct s5_hwmon *hwmon, long val)
+{
+	unsigned long rate, divider;
+	u32 data;
+
+	if (val <= 0)
+		return -EINVAL;
+
+	rate = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_PWM_FREQ_SCALE);
+	if (val < DIV_ROUND_CLOSEST(rate, FIELD_MAX(FAN_PWM_FREQ_DIV)) ||
+	    val > rate)
+		return -ERANGE;
+
+	divider = DIV_ROUND_CLOSEST(rate, val);
+	divider = min_t(unsigned long, divider, FIELD_MAX(FAN_PWM_FREQ_DIV));
+
+	mutex_lock(&hwmon->lock);
+	data = readl_relaxed(hwmon->fan + FAN_PWM_FREQ);
+	data &= ~FAN_PWM_FREQ_DIV;
+	data |= FIELD_PREP(FAN_PWM_FREQ_DIV, divider);
+	writel_relaxed(data, hwmon->fan + FAN_PWM_FREQ);
+	mutex_unlock(&hwmon->lock);
+
+	return 0;
+}
+
+static int s5_write(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long val)
+{
+	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm || !hwmon->fan)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		return s5_write_pwm(hwmon, val);
+	case hwmon_pwm_freq:
+		return s5_write_pwm_freq(hwmon, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 			     u32 attr, int channel)
 {
@@ -144,6 +259,12 @@ static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 		if (hwmon->fan && attr == hwmon_fan_input)
 			return 0444;
 		return 0;
+	case hwmon_pwm:
+		if (!hwmon->fan)
+			return 0;
+		if (attr == hwmon_pwm_input || attr == hwmon_pwm_freq)
+			return 0644;
+		return 0;
 	default:
 		return 0;
 	}
@@ -153,12 +274,14 @@ static const struct hwmon_channel_info * const s5_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_FREQ),
 	NULL
 };
 
 static const struct hwmon_ops s5_hwmon_ops = {
 	.is_visible = s5_is_visible,
 	.read = s5_read,
+	.write = s5_write,
 };
 
 static const struct hwmon_chip_info s5_chip_info = {
@@ -166,6 +289,40 @@ static const struct hwmon_chip_info s5_chip_info = {
 	.info = s5_info,
 };
 
+static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
+			   struct s5_hwmon *hwmon)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	ret = of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0,
+					 &args);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse fan PWM\n");
+
+	if (args.np != dev->of_node || args.args_count != 2 || !args.args[0] ||
+	    args.args[1] & ~PWM_POLARITY_INVERTED) {
+		of_node_put(args.np);
+		return dev_err_probe(dev, -EINVAL, "invalid fan PWM specifier\n");
+	}
+
+	hwmon->pwm_frequency = DIV_ROUND_CLOSEST(NSEC_PER_SEC, args.args[0]);
+	hwmon->pwm_inverted = args.args[1] & PWM_POLARITY_INVERTED;
+	of_node_put(args.np);
+
+	if (!hwmon->pwm_frequency)
+		return dev_err_probe(dev, -EINVAL, "fan PWM period is too long\n");
+
+	of_property_read_u32(fan_np, "pulses-per-revolution",
+			     &hwmon->pulses_per_revolution);
+	if (!hwmon->pulses_per_revolution ||
+	    hwmon->pulses_per_revolution > 4)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid pulses-per-revolution\n");
+
+	return 0;
+}
+
 static int s5_temp_probe(struct platform_device *pdev)
 {
 	const struct s5_match_data *match_data;
@@ -173,12 +330,14 @@ static int s5_temp_probe(struct platform_device *pdev)
 	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
 	struct device_node *fan_np __free(device_node) = NULL;
+	int ret;
 
 	match_data = device_get_match_data(dev);
 
 	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return -ENOMEM;
+	mutex_init(&hwmon->lock);
 
 	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hwmon->base))
@@ -191,13 +350,11 @@ static int s5_temp_probe(struct platform_device *pdev)
 
 		hwmon->pulses_per_revolution = 2;
 		fan_np = of_get_available_child_by_name(dev->of_node, "fan");
-		if (fan_np)
-			of_property_read_u32(fan_np, "pulses-per-revolution",
-					     &hwmon->pulses_per_revolution);
-		if (!hwmon->pulses_per_revolution ||
-		    hwmon->pulses_per_revolution > 4)
-			return dev_err_probe(dev, -EINVAL,
-					     "invalid pulses-per-revolution\n");
+		if (fan_np) {
+			ret = s5_get_fan_data(dev, fan_np, hwmon);
+			if (ret)
+				return ret;
+		}
 	}
 
 	hwmon->clk = devm_clk_get_enabled(dev, NULL);
@@ -206,9 +363,17 @@ static int s5_temp_probe(struct platform_device *pdev)
 	hwmon->clk_rate = clk_get_rate(hwmon->clk);
 
 	s5_temp_enable(hwmon);
-	if (hwmon->fan)
+	if (hwmon->fan) {
 		s5_fan_enable(hwmon);
 
+		if (hwmon->pwm_frequency) {
+			ret = s5_write_pwm_freq(hwmon, hwmon->pwm_frequency);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "invalid fan PWM period\n");
+		}
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "s5_temp",
 							 hwmon,
 							 &s5_chip_info,
-- 
2.56.0

