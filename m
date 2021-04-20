Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E52C433ED
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 06:09:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11E0560FEA
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 06:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhDTGJi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Apr 2021 02:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhDTGJg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Apr 2021 02:09:36 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4A3C061763
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Apr 2021 23:09:04 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id c6-20020a4aacc60000b02901e6260b12e2so5760952oon.3
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Apr 2021 23:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=DxS2T6SCOzKw3P1jhRjh2EcCf6lyiDck+j5B0ooO0TE=;
        b=lZ1qT4xzaIjzFrzlm5r0mxj1mbqWnDRhzSU2nCbuehXdBWuqM7GwzyrMqjml7uspWI
         gA5+DJFIw8RWgwwrHS/z/zmvews5Pz08SDt9zZpTV/D83dyOnc3ym+pHRipp6jMB2gQ7
         cG2QkLMuN+KTMo9/CGawpKwV1FkeAS4Hwz24+gjv2oDX0TFoVPTLCrLta/Ab8T9DQejR
         NgYMFyeqsqa7Ebth533s+8x8yhU+CxALnozFQ0NoWc6LWpYqC6zJHx+I0mcBb30t6i2Z
         VXpsZrycW8d7E3NwTyx+A81PyBkpyRMmi0TFGO37lqMhcSL4Y+AocvqGPNE/yGizlrTv
         ydwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=DxS2T6SCOzKw3P1jhRjh2EcCf6lyiDck+j5B0ooO0TE=;
        b=OH7fvm40evaHSplZrfY4NmBp4NFHuWUqnhS/gYn0xF1wykTiofwGBnOgBSKD2eky+x
         n3QYxOp5K8UNUNJXAa6nK+GxPa7nv9W1J0EdpIaxmKrGpLXi+R65Tkn6ZFAIVSovR/gW
         jMya8Xct2HD1ULBRXq9TpR6kL+svdwmanx9tkzMUz9FPeP76ounrRSQ8DW8cMWJGuMwY
         oIFxJEOh6Od3PNBmJTsKhHN4ww7xTQtPZ0gascYE8ZOl562eZh/l5/7cF4EsEW2NUAu1
         gdiMBnvcSj/3g8wBDsz4L2/IP3vt8rMlkAYYsTk96YCcHKy83uI7Bv1/73MQ6d5iq6WA
         V+4w==
X-Gm-Message-State: AOAM5309cwbxFJoG5Nmk2Xwr7DDD6voD/x0tVbU3ToUPCGuNQWjA8KbG
        xrtgKlD7PBAui1dxie7U9c65oEVZEzQ=
X-Google-Smtp-Source: ABdhPJykaKio7nCBEJAaAqd2HMR98e5gNAdyWqnifZUD+3+VGvOKZVegVA0DFXfruT/USBLMvIyYtg==
X-Received: by 2002:a4a:d80e:: with SMTP id f14mr13012746oov.54.1618898943952;
        Mon, 19 Apr 2021 23:09:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d7sm37421oib.49.2021.04.19.23.09.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 23:09:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus) Introduce PMBUS symbol namespace
Date:   Mon, 19 Apr 2021 23:09:01 -0700
Message-Id: <20210420060901.179467-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Exported pmbus symbols are only supposed to be used from PMBus code.
Introduce PMBUS symbol namespace to prevent misuse from other code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/Makefile     |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 38 ++++++++++++++++----------------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index f8dcc27cd56a..ef99c855e405 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -3,6 +3,8 @@
 # Makefile for PMBus chip drivers.
 #
 
+ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=PMBUS
+
 obj-$(CONFIG_PMBUS)		+= pmbus_core.o
 obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index e9e6a47f3bf7..bbd745178147 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -139,7 +139,7 @@ void pmbus_clear_cache(struct i2c_client *client)
 	for (sensor = data->sensors; sensor; sensor = sensor->next)
 		sensor->data = -ENODATA;
 }
-EXPORT_SYMBOL_GPL(pmbus_clear_cache);
+EXPORT_SYMBOL_NS_GPL(pmbus_clear_cache, PMBUS);
 
 void pmbus_set_update(struct i2c_client *client, u8 reg, bool update)
 {
@@ -150,7 +150,7 @@ void pmbus_set_update(struct i2c_client *client, u8 reg, bool update)
 		if (sensor->reg == reg)
 			sensor->update = update;
 }
-EXPORT_SYMBOL_GPL(pmbus_set_update);
+EXPORT_SYMBOL_NS_GPL(pmbus_set_update, PMBUS);
 
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
 {
@@ -186,7 +186,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pmbus_set_page);
+EXPORT_SYMBOL_NS_GPL(pmbus_set_page, PMBUS);
 
 int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 {
@@ -198,7 +198,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 
 	return i2c_smbus_write_byte(client, value);
 }
