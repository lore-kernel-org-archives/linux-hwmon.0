Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7FFC433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jan 2021 19:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A2B722CE3
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jan 2021 19:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbhAZF6R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:58:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731339AbhAYSy1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Jan 2021 13:54:27 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10EBCC061786
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Jan 2021 10:53:47 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id y14so3511028oom.10
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Jan 2021 10:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QYcKf/s5DcLjzYHamtN6qRxcNYWbi1B8AZcGdTSP0Dc=;
        b=rkjNUMuuD9xCB1UzrXJMd42AfkcVhkxv0dfD/wYBiKoN3/J8VamGVgwRxCPEXKp68E
         6LbqvngiaajiZwM5fhQmDfm+4wbTHvyZRICU449fweGuc/52GI4a7R5aIrk+6YOVJW4W
         MtUCpbeE/xTP5o1MAZ8TFizweQKwe5TPZuMRcKpyHObJAfoopFlQpTsiqCQNRtBlrOEr
         RChHvr/oSMwRnINqgJC1/pVxU8d3CqVHuy/SQQKRm7UHQCCA2Lntvv12/czPGuAaIIGs
         BTfTD9s3vd5LlkSYwYgzxPktglG1WVVstUfQtv3CcVDFUkl/abTloSGMlVkrER8Jb1Lg
         g48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=QYcKf/s5DcLjzYHamtN6qRxcNYWbi1B8AZcGdTSP0Dc=;
        b=Co6ret/93DPBMX+OhV2ryZvAhdZljCDcDKTCRFEVAT7xsYtKN1SbIA4XOzUhpW7qEW
         fsQh0jgK01vI42G7dDO3RkV5L6cgYmydQHvdkTN9bGE0rGMuddcxRBCooS3CZcaxOvHG
         hs/gup1Op0ESNIZtCx9ILYQ/opvhDfDVKfSs+DWNFHmyGGF8Z69ft1/Xv5Yb/nCUjjl0
         S0dfgluPq7J0aEmzZS610Y5xRGv8b4529MRtHMISIklsBSm3F5vBbaY3XumePjKYRKWH
         BRMsZwWbb0/bOVYGgFu/P4tepWIbcQYKwWKHO6aQMzpQMsYDNllaXZQaAEYBINqbSxhG
         RsWg==
X-Gm-Message-State: AOAM5322YjUZKohGm33ZtOdNa3U460oGzturRjFA9jj4oKuUu0DThcq6
        TvkGHwV5Kmy/AXi8a+wFZ+ihKynmsIQ=
X-Google-Smtp-Source: ABdhPJzknyLeJdWkYw0LM8in9GLHtOxokDZBJyRXhMGVGSAnuA3X/9yb0BJn5EB6g1WN4jiSx+Pq7g==
X-Received: by 2002:a4a:bc8d:: with SMTP id m13mr1391767oop.72.1611600825890;
        Mon, 25 Jan 2021 10:53:45 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q20sm3627134otf.2.2021.01.25.10.53.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 10:53:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Alex Qiu <xqiu@google.com>,
        Ugur Usug <Ugur.Usug@maximintegrated.com>
Subject: [PATCH 2/2] RFT: hwmon: (pmbus/max16601) Add support for MAX16508
Date:   Mon, 25 Jan 2021 10:53:27 -0800
Message-Id: <20210125185327.93282-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210125185327.93282-1-linux@roeck-us.net>
References: <20210125185327.93282-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

MAX16508 is quite similar to MAX16601, except that it does not support
the DEFAULT_NUM_POP register and we thus can not dynamically determine
the number of populated phases.

Cc: Alex Qiu <xqiu@google.com>
Cc: Ugur Usug <Ugur.Usug@maximintegrated.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Tested with MAX16601 to ensure that it doesn't break existing support,
but untested on MAX16508.

The most likely cause of failure is the chip detection string: The
datasheet suggests that it is "MAX16500" for all chips in the MAX165xx
series, but without hardware that is all but impossible to confirm.

It should also be confirmed that REG_DEFAULT_NUM_POP (the expected
number of populated phases) is indeed not supported on MAX16508.

 Documentation/hwmon/max16601.rst | 12 +++++-
 drivers/hwmon/pmbus/Kconfig      |  4 +-
 drivers/hwmon/pmbus/max16601.c   | 74 +++++++++++++++++++++++---------
 3 files changed, 66 insertions(+), 24 deletions(-)

diff --git a/Documentation/hwmon/max16601.rst b/Documentation/hwmon/max16601.rst
index 93d25dfa028e..d16792be7533 100644
--- a/Documentation/hwmon/max16601.rst
+++ b/Documentation/hwmon/max16601.rst
@@ -5,6 +5,14 @@ Kernel driver max16601
 
 Supported chips:
 
+  * Maxim MAX16508
+
+    Prefix: 'max16508'
+
+    Addresses scanned: -
+
+    Datasheet: Not published
+
   * Maxim MAX16601
 
     Prefix: 'max16601'
@@ -19,8 +27,8 @@ Author: Guenter Roeck <linux@roeck-us.net>
 Description
 -----------
 
-This driver supports the MAX16601 VR13.HC Dual-Output Voltage Regulator
-Chipset.
+This driver supports the MAX16508 VR13 Dual-Output Voltage Regulator
+as well as the MAX16601 VR13.HC Dual-Output Voltage Regulator chipsets.
 
 The driver is a client driver to the core PMBus driver.
 Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 03606d4298a4..32d2fc850621 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -158,10 +158,10 @@ config SENSORS_MAX16064
 	  be called max16064.
 
 config SENSORS_MAX16601
