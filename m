Return-Path: <SRS0=soXM=UF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96E1C04AB5
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Jun 2019 16:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF80620693
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Jun 2019 16:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3cEuQLl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfFFQ7u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Jun 2019 12:59:50 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41113 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFQ7u (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Jun 2019 12:59:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id s24so1159850plr.8
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Jun 2019 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=ZPC19q8SW3xreOsmyGgEIO0SdMZfegvscpSyIFIUKjY=;
        b=l3cEuQLl6gmc5AoWd8uctfAI4Pm6sUiratk07hSSDuOKdaI36yAeY8W9S7cGXzY5Kw
         HYPkzWm003i8hL3+NwUSI3LV+ySPyNoRNd5xqLHaZTnia2WAfn1Ig6KQKeuO2L7Mx51o
         bEvrXPnQ2bZRkBCQbdwRudXY+KudYJb/AwB85jbUU4EXnk4k4oNnJRmNB7FP+LkfBQNn
         gaN9LfacFyvO7xO6qc7cz/vvcoAchSUmOzuDylfUZuBNC6N/MKX3Qr8uModUrKs0Jxp0
         2zyR0QKz+t52NJbdMBk8rjc95Io34nJsk59tafjyvJRzP7LqeT0Aohc+TJV4zPKvRUed
         o8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=ZPC19q8SW3xreOsmyGgEIO0SdMZfegvscpSyIFIUKjY=;
        b=bNSGtnupri07v/LqjRXHKF6zktUkpZyI+bon4/1gKJSC+q7KHtqqK6UQX19KNy7OTr
         R/XHUqEukmQkL2HXajMik5K3t3w20tAhkt4i808U7Dp9f/SahaCZ4OfKeQitAY4Zy2yn
         TPO1qYhAz1Nqotp1j9HO1Ei0XM0bqlUeVv33i6W1I/HrlkvO0N9da03KzAEMORrH3Jot
         +pRP6aNFoASKaeEUoEwzVeT21YPGhHIakyReH9ZRmTOpHOiq0mP00a8kUP8yfxk6l603
         jQxIc4oSm7FwHgtM34CsW+CzUs5bQauYsGaMIl54+C2cp3buxnRPdTU+GMFB98ebdQlp
         7QuQ==
X-Gm-Message-State: APjAAAWnbkplNyded/cp1aS9Nmr2D4CFWq2D1kBSwsyMihX33y9b6JYb
        fkvhFjjP9+1QEtrf1Do8bG8V2wjO
X-Google-Smtp-Source: APXvYqyHFNqzn3+86wJsOKQML2EZwc2uJsZEeLDwQSmpQpccMq61t15/9WSK+4EV5WeUSZehnbt66A==
X-Received: by 2002:a17:902:2a29:: with SMTP id i38mr23540807plb.46.1559840389321;
        Thu, 06 Jun 2019 09:59:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o20sm2111406pgj.70.2019.06.06.09.59.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 09:59:48 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eduardo Valentin <eduval@amazon.com>
Subject: [PATCH] hwmon: (core) Add comment describing how hwdev is freed in error path
Date:   Thu,  6 Jun 2019 09:59:45 -0700
Message-Id: <1559840385-32728-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The hwmon core registers the hwmon device before adding sensors to the
thermal core. If that fails, the hwmon device is released and an error
is returned to the caller. From the code flow, it appears to be necessary
to free struct hwmon_device *, allocated with kzalloc(), in that
situation. This is incorrect, since the data structure will be freed
automatically in hwmon_dev_release() when device_unregister() is called.
This used to result in a double free, which was found and fixed with
commit 74e3512731bd ("hwmon: (core) Fix double-free in
__hwmon_device_register()"). This is, however, not obvious; any reader
may erroneously conclude that the data structure is not freed.

Add comment explaining why kfree() is not necessary in this situation.

Reported-by: Eduardo Valentin <eduval@amazon.com>
Cc: Eduardo Valentin <eduval@amazon.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 429784edd5ff..d0f821bf8ab6 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -654,6 +654,12 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 								hwdev, j);
 					if (err) {
 						device_unregister(hdev);
+						/*
+						 * Don't worry about hwdev;
+						 * hwmon_dev_release(), called
+						 * from device_unregister(),
+						 * will free it.
+						 */
 						goto ida_remove;
 					}
 				}
-- 
2.7.4

