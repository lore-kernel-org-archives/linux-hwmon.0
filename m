Return-Path: <SRS0=9cdn=4D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C51AC4741C
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC8682083B
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz3W9UT1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgBOM0O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Feb 2020 07:26:14 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:54537 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgBOM0O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Feb 2020 07:26:14 -0500
Received: by mail-pj1-f67.google.com with SMTP id dw13so5182213pjb.4
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Feb 2020 04:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nhecDubL59hJk+LQ1GiKxKu1rI6q/YrXu6oshEKLiHA=;
        b=Oz3W9UT1AbwL0nEVeGfcxXoo4bMKJOrWHcQiqurwBmDgONG80aM3NL51+dPjJq6+0b
         Y7PAoAbJTuQWQVQvl1HjQddrIj+ptz5kzXrEv3COK4QfM+5Jh2SmwUv48NjrLuo6mFq6
         Iw2nTYNV1wzTJ7Ya0RCPOv+7ueOhKYW0kboa7nEQ4fzv17qfm+8UldZhOyVw6+mCXcA1
         L8BAW/RJT6M2blrUUBgi/pM622jkr7BXC9ij60949yWmuSqNVlALipnqZ7UtB1fSMoxg
         xPoFYGyfCdfYnI2sTI5lLLvuAWYJlHSEYLdv4yNFAlRCVjKT9kwWDshuf5knbQknOuhr
         iWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nhecDubL59hJk+LQ1GiKxKu1rI6q/YrXu6oshEKLiHA=;
        b=TWTXeKiv0Pzdoj0Qx+NdP2VwmNWvOk/OmBjIz/j8yH88/jgIboNRnhk1/Z1nA6P8Pw
         laBWwsN/GUlsSAhwzbSNPi4MxAeq/07o4zqtywR/hbCEFuNon9eIUfTNN6IwJgGDgHNV
         1FdnBgEkHDP7I9HzhuyU//1vd+diyJTXL6wx1oxEn0Jk+n9mzMewosTyyFS/gQ1YiKRD
         QJVl6i4T2ZmqlChNKAylXpcl8dr9EJSJZvoLwobXcGlY0dT7w9DiH442aLvdKijEGoah
         2CEYK1c4n+KolC1IDLM2dCCWrPRAyC4CLtfA1rqCOZPTv4q9WZ5EFGhxf8hfvcHRWABL
         dDTA==
X-Gm-Message-State: APjAAAUvlyvchb20eRobAYujy9lIEHgqtsEKJcHMf/kgZI/D5LecLIdD
        ZrynK51gE3+SseMjtQZ50OhzJ5lF
X-Google-Smtp-Source: APXvYqzXIDApculiRTlFN7nkT8y9dr/ZbJkSaq2+YvGQahBcSj/fVwus+HZhtMmnjp/kdysRYIjMGw==
X-Received: by 2002:a17:90a:ff15:: with SMTP id ce21mr9329832pjb.124.1581769573499;
        Sat, 15 Feb 2020 04:26:13 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g10sm10751636pfo.166.2020.02.15.04.26.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:26:13 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 6/8] hwmon: (pmbus/tps53679) Add support for TPS53681
Date:   Sat, 15 Feb 2020 04:26:00 -0800
Message-Id: <20200215122602.14245-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215122602.14245-1-linux@roeck-us.net>
References: <20200215122602.14245-1-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TPS53681 is a dual-channel multiphase step-down controller
supporting per-phase and per-channel output telemetry.

Cc: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/Kconfig    |   4 +-
 drivers/hwmon/pmbus/tps53679.c | 120 ++++++++++++++++++++++++++++++++-
 2 files changed, 119 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index a9ea06204767..07bd5a4592bf 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -209,10 +209,10 @@ config SENSORS_TPS40422
 	  be called tps40422.
 
 config SENSORS_TPS53679
-	tristate "TI TPS53679, TPS53688"
+	tristate "TI TPS53679, TPS53681, TPS53688"
 	help
 	  If you say yes here you get hardware monitoring support for TI
-	  TPS53679, TPS53688
+	  TPS53679, TPS53681, and TPS53688.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called tps53679.
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 2a6495424a87..eb6e2ea0e66c 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
  */
 
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -15,7 +16,7 @@
 #include "pmbus.h"
 
 enum chips {
-	tps53679, tps53688,
+	tps53679, tps53681, tps53688
 };
 
 #define TPS53679_PROT_VR12_5MV		0x01 /* VR12.0 mode, 5-mV DAC */
