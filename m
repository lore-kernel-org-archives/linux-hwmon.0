Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ABAC4321E
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Nov 2022 17:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiKZRRo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Nov 2022 12:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiKZRRn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Nov 2022 12:17:43 -0500
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.152.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C71C11A22
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2022 09:17:39 -0800 (PST)
Received: from atl1wswcm05.websitewelcome.com (unknown [50.6.129.166])
        by atl3wswob01.websitewelcome.com (Postfix) with ESMTP id 015A13170F
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2022 17:17:39 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id yyo4oaQQRP2h5yyo5ozEl4; Sat, 26 Nov 2022 17:17:38 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=71JCH1/P6vS4DocDLWMlS8oiuuBQQaz5BcxI4O3FurM=; b=ieMl+MQ0XBukxGdxVjP05yR6eU
        jQSnI7pjcvz07TV+KTKUCrifTwZDWBySediFm8DjAmrtEI1iwRsGQZLeWomNughV3m726wO2bHGA0
        5916K/gPZkQm1yEZkfOt8ReVOvllt2ofQBk83vYQbQY8Vvfxaj4q3YQTblGAIqlrAKZtOuzaOMPyR
        4PknfJ6oS6cmH56TAu6ot32WLGkOcu/JJfAwdfRVBfwXBgaxXi+TtUJlELMCRZ5LB5s2dD4AO4jX+
        1YkbNO7o8ZxlT3jchJPUVV+MNX6Sd1GnAOI4VzeK9e6tP/BKSdJwEXWNCfAK5sND/kMyPLdYcnKSQ
        2XqFJIHw==;
Received: from [106.203.5.91] (port=35801 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <saravanan@linumiz.com>)
        id 1oyyo2-001nHp-SX;
        Sat, 26 Nov 2022 17:17:35 +0000
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v1 2/3] hwmon: (pmbus/mpq7932) Add a support for mpq7932 Power Management IC
Date:   Sat, 26 Nov 2022 18:17:10 +0100
Message-Id: <20221126171711.1078309-2-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126171711.1078309-1-saravanan@linumiz.com>
References: <20221126171711.1078309-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 106.203.5.91
X-Source-L: No
X-Exim-ID: 1oyyo2-001nHp-SX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [106.203.5.91]:35801
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 6
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMN0Fp/gINC4oaCoY5dpw90enntSxdz7JpINPUpCEFJl9zZMJQvURXSF3m32gRq8E9uMO5YPBkpCHmnNU8+ixnTQXBg1KFgIkSNkzYkBgCsPqdbencUE
 G4kKbFbp4L+yAAMyaWEfSTU/Ijc79ByjL6hx029EunsbuWtV1XxQeKTPiAOnb5VqfRDQVrADfdK2rDHOMHzfitdXN2qHoWyz4VA=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The MPQ7932 is a power management IC designed to operate from 5V buses to
power a variety of ADAS SOCs. Six integrated buck converters power a
variety of target rails configurable over PMBus interface.

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 drivers/hwmon/pmbus/Kconfig   |   9 ++
 drivers/hwmon/pmbus/Makefile  |   1 +
 drivers/hwmon/pmbus/mpq7932.c | 150 ++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/mpq7932.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 89668af67206..5e938768bd77 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -317,6 +317,15 @@ config SENSORS_MP5023
 	  This driver can also be built as a module. If so, the module will
 	  be called mp5023.
 
+config SENSORS_MPQ7932_REGULATOR
+	tristate "MPS MPQ7932 buck regulator"
+	help
+	  If you say yes here you get six integrated buck converter
+	  regulator support for power management IC MPS MPQ7932.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mpq7932.
+
 config SENSORS_PIM4328
 	tristate "Flex PIM4328 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 0002dbe22d52..28a534629cc3 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
+obj-$(CONFIG_SENSORS_MPQ7932_REGULATOR) += mpq7932.o
 obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
