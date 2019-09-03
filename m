Return-Path: <SRS0=jxcE=W6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28561C3A5A7
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Sep 2019 14:03:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 013482341F
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Sep 2019 14:03:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM0NVVId"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbfICODQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Sep 2019 10:03:16 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35690 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfICODQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Sep 2019 10:03:16 -0400
Received: by mail-pl1-f195.google.com with SMTP id gn20so7933579plb.2
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Sep 2019 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lpZLE/DpkVnus3lIpDgoILHMRUCogKYwMdezVU0Vw9M=;
        b=XM0NVVIdBcg9bLKk4i+L4+7RkwtB8JYSyqarBScyNVZsyOiiKpGOcAlraGuplhMX0j
         JoEz8bUpnt4Hhd1wGNYClUK7A/tGiK7W/GMtSMpPzGIPTMpSbGQb5D64ZtyhIhza46Bh
         98EpyTUxIVnObClM6ZRTqe+fRrkLmZ3Q2sLTYF91v9ExDgxbGXxIIQhiHyqapvl9OGcB
         u3dLmdghUeuGwUTscKvQXmoaxAhmMALchLt/53CBJM6mAXT830UAGNm1SeET4KQClUsd
         0DwvePR+7B6WnPnq83p6cRFFV5UjzZOxORqaYwLnFPtBYE0/cZL/44SEJR4kbbNJBY7y
         DT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=lpZLE/DpkVnus3lIpDgoILHMRUCogKYwMdezVU0Vw9M=;
        b=UaeoOKBF5Mz+YvwveKA90EImMiVjVzVfE+59Pf8jHpVhV+etN1ILSbA+qvIc9AyWLp
         lIx5cgNbuk2KVthcIJYFrKf0tPUi5al5SoOeB06rU7h2P8e9BGc2Ku7QsF3ml10ga8l7
         klua/IzV5I3Ivifb87AENHWYBUggjHIdngB8ORu03s0unSf8D8Hb6X2cNyFOGQ2JQTaI
         5GWopei6HO6/kGmF++bOWfdndoY62J/dsndFPaWJF04boUYyZNNQM/GbpJGG77ukJJZC
         qMZwrSmcbL/9rmpUhBl7rcDQXnBqV6tIDejdp4A9kxm5+g0umv5mB8XSj9z13GEB5tPj
         wHNA==
X-Gm-Message-State: APjAAAXhETSHQ0UPPn/ayyj+D9wnr157j68Jl1Kjvr18i676hS6ADnzn
        OLs9CKh8Rr8FH31vWug87jJS6CcZ
X-Google-Smtp-Source: APXvYqwTmKQr2KSG1E3zHK4BgfXgiZovTszQFSCbrQbTfGbYg92yV2cy7XL4WQcXxMIDNbZGT29F5A==
X-Received: by 2002:a17:902:7c91:: with SMTP id y17mr17124146pll.46.1567519395811;
        Tue, 03 Sep 2019 07:03:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j1sm16508730pgl.12.2019.09.03.07.03.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 07:03:15 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Iker Perez del Palomar <iker.perez@codethink.co.uk>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (lm75) Add support for writing sampling period on PCT2075
Date:   Tue,  3 Sep 2019 07:03:09 -0700
Message-Id: <1567519389-16561-4-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567519389-16561-1-git-send-email-linux@roeck-us.net>
References: <1567519389-16561-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

For PCT7027, the sampling period is configured using a dedicated
register.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm75.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index ce0f6c671b8f..d45e5cc4adf5 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -95,6 +95,7 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 #define LM75_REG_CONF		0x01
 #define LM75_REG_HYST		0x02
 #define LM75_REG_MAX		0x03
+#define PCT2075_REG_IDLE	0x04
 
 /* Each client has this additional data */
 struct lm75_data {
@@ -199,6 +200,11 @@ static const struct lm75_params device_params[] = {
 	[pct2075] = {
 		.default_resolution = 11,
 		.default_sample_time = MSEC_PER_SEC / 10,
+		.num_sample_times = 31,
+		.sample_times = (unsigned int []){ 100, 200, 300, 400, 500, 600,
+		700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700,
+		1800, 1900, 2000, 2100, 2200, 2300, 2400, 2500, 2600, 2700,
+		2800, 2900, 3000, 3100 },
 	},
 	[mcp980x] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
@@ -422,6 +428,13 @@ static int lm75_update_interval(struct device *dev, long val)
 			return err;
 		data->sample_time = data->params->sample_times[index];
 		break;
+	case pct2075:
+		err = i2c_smbus_write_byte_data(data->client, PCT2075_REG_IDLE,
+						index + 1);
+		if (err)
+			return err;
+		data->sample_time = data->params->sample_times[index];
+		break;
 	}
 	return 0;
 }
@@ -512,7 +525,7 @@ static bool lm75_is_volatile_reg(struct device *dev, unsigned int reg)
 static const struct regmap_config lm75_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
-	.max_register = LM75_REG_MAX,
+	.max_register = PCT2075_REG_IDLE,
 	.writeable_reg = lm75_is_writeable_reg,
 	.volatile_reg = lm75_is_volatile_reg,
 	.val_format_endian = REGMAP_ENDIAN_BIG,
-- 
2.7.4

