Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE37C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1ED3820850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uS5Ox2hM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbfARRPO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:14 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46442 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:14 -0500
Received: by mail-pf1-f195.google.com with SMTP id c73so6879555pfe.13
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EJ6iNB9PrS8EYfbB4ZiedKwdM+37N3k0TaBpzwG4OCo=;
        b=uS5Ox2hMXbAyeiA/0tNtnFEgBu5984hFciluuNNPqwlYe4Y/BkQMWyETdJJvENhdvZ
         9hebN1w6MVwV8jo9/inqlMuDsT08PhlcSAMxTC/YxpHakAVNUNaE57LXjQ0Qr0BfnrwW
         Ex59HCpIVlWWQvKVjYVWrWhKIFDgcKSKHpgBJQ+XAiWcVKak1zJKiuybAlRrUtt8/WD9
         rN86xBNxIq5bkVooUpQspzSwH2U/k78s/XAcoOQSffs0ZdNp9O1PQn0fVXUStB6wjviT
         0N/YO1jCzgmseL8Q/gGU9N8P0RsxH8v6V6Nu5tQsfX9LNlqRnsA7nNoFd9YaeSJNZ27K
         dPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=EJ6iNB9PrS8EYfbB4ZiedKwdM+37N3k0TaBpzwG4OCo=;
        b=esO1oqlMyJh6uRhgfb5a2qR9kQZ46i5UOQ+hcFazA+9+qfbigd2uiMdDYu/S+5fGkU
         DdK4K88uHPQ/5Sr95eCQgD8+eNDTeD0WOnHfQAsKInWc5gvg0lxvfBOBg6tUSDa+qWDj
         T2ZiBAfxrPfcmcr3qR3V1B3JbyemDnzkrNnq9j3iCXFOAKvdoEYUm65NFiQ1cybgC/FA
         2a/pBbhgq7Tl72qW8vG9YIrnccVCZw2IoZCTpmH1iSJ1mI4ujJOgBoBSrSjTEBvnxTk8
         BeOh27Q8N4ulgzo2bnYVWo6oX1bXQRoA1PMCOL3fDD6vhI2CmopO0tvBUSSJFeyRqoWC
         E+Qg==
X-Gm-Message-State: AJcUukePVpm6sYhVGgo2ZVMkYK/jUgFxZfv7/UY6mbvjZPLDNob3r41f
        hXMsauk+52cdmjorB/PJEV8ELyMX
X-Google-Smtp-Source: ALg8bN54TY+fwFaCKeMLQlqhLyhws4LISoCj+8KF4LOJMmEsVUXSVX4PHRA8VueHga5L2bZnMzQXuw==
X-Received: by 2002:a63:2b82:: with SMTP id r124mr3546641pgr.300.1547831713661;
        Fri, 18 Jan 2019 09:15:13 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o84sm11878629pfi.172.2019.01.18.09.15.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:13 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/30] hwmon: (max31790) Replace S_<PERMS> with octal values
Date:   Fri, 18 Jan 2019 09:14:35 -0800
Message-Id: <1547831700-15865-6-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/max31790.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 281491cca510..722bcbb9865a 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -252,12 +252,12 @@ static umode_t max31790_fan_is_visible(const void *_data, u32 attr, int channel)
 	case hwmon_fan_fault:
 		if (channel < NR_CHANNEL ||
 		    (fan_config & MAX31790_FAN_CFG_TACH_INPUT))
-			return S_IRUGO;
+			return 0444;
 		return 0;
 	case hwmon_fan_target:
 		if (channel < NR_CHANNEL &&
 		    !(fan_config & MAX31790_FAN_CFG_TACH_INPUT))
-			return S_IRUGO | S_IWUSR;
+			return 0644;
 		return 0;
 	default:
 		return 0;
@@ -353,7 +353,7 @@ static umode_t max31790_pwm_is_visible(const void *_data, u32 attr, int channel)
 	case hwmon_pwm_input:
 	case hwmon_pwm_enable:
 		if (!(fan_config & MAX31790_FAN_CFG_TACH_INPUT))
-			return S_IRUGO | S_IWUSR;
+			return 0644;
 		return 0;
 	default:
 		return 0;
-- 
2.7.4

