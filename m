Return-Path: <SRS0=GhbM=CQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B588C43461
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Sep 2020 13:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3C252166E
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Sep 2020 13:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhvH/xlh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgIGN15 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Sep 2020 09:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729449AbgIGN0f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Sep 2020 09:26:35 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842AAC061573
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Sep 2020 06:26:35 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id q4so580289pjh.5
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Sep 2020 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M1RJuRcE6vmnj/p2JdlTFuHUnGa3uk1MH6H4QnWTn/s=;
        b=HhvH/xlhKe8JRP5XTrHyfxXyEmWpIDgAwtZN++idUVelQvieTUgpzjEAKfsS8DKmkB
         jFq9rKDHQv9VCMbWhjdgMlrS4R+oOO+n1eIqyyQRGtgGhDtiLjJj345iwKpTd78IXXnb
         n2qrRQNkgjzgpqL7yh9hngQwr+xkHTkNUfo3UFYZIvcpGJHDHbCFI2+EmiTQDGs8GDLW
         N5RVP+CcxRslFQRFxSXK84h3AI8MDDp1DsMC3my28fC7qpuKMP+mS1eNEIOUn/jZEVoI
         XOKP75XLmu/4V/MPKS8QioCznO9i7MypckHI8BKJ6brIopskEZMiKWxMUt7d2ynBWd0I
         l0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M1RJuRcE6vmnj/p2JdlTFuHUnGa3uk1MH6H4QnWTn/s=;
        b=jW82pfKxb4J4OpIt2nB5ZNamVHHdJrOYhnAK6LOAE0cbARJC3LXAWUnSkVVgwCNnR4
         H6j4npMzPGVe90iMjYiYWPxu7hvwhNhwgZ8SDZNO0FuIo5yYz3QZ13wHxS8GhvcfgIVw
         7Kp9tIlMsFVxA0/LtDrQqlbBc7ttmEHJkjSxFUO12/Uns29fCLMedof/WkHzd2ohhS3w
         3TXUp7pK2JRAms3D7X9Li04ebvQQXvVzR/qJQmc8o7yoBqaeXDkIVZk/dN3VZ1kr/1Rp
         pdQhHnGBUC3BUuKek6a90XahEMNi1yY2495kWc2pAc+tDoGEunHIJOtqZa1FRxPG4F9S
         Naig==
X-Gm-Message-State: AOAM530BC9MStEy+p9Ddr8aLbnR0yuYRUzkV64g7FNJlTILZDrAVpeI6
        bS5iD7sYt/nfNeuRcB9UlnzV50uNEfbbSA==
X-Google-Smtp-Source: ABdhPJxZ45OvH9geJlkRHKkQA8CGe/7w7BOq3Fp7ymg/LE6EkLFbGFrbwhyULeaqAEP/t5dQcKXbZw==
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr13610890pjb.149.1599485194089;
        Mon, 07 Sep 2020 06:26:34 -0700 (PDT)
Received: from localhost.localdomain ([106.200.242.11])
        by smtp.googlemail.com with ESMTPSA id ev19sm4315655pjb.42.2020.09.07.06.26.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 06:26:33 -0700 (PDT)
From:   Philby John <philbyjohn@gmail.com>
X-Google-Original-From: Philby John <philby.j@hcl.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Philby John <philby.j@hcl.com>
Subject: [PATCH] hwmon: Driver for TI TPS2483 hotswap controller
Date:   Mon,  7 Sep 2020 18:56:04 +0530
Message-Id: <20200907132604.27017-1-philby.j@hcl.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <philbyjohn@gmail.com>
References: <philbyjohn@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adds support for Texas Instruments TPS2483 Series
Hot Swap Voltage Controller. The driver in its current form
supports reading Shunt Voltage, Bus Voltage, Power and Current.

Since TPS2483 can be configured to a particular slave address
based on the state of A0 and A1 pins, instantiation is done
manually. For eg:-
echo tps2483 0x40 > /sys/bus/i2c/devices/i2c-1/new_device

Signed-off-by: Philby John <philby.j@hcl.com>
---
 drivers/hwmon/Kconfig   |  11 +++
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/tps2483.c | 174 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)
 create mode 100644 drivers/hwmon/tps2483.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8dc28b26916e..9e51c25f695e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1852,6 +1852,17 @@ config SENSORS_TMP513
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp513.
 
+config SENSORS_TPS2483
+	tristate "Texas Instruments TPS2483"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for Texas Instruments TPS2483
+	  Hot Swap Controller I2C interface.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called tps2483.
+
 config SENSORS_VEXPRESS
 	tristate "Versatile Express"
 	depends on VEXPRESS_CONFIG
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index a8f4b35b136b..2f1551c77a4c 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -179,6 +179,7 @@ obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
 obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
 obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
