Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F85C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Nov 2022 19:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240309AbiKQToI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Nov 2022 14:44:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233225AbiKQToH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Nov 2022 14:44:07 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504386D4AE
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Nov 2022 11:44:06 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id y16so5545689wrt.12
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Nov 2022 11:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9KypUmzDrLXtL4OjD6DSrcNKq8t+D4EOgwsfEXkwQU0=;
        b=V1jXmA6YET/Riwy5Az9K0/WdgDv5mgz3KeiZl+O8+3lk/eNHXBfRBHXQdY9wrMFcLB
         EKemOItrqdWH+zvLW7qiw7upC82yiyin0PTMqwegB6fajKU2wB07IoCDufTrPcpWvPOw
         1zx4sdzzEpb9SQts0jZ5mnaUN/7+xc91/nMlF2ijoPkXaZSkM+t27w/+sA0CRy1f1HhS
         /CTxyCvSrH+YBHdy1VTDUA+gNe0tf+MHhHWnuBdgbbBdgMe2DcwD/odCAv9Q3H2PaZEO
         dcltEuqWIu1wE1+IcVzxHO7SJYF9g9gX0sHzqAT6icy/5xZ2aJ4CbuoYwIDpt0yAwFYX
         x3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KypUmzDrLXtL4OjD6DSrcNKq8t+D4EOgwsfEXkwQU0=;
        b=OQSHRqSOrkM2DhAB8vzYOeagNlooBQtGlPsmWtdqwx3wTiGm7qYiCZC4/glkonW6++
         yTWAvab0IcQsYbXlNhgc+KrASXXSFEPvJnrgOtV/UQ6NTvuDDSLI/TsTnsK8I2gXYGqx
         tBM1cUxh95u6+35ljoHvJImruv/0a6UMBUNTj7VmtZgqhn/MDh0aSba/0WjlupYZyLt5
         JMkXjS1FMK1hleQRDPH+q8jKm0Qt4xHaYzHFEI8/pCXxHsPt6ohb1uM+DjhOgG3y1Qwk
         MNoAoTZhxtQsi/yfGfy7aF0PslPnx5slBqMc5w9oogFErIPkyUjqv2rOZZJORaKJDH0h
         geuQ==
X-Gm-Message-State: ANoB5pkrk/MkwiaHL3oUv7U7pk2s9MDTm/HgiEzD4rQVuovP7HTVd2aC
        s/OxZO2pXrtfuEeHeF/ELP0ujA==
X-Google-Smtp-Source: AA0mqf4V++i4LNKsL4Fa85a8xDNFHKj4vwCrQ3EC45itZ35zFFJIAhQswriVJKbbYBeXtUAOiYmw+Q==
X-Received: by 2002:adf:f949:0:b0:236:704f:29f4 with SMTP id q9-20020adff949000000b00236704f29f4mr2480605wrr.11.1668714244805;
        Thu, 17 Nov 2022 11:44:04 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id r24-20020adfa158000000b00236b2804d79sm1912823wrr.2.2022.11.17.11.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 11:44:04 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: pm_bus: core: Implement regulator get_status
Date:   Thu, 17 Nov 2022 20:43:51 +0100
Message-Id: <20221117194352.1904264-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add get_status for pmbus_regulator_ops.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 78 ++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 7ec04934747e..d5e2b0662da5 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2851,6 +2851,83 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	return 0;
 }
 
+static int pmbus_regulator_get_status(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	u8 page = rdev_get_id(rdev);
+	int status, status2;
+
+	mutex_lock(&data->update_lock);
+	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
+	mutex_unlock(&data->update_lock);
+	if (status < 0)
+		 return status;
+
+	if (status & PB_STATUS_VIN_UV ||
+	    status & PB_STATUS_IOUT_OC ||
+	    status & PB_STATUS_VOUT_OV ||
+	    status & PB_STATUS_UNKNOWN)
+		 return REGULATOR_STATUS_ERROR;
+
+	if (status & PB_STATUS_VOUT_OV &&
+	    data->info->func[page] & PMBUS_HAVE_STATUS_VOUT) {
+		 mutex_lock(&data->update_lock);
+		 status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_VOUT);
+		 mutex_unlock(&data->update_lock);
+		 if (status2 < 0)
+			  return status2;
+		 if (status2 & PB_VOLTAGE_OV_FAULT ||
+		     status2 & PB_VOLTAGE_UV_FAULT)
+			  return REGULATOR_STATUS_ERROR;
+	}
+	if (status & PB_STATUS_IOUT_OC &&
+	    data->info->func[page] & PMBUS_HAVE_STATUS_IOUT) {
+		 mutex_lock(&data->update_lock);
+		 status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_IOUT);
+		 mutex_unlock(&data->update_lock);
+		 if (status2 < 0)
+			  return status2;
+		 if (status2 & PB_POUT_OP_FAULT ||
+		     status2 & PB_IOUT_UC_FAULT ||
+		     status2 & PB_IOUT_OC_LV_FAULT ||
+		     status2 & PB_IOUT_OC_FAULT)
+			  return REGULATOR_STATUS_ERROR;
+	}
+	if (status & PB_STATUS_VIN_UV &&
+	    data->info->func[page] & PMBUS_HAVE_STATUS_INPUT) {
+		 mutex_lock(&data->update_lock);
+		 status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_INPUT);
+		 mutex_unlock(&data->update_lock);
+		 if (status2 < 0)
+			  return status2;
+		 if (status2 & PB_IIN_OC_FAULT ||
+		     status2 & PB_VOLTAGE_OV_FAULT ||
+		     status2 & PB_VOLTAGE_UV_FAULT)
+			  return REGULATOR_STATUS_ERROR;
+	}
+	if (status & PB_STATUS_TEMPERATURE &&
+	    data->info->func[page] & PMBUS_HAVE_STATUS_TEMP) {
+		 mutex_lock(&data->update_lock);
+		 status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_TEMPERATURE);
+		 mutex_unlock(&data->update_lock);
+		 if (status2 < 0)
+			  return status2;
+		 if (status2 & PB_TEMP_UT_FAULT ||
+		     status2 & PB_TEMP_OT_FAULT)
+			  return REGULATOR_STATUS_ERROR;
+	}
+
+	if (status & PB_STATUS_OFF)
+		 return REGULATOR_STATUS_OFF;
+
+	if (status & PB_STATUS_POWER_GOOD_N)
+		 return REGULATOR_STATUS_OFF;
+
+	return REGULATOR_STATUS_ON;
+}
+
 static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -2991,6 +3068,7 @@ const struct regulator_ops pmbus_regulator_ops = {
 	.disable = pmbus_regulator_disable,
 	.is_enabled = pmbus_regulator_is_enabled,
 	.get_error_flags = pmbus_regulator_get_error_flags,
+	.get_status = pmbus_regulator_get_status,
 	.get_voltage = pmbus_regulator_get_voltage,
 	.set_voltage = pmbus_regulator_set_voltage,
 	.list_voltage = pmbus_regulator_list_voltage,

base-commit: 27fea302952d8c90cafbdbee96bafeca03544401
-- 
2.37.3

