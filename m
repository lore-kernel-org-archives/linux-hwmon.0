Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32558C38142
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Jan 2023 06:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbjAWGkn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Jan 2023 01:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbjAWGkk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Jan 2023 01:40:40 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492701969B
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Jan 2023 22:40:39 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso7751561wms.3
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Jan 2023 22:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ov8fh9l0ZAHhGTGOwGz76sDwDHqWLrH8WR2EMR4pMDQ=;
        b=DfdZ2UPqZULiwcA4DFLfmlYFHU6xX3ia8PNzX5s0J2gqiyduukYElFPytQ7n2GBl36
         0TEuhHWpNTjCLK2Dl3MCoUzA/IjnrFdASXJCpSf9zqUQlC5JocsnrkZcHVtNQ3ZWfd+/
         bLhpcSkopc/FMlfiQy6cStMx6f3cIWUrr1hw8HWAQ1NoXQiJFByvNTMzF8LS+7BcQd1E
         san0VNw19vgR6MIuo26h9OLg+MmGzWHnJ0oyYmsrHlU7dwf06TgPJaMv7k5x41eYNlEC
         d2Kh2GI5wXu3w1UM1589wd7TP2fTD9zAYNtlsKPIoo+Yuk4NlJYVtFuOZ/I28YliZI33
         9CrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ov8fh9l0ZAHhGTGOwGz76sDwDHqWLrH8WR2EMR4pMDQ=;
        b=DL0+e8HJNtcAeiM2AZ0WaoGLMOSYFq85L9GYvXOuM2S/nr07D6GoxqoH+CmJPXWvEw
         ZJuVX0a5AqQFAdYOMHVicxRFqux/Odj3DT4piyWH+ZhBYr2CIcse9Hs16XrzepyUO2ox
         ad5xWJTpnP6vwc3nz7CNBuWO5iodR7SqGsim/xx2vN1DrY/jD7yWAGeRaAZ0HeAIAw58
         axM1AJkCG4/YisOULJfkoVyTQf37Fs6HlheJK2BkSXO2UnX54n5FfhAzlGuGTUOAg/Dg
         CXoeqC5iRlg8dtThHV0C+SvQqOGKj8qL4R+jtxrp9Qq3FgsJoTjKu62bNqChlVs+W6of
         WOIg==
X-Gm-Message-State: AFqh2krSTpcCFsSXESnLHyNUW7MmnstoZV4FOlqLGbF7SJtiO+Lm+k+I
        7FEHuBgMFh3y0ix1WP2zmIzowA==
X-Google-Smtp-Source: AMrXdXtgsRE0R1LbuUE4LfJWulGjK9X5QZrCEgK+IAbPJuMo5AIjBNizMCblX7+JlNSe3JuzVHGZ1g==
X-Received: by 2002:a05:600c:3d14:b0:3da:f793:fff6 with SMTP id bh20-20020a05600c3d1400b003daf793fff6mr22662762wmb.16.1674456037843;
        Sun, 22 Jan 2023 22:40:37 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id o4-20020a1c7504000000b003da28dfdedcsm11439373wmc.5.2023.01.22.22.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 22:40:37 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] hwmon: (pmbus/core): Add interrupt support
Date:   Mon, 23 Jan 2023 07:40:20 +0100
Message-Id: <20230123064021.2657670-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230123064021.2657670-1-Naresh.Solanki@9elements.com>
References: <20230123064021.2657670-1-Naresh.Solanki@9elements.com>
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
index 12b662b91306..3c1c68e93943 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3095,6 +3095,85 @@ static int pmbus_regulator_register(struct pmbus_data *data)
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
@@ -3457,6 +3536,12 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
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
2.38.1