+obj-$(CONFIG_SENSORS_TPS2483)   += tps2483.o
 obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
 obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
 obj-$(CONFIG_SENSORS_VIA686A)	+= via686a.o
diff --git a/drivers/hwmon/tps2483.c b/drivers/hwmon/tps2483.c
new file mode 100644
index 000000000000..957b6e3e0cd9
--- /dev/null
+++ b/drivers/hwmon/tps2483.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Texas Instruments TPS 2483 Hot Swap controller
+ *
+ * Copyright (c) 2020 Philby John
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/bitops.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/jiffies.h>
+#include <linux/regmap.h>
+
+/* chip registers */
+#define TPS2483_CONFIG		0x00
+#define TPS2483_SHUNT_VOLT	0x01
+#define TPS2483_BUS_VOLT	0x02
+#define TPS2483_PWR		0x03
+#define TPS2483_CURRENT		0x04
+#define TPS2483_CALIB		0x05
+#define TPS2483_MASK		0x06
+#define TPS2483_ALERT		0x07
+
+#define MAX_CALIB_FACTOR	32757
+#define MIN_CALIB_FACTOR	0
+
+/* Fault register bits */
+#define SHUNT_OV	BIT(15)
+#define SHUNT_UV	BIT(14)
+#define BUS_OV		BIT(13)
+#define BUS_UV		BIT(12)
+#define POWER_OL	BIT(11)
+#define MATH_OF		BIT(2)
+#define LATCH_EN	BIT(0)
+
+
+static ssize_t tps2483_set_value(struct device *dev,
+					struct device_attribute *da,
+					const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct regmap *regmap = dev_get_drvdata(dev);
+	u8 reg = attr->index;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	val = clamp_val(val, MIN_CALIB_FACTOR, MAX_CALIB_FACTOR);
+	ret = regmap_write(regmap, reg, val);
+	return ret < 0 ? ret : count;
+}
+
+/* Return the voltage from the given register in mV or mA */
+static int tps2483_get_value(struct device *dev, u8 reg)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(regmap, reg, &val);
+	if (ret < 0)
+		return ret;
+
+	switch (reg) {
+	case TPS2483_SHUNT_VOLT:
+		val = DIV_ROUND_CLOSEST(val * 25, 10000);
+		break;
+	case TPS2483_BUS_VOLT:
+		DIV_ROUND_CLOSEST(val * 125, 100);
+		break;
+	case TPS2483_PWR:
+		val = DIV_ROUND_CLOSEST(val * 125, 100);
+		break;
+	case TPS2483_CURRENT:
+		break;
+	default:
+		return -EINVAL;
+	}
+	return val;
+}
+
+static ssize_t tps2483_show_value(struct device *dev,
+				  struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	int value;
+
+	value = tps2483_get_value(dev, attr->index);
+	if (value < 0)
+		return value;
+	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+}
+
+/* Voltages */
+static SENSOR_DEVICE_ATTR(in0_input, 0444, tps2483_show_value, NULL,
+			  TPS2483_CONFIG);
+static SENSOR_DEVICE_ATTR(in1_input, 0444, tps2483_show_value, NULL,
+			  TPS2483_SHUNT_VOLT);
+static SENSOR_DEVICE_ATTR(in2_input, 0444, tps2483_show_value, NULL,
+			  TPS2483_BUS_VOLT);
+static SENSOR_DEVICE_ATTR(power1_input, 0444, tps2483_show_value, NULL,
+			  TPS2483_PWR);
+static SENSOR_DEVICE_ATTR(curr1_input, 0444, tps2483_show_value, NULL,
+			  TPS2483_CURRENT);
+static SENSOR_DEVICE_ATTR(in3_input, 0644, tps2483_show_value,
+			tps2483_set_value, TPS2483_CALIB);
+
+static struct attribute *tpm2483_attrs[] = {
+	&sensor_dev_attr_in0_input.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in3_input.dev_attr.attr,
+	&sensor_dev_attr_power1_input.dev_attr.attr,
+	&sensor_dev_attr_curr1_input.dev_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(tpm2483);
+
+static const struct regmap_config tps2483_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = TPS2483_ALERT,
+};
+
+static int tps2483_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_i2c(client, &tps2483_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(regmap);
+	}
+
+	/* Clear faults */
+	regmap_write(regmap, TPS2483_ALERT, 0x00);
+
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
+			regmap,
+			tpm2483_groups);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id tps2483_id[] = {
+	{"tps2483", 0},
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, tps2483_id);
+
+static struct i2c_driver tps2483_driver = {
+	.driver = {
+		.name = "tps2483",
+	},
+	.probe = tps2483_probe,
+	.id_table = tps2483_id,
+};
+
+module_i2c_driver(tps2483_driver);
+
+MODULE_AUTHOR("Philby John <philby.j@hcl.com>");
+MODULE_DESCRIPTION("TPS2483 driver");
+MODULE_LICENSE("GPL");
-- 
2.13.6

