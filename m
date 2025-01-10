Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E5207A37;
	Fri, 10 Jan 2025 08:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496982; cv=none; b=qevE/5xNiXesukfr3nIaHGZUicgEB71TV9Ygcaaps1qtN/RWrXLRU8ZQwJtvgutFkfR+jqUwYPJ2HV5Tbm8uRceWLu6wk8OwjGBlmTzMqJ3eIOAAnLvhyBwtnGWLLvh1Qa75Goad5Nnd5oJsXu7WfztM8Iq56pLfZsyaMv2uoRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496982; c=relaxed/simple;
	bh=5cDHMm8zqYMlgAvrdjcgPKx2dRioGoYY10CNWEYe66U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q0Zs9wVlMyjX2MClV0jXBnVK0Q5fuFzlrE+Hjwxi1+PbHMgSpFS1uAl5OWNyW7DjWXBq3cfH3XuNV8avRywzG5BeYfqcRI6zc7TGJ0S88tXSHbxNaaOICHGmK7P4Vj7PU1kXCV+axL0k2JOD2lmUuFbyAD7tVYdk6HCBTp+Et5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNcxTght; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNcxTght"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21619108a6bso29410425ad.3;
        Fri, 10 Jan 2025 00:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736496979; x=1737101779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnhZLLXJ2aX3YuqYzOsKJOKWAboLeQSltfdW2e1AXgk=;
        b=jNcxTghtA/DQ78/SFMqXGIvVB9IJ/93Zavrf8pcrMcs1ja7gv+0FeSXTNP8yAvpbrj
         Z+/E0yaU0ATptrD++CKbFGlic3a7dMjgdS/uTWVdZRXg0hI9v33Lss7As1S9UhZLAG2P
         vTRtqj4Y/13swGYb3wmwfhxNORhMeotpp+BwKNy7AmIqYhutZJfMp8yTXvy/u+460N0q
         z3MhMSz9p0462edZ4qgc2vv8/pGEPApEsBC9Y8G95grUMA86um0xGbVJvcjtQJ5K7vSm
         eAm91+ZAG18z/cXcc6ookDqzNQCXMchv4iTOwAXhcBLsr6UxBOHOhJ4cBygCtdc1mFv6
         YlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496979; x=1737101779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnhZLLXJ2aX3YuqYzOsKJOKWAboLeQSltfdW2e1AXgk=;
        b=KAEQC4FpBzQF/gWNWJsvG/RaRzzdNurMOBNofDr54Lcrl4+ztBpZk3rwcVmdGJUU+w
         AZINCi6S5AGbDfllCdIzVePbd5qu7n5EZOipDQRpcy0ryUe/mgqfYfVsT0Y9mM2FY7sx
         PMZrRjazuRcmQdXpem2fNBhpUheoPPtEpIfbma/0/pTuL5uYAwOBg6IUhePRMO2HRE/p
         sbbLCrcZ6pVxyEgbhr5cg3ZqneGQyFtyPy7xiM46hWJRk2T2E8wzz4MdledzeKlG9kSR
         EftYj3cNSHFNpnzXcvPqbH2SeHLkN0Crccv1ner3FlOXUzssBDiK5DriBiHvABoJvII6
         p6qg==
X-Forwarded-Encrypted: i=1; AJvYcCUOLlKACbhtlvwEQvUdj8bgwKqUyclfvlw+JOzfW1J6UFHf8IZXOBf9tmTp2GGV1zAJGE7uySuHlGHymMy3@vger.kernel.org, AJvYcCVUDJ5GNrtk4ZgsKvzpY66EnvKpco2YNLmTS/jRHpjkZ3Mf4/pe4j+7syibGXUpKIvRV1OnvXZrGSn3@vger.kernel.org, AJvYcCVinrzJIri+xFSNxkGdOBxI0vTWMxvOSihwjwuiKDkAlW1EYf5keu8oAiPSbXS4vQzCLGHsyEStekaYX9g=@vger.kernel.org, AJvYcCW5TG9lkg+8fLCYMiY1VgLz6r/EsalA2MiIfnJVerNzRf0Wc1N/ckfCoGRiqRvyNjNt7KZbK9ASoWVG@vger.kernel.org
X-Gm-Message-State: AOJu0Yybm+r8DouDboMByWuOFqGAPPE/+9k/b7oMKZWN6CQp/5ftX9Rc
	0yYK40U3XEAwOcWagwytwrhRn+Xs6jkZd5KufOG/2goKMsy6pa7W
X-Gm-Gg: ASbGncsb+DD2YqR7fkOOLwyXFHtiJ6Jhyd1ZVNJzb+jqeI6ikpm1Ybg6+ec2CUuF2C5
	tdrB9MpHbCEWfupjpW0EO9Xjs3jWy8N5UB6Eb3n3YgCGcIA/MJWtumCevrQTpKPRp7TXr+Z3uGp
	/EMIjwn04YFeb4TZMVIcSfcbC8/ht6dUKorumyjDFdc9/ZsHTTssmWOwQn3U0n2FNF1nXjVPzU5
	UtHtq0hu4bHPh4lPJdA0MCwL95YfElvR7Af9pYXrVh9WUv7EoaKRXRc9dLWqfNAchN3tYlJrStb
	VhUs8lP2F3K7Pj5ce3k03sFXOE71PuNVvxNs
