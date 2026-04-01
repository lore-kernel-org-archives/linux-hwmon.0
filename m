Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D03F65E1
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 10:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040512; cv=none; b=h1rv2iDUCrrnd1Pc5IdE+VHTPuXhPh+kXKuyHvQmFhL6AYEV4PM2DdkloCi5zFsUacZZkMAxFeelIMa9q68OHC05MFw/cu89KUcr0khPlSWJ3Gc3C5T56mSK3Qtzq113Jka6nBKOdmyGAMjd+xzdzlWEzigX5E5rIQP7L5v5mrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040512; c=relaxed/simple;
	bh=WnmubwbV6TBKf+05v/YU+a5eIg/UTf1BQTB4xnDaMwo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EGxOJCy9+iBnXbZUag6tdB78ZLrLrtbjZg4FBx1Ph92kMX/oFXdSr52L/bFKdO1PxiwBpAjGmv1/1nGb04RXDXeitx1TWqkO2ItG4dRhny8eJrKc/NW8TmHor29B9BlmF3a/ywbxVygbHBqeTVuboCffaGqGM1eRDqs3OmstkmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPVHYpTC; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPVHYpTC"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82a7539851fso3063348b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 03:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775040510; x=1775645310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgoUalx4qhZodxeYtn1WwXp1uA0k+Poskn9y/TOSsZs=;
        b=IPVHYpTCXyydt9m5wywhkUx7avJTfoya0p9wFviKFNdWMydjpFpnSNVFVdp625L7tC
         IIyg8y0/PHYKHwsPCzqaBU/QSQFfCvkic2RFX8jn/tLjFjVi2KT3BFLzc85Mrf0t/K8A
         D1vzYTvUEPzfbK2mOz48r26SY1TzQDJ0KmZyH3ZX/LXcEHl6cirPM0nLwn12nMGS4mGm
         LujhqfkMKe96PtTCoynL3p2uwfV9rJPSQ8qLfgQJqzUHndPf9+GqOWv8GS2Yvdd+Mg6l
         vEOYNz8/Srr/LJnkRc49CjW9XrfNCTDtZtIeYWsUqPwuiVKwyU2P6FtIDrjlqv78t/xp
         bJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775040510; x=1775645310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sgoUalx4qhZodxeYtn1WwXp1uA0k+Poskn9y/TOSsZs=;
        b=RkDjJQ8mEDGFAtWI0Ay7/GCz7/udffEnDL6K7MWu4GLI3NLMYmnSWqEE5U1JnvdMmG
         oPgqM6HOPHLyTl87iYHi5Fa5SW+vs8sVc5onSE3LYbUBZ7azxPXfpCmEJ4jQB2aIVccb
         yrbkjxhKeT/8cz8cn8vU1nMjDVDzOmWpXCbTVlaU671cn1G36QM+p85XJU1YXdl6lKv5
         bFZR1rB7rLmlmpIgInjyvFCGGgCxQp8fgBgY3orkRO551WjYVNdxXOgSz9ZqLyPmoxSc
         hVgUDFj8jBGs0QldxPCc0SMrNxuvFzohXQu3egFCoK0SgxLbTdB7v2K6QsezWVIkf1Wg
         WBmw==
X-Gm-Message-State: AOJu0Yz7CB9Z3yur+lkafWMP0nFZ/zEW0lX5987/Srxsw1r18K+jSJcB
	FHZeNCTnEQHE8QQYxPAE0f3ni75QLuJm3G5PD7Zh4PDK5znJWaI055b2
X-Gm-Gg: ATEYQzzzO6XR/5jM1c3cXpJuAcHz22dW8WGP1oEO8nSpso+NYLHKusji0xOaYNRV/zA
	RTZ7AT5Ju3Tvlf6DpFCmrZCnSghkm8Va7u901jfVknZttxlKX20G61wKk7Niot2bv8RVHKaMWXQ
	tQq8NyHD5OezgZrCmFHcHvNV1DCTQfNkQxLtp3OljsrP6T4jMIMviV2MaVR/iA957AUdJ6GroSc
	1a7GBmU0maLqX1KyQz2OPrHNIYbMWuA+IagPjRkipX+rkXlCNAEhMmohDLzW8mH3bIo9EX93BEl
	MiyUiG12u3MYJiOJ5U8M8R92idRXxNP2X3kcb7zoPnA35+BeR8OW+hxw/6TdVZJ8DkETjyUsYTz
	wK2TqOGUS5aPDieowHwDRuNvwv4kdppi3Kopq8b5y5WV7aW1k/HxLlONnHVCPAmeF5+moLhQScj
	bT4GC/tn1U5XYTYwPJjObP1fKuWfT5wuIf1cwqFR6p
