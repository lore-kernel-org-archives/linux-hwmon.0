Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66DBC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96661206B7
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4n8X6MD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728644AbfDDP7A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:00 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41639 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfDDP7A (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:00 -0400
Received: by mail-pl1-f195.google.com with SMTP id d1so1384956plj.8
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8qot0KTn7aGBBtPtuSnfXd7s3W27pZ6SjVKW+2vN2f8=;
        b=Z4n8X6MD8WXnf1BBjREk0VEKwcV6/MEabkhKJNtMWooVpBLpB1aqf61rerWg3Eldq3
         98+nlDBW4ifeWQrJ02b7ReFX1KMFpQLLkh6HrkbBwiKfV5YM6uPiByEWCEIDaxAa/LXP
         QurmwM8az8nUiaYQZlZ1e0PPk/YZam4B+nhl6Lva4jRcyFM/LqOWXa+kUtXJJfN4ka/I
         5M2tj5mbRvhbIS9WwYHwFaCzXgwc5cVncRoM3rMQYNuubk8ayF0h3LyhOkfl+5svxXOi
         R8a8rbEZhALBWwTKosPwzWTQcxw8s2Gr5LxhBuQxpGbxa1czPIPHZPhNrM9n6paNaTXN
         OXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=8qot0KTn7aGBBtPtuSnfXd7s3W27pZ6SjVKW+2vN2f8=;
        b=T4TT1M5m7zQfZL8RjAmBibWV640VBD11GWziiE6eEQNYg4Br7qogFdHbuxu6ucYLJ9
         2HtRg4vWdQ9UYAejWKMFzGD3Tkk0Rc1m4n3AKkjrV9nyGXHiBP7UxXaynFTTGNrdvmDO
         G3yPtFIT1J7CQ1P/fLPfM/ov64kNDzIILntDYMOES8hmHV9LsJRpQb2tlhyKXZsXLWEf
         E54EAd/2h5CtskndiKOMC7ZX3hSprNCTifMgk0aRjDecvVGwET1+zVa0kDAnmLROIKey
         wJKkmkmET/CNTcfbrK/z3pAN+nbzPj/4EfggKeAWrqsrk0sD2TWybTTOAIiCpIMo31Sr
         2hog==
X-Gm-Message-State: APjAAAV6QPhns0DFX1aMkJ6RwTCS1Xbr7KrxVc+u54rKJGdng2VCCu7A
        /vuzOxDIV+NzvSnP7eAxLh56kWOo
X-Google-Smtp-Source: APXvYqwBRETk6DG4Qu+XxQGm2ZMPYrY6bpCIHd5OqztX91IiXhqBufGVfzq4aam1FF+A/H8u0SWXJQ==
X-Received: by 2002:a17:902:8a81:: with SMTP id p1mr7339888plo.106.1554393539109;
        Thu, 04 Apr 2019 08:58:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k71sm32282302pfc.155.2019.04.04.08.58.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:58 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/24] hwmon: (lm75) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:26 -0700
Message-Id: <1554393516-30316-14-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
References: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If CONFIG_OF is not enabled, the following build warning is observed.

drivers/hwmon/lm75.c:446:34: warning:
	‘lm75_of_match’ defined but not used

Mark lm75_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 3155a04c997e..f307743edc25 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -419,7 +419,7 @@ static const struct i2c_device_id lm75_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm75_ids);
 
-static const struct of_device_id lm75_of_match[] = {
+static const struct of_device_id __maybe_unused lm75_of_match[] = {
 	{
 		.compatible = "adi,adt75",
 		.data = (void *)adt75
-- 
2.7.4

