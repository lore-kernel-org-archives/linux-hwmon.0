Return-Path: <SRS0=13Sa=SA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B06C43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 20:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC24F2184C
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 20:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pb4HL1dA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbfC2UdU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Mar 2019 16:33:20 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46502 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730086AbfC2UdU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Mar 2019 16:33:20 -0400
Received: by mail-pf1-f194.google.com with SMTP id 9so1559764pfj.13
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Mar 2019 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=XAh0A7IFnR9p9oQLS03/a+vaONoznnUm300/qmQJHLw=;
        b=pb4HL1dAvuyFDbgQLKDy/iF6Yhc5UUGscxdthknOyBQlqYCO+FNE1P4SxPcjN3uw1t
         9c9d+Kg1IkOWDj6aJiorGAUftMFUebv2O3w76JO25FQ2NqpmG9f76VCNR63c6iQ+NT+g
         bbkSDJr6dN8oPOqHsyMRQRPCeRGuDeWfIVJ+jn5cpePSKuLQOMDkK18b5WlPLJ4TQzID
         0pxKcFoDLxtuTu712wUinlwVakjeFLysa094mSXt/0IwL+ZCZNaC9U8CRJrckBrSBYOK
         wAevDuuoJq1OT4fkdzLnSKv2kRXodmfX6ajElw8/TYZVmxmWx0I8vUlmPRsKma9ck8i6
         bM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=XAh0A7IFnR9p9oQLS03/a+vaONoznnUm300/qmQJHLw=;
        b=uMT9HTFQH7A8sZP5yKF08ayYWb7hyeWN2rPlTIuk7zBR03VDxvRcFcldRKDqn//p4Y
         t0AnWbKKMamQODgHYI0MKhfeznUdS0zmDefAIjDt2aQQQxnstI5Ft6/3Me9gawebcqvc
         4Jv14DDK71QpnHN7F5lYeThqR0IvEV6RCPWsr/RnxqQhD5jrQLq345u9HyoZHYIxwf/m
         7WIVpuBfIGGSNUXamgLcN6fSMCwt2Gs60SxQ3TCcQ8NYBQWOS5B7jpIkz5yYemUrceL3
         aq95Zoe+bbVSbyPOA1O2ZB3Fty7kGGjTZnpxViU+X7yZPC+ATkNwlJUYXXSk3KjYlVBR
         A4jA==
X-Gm-Message-State: APjAAAXTGTqCokr0nhWSbOxKUQ/UNm0qfYqz8r+vBiMSjtCoAUQtLq95
        LnscIvb85zr/xD/eIR6kthi4aoMa
X-Google-Smtp-Source: APXvYqx1xElw9nrKCalwdstcmfR51K1vDqmMmfpRtGssK38FW/W0OTweSn3iBjpVf0L0TIz/mWJ3VA==
X-Received: by 2002:a63:5a20:: with SMTP id o32mr45705097pgb.225.1553891599116;
        Fri, 29 Mar 2019 13:33:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a12sm3720707pgq.21.2019.03.29.13.33.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Mar 2019 13:33:18 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nct7904) Use new HWMON_CHANNEL_INFO() macro
Date:   Fri, 29 Mar 2019 13:33:15 -0700
Message-Id: <1553891595-25846-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The new macro simplifies the code, reduces the likelihood of errors,
and makes the code easier to read.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct7904.c | 128 +++++++++++++++++-------------------------------
 1 file changed, 46 insertions(+), 82 deletions(-)

diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index 82c7de7b4639..04516789b070 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -400,89 +400,53 @@ static int nct7904_detect(struct i2c_client *client,
 	return 0;
 }
 
-static const u32 nct7904_in_config[] = {
-	HWMON_I_INPUT,                  /* dummy, skipped in is_visible */
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info nct7904_in = {
-	.type = hwmon_in,
-	.config = nct7904_in_config,
-};
-
-static const u32 nct7904_fan_config[] = {
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info nct7904_fan = {
-	.type = hwmon_fan,
-	.config = nct7904_fan_config,
-};
-
-static const u32 nct7904_pwm_config[] = {
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	0
-};
-
-static const struct hwmon_channel_info nct7904_pwm = {
-	.type = hwmon_pwm,
-	.config = nct7904_pwm_config,
-};
-
-static const u32 nct7904_temp_config[] = {
-	HWMON_T_INPUT,
-	HWMON_T_INPUT,
-	HWMON_T_INPUT,
-	HWMON_T_INPUT,
-	HWMON_T_INPUT,
-	HWMON_T_INPUT,
-	HWMON_T_INPUT,
-	HWMON_T_INPUT,
-	HWMON_T_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info nct7904_temp = {
-	.type = hwmon_temp,
-	.config = nct7904_temp_config,
-};
-
 static const struct hwmon_channel_info *nct7904_info[] = {
-	&nct7904_in,
-	&nct7904_fan,
-	&nct7904_pwm,
-	&nct7904_temp,
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT, /* dummy, skipped in is_visible */
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT),
 	NULL
 };
 
-- 
2.7.4