diff --git a/drivers/hwmon/pmbus/mpq7932.c b/drivers/hwmon/pmbus/mpq7932.c
new file mode 100644
index 000000000000..23d3ccdaed1e
--- /dev/null
+++ b/drivers/hwmon/pmbus/mpq7932.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// mpq7932.c  - regulator driver for mps mpq7932
+//
+// Copyright 2022 Monolithic Power Systems, Inc
+//
+// Author: Saravanan Sekar <saravanan@linumiz.com>
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/of_device.h>
+#include <linux/pmbus.h>
+#include <linux/i2c.h>
+#include "pmbus.h"
+
+#define MPQ7932_BUCK_UV_MIN		206250
+#define MPQ7932_UV_STEP			6250
+#define MPQ7932_N_VOLTAGES		0xFF
+#define MPQ7932_NUM_PAGES		6
+
+#define MPQ7932_TON_DELAY		0x60
+#define MPQ7932_VOUT_STARTUP_SLEW	0xA3
+#define MPQ7932_VOUT_SHUTDOWN_SLEW	0xA5
+#define MPQ7932_VOUT_SLEW_MASK		GENMASK(1, 0)
+#define MPQ7932_TON_DELAY_MASK		GENMASK(4, 0)
+
+#define MPQ7932BUCK(_id)					\
+	[_id] = {						\
+		.id = _id,					\
+		.name = ("buck" # _id),				\
+		.of_match = of_match_ptr("buck" # _id),		\
+		.regulators_node = "regulators",		\
+		.ops = &pmbus_regulator_ops,			\
+		.type = REGULATOR_VOLTAGE,			\
+		.min_uV = MPQ7932_BUCK_UV_MIN,			\
+		.uV_step = MPQ7932_UV_STEP,			\
+		.n_voltages = MPQ7932_N_VOLTAGES,		\
+	}
+
+struct mpq7932_data {
+	struct pmbus_driver_info info;
+	struct pmbus_platform_data pdata;
+};
+
+static struct regulator_desc mpq7932_regulators_desc[] = {
+	MPQ7932BUCK(0),
+	MPQ7932BUCK(1),
+	MPQ7932BUCK(2),
+	MPQ7932BUCK(3),
+	MPQ7932BUCK(4),
+	MPQ7932BUCK(5),
+};
+
+static int mpq7932_write_word_data(struct i2c_client *client, int page, int reg,
+			       u16 word)
+{
+
+	switch (reg) {
+	case PMBUS_VOUT_COMMAND:
+		return pmbus_write_byte_data(client, page, reg, (u8)word);
+
+	default:
+		return -ENODATA;
+	}
+}
+
+static int mpq7932_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
+{
+
+	switch (reg) {
+	case PMBUS_MFR_VOUT_MIN:
+		return 0;
+
+	case PMBUS_MFR_VOUT_MAX:
+		return MPQ7932_N_VOLTAGES;
+
+	case PMBUS_READ_VOUT:
+		return pmbus_read_byte_data(client, page, PMBUS_VOUT_COMMAND);
+
+	default:
+		return -ENODATA;
+	}
+}
+
+static int mpq7932_probe(struct i2c_client *client)
+{
+	struct mpq7932_data *data;
+	struct pmbus_driver_info *info;
+	struct device *dev = &client->dev;
+	int i;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_WORD_DATA))
+		return -ENODEV;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mpq7932_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	info = &data->info;
+	info->pages = MPQ7932_NUM_PAGES;
+	info->num_regulators = ARRAY_SIZE(mpq7932_regulators_desc);
+	info->reg_desc = mpq7932_regulators_desc;
+	info->format[PSC_VOLTAGE_OUT] = direct;
+	info->m[PSC_VOLTAGE_OUT] = 160;
+	info->b[PSC_VOLTAGE_OUT] = -33;
+	for (i = 0; i < info->pages; i++) {
+		info->func[i] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+				| PMBUS_HAVE_STATUS_TEMP;
+	}
+
+	info->read_word_data = mpq7932_read_word_data;
+	info->write_word_data = mpq7932_write_word_data;
+
+	data->pdata.flags = PMBUS_NO_CAPABILITY;
+	dev->platform_data = &data->pdata;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id mpq7932_of_match[] = {
+	{ .compatible = "mps,mpq7932"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpq7932_of_match);
+
+static const struct i2c_device_id mpq7932_id[] = {
+	{ "mpq7932", },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, mpq7932_id);
+
+static struct i2c_driver mpq7932_regulator_driver = {
+	.driver = {
+		.name = "mpq7932",
+		.of_match_table = of_match_ptr(mpq7932_of_match),
+	},
+	.probe_new = mpq7932_probe,
+	.id_table = mpq7932_id,
+};
+module_i2c_driver(mpq7932_regulator_driver);
+
+MODULE_AUTHOR("Saravanan Sekar <saravanan@linumiz.com>");
+MODULE_DESCRIPTION("MPQ7932 PMIC regulator driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.34.1

