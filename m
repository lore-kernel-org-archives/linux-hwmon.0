Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776BEC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Nov 2022 18:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233670AbiKSSZg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 19 Nov 2022 13:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233576AbiKSSZf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Nov 2022 13:25:35 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71BB66442
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Nov 2022 10:25:33 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id vv4so10957511ejc.2
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Nov 2022 10:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DyFSjdrCVc14i54RTRdROUo6a95ipWQFcDuFIId893w=;
        b=UNMxbI8uUkeSHLvZY/5XlrrK/z63kghl8eL9wx7hXhwl0qFWlOgMpuwO/NqYYabOo4
         FgiBZJrMdzk8khldXCyVVqiBTEOmYhuIFrweaXTl90fxLnVuBo2mL7PY193ijn8t76vU
         fTBakhx9aCPLHnfHsmdqDePCf5E8sUlzh5vLfZu9DNhI2wvk5acRHUxx8NV9KH1szsMS
         +lKv51JKhC5XsJDfv+IMcqFqjwtX9QstQeKueAUiCgl3tbZkEsANpn6IVpLCc7HMlg/q
         z6xiF25m25R5Jppqu9LttFa0LeVwo0x0waAfipHSNSEG1zUe0SR0NiWo7G/9ycwNkoFL
         hCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyFSjdrCVc14i54RTRdROUo6a95ipWQFcDuFIId893w=;
        b=6N7bh3LyZhrn9jhrFK3Z8d6KpfhtMW/89sypoLaQAMCQ8rbYYGqgdYjUtnKy5XKMwq
         n6DRK7VjZbLa2EhExBRFxC+YvBgjpOI3Oy1LYYz//Hz0BxBLck+5rZMtuxGOY+KNkm22
         wEXdC3V6XxTNCWKISUl2rWsQhPhKrYsKGeyC6vLNZ9kEl2wXOlFHr2sMEDfv1fByNBFm
         bNEbus4YXSzjoCa8YWqjfZVgsqFeUb6/4of9ylKc1vb81zusgx+TCJQw6mQWWMARDY29
         8CuC11dfesHZd1oBmBXgEMl/N1VOLTnmGn8xsLQmo0MV+U9XmWII+H2JaxcZBXjTkf/c
         5+Dw==
X-Gm-Message-State: ANoB5pm0vWEAmHlhpBA0OQyYhzNsku/wjVZOY8K0kzLhudgwkAdYF/k/
        fB7CXEsGdTqFWPyaXYEl8nP+DQ==
X-Google-Smtp-Source: AA0mqf7V4NvsQ7lZkxJsyPolvHm4P3pmFIiqVV0FA9POqIayaATKxh1tVJmwsfJT4rlHhcjRwyO4nQ==
X-Received: by 2002:a17:907:2ad7:b0:79e:8360:8c3d with SMTP id fm23-20020a1709072ad700b0079e83608c3dmr10497888ejc.146.1668882331955;
        Sat, 19 Nov 2022 10:25:31 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id w14-20020a056402070e00b004691de0e25bsm1995039edx.54.2022.11.19.10.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 10:25:31 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     broonie@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] hwmon: (pmbus/core): Implement regulator get_status
Date:   Sat, 19 Nov 2022 19:25:16 +0100
Message-Id: <20221119182517.2334156-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add get_status for pmbus_regulator_ops.

Changes:
- use lock throughout the function
- Avoid line continuation upto 100 column
- Optimize use of & and | operator
- Check for VOUT, IOUT, TEMPERATURE bit in status word before checking
  respective status register for fault.
- Report regulator current status.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 88 ++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 7ec04934747e..f7a322d5b453 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2851,6 +2851,93 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	return 0;
 }
 
+static int pmbus_regulator_get_status(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	u8 page = rdev_get_id(rdev);
+	int status, status2, ret;
+
+	mutex_lock(&data->update_lock);
+	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
+	if (status < 0) {
+		ret = status;
+		goto unlock;
+	}
+
+	if (status & PB_STATUS_OFF) {
+		ret = REGULATOR_STATUS_OFF;
+		goto unlock;
+	}
+
+	/* If regulator is ON & reports power good then return ON */
+	if (!(status & PB_STATUS_POWER_GOOD_N)) {
+		ret = REGULATOR_STATUS_ON;
+		goto unlock;
+	}
+
+	if (status & (PB_STATUS_VIN_UV | PB_STATUS_IOUT_OC | PB_STATUS_VOUT_OV |
+	   PB_STATUS_UNKNOWN)){
+		ret = REGULATOR_STATUS_ERROR;
+		goto unlock;
+	}
+
+	if (status & PB_STATUS_VOUT && data->info->func[page] & PMBUS_HAVE_STATUS_VOUT) {
+		status2 = _pmbus_read_byte_data(client, page,
+					 PMBUS_STATUS_VOUT);
+		if (status2 < 0) {
+			ret = status2;
+			goto unlock;
+		}
+		if (status2 & (PB_VOLTAGE_OV_FAULT | PB_VOLTAGE_UV_FAULT)) {
+			ret = REGULATOR_STATUS_ERROR;
+			goto unlock;
+		}
+	}
+
+	if (status & PB_STATUS_IOUT_POUT && data->info->func[page] & PMBUS_HAVE_STATUS_IOUT) {
+		status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_IOUT);
+		if (status2 < 0) {
+			ret = status2;
+			goto unlock;
+		}
+		if (status2 & (PB_POUT_OP_FAULT | PB_IOUT_UC_FAULT | PB_IOUT_OC_LV_FAULT |
+		   PB_IOUT_OC_FAULT)) {
+			ret = REGULATOR_STATUS_ERROR;
+			goto unlock;
+		}
+	}
+
+	if (status & PB_STATUS_INPUT && data->info->func[page] & PMBUS_HAVE_STATUS_INPUT) {
+		status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_INPUT);
+		if (status2 < 0) {
+			ret = status2;
+			goto unlock;
+		}
+		if (status2 & (PB_IIN_OC_FAULT | PB_VOLTAGE_OV_FAULT | PB_VOLTAGE_UV_FAULT)) {
+			ret = REGULATOR_STATUS_ERROR;
+			goto unlock;
+		}
+	}
+
+	if (status & PB_STATUS_TEMPERATURE && data->info->func[page] & PMBUS_HAVE_STATUS_TEMP) {
+		status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_TEMPERATURE);
+		if (status2 < 0) {
+			ret = status2;
+			goto unlock;
+		}
+		if (status2 & (PB_TEMP_UT_FAULT | PB_TEMP_OT_FAULT)) {
+			ret = REGULATOR_STATUS_ERROR;
+			goto unlock;
+		}
+	}
+
+unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
 static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -2991,6 +3078,7 @@ const struct regulator_ops pmbus_regulator_ops = {
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

