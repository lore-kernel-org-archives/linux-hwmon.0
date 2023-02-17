Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2817CC64ED6
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Feb 2023 08:36:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjBQIgm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Feb 2023 03:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjBQIgk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Feb 2023 03:36:40 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4865F266
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2023 00:36:39 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id z12-20020a1c4c0c000000b003e21e018039so1866556wmf.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2023 00:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9x9Bw7Cfb1MO2yxRY3rlgzAgrMsHxUH6aVXxHJBG4I=;
        b=RKMUw8bEv+N9zoBaIRUPJxC2+B7mvvUUElvmGO9BwKSqfNAHcmmKKJWgpxZake5CFa
         Qlz0EdMYPQz0WGWJDRpre6e9Xe/LaqS12Ny4QarlV6b6VqSDq7pKFiIvE0jroiMdBob9
         vC1riBvvCj8huJdFuDs6yvdkVKa20kTi0+FStksi8jdVWGsxfmsom6xSEcKC7SdmkEh/
         871+DkZtHMLUSiHiFFW0J+Yp5S0mntRH5xDZGTX86/WQAOrifUCWNdd0ABIjLiLHkSQs
         2wwYwaRLB4B0dDGzP230ThOKa0RocZnyKW9h0BPpJB0IWWdcXG7v24vQ4rGg5unKWxdU
         QGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9x9Bw7Cfb1MO2yxRY3rlgzAgrMsHxUH6aVXxHJBG4I=;
        b=dohFZiCi6gg86iEgioEfgX5NNM4BY7sN+mgAwvNiIUlh0ROSFV8EBdjbWRDBSQq66x
         v/NqX977C8DgtyRDvduQ+QEIGKzmfPBtCudl9XcxJINPHWpiQEsY1SI0xX45BuflZCY1
         RanDJDE0Q/eBsahoIhHOzqrj60HdMc0NDo5a2J+VaB0/+qjgThgd2UlNisVOAAjXsRwk
         HVjXki/2xcR6KCYtJsYwjOerhHWixzPY9lNbObxcp2LD1N9D7JFzQhXGbmuwt8YyaLB5
         RYfM4jJ2/G3WJbJ34BoZYeURXtNtH4q5K0va7XZ9gs3bRpfFW9JKuW+cGv8ZQPW+KUuq
         856A==
X-Gm-Message-State: AO0yUKV90OsyszX4RyaXJeOEylpiDYfPj+zugkgtpIHgz8is6WXJmMq7
        gli3wocbDX1awPkSLbFnTCeqxQ==
X-Google-Smtp-Source: AK7set8+Uw+69X6sqPJNV7Ppn5UPk4jhXokv0xfSnZNHTDC6z1wdhsUG7O7uSbgGyVOb/k1YLfCIHw==
X-Received: by 2002:a05:600c:1652:b0:3e0:ffd4:bfb2 with SMTP id o18-20020a05600c165200b003e0ffd4bfb2mr6959699wmn.4.1676622997430;
        Fri, 17 Feb 2023 00:36:37 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id m17-20020a7bce11000000b003e209b45f6bsm4857021wmc.29.2023.02.17.00.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 00:36:37 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] hwmon: (pmbus/core) Generalise pmbus get status
Date:   Fri, 17 Feb 2023 09:36:29 +0100
Message-Id: <20230217083631.657430-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217083631.657430-1-Naresh.Solanki@9elements.com>
References: <20230217083631.657430-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add function pmbus get status that can be used to get both pmbus
specific status & regulator status

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
...
Changes in V3:
- Add pmbus_is_enabled function
Changes in V2:
- Add __maybe attribute for pmbus_get_status function
- Remove unrelated changes
---
 drivers/hwmon/pmbus/pmbus_core.c | 98 ++++++++++++++++++++------------
 1 file changed, 62 insertions(+), 36 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 1b70cf3be313..f8ac9016ea0e 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2735,18 +2735,12 @@ static const struct pmbus_status_category __maybe_unused pmbus_status_flag_map[]
 	},
 };
 
