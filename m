Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEB73904FB
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Jan 2026 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768849697; cv=none; b=ZuK1oGti87aXIP2TCASkHnIQ7W0dSsu7UVU7pmaw+y5Pb9CukwhHhpcFjrSd/buCzItnlRR+q7uA/1cicXtjdovN2sgbMVrwwF3T9+Vic+6TuStZTU6tTORFhSbmYKPYGjYaKPvgxC0RzIQrZmvF+jPe/TojSXoPlLqBHa3OK7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768849697; c=relaxed/simple;
	bh=3PUyPCcdwpDy4sR6ULerIZnext4tAwigq1OJ4UpVhSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dM0u283Q/t4f4kfaJHAPDzAPLpc6KChe8yL0230NlbGthoMjH9mI1L1F3+1XoYrtO8vaCCK5aGSBr7T+dSTPuMdrN+ZMETaNRrEl9v6tHMdpaXRE6VWSnXrNkrmrKKkc2Qr7JKMTJUnjEIygD6Pd0OYFT5N6OKeQPyDfQM0Fi44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZdB8790; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZdB8790"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so7944920a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Jan 2026 11:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768849693; x=1769454493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EOeB2Krno7KohtcwawYWgC7Y0EFIpANQmNXzA7njlY=;
        b=SZdB87901OfI0BFlUYH3WYJcwUV+yFSqkEyAAAf1b18xBhVGghRPkhEb7MVYI1AuCX
         OIphEyuWvFc5/aleM/TDfGn97tzt1XbGDkYm8BWvLv63yqgKYgZ/AE5z4y2HtctajC2f
         DCPCLxJdtvjGXtCZ3ZKIQ7vnmogesWs+wcsElNpxtHal4pcFyQzOcCAWbcGWNFXuxRgR
         M2++75IzFTJWGu3xhkl/1ZNH8cITMF9bLG0/bcIFNkQTnum0B8m53HkzSjNfxoCepUhA
         kWPq7YlQ49bqz8/ggBSP2aIz9KDfbVj4h3+NVzuA1gUnIi0gSIpEzfv2MrN6lPOu8yKq
         b2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768849693; x=1769454493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6EOeB2Krno7KohtcwawYWgC7Y0EFIpANQmNXzA7njlY=;
        b=iVa2GJCsBqvIY8MSW1kpIKXLICBOXkcSaKa1NZ5gMCfXlCRJOlhBrHEy9QygHLVZBg
         9GsF0xy4Mwd7TfxUA8znQ0JicN8j1EUsluORGaeAaDx6Z5uymZIXr+McWt0Nb3b5Jwi0
         bbjn4WUlrg7L6fsYBmywb29iQjsWRIPuiIATyBV628w1Di8jE1W0WmoP1A1JF1afVl2N
         ikHNGY7O5fnBCD/iD5TnmtCIiO1YtIBAqCpeXHkZzcusVYn3bN/VhPtI6m9OfbKkgnJr
         TLPh4vpijuqM7t3PIRlGbgt2A/ZsxfnAlPNbgsrNAHGYH8zQ0tWpOCWmizJE9NgaQZed
         cUjg==
X-Forwarded-Encrypted: i=1; AJvYcCWaC2ObqsZFitslvvDdPErrXEGeJCV8au/KsHF2pE7vfPud4E77YdFRhpkXWFmg0oMuYVUhtiVfSeymLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTj+aWioHEXF2XqqqiuqDpoZrt9pUJCS3tsvdFu24ZXBE2kvh6
	V3EfIg8zhti05CFJq2TYxt8nud9rQReA2I0RvwLBOoHxThGYd+AT1S7q
