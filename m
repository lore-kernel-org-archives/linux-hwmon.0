Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E374C352A1
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Nov 2022 17:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbiK3RF7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Nov 2022 12:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbiK3RFR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2022 12:05:17 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80659894A
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 09:00:15 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so1915961wmb.2
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 09:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADo04tg+16fhlHcXEalyoHswqSIikOudDCDm6c2e17k=;
        b=NKu8S/HWybo5iLmhXLOZ4iQ/6NF9zExmhhZ1XuHdPAD/XvPsE3cuPkUcIXqhhFqoOs
         OoEcvaa3CZvsbEkiSDX7yopx8HyxBwO+ItxHGrrTl8bUJGSvt8/Db73li2ej+DNKGafy
         n5mrkCQlx23Nt4KWd8WppTeaPRO/VMy93SeqNgQp5WYIGrKwXvHm2lZoN8JLuJ74QwYV
         ZtRToEQ+QCegU3LS+1Q29y7fAY8nphbWSnatkHvqR9YCIBSM3ig37Hn2uA1RvMziG+sb
         Gp9lO+F4CoNkX+tIMhHY7XpmUawd5os3UzmsnnCHsLACgg4whAxz6KJwh5aB2j+NH3jo
         R0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADo04tg+16fhlHcXEalyoHswqSIikOudDCDm6c2e17k=;
        b=rat8ANyU3wwXlbPVy2EPWaZCRUk2LAL/1VQRaDkjCMb8vBsyDFz1s00F6YxRS279Af
         j19xoGhqhQeV8mdoownqPgIFzC480cJWtlcGCDK6f7mo2weWr0L4xjNz226ThY1PUGQG
         HucbMg3vZE9CB4mecXvGwM+BLUwL/U9Y75xExZJWrUQixnF1x0JqH4aSxOyoCyIjKx5o
         2ZRgJl0XZAqSykiem+ZCQign4JCIwGQLI1cfkO7OOPxtOrl6bryw2F3l/SlosGnYNn19
         H67YHyvFhC+ylG85xNTPs93Tr++osuP/ROMPUCUopy9Ja/4e5qBNiJ5t0LQsnwuHYPUc
         qUfg==
X-Gm-Message-State: ANoB5pnx2HUJ7jRgBQsZP37KTEMe3fLJgj5ZPukRQyufOPzVjUiWC0RO
        5DkF9uN/BjyWp6XVHW8p0S0p2A==
X-Google-Smtp-Source: AA0mqf6dFEgTtxymKQ/eqI2nEtCILDoCpgb5WmUZJlpi5KtpxCXvj3P5gCntwYjpnOaQ2dqKxyBMDw==
X-Received: by 2002:a05:600c:1e25:b0:3d0:31c9:1d77 with SMTP id ay37-20020a05600c1e2500b003d031c91d77mr29100295wmb.113.1669827614406;
        Wed, 30 Nov 2022 09:00:14 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id fn7-20020a05600c688700b003c6b70a4d69sm2457159wmb.42.2022.11.30.09.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 09:00:14 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v3 4/4] hwmon: (pmbus/core): Notify hwmon events
Date:   Wed, 30 Nov 2022 17:59:54 +0100
Message-Id: <20221130165955.3479143-4-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221130165955.3479143-1-Naresh.Solanki@9elements.com>
References: <20221130165955.3479143-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Notify hwmon events using the pmbus irq handler.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 37 +++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 613e2e484a0f..da92a08484c9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2805,8 +2805,36 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
 	},
 };
 
+#define to_dev_attr(_dev_attr) \
+	container_of(_dev_attr, struct device_attribute, attr)
+
+static void pmbus_notify(struct pmbus_data *data, int page, int reg, int flags)
+{
+	int i;
+
+	for (i = 0; i < data->num_attributes; i++) {
+		struct device_attribute *da = to_dev_attr(data->group.attrs[i]);
+		struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+		int index = attr->index;
+		u16 smask = pb_index_to_mask(index);
+		u8 spage = pb_index_to_page(index);
+		u16 sreg = pb_index_to_reg(index);
+
+		if (reg == sreg && page == spage && (smask & flags)) {
+			dev_dbg(data->dev, "sysfs notify: %s", da->attr.name);
+			sysfs_notify(&data->dev->kobj, NULL, da->attr.name);
+			kobject_uevent(&data->dev->kobj, KOBJ_CHANGE);
+		}
+
+		flags &= ~smask;
+
+		if (!flags)
+			break;
+	}
+}
+
 static int pmbus_regulator_get_flags(struct regulator_dev *rdev, unsigned int *error,
-				    unsigned int *event)
+				    unsigned int *event, bool notify)
 {
 	int i, status;
 	const struct pmbus_regulator_status_category *cat;
@@ -2833,6 +2861,9 @@ static int pmbus_regulator_get_flags(struct regulator_dev *rdev, unsigned int *e
 			return status;
 		}
 
+		if (notify && status)
+			pmbus_notify(data, page, cat->reg, status);
+
 		for (bit = cat->bits; bit->pflag; bit++) {
 			if (status & bit->pflag) {
 				*error |= bit->rflag;
@@ -2885,7 +2916,7 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 {
 	unsigned int event;
 
-	return pmbus_regulator_get_flags(rdev, flags, &event);
+	return pmbus_regulator_get_flags(rdev, flags, &event, false);
 }
 
 static int pmbus_regulator_get_status(struct regulator_dev *rdev)
@@ -3095,7 +3126,7 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 		if (!data->rdevs[i])
 			continue;
 
-		ret = pmbus_regulator_get_flags(data->rdevs[i], &status, &event);
+		ret = pmbus_regulator_get_flags(data->rdevs[i], &status, &event, true);
 		if (ret)
 			return ret;
 
-- 
2.37.3

