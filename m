Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331F13161AA
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554023; cv=none; b=r/58uiFO1NNnzH9+LGmGXOew/1X0B5iY76VMiYnK0eqapnty4AtyANDLBUpmTzMPqTZ+S0zYY3g+K6MvDVUhGkB7MCJbuROKqPSGgVJ+y4pRnC1ejPic1iPoaoEj6OMsUfYvlV5BiDNOCs0z7FHvFHI/8V/DbyR/g2Q0Fpd/6/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554023; c=relaxed/simple;
	bh=KdFqC8uQZdpEprq83ekWPGYeqVIIX8UiHw1f0P4UfUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZS8bwXM6q3bAsZWEQi2uWg88/qa1CTVi9xa5GMeGqOB4WC1PHV+Em3EhOHtbTE0JU2CTeYSPsTqrq10MFRLo8rUE9iiS7ZJmsDKLK8btPV5TsLRbM5IXabK0OluwJIfFL9CR08jR6RDXcfR9tF9G1dZDtpo29SOmfWPGIkEqH+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Glizmiw1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Glizmiw1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0a95200e8so12079115ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768554019; x=1769158819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJLBOQnDjNb5TbyRhJaSYj/W0V51LDq0L61uS0oktyg=;
        b=Glizmiw1polfR0zCdBvj58FP3jQ1JUrjY8b5Ojw/Fq+muMxFBhbXtNll59zOBhmIaQ
         WLdMggOKS9JsqnJrEsCSxaMoYKqE+LS5vbQDnXkeosCCFjQzywRwOlDPz3coplw+/3vC
         SC9NI0pPGygSU/phuLZPg9cgRCDonbLjJgmz6cqlCcPkqnt9in1//utInHY+xtTBai7f
         UQWERGMmfGI6jUQtiXf3dEfO7ADVAMhfK9q387zLpP+TKG/XmLk6MARqMUW99OQ/24Nq
         n52V6elOQJlHf//DPWeSgzR+CkQDCIgZN5tWxSly7jYyDdvqx/z9ozkBNovPGv+mVWch
         eNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554019; x=1769158819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJLBOQnDjNb5TbyRhJaSYj/W0V51LDq0L61uS0oktyg=;
        b=PHeq2McPacSJ1q5TtWqjurr32WmacjXihVfvcoS2wDnrIj1CEMdZQiFFGfe/vwU9fZ
         xYjRVkj9zufQ09AEO4dEszUDzqnHoDbCycmXhxvXBkN4N77QdIRfAfyB9dQAX/P1Q7GA
         IWUBbh92pFpT/FbpyCzsJ5cyxSvV4gMJUrS+bfACMN0FOeuMXKpqSby6C7bPS91i+GTz
         b7llL+EQ6xTgSTI6wRMJ7zAMMndRRyewutdYVIM37xxW53hHbkZKtqfs5YAlDxuJP6jl
         R4dNbZXrN1/twDrOyBNN2dmn9q+QGsteotD2k/U5xVnJLXoLiVRBQ+Fu3T8MW0z92pd6
         AhMg==
X-Gm-Message-State: AOJu0Yx2uqJdm35h2Z2IvB/Mo9D9dLB+lNcrcnUElD6h/vc2xvnPhifn
	areJaVl6kaSKnW1tMt/xijRmq6U730Rw8ZVk+9Opg6q1w16HeVlwwb0Q
X-Gm-Gg: AY/fxX4pF0prexO5Jv24mDisFZjqs2PSbQKgVLCwjqjldRo3/3HGXlVK7HGOBnw8lQR
	UbDkQTJGLDO0mPHFe0djpJYuHHwsUZPn/Klg14IhCXCUnA2jFgpX7GYA0VnVxmXm3E1wGQUgjIz
	z8AjUATrAv2+NadxP6mgQbhmYKY7V2cGcRZia74kpzqyWl4uccX7F/cIxYOZufmjOUluFFNu6/l
	PQ9UHbicwyaaxsLSOx8NH4waPout8lrUyCmGKsvqRM2IJ40hP5IJobDsTOKt927Scbn6v7m8OVR
	8GyboGtX5GSsKX8qYkVdj+OF9SAVXAn7+heicP35BVHkBM++Ypri2L5YCVaK++kTnd2WtYzyi7d
	+02kXy86CkrlltIaHmK/5/vwsV3Ljlpz3EP5DqdYlZXjnTCo1olb1cYsipAB24y9ikVkCVy+N82
	/+GYxVlZ+ST70GbnZGZ+QHOd0ZuWgYoV9RRo5Y+dp1i+aZmNmFCd7IO8hEfKbQA5TOr0D78D/XA
	5Fv80qV1UorHVQ22H769TtGe+5Nh3o=
X-Received: by 2002:a17:902:d492:b0:2a0:8859:3722 with SMTP id d9443c01a7336-2a717532f61mr21394035ad.25.1768554018309;
        Fri, 16 Jan 2026 01:00:18 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941b915sm15304445ad.90.2026.01.16.01.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:00:17 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v6 2/2] hwmon: pmbus: add support for STEF48H28
Date: Fri, 16 Jan 2026 16:58:02 +0800
Message-Id: <20260116085802.696661-2-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116085802.696661-1-hsu.yungteng@gmail.com>
References: <20260116085802.696661-1-hsu.yungteng@gmail.com>
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
 Documentation/hwmon/stef48h28.rst | 73 ++++++++++++++++++++++++++++++
 MAINTAINERS                       |  7 +++
 drivers/hwmon/pmbus/Kconfig       |  9 ++++
 drivers/hwmon/pmbus/Makefile      |  1 +
 drivers/hwmon/pmbus/stef48h28.c   | 75 +++++++++++++++++++++++++++++++
 6 files changed, 166 insertions(+)
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
index 000000000000..00bef9e55651
--- /dev/null
+++ b/Documentation/hwmon/stef48h28.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver stef48h28
+=======================
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
+  - Charles Hsu <hsu.yungteng@gmail.com>
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
+=========================================================
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
+=========================================================
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
index 000000000000..4bde2215697c
--- /dev/null
+++ b/drivers/hwmon/pmbus/stef48h28.c
@@ -0,0 +1,75 @@
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
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 50,
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
+		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
+		| PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT
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
+static struct i2c_driver stef48h28_driver = {
+	.driver = {
+			.name = "stef48h28",
+			.of_match_table = of_match_ptr(stef48h28_of_match),
+			},
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

