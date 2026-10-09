Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654672F9D98
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 00:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507379; cv=none; b=R1k1sgT3HOCdVeCIOHMRBjRpQthoggVEO8PDEG35ca2sIJda+QTPGFEGa/jF/h7Va3NZOly7jnIqeZaqCQroqYGcHzCW6tookXIQDyrRkbil/n0Uyqn7EOdfgEHzYgGZuPXGnPTlJaYUWwhaX8Z8WtADkn+W3sJLDeij5Vvsbvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507379; c=relaxed/simple;
	bh=Nm4y18p+lLNVjtWSJyqOuzUDQ49kAuWX5yNGk7GDQpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S07K2J2SVxmePEj4XgZxOpE43Jjw5myDJ9bXHGE//0+fw2QStePSsjmxYt/zptIcq+dwY1YXwr0YT0u2js9BkzM2xSu+gVdjmTORDyFeuUqdslDoJpaWs4EiXIMaGx86wazGBYLScTZUQhr7/dFFDFkyuGQmivvuLwOt67JLUys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Qdx3xHE5; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Qdx3xHE5"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-351767ef18cso1974026eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Oct 2026 17:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507369; x=1792112169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbMIxWxsn5/sE5OHmvDn4q8/wZQDmXqBF4s5CxfyYuQ=;
        b=Qdx3xHE5K+ornoutMXodNcBo2ggei7TPsqufPA4KdjftBYsI/2fp69npUVtnEoHz1i
         VOkVKjeKxSlQKPd4UnrnVbYrwSJXbVMmwxaNdRvtGKn4Pm+2lETAWHEM19Nf5sV2hGNu
         89p9SIhIbTj6SDxCA07wcTkw5ULEjxj40c+1049tkG1nYco8XsXrSoVblPIfEKWiBf9d
         K9N13eZYaOALzqKUgjc9PYl6cRz/9T1j17BFt7J2Jcy35mTBCYS31oqIHbOiWIBwwz0j
         EkLmgGFVSpSPvzlD3FAO5fft7DtetzM9R3XcXbxesbBuHmK4N10B1v+zzPlf0K9C5UzK
         88+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507369; x=1792112169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbMIxWxsn5/sE5OHmvDn4q8/wZQDmXqBF4s5CxfyYuQ=;
        b=U1YvHRPSIR3zU4fZ1FNRUVNq+Psq2kfiaimAuZeclP77LnMEQVuASjBOcq5aY6q5tj
         NLsJ+UyPusVUrxyQLuFkPRGB29mQ6dc2UX/XzQMRoYY8/QiLBH6w3yYVfUoZhbVy6g9i
         wXIzBpZjf6iXceAamjJgyrFdRi0ASiYizRrzPVoRuzTI9+ROZ7xkpva0uvbGufGeT8We
         tNr1bNfRyquF/Gzv/sys2kFOsRIUvY1W+64Zj4l5KyOakUUkgHCq70xLPKlXqKhdW0Is
         CKxIIoRVnoFlknL9a0WEofcynOXxvdQTpZajkn12ugMDgvaTo/jBVLgiI3hFHil1TfmU
         iMPg==
X-Forwarded-Encrypted: i=1; AKwUvBy+XmRTeJk3ZMUvDTXw0HCuDaa0cjlOvfiH3umSsazej3HGqdfw2LUut7RjFpZd+iM/zrf7fD1oTlHzxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYITohdwWN294r69j/BUmhJvIkkq8jteVLh57+d0JQT/Gh76mqZa
	sUz1ynH8DlUK/5vhxmJuzLRnkzlmjNozmTpKJ5mPWPGkG6xslZfC81iJIkKvLlg5r1Y=
