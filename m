Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF25324B1F
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498883; cv=none; b=PBr6X8Kqg1AA22ZiW8w6G7iqo1CUDGaaiRHVzfx8kmYzQcsYNkvkP2BeLK+4B3/5r5BO/xprmtdG2SadcR3uKAGW4Vc6shl6mQuozUQ+PaHSguozrede0pRUdogLIh4pvj1o3YKUBFEP2Qx3rCsN5z5W2KUJhRUCGoQohNzs0dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498883; c=relaxed/simple;
	bh=skgvFjJHMlRkWo3prizBsBkUFGQTiIkbcAlgk0nIVlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tHgAaRXpRX+Zi8E9WjFhOS1DQSzJ2cMPRNzvA6DNTo32QLpyM9NFHtk+tRBJfe5ItVPUcMZqy7uiGsaoEkjWC8cnpGActXVwZzUTKO0YE7O9nHh/L4PpjOFLU/DqBcc0a2fst+qGGGni3Yg4cYgdOMwh+hU/VTGzqgwnJNq3kT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOzzsSIq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOzzsSIq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a871daa98fso5029665ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 03:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771498881; x=1772103681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAX16mjprYtf6YC1ox8d1Sd0Pel8V9yDH1WEINK3oK0=;
        b=nOzzsSIq2L+qBIVEd4rRQK/9diQrdaKDcqNymbTc+fLrvEH5xu4IrTKkihhsLsQFVp
         QiZ1YPqzZCyrJSSYXuLuvibqwFZG0QvdrM78GqF7ZAShc7sre/QZY2uYRwpZAeM0yHSD
         1zyOOUhPHoXRJiFjGhQxsYvhy9oOUboAqzRkIIijIfKtnGgmLTdJwG9zOP5BHN7VQR4k
         1R1tizSBMcGJq8k4us5J/r9hHHMxDP1oq8S3eWgiZyIe9d4pDyWXqwYVrt/L1l6kvsaS
         aQuFMNLqO14DinIL0BAoif7J6VvBC8HkmeZV/HnAbZRGuSwU6tdntpsH8vlY6O4czi4B
         N/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771498881; x=1772103681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAX16mjprYtf6YC1ox8d1Sd0Pel8V9yDH1WEINK3oK0=;
        b=bk7lfgKQg2RRf87/cz+hd7QmdcwGGbHCMeo/uvrtOPSRcM10/G4Be1Bhl8h27Cw3Pe
         wYRMr/GsalkNlOYIB4ne91CfZbM+udBQSKMSbgM9Kh+qOEAUW5Cbxt0gzmeWxMXGwmPL
         MmG3kUiTly71fRw1LVy8ngAaG3FQVHYjB6iiHHFQQRCpm9kWCnJ4IvH0XjB5nWfCAKbP
         tu0ThnCrZCYbelihkPhajvypCyEIBxPkcF+o0qilh7QScTAypdkOM2cclY0vBDu7iYcG
         1M0JFsHCpon6MM10pWp96H28lls2chByTqn0VdiiLmmf6vZFsxTdnaW3M+AVX/NOfCA7
         XGMA==
X-Gm-Message-State: AOJu0YzHCcCBDODGiAIPub/yVHqD8phSxAdJmhuiEkjxGICLr3NJyuk2
	LbnNZe67g+bA+hBIYbptY7H6DTWy1y0CbB/TKg1TW1yiHsslfjsqPJ8m
X-Gm-Gg: AZuq6aK7SpHyD/qHjafR6p02xDbydsdDTeN6YYTL/8WeYi5WpMpzo4C0QrXL36WWoJp
	+IPZwL48TfVUzbzhm3en3EmldvFVezq8dAbEOHtM7TH25aX6DrRuUyfndK0gT5lyrN3JsJj8933
	nEkhGeZZ6fG1BjNHxrAaZ5jyRBpw4/fB4Bd7PiwQJVKM/l0vQ3NfvPUKMNORAhvtfhUlQFEI0mB
	IBoyYf5CXuYYAoqbZlcweoyoJC1uSk+bDtU8pB4tZHmRglb6f2SnuIm+VsHpvXKnm3bhxqRlLjA
	Mw52QsWemhPV4TpGlD3ton9gNyzMVV2j7y84+ggPQPNk7AAslkFUomBQIX/fRNTAeex8oZ0YIDY
	0t3ZzhToiQ9WXY3dtfDU917jvT+vnQHKIr3+MDt0PpO70cz9AAU33ag/3Fep9rlBSrAyu+Xw3jX
	F/4xc1/2x42wFeRLf7QR6OdTEYprEnh2ZHpDbnud4ZIr67p9CeHwOE6qDh
