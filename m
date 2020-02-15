Return-Path: <SRS0=9cdn=4D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5203AC2BA83
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 297642082F
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3ot+X7q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgBOM0Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Feb 2020 07:26:16 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45434 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgBOM0P (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Feb 2020 07:26:15 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so6426394pgk.12
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Feb 2020 04:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ksNM6jghe9F5KXhnDhz1gSh9uMRZEsmAFlnASz7qBgg=;
        b=n3ot+X7qvlrIph/8O51/nRoRic5GozS1HSI0buE94OSL8cE529OOAYRt/W1RZ+oojI
         3w8YjjqSJxToe0eDIBTeKua5tplmFOXd/byG4quFrfgSBl0V9wo1v5QICGBT0VruZ95+
         sdtOZVvHpw+DYKsDI4BeHhvBXWj+i63lk17hsX+pN0sIlDiFpILpZbRVCZ7dluGXggxc
         OMWH6EuR7vS7Cy1krN7DNtcwQPaa14VlUw6h//r2hH9dAsX4OWZLGch0YrfvqCAj4eqC
         TRcTDTDmS9ZhI+lZs/ecaRxrQMQfmWNhfTncAD1WJmhdwUu7Cq4Fx8KR/4CsJ+s8PYnk
         440w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ksNM6jghe9F5KXhnDhz1gSh9uMRZEsmAFlnASz7qBgg=;
        b=Vm0PN0w5u04OqlRGhRaXaWHA0BO4JX96Mko89q5dfS1uHruP6JqV9/NehM/SgfJuAJ
         b62BjcK4R7YfwlxDP+U4HrA4WpcajherF+7Vhkgf+MjfUf1WpO0p57Rkxw9dpj+lv7y9
         j1hbFu6FWWp9u8oo3MtjruHWN7LsXcAaM0Ct97uesV3DSfRuRgothjRTrRG2r1O3w7gT
         Lya1vWvcwvqN53sXMzmJBDtkwUz2xEKnXt+Q1orwdVH/QHQmKcPL6DpROGUU1/YZuML1
         yJmIPKA3ESK7yzUzHYHvKbfJrcPMTJ65TfLkAACGnBQXqJOIyVKhP7fedKfYOZCchtUR
         St/Q==
X-Gm-Message-State: APjAAAXXYceFbnnw1J8QMasqM6xNTCDApbUlQWbvihB5rGhExdjmGh/i
        /SzGBe2sjfpnMkT42hNQxF99uW4a
X-Google-Smtp-Source: APXvYqzH5RALg3NXX9W7AVykLd8/IuubdwV2uJDJOzSON/h6ch4ui/yBSCUllvb9IflEXoHxj/b8HQ==
X-Received: by 2002:a62:2b8a:: with SMTP id r132mr7848652pfr.56.1581769574850;
        Sat, 15 Feb 2020 04:26:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z4sm10394001pfn.42.2020.02.15.04.26.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:26:14 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 7/8] hwmon: (pmbus/tps53679) Add support for TPS53647 and TPS53667
Date:   Sat, 15 Feb 2020 04:26:01 -0800
Message-Id: <20200215122602.14245-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215122602.14245-1-linux@roeck-us.net>
References: <20200215122602.14245-1-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TPS53647 and TPS53667 are single channel, Step-Down Buck Controllers.
TPS53647 supports 4 phases, TPS53667 supports 6 phases.
The chips do not support per-phase output telemetry.

Cc: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/Kconfig    |  4 ++--
 drivers/hwmon/pmbus/tps53679.c | 15 +++++++++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 07bd5a4592bf..3b8ae69254e8 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -209,10 +209,10 @@ config SENSORS_TPS40422
 	  be called tps40422.
 
 config SENSORS_TPS53679
-	tristate "TI TPS53679, TPS53681, TPS53688"
+	tristate "TI TPS53647, TPS53667, TPS53679, TPS53681, TPS53688"
 	help
 	  If you say yes here you get hardware monitoring support for TI
-	  TPS53679, TPS53681, and TPS53688.
+	  TPS53647, TPS53667, TPS53679, TPS53681, and TPS53688.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called tps53679.
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index eb6e2ea0e66c..157c99ffb52b 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -16,9 +16,11 @@
 #include "pmbus.h"
 
 enum chips {
-	tps53679, tps53681, tps53688
+	tps53647, tps53667, tps53679, tps53681, tps53688
 };
 
+#define TPS53647_PAGE_NUM		1
+
 #define TPS53679_PROT_VR12_5MV		0x01 /* VR12.0 mode, 5-mV DAC */
 #define TPS53679_PROT_VR12_5_10MV	0x02 /* VR12.5 mode, 10-mV DAC */
 #define TPS53679_PROT_VR13_10MV		0x04 /* VR13.0 mode, 10-mV DAC */
@@ -38,7 +40,7 @@ static int tps53679_identify_mode(struct i2c_client *client,
 	u8 vout_params;
 	int i, ret;
 
-	for (i = 0; i < TPS53679_PAGE_NUM; i++) {
+	for (i = 0; i < info->pages; i++) {
 		/* Read the register with VOUT scaling value.*/
 		ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
 		if (ret < 0)
@@ -198,6 +200,11 @@ static int tps53679_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	switch (chip_id) {
+	case tps53647:
+	case tps53667:
+		info->pages = TPS53647_PAGE_NUM;
+		info->identify = tps53679_identify;
+		break;
 	case tps53679:
 	case tps53688:
 		info->pages = TPS53679_PAGE_NUM;
@@ -217,6 +224,8 @@ static int tps53679_probe(struct i2c_client *client,
 }
 
 static const struct i2c_device_id tps53679_id[] = {
+	{"tps53647", tps53647},
+	{"tps53667", tps53667},
 	{"tps53679", tps53679},
 	{"tps53681", tps53681},
 	{"tps53688", tps53688},
@@ -226,6 +235,8 @@ static const struct i2c_device_id tps53679_id[] = {
 MODULE_DEVICE_TABLE(i2c, tps53679_id);
 
 static const struct of_device_id __maybe_unused tps53679_of_match[] = {
+	{.compatible = "ti,tps53647", .data = (void *)tps53647},
+	{.compatible = "ti,tps53667", .data = (void *)tps53667},
 	{.compatible = "ti,tps53679", .data = (void *)tps53679},
 	{.compatible = "ti,tps53681", .data = (void *)tps53681},
 	{.compatible = "ti,tps53688", .data = (void *)tps53688},
-- 
2.17.1

