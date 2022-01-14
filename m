Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AAFC433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243413AbiANQfV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:35:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243419AbiANQfU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:20 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B07C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:20 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id s21-20020a05683004d500b0058f585672efso10669081otd.3
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5wNjqSZf3eXRtRb/8MIbJ+WLfupL3TSPWOpZpEZmkco=;
        b=iMS2M6d2CLSl9+7BcAzFrnM66QZ99/MqiIVZPuFuO3u3c2fcHFWh9jza5NKuLxOiMn
         3e1k728Ab5x/j+Gui6KYCNbI7SY3Hv58Bshl4jghbabWMFDFFEafS5Ns7nIWcd+ooqi3
         6Ave33y21+1GMpfPggJ+XcdEHVxECSh+kdAynfh3zphDSMKuKzNrZutsnsx/FKPuZgA6
         78m+IhzErxvzhTqmwEKD7MKz4PAWniEIygZ6tJ2Cb+36lBepNSodb9omtDqgA7fPSZMp
         /36XUKVyWWVAj6xPTeb/S7JJ4NaQo/meaTJnt0AOmGH2c5bk26rIJuOlunjhxgS4Z5Sp
         3Uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=5wNjqSZf3eXRtRb/8MIbJ+WLfupL3TSPWOpZpEZmkco=;
        b=OFWfThbLh2YkiHqg7Q6waUVOId2ots1StGVyMebQfwe87o7TwuQHw+3MM69vk7IQ4e
         QzVR9nfX3mTXFV3Okz8ehAk8fM1+tKE/5747r+EQgZPzHSaA1tcLblKynypUQeP7urGQ
         vZ+227trF/CDQRABjQUYH/uxTrufRNLKN9nghovmX7YwkbVdzpLBDsjiu/KDmxI/f6Zt
         X9PhY0fE5UUu6S3dUWDojBaOcrlwjSKhAJipjiUWIETm48/Trg5XcCQ0oQ3AIk1ivGxy
         Ov5BKwUyS37KQnp7Vhk0iTysH2jQcIZjPWpzp1cDSIudEwpit9Kv+2S3w+h6M56DPqtZ
         wYBg==
X-Gm-Message-State: AOAM530XkOQk7ZJpesjMSg0zVNy2HwzxPkpzpliGjEXdC6RhnOWNwHXE
        szJm2dmT4gpnKMl3MQa3PKgGSTsWt9M=
X-Google-Smtp-Source: ABdhPJx0i8vurjL9BdYdDyK4AjFDp3FZXdMINpefIPvF69yjuj/Orp0baQ8POa2q5en98wmaQeqDAg==
X-Received: by 2002:a05:6830:244e:: with SMTP id x14mr2232151otr.225.1642178119699;
        Fri, 14 Jan 2022 08:35:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h9sm953884ooo.47.2022.01.14.08.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/8] hwmon: (lm83) Move lm83_id to avoid forward declaration
Date:   Fri, 14 Jan 2022 08:35:06 -0800
Message-Id: <20220114163512.1094472-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114163512.1094472-1-linux@roeck-us.net>
References: <20220114163512.1094472-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There is no need to keep lm83_id at the end of the driver. Move it
forward to where it is needed to avoid a forward declaration.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm83.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index 44d720af2473..2bb4bceef551 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -317,7 +317,12 @@ static int lm83_detect(struct i2c_client *new_client,
 	return 0;
 }
 
-static const struct i2c_device_id lm83_id[];
+static const struct i2c_device_id lm83_id[] = {
+	{ "lm83", lm83 },
+	{ "lm82", lm82 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, lm83_id);
 
 static int lm83_probe(struct i2c_client *new_client)
 {
@@ -352,13 +357,6 @@ static int lm83_probe(struct i2c_client *new_client)
  * Driver data (common to all clients)
  */
 
-static const struct i2c_device_id lm83_id[] = {
-	{ "lm83", lm83 },
-	{ "lm82", lm82 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, lm83_id);
-
 static struct i2c_driver lm83_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
-- 
2.33.0

