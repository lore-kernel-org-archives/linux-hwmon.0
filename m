Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3D7C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Dec 2021 20:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350276AbhLWUwd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Dec 2021 15:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245049AbhLWUwc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Dec 2021 15:52:32 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907B4C061401
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:32 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso8340395otf.12
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dCBkEcWtSakZwKMkIhA0z/uI1FTIRnYOV2s6Tb/RMHE=;
        b=RA8VuwKjOWi/CRCpiHamZA1bbpfH+5k95EuTlJEv9Itk6QqPdGBADLCWu6yVMCHwcR
         acAuRwP1/oNu/GK7/gzIHLZA8KK3D/swsUU30AqLMuXpHxVrKAQBtREHrvdKhqSUE6th
         TsDAwymOH+PaqOTjrmisl8k8OIZI5/WH1LOqRi2qC1g3oVgTVvLPYIuFM/I8qBKgnyx3
         08jmLClxO7N/J3YXVFgqNEyLxke/U557k/cnKfvdq/GIt+s6Q685AJ1TvVosrtAM8Xp3
         b2hNHkedlfN+0oEmjo3KA5HYP/rabdlThqoaipEE6vTEoAOCFJkaQ50CYYb/ssMq2JlJ
         Maaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=dCBkEcWtSakZwKMkIhA0z/uI1FTIRnYOV2s6Tb/RMHE=;
        b=deh0CzqjAZUWvDgM+KakvWLDELDLNn2uHr+qL9xlND+gmmCxwag0XiDvGIi2T11XmH
         9E6U9ze61/GLCQ2veUE2nFmLw//5bT+M9j9OOTSdgWfVQgjTFl6QODLbscXXtR+Wg2Ba
         vvtj9JpMEUQSnfOdOzzCzRL8E8JWZXLoe9YHWGWRO2FCTyYwKK5eQqLjLUrSIdW9xOv2
         cU20pTwn0ZKPfDoIMqU2yImMQzAQcodCFcTZ0yb0GpO4Mqt89oxPdSGDnT8uH8z6M+w1
         lfkryLtuNFuvIxRSiLgePHAXsVOTT6KXxOi0ydIoSwW/+o9WAaGPZ3em40DEkM7JH4Id
         shJg==
X-Gm-Message-State: AOAM533ye/kjBYD3I4uN7qznkW/q4HuRq4VZDLP49V0S3EWys1W0UsUV
        cqJfUFqKW5qFUh2usHQg90w9ozFw4/s=
X-Google-Smtp-Source: ABdhPJxKkiDjGiribFCttFc/V2LAltN6m7KtFAvkCn1vzxZwpdiWZlI9NvX1bYVPHXpgdFwU6wdU4w==
X-Received: by 2002:a05:6830:118a:: with SMTP id u10mr2570809otq.194.1640292751706;
        Thu, 23 Dec 2021 12:52:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k101sm1064608otk.60.2021.12.23.12.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 12:52:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Cosmin Tanislav <demonsingur@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Cosmin Tanislav <cosmin.tanislav@analog.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 5/6] hwmon: (adt7x10) Remove empty driver removal callback
Date:   Thu, 23 Dec 2021 12:52:18 -0800
Message-Id: <20211223205219.2184104-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211223205219.2184104-1-linux@roeck-us.net>
References: <20211223205219.2184104-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Cosmin Tanislav <cosmin.tanislav@analog.com>

Not used to do anything anymore.

Signed-off-by: Cosmin Tanislav <cosmin.tanislav@analog.com>
Link: https://lore.kernel.org/r/20211221215841.2641417-6-demonsingur@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7310.c | 7 -------
 drivers/hwmon/adt7410.c | 7 -------
 drivers/hwmon/adt7x10.c | 5 -----
 drivers/hwmon/adt7x10.h | 2 --
 4 files changed, 21 deletions(-)

diff --git a/drivers/hwmon/adt7310.c b/drivers/hwmon/adt7310.c
index a83092470bce..1efc0bdcceab 100644
--- a/drivers/hwmon/adt7310.c
+++ b/drivers/hwmon/adt7310.c
@@ -142,12 +142,6 @@ static int adt7310_spi_probe(struct spi_device *spi)
 			     regmap);
 }
 
-static int adt7310_spi_remove(struct spi_device *spi)
-{
-	adt7x10_remove(&spi->dev, spi->irq);
-	return 0;
-}
-
 static const struct spi_device_id adt7310_id[] = {
 	{ "adt7310", 0 },
 	{ "adt7320", 0 },
@@ -161,7 +155,6 @@ static struct spi_driver adt7310_driver = {
 		.pm	= ADT7X10_DEV_PM_OPS,
 	},
 	.probe		= adt7310_spi_probe,
-	.remove		= adt7310_spi_remove,
 	.id_table	= adt7310_id,
 };
 module_spi_driver(adt7310_driver);
diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index 81950a079c2f..aede5baca7b9 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -87,12 +87,6 @@ static int adt7410_i2c_probe(struct i2c_client *client)
 	return adt7x10_probe(&client->dev, client->name, client->irq, regmap);
 }
 
-static int adt7410_i2c_remove(struct i2c_client *client)
-{
-	adt7x10_remove(&client->dev, client->irq);
-	return 0;
-}
-
 static const struct i2c_device_id adt7410_ids[] = {
 	{ "adt7410", 0 },
 	{ "adt7420", 0 },
@@ -107,7 +101,6 @@ static struct i2c_driver adt7410_driver = {
 		.pm	= ADT7X10_DEV_PM_OPS,
 	},
 	.probe_new	= adt7410_i2c_probe,
-	.remove		= adt7410_i2c_remove,
 	.id_table	= adt7410_ids,
 	.address_list	= I2C_ADDRS(0x48, 0x49, 0x4a, 0x4b),
 };
diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index 147c28b24167..ea8cd918bc22 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -397,11 +397,6 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 }
 EXPORT_SYMBOL_GPL(adt7x10_probe);
 
-void adt7x10_remove(struct device *dev, int irq)
-{
-}
-EXPORT_SYMBOL_GPL(adt7x10_remove);
-
 #ifdef CONFIG_PM_SLEEP
 
 static int adt7x10_suspend(struct device *dev)
diff --git a/drivers/hwmon/adt7x10.h b/drivers/hwmon/adt7x10.h
index 55ff08bfe946..ba22c32c8355 100644
--- a/drivers/hwmon/adt7x10.h
+++ b/drivers/hwmon/adt7x10.h
@@ -20,8 +20,6 @@ struct device;
 int adt7x10_probe(struct device *dev, const char *name, int irq,
 		  struct regmap *regmap);
 
-void adt7x10_remove(struct device *dev, int irq);
-
 #ifdef CONFIG_PM_SLEEP
 extern const struct dev_pm_ops adt7x10_dev_pm_ops;
 #define ADT7X10_DEV_PM_OPS (&adt7x10_dev_pm_ops)
-- 
2.33.0

