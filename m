Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D897526E6F0
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 08:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874427; cv=none; b=XN1Mv631i6DT/KU6l2ETTDfwqqPQMekhxqMeGLTW7AbyHVmmvGS6Yyjls+JYRap7LdsLoVSV9DAo7v61oVeHqswEjGbWi8HdYtAK8G8BwxxOcCRnztRDtxv/yumB/qsJ1qpBX6xWbH3xT4T825CNytDKB/w2pAK3EsBi2cZO15Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874427; c=relaxed/simple;
	bh=xfg5IHhlH35XU3ltlYQ6cPANo4u0l8kAbNE/IRZ0EYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZL5Ngb28HddzEI6Si6uLbeqYk/SCwVt5WWoCaG+fDD12hi4/uVcePj4mvFJT1jB2k3vvmdKwISIcE9iVrTKwAcEYwvDF0JoSEQe2S3rgCm2bTpf2kXEpiQL7OC+6GHy9g5+MG3YMuCRXgh4MI1J1SsprrBIHey09nY6fcvVdqI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFo2CMV5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFo2CMV5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f0f875bc5so57338635ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 00:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765874423; x=1766479223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/14gatgYBec+oY++P+N9QdvIvgrwkA/SR4qiEmkfz0s=;
        b=UFo2CMV57P2FZInsWAxhfaP6sgAKTCIl2aW/8d3bj5k/jlL8l2ciNGCoh2B6hSxumx
         Cojsl2ap6oP2UPN+wqytE1VpO4iTG2rfv+TxSgDvzzZiqv6PXVmfFHF/17lCgBY/1RTz
         D1KnOBwCK3cqPLnfOvvlBWfLimdpBuvSifDsYZSqvfSLLI7RzRFG80Uiyqp9jD7bEBDE
         KDuaZfBMtLMZ1BoFDkhb7m/fYhbzGeiQifznLfTw6iNkt0wSy9kF4lcNZmTs7lzLSp0W
         TUkmpwr3kdTBl7uITjMh/RZ0iwLtODXuIN6sRkdMeYC4GSLJx19030mTxvT5Lw7N55tL
         wmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765874423; x=1766479223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/14gatgYBec+oY++P+N9QdvIvgrwkA/SR4qiEmkfz0s=;
        b=A9aWI2eBerK5D/NGrJqzgikxoa7xVBuhGXh0GO2KgcM0V8U6WA1cM94tasaiZKRXW4
         FbGTWEmOgNLQT+jRaN4ufDwUl+uXvtGZsBWdZWOTqVj9G4aidoaq49I6KxmkPqQlrMZx
         JriIYp44sfvEXV5uQIdC4dOo+F68Wx9QCJ1wecUSTZF2uWqIjm0R5fKbQGhLdjGqXap6
         KFjuwPckB5qgtGwM49dpY+YaR00uYiHGDh8z+TmpspGpmLDcY1tDh2Xksy+veLftwBIN
         BEqpx4CGuUpW6nMRblEw0fKTDqCfTfKYt/zFcNiqSJaLRtPijG/caYz//9mY5x6hnv0h
         dKjw==
X-Forwarded-Encrypted: i=1; AJvYcCWeFhoepZwp5laEqgYdyTbAxDS/4SudsG5gJZh2lldLf3pqYNL2EqoOPiGOc0O3cf4roZwfjfjcy/8Viw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy45qeMFcouFQ1WQ3rxowExziIRe0R5clMyuVIQTzsB5f53dRfH
	0Le5Unw2CQyyvB+FwJTXnKdllDhl46dfSvDlX0IjpFe6mJi2nMVqUUMo
