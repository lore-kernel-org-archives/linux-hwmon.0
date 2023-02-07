Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D907C636D6
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Feb 2023 12:02:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjBGMC6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Feb 2023 07:02:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjBGMC5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Feb 2023 07:02:57 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C119A274
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Feb 2023 04:02:56 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id dr8so42482135ejc.12
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Feb 2023 04:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0guVckly/Edlnuv4LtI1Va41cJ8CX0DyAOlD8qMZlk=;
        b=atcqHdsY2HY1X4VKQDUxHoe6PbdoEoZPQhWuFYiDaVNIarAsgLaRQrV9XE0yeMUAUC
         A1hrPfFS456kvMWTbS6Hjjjv28REZGp7fRcbQcU2h62IL7qBShNRkP6zTO3Ujo1uJNQP
         5PvR91QdJLxx4nkc7SwXuJl3Hry6Q3dhhx1wuRDSktwHbuIYVzS2ADREkREsFbewBkdD
         1zhdWEMn33cy1FQhzUBaJtreMGYeuddEdGqASdahvKa5GqfddE9bICooOkLx5E/UNoCi
         oTsdU1DtXaeX7OnulJdILZYw+9XO6z+JLYBwnIHHk7gXra+KxZQgCifmGXMBJqnnTUnG
         ytUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0guVckly/Edlnuv4LtI1Va41cJ8CX0DyAOlD8qMZlk=;
        b=Rpz3CCtGPoen/3SV62mQZ62NFdw9BLBhEej4Mg6cyzjFGH2PpndaWAeJyGkYhTcgTk
         jxqxNGknTXhxr/T6O/8ZszfflRx5zFoIw9toNhdeE6cBTDZn1VhXuPJvm8vG/XOFISSb
         nJ+5tsA2qkzYb4+zvLyqH+lq9l8bU69RSlmF8tJeCg8txeS2MYVOr1EA7PtRl8C02p2+
         tjcSS3lAlyigRnrgb7yS3NbdIjO3l0tqQp2ytOY1ULmj+GOn6B3PZsRMjASS5Sz2W5dW
         xWy1zBXCyn1/vCy3EZXh3LBLAXhDpLvFI+x3TTcFgtaW1OTKd6+c6q7UTzOEkDvbS/9t
         g7HQ==
X-Gm-Message-State: AO0yUKW7TPIpHMC2i5B1NkJM4JruLxN+dYz6gvdbSRq8n83Y3J/N+Ra0
        rcgSBrBdmisYD5cHtN8P3vT5bw==
X-Google-Smtp-Source: AK7set98inGeI2omeTHV1Yhk55ByYATN5nHRFzphpwKwo68L741yTbWKUgK+SFu9VA+fu6QDwwNgGA==
X-Received: by 2002:a17:906:5591:b0:7b2:c227:126d with SMTP id y17-20020a170906559100b007b2c227126dmr3480924ejp.20.1675771375128;
        Tue, 07 Feb 2023 04:02:55 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id r5-20020a170906a20500b008710789d85fsm6843934ejy.156.2023.02.07.04.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:02:54 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] hwmon: (pmbus/core): Add interrupt support
Date:   Tue,  7 Feb 2023 13:02:40 +0100
Message-Id: <20230207120241.2800662-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207120241.2800662-1-Naresh.Solanki@9elements.com>
References: <20230207120241.2800662-1-Naresh.Solanki@9elements.com>
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
 drivers/hwmon/pmbus/pmbus_core.c | 85 ++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 713ea7915425..11e84e141126 100644
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
index 5ccae8126a56..d5403baad60a 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3093,6 +3093,85 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 }
 #endif
 
+static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
+{
+	int err;
+
+	err = pmbus_check_word_register(client, page, reg | (val << 8));
+	if (err)
+		return err;
+
+	return pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+}
+
+static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
+{
+	struct pmbus_data *data = pdata;
+	struct i2c_client *client = to_i2c_client(data->dev);
+	int i, status;
+
+	mutex_lock(&data->update_lock);
+	for (i = 0; i < data->info->pages; i++) {
+		status = pmbus_read_status_word(client, i);
+		if (status < 0) {
+			mutex_unlock(&data->update_lock);
+			return status;
+		}
+
+		if (status & ~(PB_STATUS_OFF | PB_STATUS_BUSY | PB_STATUS_POWER_GOOD_N))
+			pmbus_clear_fault_page(client, i);
+	}
+	mutex_unlock(&data->update_lock);
+
+	return IRQ_HANDLED;
+}
+
+static int pmbus_irq_setup(struct i2c_client *client, struct pmbus_data *data)
+{
+	struct device *dev = &client->dev;
+	const struct pmbus_status_category *cat;
+	const struct pmbus_status_assoc *bit;
+	int i, j, err, ret, func;
+	u8 mask;
+	u8 misc_status[] = {PMBUS_STATUS_CML, PMBUS_STATUS_OTHER, PMBUS_STATUS_MFR_SPECIFIC,
+			    PMBUS_STATUS_FAN_12, PMBUS_STATUS_FAN_34};
+
+	for (i = 0; i < data->info->pages; i++) {
+		func = data->info->func[i];
+
+		for (j = 0; j < ARRAY_SIZE(pmbus_status_flag_map); j++) {
+			cat = &pmbus_status_flag_map[j];
+			if (!(func & cat->func))
+				continue;
+			mask = 0;
+			for (bit = cat->bits; bit->pflag; bit++)
+				mask |= bit->pflag;
+
+			err = pmbus_write_smbalert_mask(client, i, cat->reg, ~mask);
+			if (err)
+				dev_err_once(dev, "Failed to set smbalert for reg 0x%02x\n",
+					     cat->reg);
+		}
+
+		for (j = 0; j < ARRAY_SIZE(misc_status); j++) {
+			err = pmbus_write_smbalert_mask(client, i, misc_status[j], 0xff);
+			if (err)
+				dev_err_once(dev, "Failed to set smbalert for reg 0x%02x\n",
+					     misc_status[j]);
+		}
+	}
+
+	/* Register notifiers - can fail if IRQ is not given */
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, pmbus_fault_handler, 0,
+					"pmbus-irq", data);
+	if (ret) {
+		dev_warn(dev, "IRQ disabled %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static struct dentry *pmbus_debugfs_dir;	/* pmbus debugfs directory */
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
@@ -3455,6 +3534,12 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
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
2.39.1

