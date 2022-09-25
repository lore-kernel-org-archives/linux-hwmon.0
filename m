Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36771C6FA82
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbiIYRam (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiIYRal (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A880D25C74
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 43A7F60B60
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DE9C43470;
        Sun, 25 Sep 2022 17:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127039;
        bh=h7qKZT0gGt2oPhVaiwbxaSbl60WJQy6McOhI6760anM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z2+I9XDrGH6MBN9jNRHYF9kMHDaSl2qKQ4DswJYjIFoEychpMpDvm/7ezAfcEZA8m
         T6Fh0B9l/xcWxqzs6qw3rOEfcMib0/VPownJupY9Ado+NW1dxYHmHgRPRkG/oNeNPP
         naX9jqlUnnmdtsSfdB6fTMG1ptfoJoTVyRKJWTkM4ss1/UhYqKmLVXAAnuSi5PT65F
         DWszYTHqJS5F/096S3SM8SrBh8c8RXN/qwO3iuBrd8HPQT2lwpY41/QgHVH+65PJit
         TC+uipbD+t/4dxR1kDAK6PW/gNI2OxwW4VQT2YoSQw0zjvy1txkKH4o8OxASE/9qDu
         bUlxpe0hJ+QFw==
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
Subject: [PATCH 18/18] hwmon: (ina3221) Use DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr()
Date:   Sun, 25 Sep 2022 18:27:59 +0100
Message-Id: <20220925172759.3573439-19-jic23@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220925172759.3573439-1-jic23@kernel.org>
References: <20220925172759.3573439-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

These new macros allow the compiler to see all the functions even if
!CONFIG_PM* and remove the structures and functions if unused.
This removes the need for __maybe_unused markings.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ninad Malwade <nmalwade@nvidia.com>
---
 drivers/hwmon/ina3221.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 58d3828e2ec0..8ef2631fc312 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -930,7 +930,7 @@ static int ina3221_remove(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused ina3221_suspend(struct device *dev)
+static int ina3221_suspend(struct device *dev)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	int ret;
@@ -953,7 +953,7 @@ static int __maybe_unused ina3221_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ina3221_resume(struct device *dev)
+static int ina3221_resume(struct device *dev)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	int ret;
@@ -996,11 +996,8 @@ static int __maybe_unused ina3221_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops ina3221_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(ina3221_suspend, ina3221_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(ina3221_pm, ina3221_suspend, ina3221_resume,
+				 NULL);
 
 static const struct of_device_id ina3221_of_match_table[] = {
 	{ .compatible = "ti,ina3221", },
@@ -1020,7 +1017,7 @@ static struct i2c_driver ina3221_i2c_driver = {
 	.driver = {
 		.name = INA3221_DRIVER_NAME,
 		.of_match_table = ina3221_of_match_table,
-		.pm = &ina3221_pm,
+		.pm = pm_ptr(&ina3221_pm),
 	},
 	.id_table = ina3221_ids,
 };
-- 
2.37.2

