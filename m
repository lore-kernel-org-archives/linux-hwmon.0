Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02825C54EE9
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbiIYRag (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiIYRaf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D026FAC8
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2BBDCB80781
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8804BC433D7;
        Sun, 25 Sep 2022 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127031;
        bh=SU2SxwDcc9OV58DOiDFiwRjWQAilQbpi/QvLz9VnqLI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I1A4VhrRIsmN9twEP3G8EVynvqauzG2WPpKEDMYCamftBJ8MuP8n07QDC/NBMQRe3
         9rgQ/ST0VEIs3p8AZTguVlSfOw8CSUlyWlZHK+8d3IZtVXyCM/WHm8dWLoTHDoGaJx
         JT/B9sll1fEYU5sA5Zs9H9EdahXf20IFuKNgjgfYvlvDro2OqYxYE2k3G1x8vrOjJJ
         RxGyNtTvGUq5cV0Jfc7UuCiOW63AEKb2vWQqZICx9RVaEqtxwO0M29OrOylGtYhWqM
         h99evTJamWxK+jd4upf5s4TNyUiD1vpRnpO+eYeNs1qOoq75RqVTXTvklphOdAX3ee
         11i6CwIoM+xog==
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
Subject: [PATCH 16/18] hwmon: (tmp108) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:57 +0100
Message-Id: <20220925172759.3573439-17-jic23@kernel.org>
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
---
 drivers/hwmon/tmp108.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index 5435664c3f6e..acb4ba750b09 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -390,7 +390,7 @@ static int tmp108_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-static int __maybe_unused tmp108_suspend(struct device *dev)
+static int tmp108_suspend(struct device *dev)
 {
 	struct tmp108 *tmp108 = dev_get_drvdata(dev);
 
@@ -398,7 +398,7 @@ static int __maybe_unused tmp108_suspend(struct device *dev)
 				  TMP108_CONF_MODE_MASK, TMP108_MODE_SHUTDOWN);
 }
 
-static int __maybe_unused tmp108_resume(struct device *dev)
+static int tmp108_resume(struct device *dev)
 {
 	struct tmp108 *tmp108 = dev_get_drvdata(dev);
 	int err;
@@ -410,7 +410,7 @@ static int __maybe_unused tmp108_resume(struct device *dev)
 	return err;
 }
 
-static SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
 
 static const struct i2c_device_id tmp108_i2c_ids[] = {
 	{ "tmp108", 0 },
@@ -429,7 +429,7 @@ MODULE_DEVICE_TABLE(of, tmp108_of_ids);
 static struct i2c_driver tmp108_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
-		.pm	= &tmp108_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&tmp108_dev_pm_ops),
 		.of_match_table = of_match_ptr(tmp108_of_ids),
 	},
 	.probe_new	= tmp108_probe,
-- 
2.37.2

