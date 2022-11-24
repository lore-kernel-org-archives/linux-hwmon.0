Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98AFC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Nov 2022 08:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiKXIfA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Nov 2022 03:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiKXIez (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Nov 2022 03:34:55 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477D5D9B85
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Nov 2022 00:34:54 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so4075481wmi.1
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Nov 2022 00:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JW7FLp8EfvNtL1XZPl1vzh58Pu217kjL61ohaey6idw=;
        b=GcCGKg/AY5KiyMo9lr9z+0Of6TgjF2FQsaHsWLYrGL0n8YzhroF3H//kQJXFP9ZZ8M
         q3V/nUxNwc9ZOdrGlpotzenR8KygjjSydZalMmL7pqGRLxXhBJKIXRlzEIr9L9Q8EafA
         +c7LK5LTB72YcsG2smQuF4g8Er2Y1Cka6wT6+9Z+chx62I+s3225b3rImPNtpPEIQC9U
         AwsrwGBgKcgjJUNSTb3KdfsXHJVs5gYT36r0dOvbK4BLs1eDCfatLQP61GZdnNt6enu9
         gOWTFt3iER8MxKSzGzdDgHHlM0vLUt0BCDdqHK/Pc6F0VVUhwYFcKqaRI9bdH9wodf0D
         N8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JW7FLp8EfvNtL1XZPl1vzh58Pu217kjL61ohaey6idw=;
        b=3zR2YypaVwybkWsPX1RdvGlsBuc090AvZdocZ59PlG+M0Z9jLZZY4ZrUyFR1Ct9uGf
         6xatVG2bPzQmK3GOs5Ogdiil66HNyXZL+Ay4SXCwZPbiJY5WA/CNnd3t+0oIJO2yEDYN
         VEs7FqprVR3oKRsNMiKLVzipmSoBiNi6doYbbMZ+z8LOkuZwm+T3r1yP4Q64z4Y2ZjYn
         znAx1/AAXnH54lL0qZrM7gNaPyfCsa8XUut05DzGyuiCYdC3LT+AKQle3ckcMCNPvF04
         VHOzWwc+iviINFFlEonVZzQwHviRKA77dj0yYVhW4l0DO8Cg8S3gVdWFT8pQx6jtZHg/
         MZoQ==
X-Gm-Message-State: ANoB5plEzOwqjGVMXjxTFrHhz8IzqZs2fhAnJNfkFyIHFr5SGJST+a6z
        sWTYqaleZ6+eKV5VRhFZKW3Dbg==
X-Google-Smtp-Source: AA0mqf4vXt6BzOXC8fITrnXJEdxWynPL6TEABGgcuTn/077Jp8MjHSROYmA9JQk/TYDU6Dh/SvKulw==
X-Received: by 2002:a05:600c:3586:b0:3cf:a3b0:df6a with SMTP id p6-20020a05600c358600b003cfa3b0df6amr25923934wmq.126.1669278892794;
        Thu, 24 Nov 2022 00:34:52 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm10028095wms.3.2022.11.24.00.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 00:34:52 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5] hwmon: (pmbus/core): Implement regulator get_status
Date:   Thu, 24 Nov 2022 09:34:39 +0100
Message-Id: <20221124083439.3840025-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add get_status for pmbus_regulator_ops.

---
Changes:
- use lock throughout the function
- Avoid line continuation upto 100 column
- Optimize use of & and | operator
- Check for VOUT, IOUT, TEMPERATURE bit in status word before checking
  respective status register for fault.
- Report regulator current status.
- Utilize get_error_flag to check for regulator errors.
- Check for return value of function get_error_flag

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 20ca26e19db7..0b13214c662f 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2855,6 +2855,49 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	return 0;
 }
 
+static int pmbus_regulator_get_status(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	u8 page = rdev_get_id(rdev);
+	int status, ret;
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
+	if (rdev->desc->ops->get_error_flags) {
+		ret = rdev->desc->ops->get_error_flags(rdev, &status);
+		if (ret)
+			goto unlock;
+
+		if (status & (REGULATOR_ERROR_UNDER_VOLTAGE | REGULATOR_ERROR_OVER_CURRENT |
+		   REGULATOR_ERROR_REGULATION_OUT | REGULATOR_ERROR_FAIL |
+		   REGULATOR_ERROR_OVER_TEMP))
+			ret = REGULATOR_STATUS_ERROR;
+	} else
+		ret = REGULATOR_STATUS_UNDEFINED;
+
+unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
 static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -2995,6 +3038,7 @@ const struct regulator_ops pmbus_regulator_ops = {
 	.disable = pmbus_regulator_disable,
 	.is_enabled = pmbus_regulator_is_enabled,
 	.get_error_flags = pmbus_regulator_get_error_flags,
+	.get_status = pmbus_regulator_get_status,
 	.get_voltage = pmbus_regulator_get_voltage,
 	.set_voltage = pmbus_regulator_set_voltage,
 	.list_voltage = pmbus_regulator_list_voltage,

base-commit: 2c71b3246ec3246522e8cb7c8191dc7a5d62cc70
-- 
2.37.3