X-Gm-Gg: AYBFou1IlUmbwFkkdqdtco0t4C7KUduGjiIIOnNLnEDi4iWbGdj3AKRmKI6QJWiL3Ob
	3b5NyQMkQD+gsBwZmuESmP0FMIXJamVYF04qWFf8N6Zi47jOF339INFoRoTb3k+hdFiHFz9KhKu
	SZoQPLzV64tjnJbgv6F/0HRShW5uE8jfWRkJeNqmJhmZ3ss5TdXLCmFRxFs2M8UKKoEzwgKgsuZ
	LqKOlu+J0Q6v+UILCzFliPTPdrk/6niBH52SKLY2zkK9xd+yyIX/y2kjXB73ZnYXQ3UUBA78PCd
	r1Ql1Un1alaapjqPs601MerQfyXqjrpagW4+Y5StJnJNMLgj0WEX6+CAnN7m6zlapnwoUA2JMEY
	8ISGJW12RhDcxjKLYhRdEJw8baXpDJexzXiDKZJRvhEopG232zeGcAuQSCBR9xYNBiHUX0PLAgr
	iqzjVNTjxDL1bhNIuYDa4NGOFpXmAw4+n5pOvP3gVoGbuMkmLCHbCQA/V+uF3Jt6Gx2Qea80k2B
	g==
X-Received: by 2002:a05:7300:ac81:b0:34d:de2e:1fca with SMTP id 5a478bee46e88-3537dff5a5cmr1194053eec.21.1791507369182;
        Thu, 08 Oct 2026 17:56:09 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 17:56:04 -0700
Subject: [PATCH 3/3] hwmon: (pmbus/fs1412) Add TDK FS1412 driver
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-3-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=12653;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Nm4y18p+lLNVjtWSJyqOuzUDQ49kAuWX5yNGk7GDQpo=;
 b=nHozLuHJ302tsJ1K2sGimOd7sCT3eNYaHsjbi7DwdQrV4GlGo96bCEQ+qCqVxfTudnDNeOSmP
 gFuLC8E6ZU2CeyHDPA8khvrUguYnTGPrSPquIlcUtQxAEgK50rIXYwo
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 is a 12A uPOL regulator with PMBus telemetry for input
voltage, output voltage and temperature, plus the matching status
registers. It has over-current and over-temperature protection with
programmable fault limits but no current telemetry: READ_IOUT is not in
its command table. Its MFR_ID reads "KDT", which the driver checks
before binding.

VOUT_MODE reads 0x98: LINEAR mode with exponent -8 and bit 7 set. The
datasheet defines the output voltage limits relative to the output
voltage with a resolution of 1/256, so 0x0133 against a 0.6V command is
a 120% over-voltage limit. The PMBus core takes bits [7:5] as the mode
and rejects the device, so the driver reports VOUT_MODE with bit 7
cleared and converts the four VOUT limits to and from absolute voltages
against VOUT_COMMAND.

OT_WARN_LIMIT is not in the command table either. The register answers,
but the part has no warning threshold and reports OT_WARNING at room
temperature, so the driver hides the register from the core and only
the OT_FAULT_LIMIT based attributes are provided.

READ_VOUT reports the voltage at the feedback pin, so boards that set
the output with a resistor divider scale in2_input in user space.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/hwmon/fs1412.rst |  87 ++++++++++++++++++++
 Documentation/hwmon/index.rst  |   1 +
 MAINTAINERS                    |   7 ++
 drivers/hwmon/pmbus/Kconfig    |   9 +++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/fs1412.c   | 179 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 284 insertions(+)

