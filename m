Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805C3C38142
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Jan 2023 06:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjAWGkg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Jan 2023 01:40:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjAWGkf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Jan 2023 01:40:35 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFD416AD3
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Jan 2023 22:40:34 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m15so8179948wms.4
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Jan 2023 22:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86T6EDiTMrf7zBUXyMzRIZen/96Xp0PrhB5D+bfRINk=;
        b=NMzS1fZ6k9qFucPKXuTEABW9tjwaDSTWmR8DT0pF6H0H1kMpb9rwWQiQz7EaqjrFGJ
         uBwC0HklMb95ut5E3i66PIMFmBHeviWvDjlVDZvgcULqOJo8pecx2IzbRh0M91fogAOd
         sJ9w/z5etp0jhMUF6F1ldTNBAVPAa1UEQcuWWPPWqZTO/Ot/i3QUstfLUJNm/XXDS06t
         EG9xxcZhu6vJAI8YwG9RpRBBjox4m/XeXUJDSm0oECIjIb7g9vmxd2+J2ZiLWZEza9xR
         yfklba1vHd+GJM4f595XmopziY3lyOBy2QHaAq9SK2WbtMyFWyhI6dz7/FBAtrebXKYr
         0m3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86T6EDiTMrf7zBUXyMzRIZen/96Xp0PrhB5D+bfRINk=;
        b=jBWUAVUGGzXl+qPOj8lRzPuJQH8BKRg6Je7N7DBu7hUBqw2Wv446o5e6GIZPboHs68
         K4HfUPdVTmcjQJt9T88ZVYiXOPTOsqpTig8+1thl2tvrN2nUVFs8UhxzRSK2zP+BwY/+
         7gMK1tHO3UMzzGPvDWt/lOqTn2oCpKneZeoS02TDuFdRQV9Y6b7NXOUhiEONKO0wlTwN
         uFE0dELUaY8I3fVcX4xDb3R2yuDHXMY89cROvQUOcTAZO6cVjZZM9k7Ket2q9pU6GKpr
         JWSRaSBsBLOEpo7vH4aKX0IzQUHEKC+2mG6DnDcz3/f/8xp6KEWA7dAU+FQRTumRjojZ
         EiKw==
X-Gm-Message-State: AFqh2krg9bZtqx1r1O/GdZnR+9sCWFjAgeePE/5BVqnz43Czho1Brhoq
        qQfPJnlZwNlDD+hOiIKbl3Y8sW2VpzMDXyDsV/U=
X-Google-Smtp-Source: AMrXdXtbRgY4Pq0dCdkFyzPdwV+gBaPXn5spLKjeaGOTSWUS5qFfwCWYhLr0iSH4scTyS8zPvbj3Eg==
X-Received: by 2002:a05:600c:3583:b0:3d9:719a:8f7d with SMTP id p3-20020a05600c358300b003d9719a8f7dmr22155580wmq.35.1674456032636;
        Sun, 22 Jan 2023 22:40:32 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id o4-20020a1c7504000000b003da28dfdedcsm11439373wmc.5.2023.01.22.22.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 22:40:32 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] hwmon: (pmbus/core) Generalise pmbus get status
Date:   Mon, 23 Jan 2023 07:40:19 +0100
Message-Id: <20230123064021.2657670-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230123064021.2657670-1-Naresh.Solanki@9elements.com>
References: <20230123064021.2657670-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add function pmbus get status that can be used to get both pmbus
specific status & regulator status

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 148 +++++++++++++++++--------------
 1 file changed, 82 insertions(+), 66 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 1b70cf3be313..12b662b91306 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2735,64 +2735,16 @@ static const struct pmbus_status_category __maybe_unused pmbus_status_flag_map[]
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
+static int pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *error)
 {
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
-
-static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
-{
-	int i, status;
 	const struct pmbus_status_category *cat;
 	const struct pmbus_status_assoc *bit;
-	struct device *dev = rdev_get_dev(rdev);
-	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_data *data = i2c_get_clientdata(client);
-	u8 page = rdev_get_id(rdev);
+	struct i2c_client *client = to_i2c_client(data->dev);
 	int func = data->info->func[page];
+	int i, status, ret;
 
-	*flags = 0;
+	*error = 0;
 
 	mutex_lock(&data->update_lock);
 
@@ -2803,14 +2755,15 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 
 		status = _pmbus_read_byte_data(client, page, cat->reg);
 		if (status < 0) {
-			mutex_unlock(&data->update_lock);
-			return status;
+			ret = status;
+			goto unlock;
 		}
 
 		for (bit = cat->bits; bit->pflag; bit++) {
 			if (status & bit->pflag)
-				*flags |= bit->rflag;
+				*error |= bit->rflag;
 		}
+
 	}
 
 	/*
@@ -2823,36 +2776,99 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	 * REGULATOR_ERROR_<foo>_WARN.
 	 */
 	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
-	mutex_unlock(&data->update_lock);
-	if (status < 0)
-		return status;
 
-	if (pmbus_regulator_is_enabled(rdev)) {
+	if (status < 0) {
+		ret = status;
+		goto unlock;
+	}
+
+	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
+	if (ret < 0)
+		goto unlock;
+
+	if (ret & PB_OPERATION_CONTROL_ON) {
 		if (status & PB_STATUS_OFF)
-			*flags |= REGULATOR_ERROR_FAIL;
+			*error |= REGULATOR_ERROR_FAIL;
 
 		if (status & PB_STATUS_POWER_GOOD_N)
-			*flags |= REGULATOR_ERROR_REGULATION_OUT;
+			*error |= REGULATOR_ERROR_REGULATION_OUT;
 	}
 	/*
 	 * Unlike most other status bits, PB_STATUS_{IOUT_OC,VOUT_OV} are
 	 * defined strictly as fault indicators (not warnings).
 	 */
 	if (status & PB_STATUS_IOUT_OC)
-		*flags |= REGULATOR_ERROR_OVER_CURRENT;
+		*error |= REGULATOR_ERROR_OVER_CURRENT;
 	if (status & PB_STATUS_VOUT_OV)
-		*flags |= REGULATOR_ERROR_REGULATION_OUT;
+		*error |= REGULATOR_ERROR_REGULATION_OUT;
 
 	/*
 	 * If we haven't discovered any thermal faults or warnings via
 	 * PMBUS_STATUS_TEMPERATURE, map PB_STATUS_TEMPERATURE to a warning as
 	 * a (conservative) best-effort interpretation.
 	 */
-	if (!(*flags & (REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TEMP_WARN)) &&
+	if (!(*error & (REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TEMP_WARN)) &&
 	    (status & PB_STATUS_TEMPERATURE))
-		*flags |= REGULATOR_ERROR_OVER_TEMP_WARN;
+		*error |= REGULATOR_ERROR_OVER_TEMP_WARN;
 
-	return 0;
+unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
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
 }
 
 static int pmbus_regulator_get_status(struct regulator_dev *rdev)
-- 
2.38.1