X-Gm-Gg: AY/fxX5TkEK8xUguq80hiXvuca2zpgaeo+/T+w5XB2opYLV4I82BbpM4Mn1mJFpQIA3
	4Ykcqux3n4apPPGoLnpF1X+Tl8pyZx+C+ZGXeduiWZntR4hWOzRSzctsJpgWeQWwRMM8ytilhQ2
	VxoSGH3ktRgNCZGB1L2Utv6V0w7Z/FThflGAVlPbqMGH8eJ4yv/wzeZRHW7vFSWToDlZOniK7II
	PpdZIX9uFbu+Be1OSiJnU5flidUsEA8A/x5LWx+2BHDl73no/+cSJLCpzbiUdG+W+vf4fsZ3UMA
	KpNOpaFnCOkJikcvRL5djH14jxvQyuLayqDmShKmjwMwd8Lqjy2KYdrS2Y8cjiQD2xIZwL8sqZ1
	ncFgnITCe5MLOaI6CppPOdA4ZJpotSuYjsNpIMr+khGm0rgTDL7Bs1eHYpMhTXpiB3TX4JprgZO
	Vdp+iHZqgUjj+keDJWyR1jG0InHk+oNPKOXDwfnsc2N0RyFj3caOX3Ibp5ym0pqPtLe6OhqwOsr
	1iEHOlQ6of24zJe0Ra+tktoNJozz0k=
X-Google-Smtp-Source: AGHT+IFM7X1RPPMpV59Yaj3jD7x/Jp+lRBXbbAH/ZX2YgkfeHTBlJ/0W1If7BqmmUFvgEesvU9XdNw==
X-Received: by 2002:a17:903:190d:b0:2a0:941a:6b08 with SMTP id d9443c01a7336-2a0941a75bamr109046495ad.21.1765874423470;
        Tue, 16 Dec 2025 00:40:23 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b37417sm155060205ad.20.2025.12.16.00.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 00:40:22 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH 2/2] hwmon: pmbus: add support for STEF48H28
Date: Tue, 16 Dec 2025 16:37:12 +0800
Message-Id: <20251216083712.260140-2-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216083712.260140-1-hsu.yungteng@gmail.com>
References: <20251216083712.260140-1-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for STEF48H28 hot-swap controller.

Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
---
 Documentation/hwmon/index.rst     |  1 +
 Documentation/hwmon/stef48h28.rst | 73 +++++++++++++++++++++++++++++
 MAINTAINERS                       |  7 +++
 drivers/hwmon/pmbus/Kconfig       |  9 ++++
 drivers/hwmon/pmbus/Makefile      |  1 +
 drivers/hwmon/pmbus/stef48h28.c   | 76 +++++++++++++++++++++++++++++++
 6 files changed, 167 insertions(+)
 create mode 100644 Documentation/hwmon/stef48h28.rst
 create mode 100644 drivers/hwmon/pmbus/stef48h28.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..c682751a1fe3 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -233,6 +233,7 @@ Hardware Monitoring Kernel Drivers
    shtc1
    sis5595
    sl28cpld
+   stef48h28
    smpro-hwmon
    smsc47b397
    smsc47m192