-	tristate "Maxim MAX16601"
+	tristate "Maxim MAX16508, MAX16601"
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
-	  MAX16601.
+	  MAX16508 and MAX16601.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called max16601.
diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index efe6da3bc8d0..0d1204c2dd54 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Hardware monitoring driver for Maxim MAX16601
+ * Hardware monitoring driver for Maxim MAX16508 and MAX16601.
  *
  * Implementation notes:
  *
- * Ths chip supports two rails, VCORE and VSA. Telemetry information for the
- * two rails is reported in two subsequent I2C addresses. The driver
+ * This chip series supports two rails, VCORE and VSA. Telemetry information
+ * for the two rails is reported in two subsequent I2C addresses. The driver
  * instantiates a dummy I2C client at the second I2C address to report
  * information for the VSA rail in a single instance of the driver.
  * Telemetry for the VSA rail is reported to the PMBus core in PMBus page 2.
@@ -31,6 +31,8 @@
 
 #include "pmbus.h"
 
+enum chips { max16508, max16601 };
+
 #define REG_DEFAULT_NUM_POP	0xc4
 #define REG_SETPT_DVID		0xd1
 #define  DAC_10MV_MODE		BIT(4)
@@ -44,6 +46,7 @@
 #define MAX16601_NUM_PHASES	8
 
 struct max16601_data {
+	enum chips id;
 	struct pmbus_driver_info info;
 	struct i2c_client *vsa;
 	int iout_avg_pkg;
@@ -188,6 +191,7 @@ static int max16601_write_word(struct i2c_client *client, int page, int reg,
 static int max16601_identify(struct i2c_client *client,
 			     struct pmbus_driver_info *info)
 {
+	struct max16601_data *data = to_max16601_data(info);
 	int reg;
 
 	reg = i2c_smbus_read_byte_data(client, REG_SETPT_DVID);
@@ -198,6 +202,9 @@ static int max16601_identify(struct i2c_client *client,
 	else
 		info->vrm_version[0] = vr12;
 
+	if (data->id != max16601)
+		return 0;
+
 	reg = i2c_smbus_read_byte_data(client, REG_DEFAULT_NUM_POP);
 	if (reg < 0)
 		return reg;
@@ -254,28 +261,61 @@ static void max16601_remove(void *_data)
 	i2c_unregister_device(data->vsa);
 }
 
-static int max16601_probe(struct i2c_client *client)
+static const struct i2c_device_id max16601_id[] = {
+	{"max16508", max16508},
+	{"max16601", max16601},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, max16601_id);
+
+static int max16601_get_id(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
-	struct max16601_data *data;
+	enum chips id;
 	int ret;
 
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_READ_BYTE_DATA |
-				     I2C_FUNC_SMBUS_READ_BLOCK_DATA))
-		return -ENODEV;
-
 	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
-	if (ret < 0)
+	if (ret < 0 || ret < 11)
 		return -ENODEV;
 
-	/* PMBUS_IC_DEVICE_ID is expected to return "MAX16601y.xx" */
-	if (ret < 11 || strncmp(buf, "MAX16601", 8)) {
+	/*
+	 * PMBUS_IC_DEVICE_ID is expected to return "MAX16601y.xx"
+	 * or "MAX16500y.xx".
+	 */
+	if (!strncmp(buf, "MAX16500", 8)) {
+		id = max16508;
+	} else if (!strncmp(buf, "MAX16601", 8)) {
+		id = max16601;
+	} else {
 		buf[ret] = '\0';
 		dev_err(dev, "Unsupported chip '%s'\n", buf);
 		return -ENODEV;
 	}
+	return id;
+}
+
+static int max16601_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	const struct i2c_device_id *id;
+	struct max16601_data *data;
+	int ret, chip_id;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_BYTE_DATA |
+				     I2C_FUNC_SMBUS_READ_BLOCK_DATA))
+		return -ENODEV;
+
+	chip_id = max16601_get_id(client);
+	if (chip_id < 0)
+		return chip_id;
+
+	id = i2c_match_id(max16601_id, client);
+	if (chip_id != id->driver_data)
+		dev_warn(&client->dev,
+			 "Device mismatch: Configured %s (%d), detected %d\n",
+			 id->name, (int) id->driver_data, chip_id);
 
 	ret = i2c_smbus_read_byte_data(client, REG_PHASE_ID);
 	if (ret < 0)
@@ -290,6 +330,7 @@ static int max16601_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	data->id = chip_id;
 	data->iout_avg_pkg = 0xfc00;
 	data->vsa = i2c_new_dummy_device(client->adapter, client->addr + 1);
 	if (IS_ERR(data->vsa)) {
@@ -305,13 +346,6 @@ static int max16601_probe(struct i2c_client *client)
 	return pmbus_do_probe(client, &data->info);
 }
 
-static const struct i2c_device_id max16601_id[] = {
-	{"max16601", 0},
-	{}
-};
-
-MODULE_DEVICE_TABLE(i2c, max16601_id);
-
 static struct i2c_driver max16601_driver = {
 	.driver = {
 		   .name = "max16601",
-- 
2.17.1