X-Google-Smtp-Source: AGHT+IFkHm8Tzz9wAYoE4cdcEpYxvLUIMuxK1gfkX0pB7hS5Pi0SptJtXRIwTkSSSYZEdU8MS3NuMg==
X-Received: by 2002:a05:6a20:3943:b0:1e8:bd15:6819 with SMTP id adf61e73a8af0-1e8bd156be3mr526154637.22.1736496978921;
        Fri, 10 Jan 2025 00:16:18 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31de806694sm2431837a12.69.2025.01.10.00.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:16:18 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
X-Google-Original-From: Leo Yang <Leo-Yang@quantatw.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	davem@davemloft.net,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leo-Yang@quantatw.com,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/2] hwmon: Add driver for TI INA232 Current and Power Monitor
Date: Fri, 10 Jan 2025 16:15:46 +0800
Message-Id: <20250110081546.61667-3-Leo-Yang@quantatw.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250110081546.61667-1-Leo-Yang@quantatw.com>
References: <20250110081546.61667-1-Leo-Yang@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support ina233 driver for Meta Yosemite V4.

Driver for Texas Instruments INA233 Current and Power Monitor
With I2C-, SMBus-, and PMBus-Compatible Interface

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501092213.X9mbPW5Q-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202501061734.nPNdRKqO-lkp@intel.com/
Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>
---
 Documentation/hwmon/ina233.rst |  77 ++++++++++++++
 MAINTAINERS                    |   8 ++
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/ina233.c   | 184 +++++++++++++++++++++++++++++++++
 5 files changed, 279 insertions(+)
 create mode 100644 Documentation/hwmon/ina233.rst
 create mode 100644 drivers/hwmon/pmbus/ina233.c

diff --git a/Documentation/hwmon/ina233.rst b/Documentation/hwmon/ina233.rst
new file mode 100644
index 000000000000..41537f89bed5
--- /dev/null
+++ b/Documentation/hwmon/ina233.rst
@@ -0,0 +1,77 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver ina233
+====================
+
+Supported chips:
+
+  * TI INA233
+
+    Prefix: 'ina233'
+
+  * Datasheet
+
+    Publicly available at the TI website : https://www.ti.com/lit/ds/symlink/ina233.pdf
+
+Author:
+
+	Leo Yang <Leo-Yang@quantatw.com>
+
+Usage Notes
+-----------
+
+The shunt resistor value can be configured by a device tree property;
+see Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for details.
+
+
+Description
+-----------
+
+This driver supports hardware monitoring for TI INA233.
+
+The driver is a client driver to the core PMBus driver. Please see
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+The driver provides the following attributes for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the following attributes for shunt voltage:
+
+**in2_input**
+
+**in2_label**
+
+The driver provides the following attributes for output voltage:
+
+**in3_input**
+
+**in3_label**
+
+**in3_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index c575de4903db..fde1713dff9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11226,6 +11226,14 @@ L:	linux-fbdev@vger.kernel.org
 S:	Orphan
 F:	drivers/video/fbdev/imsttfb.c
 
+INA233 HARDWARE MONITOR DRIVER
+M:	Leo Yang <Leo-Yang@quantatw.com>
+M:	Leo Yang <leo.yang.sy0@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Odd Fixes
+F:	Documentation/hwmon/ina233.rst
+F:	drivers/hwmon/pmbus/ina233.c
+
 INDEX OF FURTHER KERNEL DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
 S:	Maintained
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f6d352841953..55db0ddc94ed 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -124,6 +124,15 @@ config SENSORS_DPS920AB
 	  This driver can also be built as a module. If so, the module will
 	  be called dps920ab.
 
+config SENSORS_INA233
+	tristate "Texas Instruments INA233 and compatibles"
+	help
+	  If you say yes here you get hardware monitoring support for Texas
+	  Instruments INA233.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ina233.
+
 config SENSORS_INSPUR_IPSPS
 	tristate "INSPUR Power System Power Supply"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d00bcc758b97..3c4b06fb939e 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
 obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
+obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_IR36021)	+= ir36021.o
diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
new file mode 100644
index 000000000000..7899c3e99eeb
--- /dev/null
+++ b/drivers/hwmon/pmbus/ina233.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for ina233
+ *
+ * Copyright (c) 2025 Leo Yang
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define MFR_READ_VSHUNT 0xd1
+#define MFR_CALIBRATION 0xd4
+
+#define INA233_CURRENT_LSB_DEFAULT	1000 /* uA */
+#define INA233_RSHUNT_DEFAULT		2000 /* uOhm */
+
+#define MAX_M_VAL 32767
+#define MIN_M_VAL -32768
+
+static void calculate_coef(int *m, int *R, int power_coef)
+{
+	s64 scaled_m;
+	int scale_factor = 0;
+	int scale_coef = 1;
+	bool is_integer = false;
+
+	/*
+	 * 1000000 from Current_LSB A->uA .
+	 * scale_coef is for scaling up to minimize rounding errors,
+	 * If there is no decimal information, No need to scale.
+	 */
+	if (1000000 % *m) {
+		/* Scaling to keep integer precision */
+		scale_factor = -3;
+		scale_coef = 1000;
+	} else {
+		is_integer = true;
+	}
+
+	/*
+	 * Unit Conversion (Current_LSB A->uA) and use scaling(scale_factor)
+	 * to keep integer precision.
+	 * Formulae referenced from spec.
+	 */
+	scaled_m = div_s64(1000000 * scale_coef, *m * power_coef);
+
+	/* Maximize while keeping it bounded.*/
+	while (scaled_m > MAX_M_VAL || scaled_m < MIN_M_VAL) {
+		scaled_m = div_s64(scaled_m, 10);
+		scale_factor++;
+	}
+	/* Scale up only if fractional part exists. */
+	while (scaled_m * 10 < MAX_M_VAL && scaled_m * 10 > MIN_M_VAL && !is_integer) {
+		scaled_m *= 10;
+		scale_factor--;
+	}
+
+	*m = scaled_m;
+	*R = scale_factor;
+}
+
+static int ina233_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIRT_READ_VMON:
+		ret = pmbus_read_word_data(client, 0, 0xff, MFR_READ_VSHUNT);
+
+		/* Adjust returned value to match VIN coefficients */
+		/* VIN: 1.25 mV VSHUNT: 2.5 uV LSB */
+		ret = DIV_ROUND_CLOSEST(ret * 25, 12500);
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+	return ret;
+}
+
+static int ina233_probe(struct i2c_client *client)
+{
+	int ret, m, R;
+	u32 rshunt;
+	u16 current_lsb;
+	u16 calibration;
+	struct pmbus_driver_info *info;
+
+	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->pages = 1;
+	info->format[PSC_VOLTAGE_IN] = direct;
+	info->format[PSC_VOLTAGE_OUT] = direct;
+	info->format[PSC_CURRENT_OUT] = direct;
+	info->format[PSC_POWER] = direct;
+	info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_INPUT
+		| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+		| PMBUS_HAVE_POUT
+		| PMBUS_HAVE_VMON | PMBUS_HAVE_STATUS_VMON;
+	info->m[PSC_VOLTAGE_IN] = 8;
+	info->R[PSC_VOLTAGE_IN] = 2;
+	info->m[PSC_VOLTAGE_OUT] = 8;
+	info->R[PSC_VOLTAGE_OUT] = 2;
+	info->read_word_data = ina233_read_word_data;
+
+	/* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed.	*/
+	/* read rshunt value (uOhm) */
+	if (of_property_read_u32(client->dev.of_node, "shunt-resistor", &rshunt) < 0)
+		rshunt = INA233_RSHUNT_DEFAULT;
+
+	/* read current_lsb value (uA) */
+	if (of_property_read_u16(client->dev.of_node, "ti,current-lsb", &current_lsb) < 0)
+		current_lsb = INA233_CURRENT_LSB_DEFAULT;
+
+	if (!rshunt || !current_lsb) {
+		dev_err(&client->dev, "shunt-resistor and current-lsb cannot be zero.\n");
+		return -EINVAL;
+	}
+
+	/* calculate current coefficient */
+	m = current_lsb;
+	calculate_coef(&m, &R, 1);
+	info->m[PSC_CURRENT_OUT] = m;
+	info->R[PSC_CURRENT_OUT] = R;
+
+	/* calculate power coefficient */
+	m = current_lsb;
+	calculate_coef(&m, &R, 25);
+	info->m[PSC_POWER] = m;
+	info->R[PSC_POWER] = R;
+
+	/* write MFR_CALIBRATION register, Apply formula from spec with unit scaling. */
+	calibration = div64_u64(5120000000ULL, (u64)rshunt * current_lsb);
+	if (calibration > 0x7FFF) {
+		dev_err(&client->dev, "Exceeds MFR_CALIBRATION limit, Use a reasonable Current_LSB with Shunt resistor value.\n");
+		return -EINVAL;
+	}
+	ret = i2c_smbus_write_word_data(client, MFR_CALIBRATION, calibration);
+	if (ret < 0) {
+		dev_err(&client->dev, "Unable to write calibration\n");
+		return ret;
+	}
+
+	dev_dbg(&client->dev, "power monitor %s (Rshunt = %u uOhm, Current_LSB = %u uA/bit)\n",
+		client->name, rshunt, current_lsb);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id ina233_id[] = {
+	{"ina233", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ina233_id);
+
+static const struct of_device_id __maybe_unused ina233_of_match[] = {
+	{ .compatible = "ti,ina233" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ina233_of_match);
+
+static struct i2c_driver ina233_driver = {
+	.driver = {
+		   .name = "ina233",
+		   .of_match_table = of_match_ptr(ina233_of_match),
+	},
+	.probe = ina233_probe,
+	.id_table = ina233_id,
+};
+
+module_i2c_driver(ina233_driver);
+
+MODULE_AUTHOR("Leo Yang <Leo-Yang@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for INA233 and compatible chips");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.2

