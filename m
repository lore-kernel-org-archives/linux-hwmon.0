Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAE5C43612
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE15220855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwecOEnt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbfAQVN7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:13:59 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37937 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728423AbfAQVN7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:13:59 -0500
Received: by mail-pg1-f194.google.com with SMTP id g189so4984287pgc.5
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NJpNqq64eEzbIb8eTYq6UYm5HaPjjboRj3G0Q9w0oDY=;
        b=FwecOEntYYy181ITr1BLg+Sdln1fv6y8VBMmOa5w3h4VfnnySWR2mL4IGU3kBCbG9E
         TO8Zm1hgky0aMPfE8pMUnaYRszNj0iTCnJreASw41L3TVtPKbDRMAPxl/5LYiRVUsFcY
         8ysbeqzdWuqG3zXYgTxMnLdsZuCqcLg8ZXYym293nPURM3NTSa+gaZlUSu/hS8t+cFBd
         ejEj3FpZv0MhHrmtheK5fn8+zyM6oiH6vdW+UuTJwBYyjOa7ySO5Uy9nP0DpT7psrjWk
         TQiZWq8NCXsSsI8Qw7yeo3MPDzpgeLtBmX3kYfMZme2+t4ONL0xOF05EyKs3JBcEOq5Y
         fZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=NJpNqq64eEzbIb8eTYq6UYm5HaPjjboRj3G0Q9w0oDY=;
        b=bm47TuQnhVAVqGjoiDXQ4jeMKHGVw2TiSCIyFKgurj+PMDxTehkOia1R2HKVd41Gd7
         C0SGlhrW4EyZIpCkdwhZ7Is4K91xh4+Ftzu08CKLteox64ibgnrETiyNVwiyBsM5M1cT
         YajalhRNkRMMKe+1TlFQqOY+ydu01Z2ysGs5JLQPHntnEwQixJTEZqZjEc8JVayvvfRr
         1lyHcn6CHF35nKEnY7TeKfIDxknQc8HX5DQqjSJviLVUqkXKDEuuiEYklZjuuGOpxoyP
         NeMYjCjhPYFdyTmSZcvA3wm/nRN65RmGOrTM3CNPuFpzavyxMODuM36npgqB0NuV3Kl0
         Sv3A==
X-Gm-Message-State: AJcUukeGlmZgA4ca8p+hIVm3QZLoYGaF0P260c2MpMTIuDjDSRIMQ5PY
        w9ZT97G13+wyvDDpdE5ev1QlHoip
X-Google-Smtp-Source: ALg8bN7UOJUUr20lAkd24NWwqqKyg+L6Yihjv/+dawM2XFbqQl9h274swzp8epBfo/Pdqtcb/TyLnA==
X-Received: by 2002:a62:18ce:: with SMTP id 197mr17077866pfy.88.1547759638189;
        Thu, 17 Jan 2019 13:13:58 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i2sm4063854pfi.66.2019.01.17.13.13.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:13:57 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/29] hwmon: (gpio-fan) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:23 -0800
Message-Id: <1547759629-23007-4-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
References: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Replace S_<PERMS> with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gpio-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index a3974cddef07..f1bf67aca9e8 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -307,7 +307,7 @@ static DEVICE_ATTR_RO(pwm1_mode);
 static DEVICE_ATTR_RO(fan1_min);
 static DEVICE_ATTR_RO(fan1_max);
 static DEVICE_ATTR_RO(fan1_input);
-static DEVICE_ATTR(fan1_target, S_IRUGO | S_IWUSR, fan1_input_show, set_rpm);
+static DEVICE_ATTR(fan1_target, 0644, fan1_input_show, set_rpm);
 
 static umode_t gpio_fan_is_visible(struct kobject *kobj,
 				   struct attribute *attr, int index)
-- 
2.7.4

