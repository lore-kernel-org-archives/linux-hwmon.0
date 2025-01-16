Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12A718E76B;
	Thu, 16 Jan 2025 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018126; cv=none; b=KzeSBOvQnj6vAfC+05+7C056CmDj7aXMgvASngA8y78DABj7aqu/U4BM5d3IrDGvTEbj6oO8jFSGOCe97FlIt6piCHBAj/NMBgTvqXnB/Y/aWFUck+xdfQU86K7nJxpl72DLq7W8q6MlRqvIWT5MWONDd2+EaXi3HlJ+6xnZX00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018126; c=relaxed/simple;
	bh=u44McEvHIU28LB68CA45Rb/64CpIQbT26P7E4Pj1ABg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UgGhxyqo+bbhARNRQYvbm+vIIhm4G1mSlABLKJfhOZI5PhESyKmS+m/LDMO6kHv0Y9L7Qyko+pbNJDMzdFNqogfpP+yrCwGzLoixQN7OOAmqJTuTTVvox37mns4bSSJ5n+oMHxFkIZS+ke8Ll32IWQaQzCsyv3hC19jlfAb/anY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cc7rXc5H; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cc7rXc5H"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2164b1f05caso11080885ad.3;
        Thu, 16 Jan 2025 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737018124; x=1737622924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nIUSFIS0uWBmM3M9vDDeneETAqaQwFl9/J2J4QAztU=;
        b=Cc7rXc5HVO4FHnm8q2nf5POfXhBt3Zu6YJ7yBMrzCuDlubfAkYSGBmrySln+NRUeLb
         wRQ/fi5GQOu7h/nMN8Lw8q673hdyFtWEJpoHkJhDQ8J7EeNUiakqZnv7NM0a1BsV+K3T
         M68M/LUL2ayTcUBH8+Rb3ceZVaYc5JtgNMrwb4/hvulSMxF+orbmt2IIAZZFk1KaxSw6
         UHikh6isLzBvhjfo/WNy78inOG03y2Ky80uv1C54DP3Zj83XW+axW5xNU4pf6eZpyXGO
         IV/352L3qrOAUUSlPzmkl28sIb5YNs804IjWf/RLcUfqas45kDZZHwN0cRzZ2UnJNI/j
         XfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018124; x=1737622924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nIUSFIS0uWBmM3M9vDDeneETAqaQwFl9/J2J4QAztU=;
        b=W3oJEHeKi0Xg0M+yTdwTnA7QGaTAPotgL4bHA7J0URg/u5Jh96ZpGeWDN1RZxVbLg9
         6xxJyPVVrw1oAoihM1mAr8vPvqKeHRrmvsdU0ylESyESL+4bKnOe+iyWtfHLmfGO47YA
         MoWTzWgls3Bp3ASZ6HcyFkGPvl/kjyA6MEafdT1oenfU7TlmHHR9cUFZ04bjpyU+Kt83
         UYvK942dYCuTFibWZu3l5l7wgSOxi2omEKFjWvb2vTq0VW4Ypl7UiD2Q5ftp7mHsJoZP
         6L1sP86O7vv17DsR+fnIjuSHMgluG/hgQ2kKi8N/UzNNWxrfvkTDRRtnrKIfLFP4FW45
         LHmw==
X-Forwarded-Encrypted: i=1; AJvYcCUlIgcu3ZRBSxwoB26NqSlNpnqhedQ1+9plUvUdvY30k31tMUxYg6U31N1RuAjvgPGF65ThJV+IbwRj@vger.kernel.org, AJvYcCVdiuOBP7VTa+9hbge2+sanXx5mOzPYEu+W2Em4nAqrfUuTYL3m4ROaOadcBSh15/jiz5Nu5/iceWYgmmE=@vger.kernel.org, AJvYcCWlcuo+jXAbB8+STB+HaLdJ/j1OGEBuGQz9rYFT6zbPmdfmgqGVq9xAAtd1m7H9eZ9QarxLDIt0wsaAPbuu@vger.kernel.org, AJvYcCXLQNiZKy5yNPl7QpW+awRJ/sFoFs0mbkWi2BxQ/rLO7A47V/zpM/dIRXXDzm+YGaBs/PgnGOcNOXVg@vger.kernel.org
X-Gm-Message-State: AOJu0YzApWCkYgHYgHeQkZW8Mk0HGxwEy7oOCukYvkySIcwK/67I1ha7
	ge2YfrzdZJ1V9EWHefDH0mJJqlE4MaibBsPpUA3ccaiTkKra/ADw
