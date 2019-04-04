Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F5EC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D38592082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNr287aK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbfDDP7M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37778 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfDDP7M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:12 -0400
Received: by mail-pl1-f193.google.com with SMTP id w23so1388320ply.4
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tbTMx7VBLhh9meUMWBsIeBVJ+9jY88C+zhSO/oLMBV4=;
        b=mNr287aKjtyl14T1aVer3SHWSykNhfpcOqC5BpPbtjRZU22BVbdFd2A92Lx11VPO13
         4PPx2JZWBlHV8NScR4KNMW2cOVrdKsp+EsKphO8EQaSXCVo1tGZe8EaIxjKK6yTtZij0
         fPRwZ7U+0w9KzOqiT70ZTH81HyII+Nt3EaxHm5Stjx06be1RDE3aBF0RJEWfOIF95b+Z
         38ZGWlBvPocmJOTH9WFdZgAx6xqp4ls9DL7vSPWLQKNBdu/LW3Xw+8oQQWQGjaY/19Nl
         P5Jjy6/f7T5ckrKRpFw1LVHqm3NHhqWYH48fM1VmyotgQ0KNJmxN85siJB8PJKIJ/7oN
         +geQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=tbTMx7VBLhh9meUMWBsIeBVJ+9jY88C+zhSO/oLMBV4=;
        b=UBmqqAhrgSkImvG0S0NJh6B8yx17rTUM9ocoN1m7b6Xk0etdCQOcPcB2PHLMGsWKTd
         eACIgcqahhwJrgIuC0ie6gCnYgkcBDT7CqNe2bRKSsuj4kPdtHrDz3IvuO5X/ZvfGxZk
         aURCldRDzzAaDEO4y74UKqBELsx4J27TAfvOU01RWp/4mDqtq4iFLMpWHDVFVPYOW7SO
         HvFqgzCFAjA72MbnwijRhlGs1od79Qj/aLV1ctm4/LnfNuYg552XTKqE1Z+wqOkwph/a
         es8gv60DvVbB3kYaVyHnzfSXQhtfnJxQnpnR8Ec5WkIgE0Q/5frb0cn6huPHM78YlL/z
         OlCQ==
X-Gm-Message-State: APjAAAWFsx38VHi+O5WQE5TCl8UW5fTk2brG/M9KAGKBQXFxAUGHrbu8
        jPHsMC5r/u6UENHLYQIfJsqDHq0b
X-Google-Smtp-Source: APXvYqz/YIbIuXHznEZqhPOBzqR/rMYoNa76Dcsa0ROTgUWGRXQNw1PXMQwcBRb3jhkleufAKc07Lg==
X-Received: by 2002:a17:902:2d01:: with SMTP id o1mr7266010plb.155.1554393551729;
        Thu, 04 Apr 2019 08:59:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r87sm26275320pfa.71.2019.04.04.08.59.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:59:11 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 23/24] hwmon: (lm63) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:35 -0700
Message-Id: <1554393516-30316-23-git-send-email-linux@roeck-us.net>
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

The following build warning is seen if CONFIG_OF is disabled.

drivers/hwmon/lm63.c:1156:34: warning:
	‘lm63_of_match’ defined but not used

Mark lm63_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm63.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index eac54b9cdeec..8848fbe5fd16 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -1153,7 +1153,7 @@ static const struct i2c_device_id lm63_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm63_id);
 
-static const struct of_device_id lm63_of_match[] = {
+static const struct of_device_id __maybe_unused lm63_of_match[] = {
 	{
 		.compatible = "national,lm63",
 		.data = (void *)lm63
-- 
2.7.4