diff --git a/Documentation/hwmon/fs1412.rst b/Documentation/hwmon/fs1412.rst
new file mode 100644
index 000000000000..b9b12fcbc5d9
--- /dev/null
+++ b/Documentation/hwmon/fs1412.rst
@@ -0,0 +1,87 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver fs1412
+====================
+
+Supported chips:
+
+  * TDK FS1412
+
+    Prefix: 'fs1412'
+
+    Addresses scanned: -
+
+    Datasheet: https://product.tdk.com/system/files/dam/doc/product/power/switching-power/micro-pol/data_sheet/fs1412_datasheet.pdf
+
+Authors:
+    Abdurrahman Hussain <abdurrahman@nexthop.ai>
+
+
+Description
+-----------
+
+This driver implements support for the TDK FS1412, a 12A uPOL DC/DC
+regulator with PMBus monitoring of its input voltage, output voltage and
+temperature. The part has over-current and over-temperature protection with
+programmable fault limits but no current telemetry, so no current attributes
+are provided.
+
+The device answers on two I2C addresses: a register interface at the I2C
+base address (0x08 by default) and the PMBus interface at the PMBus base
+address (0x70 by default), each plus the offset strapped on the ADDR pin.
+This driver binds to the PMBus address.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+READ_VOUT reports the voltage at the feedback (VFB) pin, not the regulated
+output. When the output is set with an external resistor divider, scale
+in2_input and the in2 limits by the divider ratio in user space.
+
+The device stores its output voltage limits relative to VOUT_COMMAND
+(VOUT_MODE bit 7 set). The driver converts them to and from absolute
+voltages, so the in2 limits read and write in the same units as in2_input.
+A written limit is stored as a 1/256 fraction of VOUT_COMMAND, so it may
+read back rounded to that resolution. The over-voltage protection itself
+engages at one of four thresholds the device rounds the fault limit to; see
+the datasheet.
+
+The part reports an over-temperature warning at room temperature and has no
+OT_WARN_LIMIT in its command table, so temp1_max and its alarm are not
+provided; temp1_crit comes from OT_FAULT_LIMIT.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_min			Minimum input voltage
+in1_min_alarm		Input voltage low alarm
+in1_crit		Critical high input voltage
+in1_crit_alarm		Input voltage critical high alarm
+
+in2_label		"vout1"
+in2_input		Measured voltage at the feedback pin
+in2_min			Minimum output voltage
+in2_min_alarm		Output voltage low alarm
+in2_max			Maximum output voltage
+in2_max_alarm		Output voltage high alarm
+in2_lcrit		Critical low output voltage
+in2_lcrit_alarm		Output voltage critical low alarm
+in2_crit		Critical high output voltage
+in2_crit_alarm		Output voltage critical high alarm
+
+temp1_input		Measured temperature
+temp1_crit		Critical high temperature
+temp1_crit_alarm	Temperature critical high alarm
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9955a525436a..625833374c94 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -79,6 +79,7 @@ Hardware Monitoring Kernel Drivers
    f71805f
    f71882fg
    fam15h_power
+   fs1412
    fsp-3y
    ftsteutates
    g760a
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..05461a380bf7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26778,6 +26778,13 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/tda9840*
 
+TDK FS1412 MICRO POL DRIVER
+M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/fs1412.rst
+F:	drivers/hwmon/pmbus/fs1412.c
+
 TEA5761 TUNER DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index eb71a0ac044b..030ef72415fe 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -132,6 +132,15 @@ config SENSORS_DELTA_AHE50DC_FAN
 	  This driver can also be built as a module. If so, the module
 	  will be called delta-ahe50dc-fan.
 
+config SENSORS_FS1412
+	tristate "TDK FS1412"
+	help
+	  If you say yes here you get hardware monitoring support for the TDK
+	  FS1412 uPOL regulator.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called fs1412.
+
 config SENSORS_FSP_3Y
 	tristate "FSP/3Y-Power power supplies"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index e288fe72a437..7bbc0d02bfad 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_APS_379)	+= aps-379.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
 obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
+obj-$(CONFIG_SENSORS_FS1412)	+= fs1412.o
 obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
 obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
