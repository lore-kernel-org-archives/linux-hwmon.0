Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB7DC4743C
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jun 2021 01:50:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5B0B6112D
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jun 2021 01:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhFVBwn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Jun 2021 21:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhFVBwl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Jun 2021 21:52:41 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBC8C061574;
        Mon, 21 Jun 2021 18:50:25 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 21so203507pfp.3;
        Mon, 21 Jun 2021 18:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WEh2C5RTplB4m7kF5vDh4E3kFBNUQxdOONC7KLyqYPA=;
        b=G6bOR7Byn893MtwEjnuZcrLTyCVISi5lgTSONuekJ99BgjkEuyegYMRfU2RkR3pVmk
         nJKAV2t2HmSD+aGE0vQWmpw0UI2lNH1+EdNooFFm1Kp4WFVSFvow0qgtsMnFvqilNqT1
         z2/KC2uveUK7Cp9N/Mf1hUK382aLgUqIJXpI8l8mB7roO5OqfLMLBT/j6U7WJy8fz4rF
         +TQCRxHe2tXXCvrvWc5jkuZooHqZBCLWUIGb46wzQ9Gp2/PM7knwg/78h3FqN+as5wXz
         HXq4Yben4rBUho20CEoxxX1CFZAtAnAwJ7qm/Y9yjSbNzzyxqYD0S6PhIbNGb3fPXAA5
         OtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WEh2C5RTplB4m7kF5vDh4E3kFBNUQxdOONC7KLyqYPA=;
        b=o2blxC1dS3mqm4o/KMcr7Ssni7Q69CTZNU0vKT27Pu2uN1JeiatcqIS11IArtj6QZX
         cfcRPS1Ufk1Hu8wvW8yenPTSqYdLENOAGyjI4DDTDgC2dhkerStd6mS9GIqSg0wJ2cYT
         0se/ebG83kexGoimg0e1TnG5Oehf0TH0JU5fWtwErVoSKgCX97efGJWslbsLwLwRbq1F
         5Sj6nixUb0B/7EWhDecl0oFClEg/nPSufJzCVE3XEeOwSNallVV8WnPs4GCYCLqUkBeX
         HYjRt63io9VQc4cT7BVTXfUyT2IK0a4k4TrKSTaaWdzaUTNoEFFvHu4izo19mIqX22tx
         8nfw==
X-Gm-Message-State: AOAM533fdp3k9mGFCwDN+xkYHuVp/agJjEr3QP+q3+Syist7qakWBd/T
        7iDL4YwsqQXMRU30ZrdWXVU=
X-Google-Smtp-Source: ABdhPJyFk7XLXGGUktQPnXMN2S08gUxxutkUp6HWP1/f83mzpzffDffw/K7MUxfrr9HqrKDDJzSJeQ==
X-Received: by 2002:a62:7b4c:0:b029:300:6209:83e with SMTP id w73-20020a627b4c0000b02903006209083emr1096198pfc.59.1624326624875;
        Mon, 21 Jun 2021 18:50:24 -0700 (PDT)
Received: from localhost.localdomain ([52.184.54.196])
        by smtp.gmail.com with ESMTPSA id 125sm7345710pfx.175.2021.06.21.18.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 18:50:24 -0700 (PDT)
From:   ainux.wang@gmail.com
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        ainux.wang@gmail.com
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        sterlingteng@gmail.com, chenhuacai@kernel.org,
        chenhuacai@loongson.cn
Subject: [PATCH v3] hwmon: (pmbus) Add support for MPS MP2949A
Date:   Tue, 22 Jun 2021 09:50:11 +0800
Message-Id: <20210622015011.5703-1-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
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

v3:
- Added change log here.
- Errors in the document have been modified.
- Fixed PMBUS_VOUT_MODE to MP2949A_MFR_VR_CONFIG.
- Removed unnecessary vout_params and empty line.

v2:
- Reference has been added to Documentation/hwmon/index.rst.
- Droped 'vendor'.
- Removed change codes of the PMBus core and added mp2949a_identify()
  and mp2949a_read_byte_data() to this driver.

v1:
- Add support for MPS MP2949A.
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/mp2949a.rst |  44 ++++++++++++
 drivers/hwmon/pmbus/Kconfig     |   9 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/mp2949a.c   | 118 ++++++++++++++++++++++++++++++++
 5 files changed, 173 insertions(+)
 create mode 100644 Documentation/hwmon/mp2949a.rst
 create mode 100644 drivers/hwmon/pmbus/mp2949a.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9ed60fa84cbe..56aac3b1678d 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -137,6 +137,7 @@ Hardware Monitoring Kernel Drivers
    mcp3021
    menf21bmc
    mlxreg-fan
+   mp2949a
    mp2975
    nct6683
    nct6775
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
index 37a5c39784fa..b1344b265976 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -248,6 +248,15 @@ config SENSORS_MAX8688
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
 config SENSORS_MP2975
 	tristate "MPS MP2975"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index f8dcc27cd56a..bfb55ab12da1 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+obj-$(CONFIG_SENSORS_MP2949A)	+= mp2949a.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
diff --git a/drivers/hwmon/pmbus/mp2949a.c b/drivers/hwmon/pmbus/mp2949a.c
new file mode 100644
index 000000000000..744c88b8ebca
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2949a.c
@@ -0,0 +1,118 @@
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
+	case PMBUS_VOUT_MODE:
+		/*
+		 * This chip do not support the VOUT_MODE command.
+		 * There is not VOUT_MODE command in MP2949A datasheet P29~P31.
+		 * So there is a EINVAL in here.
+		 */
+		return -EINVAL;
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
+		info->vrm_version[i] = (ret & ~BIT(5-i)) ? vr12 : imvp9;
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
-- 
2.18.1

