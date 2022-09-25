Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DDCC04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbiIYRac (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbiIYRa3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160182C108
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A64EF60B60
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E4AC433D6;
        Sun, 25 Sep 2022 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127028;
        bh=GgEN4+iiUbdZYI8aRA+ZzKku9A5SKs7sBVH80uhu37k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uoB2vObZgcHLjyEP/Rb2nplb7NKp/2sHcUjMixav7ZrVTdmkToNl6yrbxn63Pk6TD
         C9rtO+TkF26WgpDWMBiNnni3v8/zM2qfuNDGaXxxyofjlLl0ECI5smHTD0Of32Eeem
         c0kLlNp2pKRKOXUTh+xA3Fni5AHjiHofQlCGipL+N3sCbLAWCqJD0tnpEgv11KSAXy
         /ZtKw6TJLgUTAATlbL89H5wL9z12LausBaEVZzZ1WGvJZkhm1QvANxAJCRHfSJwtLw
         VhfOnKriFF+U6SS22aUTAfcGXv0ZBRzXfJoilXtOhZY3FDAtpEHUujGxEHqPRCOZmi
         f7Y6YQBxJUUPQ==
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
Subject: [PATCH 15/18] hwmon: (tmp103) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:56 +0100
Message-Id: <20220925172759.3573439-16-jic23@kernel.org>
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
 drivers/hwmon/tmp103.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
index 5cab4436aa77..56d5cbf36a45 100644
--- a/drivers/hwmon/tmp103.c
+++ b/drivers/hwmon/tmp103.c
@@ -178,7 +178,7 @@ static int tmp103_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-static int __maybe_unused tmp103_suspend(struct device *dev)
+static int tmp103_suspend(struct device *dev)
 {
 	struct regmap *regmap = dev_get_drvdata(dev);
 
@@ -186,7 +186,7 @@ static int __maybe_unused tmp103_suspend(struct device *dev)
 				  TMP103_CONF_SD_MASK, 0);
 }
 
-static int __maybe_unused tmp103_resume(struct device *dev)
+static int tmp103_resume(struct device *dev)
 {
 	struct regmap *regmap = dev_get_drvdata(dev);
 
@@ -194,7 +194,7 @@ static int __maybe_unused tmp103_resume(struct device *dev)
 				  TMP103_CONF_SD_MASK, TMP103_CONF_SD);
 }
 
-static SIMPLE_DEV_PM_OPS(tmp103_dev_pm_ops, tmp103_suspend, tmp103_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tmp103_dev_pm_ops, tmp103_suspend, tmp103_resume);
 
 static const struct i2c_device_id tmp103_id[] = {
 	{ "tmp103", 0 },
@@ -212,7 +212,7 @@ static struct i2c_driver tmp103_driver = {
 	.driver = {
 		.name	= "tmp103",
 		.of_match_table = of_match_ptr(tmp103_of_match),
-		.pm	= &tmp103_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&tmp103_dev_pm_ops),
 	},
 	.probe_new	= tmp103_probe,
 	.id_table	= tmp103_id,
-- 
2.37.2