-EXPORT_SYMBOL_GPL(pmbus_write_byte);
+EXPORT_SYMBOL_NS_GPL(pmbus_write_byte, PMBUS);
 
 /*
  * _pmbus_write_byte() is similar to pmbus_write_byte(), but checks if
@@ -229,7 +229,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 
 	return i2c_smbus_write_word_data(client, reg, word);
 }
-EXPORT_SYMBOL_GPL(pmbus_write_word_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_write_word_data, PMBUS);
 
 
 static int pmbus_write_virt_reg(struct i2c_client *client, int page, int reg,
@@ -299,7 +299,7 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
 	return _pmbus_write_word_data(client, page,
 				      pmbus_fan_command_registers[id], command);
 }
-EXPORT_SYMBOL_GPL(pmbus_update_fan);
+EXPORT_SYMBOL_NS_GPL(pmbus_update_fan, PMBUS);
 
 int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 {
@@ -311,7 +311,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 
 	return i2c_smbus_read_word_data(client, reg);
 }
-EXPORT_SYMBOL_GPL(pmbus_read_word_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_read_word_data, PMBUS);
 
 static int pmbus_read_virt_reg(struct i2c_client *client, int page, int reg)
 {
@@ -370,7 +370,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 
 	return i2c_smbus_read_byte_data(client, reg);
 }
-EXPORT_SYMBOL_GPL(pmbus_read_byte_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_read_byte_data, PMBUS);
 
 int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 {
@@ -382,7 +382,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 
 	return i2c_smbus_write_byte_data(client, reg, value);
 }
-EXPORT_SYMBOL_GPL(pmbus_write_byte_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_write_byte_data, PMBUS);
 
 int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 			   u8 mask, u8 value)
@@ -401,7 +401,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 
 	return rv;
 }
-EXPORT_SYMBOL_GPL(pmbus_update_byte_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
 
 /*
  * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
@@ -474,14 +474,14 @@ int pmbus_get_fan_rate_device(struct i2c_client *client, int page, int id,
 {
 	return pmbus_get_fan_rate(client, page, id, mode, false);
 }
-EXPORT_SYMBOL_GPL(pmbus_get_fan_rate_device);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_fan_rate_device, PMBUS);
 
 int pmbus_get_fan_rate_cached(struct i2c_client *client, int page, int id,
 			      enum pmbus_fan_mode mode)
 {
 	return pmbus_get_fan_rate(client, page, id, mode, true);
 }
-EXPORT_SYMBOL_GPL(pmbus_get_fan_rate_cached);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_fan_rate_cached, PMBUS);
 
 static void pmbus_clear_fault_page(struct i2c_client *client, int page)
 {
@@ -496,7 +496,7 @@ void pmbus_clear_faults(struct i2c_client *client)
 	for (i = 0; i < data->info->pages; i++)
 		pmbus_clear_fault_page(client, i);
 }
-EXPORT_SYMBOL_GPL(pmbus_clear_faults);
+EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, PMBUS);
 
 static int pmbus_check_status_cml(struct i2c_client *client)
 {
@@ -548,13 +548,13 @@ bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, _pmbus_read_byte_data, page, reg);
 }
-EXPORT_SYMBOL_GPL(pmbus_check_byte_register);
+EXPORT_SYMBOL_NS_GPL(pmbus_check_byte_register, PMBUS);
 
 bool pmbus_check_word_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, __pmbus_read_word_data, page, reg);
 }
-EXPORT_SYMBOL_GPL(pmbus_check_word_register);
+EXPORT_SYMBOL_NS_GPL(pmbus_check_word_register, PMBUS);
 
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client *client)
 {
@@ -562,7 +562,7 @@ const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client *client)
 
 	return data->info;
 }
-EXPORT_SYMBOL_GPL(pmbus_get_driver_info);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_driver_info, PMBUS);
 
 static int pmbus_get_status(struct i2c_client *client, int page, int reg)
 {
@@ -2299,7 +2299,7 @@ const struct regulator_ops pmbus_regulator_ops = {
 	.disable = pmbus_regulator_disable,
 	.is_enabled = pmbus_regulator_is_enabled,
 };
-EXPORT_SYMBOL_GPL(pmbus_regulator_ops);
+EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
 
 static int pmbus_regulator_register(struct pmbus_data *data)
 {
@@ -2642,7 +2642,7 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pmbus_do_probe);
+EXPORT_SYMBOL_NS_GPL(pmbus_do_probe, PMBUS);
 
 struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
 {
@@ -2650,7 +2650,7 @@ struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
 
 	return data->debugfs;
 }
-EXPORT_SYMBOL_GPL(pmbus_get_debugfs_dir);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_debugfs_dir, PMBUS);
 
 static int __init pmbus_core_init(void)
 {
-- 
2.17.1

