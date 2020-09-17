Return-Path: <SRS0=LLeq=C2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C360C43464
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Sep 2020 21:46:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C03252075B
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Sep 2020 21:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncae4Mqr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgIQVqi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Sep 2020 17:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgIQVqi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Sep 2020 17:46:38 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9D4C06174A
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2020 14:46:38 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id h17so3416044otr.1
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2020 14:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=S6XgPSRdEpfDqU3ZLLcG50Q4G/mvaUdxs14YJg+5lkc=;
        b=ncae4MqroKPKNO8OKt+YgGSGmzEgdvuByJhzymGUDtcmWkxKSCsxSNuQ0T0ej7lPRw
         PM1P8CQAgCjAcrQfQeT/Vmx7UcSUGeu0ocg9qXpnCxWhM7mEUUnqj2T0P3vJfJ7ZJLGg
         eg/4Hj6v4f8MmnKl6rF1/UWU9hmRcD811T+qKCYVUVLSgtWBgS41kjl0NMb13BRO8gNW
         rjgsQe802bcXJIOX2esiB2RwL4s+FDhaOEHp5lwLZWneUbmrYS3FlQAsufRDbJd+hLtV
         CrU2Tixuq+NOzdaDxk8a0pwlshFC1xYmiOF3LsypgvB0lQuapl/AQHjB2ApLnbYSfVgU
         HA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=S6XgPSRdEpfDqU3ZLLcG50Q4G/mvaUdxs14YJg+5lkc=;
        b=sPQ0jJJHucLITdzvbRHMdwolbafqyb0KvVnIJzU3coaHIahCb09af6DDPRfeH9srHd
         UdKtPlGM9PK00yDC5cgUNsiNU+wH83eU6rugdwpkFW8OuEWQsRlHt/P3KSpa0y902D41
         CEjxR+Nt2Wa6GEwevUIkeeIsBWEkQJde6k3FfDrRzSXPQlEOUznJzISpzlzjwu0+MInu
         R/rmFNF09Z/oEGFe0Frx7ak6cJUvoSOnkRaZS4Kk23koBGrpWNvPCvrdViWpYoQiYFsD
         jwR2UD1Q/eaYI2kpKa/YntycpfR3NY/F9CVEWehat1f3e7Q2PSa4eQOOHdAeBnGrvdf1
         cl1w==
X-Gm-Message-State: AOAM532ASsmbOSZ9UPYU7RuGFvNPJt216/8vIDCyo4fKS8Nh49yl8lkb
        O/F3o6rBHs02t3/pHjRGwFtTHyY0sPw=
X-Google-Smtp-Source: ABdhPJz/PDgr48Tp+PXndQBkxAJizozC2zpBcNaEKugbP4cPHCIxJKLSquX7aVET2pvBRtVBYTrf4Q==
X-Received: by 2002:a9d:30d7:: with SMTP id r23mr21198298otg.186.1600379197333;
        Thu, 17 Sep 2020 14:46:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j20sm803090ots.5.2020.09.17.14.46.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 14:46:36 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Steve Foreman <foremans@google.com>
Subject: [PATCH] hwmon: (pmbus/max34440) Fix status register reads for MAX344{51,60,61}
Date:   Thu, 17 Sep 2020 14:46:34 -0700
Message-Id: <20200917214634.103912-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Starting with MAX34451, the chips of this series support STATUS_IOUT and
STATUS_TEMPERATURE commands, and no longer report over-current and
over-temperature status with STATUS_MFR_SPECIFIC.

Fixes: 7a001dbab4ade ("hwmon: (pmbus/max34440) Add support for MAX34451.")
Fixes: 50115ac9b6f35 ("hwmon: (pmbus/max34440) Add support for MAX34460 and MAX34461")
Reported-by: Steve Foreman <foremans@google.com>
Cc: Steve Foreman <foremans@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/max34440.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 18b4e071067f..de04dff28945 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -388,7 +388,6 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-		.read_byte_data = max34440_read_byte_data,
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
 	},
@@ -419,7 +418,6 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[15] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[16] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-		.read_byte_data = max34440_read_byte_data,
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
 	},
@@ -455,7 +453,6 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[21] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-		.read_byte_data = max34440_read_byte_data,
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
 	},
-- 
2.17.1

