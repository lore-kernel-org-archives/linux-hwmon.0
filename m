Return-Path: <SRS0=jxcE=W6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2801CC3A5A2
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Sep 2019 14:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3D1920870
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Sep 2019 14:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5DAemor"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbfICODP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Sep 2019 10:03:15 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35261 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbfICODP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Sep 2019 10:03:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id 205so8393309pfw.2
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Sep 2019 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3dSfSHVGieE7IvASZ3V/n6QYdtNVeR4Co4wZeStVBu8=;
        b=Q5DAemor5r6nk9bbIFFZaVb+i+i+zy9FPHxQQcbz8FWkdHzVa+ON/ddIaEpoXYpPaa
         kl5HQa1wKNgJzKpe6Qw+JJZpRItPN3z+bivlNLL3XTWmKQ8/btVfo2e1fOZyVUBgyQMA
         3w2r1nn54E0ALlqjM6hhMwzqvYcxj5s+XTbdPQ7PNEIzT2+i7cnsLBjrVaPnEMHhlyCF
         h9vIyDyvpmeRhjJxr3sOgWalWLfohYTV/DxG+t247cwrMjz7RwLvEv2EZ/mwR2kDKWzd
         sP3sEqHEd8E2J0y6hWfMMKxNq9iPUK7aCptb70JCe2z7uzP2yljoAx10gTSLlWh4gLpy
         ciGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=3dSfSHVGieE7IvASZ3V/n6QYdtNVeR4Co4wZeStVBu8=;
        b=npEyziCB17DvygKFB6xWXcQMObb0+lbydDFX85QFx9WCqueDDbGwVZNkca1f+IgnVE
         KJD7f2vPQI8OIMOW1XWn8uPkzkoGMyz9e9q3Q3n0e3okBBA6nRGgJCg/cPuGdbFnyWid
         lBebZfFRW2RnRByWeMbWa3P61Wo4kLP3UoUxOVITbK6mFNz+UrxGapXB5yZPd+9C3rSO
         lQQ6TARjs3Vl5mgjIuOskzr+Tiay3J/icfB4xAqJqTr+N+0tXKjIxHjH0wcvfz4YXlyS
         GODMhDmvaZhK4RHoaXFcYd75GDK2qej08U79+CJ6yAV7GuxJg97jhdkdZcYbhkJCo659
         c6mw==
X-Gm-Message-State: APjAAAXxNu7QRivbRdksNUxs/SJsQ3GyDFqrFM5g5E5GErkErBZ+/aSG
        bqAAAF07wmrzTtdj64MGUo7KtpwP
X-Google-Smtp-Source: APXvYqxoC7tmV6O7tCU3GYqQH5Ek8YX3stcKcJfELCUqGgcQE3R32YjF82xJ6DNffTNOWRGSXuY0Lg==
X-Received: by 2002:a65:62d7:: with SMTP id m23mr30387539pgv.358.1567519394325;
        Tue, 03 Sep 2019 07:03:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q71sm5819742pjb.26.2019.09.03.07.03.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 07:03:13 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Iker Perez del Palomar <iker.perez@codethink.co.uk>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] hwmon: (lm75) Add support for writing conversion time for TMP112
Date:   Tue,  3 Sep 2019 07:03:08 -0700
Message-Id: <1567519389-16561-3-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567519389-16561-1-git-send-email-linux@roeck-us.net>
References: <1567519389-16561-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TMP112 uses an uncommon method to write the conversion time: its
configuration register is 16 bit wide, and the conversion time is
configured in its second byte.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm75.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 644da2620a26..ce0f6c671b8f 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -242,6 +242,8 @@ static const struct lm75_params device_params[] = {
 		.clr_mask = 1 << 7,	/* no one-shot mode*/
 		.default_resolution = 12,
 		.default_sample_time = MSEC_PER_SEC / 4,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
 	},
 	[tmp175] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
@@ -391,21 +393,36 @@ static int lm75_write_temp(struct device *dev, u32 attr, long temp)
 static int lm75_update_interval(struct device *dev, long val)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
+	unsigned int reg;
 	u8 index;
 	s32 err;
 
 	index = find_closest(val, data->params->sample_times,
 			     (int)data->params->num_sample_times);
 
-	err = lm75_write_config(data, lm75_sample_set_masks[index],
-				LM75_SAMPLE_CLEAR_MASK);
-	if (err)
-		return err;
-
-	data->sample_time = data->params->sample_times[index];
-	if (data->params->resolutions)
-		data->resolution = data->params->resolutions[index];
+	switch (data->kind) {
+	default:
+		err = lm75_write_config(data, lm75_sample_set_masks[index],
+					LM75_SAMPLE_CLEAR_MASK);
+		if (err)
+			return err;
 
+		data->sample_time = data->params->sample_times[index];
+		if (data->params->resolutions)
+			data->resolution = data->params->resolutions[index];
+		break;
+	case tmp112:
+		err = regmap_read(data->regmap, LM75_REG_CONF, &reg);
+		if (err < 0)
+			return err;
+		reg &= ~0x00c0;
+		reg |= (3 - index) << 6;
+		err = regmap_write(data->regmap, LM75_REG_CONF, reg);
+		if (err < 0)
+			return err;
+		data->sample_time = data->params->sample_times[index];
+		break;
+	}
 	return 0;
 }
 
@@ -489,7 +506,7 @@ static bool lm75_is_writeable_reg(struct device *dev, unsigned int reg)
 
 static bool lm75_is_volatile_reg(struct device *dev, unsigned int reg)
 {
-	return reg == LM75_REG_TEMP;
+	return reg == LM75_REG_TEMP || reg == LM75_REG_CONF;
 }
 
 static const struct regmap_config lm75_regmap_config = {
-- 
2.7.4

