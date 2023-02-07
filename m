Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472F3C636CD
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Feb 2023 12:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjBGMC5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Feb 2023 07:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjBGMC5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Feb 2023 07:02:57 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902B82884C
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Feb 2023 04:02:55 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id c13so774676ejz.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Feb 2023 04:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K+ZLTj8TNhh50yQ9Sti/hg/6By9J7aKWdBXzNoY0ek=;
        b=LSz/kFE0JAdR7DbElLr817wFiDDlS6W3eaZX6/WGtjMed9DpP0GBYWQ2BWPNHr6u/h
         p5k5KE9h23pBhAzWAQA8tGj0a/QC/jiHUIrNKM4pK1nuDApKjnJQ2muOXyMDimcy4smS
         6J7gpElNk8QTVlEw/890CK09LxfSrnLWlbmGOktI9aRikV9CPdrvxJeYdDHE4GHXheSM
         aqU/jN/B18KP3CuqpdrBJ+1ccIs/4mNa7EccFoopIQFA7ex6GNP3upazdoUZfOZ2If7u
         AUqB6878WO9OPD54rvJVEpY03KMYDzkx1Qzs3XFdE1LJoTbXXb5yWIlNsnuEm19vJAZ8
         /Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K+ZLTj8TNhh50yQ9Sti/hg/6By9J7aKWdBXzNoY0ek=;
        b=DLzG/Bs5x+4d8iJB2h2NnKgbDJAPhgKG9zSVliGYFfoCrHdTCJ33l7QVOcKXZ9v4Af
         uJiwAjI9D49gc31lkBzNPZvJaRD3LvZLYXLLlMJ1/6S+Ti2O+MbfDt/I1hpmX0VWMeOC
         Z6WhqOFJoaiHBriNUiwpIT7AmwqvwComfgAgz52fnVxrs4V9kaAbaZkeOWa1iHA2ETyX
         edV+T+AiZnGtIoCJAhreJ8lt4A3vHKG19tykCxZHEAYOlEBQZvZSnVdA/bOg8fe3f83i
         nG3XCkMRDRyFrOz8mmBG4IDZdhXeCp6RCKNuSof/jf6PSzFQL2siQwMAIGgMygJ3vLlC
         Q8uQ==
X-Gm-Message-State: AO0yUKWar1v7f76exr/BdpBvcZBuSyTkVDeL0qla4UA6Rh5b1L6I2yGu
        lAWrjXgLDrMlIFsNiBalArQ60w==
X-Google-Smtp-Source: AK7set+C4+rmd8QKKPtYD7X0wChyummFB3cVK9ea1lut40P+et3bZEJpZ0x6VHlmgzc7B/4gff3QeA==
X-Received: by 2002:a17:907:709:b0:8a9:273d:634c with SMTP id xb9-20020a170907070900b008a9273d634cmr3114706ejb.21.1675771374181;
        Tue, 07 Feb 2023 04:02:54 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id r5-20020a170906a20500b008710789d85fsm6843934ejy.156.2023.02.07.04.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:02:53 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] hwmon: (pmbus/core) Generalise pmbus get status
Date:   Tue,  7 Feb 2023 13:02:39 +0100
Message-Id: <20230207120241.2800662-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207120241.2800662-1-Naresh.Solanki@9elements.com>
References: <20230207120241.2800662-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add function pmbus get status that can be used to get both pmbus
specific status & regulator status

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
...
Changes in V2:
- Add __maybe_unused attribute for pmbus_get_status function
- Remove unrelated changes
---
 drivers/hwmon/pmbus/pmbus_core.c | 118 +++++++++++++++++--------------
 1 file changed, 66 insertions(+), 52 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 1b70cf3be313..5ccae8126a56 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2735,61 +2735,14 @@ static const struct pmbus_status_category __maybe_unused pmbus_status_flag_map[]
 	},
 };
 
-#if IS_ENABLED(CONFIG_REGULATOR)
-static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
-{
-	struct device *dev = rdev_get_dev(rdev);
-	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_data *data = i2c_get_clientdata(client);
-	u8 page = rdev_get_id(rdev);
-	int ret;
-
-	mutex_lock(&data->update_lock);
-	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
-	mutex_unlock(&data->update_lock);
-
-	if (ret < 0)
-		return ret;
-
-	return !!(ret & PB_OPERATION_CONTROL_ON);
-}
-
-static int _pmbus_regulator_on_off(struct regulator_dev *rdev, bool enable)
-{
-	struct device *dev = rdev_get_dev(rdev);
-	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_data *data = i2c_get_clientdata(client);
-	u8 page = rdev_get_id(rdev);
-	int ret;
-
-	mutex_lock(&data->update_lock);
-	ret = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
-				     PB_OPERATION_CONTROL_ON,
-				     enable ? PB_OPERATION_CONTROL_ON : 0);
-	mutex_unlock(&data->update_lock);
-
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
-}
 
-static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
+static int __maybe_unused pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flags)
 {
-	int i, status;
+	int i, status, ret;
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
@@ -2827,7 +2780,13 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	if (status < 0)
 		return status;
 
-	if (pmbus_regulator_is_enabled(rdev)) {
+	mutex_lock(&data->update_lock);
+	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
+	mutex_unlock(&data->update_lock);
+	if (ret < 0)
+		return status;
+
+	if (ret & PB_OPERATION_CONTROL_ON) {
 		if (status & PB_STATUS_OFF)
 			*flags |= REGULATOR_ERROR_FAIL;
 
@@ -2855,6 +2814,61 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_REGULATOR)
+static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	u8 page = rdev_get_id(rdev);
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
+	mutex_unlock(&data->update_lock);
+
+	if (ret < 0)
+		return ret;
+
+	return !!(ret & PB_OPERATION_CONTROL_ON);
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

