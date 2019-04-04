Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8539C10F15
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5C2F20855
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvqkjK0e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfDDP6o (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:44 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40039 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbfDDP6n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:43 -0400
Received: by mail-pl1-f196.google.com with SMTP id b3so1377218plr.7
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1B/T2cBzTJb+nb1rBcu1YhUZl22GDO+mFYvk7SjWatE=;
        b=HvqkjK0eJpQAehFjuvQ5MkI1c1ugfTlerqrYt89UcRYVoNdvtdAMNn6qIryfMCCOYl
         IjDONcvzvCCvcpCmUjjSCp7/2ykr4raaMzzD2yI4xSFN/tc9DKt7DCO5d6pIQq0sM3UT
         b4y9cz9n3xOswDe63YLzxItR51gBmSVMo13NhddJc6s5PhE2vPJhnDr4gI9/j7W+BGMl
         ExaPozTZNKcQMeAj3iY1bs/yKjKkm879OrdERlRXpfC2JSmSQR+j40rqlv29rH1+NJ2o
         eFvlzGz3Bif5Rz3ZFG5AZrLq26Z0GFYEpucCoTk6xSqMAu9bfbQ++23uv1kDFsEHvMAV
         +oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1B/T2cBzTJb+nb1rBcu1YhUZl22GDO+mFYvk7SjWatE=;
        b=d5ULmP5L+HlYG9c7ELGcBX3INQ1zUDtFABQdbj59PDNhQas0L3EAPg5HqJPztnjan1
         ZxJlqitzY2WkvcclbfQapMgjrbSKwZT0xZCYv9O5ymilEsZOMrLRTDKDC0wG3NFl8GOY
         yaeV+PBSBJ1GDC0x1ZWyYiYeKa0SDB4o3oMKIkBHr4yjaFXw5JHluR5BPJwHTBo9SL+S
         iT8V4s3oyulCg2p0fb0i6EPRitWwPrsr8I9kvmsQyDNIIp4O4ffYtpcCOBwXOpwXo6nc
         4BbPAhE6DJgnvht3cpcVhYr2ZtfL8XvnqsCuNOriPKFNL3z9Sdl5nRUHEzmVpBdpUSoE
         GSag==
X-Gm-Message-State: APjAAAWqvmNh11EciHOJMf6mBes+nxXWG5br0zr9WTKL7IUBuDYGI1jh
        B9oJClpD/DZQY6PujSuHMjvxId2u
X-Google-Smtp-Source: APXvYqwJ4WJTUnY7gY/ZHLfqVAVWT8SUWM9Gq5BUMtGbJ4q3/vte4XNNyTIFaGNHqFyZqJPL/Vc42w==
X-Received: by 2002:a17:902:5ac4:: with SMTP id g4mr6854857plm.261.1554393522766;
        Thu, 04 Apr 2019 08:58:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v15sm27460601pff.105.2019.04.04.08.58.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:42 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/24] hwmon: (pmbus/ucd900) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:14 -0700
Message-Id: <1554393516-30316-2-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/pmbus/ucd9000.c:154:34: warning:
	‘ucd9000_of_match’ defined but not used

Mark ucd9000_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ucd9000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index ae93885fccd8..40a3e3d0e661 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -151,7 +151,7 @@ static const struct i2c_device_id ucd9000_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
 
-static const struct of_device_id ucd9000_of_match[] = {
+static const struct of_device_id __maybe_unused ucd9000_of_match[] = {
 	{
 		.compatible = "ti,ucd9000",
 		.data = (void *)ucd9000
-- 
2.7.4

