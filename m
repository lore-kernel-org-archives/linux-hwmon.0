Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21D3C001DE
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jul 2023 03:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjG0Dhn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Jul 2023 23:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbjG0Dh1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2023 23:37:27 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4157A2137
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2023 20:37:11 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-76714caf466so44478685a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2023 20:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690429030; x=1691033830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jIj3XbCluPedak2cjTRqnF4TWL+1e6DYx/siw7DGYG4=;
        b=LOri5vwpLAj4Jl9e6hzziz28+3y3trZ+uACrGoI3i02Cs8jCFXhnBCEX4DZuDhu3rK
         DpLpA4vu0xyFuMPzR2KaeRfuYf3Au1SUHtep3HFTwBqXjhx8JRsgfgUTaFA/SUeGt+GS
         5/1ybTi9g1VDipMCr2f6kL6EqnR94Zf8HsmBEIH5XFjAaycMKkMG1cd+lWZFzasIj3je
         qmk/WnYP2w/cHGRSVhkNam027JEZQ98Fufpnmy/T3ej+9HFp15imwYvdcMmcYdTCd7t3
         9SsUUP5Jf81YsqBEUdF5TpDdSMyxYmkUtdbS4UncYcEd22eJkux3u/L3lZOH9t9DJu9b
         szHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690429030; x=1691033830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIj3XbCluPedak2cjTRqnF4TWL+1e6DYx/siw7DGYG4=;
        b=TLSWvXkcd+iljFyQv3yS9BR7sMRbCwMtMzC6syANsX4M+cPWoodAKrQHMWWU+XcAc8
         M1qcNMcFq5fput4M34NB+ni6/3F+orZr2ii2ZjK84VMjO5LuAak2ZUXhbLvuru8s5MPH
         PoSW21J/+rI07ySTRCWU4yz0CHg7OrbZd6w7cxrVceeCqp45mOxdS9zyQ8aA8/2zT1sV
         82KBWZtuHiY9FJ+iPbZIRfZAXDefVhyabqkiIxoSWwP9VJYeNPt0NBZF4zJQ5lvG786c
         FfgbbbVHPPD/xpa7/lUHq8xgW2qXXYX9MIzi5xlG4gAOf5QbaYh8b/Gw/JKyc6t5pq7Z
         kjwg==
X-Gm-Message-State: ABy/qLao3PZHaSb/CxUxwZxOpm2OO7WizIgobJQWXwSFRWFUF+3ytHX7
        wD7vY+sZt/UbxrWjbKUSex04FxBW6ls=
X-Google-Smtp-Source: APBJJlHA4jnomFSsZazpu3TVtN9kGAWMITZxzil5Ebl+savh/w0GxhaBU3Bo9unfZucnZhG3PYcGoA==
X-Received: by 2002:a05:620a:24e:b0:765:ad52:7a4f with SMTP id q14-20020a05620a024e00b00765ad527a4fmr4185177qkn.59.1690429029677;
        Wed, 26 Jul 2023 20:37:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n16-20020a17090ade9000b00264040322desm272595pjv.40.2023.07.26.20.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 20:37:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH] hwmon: (pmbus_core) Fix Deadlock in pmbus_regulator_get_status
Date:   Wed, 26 Jul 2023 20:37:06 -0700
Message-Id: <20230727033706.3500722-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

pmbus_regulator_get_status() acquires update_lock.
pmbus_regulator_get_error_flags() acquires it again, resulting in an
immediate deadlock.

Call _pmbus_get_flags() from pmbus_regulator_get_status() directly
to avoid the problem.

Reported-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Closes: https://lore.kernel.org/linux-hwmon/b7a3ad85-aab4-4718-a001-1d8b1c0eef36@roeck-us.net/T/#u
Cc: Naresh Solanki <Naresh.Solanki@9elements.com>
Fixes: c05f477c4ba3 ("hwmon: (pmbus/core) Implement regulator get_status")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I want to send this in a pull request this week, and I have not heard back
from the reporters. Patrick, Naresh, please feel free to submit a similar
patch by Thursday EOB this week. Otherwise I'll send this one upstream. 

 drivers/hwmon/pmbus/pmbus_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 30aeb59062a5..69a4e62b6c8d 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2946,6 +2946,7 @@ static int pmbus_regulator_get_status(struct regulator_dev *rdev)
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	u8 page = rdev_get_id(rdev);
 	int status, ret;
+	int event;
 
 	mutex_lock(&data->update_lock);
 	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
@@ -2965,7 +2966,7 @@ static int pmbus_regulator_get_status(struct regulator_dev *rdev)
 		goto unlock;
 	}
 
-	ret = pmbus_regulator_get_error_flags(rdev, &status);
+	ret = _pmbus_get_flags(data, rdev_get_id(rdev), &status, &event, false);
 	if (ret)
 		goto unlock;
 
-- 
2.39.2

