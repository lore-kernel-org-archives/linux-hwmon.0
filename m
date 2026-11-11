Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413801;
	b=Zl9zZ+SBcRp+QYmn24O4h2NezIzrsV7kJMF5EWhKl4j4jVZCZqoGNZaRWfSEDGOIuhDG
	 n02f1OQsedewbHxI6pI2gQihuZHiemSV9rKuiQazg0TxiBmPjkIFl7T9lc2dtByTItL3H
	 wv0PxIZEzrvDGh8H5S7Yq369zgt/Au09r+K7bS1TLNIBz9ZzTgqRsyuICVrRsCJvyM5wN
	 9Ndg8uEAUoKjX/tstmT++dH8YOmyvidSmaeyYJlKBuLSPjlqUnlXwFaGRKV2YMvuIb6gl
	 5ERTzGZdG6sO0ELg8tUG+1YWLmAs3UdY4k0pSqzTPGyvNcu/+ICoKWcy46w+Jo87Qfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0C7+IJmij8E9fIklBb68lvmRctOkYSNRRgzk+FfCts0=;
	b=kZFuDjkUUC09J2ik8v77zxzkLZJKUFfXFv388XCIkMZSTtlkKo3dvS0liggd9FDYkMzy
	 SDTKSB1GCQtl7zBr0EVHi6fnTxiX8dEB5zmaavemOcRB6vgfmpX0sUYx7ZROSTQbIDN6N
	 cZF83oS17s7r3KeU6c+Ywv84GhqqoYMzw3L9WvtRAspcvF8n01NPzWcZ6U/m+Jw2LlCH7
	 nW0p5+Bjjycpft0HNSBMmTBNEblZ9wB25hBMM/zCIzymvWflo6GkFHdt4gwTXIL8/CG6P
	 7u88hQpl9+zeQlvLVETZq1Bx5SGyY/mHArfC+6OaQHttmUbHSoqHdDb0zg97QnnA6eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b="jwJ/k5oO";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3E8606A32E
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C3E8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=jwJ/k5oO
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so35107045e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413799; x=1795018599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C7+IJmij8E9fIklBb68lvmRctOkYSNRRgzk+FfCts0=;
        b=jwJ/k5oOpagM4rbp5N3pUd1Xs7q7h3mljJ/y5pX/kWr1hpsWJtVUvSUO7102Kg56km
         QE6/9a6xkUISamjk15akOYPWMbqqfegsixiOeQrjficUNdsUsn5N4SDKSum5uknUuCEF
         SK5Ax/f3GTrchb9IoMxvmdmrLJDhZkKRMclXPuRGKlHdT0vyF4f3al5WxRrFi7OKg3co
         b2O3j3w1uKPP43Ws8v6hOQMCNFwq9n6k86tmbfCH4lKtRsqUHCMdbGrVOxLw6Kl+9rUO
         dJpQ+EyIWAIJgtUxzUX9EsnwjywRoAs6FCxiXUsn9oEismm3NDdRLVCphQZNDqpIc7z8
         viww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413799; x=1795018599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0C7+IJmij8E9fIklBb68lvmRctOkYSNRRgzk+FfCts0=;
        b=18gv8BtvV5Ocxes2Y5mKN7ikEoX8XqeKFtFhueC5XXPMpPUzDIHa9GK67z7leS2wcQ
         ap8ioHYZ1vb8J2HyEMmZBoX0TcjqQYuBCkh12h4o7GKAoscusbTYpV7xVQSq/Yc1l6iR
         n/hb4SgkWAncAfXqVmbPQiUb8cyzAdCsmZHtNFx/01x5tsgS0v+nYk0NdUsNrbvOol1r
         d1Di8frhwvJK/2n5XxgvoNt12svoIioOjj8mK+jTqmXcErXzStsM7ne2LxEUgIU7RVVM
         4616GIjQRAq0/82vYh/kqsZWwtkDKlBv+ZZwVLjBQZSwhBCVTJ+ueTgyAynPh3a+Q9d4
         0R2w==
X-Forwarded-Encrypted: i=1; AL+hErEvdOUNo2bOKXiNA/dD765Dds98MCx/l8zywts/5a20SC0ns7zxbH9KTfzdO5yMsv2oGJ3QiLl9V/noqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vc6lKJEftxJ7A+DPp2nkdXVSg1ZGSlr0I1oAvPtuYmOumMQvD
	6vKYi7U5X5OuuyrwUZpET9VSlfA5vSJP2x7Y05uOCOvN+XL/EW+D7TEXSs4AcQnyxYk=
