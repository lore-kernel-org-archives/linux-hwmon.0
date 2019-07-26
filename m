Return-Path: <SRS0=2746=VX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDBFC7618B
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jul 2019 15:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3FB9C216C8
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jul 2019 15:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs13LPS6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbfGZPHL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 Jul 2019 11:07:11 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38685 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727239AbfGZPHL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Jul 2019 11:07:11 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so24664069pfn.5
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2019 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=1MjddDtXofrL9Wm9baf58zxEAiMFTD49IGjNv9i7ozw=;
        b=bs13LPS6H8kWkn77vk49s417If9YVXEDi1DH8E4GD4vSk65C0LRnJXIt8dLZ394nOn
         PNZpS0xLZPBcHJng8/gWMUlZNI1hqAZCuM+92Dc1OpYCQ4ytFuuzkqManfmkkqtx9GOT
         6W9uAHcNa7kXZ5OyQdEPZGIByy+lxCC2qQz8GPBJvCOtHNKmP/veCYjYTguTgOqA2d/Y
         28GxqRXCzPjKaGpfD4hGRvMfDSkF2pHGRHgalYoEIbQ4v7YkNzxjzZVlToidk7COA1JF
         +27MkP8QAqDd4aCBrwnDv546t9iZQvvUinSvdgVog5jYuil7fVMOAHmHIxxVHcSHEpWq
         8k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=1MjddDtXofrL9Wm9baf58zxEAiMFTD49IGjNv9i7ozw=;
        b=pQv8THvMkLh05L+vm2KSOGMxn6wXIraq+yyqXTTuU0IT4lssrv9hnLyyH0im01RjeQ
         kmJlgTs7cnG6FlUqt4yahrYmYV/neF4HKnp/+1RolblZKZs8EvvPJ901wIFIrhOJVPVe
         fyD0O4hXgsNmDbVWieuh4zAu1lkn61kj4Vaz4BoWyn+z3lTD8IcoTu/UD+8Ng3uj1cAR
         WBB2K1rcjXkg606n37eRC0aL+x0H71oHA1/muNiL1Qi8kSVePQkBLZGEtOcc8OMqilLm
         uhbms2g6NA4uV0P1ef1Vf8Ua3tHMsxe0857FC5HZ37Rs/YFp2O7HMIcbjMO7raGqu4TF
         y6AA==
X-Gm-Message-State: APjAAAX26sX0P25iBKSYgwGg1zjsDiZ6ToW7VjuK3dbF2yUUwyN98JNA
        OUcTKpbDkUb00cQJApr1/DGeUOev
X-Google-Smtp-Source: APXvYqygy3Syk6Okn/9aR8lRWH0JOyPgzaUkL7AVXp/zomAIoJLg25bUQcDdCksd2UWKtc3y9YJlIA==
X-Received: by 2002:a63:ee04:: with SMTP id e4mr66926031pgi.53.1564153630581;
        Fri, 26 Jul 2019 08:07:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e188sm8425832pfa.76.2019.07.26.08.07.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 08:07:09 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Gilles Buloz <Gilles.Buloz@kontron.com>
Subject: [PATCH] hwmon: (nct7802) Fix wrong detection if in4 presence
Date:   Fri, 26 Jul 2019 08:07:07 -0700
Message-Id: <1564153627-13999-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The code to detect if in4 is present is wrong; if in4 is not present,
the in4_input sysfs attribute is still present.

In detail:

- Ihen RTD3_MD=11 (VSEN3 present), everything is as expected (no bug).
- If we have RTD3_MD!=11 (no VSEN3), we unexpectedly have a in4_input
  file under /sys and the "sensors" command displays in4_input.
  But as expected, we have no in4_min, in4_max, in4_alarm, in4_beep.

Fix is_visible function to detect and report in4_input visibility
as expected.

Reported-by: Gilles Buloz <Gilles.Buloz@kontron.com>
Cc: Gilles Buloz <Gilles.Buloz@kontron.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct7802.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index ec7bcf8d7cd6..f3dd2a17bd42 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -704,7 +704,7 @@ static struct attribute *nct7802_in_attrs[] = {
 	&sensor_dev_attr_in3_alarm.dev_attr.attr,
 	&sensor_dev_attr_in3_beep.dev_attr.attr,
 
-	&sensor_dev_attr_in4_input.dev_attr.attr,	/* 17 */
+	&sensor_dev_attr_in4_input.dev_attr.attr,	/* 16 */
 	&sensor_dev_attr_in4_min.dev_attr.attr,
 	&sensor_dev_attr_in4_max.dev_attr.attr,
 	&sensor_dev_attr_in4_alarm.dev_attr.attr,
@@ -730,9 +730,9 @@ static umode_t nct7802_in_is_visible(struct kobject *kobj,
 
 	if (index >= 6 && index < 11 && (reg & 0x03) != 0x03)	/* VSEN1 */
 		return 0;
-	if (index >= 11 && index < 17 && (reg & 0x0c) != 0x0c)	/* VSEN2 */
+	if (index >= 11 && index < 16 && (reg & 0x0c) != 0x0c)	/* VSEN2 */
 		return 0;
-	if (index >= 17 && (reg & 0x30) != 0x30)		/* VSEN3 */
+	if (index >= 16 && (reg & 0x30) != 0x30)		/* VSEN3 */
 		return 0;
 
 	return attr->mode;
-- 
2.7.4