@@ -25,8 +26,14 @@ enum chips {
 #define TPS53679_PROT_VR13_5MV		0x07 /* VR13.0 mode, 5-mV DAC */
 #define TPS53679_PAGE_NUM		2
 
-static int tps53679_identify(struct i2c_client *client,
-			     struct pmbus_driver_info *info)
+#define TPS53681_DEVICE_ID		0x81
+
+#define TPS53681_PMBUS_REVISION		0x33
+
+#define TPS53681_MFR_SPECIFIC_20	0xe4	/* Number of phases, per page */
+
+static int tps53679_identify_mode(struct i2c_client *client,
+				  struct pmbus_driver_info *info)
 {
 	u8 vout_params;
 	int i, ret;
@@ -57,6 +64,99 @@ static int tps53679_identify(struct i2c_client *client,
 	return 0;
 }
 
+static int tps53679_identify_phases(struct i2c_client *client,
+				    struct pmbus_driver_info *info)
+{
+	int ret;
+
+	/* On TPS53681, only channel A provides per-phase output current */
+	ret = pmbus_read_byte_data(client, 0, TPS53681_MFR_SPECIFIC_20);
+	if (ret < 0)
+		return ret;
+	info->phases[0] = (ret & 0x07) + 1;
+
+	return 0;
+}
+
+static int tps53679_identify_chip(struct i2c_client *client,
+				  u8 revision, u16 id)
+{
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	int ret;
+
+	ret = pmbus_read_byte_data(client, 0, PMBUS_REVISION);
+	if (ret < 0)
+		return ret;
+	if (ret != revision) {
+		dev_err(&client->dev, "Unexpected PMBus revision 0x%x\n", ret);
+		return -ENODEV;
+	}
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+	if (ret < 0)
+		return ret;
+	if (ret != 1 || buf[0] != id) {
+		dev_err(&client->dev, "Unexpected device ID 0x%x\n", buf[0]);
+		return -ENODEV;
+	}
+	return 0;
+}
+
+/*
+ * Common identification function for chips with multi-phase support.
+ * Since those chips have special configuration registers, we want to have
+ * some level of reassurance that we are really talking with the chip
+ * being probed. Check PMBus revision and chip ID.
+ */
+static int tps53679_identify_multiphase(struct i2c_client *client,
+					struct pmbus_driver_info *info,
+					int pmbus_rev, int device_id)
+{
+	int ret;
+
+	ret = tps53679_identify_chip(client, pmbus_rev, device_id);
+	if (ret < 0)
+		return ret;
+
+	ret = tps53679_identify_mode(client, info);
+	if (ret < 0)
+		return ret;
+
+	return tps53679_identify_phases(client, info);
+}
+
+static int tps53679_identify(struct i2c_client *client,
+			     struct pmbus_driver_info *info)
+{
+	return tps53679_identify_mode(client, info);
+}
+
+static int tps53681_identify(struct i2c_client *client,
+			     struct pmbus_driver_info *info)
+{
+	return tps53679_identify_multiphase(client, info,
+					    TPS53681_PMBUS_REVISION,
+					    TPS53681_DEVICE_ID);
+}
+
+static int tps53681_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
+{
+	/*
+	 * For reading the total output current (READ_IOUT) for all phases,
+	 * the chip datasheet is a bit vague. It says "PHASE must be set to
+	 * FFh to access all phases simultaneously. PHASE may also be set to
+	 * 80h readack (!) the total phase current".
+	 * Experiments show that the command does _not_ report the total
+	 * current for all phases if the phase is set to 0xff. Instead, it
+	 * appears to report the current of one of the phases. Override phase
+	 * parameter with 0x80 when reading the total output current on page 0.
+	 */
+	if (reg == PMBUS_READ_IOUT && page == 0 && phase == 0xff)
+		return pmbus_read_word_data(client, page, 0x80, reg);
+	return -ENODATA;
+}
+
 static struct pmbus_driver_info tps53679_info = {
 	.format[PSC_VOLTAGE_IN] = linear,
 	.format[PSC_VOLTAGE_OUT] = vid,
@@ -73,6 +173,12 @@ static struct pmbus_driver_info tps53679_info = {
 		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_POUT,
+	.pfunc[0] = PMBUS_HAVE_IOUT,
+	.pfunc[1] = PMBUS_HAVE_IOUT,
+	.pfunc[2] = PMBUS_HAVE_IOUT,
+	.pfunc[3] = PMBUS_HAVE_IOUT,
+	.pfunc[4] = PMBUS_HAVE_IOUT,
+	.pfunc[5] = PMBUS_HAVE_IOUT,
 };
 
 static int tps53679_probe(struct i2c_client *client,
@@ -97,6 +203,12 @@ static int tps53679_probe(struct i2c_client *client,
 		info->pages = TPS53679_PAGE_NUM;
 		info->identify = tps53679_identify;
 		break;
+	case tps53681:
+		info->pages = TPS53679_PAGE_NUM;
+		info->phases[0] = 6;
+		info->identify = tps53681_identify;
+		info->read_word_data = tps53681_read_word_data;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -106,6 +218,7 @@ static int tps53679_probe(struct i2c_client *client,
 
 static const struct i2c_device_id tps53679_id[] = {
 	{"tps53679", tps53679},
+	{"tps53681", tps53681},
 	{"tps53688", tps53688},
 	{}
 };
@@ -114,6 +227,7 @@ MODULE_DEVICE_TABLE(i2c, tps53679_id);
 
 static const struct of_device_id __maybe_unused tps53679_of_match[] = {
 	{.compatible = "ti,tps53679", .data = (void *)tps53679},
+	{.compatible = "ti,tps53681", .data = (void *)tps53681},
 	{.compatible = "ti,tps53688", .data = (void *)tps53688},
 	{}
 };
-- 
2.17.1

