Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05456C001DF
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 12:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbjGYMyn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 08:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233308AbjGYMym (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 08:54:42 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE8213D
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 05:54:35 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so7813545a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690289674; x=1690894474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MkRYmXmHZ+64hiKvKzZjrtd77nbRk+uqXsZ3jdXGpc=;
        b=Aj6w7q3BdmsRSLmcTTqeGv9mNeJhH42tnBilSqCOOSWFLWvdjkHlD0pIVf0xJa+31k
         TMRPxH9UjCWpAwqz1AtCfG+vwK4y3/uFyjk8qNJJes5CjcxtXqCvGKFsEurEPIxQQFi1
         MVrYA4S78fJIiJdWGPJfXmb3Pk9fwDz7gHSiX8eQlFzq3UQ7T2/8c+/uHR9mcvuu6Fub
         xJwCWB1DF+g+xDM7A+k01oqJWMubV53tEKmBPiKHDx1ZKZOUQEMZcve4aOxaYDXDTXC8
         FuHftBsSLCQ62+1Pj1BQdZb/exlYTUWkhNkoFeeVY8DLGpJ0mUEf0VcuqX5Kue/ehUCL
         4Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690289674; x=1690894474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MkRYmXmHZ+64hiKvKzZjrtd77nbRk+uqXsZ3jdXGpc=;
        b=VkFhyECO2LtJNeDP0dDKUQlBAxYBWhWBQHZiUR2V7YBvuXhPHEYBV3fgw+y3qlBCms
         luOYLKCpAFMOtC2+K7Kvbw1a4QxHHzPScGLX4N6XE8ujq3BsaMaAIcgyQXaG3pP44LYt
         //x42iOilIdo+Q20W9ayBclhGXmLj25QleBjcABietKyJ343y4kb0TTHZAkVG3ereE6v
         CMRvovotrRGGEfKNmAumbSiK23uCr3Jzfk3sZmybM79q8gdZLIc4CYltHQMKnX29nwh+
         ztTbODplIJHSCLvn66eUqSZ2OH73XYz5uEwBrzabb0itJE6V+oB9U8fLVDEMqSykDOvj
         QSmw==
X-Gm-Message-State: ABy/qLa0Ex1V83XMxR7Zyw5zPECI1yu/107wlS1VsKjLaN4W1oKgAR5K
        nKO1rzmVbpEnj/9OzFfuHUehpw==
X-Google-Smtp-Source: APBJJlFArk8UU2wj3uy9zsuNg0zcth6a3PvBukhgkt5QwJIOzNGUf7EkojPwDZBDoVnAknWTu6SFXw==
X-Received: by 2002:a05:6402:645:b0:522:2111:105d with SMTP id u5-20020a056402064500b005222111105dmr7394161edx.20.1690289674437;
        Tue, 25 Jul 2023 05:54:34 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402064b00b0051dfa2e30b2sm7516682edx.9.2023.07.25.05.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 05:54:34 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] pmbus_core: Fix Deadlock
Date:   Tue, 25 Jul 2023 14:54:27 +0200
Message-ID: <20230725125428.3966803-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725125428.3966803-1-Naresh.Solanki@9elements.com>
References: <20230725125428.3966803-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

pmbus_regulator_get_error_flags() will also acquire the update_lock,
thus unlock the mutex before trying to lock it again from within
the same thread.

Fixes a deadlock when trying to read the regulator status.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 30aeb59062a5..42f4250c53ed 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2949,37 +2949,27 @@ static int pmbus_regulator_get_status(struct regulator_dev *rdev)
 
 	mutex_lock(&data->update_lock);
 	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
-	if (status < 0) {
-		ret = status;
-		goto unlock;
-	}
+	mutex_unlock(&data->update_lock);
+	if (status < 0)
+		return status;
 
-	if (status & PB_STATUS_OFF) {
-		ret = REGULATOR_STATUS_OFF;
-		goto unlock;
-	}
+	if (status & PB_STATUS_OFF)
+		return REGULATOR_STATUS_OFF;
 
 	/* If regulator is ON & reports power good then return ON */
-	if (!(status & PB_STATUS_POWER_GOOD_N)) {
-		ret = REGULATOR_STATUS_ON;
-		goto unlock;
-	}
+	if (!(status & PB_STATUS_POWER_GOOD_N))
+		return REGULATOR_STATUS_ON;
 
 	ret = pmbus_regulator_get_error_flags(rdev, &status);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	if (status & (REGULATOR_ERROR_UNDER_VOLTAGE | REGULATOR_ERROR_OVER_CURRENT |
 	   REGULATOR_ERROR_REGULATION_OUT | REGULATOR_ERROR_FAIL | REGULATOR_ERROR_OVER_TEMP)) {
-		ret = REGULATOR_STATUS_ERROR;
-		goto unlock;
+		return REGULATOR_STATUS_ERROR;
 	}
 
-	ret = REGULATOR_STATUS_UNDEFINED;
-
-unlock:
-	mutex_unlock(&data->update_lock);
-	return ret;
+	return REGULATOR_STATUS_UNDEFINED;
 }
 
 static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
-- 
2.41.0

