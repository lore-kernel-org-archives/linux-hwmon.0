Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCFCC10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 12:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA532204EC
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 12:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5MkJLsy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfDWMg7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 08:36:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41172 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfDWMg7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 08:36:59 -0400
Received: by mail-pf1-f193.google.com with SMTP id 188so7419667pfd.8
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 05:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=IzRIc2aeR7JM4gmtWa9KEM9z4HMbBZO+lexL9ZV0USY=;
        b=O5MkJLsyiUNlDh52iruOuXuWLcWanOcEUtDmN+WfTL5AEQDaXkL9WfpfcicTcqu/oM
         sHtiy7qkrjNz74qch8tLvBRhlgSJ4VYNcVc7IS/5APNpus91fpOBZJ8jegrhYJPACM4L
         bHZrAmZwyf1ZZJ7LyFxkpoR7nGJfQl5GV/6tF4MX1+IgBZetvGsgMypCss6iOG/gddYf
         ILHIDLg2ZxKYL5/guazKW6RkVmmgtJYPs/cH+npQJykC1tqCTCfjioYTSdIhZjK1hD7o
         BqvQBGjEdyAjDHRbk+T0UwHO7UxU8u/U5x9xUe9/tifQcgH04yKr+ynXUCm10kCFm0R1
         Z4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=IzRIc2aeR7JM4gmtWa9KEM9z4HMbBZO+lexL9ZV0USY=;
        b=rik37hDRtr2eVnG7AE6BIi4WY4dmPaLZ9cTAI6EmnxG4aAYWQLOpiQ0Sx2ggeFeZ1t
         pRA7wKC1K5KLIA/C1tHz5g8/mQXwOHcozWOUh9fp2/97exf6xFtHR+ctCuvGEAl06kqe
         07n2ddv9Wv7hoOhwReo3LKPaW8y1qb3ZMz1aB4xh8PjRL7sJO9QPDS5YpMuNj2xwYO1U
         ANU/YScN7qRJ7qwMDzj7U398sq2XF/OuAIQsX/Ax/ng6WB5Z9XNbLklmyfwRBTLlblE/
         61yUOvK9zJIBI16BtS+N6YSo5i7D6F8bgfhCEqKEEJKb+s+a6rV+gCxH6LFhspqBBiC/
         XUbw==
X-Gm-Message-State: APjAAAWRxLMvHK+mG3g7CVPd56Y9gsGLkYhW0i4dgHsSWFpt3tEi10yE
        Crli0DDFIfK2rdbs9OJJ7q4CnyXi
X-Google-Smtp-Source: APXvYqw0i4X4YykTd4zz97WMdFweEjrR0O4qVkPk9NAN/vmyRoj5oTTq8mGTW8qivRQC+t01RNl1sg==
X-Received: by 2002:a65:420b:: with SMTP id c11mr7506850pgq.24.1556023018440;
        Tue, 23 Apr 2019 05:36:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j22sm22049190pfn.129.2019.04.23.05.36.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 05:36:57 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH] hwmon: (max6650) Drop call to thermal_cdev_update
Date:   Tue, 23 Apr 2019 05:36:54 -0700
Message-Id: <1556023014-6159-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The call to thermal_cdev_update() causes any fan connected to the chip
to stop immediately. If the thermal subsystem is not set up to actually
handle the chip as cooling device, the remains stopped until is is
restarted manually with a write to a sysfs attribute.

There is evidence that thermal_cdev_update() should only be called from
thermal governors, not from thermal cooling device drivers. Drop the call.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index e977c2f2d74a..939953240827 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -801,8 +801,6 @@ static int max6650_probe(struct i2c_client *client,
 		dev_warn(&client->dev,
 			 "thermal cooling device register failed: %ld\n",
 			 PTR_ERR(data->cooling_dev));
-	else
-		thermal_cdev_update(data->cooling_dev);
 #endif
 	return 0;
 }
-- 
2.7.4

