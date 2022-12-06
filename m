Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B16C352A1
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Dec 2022 05:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbiLFFyS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Dec 2022 00:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233690AbiLFFyB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Dec 2022 00:54:01 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB66226111
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 21:53:57 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 136so12489313pga.1
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 21:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8Zygmke2JSA0AwAQTuNOGU3xeWBIshKCO7EnoYzw1M=;
        b=pIF6YcfLx9WR2BpUYjE7Ei4zVmStgfOMvWSeVSkEX4McU6Hr0HFA/rHxdMvuQYdUvE
         r6tqcJA4Lu+0wgNGOGxfAyQVc/XR/DhB6ti6VV7V9f6LtKoYQsn9jZJqooPwhOKhCSuA
         nbRLLIUwu++3kV5Y4jkrjm6pOEmBlNN+FsU9B2i43bn7Bwo/pMGx+/1wylGFfz8XV46q
         M7Q09NaYfm8cECrygQMIqIgZauC4sdzy8kkGc45qoekyNnLHdQxSkYswBRsQqPkKc/nZ
         6RSoSY9qW6z8FX6I4T8nFBVCC6g2djkJp4jf+l3QekC0ugHbHTv+wWlncmBDcopkAl79
         CbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8Zygmke2JSA0AwAQTuNOGU3xeWBIshKCO7EnoYzw1M=;
        b=0QA3WHvFkrgM9P+bb9DXirYfxwfUkgOTtn1eMbyWsUOdU3j5NHjVzh1e84rbBiG+NA
         5eqih0VP7yIf4qwFF8gy3XgUDUhKIMKJ++w0+jXLmmIYChMHjhBpQvzdx01JMefhUN5S
         Bza2u6YzqXX/eYpBeKbKv2xQzVE1cLVW3zfBjEnHDTCzuqLIoIPiwSCWaEWZ+pWgBPxG
         msGQ1BqBJ2lXGFFyO907WbcuLMpY91X3AWh0eRiGcohxtIV8pVoZuS0+Tg0yG57ZISAd
         4MVlejyr6/4xE4ENRfx5MJL4n/QV336KqUmR6y18tltApexiX39kKHxGJE2Qzgp350YY
         kXCQ==
X-Gm-Message-State: ANoB5pm/RmmMs0iYuAz9yRx5foocQP+54WzrymCqJGNldnu1nJy5PTjl
        mPk7vdzZz+fIyjLSCfWNtWU=
X-Google-Smtp-Source: AA0mqf4xRrfpahogIG+5/jwLzHjOVST5JatVMbN6TQZxCvryrB97JVtXwvY9KuDKUsNaHedIzdHC+Q==
X-Received: by 2002:a63:d249:0:b0:464:85db:29c with SMTP id t9-20020a63d249000000b0046485db029cmr77502368pgi.600.1670306037325;
        Mon, 05 Dec 2022 21:53:57 -0800 (PST)
Received: from localhost.localdomain ([193.122.98.110])
        by smtp.gmail.com with ESMTPSA id s5-20020a17090a5d0500b002191e769546sm10064374pji.4.2022.12.05.21.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 21:53:57 -0800 (PST)
From:   Xingjiang Qiao <nanpuyue@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Xingjiang Qiao <nanpuyue@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: (emc2305) fix pwm never being able to set lower
Date:   Tue,  6 Dec 2022 13:53:31 +0800
Message-Id: <20221206055331.170459-2-nanpuyue@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205173611.145571-1-nanpuyue@gmail.com>
References: <20221205173611.145571-1-nanpuyue@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There are fields 'last_hwmon_state' and 'last_thermal_state' in the
structure 'emc2305_cdev_data', which respectively store the cooling state
set by the 'hwmon' and 'thermal' subsystem, and the driver author hopes
that if the state set by 'hwmon' is lower than the value set by 'thermal',
the driver will just save it without actually setting the pwm. Currently,
the 'last_thermal_state' also be updated by 'hwmon', which will cause the
cooling state to never be set to a lower value. This patch fixes that.

Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>
---
 drivers/hwmon/emc2305.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 9a78ca22541e..e0f6eb8d72fc 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -171,22 +171,12 @@ static int emc2305_get_max_state(struct thermal_cooling_device *cdev, unsigned l
 	return 0;
 }
 
-static int emc2305_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+static int emc2305_set_cur_state_shim(struct emc2305_data *data, int cdev_idx, unsigned long state)
 {
-	int cdev_idx, ret;
-	struct emc2305_data *data = cdev->devdata;
+	int ret;
 	struct i2c_client *client = data->client;
 	u8 val, i;
 
-	if (state > data->max_state)
-		return -EINVAL;
-
-	cdev_idx =  emc2305_get_cdev_idx(cdev);
-	if (cdev_idx < 0)
-		return cdev_idx;
-
-	/* Save thermal state. */
-	data->cdev_data[cdev_idx].last_thermal_state = state;
 	state = max_t(unsigned long, state, data->cdev_data[cdev_idx].last_hwmon_state);
 
 	val = EMC2305_PWM_STATE2DUTY(state, data->max_state, EMC2305_FAN_MAX);
@@ -211,6 +201,27 @@ static int emc2305_set_cur_state(struct thermal_cooling_device *cdev, unsigned l
 	return 0;
 }
 
+static int emc2305_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	int cdev_idx, ret;
+	struct emc2305_data *data = cdev->devdata;
+
+	if (state > data->max_state)
+		return -EINVAL;
+
+	cdev_idx =  emc2305_get_cdev_idx(cdev);
+	if (cdev_idx < 0)
+		return cdev_idx;
+
+	/* Save thermal state. */
+	data->cdev_data[cdev_idx].last_thermal_state = state;
+	ret = emc2305_set_cur_state_shim(data, cdev_idx, state);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static const struct thermal_cooling_device_ops emc2305_cooling_ops = {
 	.get_max_state = emc2305_get_max_state,
 	.get_cur_state = emc2305_get_cur_state,
@@ -401,7 +412,7 @@ emc2305_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int ch
 				 */
 				if (data->cdev_data[cdev_idx].last_hwmon_state >=
 				    data->cdev_data[cdev_idx].last_thermal_state)
-					return emc2305_set_cur_state(data->cdev_data[cdev_idx].cdev,
+					return emc2305_set_cur_state_shim(data, cdev_idx,
 							data->cdev_data[cdev_idx].last_hwmon_state);
 				return 0;
 			}
-- 
2.38.1

