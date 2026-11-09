Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231389;
	b=rYRc0ZtRNXKJ8+9mPjbHJnWxDyKWXkXG35LB+d1o5Qh2tuNdR3UiI2Lpr98/JGb1gARB
	 8nA08enw8cZ1Tku7pv2xPocYiDSfCXH6wFwvsCJYRqH5NAvTW5Lf9GoA1HgAjuXf6Sgwn
	 +IIptGF1RUaoMhqsfxzcrTSl6gs2CAAfPrK+d51zVbYCj27qFoZXJWV/lf2YK63APCt+0
	 X3o6/H6SiEwrqOwxmdEsHI6/YwCbu7knArVXkAFn2L5klcTrWu3q24W9bx15IdDatbyqx
	 LqcDbQ7M3OLh/mpI/DNC5JmoR2uqYDg5OhyTdYRMyl7+QI9tOUhjuI7w62EzW8ZahWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ArFSG1MfNYwGmj6epQAS9P5R+vfkTG0tqXWEL/txXy8=;
	b=WoS4UHoi8O/ucYkW34lN+AMnkupjNMCk4PySXXIbBWDvtkhRkTl7ha71Vs5C+l/7/CWd
	 8oB+4HFQYZQEynVNtuAZcstAbF53QWquMLCPsnaxzrtIF2osXzMYjdGz2ZOXMJXg5xBnm
	 iGeAF1JlFLfsqqTsn56RbzuiGWbSuKc0grVA8o/pqfmPm7eklbmBusedVdtd9Jl90Od+2
	 4deXff7CK75ymtgXJWpRaqNdaqd3dRzVyEKVL3wii3R9BVwFjuqkb7P7IyQB7G2VLDhm3
	 NwncP7iuYDUYiJq5f/uOj4VwZGlGT87GMeTuTwPssFE6l7N/BXqzfltBEppe2ZkMQ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=t3exiP57;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586EE608360D
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 586EE608360D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=t3exiP57
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so10334035e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 05:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231388; x=1794836188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArFSG1MfNYwGmj6epQAS9P5R+vfkTG0tqXWEL/txXy8=;
        b=t3exiP57Nff18+XExEA/0sVY+xAbxtHZClPzXauLVdxnJuj+7BGZ3YCoJDFOfk3b8a
         X37oAc7L5BtFEMtUT7yiAUI18UPmdXK/vEf4Y4VVfIRz6DNJULdQ/c7ZZo+nH5hbfMrj
         k9RcGKMfwmuTsYdQu3T0puM4B9rwD4kUDZ9wapk13orglsWJaUGl6bD+F4NB0UZCI6eG
         0Xo49dBhsuuuPp8BrcDVPRnUbjQkYyXAj93jc7b+Y6nfA54YEhQIusIiUf9jM3I1qaP1
         8rOYF8zhTffVkPkxVF/F/1nTnnHk8ToT15JUa+0bny+AR5lWdEXJU3evWeIxIK84NEfK
         2DIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231388; x=1794836188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArFSG1MfNYwGmj6epQAS9P5R+vfkTG0tqXWEL/txXy8=;
        b=KWdEAow9wT3lI7lulkB4ztvon8LiBmkn9C8olDZ+GlWAfi8F3KFju5X5fxdSTBEHSo
         6WSM70tVLdZvU8fviZ1jOFi0j/I6+eaDHVY+8p8tAwDjbNE9bZEE6vfaobJQQatYJN0y
         /vP22x5EiOCrbkRoB6JLkyiVBAM6KB06H+1kVm1kWZ0hvdtwyVLnAvBREJwu6Pf0y3O4
         kQiHVjvXhLbYRUUvTRJMMdOS6U0Y5ufq+hq4DQzD1XzystrPOHaki4NsmIRRHqwKdKp6
         b1Tl5u1Mh8KPn9boRP3EXxNlb4YpnbAj8b7NISM2T6alIUUu0mVR4Ah64NrPy6+eIx0S
         /UGg==
