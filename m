Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B853EC6FA8E
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbiIYRaP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbiIYRaI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E259E19005
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BAF5460B60
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB34FC433D7;
        Sun, 25 Sep 2022 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127005;
        bh=hYmNKLciLIcxsn36wSGifB1hsmIsXIJi5Pye0aqxgmo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JkV+nQYfqwYkQeNsKe3bGJniU0Tg1L8XME0eW4JgEyJmX6kViRP9bXdyPmdh+sV/O
         hreI3Ue/1RJa1h+niTVH5kKV9Ddcef8LMvV6vtLryHx6uMx5hjYTbl/fOOObDeOR/U
         BsllYSyZWbKWVPfEqooyGEyMO7vxbp7JjlPMZlfn1RnTTElWnkGa83uMcO35fBqc84
         AYmDJO2H5ZpDhuHRgRTbWVGxshgLKJYYCIfpBzh27W4C7Gys2NXWx5SZ8IUq8PC1NH
         yv5ro+F+L/J0UuvjmY/y5uGFZ0DuVMEPdi8kBEmFM7D7ni0RhRgr8QtSH5+xXxfodO
         TboCTpUjNr4TQ==
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
Subject: [PATCH 09/18] hwmon: (max31722) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:50 +0100
Message-Id: <20220925172759.3573439-10-jic23@kernel.org>
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
 drivers/hwmon/max31722.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/max31722.c b/drivers/hwmon/max31722.c
index 93e048ee4955..9a31ef388396 100644
--- a/drivers/hwmon/max31722.c
+++ b/drivers/hwmon/max31722.c
@@ -113,7 +113,7 @@ static void max31722_remove(struct spi_device *spi)
 		dev_warn(&spi->dev, "Failed to put device in stand-by mode\n");
 }
 
-static int __maybe_unused max31722_suspend(struct device *dev)
+static int max31722_suspend(struct device *dev)
 {
 	struct spi_device *spi_device = to_spi_device(dev);
 	struct max31722_data *data = spi_get_drvdata(spi_device);
@@ -121,7 +121,7 @@ static int __maybe_unused max31722_suspend(struct device *dev)
 	return max31722_set_mode(data, MAX31722_MODE_STANDBY);
 }
 
-static int __maybe_unused max31722_resume(struct device *dev)
+static int max31722_resume(struct device *dev)
 {
 	struct spi_device *spi_device = to_spi_device(dev);
 	struct max31722_data *data = spi_get_drvdata(spi_device);
@@ -129,7 +129,7 @@ static int __maybe_unused max31722_resume(struct device *dev)
 	return max31722_set_mode(data, MAX31722_MODE_CONTINUOUS);
 }
 
-static SIMPLE_DEV_PM_OPS(max31722_pm_ops, max31722_suspend, max31722_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(max31722_pm_ops, max31722_suspend, max31722_resume);
 
 static const struct spi_device_id max31722_spi_id[] = {
 	{"max31722", 0},
@@ -141,7 +141,7 @@ MODULE_DEVICE_TABLE(spi, max31722_spi_id);
 static struct spi_driver max31722_driver = {
 	.driver = {
 		.name = "max31722",
-		.pm = &max31722_pm_ops,
+		.pm = pm_sleep_ptr(&max31722_pm_ops),
 	},
 	.probe =            max31722_probe,
 	.remove =           max31722_remove,
-- 
2.37.2

