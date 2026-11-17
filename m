Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794959143;
	b=oYkMj3IgtIg2jCC0gv9M5h4Exlylt+OhMiTUotBTxYwVxsRL+f08L6JNor3DsoHVQGwB
	 huPqrFatXe3wY6xDGfrWnHRvXaO2aJ020yUrpON50aCqXpydyh/0Vpa86vyQFu2o7YYNW
	 PJmIoicSUXPDn0WWjox3PlF1ezU0JlHSnoXkFlAnvWDd0fVFmOuyQ+0wjxiezVHCd6Psd
	 zmulv3KQPQW2C3+CfCUyhxsfxlxF1sDgJhEMT9Vxt4uYYmW8B43V4WDlCRQrhOLqUYbVI
	 eeZ+UqDWBZM3ubD3lmPqbmOCJF/vVWKWiFKiCaFsq1BzhdbNjFY+TBI+6/yBPd17OCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959143;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WwhWdcf8P0UM/rKujNPuh8WXqHvXQGJw9J4wuJNabKw=;
	b=SNF4Z6SElkmKtEV3QwpHD3tFxidmKPaN7KjFsOp0MpClQ3d4DcOM7eemknQy0QuMn+3w
	 HxKDE+hLYXpt4PohwAsbAVyahx6CTSYZ41d56+gcQCgMZjiF4Wqa/fGKRVGdPZUz/Gw0H
	 O1wJqNeCOHHgRa2LqJRcOBs3H31JlbALyRgtSbOiLvh27lzBUg6kyUglQqwsTcWVIzE2e
	 pBqbVCvTwnvLmogEmnq8tJPtKQbHeCZKLku2g6nkKQg/rgW5SGUn01bIGBm8bLJzDxVZ5
	 ugfVkpaP4td3sukJwfD4YhICXD9nl48Tp4+PJkLrw9iwGGTVLQG3d5lI5b+QzRc6bBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AciWL0rL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74304606A334;
	Tue, 17 Nov 2026 23:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AciWL0rL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794959143;
	b=KIM/0MnFhHCuQp4fSux3KPnjkz64x3Y+S6ZJgm7e8+eZ9kuPEPDBlNP82B6fftg+aLsN
	 CTiQOwNYa8mjCNoTKWMorJn/Uk61MbrM5YZUn1auI+SJJVTgeSCGivlNAaiGfHe4xbx4P
	 idCiSReZPl5pDr7EwuzLpFH+ak+8oUUsXE4wq3aHQhkXZrWEyk6dAj3HaAHPiPf2wVGR7
	 l6ZDdV24rP/G6XqS0E4z1k/1VPwjuIFqfZ5mN+8m2mP9U+aeJCVXs5l9G6WdvbowM3jDG
	 717UV8r4t9mj43Bs+Zci493lBNMZCIDyd73LmLQ98zLYrK8BeMH47aYxL6IQApkBbCA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794959143;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WwhWdcf8P0UM/rKujNPuh8WXqHvXQGJw9J4wuJNabKw=;
	b=pnW5Z/Oj/3exbFxiB50tTilW1kD2F88Zv1MwCJeqks3jbba6k7POc1kSDE5b8AMWm57b
	 wMT1tlrqaN2JtGxwXQOjPT7tBvnwqGvkJkUjPelhIcIWbXYHk1shbBaZS+w0uiCg28O9K
	 Hs0wUllyReM879XXf94APRFZMP5Czn/a5UvajAGe8EjxmEJG/0L2HNleW24PkTw7embYG
	 fQAZW4kZ7YisoKKInJ6RvINdTwouNEzjvaPfgE+wmmE1FhIMMeEWAOcCuXWHIRV92oHMT
	 LSYvf347+C+pRNBwFHxwXbu3tyB07mcpPLuYRrKWXBK8BR72QsSI9LNINhS+6jeHyDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 023511F000C6;
	Tue, 17 Nov 2026 23:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959143;
	bh=WwhWdcf8P0UM/rKujNPuh8WXqHvXQGJw9J4wuJNabKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AciWL0rLVqkW/GNIwICXqulEmGCGTz7EvIwpbBtqybdkS/lyUkNI+sGgQ0ATl1gn1
	 uc0zuz1/0aLYIckQ0E7EQUaigmf0NOQuFWXhlDRDtMvCkOlqlsqkPVTtahJrdyIsGl
	 ufsF61wf4kV/wRMdFKAYrJLTgKRB3hI9M8D3hn5Ycp6Co4vQ9v5wrnEX5G0lw5oFN/
	 tdlbbbkIC0JtjT6dMSBjEuq6YyHYlsW7hpm5ulKTZ4jv8ZguGhDDLERXGWIk9gYROV
	 6a16iW88pzvpvAeNPZk1ht1ddqrG1tPfIxuRIdphYQxvlWjGLB1PMGMPRvhFNMX9M4
	 PKfsk7t6LRcDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7EAE54AB5E;
	Tue, 17 Nov 2026 23:45:41 +0000 (UTC)