X-Forwarded-Encrypted: i=1; AL+hErFNuz8Q3lhTbHd/FIkR0ajSuHnESSPkm0HujEKVGL1GqwqhyyIFfX5ZEgXMIluqQx+XV1Ze0I6WFzBrKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+UDbkKmmUr+0sYFaCXp6p8R3zL24TTNUC/Q1j0UxRcIMsyJ+sF
	mx44vASIF8pQ+Y/j3WV/p/pGAlY7SUTM/DZW4yA1AvHNm+UpmOm7I0lLbQlLwPXo8d0=
X-Gm-Gg: AYBFou0ph/dOUzoKbH54Nk+rGFaIScuNsSv2q+lBG9l/CQ8AC0zie9swFgwbm/woZ9s
	LrfNicJgj05wSf6vKdj+hoYjvyBF6dOuahfaotIrt/vhB8M5iyUgzOEx213/VKHJtMuzJgJoHKt
	ygzD3KMq/rKpS+iA6tyGiiivEGYW/bqDPsMw0w+0YJA8R6PTCCfYdnNHm4J+sXRf78CvgHphoCP
	kKoq70379kJf+DI0cH3I8bGaIlYa/WTK+qiVxXzxA/olHj3kbpT2aUpYNJc2+qoghBaH+JhLLff
	PKePB2OSU30D4BfdCvGh4ZrL5JgZ/dnpG4qbznkKYqS93+wtaPpWTecD9/LQ7XI+keObsSw09vE
	d9puowK64MGXhF7iYTtU0WJ9AffIN2dRv0XreRjQSCb5ClNm/3KwgE/C6GGf9bu0DhXtjuInBqX
	7B0R7qyKpGLIZeccXosVQgP8NXDxjdUGjOUaYSVbTQY6EaNi3lgt3TD9Df5gMVpYWcJnL10s53y
	MWGiWxIsVi+US8GufshP74yqrTjrW65ApqwC5/hhDdb01cPrq4ewEa6quQOhYyuN7SPmMcGOvsc
	yMHy6LWhEVNUqVszsDfr0FalZc0eGimo5KhEKVjPGs6k/janUZ9yxNuqVM/rlIigfGfsPc7l1Yn
	eN+PgUL3V0fiShv0BadI1Df+W2vAWilEA9RUYo+L4wp9l8FgCqmTt0naMvRylSiwLDwngxPwjEL
	a0Qmc=
X-Received: by 2002:a05:600c:8705:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4b94d75ecbbmr79305425e9.2.1794231387807;
        Mon, 09 Nov 2026 05:36:27 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:25 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 3/6] hwmon: sparx5: add LAN969x fan monitoring support
Date: Mon,  9 Nov 2026 14:35:07 +0100
Message-ID: <20261109133609.810876-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x has a fan controller with a tachometer in a register block
separate from its Sparx5-compatible temperature sensor. Match the fan
node independently and expose fan1_input on its own hwmon device.

Read the optional pulses-per-revolution property from the fan child.
Preserve the temperature-only behavior of existing device trees.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Register fan and temperature monitoring as separate hwmon devices.
- Reject a present but malformed pulses-per-revolution property.

 Documentation/hwmon/sparx5-temp.rst |   9 ++
 drivers/hwmon/Kconfig               |   7 +-
 drivers/hwmon/sparx5-temp.c         | 146 ++++++++++++++++++++++++----
 3 files changed, 139 insertions(+), 23 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index 0140809089542..a053d12fbdbbb 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -15,6 +15,10 @@ Supported chips:
 
 Author: Lars Povlsen <lars.povlsen@microchip.com>
 
+The driver also supports the Microchip LAN969x temperature sensor and fan
+controller as separate devices. The fan controller uses the
+microchip,lan9691-fan compatible.
+
 Description
 -----------
 
@@ -30,4 +34,9 @@ The following attributes are supported.
 
 ======================= ========================================================
 temp1_input		Die temperature (in millidegree Celsius.)