X-Gm-Gg: AY/fxX55Jmap0o6cogSh8cwNUva9AZSFJHnKS4VaSVdKtaCIwqUoNTKubt0A4hEcjUA
	cDNEpPymZMXOTvhF6cPpcyGdZDKNEJR8uFYw9jdZQs7C8TuYWt4KUJyoUY+dwt15ZKf4M7HcMvq
	ZoJFe6sR2UlmopKV8UW2oTdvwKe84oFzqnWrJwEe4FJkw97u9Jgi9n3oNsd4PzBZ1OXhrITWM9C
	MDxKzERf3xAFQHPF/x9N3oMAoet00F9jw1xPoSwu12yBWunCAtASq9M5ZC3d0F66AgzJwJKgGHC
	lUGaf2m6mRVg3EdgAD0ZjO6JcWGhxi7bTr/84Fsp8/Sv2/yxAqFBcEzssXv+twyqnODMRTJzVir
	bp6yaSUB1SfYhSrVSU7iMo4GmKWO4N8QSfdca0SVzbLDUo81wK62CLHBg334qDcUg1hprE3UJgt
	/91rVhCpIRNBhAKI5NvTAQu9A=
X-Received: by 2002:a17:907:d0d:b0:b87:c13:f334 with SMTP id a640c23a62f3a-b8796b85d4dmr1092364266b.53.1768849692744;
        Mon, 19 Jan 2026 11:08:12 -0800 (PST)
Received: from vamoirid-laptop.. ([2a04:ee41:82:7577:a4c5:86fc:3b16:bc0a])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1193767366b.41.2026.01.19.11.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:08:12 -0800 (PST)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Subject: [PATCH v2 2/2] hwmon: Add support for HiTRON HAC300S PSU
Date: Mon, 19 Jan 2026 20:08:06 +0100
Message-ID: <20260119190806.35276-3-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119190806.35276-1-vassilisamir@gmail.com>
References: <20260119190806.35276-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

Add Support for HiTRON HAC300S PSU. This is a AC/DC hot-swappable
CompactPCI Serial Dual output active current sharing switching power
supply with a 312W rating.

Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
---
 Documentation/hwmon/hac300s.rst |  37 +++++++++
 Documentation/hwmon/index.rst   |   1 +
 MAINTAINERS                     |   7 ++
 drivers/hwmon/pmbus/Kconfig     |   9 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/hac300s.c   | 132 ++++++++++++++++++++++++++++++++
 6 files changed, 187 insertions(+)
 create mode 100644 Documentation/hwmon/hac300s.rst
 create mode 100644 drivers/hwmon/pmbus/hac300s.c

diff --git a/Documentation/hwmon/hac300s.rst b/Documentation/hwmon/hac300s.rst
new file mode 100644
index 000000000000..8b11d3e72295
--- /dev/null
+++ b/Documentation/hwmon/hac300s.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver hac300s
+=====================
+
+Supported chips:
+
+   * HiTRON HAC300S
+
+     Prefix: 'hac300s'
+
+     Datasheet: Publicly available at HiTRON website.
+
+Author:
+
+  - Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
+
+Description
+-----------
+
+This driver supports the HiTRON HAC300S PSU. It is a Universal AC input
+harmonic correction AC-DC hot-swappable CompactPCI Serial Dual output
+(with 5V standby) 312 Watts active current sharing switching power supply.
+
+The device has an input of 90-264VAC and 2 nominal output voltaged at 12V and
+5V which they can supplu up to 25A and 2.5A respectively.
+
+Sysfs entries
+-------------
+
+======= ==========================================
+curr1   Output current
+in1     Output voltage
+power1  Output power
+temp1   Ambient temperature inside the module
+temp2   Internal secondary component's temperature
+======= ==========================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..f00ce656e9dd 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -84,6 +84,7 @@ Hardware Monitoring Kernel Drivers
    gl518sm
    gpd-fan
    gxp-fan-ctrl
+   hac300s
    hih6130
    hp-wmi-sensors
    hs3001
diff --git a/MAINTAINERS b/MAINTAINERS
index cf755238c429..e4b4a41a2c07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11259,6 +11259,13 @@ F:	kernel/time/timer_list.c
 F:	kernel/time/timer_migration.*
 F:	tools/testing/selftests/timers/
 
+HITRON HAC300S PSU DRIVER
+M:	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/hac300s.rst
+F:	drivers/hwmon/pmbus/hac300s.c
+
 DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]
 M:	Andreas Hindborg <a.hindborg@kernel.org>
 R:	Boqun Feng <boqun.feng@gmail.com>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f3fb94cebf1a..4c2cb51dbe3f 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -124,6 +124,15 @@ config SENSORS_FSP_3Y
 	  This driver can also be built as a module. If so, the module will
 	  be called fsp-3y.
 