From: Luna Hart via B4 Relay <devnull+lhart.opensource.witekio.com@kernel.org>
Date: Tue, 17 Nov 2026 15:45:36 -0800
Subject: [PATCH v2 2/2] hwmon: (tps38900x) Add driver for TI
 TPS389006/TPS389008
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-lhart-dev-tps38900x-v2-2-e5730523d3ee@witekio.com>
References: <20261117-lhart-dev-tps38900x-v2-0-e5730523d3ee@witekio.com>
In-Reply-To: <20261117-lhart-dev-tps38900x-v2-0-e5730523d3ee@witekio.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Flaviu Nistor <flaviu.nistor@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Luna Hart <lhart.opensource@witekio.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794959140; l=17205;
 i=lhart.opensource@witekio.com; s=20260928; h=from:subject:message-id;
 bh=v6ZeQFkqjPiEen3/siZLYs3dEvIYrOkePywUbDj0/I4=;
 b=wQqMhckFMWcnolQO62F16pGSGACtgM+YF+Xc/UNsB/VXR3+z8+ne6foF4tmVdP5XOTsJN9IDJ
 lXJL90txVSbDAteokNTQaMO103oLG5BmLOox6xPE1lSUnlUK81LZV9+
X-Developer-Key: i=lhart.opensource@witekio.com; a=ed25519;
 pk=Dm1WPzsg+HuKn11WChbCWrNOk7GD980BnpCdnUwyDuU=
X-Endpoint-Received: by B4 Relay for lhart.opensource@witekio.com/20260928
 with auth_id=1079
X-Original-From: Luna Hart <lhart.opensource@witekio.com>
Reply-To: lhart.opensource@witekio.com
Content-Transfer-Encoding: 7bit

From: Luna Hart <lhart.opensource@witekio.com>

Add support for the TI TPS389006/TPS389008 I2C voltage supervisors and
monitors. This initial implementation supports enabling ADC monitoring
from the chip and reading back the measured voltage in millivolts. All
functionality is provided over sysfs. The voltage range of each channel
is taken from the chip configuration, and device tree may be used to
further configure each voltage channel.

This work is based on an initial implementation by Flaviu Nistor.

Signed-off-by: Luna Hart <lhart.opensource@witekio.com>
---
 Documentation/hwmon/index.rst     |   1 +
 Documentation/hwmon/tps38900x.rst |  80 +++++++++
 MAINTAINERS                       |   8 +
 drivers/hwmon/Kconfig             |  12 ++
 drivers/hwmon/Makefile            |   1 +
 drivers/hwmon/tps38900x.c         | 361 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 463 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index d73d1d5919dde28e45b2daf9eef7b12133b6073e..33d676783bdb3967d8b8732b1332d2aa0757b77e 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -284,6 +284,7 @@ Hardware Monitoring Kernel Drivers
    tmp513
    tps23861
    tps25990
+   tps38900x
    tps40422
    tps53679
    tps546d24
