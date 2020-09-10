Return-Path: <SRS0=6Npe=CT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD085C43461
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Sep 2020 10:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4391A206B8
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Sep 2020 10:30:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/+zkE+D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgIJKap (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Sep 2020 06:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgIJKam (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Sep 2020 06:30:42 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21EDCC061573
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 03:30:41 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id s17so1313725ooe.6
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 03:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=74bHZesCBNzB1EEeQL+ggxhoi6F46CSGIey5fTj1YjE=;
        b=B/+zkE+DDIdl3eDnTjajTW9ekd7w42WN5OBbu+qyis8gsa/xLi8nUNcqc0Ig3e/QqW
         InFxlLgj6rvcerIhsHRNHfIMrIzbxwP50ASWfVRgxdOYceD/V0k2nGGyifXebEjVbmV8
         W9BleDKQBPOtM24mH3qSDt/jiC+vWy5uKz1XCp7rqc4HUzYO41VSaa/I/eu0C7Wz9u/H
         BuWcKFeaQVQ6u9QeH4N2Jd8Hl29pNjA/b57/3gQ68mSwCcm9n+uoCdmSBfx23Y10Wiwj
         NyS22ZJf9DHkspf2HmHNgrjvC6CFAkSnXIoCV6VdDBbzvL7cMnRDEwCptqKMnf66ZRZv
         Re7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=74bHZesCBNzB1EEeQL+ggxhoi6F46CSGIey5fTj1YjE=;
        b=r8Vzj/+7GH6qZzE98Y8QAYCYt5mX51d024zuIygAOEWOCrRPuJfLDWh/DQ1ZLHiM29
         0DxVWPgXIaBgTgMwmIjz0eLEz6GOx8N+paZP/qwk47OoTi9L3rAV0XXUKorTORTQb9gU
         7F/ZZyPMd58z7GDDXYutk8Aqhk71Z1ZcoAxN7pqOo8AuXP1Sa3vQxCtmrTy6XrLmvwgv
         +Iyk30OTDiARDq1q9Iro2yN+6mwD/6GB8p8LH65bsOo65w6BqdQP8T00Nw82QTooXS7N
         Gyq9C3QMcvkq8qmRfCe8cEp8Cq3AeBp+jm9U9xzqYEV86vHkQYk6hgxeJhbYNXkRsE4J
         oUUQ==
X-Gm-Message-State: AOAM5302RUpNWYD6Z1v99STaktiHAEX1IYaAdaVYdeTEkmTocKTBcwbG
        MN0OpoXTj9qItI1kXI68WPdmSv/v0Bg=
X-Google-Smtp-Source: ABdhPJz8kauI4xPNc4PhHb8MrOz7iU/9kUcMpf5A14ml6dBF4S9+NvBv8vEM4P0s7tiNU1Hbkn8YpQ==
X-Received: by 2002:a4a:ab48:: with SMTP id j8mr3878763oon.57.1599733838980;
        Thu, 10 Sep 2020 03:30:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f50sm760693otf.47.2020.09.10.03.30.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 03:30:38 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Alex Qiu <xqiu@google.com>
Subject: [PATCH] hwmon: (pmbus) Move boolean error condition check to generating code
Date:   Thu, 10 Sep 2020 03:30:36 -0700
Message-Id: <20200910103036.143702-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

0-day rightfully complains about a sometimes uninitialized variable
in pmbus_get_boolean().

drivers/hwmon/pmbus/pmbus_core.c:903:13: warning:
		variable 'ret' is used uninitialized whenever 'if' condition is true
	} else if (!s1 || !s2) {

While that is technically true, it won't be hit in the field since the
condition indicates a programming error. Move the check of that condition
into the code generating the attribute entry, and refuse generating the
attribute if the condition is true. Swap the condition check in
pmbus_get_boolean() to ensure that static analyzers don't get a hiccup
(because we check if s1 and s2 are NULL, static analyzers may believe
that they can be NULL independently of each other).

Reported-by: kernel test robot <lkp@intel.com>
Cc: Alex Qiu <xqiu@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 5113b5eca17a..6be08696189c 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -898,11 +898,7 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 		pmbus_update_sensor_data(client, s2);
 
 	regval = status & mask;
-	if (!s1 && !s2) {
-		ret = !!regval;
-	} else if (!s1 || !s2) {
-		WARN(1, "Bad boolean descriptor %p: s1=%p, s2=%p\n", b, s1, s2);
-	} else {
+	if (s1 && s2) {
 		s64 v1, v2;
 
 		if (s1->data < 0) {
@@ -917,6 +913,8 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 		v1 = pmbus_reg2data(data, s1);
 		v2 = pmbus_reg2data(data, s2);
 		ret = !!(regval && v1 >= v2);
+	} else {
+		ret = !!regval;
 	}
 unlock:
 	mutex_unlock(&data->update_lock);
@@ -1044,6 +1042,9 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 	struct pmbus_boolean *boolean;
 	struct sensor_device_attribute *a;
 
+	if (WARN((s1 && !s2) || (!s1 && s2), "Bad s1/s2 parameters\n"))
+		return -EINVAL;
+
 	boolean = devm_kzalloc(data->dev, sizeof(*boolean), GFP_KERNEL);
 	if (!boolean)
 		return -ENOMEM;
-- 
2.17.1

