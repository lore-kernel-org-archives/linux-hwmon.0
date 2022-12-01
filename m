Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94681C4321E
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 19:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiLATE0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 14:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiLATEY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 14:04:24 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9778EBFCEF
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 11:04:21 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o30so1913817wms.2
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 11:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE6FZaBNq2c3NfrJBONCVhF9AJEc6RhOGgZ53GWa0kQ=;
        b=EwynONOVI8DWNTiylBys76ZhwXbVnV/jx/Tf27Dpa9AdDOwqA+e9Nl0PtBzyghyZCe
         bBjsA03zq/sCuWi/VwfVNmY5gzHQAAaXNvpbLIW82RTnz86Vjkcd1zhXYCJniQvZwrCI
         J1TZ9ST/Io8ZkevskrrPUWvNbyqVQWodnI6kW3Ji51EE10efdHkvz6Vzvx6iNUsaY0Rt
         uH95oEaGw0uWSXCb0od6sV/EFiTxPSBwyoSBYMiEyErxmWREzt7IzRzvL8beUyiRS1cI
         SxjfAT5+hRsDUXEmF+YR98aVfVG5h+BeDphtv5xy0L7o82M4j86FNuNIkQC6MtUc/9gm
         WoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qE6FZaBNq2c3NfrJBONCVhF9AJEc6RhOGgZ53GWa0kQ=;
        b=VPpCsyDjNW3ommv5McIiIdc87MKzq94qqJLagHmfXVbqNISrhYeq/hfqTvSKBe7KTi
         NlVOudPICJX4dEisA3im4QXG2Nzzxix73SIIyQ44onq49r+Ms5ENWN7VTA06qtyePqic
         m70z2DD3FjARzQLhKQQ/f7PNw5nvJRxVsitmJbt3Kcsl5qfF8GC4d93PiQAyU0Mwq81C
         tnFAbz4eG0ZEEV8p+I3pDflK5kMOlNHsvUoeLGq2ra5VSF3KCwRtd3p50V02r3AaUC4g
         2AtQbmOe60lVP0vEn0IU8OTGHAt7Si5N2HNUsclvEx8ojQ/fcEUrLWF3fN+gineKpIoA
         ftQQ==
X-Gm-Message-State: ANoB5pm9JzW8nyS6wIKqWFpJDXQg/CXlz4ks7CrKJGHmU5mZX/fiOXBz
        RzUY6VKrJ77XoIcYBYNv0v9suQ==
X-Google-Smtp-Source: AA0mqf7K1QfjjNCBXJhkdQL2S1F/rR+TKAo0lsRHIEOUQ2msE399ETIyh+LC8baLYRp+Hk2ys9QWEg==
X-Received: by 2002:a1c:6a01:0:b0:3cf:a895:a9cb with SMTP id f1-20020a1c6a01000000b003cfa895a9cbmr52719829wmc.96.1669921460003;
        Thu, 01 Dec 2022 11:04:20 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c351400b003c6cd82596esm11848474wmq.43.2022.12.01.11.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:04:19 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v4 2/5] hwmon: (pmbus/core): Add interrupt support
Date:   Thu,  1 Dec 2022 20:03:51 +0100
Message-Id: <20221201190354.1512790-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221201190354.1512790-1-Naresh.Solanki@9elements.com>
References: <20221201190354.1512790-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Implement PMBUS irq handler.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 89 ++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 10fb17879f8e..6b2e6cf93b19 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -26,7 +26,7 @@ enum pmbus_regs {
 
 	PMBUS_CAPABILITY		= 0x19,
 	PMBUS_QUERY			= 0x1A,
-
+	PMBUS_SMBALERT_MASK		= 0x1B,
 	PMBUS_VOUT_MODE			= 0x20,
 	PMBUS_VOUT_COMMAND		= 0x21,
 	PMBUS_VOUT_TRIM			= 0x22,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 7a23794c0b93..bdcbc216b0cc 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3078,11 +3078,94 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 
 	return 0;
 }
+
+static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
+{
+	return pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+}
+
+static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
+{
+	struct pmbus_data *data = pdata;
+	struct i2c_client *client = to_i2c_client(data->dev);
+	int i, status;
+	u8 page;
+
+	for (i = 0; i < data->info->num_regulators; i++) {
+
+		if (!data->rdevs[i])
+			continue;
+
+		page = rdev_get_id(data->rdevs[i]);
+		mutex_lock(&data->update_lock);
+		status = pmbus_read_status_word(client, page);
+		if (status < 0) {
+			mutex_unlock(&data->update_lock);
+			return status;
+		}
+
+		if (status & ~(PB_STATUS_OFF | PB_STATUS_BUSY | PB_STATUS_POWER_GOOD_N))
+			pmbus_clear_fault_page(client, page);
+
+		mutex_unlock(&data->update_lock);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int pmbus_irq_setup(struct i2c_client *client, struct pmbus_data *data)
+{
+	struct device *dev = &client->dev;
+	const struct pmbus_regulator_status_category *cat;
+	const struct pmbus_regulator_status_assoc *bit;
+	int i, j, err, ret, func;
+	u8 mask;
+
+	for (i = 0; i < data->info->pages; i++) {
+		func = data->info->func[i];
+
+		for (j = 0; j < ARRAY_SIZE(pmbus_regulator_flag_map); j++) {
+			cat = &pmbus_regulator_flag_map[j];
+			if (!(func & cat->func))
+				continue;
+			mask = 0;
+			for (bit = cat->bits; bit->pflag; bit++)
+				mask |= bit->pflag;
+
+			err = pmbus_write_smbalert_mask(client, i, cat->reg, ~mask);
+			if (err)
+				dev_err(dev, "Failed to set smbalert for reg 0x%02x\n",	cat->reg);
+		}
+
+		pmbus_write_smbalert_mask(client, i, PMBUS_STATUS_CML, 0xff);
+		pmbus_write_smbalert_mask(client, i, PMBUS_STATUS_OTHER, 0xff);
+		pmbus_write_smbalert_mask(client, i, PMBUS_STATUS_MFR_SPECIFIC, 0xff);
+		if (data->info->func[i] & PMBUS_HAVE_FAN12)
+			pmbus_write_smbalert_mask(client, i, PMBUS_STATUS_FAN_12, 0xff);
+		if (data->info->func[i] & PMBUS_HAVE_FAN34)
+			pmbus_write_smbalert_mask(client, i, PMBUS_STATUS_FAN_34, 0xff);
+	}
+
+	/* Register notifiers - can fail if IRQ is not given */
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, pmbus_fault_handler,
+			      0, "pmbus-irq", data);
+	if (ret) {
+		dev_warn(dev, "IRQ disabled %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 #else
 static int pmbus_regulator_register(struct pmbus_data *data)
 {
 	return 0;
 }
+static int pmbus_irq_setup(struct i2c_client *client, struct pmbus_data *data)
+{
+	return 0;
+}
 #endif
 
 static struct dentry *pmbus_debugfs_dir;	/* pmbus debugfs directory */
@@ -3447,6 +3530,12 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 	if (ret)
 		return ret;
 
+	if (client->irq > 0) {
+		ret = pmbus_irq_setup(client, data);
+		if (ret)
+			return ret;
+	}
+
 	ret = pmbus_init_debugfs(client, data);
 	if (ret)
 		dev_warn(dev, "Failed to register debugfs\n");
-- 
2.37.3

