Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF21C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Dec 2021 20:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350253AbhLWUw1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Dec 2021 15:52:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245049AbhLWUw1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Dec 2021 15:52:27 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF49C061401
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:27 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id t9-20020a4a8589000000b002c5c4d19723so2165742ooh.11
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2rsWcN4vErraf19v5G+8VUNSDWREgc7LTdcuVxq3sg=;
        b=WqZ1JrjJK2Uyg8yxYbmpRrLBqlFjPN8TIFxJr9EN4LJAKAuH+yKDV/aDO2+7Oc1H7z
         ZccfcyxbCU/zxe8h47L4K+q6xQSlARU2jNorOA46RP0Smz92lSotPQwIcXU0CZNU12Ho
         QoIZhKnIzpL/NyUGHNDUmXLQ23FhkWIXFYW0ntcNgNxeUMwWC8WnKllK0aXL7QMNhSGs
         iKDHcNyl7EVa9KrLXQing+XqqXZdmk6d3W+IdFEcRAVPivdLgMVtpzk5ogwl/rWwUbT5
         FCl6u24xJktr/pKvXMJiTBFKb1h1eA1mhRE2lZ8by7RieEeRCSnNZncB6fMXKacR4F+1
         4wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=y2rsWcN4vErraf19v5G+8VUNSDWREgc7LTdcuVxq3sg=;
        b=l3yVII+P+FFIikD0VTrEEcB90OjC8Pi7iO4OEPwU0+iR9PKFszuXiViheKRH7aiZ1q
         Krbuikb5r9bdf4DBQUw/AlhHy3RKWcCFo/kWHf1xXwo/C2owfLc2qeCrG7spbU5WE4Xa
         2gpIvyU3jqGM87vsZrMO32UZVuTn1dLKLVZi1gMMehGM+4y9Z6Uaa80D0Vyw6iSTCxaE
         na2/01VsFllZvrZU4G2WWAOsulQky1BsMx2sb6OkmwRn0f9s24toYY+0Rf/+sPAljyos
         iaQGhrAWKO52BfE8qg4uAj+AVPzM7tIg3BNI9bxdqwfNiqKJlRGSrjiOQE0rYKDnDWF6
         VyTg==
X-Gm-Message-State: AOAM532wgZclfvMB93qFxo2/+R2jRyvA1pRC/Z5TP9gyKqMwcQGPHDSG
        OsGG8RJ+KGe2yd/ijLl/xMlg2fJI3k8=
X-Google-Smtp-Source: ABdhPJy53IvNYiGCfByVWmFRZiYOOxFI3ywKupCMbUHApgxF+6M7XD6HXnmhf0E1zMtuvLdTPmX50A==
X-Received: by 2002:a4a:a402:: with SMTP id v2mr2408879ool.74.1640292746253;
        Thu, 23 Dec 2021 12:52:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h3sm1042541oon.34.2021.12.23.12.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 12:52:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Cosmin Tanislav <demonsingur@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Cosmin Tanislav <cosmin.tanislav@analog.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 2/6] hwmon: (adt7x10) Add device managed action for restoring config
Date:   Thu, 23 Dec 2021 12:52:15 -0800
Message-Id: <20211223205219.2184104-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211223205219.2184104-1-linux@roeck-us.net>
References: <20211223205219.2184104-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Cosmin Tanislav <cosmin.tanislav@analog.com>

To simplify the core driver remove function.

Signed-off-by: Cosmin Tanislav <cosmin.tanislav@analog.com>
Link: https://lore.kernel.org/r/20211221215841.2641417-3-demonsingur@gmail.com
[groeck: Adjust to use regmap; only register restore function if needed]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7x10.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index 05dd48b707b4..47ce1a88a03f 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -296,6 +296,13 @@ static const struct attribute_group adt7x10_group = {
 	.attrs = adt7x10_attributes,
 };
 
+static void adt7x10_restore_config(void *private)
+{
+	struct adt7x10_data *data = private;
+
+	regmap_write(data->regmap, ADT7X10_CONFIG, data->oldconfig);
+}
+
 int adt7x10_probe(struct device *dev, const char *name, int irq,
 		  struct regmap *regmap)
 {
@@ -333,13 +340,16 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 		ret = regmap_write(regmap, ADT7X10_CONFIG, data->config);
 		if (ret)
 			return ret;
+		ret = devm_add_action_or_reset(dev, adt7x10_restore_config, data);
+		if (ret)
+			return ret;
 	}
 	dev_dbg(dev, "Config %02x\n", data->config);
 
 	/* Register sysfs hooks */
 	ret = sysfs_create_group(&dev->kobj, &adt7x10_group);
 	if (ret)
-		goto exit_restore;
+		return ret;
 
 	/*
 	 * The I2C device will already have it's own 'name' attribute, but for
@@ -375,8 +385,6 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 		device_remove_file(dev, &dev_attr_name);
 exit_remove:
 	sysfs_remove_group(&dev->kobj, &adt7x10_group);
-exit_restore:
-	regmap_write(regmap, ADT7X10_CONFIG, data->oldconfig);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(adt7x10_probe);
@@ -392,8 +400,6 @@ void adt7x10_remove(struct device *dev, int irq)
 	if (data->name)
 		device_remove_file(dev, &dev_attr_name);
 	sysfs_remove_group(&dev->kobj, &adt7x10_group);
-	if (data->oldconfig != data->config)
-		regmap_write(data->regmap, ADT7X10_CONFIG, data->oldconfig);
 }
 EXPORT_SYMBOL_GPL(adt7x10_remove);
 
-- 
2.33.0

