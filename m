Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12301C54EB4
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 11:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbjAXLBo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbjAXLBi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 06:01:38 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CEA7ED6
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 03:01:37 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id z5so13483090wrt.6
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 03:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Diba07ViOeI4wEotQ3miGeT+MgDEwdMPT+7cnpc7+uQ=;
        b=hdp8oo/fUcR6XBjX1xguZjy7WC9HxTC3SEGl5XuL1VYwFqWAVC76aOuaMbWBX+wvAN
         FUoB1fXraWV8TFn4MIF320lKbU2rJqUWEEeBdS8pnC5lAcPXbHcI0aIBUSlMI3D+Sdn7
         06ZEoRf1PAa95/S6L1k8OuQhZkWt/6hiHouHVvw1/qIbd/Vg0F4XNF+Y9uJKh7NHWJR3
         uT/4J+WWR5GTwB6fqqo85OBd902mcR8Qy2plpXsVCdKcu0KpteK0f8EUc5euNjyewHyW
         rBtb4/EV26DWFhEHW0PB3MvtE5BFtl7Sfk4oGIUGo26e1PJdVdd2NCkZCYL+Kew5xz9b
         uBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Diba07ViOeI4wEotQ3miGeT+MgDEwdMPT+7cnpc7+uQ=;
        b=4V2GuiI0AG45VqRjfQ0iFhKyxgEMBG0B20nC31Dyz03xl9eBFIKzsKvD8Korlo9aME
         VgbNGDEDCLwUeUNN638x4yM6lL0ZbxSq1xJVn4WvRI7+7u+dqwKNGKrKA+PBvssFIewk
         H90yRgZNgcuHFoxZUyxoKAOa1pHEH0uF6YoP4EHZYCTuF22uMuyJDJiZCaQTp5dg9ROl
         d+jbtiXvn4HBTux1jr8dDcRGmmqIgZOlJsO0Xelgj4nriY901CGBXnVKTHx4AOtkn0aG
         cSmTjzCMiuYFOILJPFlPmMLKaScWjTeZV9OvB73w7BNxHwsbQsQkd5PNnnNSXuLnHoeY
         oPbQ==
X-Gm-Message-State: AFqh2kpZYAC1elXVwM3lL5s3EYeREtLclW3NpGfuIpXeDyQrIYCKU1YC
        meH4udcHJk7I+D5PFMkeP0+JAQ==
X-Google-Smtp-Source: AMrXdXurQ9dgqy4d6gZMB2MpKM4y/VSKWdvMjQa5viPyjthVLnhd6qbbXkVTGHHlpyaqUVoM3u2bDQ==
X-Received: by 2002:a05:6000:689:b0:2bd:ffad:1bce with SMTP id bo9-20020a056000068900b002bdffad1bcemr27235891wrb.59.1674558095580;
        Tue, 24 Jan 2023 03:01:35 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id j20-20020a5d6e54000000b002b9b9445149sm1935328wrz.54.2023.01.24.03.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 03:01:35 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/tda38640) Add driver for Infineon TDA38640 Voltage Regulator
Date:   Tue, 24 Jan 2023 12:01:11 +0100
Message-Id: <20230124110111.3965317-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add the pmbus driver for the Infineon TDA38640 voltage regulator.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 drivers/hwmon/pmbus/Kconfig                   | 16 ++++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/tda38640.c                | 78 +++++++++++++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/tda38640.c

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index f5c0a6283e61..a28b02036489 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -141,6 +141,8 @@ properties:
           - infineon,slb9645tt
             # Infineon SLB9673 I2C TPM 2.0
           - infineon,slb9673
+            # Infineon TDA38640 Voltage Regulator
+          - infineon,tda38640
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
             # Infineon Multi-phase Digital VR Controller xdpe11280
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 30448e049486..9f4bbb9c487a 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -395,6 +395,22 @@ config SENSORS_STPDDC60
 	  This driver can also be built as a module. If so, the module will
 	  be called stpddc60.
 
+config SENSORS_TDA38640
+	tristate "Infineon TDA38640"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  TDA38640.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called tda38640.
+
+config SENSORS_TDA38640_REGULATOR
+	bool "Regulator support for TDA38640 and compatibles"
+	depends on SENSORS_TDA38640 && REGULATOR
+	help
+	  If you say yes here you get regulator support for Infineon
+	  TDA38640 as regulator.
+
 config SENSORS_TPS40422
 	tristate "TI TPS40422"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d9d2fa4bd6f7..3ae019916267 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
+obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
 obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
 obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
new file mode 100644
index 000000000000..31e17a936b8c
--- /dev/null
+++ b/drivers/hwmon/pmbus/tda38640.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon TDA38640
+ *
+ * Copyright (c) 2023 9elements GmbH
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regulator/driver.h>
+#include "pmbus.h"
+
+#if IS_ENABLED(CONFIG_SENSORS_TDA38640_REGULATOR)
+static const struct regulator_desc tda38640_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+};
+#endif /* CONFIG_SENSORS_TDA38640_REGULATOR */
+
+static struct pmbus_driver_info tda38640_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_IIN
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
+#if IS_ENABLED(CONFIG_SENSORS_TDA38640_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = tda38640_reg_desc,
+#endif
+};
+
+static int tda38640_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &tda38640_info);
+}
+
+static const struct i2c_device_id tda38640_id[] = {
+	{"tda38640", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, tda38640_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id tda38640_of_match[] = {
+	{ .compatible = "infineon,tda38640"},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tda38640_of_match);
+#endif
+
+/* This is the driver that will be inserted */
+static struct i2c_driver tda38640_driver = {
+	.driver = {
+		   .name = "tda38640",
+		   },
+	.probe_new = tda38640_probe,
+	.id_table = tda38640_id,
+};
+
+module_i2c_driver(tda38640_driver);
+
+MODULE_AUTHOR("Patrick Rudolph <patrick.rudolph@9elements.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon TDA38640");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);

base-commit: 4d891f76a30d3be4194a805c5e4277786140ef05
-- 
2.38.1

