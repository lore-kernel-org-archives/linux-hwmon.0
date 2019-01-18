Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C56C5ACD5
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EAAF20896
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UorxxNUg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbfARRPN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:13 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45395 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728550AbfARRPN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:13 -0500
Received: by mail-pl1-f195.google.com with SMTP id a14so6604029plm.12
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3ZpNWGY55ePY5irXTo7vSq4ajFTFkQSbwh9rYDWb/jI=;
        b=UorxxNUghWImdeUfu6Jd++BSLKsykVfYaByqnZNKLOkFxJqty8Qc7zDB/Nis2Hfy+O
         WeWGFc98HzQSBlmDvvm45JjAlr3soYhRsrXyzv3Azyjjapa118CqdicgFlvhgNq0OdfA
         oDfw6rq+YqLoCMd36cILgJQxnYJD2TpdVFyog2y2Syi1pTe0FO1mlmRipNdgVUh7Zp14
         QIdZvSf3VMLaALvlb+qnmAuVMmbTMOBGSl2t+mudgFZEcNlfCSJDZvYyIhxX9n1mJNvP
         xdKzDWqpJ+SOzR6qW+DRgASJXoTGzFAt4ynbwb2DRNGwugHzr+xfq2473r8JmkozawHe
         8m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=3ZpNWGY55ePY5irXTo7vSq4ajFTFkQSbwh9rYDWb/jI=;
        b=t7/7N5HgfBWAEZoxYeVuIRiO2PWo/0PfYDbcWTNb8p5z9TNkGuWa8B/o1vVPNpYv9P
         7L/yrtXHIBk0a6z38HXfce8RVbEh75lby4KpHLh2bCVjlNeps/CDRFGLfxfDV8eCXz4x
         B3/zUIP4WkNvE+svHI0LvUIl7Jk9UE1faon4z2zEXeKDwyWiV6guz56l+X5IUcncyhxi
         KRXxL51uOLkmf5r9gTLdN1PbHA1KWwe+KPSoYgl0HXG3n5J8aBFTqx6h7nBdcEZ8Lgi5
         ONsg5XONP4Qgh8UqVp8/rfmCfRwzm5E7ZhTxBVfB+JLBiWNNGIjiaZHrRr1Rqk2J/DU1
         LECg==
X-Gm-Message-State: AJcUukd5y2WHzf7IaoH9CIXVFI6rISpP1Resb3eF/3jIGyYcxjGWKRd4
        CzXkGCRsaYJkB/tnm7MEqnjW+RJS
X-Google-Smtp-Source: ALg8bN6SbKJqviqmt8+vhPXspctUibNWvEk/V3v6gGlx//90mpkn4cBTcKLmcRhPdzV4geCpVr3rGQ==
X-Received: by 2002:a17:902:b68d:: with SMTP id c13mr20053796pls.102.1547831712102;
        Fri, 18 Jan 2019 09:15:12 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b7sm7184089pga.39.2019.01.18.09.15.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:11 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/30] hwmon: (max31722) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:34 -0800
Message-Id: <1547831700-15865-5-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max31722.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/max31722.c b/drivers/hwmon/max31722.c
index 30a100e70a0d..6d169b4271f7 100644
--- a/drivers/hwmon/max31722.c
+++ b/drivers/hwmon/max31722.c
@@ -50,9 +50,8 @@ static int max31722_set_mode(struct max31722_data *data, u8 mode)
 	return 0;
 }
 
-static ssize_t max31722_show_temp(struct device *dev,
-				  struct device_attribute *attr,
-				  char *buf)
+static ssize_t max31722_temp_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
 	ssize_t ret;
 	struct max31722_data *data = dev_get_drvdata(dev);
@@ -64,8 +63,7 @@ static ssize_t max31722_show_temp(struct device *dev,
 	return sprintf(buf, "%d\n", (s16)le16_to_cpu(ret) * 125 / 32);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
-			  max31722_show_temp, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, max31722_temp, 0);
 
 static struct attribute *max31722_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