diff --git a/drivers/hwmon/pmbus/fs1412.c b/drivers/hwmon/pmbus/fs1412.c
new file mode 100644
index 000000000000..90a72b23967e
--- /dev/null
+++ b/drivers/hwmon/pmbus/fs1412.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for the TDK FS1412 uPOL regulator
+ *
+ * Copyright 2026 Nexthop Systems.
+ */
+
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pmbus.h>
+#include <linux/string.h>
+
+#include "pmbus.h"
+
+#define FS1412_MFR_ID		"KDT"
+#define FS1412_MFR_ID_LEN	(sizeof(FS1412_MFR_ID) - 1)
+
+/* VOUT_MODE: bit 7 selects relative VOUT limits, bits [4:0] the exponent. */
+#define FS1412_VOUT_MODE_RELATIVE	BIT(7)
+#define FS1412_VOUT_MODE_EXP_MASK	0x1f
+#define FS1412_VOUT_EXP_SHIFT		8	/* exponent -8: 1/256 V per LSB */
+
+/*
+ * VOUT_MODE reads 0x98: LINEAR mode with exponent -8 and bit 7 set, which
+ * makes the VOUT limit commands relative to VOUT_COMMAND. The PMBus core
+ * treats bits [7:5] as the mode, so report the mode and exponent with bit
+ * 7 cleared and convert the relative limits in the word accessors below.
+ */
+static int fs1412_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int ret;
+
+	if (reg != PMBUS_VOUT_MODE)
+		return -ENODATA;
+
+	ret = pmbus_read_byte_data(client, page, reg);
+	if (ret < 0 || ret == 0xff)
+		return ret;
+
+	return ret & ~FS1412_VOUT_MODE_RELATIVE;
+}
+
+static bool fs1412_vout_limit(int reg)
+{
+	switch (reg) {
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/*
+ * The VOUT limits hold the limit as a fraction of VOUT_COMMAND in the same
+ * 1/256 units, so 0x0133 on a 0.6 V command is a 120% limit. Report them
+ * as absolute voltages: limit = fraction * VOUT_COMMAND.
+ */
+static int fs1412_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	int rel, cmd;
+
+	/*
+	 * OT_WARN_LIMIT is not in the command table. The register answers,
+	 * but the part has no warning threshold and reports OT_WARNING at
+	 * room temperature, so keep the core from exposing either.
+	 */
+	if (reg == PMBUS_OT_WARN_LIMIT)
+		return -ENXIO;
+	if (!fs1412_vout_limit(reg))
+		return -ENODATA;
+
+	rel = pmbus_read_word_data(client, page, phase, reg);
+	if (rel < 0)
+		return rel;
+
+	cmd = pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_COMMAND);
+	if (cmd < 0)
+		return cmd;
+
+	return min_t(u32, DIV_ROUND_CLOSEST((u32)rel * cmd,
+					     1 << FS1412_VOUT_EXP_SHIFT), 0xffff);
+}
+
+static int fs1412_write_word_data(struct i2c_client *client, int page,
+				  int reg, u16 word)
+{
+	int cmd;
+
+	if (reg == PMBUS_OT_WARN_LIMIT)
+		return -ENXIO;
+	if (!fs1412_vout_limit(reg))
+		return -ENODATA;
+
+	cmd = pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_COMMAND);
+	if (cmd < 0)
+		return cmd;
+	if (!cmd)
+		return -EINVAL;
+
+	word = clamp_val(DIV_ROUND_CLOSEST(word << FS1412_VOUT_EXP_SHIFT, cmd),
+			 0, 0xffff);
+
+	return pmbus_write_word_data(client, page, reg, word);
+}
+
+static struct pmbus_driver_info fs1412_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+	.read_byte_data = fs1412_read_byte_data,
+	.read_word_data = fs1412_read_word_data,
+	.write_word_data = fs1412_write_word_data,
+};
+
+static int fs1412_probe(struct i2c_client *client)
+{
+	char buf[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
+	struct device *dev = &client->dev;
+	int ret;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_ID\n");
+
+	if (ret != FS1412_MFR_ID_LEN ||
+	    strncmp(buf, FS1412_MFR_ID, FS1412_MFR_ID_LEN))
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported Manufacturer ID '%s'\n", buf);
+
+	/* The relative limit conversion assumes the 1/256 V exponent. */
+	ret = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read VOUT_MODE\n");
+	if ((ret & FS1412_VOUT_MODE_EXP_MASK) != 0x18)
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported VOUT_MODE 0x%02x\n", ret);
+
+	return pmbus_do_probe(client, &fs1412_info);
+}
+
+static const struct i2c_device_id fs1412_id[] = {
+	{ .name = "fs1412" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, fs1412_id);
+
+static const struct of_device_id fs1412_of_match[] = {
+	{ .compatible = "tdk,fs1412" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, fs1412_of_match);
+
+static struct i2c_driver fs1412_driver = {
+	.driver = {
+		.name = "fs1412",
+		.of_match_table = fs1412_of_match,
+	},
+	.probe = fs1412_probe,
+	.id_table = fs1412_id,
+};
+
+module_i2c_driver(fs1412_driver);
+
+MODULE_AUTHOR("Abdurrahman Hussain <abdurrahman@nexthop.ai>");
+MODULE_DESCRIPTION("PMBus driver for the TDK FS1412 uPOL regulator");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.54.0