X-Received: by 2002:a05:6a00:4fce:b0:827:3e27:161f with SMTP id d2e1a72fcca58-82ce8943bbamr3330711b3a.2.1775040509555;
        Wed, 01 Apr 2026 03:48:29 -0700 (PDT)
Received: from localhost.localdomain ([27.61.46.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b818sm17010259b3a.6.2026.04.01.03.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:48:29 -0700 (PDT)
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
Subject: [PATCH v2 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
Date: Wed,  1 Apr 2026 16:15:50 +0530
Message-Id: <20260401104550.115715-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
References: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add the pmbus driver for Infineon XDP720 Digital eFuse Controller.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
XDP720 Digital eFuse Controller provides accurate system telemetry
(V, I, P, T) and reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf

The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.
---
 drivers/hwmon/pmbus/Kconfig  |   9 +++
 drivers/hwmon/pmbus/Makefile |   1 +
 drivers/hwmon/pmbus/xdp720.c | 123 +++++++++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/xdp720.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fc1273abe357..c419e3ecce90 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -702,6 +702,15 @@ config SENSORS_XDP710
 	  This driver can also be built as a module. If so, the module will
 	  be called xdp710.
 
+config SENSORS_XDP720
+	tristate "Infineon XDP720 family"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  XDP720.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called xdp720.
+
 config SENSORS_XDPE152
 	tristate "Infineon XDPE152 family"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d6c86924f887..1cac7ccae79f 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
 obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
+obj-$(CONFIG_SENSORS_XDP720)	+= xdp720.o
 obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
new file mode 100644
index 000000000000..382dc3f9ce80
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdp720.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controller
+ *
+ * Copyright (c) 2026 Infineon Technologies. All rights reserved.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/of_device.h>
+#include <linux/bitops.h>
+#include <linux/math64.h>
+#include "pmbus.h"
+
+/*
+ * The IMON resistor required to generate the system overcurrent protection.
+ * Arbitrary default Rimon value: 2k Ohm
+ */
+#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
+#define XDP720_TELEMETRY_AVG 0xE9
+
+static struct pmbus_driver_info xdp720_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 4653,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.m[PSC_VOLTAGE_OUT] = 4653,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	/*
+	 * Current and Power measurement depends on the RIMON (kOhm) and
+	 * GIMON(microA/A) values.
+	 */
+	.m[PSC_CURRENT_OUT] = 24668,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -4,
+	.m[PSC_POWER] = 4486,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -1,
+	.m[PSC_TEMPERATURE] = 54,
+	.b[PSC_TEMPERATURE] = 22521,
+	.R[PSC_TEMPERATURE] = -1,
+
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int xdp720_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	int ret;
+	u32 rimon;
+	int gimon;
+
+	info = devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
+		return ret;
+	}
+
+	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
+	ret &= GENMASK(0, 0);
+	if (ret == 1)
+		gimon = 18200; /* output gain 18.2 microA/A */
+	else
+		gimon = 9100; /* output gain 9.1 microA/A */
+
+	if (of_property_read_u32(client->dev.of_node,
+				 "infineon,rimon-micro-ohms", &rimon))
+		rimon = XDP720_DEFAULT_RIMON; /* Default if not set via DT */
+	if (rimon == 0)
+		return -EINVAL;
+
+	/* Adapt the current and power scale for each instance */
+	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
+		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000);
+	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
+		info->m[PSC_POWER] * rimon * gimon, 1000000000000);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id xdp720_of_match[] = {
+	{ .compatible = "infineon,xdp720" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, xdp720_of_match);
+
+static const struct i2c_device_id xdp720_id[] = {
+	{ "xdp720" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, xdp720_id);
+
+static struct i2c_driver xdp720_driver = {
+	.driver = {
+		   .name = "xdp720",
+		   .of_match_table = xdp720_of_match,
+	},
+	.probe = xdp720_probe,
+	.id_table = xdp720_id,
+};
+
+module_i2c_driver(xdp720_driver);
+
+MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Controller");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