-#if IS_ENABLED(CONFIG_REGULATOR)
-static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
+static int _pmbus_is_enabled(struct device *dev, u8 page)
 {
-	struct device *dev = rdev_get_dev(rdev);
 	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_data *data = i2c_get_clientdata(client);
-	u8 page = rdev_get_id(rdev);
 	int ret;
 
-	mutex_lock(&data->update_lock);
 	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
-	mutex_unlock(&data->update_lock);
 
 	if (ret < 0)
 		return ret;
@@ -2754,58 +2748,38 @@ static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
 	return !!(ret & PB_OPERATION_CONTROL_ON);
 }
 
-static int _pmbus_regulator_on_off(struct regulator_dev *rdev, bool enable)
+static int __maybe_unused pmbus_is_enabled(struct device *dev, u8 page)
 {
-	struct device *dev = rdev_get_dev(rdev);
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	u8 page = rdev_get_id(rdev);
 	int ret;
 
 	mutex_lock(&data->update_lock);
-	ret = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
-				     PB_OPERATION_CONTROL_ON,
-				     enable ? PB_OPERATION_CONTROL_ON : 0);
+	ret = _pmbus_is_enabled(dev, page);
 	mutex_unlock(&data->update_lock);
 
-	return ret;
-}
-
-static int pmbus_regulator_enable(struct regulator_dev *rdev)
-{
-	return _pmbus_regulator_on_off(rdev, 1);
-}
-
-static int pmbus_regulator_disable(struct regulator_dev *rdev)
-{
-	return _pmbus_regulator_on_off(rdev, 0);
+	return !!(ret & PB_OPERATION_CONTROL_ON);
 }
 
-static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
+static int _pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flags)
 {
 	int i, status;
 	const struct pmbus_status_category *cat;
 	const struct pmbus_status_assoc *bit;
-	struct device *dev = rdev_get_dev(rdev);
-	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_data *data = i2c_get_clientdata(client);
-	u8 page = rdev_get_id(rdev);
+	struct device *dev = data->dev;
+	struct i2c_client *client = to_i2c_client(dev);
 	int func = data->info->func[page];
 
 	*flags = 0;
 
-	mutex_lock(&data->update_lock);
-
 	for (i = 0; i < ARRAY_SIZE(pmbus_status_flag_map); i++) {
 		cat = &pmbus_status_flag_map[i];
 		if (!(func & cat->func))
 			continue;
 
 		status = _pmbus_read_byte_data(client, page, cat->reg);
-		if (status < 0) {
-			mutex_unlock(&data->update_lock);
+		if (status < 0)
 			return status;
-		}
 
 		for (bit = cat->bits; bit->pflag; bit++) {
 			if (status & bit->pflag)
@@ -2823,11 +2797,10 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	 * REGULATOR_ERROR_<foo>_WARN.
 	 */
 	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
-	mutex_unlock(&data->update_lock);
 	if (status < 0)
 		return status;
 
-	if (pmbus_regulator_is_enabled(rdev)) {
+	if (_pmbus_is_enabled(dev, page)) {
 		if (status & PB_STATUS_OFF)
 			*flags |= REGULATOR_ERROR_FAIL;
 
@@ -2855,6 +2828,59 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	return 0;
 }
 
+static int __maybe_unused pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flags)
+{
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = _pmbus_get_flags(data, page, flags);
+	mutex_unlock(&data->update_lock);
+
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_REGULATOR)
+static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	return pmbus_is_enabled(rdev_get_dev(rdev), rdev_get_id(rdev));
+}
+
+static int _pmbus_regulator_on_off(struct regulator_dev *rdev, bool enable)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	u8 page = rdev_get_id(rdev);
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
+				     PB_OPERATION_CONTROL_ON,
+				     enable ? PB_OPERATION_CONTROL_ON : 0);
+	mutex_unlock(&data->update_lock);
+
+	return ret;
+}
+
+static int pmbus_regulator_enable(struct regulator_dev *rdev)
+{
+	return _pmbus_regulator_on_off(rdev, 1);
+}
+
+static int pmbus_regulator_disable(struct regulator_dev *rdev)
+{
+	return _pmbus_regulator_on_off(rdev, 0);
+}
+
+static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	return pmbus_get_flags(data, rdev_get_id(rdev), flags);
+}
+
 static int pmbus_regulator_get_status(struct regulator_dev *rdev)
 {
 	struct device *dev = rdev_get_dev(rdev);
-- 
2.39.1

