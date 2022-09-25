Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92823C54EE9
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbiIYR3t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbiIYR3r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:29:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADA9DF5A
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:29:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 17C89614F3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296C9C433D6;
        Sun, 25 Sep 2022 17:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664126985;
        bh=lOY5B9NQqMbtLf1sBXQgbZXnB1gCWESMzarj6dO+VNM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HV6Mxn/A7EdW2IXyUN5VS/tPWweiicEkaKTluYQL/CuEYrjeyvWZtI5bPT6EX4b5Q
         ALMOZVsDCiDq8Zxpf2r+sGvJU5Gt3GsQ7mdH7Apf6n0sHQJqpQHZyAWYp4gfqGKX5t
         9OO9n0gfTZMKUD9ZkJPz7HFGv49mbw2xMRQRcLt+MtiKPLH6cE3AWdy/4y4plWwpNX
         UdTLMbzKat2YJ3ZO+RAduUvD6MF0WELc951tqeXIyvfw3tsLgfcRMK1J1VPDehdpwp
         xLypew6XOkXlS+GziYkOfToKxG0r1WUav/C0moZFkmtTAWtK//VbQ3vKafOdT//aYy
         60gT1hMZyo2Kw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Roland Stigge <stigge@antcom.de>,
        =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= 
        <dirty.ice.hu@gmail.com>, Ninad Malwade <nmalwade@nvidia.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 04/18] hwmon: (adt7x10) Switch to EXPORT_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:45 +0100
Message-Id: <20220925172759.3573439-5-jic23@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220925172759.3573439-1-jic23@kernel.org>
References: <20220925172759.3573439-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

These newer PM macros allow the compiler to see what code it can remove
if !CONFIG_PM_SLEEP. This allows the removal of messy #ifdef barriers whilst
achieving the same result.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/hwmon/adt7310.c | 2 +-
 drivers/hwmon/adt7410.c | 2 +-
 drivers/hwmon/adt7x10.c | 7 +------
 drivers/hwmon/adt7x10.h | 5 -----
 4 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/adt7310.c b/drivers/hwmon/adt7310.c
index 1efc0bdcceab..067865f4887a 100644
--- a/drivers/hwmon/adt7310.c
+++ b/drivers/hwmon/adt7310.c
@@ -152,7 +152,7 @@ MODULE_DEVICE_TABLE(spi, adt7310_id);
 static struct spi_driver adt7310_driver = {
 	.driver = {
 		.name	= "adt7310",
-		.pm	= ADT7X10_DEV_PM_OPS,
+		.pm	= pm_sleep_ptr(&adt7x10_dev_pm_ops),
 	},
 	.probe		= adt7310_spi_probe,
 	.id_table	= adt7310_id,
diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index aede5baca7b9..0cebf6777239 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -98,7 +98,7 @@ static struct i2c_driver adt7410_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "adt7410",
-		.pm	= ADT7X10_DEV_PM_OPS,
+		.pm	= pm_sleep_ptr(&adt7x10_dev_pm_ops),
 	},
 	.probe_new	= adt7410_i2c_probe,
 	.id_table	= adt7410_ids,
diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index ce54bffab2ec..da67734edafd 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -397,8 +397,6 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 }
 EXPORT_SYMBOL_GPL(adt7x10_probe);
 
-#ifdef CONFIG_PM_SLEEP
-
 static int adt7x10_suspend(struct device *dev)
 {
 	struct adt7x10_data *data = dev_get_drvdata(dev);
@@ -414,10 +412,7 @@ static int adt7x10_resume(struct device *dev)
 	return regmap_write(data->regmap, ADT7X10_CONFIG, data->config);
 }
 
-SIMPLE_DEV_PM_OPS(adt7x10_dev_pm_ops, adt7x10_suspend, adt7x10_resume);
-EXPORT_SYMBOL_GPL(adt7x10_dev_pm_ops);
-
-#endif /* CONFIG_PM_SLEEP */
+EXPORT_SIMPLE_DEV_PM_OPS(adt7x10_dev_pm_ops, adt7x10_suspend, adt7x10_resume);
 
 MODULE_AUTHOR("Hartmut Knaack");
 MODULE_DESCRIPTION("ADT7410/ADT7420, ADT7310/ADT7320 common code");
diff --git a/drivers/hwmon/adt7x10.h b/drivers/hwmon/adt7x10.h
index ba22c32c8355..46caf3e21978 100644
--- a/drivers/hwmon/adt7x10.h
+++ b/drivers/hwmon/adt7x10.h
@@ -20,11 +20,6 @@ struct device;
 int adt7x10_probe(struct device *dev, const char *name, int irq,
 		  struct regmap *regmap);
 
-#ifdef CONFIG_PM_SLEEP
 extern const struct dev_pm_ops adt7x10_dev_pm_ops;
-#define ADT7X10_DEV_PM_OPS (&adt7x10_dev_pm_ops)
-#else
-#define ADT7X10_DEV_PM_OPS NULL
-#endif
 
 #endif
-- 
2.37.2