X-Gm-Gg: AYBFou07pN+/FYkZIwif6wspiKLo4aXj4NrNY41Y2wpv2jkFxe4hG+qb0clNp/Yu7sl
	+R8OIp07X3vUuUele0cBDH20iDrgPVtQSrFJAlyU2KwgSUas3MzVA5ATYwH9Woy1hmV7yVcijLG
	X68Xe/Rq7Qufsbw+JcG5dsH2A6cBkXmV0EyfD0DfwTzQWY7f3ppmkvu35aRt+NT1Wv/tJUWj3DD
	JZA/OxF5KVy6uDKjphp5IfaB30IMdlk645xQRB0JM9NM6aBDK3/8801Y0y5xhg8659EplvrMebK
	UZbrHMDc2jkNiwat8CykL3wViAL2IadvJoDIZFa/CjmcPZei5fUX4vc6m06w5WRU8/xk69g8gOn
	hlaUuWLFK8PpqrwOhgn2QUKYlt0N+VGXQGC6Vd6/n/uI/n1uPP9WRihkPLzWqWH90CWS6hthJI0
	Xbtt+GP2ROoqUMHrWp7dGJ0jliz6hC2ykBFKigpMVKzqNHVPZQ/dysNzuDEoWvb/zsBnmUpIkGI
	aUuETUhgFQibPcrEB5OdqvNLrQIr/vxzGGXAq+x5Abz9CkNDS7QJwTMYXqmX3eg3tqlvY2ZpqOA
	B/pBaSimgYnXJym+XEnjj9Ufk+5TBwm5+uRYmmq0iLhkzkoJVLedDeRekphmy/l8Tj7fvHVxw8K
	39zncCXFn14cNn4s6aBID98dw3yPc+VXhSzWPNBLrusjGlqg9ULr+6+ZOHzoeO2Vi1LWnmIImal
	Sm4cRGa5jcYTPEeqk9sN2lrwM=
X-Received: by 2002:a05:600c:4f81:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ba09377c5amr51388345e9.8.1794413798228;
        Wed, 11 Nov 2026 08:16:38 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:34 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 3/4] hwmon: Add Microchip LAN969x fan controller driver
Date: Wed, 11 Nov 2026 17:12:47 +0100
Message-ID: <20261111161619.232141-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
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

The LAN969x fan controller has its own register block, separate
from the Sparx5-compatible temperature sensor.

Add a dedicated hwmon driver for tachometer, PWM, and thermal cooling.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Use a standalone fan driver instead of extending sparx5-temp.
- Combine tachometer, PWM and thermal cooling support in one patch.
- Reject a zero-rate fan clock during probe.
- Add a dedicated MAINTAINERS entry.

Changes in v2:
- Register fan and temperature monitoring as separate hwmon devices.
- Reject a present but malformed pulses-per-revolution property.
- Drop the private mutex; hwmon serializes sysfs accesses.
- Preserve firmware PWM polarity when no fan child is present.
- Convert the DT period directly to a divider and reject invalid values
  before changing fan registers.
- Use hwmon_lock() for cooling callbacks instead of a private mutex.

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/lan969x-fan.rst |  53 ++++
 MAINTAINERS                         |   8 +
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/lan969x-fan.c         | 444 ++++++++++++++++++++++++++++
 6 files changed, 517 insertions(+)
 create mode 100644 Documentation/hwmon/lan969x-fan.rst
 create mode 100644 drivers/hwmon/lan969x-fan.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index a8ea421128b50..aa84893729fac 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -122,6 +122,7 @@ Hardware Monitoring Kernel Drivers
    kbatt
    kfan
    lan966x
+   lan969x-fan
    lattepanda-sigma-ec
    lineage-pem
    lm25066