X-Gm-Gg: ASbGnctnaZ0+vLePax56W86gr1MOd/1ZrAegoRJlXscgYw+pxCC6DYQvIy3Jyr0g4zA
	VKPXEHFRxl+GGTDuij2ww0y1n60ZUDEGRWTVVYXZghu5LzcncI6Zi1k1n3Vh5obPka72I2oThzL
	PTu2EkU0qvK5SPaVk6izqcL/FrGkxwfWyxP+WZLkBMqUzeikwHQwuUcqWNa/jH3/ZtahYsv9MP8
	jodMtCQPvAJ9Xrmcx7px0ydLsYV3ACGdy9r2mOpy/m08EpLGVDQ2c3EWyqS2AnQsAb6W0HIYoUE
	6HZSGWPV8U3sxrsSqfkXy0HOS7WGTtLgcQAFrA==
X-Google-Smtp-Source: AGHT+IHskLPS4e0S1JFYiKR+8cW1kHMtR1EFcw7JgfsRggS8aq8Dr0rh4fBJ93E7YZsxjklpAEPhzQ==
X-Received: by 2002:a05:6a00:ac2:b0:725:ea30:ab15 with SMTP id d2e1a72fcca58-72d21f7eba6mr43329177b3a.1.1737018123862;
        Thu, 16 Jan 2025 01:02:03 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40594a06sm10395721b3a.80.2025.01.16.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 01:02:03 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leo-Yang@quantatw.com,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Leo Yang <leo.yang.sy0@gmail.com>
Subject: [PATCH v4 2/2] hwmon: Add driver for TI INA233 Current and Power Monitor
Date: Thu, 16 Jan 2025 16:59:42 +0800
Message-Id: <20250116085939.1235598-3-leo.yang.sy0@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250116085939.1235598-1-leo.yang.sy0@gmail.com>
References: <20250116085939.1235598-1-leo.yang.sy0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver for Texas Instruments INA233 Current and Power Monitor
With I2C-, SMBus-, and PMBus-Compatible Interface

Signed-off-by: Leo Yang <leo.yang.sy0@gmail.com>
---
 Documentation/hwmon/ina233.rst |  75 +++++++++++++
 MAINTAINERS                    |   7 ++
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/ina233.c   | 191 +++++++++++++++++++++++++++++++++
 5 files changed, 283 insertions(+)
 create mode 100644 Documentation/hwmon/ina233.rst
 create mode 100644 drivers/hwmon/pmbus/ina233.c

diff --git a/Documentation/hwmon/ina233.rst b/Documentation/hwmon/ina233.rst
new file mode 100644
index 000000000000..42323162e6db
--- /dev/null
+++ b/Documentation/hwmon/ina233.rst
@@ -0,0 +1,75 @@
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
+Author: Leo Yang <leo.yang.sy0@gmail.com>
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
diff --git a/MAINTAINERS b/MAINTAINERS
index c575de4903db..ae67eeebd80e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11226,6 +11226,13 @@ L:	linux-fbdev@vger.kernel.org
 S:	Orphan
 F:	drivers/video/fbdev/imsttfb.c
 
