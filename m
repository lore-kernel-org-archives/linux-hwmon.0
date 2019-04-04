Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C727DC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95FC72082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCge9FwJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbfDDP7L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:11 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44351 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfDDP7L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:11 -0400
Received: by mail-pl1-f194.google.com with SMTP id g12so1375063pll.11
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kWwJHIdMOeyQiDBQWC7rX3bFGyGz02dsNwpecqsmSwo=;
        b=YCge9FwJuLi7fhRZ1ceFki/4AP1p+w+xrP5fcxK65lNnIZcZ8DWkoYoBU9dEaWhsR8
         F7VL8wgSmRg4lCnEPagPY/+WvrndOGw4rL6OII6uRlzoOji4p8FUp0olmtMBXz8RVQTN
         vbmqzsFYAyGJ5Wojzy6x2Yy3JPsym9hFF8rr/AVqw9AndfX0jqH1aXMCXapdjMDI0sNc
         0JQ8VYVW4g4clNu8CR7SpSwMSBYWvlDzxdjW+b1+5VYbAOkKG83cW4qZ/8GCyc61q9WW
         ujCI26WyJPRraPsht8voa9zOfU7xa4evft7S9k4rT46Pk/EExVxgoTe1tsv3vs7zxDdK
         H7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=kWwJHIdMOeyQiDBQWC7rX3bFGyGz02dsNwpecqsmSwo=;
        b=I2MBUUAZLi/ACWwlcXym4LkikMjRlkJDk9kRV+Z1l81IupkkkRoCaIgz66weY2WPvR
         y523iJl4UNdIKrfZ8UPu6irsWZ1KzVYxZuy6fkdf2ASUIF3vfwBV2+drd+7a7Lrsj7BP
         x1meWHeOEkIJoq53f6s/5V5DccE8qT+Q7qTxiFFr2KklVczNTjERFt5s1c5X9o9ekBGJ
         Hy2a2ySGiBrHEHQoOStt+3HzZPbgnv8XrFUODtSyMOYSgouU/jQGiWAZqarFCwX1Y65p
         OOV+8cR6XVZLM/7d3EzKqiU9e3PRydq/AQYZH8X+2ZcOTBVO0gQiPIvu7Aid17LwXBco
         7RwA==
X-Gm-Message-State: APjAAAWixvBcUlp6Qtmw6eW5p2nTmmm5W/AGCN1mRQ+t7gAC4lhn2PN1
        jnAUFh54a0FNyspcgHwaEK3ZbDl2
X-Google-Smtp-Source: APXvYqw58y8hhTuVEB+X377eSVIYeI+cVtzQKg/m2lR98qBgFsCPlwdVcnF/Pfh9Fqdu+rpC8YsuEg==
X-Received: by 2002:a17:902:28ea:: with SMTP id f97mr7171465plb.203.1554393550359;
        Thu, 04 Apr 2019 08:59:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l184sm45065605pfc.98.2019.04.04.08.59.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:59:09 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 22/24] hwmon: lm95245: Fix build warnings
Date:   Thu,  4 Apr 2019 08:58:34 -0700
Message-Id: <1554393516-30316-22-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/lm95245.c:626:34: warning:
	‘lm95245_of_match’ defined but not used

Mark lm95245_of_match as __maybe_unused to fix the problem.

The following build warning is always seen.

drivers/hwmon/lm95245.c:95:17: warning:
	‘lm95245_reg_address’ defined but not used

The array is no longer used since commit c0a4b9ec1b43 ("hwmon: (lm95245)
Use new hwmon registration API"). Remove it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95245.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index c7e04f28ac90..8d08ca8bbdf8 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -92,19 +92,6 @@ static const unsigned short normal_i2c[] = {
 #define LM95235_REVISION	0xB1
 #define LM95245_REVISION	0xB3
 
-static const u8 lm95245_reg_address[] = {
-	LM95245_REG_R_LOCAL_TEMPH_S,
-	LM95245_REG_R_LOCAL_TEMPL_S,
-	LM95245_REG_R_REMOTE_TEMPH_S,
-	LM95245_REG_R_REMOTE_TEMPL_S,
-	LM95245_REG_R_REMOTE_TEMPH_U,
-	LM95245_REG_R_REMOTE_TEMPL_U,
-	LM95245_REG_RW_LOCAL_OS_TCRIT_LIMIT,
-	LM95245_REG_RW_REMOTE_TCRIT_LIMIT,
-	LM95245_REG_RW_COMMON_HYSTERESIS,
-	LM95245_REG_R_STATUS1,
-};
-
 /* Client data (each client gets its own) */
 struct lm95245_data {
 	struct regmap *regmap;
@@ -607,7 +594,7 @@ static const struct i2c_device_id lm95245_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm95245_id);
 
-static const struct of_device_id lm95245_of_match[] = {
+static const struct of_device_id __maybe_unused lm95245_of_match[] = {
 	{ .compatible = "national,lm95235" },
 	{ .compatible = "national,lm95245" },
 	{ },
-- 
2.7.4