diff --git a/Documentation/hwmon/tps38900x.rst b/Documentation/hwmon/tps38900x.rst
new file mode 100644
index 0000000000000000000000000000000000000000..6e5b7153b2710227a00aaf289feb145368267c5c
--- /dev/null
+++ b/Documentation/hwmon/tps38900x.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel Driver tps38900x
+=======================
+
+Supported chips:
+
+  * Texas Instruments TPS389006
+
+    Prefix: 'tps389006'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.ti.com/lit/ds/symlink/tps389006.pdf
+
+  * Texas Instruments TPS389008
+
+    Prefix: 'tps389008'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.ti.com/lit/ds/symlink/tps389006-q1.pdf
+
+Author:
+
+  - Luna Hart <lhart.opensource@witekio.com>
+
+Description
+-----------
+
+This driver implements support for the TI TPS38900x family of voltage
+supervisors and monitors. Supported chips include the TPS389006 (6 channels)
+and TPS389008 (8 channels).
+
+The driver currently supports reading out current voltage levels from the ADCs.
+
+All ADC measurements are 8 bit, and there are 2 supported measurement scales.
+
+  - 1x scaling: 200 to 1475 mV (5 mV steps)
+  - 4x scaling: 800 to 5500 mV (20 mV steps)
+
+The scale of each channel is taken from the chip configuration at probe time,
+unless the device tree selects one with the ti,vrange-multiplier property.
+Channels already monitoring at probe time, such as ones enabled by the factory
+OTP configuration, keep their scale.
+
+Channel inN is the MON(N+1) input of the datasheet. By default, all channels
+are exposed. A channel can be hidden by setting status = "disabled" in its
+device tree child node.
+
+Known Issues
+------------
+
+Interrupts, limits/alarms, and sequenced readings functions of the tps38900x
+family are not implemented.
+
+The ADC is stopped while the ACT pin is low, and inX_input then returns
+-ENODATA. The ADC is also stopped in DEEP SLEEP, where inX_input returns the
+last measured value.
+
+Sysfs entries
+-------------
+
+The complete list of sysfs attributes provided for each channel. Channels 0-5
+are available on the TPS389006, channels 0-7 on the TPS389008.
+
+=============================== ======= ========================================
+Name                            Perm    Description
+=============================== ======= ========================================
+in[0-7]_input                   RO      Voltage channel input. Returns -ENODATA
+                                        if the channel is disabled or the ACT
+                                        pin is low.
+in[0-7]_label                   RO      Voltage channel label, if set in the
+                                        device tree.
+in[0-7]_enable                  RW      Voltage channel enable. This controls
+                                        the chip's monitoring of the channel,
+                                        not only the readout. Read-only if the
+                                        configuration registers are write
+                                        protected (PROT1/PROT2).
+=============================== ======= ========================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 610fd1f5568c9107673ae692cdb616d30cc6750d..c896d13f1cf501a6123b5b35e22a4ee8448aa370 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27808,6 +27808,14 @@ F:	Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
 F:	Documentation/hwmon/tps23861.rst
 F:	drivers/hwmon/tps23861.c
 
+TEXAS INSTRUMENTS TPS38900X VOLTAGE SUPERVISOR DRIVER
+M:	Luna Hart <lhart.opensource@witekio.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/ti,tps389006.yaml
+F:	Documentation/hwmon/tps38900x.rst
+F:	drivers/hwmon/tps38900x.c
+
 TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER
 M:	Matthias Fend <matthias.fend@emfend.at>
 L:	linux-leds@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 98467961f840588c15b601e60972d8d327e76e72..e5e23dc3afb2dced1751d2b2bd9d57d72e57b0e9 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2622,6 +2622,18 @@ config SENSORS_TMP513
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp513.
 
