Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F15C54EE9
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbiIYRaN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233185AbiIYRaC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:02 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8055F5B2
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 06D82CE0E3E
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E86C433D6;
        Sun, 25 Sep 2022 17:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664126997;
        bh=pt622bbiC9ahFfPJ5C6A9+86qKoF9GtjvEZiIJsjCeU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=INBr3AEvPb1k7y7ueDPWfTVdnQ9wwK+LTQU27P2z3aoYjQrfsHgWXbIIIms7HCs4I
         y+a122OVisk0da1RsTMWZqr31OxOTtgmCRC4Emn3v5/BVMdzKFksZtXDF8xc6MKrV1
         X44p9kZeUcMT4vdoQqBHuDl2C2K6SK2j0UosLrdBhSXm6mOCPuJsUknbhmjAZxh42U
         2aGwH9tXi5DLYsqz87PAgQiIgpB6UCVpGLF22xS9JONtEl2nqbtLYVi18/d/Ve8JcE
         bBzAIBaP3wtBn45QiZH5F3GseB6uyvIkI7wX5/ZeHsmbgcXbI+mZ9kxdFSvZwXvDuC
         lnetfxTC0GkLg==
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
Subject: [PATCH 07/18] hwmon: (lm90) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:48 +0100
Message-Id: <20220925172759.3573439-8-jic23@kernel.org>
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
if !CONFIG_PM_SLEEP. This allows the removal of __maybe_unused markings
whilst achieving the same result.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index c151c0bf43f2..db595f7d01f8 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2956,7 +2956,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 	}
 }
 
-static int __maybe_unused lm90_suspend(struct device *dev)
+static int lm90_suspend(struct device *dev)
 {
 	struct lm90_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -2967,7 +2967,7 @@ static int __maybe_unused lm90_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused lm90_resume(struct device *dev)
+static int lm90_resume(struct device *dev)
 {
 	struct lm90_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -2978,14 +2978,14 @@ static int __maybe_unused lm90_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(lm90_pm_ops, lm90_suspend, lm90_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(lm90_pm_ops, lm90_suspend, lm90_resume);
 
 static struct i2c_driver lm90_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm90",
 		.of_match_table = of_match_ptr(lm90_of_match),
-		.pm	= &lm90_pm_ops,
+		.pm	= pm_sleep_ptr(&lm90_pm_ops),
 	},
 	.probe_new	= lm90_probe,
 	.alert		= lm90_alert,
-- 
2.37.2

