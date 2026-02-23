Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6A3191D0
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 05:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771823333; cv=none; b=ef77d39UGmiNmWYcZP2j1mBin0VW7WGS/vHvBMs7un3vg5TJnZ9ZlUlq8CvMTJHdSdE+iXa34eaeNFz2pO04GV7bC7c1HbKj4+KwLPGd/nLwp+H/EboMFqNVUftT0k7MvH71ClBjonfZYDm/KuVswVOfYLhfk4Z/1fb0VZiNS4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771823333; c=relaxed/simple;
	bh=e+mW3zhlowBdv8xSVZ5koh7vMaC9P+lItVLjWZo7nbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LTygQGb3R1JoUtpGpRW6PBNjqEkhuFHs5NYDkL0s5CelMYs5c7JhIDbXBV6hGvqifiQ9opITBddgpKkArO9ZChQc7139t7o3E0vrYIHzFha3Dv/DfG0W3dkP6baIQfSFNbkveDiqL1aTerlqpG6jrf2VSTYI/9jIxCmOtpV5cMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdRNSfOk; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdRNSfOk"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8231061d234so3070380b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 21:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771823330; x=1772428130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIHGy/G0wYkzAUX09LMrZ+MvHJVryLDbt1gnZlCOfls=;
        b=SdRNSfOkI40N5CvGrVYWtwRFwK+6aU7he1R54ZuxxfbzFIRa2+VqjNJxLiHRIwH75A
         Wuk+a0mak1vt5zCj/QdtxLHrCKxpVojMxunrrAp1t14st2Z3ZYeVyFVshsDAKEYlo9Jx
         NQklVzLaN5QeB64HkOfqFWoSNOkVn17kHOeJjOOCcXUBd+CyRAlHeuNAx0k3ywgmH7AF
         tsnKtTtdLeENkcm5F12attH7ScyCOfvlw7ESb79+KD8/zsZnNvdJE2exlSVXxels58Dj
         5hmdtVXRJ6Tgl/QGMeIPImfDnFKGGy1JiND1HBqigTFCKsvZn6P9J8LKmoinhFTbnPzq
         B0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771823330; x=1772428130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bIHGy/G0wYkzAUX09LMrZ+MvHJVryLDbt1gnZlCOfls=;
        b=Sb1YqdaBj6o8K59uNXBxUNQ38yV1ooxFqmYYhWijuXMvQ7n86ztLXmhPw6Cnp/zEHS
         UdUdIn8oH1fi9YONg+8p+zN8gsRzTgCb9JuXETMUbNHqkQb+9CXRXTY2SyTq9IIeVnZO
         AFgFH6PuULfTmgwY1Up6A4jNHZPn2yNPlGFNx0hlnuPi+PH0zqVV5gQ5Spll2OmDciie
         Ajv8MkPiCZE362T+ti7pG3deZYAH0KpomnhoizG0SqExoliLSuQE5zo3MMODh1b6tOHR
         Uw1RdrkQx3LBX/kFv+fTeEVwSAoLE3Wv2wyBEQyBjKn3AoSen1Ti8/9KcVEkFcMoBfxt
         2C+Q==
X-Gm-Message-State: AOJu0YysqTi4wdw316OfQOIKrfDe5pP8ZUVBjfFXkDY81vVFaSUFYOAM
	uKrgk/iImfNkY5OJg4QRZZi9nzax9mtn3s3UhyykM9ueRGqFFYJ0AlOf
X-Gm-Gg: ATEYQzzo3pCdIVhSHrFQ5AT6iASFpuNtAf/2I6JVnvPsfGVaBkcNMddPirf/5ZYdJs8
	Xtcj6rgnqozIUH5ii8GaY7kUpkJYLRG9moDP5IeAZ18YU9inFIUU7B9Z7potjaS4d55NktBPync
	R4C8vhiqV6DMt1pH51KfmyZRNi6iQRiTqKWQrq1wTlka9Mkq5gdVNobtBL+0VxXbmF/fWrb4SmW
	Daer1QCWn+Aifmfcka5id+luv38uBiW50VqCHFh2Aln4wDCVVVoozkAoB3b7P3RR9221N2bbY+6
	4yz2nvdlsBPgsyDfkJw++tLfqCK2m29VcjwXEMfNcGa05AJw3Ub5Vj7l0f1aokiGMznNmq9IfFh
	oMF2IpWxwBAMa7bDRDsXT3t7MHvCnVQY3BqOzcwawhty5LJofzzh/rA2NQeUttCnum8j3Ekgcrv
	zEGhpW2UzMsUD8c6vNnlVyzmv0FMWdsuscL214VK/Z9PUodA==
X-Received: by 2002:a05:6a00:1989:b0:823:9c6:1985 with SMTP id d2e1a72fcca58-826da8ee32amr5525343b3a.16.1771823330603;
        Sun, 22 Feb 2026 21:08:50 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:93aa:64a5:666f:7ac0:de3b:1659])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8bf9besm7502022b3a.55.2026.02.22.21.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 21:08:50 -0800 (PST)
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
Subject: [PATCH v3 3/3] hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g5b/7b controllers
Date: Mon, 23 Feb 2026 10:38:04 +0530
Message-Id: <20260223050804.4287-4-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
References: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
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
 drivers/hwmon/pmbus/xdpe1a2g7b.c | 119 +++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)
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
index 000000000000..1755e3522ede
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
@@ -0,0 +1,119 @@
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
+	 * separately is not supported.
+	 */
+	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
+	if (vout_mode < 0)
+		return vout_mode;
+
+	switch (vout_mode >> 5) {
+	case 0:
+		info->format[PSC_VOLTAGE_OUT] = linear;
+		return 0;
+	case 1:
+		info->format[PSC_VOLTAGE_OUT] = vid;
+		vout_params = vout_mode & GENMASK(4, 0);
+		/* Check for VID Code Type */
+		switch (vout_params) {
+		case XDPE1A2G7B_NVIDIA_195MV:
+			/* VID vrm_version for PAGE0 and PAGE1 */
+			info->vrm_version[0] = nvidia195mv;
+			info->vrm_version[1] = nvidia195mv;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -ENODEV;
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