diff --git a/Documentation/hwmon/stef48h28.rst b/Documentation/hwmon/stef48h28.rst
new file mode 100644
index 000000000000..058de12e979f
--- /dev/null
+++ b/Documentation/hwmon/stef48h28.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver stef48h28
+======================
+
+Supported chips:
+
+  * Analog Devices STEF48H28
+
+    Prefix: 'stef48h28'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.st.com/resource/en/data_brief/stef48h28.pdf
+
+Author:
+
+  - Charles Hsu <ythsu0511@gmail.com>
+
+
+Description
+-----------
+
+The STEF48H28 is a 30 A integrated e-fuse for 9-80 V DC power rails.
+It provides inrush control, undervoltage/overvoltage lockout and
+overcurrent protection using an adaptive (I x t) scheme that permits
+short high-current pulses typical of CPU/GPU loads.
+
+The device offers an analog current-monitor output and an on-chip
+temperature-monitor signal for system supervision. Startup behavior is
+programmable through insertion-delay and soft-start settings.
+
+Additional features include power-good indication, self-diagnostics,
+thermal shutdown and a PMBus interface for telemetry and status
+reporting.
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data.
+
+Sysfs entries
+-------------
+
+================= ========================================
+in1_label		"vin".
+in1_input		Measured voltage. From READ_VIN register.
+in1_min			Minimum Voltage. From VIN_UV_WARN_LIMIT register.
+in1_max			Maximum voltage. From VIN_OV_WARN_LIMIT register.
+
+in2_label		"vout1".
+in2_input		Measured voltage. From READ_VOUT register.
+in2_min			Minimum Voltage. From VOUT_UV_WARN_LIMIT register.
+in2_max			Maximum voltage. From VOUT_OV_WARN_LIMIT register.
+
+curr1_label "iin".
+curr1_input Measured current. From READ_IIN register.
+
+curr2_label "iout1".
+curr2_input Measured current. From READ_IOUT register.
+
+power1_label		"pin"
+power1_input		Measured input power. From READ_PIN register.
+
+power2_label		"pout1"
+power2_input		Measured output power. From READ_POUT register.
+
+temp1_input		Measured temperature. From READ_TEMPERATURE_1 register.
+temp1_max		Maximum temperature. From OT_WARN_LIMIT register.
+temp1_crit		Critical high temperature. From OT_FAULT_LIMIT register.
+
+temp2_input		Measured temperature. From READ_TEMPERATURE_2 register.
+================= ========================================
diff --git a/MAINTAINERS b/MAINTAINERS
index d701a4d5b00e..be6b6e9ee79b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24665,6 +24665,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/st,stc3117.yaml
 F:	drivers/power/supply/stc3117_fuel_gauge.c
 
+ST STEF48H28 DRIVER
+M:	Charles Hsu	<hsu.yungteng@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/stef48h28.rst
+F:	drivers/hwmon/pmbus/stef48h28.c
+
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f3fb94cebf1a..29ea8ba98b8b 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -576,6 +576,15 @@ config SENSORS_Q54SJ108A2
 	  This driver can also be built as a module. If so, the module will
 	  be called q54sj108a2.
 
+config SENSORS_STEF48H28
+    tristate "ST STEF48H28"
+	help
+	  If you say yes here you get hardware monitoring support for ST
+	  STEF48H28.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called stef48h28.
+
 config SENSORS_STPDDC60
 	tristate "ST STPDDC60"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 349a89b6d92e..b2497f1d7bd9 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
+obj-$(CONFIG_SENSORS_STEF48H28)	+= stef48h28.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
 obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
 obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
diff --git a/drivers/hwmon/pmbus/stef48h28.c b/drivers/hwmon/pmbus/stef48h28.c
new file mode 100644
index 000000000000..df7f7429162b
--- /dev/null
+++ b/drivers/hwmon/pmbus/stef48h28.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for STMicroelectronics digital controller stef48h28
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+#include "pmbus.h"
+
+static struct pmbus_driver_info stef48h28_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+    .format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+    .format[PSC_TEMPERATURE] = direct,
+    .m[PSC_VOLTAGE_IN] = 50,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.m[PSC_VOLTAGE_OUT] = 50,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.m[PSC_CURRENT_IN] = 100,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = 0,
+	.m[PSC_CURRENT_OUT] = 100,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_POWER] = 9765,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -3,
+	.m[PSC_TEMPERATURE] = 25,
+	.b[PSC_TEMPERATURE] = 500,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
+	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
+	    | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT
+};
+
+static int stef48h28_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &stef48h28_info);
+}
+
+static const struct i2c_device_id stef48h28_id[] = {
+	{"stef48h28"},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, stef48h28_id);
+
+static const struct of_device_id __maybe_unused stef48h28_of_match[] = {
+	{.compatible = "st,stef48h28"},
+	{}
+};
+
+/* This is the driver that will be inserted */
+static struct i2c_driver stef48h28_driver = {
+	.driver = {
+		   .name = "stef48h28",
+		   .of_match_table = of_match_ptr(stef48h28_of_match),
+		   },
+	.probe = stef48h28_probe,
+	.id_table = stef48h28_id,
+};
+
+module_i2c_driver(stef48h28_driver);
+
+MODULE_AUTHOR("Charles Hsu <hsu.yungteng@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for ST stef48h28");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.34.1