X-Received: by 2002:a17:903:8cc:b0:2a2:ecb6:55ac with SMTP id d9443c01a7336-2ad17433389mr185284915ad.7.1771498881116;
        Thu, 19 Feb 2026 03:01:21 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:939b:3231:1953:3f2f:aba4:9c8a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadd9e8sm164339745ad.74.2026.02.19.03.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:01:20 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v2 3/3] hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g5b/7b controllers
Date: Thu, 19 Feb 2026 16:26:30 +0530
Message-Id: <20260219105630.11929-4-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260219105630.11929-1-Ashish.Yadav@infineon.com>
References: <20260219105630.11929-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
XDPE1A2G7B controllers.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
XDPE1A2G5B and XDPE1A2G7B support both Linear and NVIDIA PWM VID Data
formats for VOUT_MODE.
The configuring both loops/pages of the device independently is not
supported for VOUT_MODE.
In case of vid mode, NVIDIA PWM VID vrm_version is supported:
Vout = 5mV * (VID-1) + 195mV
---
 drivers/hwmon/pmbus/Kconfig      |   9 +++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/xdpe1a2g7b.c | 120 +++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fc1273abe357..a4513fc6bc26 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -711,6 +711,15 @@ config SENSORS_XDPE152
 	  This driver can also be built as a module. If so, the module will
 	  be called xdpe152c4.
 
+config SENSORS_XDPE1A2G7B
+	tristate "Infineon XDPE1A2G7B"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  XDPE1A2G5B and XDPE1A2G7B.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called xdpe1a2g7b.
+
 config SENSORS_XDPE122
 	tristate "Infineon XDPE122 family"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d6c86924f887..d592d8c77bec 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
 obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
 obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
+obj-$(CONFIG_SENSORS_XDPE1A2G7B)	+= xdpe1a2g7b.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
 obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdpe1a2g7b.c
new file mode 100644
index 000000000000..e10bafeb0984
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon Multi-phase Digital XDPE1A2G5B
+ * and XDPE1A2G7B Controllers
+ *
+ * Copyright (c) 2026 Infineon Technologies. All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define XDPE1A2G7B_PAGE_NUM 2
+#define XDPE1A2G7B_NVIDIA_195MV 0x1E /* NVIDIA mode 1.95mV, VID step is 5mV */
+
+static int xdpe1a2g7b_identify(struct i2c_client *client,
+			       struct pmbus_driver_info *info)
+{
+	u8 vout_params;
+	int vout_mode;
+
+	/*
+	 * XDPE1A2G5B and XDPE1A2G7B support both Linear and NVIDIA PWM VID data
+	 * formats via VOUT_MODE. Note that the device pages/loops are not fully
+	 * independent: configuration is shared, so programming each page/loop
+	 * separately is not supported for VOUT_MODE.
+	 */
+	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
+	if (vout_mode >= 0 && vout_mode != 0xff) {
+		switch (vout_mode >> 5) {
+		case 0:
+			info->format[PSC_VOLTAGE_OUT] = linear;
+			return 0;
+		case 1:
+			info->format[PSC_VOLTAGE_OUT] = vid;
+			vout_params = vout_mode & GENMASK(4, 0);
+			/* Check for VID Code Type */
+			switch (vout_params) {
+			case XDPE1A2G7B_NVIDIA_195MV:
+				/* VID vrm_version for PAGE0 and PAGE1 */
+				info->vrm_version[0] = nvidia195mv;
+				info->vrm_version[1] = nvidia195mv;
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		default:
+			return -ENODEV;
+		}
+	} else {
+		return vout_mode < 0 ? vout_mode : -ENODEV;
+	}
+
+	return 0;
+}
+
+static struct pmbus_driver_info xdpe1a2g7b_info = {
+	.pages = XDPE1A2G7B_PAGE_NUM,
+	.identify = xdpe1a2g7b_identify,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_STATUS_TEMP |
+		   PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
+	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_INPUT,
+};
+
+static int xdpe1a2g7b_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+
+	info = devm_kmemdup(&client->dev, &xdpe1a2g7b_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id xdpe1a2g7b_id[] = {
+	{ "xdpe1a2g5b" },
+	{ "xdpe1a2g7b" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, xdpe1a2g7b_id);
+
+static const struct of_device_id __maybe_unused xdpe1a2g7b_of_match[] = {
+	{ .compatible = "infineon,xdpe1a2g5b" },
+	{ .compatible = "infineon,xdpe1a2g7b" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, xdpe1a2g7b_of_match);
+
+static struct i2c_driver xdpe1a2g7b_driver = {
+	.driver = {
+		.name = "xdpe1a2g7b",
+		.of_match_table = of_match_ptr(xdpe1a2g7b_of_match),
+	},
+	.probe = xdpe1a2g7b_probe,
+	.id_table = xdpe1a2g7b_id,
+};
+
+module_i2c_driver(xdpe1a2g7b_driver);
+
+MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDPE1A2G5B/7B");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