+fan1_input              Fan speed in RPM (LAN969x only).
 ======================= ========================================================
+
+The tachometer counts pulses over one-second intervals, independently of the
+PWM output. The fan child's pulses-per-revolution property specifies how many
+pulses represent one revolution; it defaults to two.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3ae676a56d95c..deb9eb82b8501 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -669,11 +669,12 @@ config SENSORS_I5K_AMB
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
index 0fd5c147f8167..1f197004780cc 100644
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
+	bool is_fan;
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
@@ -82,62 +135,115 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
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
 }
 
-static const struct hwmon_channel_info * const s5_info[] = {
+static const struct hwmon_channel_info * const s5_temp_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	NULL
 };
 
+static const struct hwmon_channel_info * const s5_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	NULL
+};
+
 static const struct hwmon_ops s5_hwmon_ops = {
 	.is_visible = s5_is_visible,
 	.read = s5_read,
 };
 
-static const struct hwmon_chip_info s5_chip_info = {
+static const struct hwmon_chip_info s5_temp_chip_info = {
 	.ops = &s5_hwmon_ops,
-	.info = s5_info,
+	.info = s5_temp_info,
+};
+
+static const struct hwmon_chip_info s5_fan_chip_info = {
+	.ops = &s5_hwmon_ops,
+	.info = s5_fan_info,
 };
 
 static int s5_temp_probe(struct platform_device *pdev)
 {
+	const struct s5_match_data *match_data;
+	struct device *dev = &pdev->dev;
 	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
+	struct device_node *fan_np __free(device_node) = NULL;
+	void __iomem *base;
+	bool is_fan;
+	int ret;
 
-	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
+	match_data = device_get_match_data(dev);
+	is_fan = match_data && match_data->is_fan;
+
+	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return -ENOMEM;
 
-	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hwmon->base))
-		return PTR_ERR(hwmon->base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (is_fan) {
+		hwmon->fan = base;
+		hwmon->pulses_per_revolution = 2;
+		fan_np = of_get_available_child_by_name(dev->of_node, "fan");
+		if (fan_np &&
+		    of_property_present(fan_np, "pulses-per-revolution")) {
+			ret = of_property_read_u32(fan_np, "pulses-per-revolution",
+						   &hwmon->pulses_per_revolution);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "invalid pulses-per-revolution\n");
+		}
+		if (!hwmon->pulses_per_revolution ||
+		    hwmon->pulses_per_revolution > 4)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid pulses-per-revolution\n");
+	} else {
+		hwmon->base = base;
+	}
 
-	hwmon->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	hwmon->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(hwmon->clk))
 		return PTR_ERR(hwmon->clk);
+	hwmon->clk_rate = clk_get_rate(hwmon->clk);
 
-	s5_temp_enable(hwmon);
+	if (is_fan)
+		s5_fan_enable(hwmon);
+	else
+		s5_temp_enable(hwmon);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-							 "s5_temp",
-							 hwmon,
-							 &s5_chip_info,
-							 NULL);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+					is_fan ? "lan969x_fan" : "s5_temp", hwmon,
+					is_fan ? &s5_fan_chip_info :
+						 &s5_temp_chip_info, NULL);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+static const struct s5_match_data lan969x_fan_match_data = {
+	.is_fan = true,
+};
+
 static const struct of_device_id s5_temp_match[] = {
+	{
+		.compatible = "microchip,lan9691-fan",
+		.data = &lan969x_fan_match_data,
+	},
 	{ .compatible = "microchip,sparx5-temp" },
 	{},
 };
@@ -154,5 +260,5 @@ static struct platform_driver s5_temp_driver = {
 module_platform_driver(s5_temp_driver);
 
 MODULE_AUTHOR("Lars Povlsen <lars.povlsen@microchip.com>");
-MODULE_DESCRIPTION("Sparx5 SoC temperature sensor driver");
+MODULE_DESCRIPTION("Sparx5 SoC hardware monitoring driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

