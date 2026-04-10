Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97EC31AABF
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804537; cv=none; b=UbUeTuhLZoarMx7QmDyMIhRBvW8iG1559TGLbOhDYcAdFnUO6kBTG54Ck00SIK9tC6jb4zLywic98z43sF2sFk0bztMnTlk5jo1ny3gRHeauukmj+oKjgjknagHPM/8LMXU9SbtN7dFKZPxiBtWOeUSS2/K8aYc/4yP43/WRtmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804537; c=relaxed/simple;
	bh=ygE78m4z5+HlIIpSBrnoyMIdAegNd+iR1qUt9v5wiuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kaYKgOEfqCs+RlQ1wkuliCET3LdkdTlMODEc1D37sjR2K+W7uzPX1ZPv9ti45EYcumA8/hpchVmxCIcVS3JC4XfytRvIBF0zNJSNtEJM+nVSvRASCH+Y5ZTCw4iYvPyuExgqAe4WeXk1EyPtMqu59S5r5nA+BTVKexRDLQcm/Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fc7kQuIj; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fc7kQuIj"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c206f0481so1778491a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 00:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775804535; x=1776409335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10khucMFgM3lnQ2iprel6diABOkMyNCnupGvTH2n+0Q=;
        b=fc7kQuIjajBNU5ioWzTCvSOQ5TmSQpI4OpnXiGployYrKg5xB/hm+Jx0Z70bvSEb4B
         98S1SUEDrH3VELWEBKlK4AjJ3MCJ0V2vrsTcG8trgIwKIaT+KhTt5QFUBFWt4H76vwkX
         TabUZjsPfejjNjSahswliVLsOhgZPuslOEHVHj4T7MqRMkVAEZhYfPYtAg/ParJZSX5r
         jeAg3IUO+7VaLC+G3qSVFm3rUeEA3rh9znydNi/DvZcYjoLP0EU9XOimpFjV1hKoLiKs
         Hh3HXZYpmy7MSFXDUY2gQdJEhnSWCIQPIPDVvw1k4KGi7spmTg8DHS5lo1DIDVTyV7Ct
         7dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804535; x=1776409335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10khucMFgM3lnQ2iprel6diABOkMyNCnupGvTH2n+0Q=;
        b=JEa0oLLfmvYLC7DI3U6JoZYOGX5TDGI0TtyY+QhRYsKx1LiOg9gR5qhvTIyzsdom0F
         6PjwpZpgJrPp53VIvzPw/b2onsEkuIadO+1v34QVljFh2g+TZDAZG1aGrwRBV6sURpxl
         Ers6Jx0CnEZ0Wfv7nX8SBCjR2zcrd58VF2DZGeXZljsX6XNI7EKbbFg9a1pGKi0q7UfW
         kLoDRljWJYw4S2zVXouB3x7i7zUfD4rlMnUvOu84VK4ji70gYQOkJg9wOlObBWt4fYu9
         HKY6r/E616+rNVKaYM1IdYhvN//T3eldJNKfAoKZYOYHSv2b3z2ZeKqlfWB0XMlBKzf8
         YbnQ==
X-Gm-Message-State: AOJu0YxO984ZMy4RfXUIq8Z1B8I6kN+2oi5MFcjUi8ONbmk2MoNWuZDk
	wsv5RaPUpsO6YYdpxhKw9TeO1hhLPQwlxCTTvXPotNyg4BjcBVxA5g0T
X-Gm-Gg: AeBDiet1PV9R5r6tS8jAtlQzxcNsMJHNpJagMVPG7tZYNs9VT+WuWFVB9EJmnoK8AX2
	Lzw5YIir6OjsoGQdkvqW4U3+LZajvm/H7ZK4zgEZcxEopKS3CpOZ6Q2yk1E6hay0AtOuqRJgyOi
	n17IJ8nXF/AFuiVGciLlmRuIXOVvL32ox1ACezg2KQOqGFw3N17HJ3ZvbNPG/cjnZfXZIgfkuv+
	BnhQh4K9Jie7ZroH79GXLgzoBHDxEXkSNvO8vdE9Kl5PCvCogkUJ/gU98309TZXZyI9cKP8e78w
	gIJ5RHceKkCs6nqdXbWBiZ7KlodqManlYp9cgwyYWZnJFkcq4e50W+4dky05VMRpepxtwNSXh+A
	aG/NgyznY9iJ/T27LxoOckeeQ63IZDdW/FyYkY6Hks54qj+K0VKSUng1cy7p32Bh3g+lrKj0HgV
	H0Xo0qLPRbKrB5u+1RsY2DMpPd7VKCZKHQrtTmarzlx0uNEg==
X-Received: by 2002:a17:903:2ac3:b0:2b2:6df1:1112 with SMTP id d9443c01a7336-2b2d5a7a85cmr20304005ad.40.1775804534937;
        Fri, 10 Apr 2026 00:02:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d025:c808:7be3:a746:1e98:3ec7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f09e85sm19310315ad.47.2026.04.10.00.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:02:14 -0700 (PDT)
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
Subject: [PATCH v4 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
Date: Fri, 10 Apr 2026 12:31:54 +0530
Message-Id: <20260410070154.3313-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
References: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
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
 drivers/hwmon/pmbus/xdp720.c | 128 +++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+)
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
index 000000000000..8729a771f216
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdp720.c
@@ -0,0 +1,128 @@
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
+	ret = devm_regulator_get_enable(&client->dev, "vdd-vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+			"failed to enable vdd-vin supply\n");
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
+		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000ULL);
+	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
+		info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
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