+config SENSORS_HAC300S
+	tristate "Hitron HAC300S-D120E PSU"
+	help
+	  If you say yes here you get hardware monitoring support for the
+	  Hitron HAC300S-D120E Power Supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called hac300s.
+
 config SENSORS_IBM_CFFPS
 	tristate "IBM Common Form Factor Power Supply"
 	depends on LEDS_CLASS
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 349a89b6d92e..b92309019d35 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
 obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
 obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
+obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
 obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
diff --git a/drivers/hwmon/pmbus/hac300s.c b/drivers/hwmon/pmbus/hac300s.c
new file mode 100644
index 000000000000..26cb7fadd5d5
--- /dev/null
+++ b/drivers/hwmon/pmbus/hac300s.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: 2024 CERN (home.cern)
+/*
+ * Hardware monitoring driver for Hi-Tron HAC300S PSU.
+ *
+ * NOTE: The HAC300S device does not support the PMBUS_VOUT_MODE register.
+ * On top of that, it returns the Voltage output values in Linear11 which is
+ * not adhering to the PMBus specifications. (PMBus Specification Part II,
+ * Section 7.1-7.3). For that reason the PMBUS_VOUT_MODE register is being faked
+ * and returns the exponent value of the READ_VOUT register. The exponent part
+ * of the VOUT_* registers is being cleared in order to return the mantissa to
+ * the pmbus core.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+#define LINEAR11_EXPONENT_MASK GENMASK(15, 11)
+#define LINEAR11_MANTISSA_MASK GENMASK(10, 0)
+
+#define to_hac300s_data(x) container_of(x, struct hac300s_data, info)
+
+struct hac300s_data {
+	struct pmbus_driver_info info;
+	s8 exponent;
+};
+
+static int hac300s_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct hac300s_data *data = to_hac300s_data(info);
+
+	if (reg == PMBUS_VOUT_MODE)
+		return data->exponent;
+
+	return pmbus_read_byte_data(client, page, reg);
+}
+
+static int hac300s_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
+{
+	int rv;
+
+	switch (reg) {
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_READ_VOUT:
+		rv = pmbus_read_word_data(client, page, phase, reg);
+		return FIELD_GET(LINEAR11_MANTISSA_MASK, rv);
+	default:
+		return -ENODATA;
+	}
+}
+
+static struct pmbus_driver_info hac300s_info = {
+	.pages = 1,
+	.func[0] = (PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | \
+                    PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
+                    PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
+                    PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_TEMP),
+	.read_byte_data = hac300s_read_byte_data,
+	.read_word_data = hac300s_read_word_data,
+	.format[PSC_VOLTAGE_OUT] = linear,
+};
+
+static struct pmbus_platform_data hac300s_pdata = {
+	.flags = PMBUS_NO_CAPABILITY,
+};
+
+static int hac300s_probe(struct i2c_client *client)
+{
+	struct hac300s_data *data;
+	int rv;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct hac300s_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_BYTE_DATA |
+				     I2C_FUNC_SMBUS_READ_WORD_DATA))
+		return -ENODEV;
+
+	rv = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
+	if (rv < 0)
+		return dev_err_probe(&client->dev, rv, "Failed to read vout_mode\n");
+
+	data->exponent = FIELD_GET(LINEAR11_EXPONENT_MASK, rv);
+	data->info = hac300s_info;
+	client->dev.platform_data = &hac300s_pdata;
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct of_device_id hac300s_of_match[] = {
+	{ .compatible = "hitron,hac300s" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, hac300s_of_match);
+
+static const struct i2c_device_id hac300s_id[] = {
+	{"hac300s", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, hac300s_id);
+
+static struct i2c_driver hac300s_driver = {
+	.driver = {
+		   .name = "hac300s",
+		   .of_match_table = hac300s_of_match,
+	},
+	.probe = hac300s_probe,
+	.id_table = hac300s_id,
+
+};
+module_i2c_driver(hac300s_driver);
+
+MODULE_AUTHOR("Vasileios Amoiridis");
+MODULE_DESCRIPTION("PMBus driver for Hi-Tron HAC300S PSU");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.47.3