diff --git a/Documentation/hwmon/lan969x-fan.rst b/Documentation/hwmon/lan969x-fan.rst
new file mode 100644
index 0000000000000..c79d8eadbc158
--- /dev/null
+++ b/Documentation/hwmon/lan969x-fan.rst
@@ -0,0 +1,53 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Microchip LAN969x fan controller
+================================
+
+Supported chips:
+
+  * Microchip LAN969x
+
+    Prefix: 'lan969x_fan'
+
+    Addresses scanned: -
+
+    Datasheet: https://microchip-ung.github.io/lan969x-industrial_reginfo/
+
+Description
+-----------
+
+The LAN969x fan controller provides a tachometer input and a PWM output.
+
+The tachometer counts pulses over one-second intervals, independently of the
+PWM output. The fan child's pulses-per-revolution property specifies how many
+pulses represent one revolution; it defaults to two.
+
+The fan child's pwms property selects the initial PWM period and polarity.
+The output is dedicated to this fan and is not available to external PWM
+consumers. The pwm1 value describes the logical duty cycle independently of
+the output polarity. Frequency requests are rounded to the nearest hardware
+divider value; requests outside the divider range are rejected. pwm1_freq
+reports the resulting frequency.
+
+Sysfs entries
+-------------
+
+======================= ========================================================
+fan1_input              Fan speed in RPM.
+pwm1                    PWM duty cycle, from 0 to 255.
+pwm1_freq               PWM frequency in Hz.
+======================= ========================================================
+
+Thermal cooling
+---------------
+
+With device-tree thermal support enabled, the fan can also act as a thermal
+cooling device. The fan child's cooling-levels property maps cooling states
+to PWM values from 0 to 255, in ascending order. When cooling levels are
+provided, the driver initially selects the highest level.
+
+Manual pwm1 writes remain available and update the reported cooling state
+to the highest state whose PWM value does not exceed the requested value,
+or state zero if the value is below the first level. Subsequent thermal
+cooling requests can override manual PWM settings. Each cooling request
+programs the exact PWM value associated with the requested state.
diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d37ddb..bc8af689ce9b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18369,6 +18369,14 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/microchip/sparx5/lan969x/*
 
+MICROCHIP LAN969X FAN CONTROLLER DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
+F:	Documentation/hwmon/lan969x-fan.rst
+F:	drivers/hwmon/lan969x-fan.c
+
 MICROCHIP LCDFB DRIVER
 M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 L:	linux-fbdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3ae676a56d95c..634e174eb4d8b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1060,6 +1060,16 @@ config SENSORS_LAN966X
 	  This driver can also be built as a module. If so, the module
 	  will be called lan966x-hwmon.
 
+config SENSORS_LAN969X_FAN
+	tristate "Microchip LAN969x fan controller"
+	depends on ARCH_LAN969X || COMPILE_TEST
+	help
+	  If you say yes here you get support for the fan controller on
+	  Microchip LAN969x SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called lan969x-fan.
+
 config SENSORS_LATTEPANDA_SIGMA_EC
 	tristate "LattePanda Sigma EC hardware monitoring"
 	depends on X86
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index be3eb0992a0d0..3d54ead07f0b4 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -122,6 +122,7 @@ obj-$(CONFIG_SENSORS_KB9002)	+= kb9002.o
 obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
 obj-$(CONFIG_SENSORS_KFAN)	+= kfan.o
 obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
+obj-$(CONFIG_SENSORS_LAN969X_FAN)	+= lan969x-fan.o
 obj-$(CONFIG_SENSORS_LATTEPANDA_SIGMA_EC) += lattepanda-sigma-ec.o
 obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
 obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
diff --git a/drivers/hwmon/lan969x-fan.c b/drivers/hwmon/lan969x-fan.c
new file mode 100644
index 0000000000000..fae0248658818
--- /dev/null
+++ b/drivers/hwmon/lan969x-fan.c
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Microchip LAN969x fan controller driver */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/thermal.h>
+
+#include <dt-bindings/pwm/pwm.h>
+
+#define FAN_CFG			0
+#define  FAN_CFG_DUTY_CYCLE	GENMASK(23, 16)
+#define  FAN_CFG_INV_POL		BIT(3)
+#define  FAN_CFG_GATE_ENA	BIT(2)
+#define  FAN_CFG_STAT_MODE	BIT(0)
+#define FAN_PWM_FREQ		4
+#define  FAN_PWM_FREQ_CYCLES	GENMASK(27, 16)
+#define  FAN_PWM_FREQ_DIV	GENMASK(15, 0)
+#define FAN_CNT			8
+#define  FAN_CNT_DATA		GENMASK(15, 0)
+
+#define FAN_TACH_INTERVAL_HZ	100000
+#define FAN_PWM_FREQ_SCALE	256
+
+struct lan969x_fan {
+	void __iomem *base;
+	struct clk *clk;
+	struct device *hwmon_dev;
+	unsigned long clk_rate;
+	u32 pulses_per_revolution;
+	u32 pwm_period;
+	bool pwm_inverted;
+	u32 *cooling_levels;
+	unsigned long cooling_state;
+	unsigned long max_cooling_state;
+};
+
+static void lan969x_fan_enable(struct lan969x_fan *fan)
+{
+	u32 cycles, val;
+
+	cycles = DIV_ROUND_CLOSEST(fan->clk_rate, FAN_TACH_INTERVAL_HZ);
+	cycles = clamp_val(cycles, 1, FIELD_MAX(FAN_PWM_FREQ_CYCLES));
+
+	val = readl(fan->base + FAN_PWM_FREQ);
+	val &= ~FAN_PWM_FREQ_CYCLES;
+	val |= FIELD_PREP(FAN_PWM_FREQ_CYCLES, cycles);
+	writel(val, fan->base + FAN_PWM_FREQ);
+
+	/* Count all tachometer pulses over one-second intervals. */
+	val = readl(fan->base + FAN_CFG);
+	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
+	if (fan->pwm_period) {
+		val &= ~FAN_CFG_INV_POL;
+		if (fan->pwm_inverted)
+			val |= FAN_CFG_INV_POL;
+	}
+	writel(val, fan->base + FAN_CFG);
+}
+
+static void lan969x_fan_update_cooling_state(struct lan969x_fan *fan, u32 pwm)
+{
+	unsigned long state;
+
+	if (!fan->cooling_levels)
+		return;
+
+	for (state = 0; state < fan->max_cooling_state; state++)
+		if (pwm < fan->cooling_levels[state + 1])
+			break;
+
+	fan->cooling_state = state;
+}
+
+static int lan969x_fan_read(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long *val)
+{
+	struct lan969x_fan *fan = dev_get_drvdata(dev);
+	unsigned long rate;
+	u32 data;
+
+	switch (type) {
+	case hwmon_fan:
+		if (attr != hwmon_fan_input)
+			break;
+		data = readl_relaxed(fan->base + FAN_CNT);
+		data = FIELD_GET(FAN_CNT_DATA, data);
+		*val = data * 60 / fan->pulses_per_revolution;
+		return 0;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			data = readl_relaxed(fan->base + FAN_CFG);
+			*val = FIELD_GET(FAN_CFG_DUTY_CYCLE, data);
+			return 0;
+		case hwmon_pwm_freq:
+			data = readl_relaxed(fan->base + FAN_PWM_FREQ);
+			data = FIELD_GET(FAN_PWM_FREQ_DIV, data);
+			if (!data)
+				return -ENODATA;
+
+			rate = DIV_ROUND_CLOSEST(fan->clk_rate,
+						 FAN_PWM_FREQ_SCALE);
+			*val = DIV_ROUND_CLOSEST(rate, data);
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static void lan969x_fan_set_pwm(struct lan969x_fan *fan, u32 pwm)
+{
+	u32 data;
+
+	data = readl_relaxed(fan->base + FAN_CFG);
+	data &= ~FAN_CFG_DUTY_CYCLE;
+	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, pwm);
+	writel_relaxed(data, fan->base + FAN_CFG);
+}
+
+static int lan969x_fan_write_pwm(struct lan969x_fan *fan, long val)
+{
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	lan969x_fan_set_pwm(fan, val);
+	lan969x_fan_update_cooling_state(fan, val);
+
+	return 0;
+}
+
+static void lan969x_fan_write_pwm_divider(struct lan969x_fan *fan, u32 divider)
+{
+	u32 data;
+
+	data = readl_relaxed(fan->base + FAN_PWM_FREQ);
+	data &= ~FAN_PWM_FREQ_DIV;
+	data |= FIELD_PREP(FAN_PWM_FREQ_DIV, divider);
+	writel_relaxed(data, fan->base + FAN_PWM_FREQ);
+}
+
+static int lan969x_fan_write_pwm_period(struct lan969x_fan *fan)
+{
+	unsigned long rate;
+	u64 divider;
+
+	rate = DIV_ROUND_CLOSEST(fan->clk_rate, FAN_PWM_FREQ_SCALE);
+	divider = DIV_ROUND_CLOSEST_ULL((u64)rate * fan->pwm_period,
+					NSEC_PER_SEC);
+	if (!divider || divider > FIELD_MAX(FAN_PWM_FREQ_DIV))
+		return -ERANGE;
+
+	lan969x_fan_write_pwm_divider(fan, divider);
+
+	return 0;
+}
+
+static int lan969x_fan_write_pwm_freq(struct lan969x_fan *fan, long val)
+{
+	unsigned long rate, divider;
+
+	if (val <= 0)
+		return -EINVAL;
+
+	rate = DIV_ROUND_CLOSEST(fan->clk_rate, FAN_PWM_FREQ_SCALE);
+	if (val < DIV_ROUND_CLOSEST(rate, FIELD_MAX(FAN_PWM_FREQ_DIV)) ||
+	    val > rate)
+		return -ERANGE;
+
+	divider = DIV_ROUND_CLOSEST(rate, val);
+	divider = min_t(unsigned long, divider, FIELD_MAX(FAN_PWM_FREQ_DIV));
+
+	lan969x_fan_write_pwm_divider(fan, divider);
+
+	return 0;
+}
+
+static int lan969x_fan_write(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long val)
+{
+	struct lan969x_fan *fan = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		return lan969x_fan_write_pwm(fan, val);
+	case hwmon_pwm_freq:
+		return lan969x_fan_write_pwm_freq(fan, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t lan969x_fan_is_visible(const void *_data,
+				      enum hwmon_sensor_types type,
+				      u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		return attr == hwmon_fan_input ? 0444 : 0;
+	case hwmon_pwm:
+		if (attr == hwmon_pwm_input || attr == hwmon_pwm_freq)
+			return 0644;
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_channel_info * const lan969x_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_FREQ),
+	NULL
+};
+
+static const struct hwmon_ops lan969x_fan_hwmon_ops = {
+	.is_visible = lan969x_fan_is_visible,
+	.read = lan969x_fan_read,
+	.write = lan969x_fan_write,
+};
+
+static const struct hwmon_chip_info lan969x_fan_chip_info = {
+	.ops = &lan969x_fan_hwmon_ops,
+	.info = lan969x_fan_info,
+};
+
+static int lan969x_fan_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					      unsigned long *state)
+{
+	struct lan969x_fan *fan = cdev->devdata;
+
+	*state = fan->max_cooling_state;
+
+	return 0;
+}
+
+static int lan969x_fan_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					      unsigned long *state)
+{
+	struct lan969x_fan *fan = cdev->devdata;
+
+	hwmon_lock(fan->hwmon_dev);
+	*state = fan->cooling_state;
+	hwmon_unlock(fan->hwmon_dev);
+
+	return 0;
+}
+
+static int lan969x_fan_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					      unsigned long state)
+{
+	struct lan969x_fan *fan = cdev->devdata;
+
+	if (state > fan->max_cooling_state)
+		return -EINVAL;
+
+	hwmon_lock(fan->hwmon_dev);
+	lan969x_fan_set_pwm(fan, fan->cooling_levels[state]);
+	fan->cooling_state = state;
+	hwmon_unlock(fan->hwmon_dev);
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops lan969x_fan_cooling_ops = {
+	.get_max_state = lan969x_fan_cooling_get_max_state,
+	.get_cur_state = lan969x_fan_cooling_get_cur_state,
+	.set_cur_state = lan969x_fan_cooling_set_cur_state,
+};
+
+static int lan969x_fan_get_cooling_data(struct device *dev,
+					struct device_node *fan_np,
+					struct lan969x_fan *fan)
+{
+	u32 *levels;
+	int count, i, ret;
+
+	if (!of_property_present(fan_np, "cooling-levels"))
+		return 0;
+
+	count = of_property_count_u32_elems(fan_np, "cooling-levels");
+	if (count <= 0)
+		return dev_err_probe(dev, count ? : -EINVAL,
+				     "invalid cooling-levels property\n");
+
+	levels = devm_kcalloc(dev, count, sizeof(*levels), GFP_KERNEL);
+	if (!levels)
+		return -ENOMEM;
+	fan->cooling_levels = levels;
+
+	ret = of_property_read_u32_array(fan_np, "cooling-levels",
+					 fan->cooling_levels, count);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read cooling-levels\n");
+
+	for (i = 0; i < count; i++) {
+		if (fan->cooling_levels[i] > 255)
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling level %d exceeds 255\n", i);
+		if (i && fan->cooling_levels[i] < fan->cooling_levels[i - 1])
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling levels must be ascending\n");
+	}
+
+	fan->max_cooling_state = count - 1;
+
+	return 0;
+}
+
+static int lan969x_fan_get_fan_data(struct device *dev,
+				    struct device_node *fan_np,
+				    struct lan969x_fan *fan)
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
+	fan->pwm_period = args.args[0];
+	fan->pwm_inverted = args.args[1] & PWM_POLARITY_INVERTED;
+	of_node_put(args.np);
+
+	if (of_property_present(fan_np, "pulses-per-revolution")) {
+		ret = of_property_read_u32(fan_np, "pulses-per-revolution",
+					   &fan->pulses_per_revolution);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "invalid pulses-per-revolution\n");
+	}
+	if (!fan->pulses_per_revolution || fan->pulses_per_revolution > 4)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid pulses-per-revolution\n");
+
+	return lan969x_fan_get_cooling_data(dev, fan_np, fan);
+}
+
+static int lan969x_fan_probe(struct platform_device *pdev)
+{
+	struct thermal_cooling_device *cdev;
+	struct device *dev = &pdev->dev;
+	struct lan969x_fan *fan;
+	struct device_node *fan_np __free(device_node) = NULL;
+	u32 initial_pwm;
+	int ret;
+
+	fan = devm_kzalloc(dev, sizeof(*fan), GFP_KERNEL);
+	if (!fan)
+		return -ENOMEM;
+
+	fan->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(fan->base))
+		return PTR_ERR(fan->base);
+
+	fan->pulses_per_revolution = 2;
+	fan_np = of_get_available_child_by_name(dev->of_node, "fan");
+	if (fan_np) {
+		ret = lan969x_fan_get_fan_data(dev, fan_np, fan);
+		if (ret)
+			return ret;
+	}
+
+	fan->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(fan->clk))
+		return PTR_ERR(fan->clk);
+	fan->clk_rate = clk_get_rate(fan->clk);
+	if (!fan->clk_rate)
+		return dev_err_probe(dev, -EINVAL, "invalid fan clock rate\n");
+
+	if (fan->pwm_period) {
+		ret = lan969x_fan_write_pwm_period(fan);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "invalid fan PWM period\n");
+	}
+	lan969x_fan_enable(fan);
+
+	if (fan->cooling_levels) {
+		initial_pwm = fan->cooling_levels[fan->max_cooling_state];
+		ret = lan969x_fan_write_pwm(fan, initial_pwm);
+		if (ret)
+			return ret;
+	}
+
+	fan->hwmon_dev = devm_hwmon_device_register_with_info(dev, "lan969x_fan",
+							 fan,
+							 &lan969x_fan_chip_info,
+							 NULL);
+	if (IS_ERR(fan->hwmon_dev))
+		return PTR_ERR(fan->hwmon_dev);
+
+	if (IS_ENABLED(CONFIG_THERMAL_OF) && fan->cooling_levels) {
+		cdev = devm_thermal_of_child_cooling_device_register(dev, fan_np,
+							     "lan969x-fan", fan,
+							     &lan969x_fan_cooling_ops);
+		if (IS_ERR(cdev))
+			return dev_err_probe(dev, PTR_ERR(cdev),
+					     "failed to register cooling device\n");
+	}
+
+	return 0;
+}
+
+static const struct of_device_id lan969x_fan_match[] = {
+	{ .compatible = "microchip,lan9691-fan" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, lan969x_fan_match);
+
+static struct platform_driver lan969x_fan_driver = {
+	.probe = lan969x_fan_probe,
+	.driver = {
+		.name = "lan969x-fan",
+		.of_match_table = lan969x_fan_match,
+	},
+};
+
+module_platform_driver(lan969x_fan_driver);
+
+MODULE_DESCRIPTION("Microchip LAN969x fan controller driver");
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_LICENSE("GPL");
-- 
2.56.0