+INA233 HARDWARE MONITOR DRIVERS
+M:	Leo Yang <leo.yang.sy0@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
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
index 000000000000..dde1e1678394
--- /dev/null
+++ b/drivers/hwmon/pmbus/ina233.c
@@ -0,0 +1,191 @@
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
+#define INA233_MAX_CURRENT_DEFAULT	32768000 /* uA */
+#define INA233_RSHUNT_DEFAULT		2000 /* uOhm */
+
+#define MAX_M_VAL 32767
+
+static void calculate_coef(int *m, int *R, u32 current_lsb, int power_coef)
+{
+	u64 scaled_m;
+	int scale_factor = 0;
+	int scale_coef = 1;
+
+	/*
+	 * 1000000 from Current_LSB A->uA .
+	 * scale_coef is for scaling up to minimize rounding errors,
+	 * If there is no decimal information, no need to scale.
+	 */
+	if (1000000 % current_lsb) {
+		/* Scaling to keep integer precision */
+		scale_factor = -3;
+		scale_coef = 1000;
+	}
+
+	/*
+	 * Unit Conversion (Current_LSB A->uA) and use scaling(scale_factor)
+	 * to keep integer precision.
+	 * Formulae referenced from spec.
+	 */
+	scaled_m = div64_u64(1000000 * scale_coef, (u64)current_lsb * power_coef);
+
+	/* Maximize while keeping it bounded.*/
+	while (scaled_m > MAX_M_VAL) {
+		scaled_m = div_u64(scaled_m, 10);
+		scale_factor++;
+	}
+	/* Scale up only if fractional part exists. */
+	while (scaled_m * 10 < MAX_M_VAL && scale_coef != 1) {
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
+	struct device *dev = &client->dev;
+	int ret, m, R;
+	u32 rshunt;
+	u32 max_current;
+	u32 current_lsb;
+	u16 calibration;
+	struct pmbus_driver_info *info;
+
+	info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info),
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
+	ret = device_property_read_u32(dev, "shunt-resistor", &rshunt);
+	if (ret) {
+		if (ret != -EINVAL)
+			return dev_err_probe(dev, ret, "Shunt resistor property read fail.\n");
+		rshunt = INA233_RSHUNT_DEFAULT;
+	}
+	if (!rshunt)
+		return dev_err_probe(dev, -EINVAL,
+				     "Shunt resistor cannot be zero.\n");
+
+	/* read Maximum expected current value (uA) */
+	ret = device_property_read_u32(dev, "ti,maximum-expected-current-microamp", &max_current);
+	if (ret) {
+		if (ret != -EINVAL)
+			return dev_err_probe(dev, ret,
+					     "Maximum expected current property read fail.\n");
+		max_current = INA233_MAX_CURRENT_DEFAULT;
+	}
+	if (max_current < 32768)
+		return dev_err_probe(dev, -EINVAL,
+				     "Maximum expected current cannot less then 32768.\n");
+
+	/* Calculate Current_LSB according to the spec formula */
+	current_lsb = max_current / 32768;
+
+	/* calculate current coefficient */
+	calculate_coef(&m, &R, current_lsb, 1);
+	info->m[PSC_CURRENT_OUT] = m;
+	info->R[PSC_CURRENT_OUT] = R;
+
+	/* calculate power coefficient */
+	calculate_coef(&m, &R, current_lsb, 25);
+	info->m[PSC_POWER] = m;
+	info->R[PSC_POWER] = R;
+
+	/* write MFR_CALIBRATION register, Apply formula from spec with unit scaling. */
+	calibration = div64_u64(5120000000ULL, (u64)rshunt * current_lsb);
+	if (calibration > 0x7FFF)
+		return dev_err_probe(dev, -EINVAL,
+				     "Product of Current_LSB %u and shunt resistor %u too small, MFR_CALIBRATION reg exceeds 0x7FFF.\n",
+				     current_lsb, rshunt);
+	ret = i2c_smbus_write_word_data(client, MFR_CALIBRATION, calibration);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Unable to write calibration.\n");
+
+	dev_dbg(dev, "power monitor %s (Rshunt = %u uOhm, Current_LSB = %u uA/bit)\n",
+		client->name, rshunt, current_lsb);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id ina233_id[] = {
+	{"ina233", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ina233_id);
+
+static const struct of_device_id __maybe_unused ina233_of_match[] = {
+	{ .compatible = "ti,ina233" },
+	{}
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
+MODULE_AUTHOR("Leo Yang <leo.yang.sy0@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for INA233 and compatible chips");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.2

