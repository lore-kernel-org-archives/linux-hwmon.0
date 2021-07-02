Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FCEC11F68
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 07:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BDEC6137D
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 07:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhGBHee (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Jul 2021 03:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhGBHec (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Jul 2021 03:34:32 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BF4C061762;
        Fri,  2 Jul 2021 00:31:59 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id a2so8753913pgi.6;
        Fri, 02 Jul 2021 00:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gNiBc5K1QHcAX0IzH13ZJKfHsl5fKfNQqA+NM3TX1iI=;
        b=GpBvTAE8DJvCuGS0NGN/MuHBm7FcDxkIEWHaB35vfWtuUNrwxquthN6o2VQIFLNkx8
         2jZ0BiuMB9HoOuluC3fsxIy+a348kAn+6Si85tOAKnQw6yISusVH8KuTlXCrAV7lrjjb
         DlabHD3edpCNSKbIQiMe1wGrJjOBFPJNQN5pSm/DHWh3M3vDYz8+aAtxMgzFXChe7Msp
         /C7n3oLiPalY7TSPN+4L2lfXCopFn2EwhOGIEQV+5LJ1Xm935rfWu/nuRMk0cnEtapI9
         yT0EXkkGh3AVAYaseWcUpv0rr3lVvY4vJCz/D1z0GAjXOKKwT322qxX2gjKXPUuZH93V
         7wXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gNiBc5K1QHcAX0IzH13ZJKfHsl5fKfNQqA+NM3TX1iI=;
        b=WWDutV9wne2F6ww8zAwKV3kQakoi0mDqFqNPvhOfwJdfiuttkVUHD1StzTr+jGgAL4
         hR22al/cRA5uqHVouGmsh901OkftQ1pKkOuSppD7GLEa791K8nDylBoD5sf6jJDq4VxR
         ZAl9UjPePTWbz0f5fjBR04MoYJghxMbUpT3iZYbtVJSBpo9lQyoqgAFM2P3lAdHUEO8A
         1+8RWBZYPvbSoOrMvRyUoj0G/YHLjZjsmlMV9O+oBmyuUtjNujROxpTrH7mknoVvbQJQ
         el78pwSdnms0jQ0Cr5y2iq+LZ+a6EdjF5yncUVPf2KW+FYcIP5oMNOv6TmykEqvoxdTG
         mJow==
X-Gm-Message-State: AOAM530km4vl8AEgKUyF5Y7GTAjpDioOVUUUYptXjsWP7tbFmFdjta0t
        CypN4reUjNiieK8jPALJSvs=
X-Google-Smtp-Source: ABdhPJysm+CxbXsYxjDVwICGdAqdRx5JhtqCOwwaPOQjsKIZI038n5EUQAYm6GCkPODitqtSa3pn3A==
X-Received: by 2002:a63:f751:: with SMTP id f17mr1086621pgk.373.1625211119280;
        Fri, 02 Jul 2021 00:31:59 -0700 (PDT)
Received: from localhost.localdomain ([40.83.88.183])
        by smtp.gmail.com with ESMTPSA id bx12sm1775080pjb.22.2021.07.02.00.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 00:31:59 -0700 (PDT)
From:   ainux.wang@gmail.com
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        ainux.wang@gmail.com
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        sterlingteng@gmail.com, chenhuacai@kernel.org,
        chenhuacai@loongson.cn
Subject: [PATCH v6 1/2] hwmon: (pmbus) Add support for MPS MP2949A
Date:   Fri,  2 Jul 2021 15:31:41 +0800
Message-Id: <20210702073142.15166-2-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20210702073142.15166-1-ainux.wang@gmail.com>
References: <20210702073142.15166-1-ainux.wang@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: "Ainux.Wang" <ainux.wang@gmail.com>

Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS).
This is a triple-loop, digital, multi-phase controller.
This device:
- Supports up to three power rail.
- Provides 6 pulse-width modulations (PWMs), and can be configured up
  to 6-phase operation for Rail A , up to 2-phase operation for Rail B
  and up to 1-phase operation for Rail C.
- The PMBus registers are distributed into three pages: Page 0, Page 1,
  Page 2. Page 0 contains the registers for Rail A and most of the common
  settings for all of the rails. Page 1 contains register information for
  Rail B. Page 2 contains register information for Rail C.
- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
  IMVP9.

Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/mp2949a.rst |  44 +++++++++++
 drivers/hwmon/pmbus/Kconfig     |   9 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/mp2949a.c   | 136 ++++++++++++++++++++++++++++++++
 5 files changed, 191 insertions(+)
 create mode 100644 Documentation/hwmon/mp2949a.rst
 create mode 100644 drivers/hwmon/pmbus/mp2949a.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index bc01601ea81a..e62161c0f01e 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -138,6 +138,7 @@ Hardware Monitoring Kernel Drivers
    mcp3021
    menf21bmc
    mlxreg-fan
+   mp2949a
    mp2888
    mp2975
    nct6683
diff --git a/Documentation/hwmon/mp2949a.rst b/Documentation/hwmon/mp2949a.rst
new file mode 100644
index 000000000000..0235dec70f63
--- /dev/null
+++ b/Documentation/hwmon/mp2949a.rst
@@ -0,0 +1,44 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2949a
+====================
+
+Supported chips:
+
+  * MPS MP2949A
+
+    Prefix: 'mp2949a'
+
+Author:
+
+	Ainux Wang <ainux.wang@gmail.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+triple-loop, digital, multi-phase controller MP2949A.
+
+This device:
+
+- Supports up to three power rail.
+- Provides 6 pulse-width modulations (PWMs), and can be configured for
+  to 6-phase operation for Rail A , up to 2-phase operation for Rail B,
+  and up to 1-phase operation for Rail C.
+- The PMBus registers are distributed into three pages: Page 0, Page 1,
+  Page 2. Page 0 contains the registers for Rail A and most of the common
+  settings for all of the rails. Page 1 contains register information for
+  Rail B. Page 2 contains register information for Rail C.
+- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
+  IMVP9.
+
+Device supports:
+
+- SVID interface.
+- PMBus rev 1.2 interface.
+
+Device supports direct format for reading output power.
+Device supports linear format for reading input voltage, output current,
+and temperature.
+Device supports VID for reading output voltage.
+The below VID modes are supported: VR12, VR13, IMVP8, IMVP9.
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index ffb609cee3a4..d3a521bead3e 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -258,6 +258,15 @@ config SENSORS_MAX8688
 	  This driver can also be built as a module. If so, the module will
 	  be called max8688.
 
+config SENSORS_MP2949A
+	tristate "MPS MP2949A"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP2949A Triple Loop Digital Multi-Phase Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp2949a.
+
 config SENSORS_MP2888
 	tristate "MPS MP2888"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 0ed4d596a948..bfdfb599c8ba 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+obj-$(CONFIG_SENSORS_MP2949A)	+= mp2949a.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
diff --git a/drivers/hwmon/pmbus/mp2949a.c b/drivers/hwmon/pmbus/mp2949a.c
new file mode 100644
index 000000000000..8f8dd3235298
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2949a.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Monolithic Power Systems MP2949A
+ *
+ * Copyright (c) 2021 Lemote Technologies. All rights reserved.
+ * Copyright (c) 2021 Ainux <ainux.wang@gmail.com>
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define MP2949A_PAGE_NUM		3
+
+#define MP2949A_MFR_VR_CONFIG	0xE4
+
+static int mp2949a_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	switch (reg) {
+	/*
+	 * This chip do not support the VOUT_MODE, STATUS_BYTE command,
+	 * but return some random data when reading.
+	 */
+	case PMBUS_VOUT_MODE:
+	case PMBUS_STATUS_BYTE:
+		return -ENXIO;
+	default:
+		return -ENODATA;
+	}
+}
+
+static int mp2949a_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+
+	switch (reg) {
+	/*
+	 * This chip do not support STATUS_WORD command,
+	 * but return some random data when reading.
+	 */
+	case PMBUS_STATUS_WORD:
+		return -ENXIO;
+	default:
+		return -ENODATA;
+	}
+}
+
+static int mp2949a_identify(struct i2c_client *client,
+			    struct pmbus_driver_info *info)
+{
+	int i, ret;
+
+	for (i = 0; i < MP2949A_PAGE_NUM; i++) {
+		ret = pmbus_read_byte_data(client, i, MP2949A_MFR_VR_CONFIG);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * Rail A bit 5, Rail B bit 4, Rail C bit 3.
+		 * 1'b1: 5mV  (vr12/imvp8)
+		 * 1'b0: 10mv (imvp9)
+		 */
+		info->vrm_version[i] = (ret & BIT(5 - i)) ? vr12 : imvp9;
+	}
+
+	return 0;
+}
+
+static struct pmbus_driver_info mp2949a_info = {
+	.pages = MP2949A_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = vid,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_POWER] = direct,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_POUT,
+	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_POUT,
+	.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_POUT,
+	.identify = mp2949a_identify,
+	.read_byte_data = mp2949a_read_byte_data,
+	.read_word_data = mp2949a_read_word_data,
+};
+
+static int mp2949a_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct pmbus_driver_info *info;
+
+	info = devm_kmemdup(&client->dev, &mp2949a_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id mp2949a_id[] = {
+	{"mp2949a", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, mp2949a_id);
+
+static const struct of_device_id mp2949a_of_match[] = {
+	{.compatible = "mps,mp2949a"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2949a_of_match);
+
+static struct i2c_driver mp2949a_driver = {
+	.driver = {
+		.name = "mp2949a",
+		.of_match_table = of_match_ptr(mp2949a_of_match),
+	},
+	.probe = mp2949a_probe,
+	.id_table = mp2949a_id,
+};
+
+module_i2c_driver(mp2949a_driver);
+
+MODULE_AUTHOR("Ainux <ainux.wang@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for Monolithic Power Systems MP2949A");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.18.1