+config SENSORS_TPS38900X
+	tristate "Texas Instruments TPS389006/TPS389008 voltage supervisors"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for Texas Instruments
+	  TPS389006 (6 channels) and TPS389008 (8 channels) voltage
+	  supervisors and monitors.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tps38900x.
+
 config SENSORS_TSC1641
 	tristate "ST Microelectronics TSC1641 Power Monitor"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index f49aee1045e21280321a9861b37da401426facd7..2a6cef6777ee7b635d3883506fdef4ccbf9e2e7f 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -248,6 +248,7 @@ obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
 obj-$(CONFIG_SENSORS_TMP464)	+= tmp464.o
 obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
+obj-$(CONFIG_SENSORS_TPS38900X)	+= tps38900x.o
 obj-$(CONFIG_SENSORS_TSC1641)	+= tsc1641.o
 obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
 obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
diff --git a/drivers/hwmon/tps38900x.c b/drivers/hwmon/tps38900x.c
new file mode 100644
index 0000000000000000000000000000000000000000..ff29467d0f55aef3941fb26b7e2788fcdd5ce51e
--- /dev/null
+++ b/drivers/hwmon/tps38900x.c
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Texas Instruments TPS389006/TPS389008 i2c voltage
+ * supervisor and monitor.
+ *
+ * Author: Luna Hart <lhart.opensource@witekio.com>
+ *
+ * Datasheet: https://www.ti.com/lit/ds/symlink/tps389006.pdf
+ * Datasheet: https://www.ti.com/lit/ds/symlink/tps389006-q1.pdf
+ */
+
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define TPS38900X_MAX_CHANNELS 8
+#define TPS38900X_BANK_LEN 0x100
+
+/* Registers, stored over 2 banks of 256 bytes. */
+#define TPS38900X_VMON_STAT 0x30
+#define TPS38900X_MON_LVL(ch) (0x40 + (ch))
+#define TPS38900X_BANK_SEL 0xf0
+#define TPS38900X_PROT1 0xf1
+#define TPS38900X_PROT2 0xf2
+#define TPS38900X_MON_CH_EN 0x11e
+#define TPS38900X_VRANGE_MULT 0x11f
+
+/* ACT pin state, the ADC is stopped while it is low */
+#define TPS38900X_ST_ACTSHDN BIT(2)
+
+/* Write protection groups, locked when set in both PROT1 and PROT2. */
+#define TPS38900X_PROT_CFG BIT(3)
+
+#define TPS38900X_LSB_MV 5
+#define TPS38900X_OFFSET_MV 200
+
+struct tps38900x_data {
+	struct regmap *regmap;
+	const char *label[TPS38900X_MAX_CHANNELS];
+	/* bitmask of channels exposed through hwmon */
+	u8 channel_present;
+	/* write protected register groups */
+	u8 prot;
+};
+
+static umode_t tps38900x_is_visible(const void *data,
+				    enum hwmon_sensor_types type, u32 attr,
+				    int channel)
+{
+	const struct tps38900x_data *priv = data;
+
+	if (!(priv->channel_present & BIT(channel)))
+		return 0;
+
+	switch (attr) {
+	case hwmon_in_input:
+		return 0444;
+	case hwmon_in_enable:
+		return priv->prot & TPS38900X_PROT_CFG ? 0444 : 0644;
+	case hwmon_in_label:
+		return priv->label[channel] ? 0444 : 0;
+	}
+
+	return 0;
+}
+
+static int tps38900x_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long *val)
+{
+	struct tps38900x_data *priv = dev_get_drvdata(dev);
+	unsigned int regval, vrange;
+	int ret;
+
+	switch (attr) {
+	case hwmon_in_input:
+		ret = regmap_read(priv->regmap, TPS38900X_MON_CH_EN, &regval);
+		if (ret)
+			return ret;
+
+		if (!(regval & BIT(channel)))
+			return -ENODATA;
+
+		ret = regmap_read(priv->regmap, TPS38900X_VMON_STAT, &regval);
+		if (ret)
+			return ret;
+
+		if (!(regval & TPS38900X_ST_ACTSHDN))
+			return -ENODATA;
+
+		ret = regmap_read(priv->regmap, TPS38900X_VRANGE_MULT, &vrange);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(priv->regmap, TPS38900X_MON_LVL(channel),
+				  &regval);
+		if (ret)
+			return ret;
+
+		*val = regval * TPS38900X_LSB_MV + TPS38900X_OFFSET_MV;
+		if (vrange & BIT(channel))
+			*val *= 4;
+		return 0;
+	case hwmon_in_enable:
+		ret = regmap_read(priv->regmap, TPS38900X_MON_CH_EN, &regval);
+		if (ret)
+			return ret;
+
+		*val = !!(regval & BIT(channel));
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int tps38900x_write(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long enable)
+{
+	struct tps38900x_data *priv = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_in_enable:
+		if (enable != 0 && enable != 1)
+			return -EINVAL;
+
+		return regmap_update_bits(priv->regmap, TPS38900X_MON_CH_EN,
+					  BIT(channel),
+					  enable ? BIT(channel) : 0);
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int tps38900x_read_string(struct device *dev,
+				 enum hwmon_sensor_types type, u32 attr,
+				 int channel, const char **str)
+{
+	struct tps38900x_data *priv = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_in_label:
+		*str = priv->label[channel];
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops tps38900x_hwmon_ops = {
+	.is_visible = tps38900x_is_visible,
+	.read = tps38900x_read,
+	.write = tps38900x_write,
+	.read_string = tps38900x_read_string,
+};
+
+#define TPS38900X_IN_CONFIG (HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL)
+
+static const struct hwmon_channel_info *const tps38900x_info[] = {
+	HWMON_CHANNEL_INFO(in, TPS38900X_IN_CONFIG, TPS38900X_IN_CONFIG,
+			   TPS38900X_IN_CONFIG, TPS38900X_IN_CONFIG,
+			   TPS38900X_IN_CONFIG, TPS38900X_IN_CONFIG,
+			   TPS38900X_IN_CONFIG, TPS38900X_IN_CONFIG),
+	NULL
+};
+
+static const struct hwmon_chip_info tps38900x_chip_info = {
+	.ops = &tps38900x_hwmon_ops,
+	.info = tps38900x_info,
+};
+
+static const struct regmap_range_cfg tps38900x_bank_range = {
+	.name = "tps38900x-mem-bank",
+	.range_min = 0x00,
+	.range_max = 2 * TPS38900X_BANK_LEN - 1,
+	.selector_reg = TPS38900X_BANK_SEL,
+	.selector_mask = BIT(0),
+	.window_start = 0,
+	.window_len = TPS38900X_BANK_LEN,
+};
+
+static bool tps38900x_volatile_reg(struct device *dev, unsigned int reg)
+{
+	if (reg == TPS38900X_VMON_STAT)
+		return true;
+
+	/* ADC results region is volatile */
+	if (reg >= TPS38900X_MON_LVL(0) &&
+	    reg < TPS38900X_MON_LVL(TPS38900X_MAX_CHANNELS))
+		return true;
+
+	return false;
+}
+
+static const struct regmap_config tps38900x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 2 * TPS38900X_BANK_LEN - 1,
+	.ranges = &tps38900x_bank_range,
+	.num_ranges = 1,
+	.volatile_reg = tps38900x_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static int tps38900x_parse_dt_channels(struct device *dev,
+				       struct tps38900x_data *priv,
+				       unsigned int num_channels,
+				       u8 *range_set, u8 *range_4x)
+{
+	u32 reg, mult;
+	int ret;
+
+	/* All channels are exposed unless their DT node is disabled. */
+	priv->channel_present = GENMASK(num_channels - 1, 0);
+
+	/* Walk disabled nodes too, the fwnode iterators would skip them. */
+	for_each_child_of_node_scoped(dev->of_node, child) {
+		ret = of_property_read_u32(child, "reg", &reg);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "missing reg property\n");
+
+		if (reg >= num_channels)
+			return dev_err_probe(dev, -EINVAL,
+					     "reg out of range: %u (max %u)\n",
+					     reg, num_channels - 1);
+
+		if (!of_device_is_available(child)) {
+			priv->channel_present &= ~BIT(reg);
+			continue;
+		}
+
+		if (!of_property_read_u32(child, "ti,vrange-multiplier",
+					  &mult)) {
+			if (mult != 1 && mult != 4)
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid ti,vrange-multiplier: %u\n",
+						     mult);
+			*range_set |= BIT(reg);
+			if (mult == 4)
+				*range_4x |= BIT(reg);
+		}
+
+		of_property_read_string(child, "label", &priv->label[reg]);
+	}
+
+	return 0;
+}
+
+static int tps38900x_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct tps38900x_data *priv;
+	struct device *hwmon_dev;
+	unsigned int num_channels, prot1, prot2, vrange, mon_en;
+	u8 range_set = 0, range_4x = 0;
+	unsigned long ignored;
+	unsigned int ch;
+	u8 change;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return -ENODEV;
+
+	num_channels = (uintptr_t)i2c_get_match_data(client);
+	if (!num_channels)
+		return dev_err_probe(dev, -ENODEV, "unsupported device\n");
+
+	priv = devm_kzalloc_obj(dev, *priv);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = devm_regmap_init_i2c(client, &tps38900x_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "failed to allocate register map\n");
+
+	ret = regmap_read(priv->regmap, TPS38900X_PROT1, &prot1);
+	if (!ret)
+		ret = regmap_read(priv->regmap, TPS38900X_PROT2, &prot2);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read write protection\n");
+	priv->prot = prot1 & prot2;
+
+	ret = regmap_read(priv->regmap, TPS38900X_VRANGE_MULT, &vrange);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read voltage range\n");
+
+	ret = regmap_read(priv->regmap, TPS38900X_MON_CH_EN, &mon_en);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read channel enables\n");
+
+	ret = tps38900x_parse_dt_channels(dev, priv, num_channels,
+					  &range_set, &range_4x);
+	if (ret)
+		return ret;
+
+	/* Channels without a DT range keep the one the chip is programmed with. */
+	change = (vrange ^ range_4x) & range_set;
+
+	/*
+	 * Changing the range of a monitored channel changes the meaning of its
+	 * thresholds and can trigger a fault, so leave it as is.
+	 */
+	ignored = change & mon_en;
+	for_each_set_bit(ch, &ignored, TPS38900X_MAX_CHANNELS)
+		dev_warn(dev, "channel %u is monitoring, ignoring ti,vrange-multiplier\n",
+			 ch);
+	change &= ~ignored;
+
+	if (change && (priv->prot & TPS38900X_PROT_CFG)) {
+		dev_warn(dev, "voltage range is write protected\n");
+		change = 0;
+	}
+
+	if (change) {
+		ret = regmap_update_bits(priv->regmap, TPS38900X_VRANGE_MULT,
+					 change, range_4x);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to write voltage range\n");
+	}
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, priv,
+							 &tps38900x_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id tps38900x_id[] = {
+	{ .name = "tps389006", .driver_data = 6 },
+	{ .name = "tps389008", .driver_data = 8 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tps38900x_id);
+
+static const struct of_device_id tps38900x_of_match[] = {
+	{ .compatible = "ti,tps389006", .data = (void *)6 },
+	{ .compatible = "ti,tps389008", .data = (void *)8 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tps38900x_of_match);
+
+static struct i2c_driver tps38900x_driver = {
+	.driver = {
+		.name = "tps38900x",
+		.of_match_table = tps38900x_of_match,
+	},
+	.probe = tps38900x_probe,
+	.id_table = tps38900x_id,
+};
+module_i2c_driver(tps38900x_driver);
+
+MODULE_AUTHOR("Luna Hart <lhart.opensource@witekio.com>");
+MODULE_DESCRIPTION("TI TPS389006/TPS389008 voltage supervisor and monitor driver");
+MODULE_LICENSE("GPL");

-- 
2.47.3


