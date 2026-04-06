Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30B7327BFB
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Apr 2026 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775470669; cv=none; b=LInf9RtSoilAsPo881g+/e0pKeNr2O68V9fivKEEB/fVdHr+g6zqqanG767VncoAveqCUxFe2UnvisvKDVcQJMWL4Mk8xrKAILI2452a3k1zT8ftqe+nTpyzy8eUy0hE0nwj+Zhvh5oGHnygdUj/d2d3XV3xfN3kTfAfuP3MkAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775470669; c=relaxed/simple;
	bh=ygE78m4z5+HlIIpSBrnoyMIdAegNd+iR1qUt9v5wiuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LWqv7RulMq/kha2W7SAEu5wJP4ZG1u14nnAKDD3YePar+R6jKvn8sRs1zBYQu6+UQUTTYUKVc3Kxbfa+EKoA3Pq/hhDae6N2PtWW7po0xGyE8s+3PXS3tPIIaSaoT9T0zF/iqXtXmGVebmgNVW/cSb2bepz+kvUQEBkdOd3wC8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2d0zqp4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2d0zqp4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35c124d2613so2103520a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Apr 2026 03:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775470667; x=1776075467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10khucMFgM3lnQ2iprel6diABOkMyNCnupGvTH2n+0Q=;
        b=c2d0zqp4TEFekdzXHajWGmYMfi7NN5YjDPv61PQgHuxQFkupeJTTSdFC5pFs/TBGME
         5+3JO7BXBxDoaeSADhU1Ef/T3t7FagG8FkosiHbmCNl9iYe4inNYxZupJfdkM7JY93HB
         nRRtgsvTGb9mq4UIWo1V3j0IigaaTodfDzc4ZVM5nVdY2oPZlJ8f6Ylj/CQhjZ12iunY
         xGen4qbcdO5LHeHpzPV51bu+C4nH0BCKvu6Jq8Cu/IY/kQRRhCgMZCOm0b1AaqyE+8H/
         jEBfsn0cDr6Kdor5hv60G7zM2e5Z5zeKN7CGwT7rIcjsVH27KEQt0pIc78Ippd52LOc7
         XZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775470667; x=1776075467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10khucMFgM3lnQ2iprel6diABOkMyNCnupGvTH2n+0Q=;
        b=kxD+qgl+LAAg1+mlxSOgtwLw9f+s3U31vIrJlZoJSPyY7i7zlxtkNVV6KlqSOZ7nP2
         kpH67+TvUO4Az0SnU4H0ONSry93h8AYElZf9XNoBh/h+YCQosk1bEprcTt7jlV57sutg
         BnvXJtp7E+gfALOsYYQ2jJdvgxni6aKECFyQZRsBpX0sfVrxQLnvbeyx7BPeX6tK4YqN
         a35O3o42+ppZ2eePu2CbiBnYjuh5XHxyUQXbsdnpoy5jw6G+5b9paGpDvdbPfdyFboYb
         8PxvbDm7H/3AtGv8JyEt878KZneQ1CpcdueX3wwhiv/8+f7AM1eNqZVUPZtV/Y3CV26P
         N/0Q==
X-Gm-Message-State: AOJu0YxfcqgdXlABKJBGWGpu0gKUwSj5+Clsqc68Ofoi2EM6tkW7dG7g
	01ECKxsuFZLuLibFE+GqCtWVqxgqh6duqV6HB9Mf+3apJqH8UcsaPPPN
X-Gm-Gg: AeBDieuSpCNM/BejV5GaQd+wlZcFBgCVGUmeUSWyGrGMGUyxH3U5RpOyDJscjVTVgzE
	ENZrO0KfsN/YkUBT8uyctiGUvnPmCkaQlwhxZoXjT/+uDOYgmYpr4fCDaPs9P6mRrDEWph1NkTC
	h3eIkZyBZkEfkoVsqBdLdJdt6G1cmVA5XkhkZL8trvvEIWhY4Bgcy/kE3UcBDChVDUuPVe0M1SP
	HRUnE8Q4ktq1hRCXBNK8ymcbIEJxi//YPfc46g7RFQVq0uZDlF7jVT9SibpvHqpNKQNQfb7PPic
	DlhXiLA3XwvGo2e8Cmxh1W4BwaDlDQZA5+QuQ1FAJZUTUhXkwP23DdHqRGrD18LKMqdrOFbm73j
	6TgfUmmk6LOpWv7PDa2ZBeNJszwxBISd+M/Z0qXqlFlrwI9pBV+K81Z4yMvthVZXT3FW4qXIrMm
	cW/Z9zNJdlqj5gTs8IQjMEqQgLX+l23ury2zdz9bxsGuFvYBDDl8vuu+8=
X-Received: by 2002:a17:90b:37cc:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35de680bc4amr11925177a91.7.1775470667311;
        Mon, 06 Apr 2026 03:17:47 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:c94a:aad7:a860:f869:a68d:92e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm23332527a91.5.2026.04.06.03.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 03:17:46 -0700 (PDT)
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
Subject: [PATCH v3 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
Date: Mon,  6 Apr 2026 15:46:47 +0530
Message-Id: <20260406101647.109667-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
References: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
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

