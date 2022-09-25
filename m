Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1764AC54EE9
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233222AbiIYRaC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbiIYR35 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:29:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FD517587
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:29:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0423DB80DE2
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EEEDC433C1;
        Sun, 25 Sep 2022 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664126989;
        bh=4R0AFM/i//wKykpTJIPJ6rvdy9ZhhhqxgjeMhrj6IAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=enm5EPH2ME8nUFaQAePqO7vJDXHtcsuUZdsUuvTLQgwEMTglmcqjgW26/AuyszxHL
         JerxJ9EI6Uspcr5tcmSs4UIHedHx/iEnLEefyfseojx3HZY5wZbl97EChnW2/MfHt5
         UO5jq7zoL6DSgF8MWv6BjM63TFoxtk244aCTZ3FtWWgYZ//eyRSvDvKtjnQ0gnV/MW
         YQgK5spFSslPcha59B63QXFQqGpvhARLi/yyBqSj85OukeqiVNsbF9Tp8o3FKHFmhY
         un5rWvMQlH31KBuj0zMYH/VqxJGOb1OGBnCDUmWXbfdnrwyizOsE5BLGXesZv5FL5D
         72g7ka5bmFg0w==
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
Subject: [PATCH 05/18] hwmon: (gpio-fan) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:46 +0100
Message-Id: <20220925172759.3573439-6-jic23@kernel.org>
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
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/gpio-fan.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index fbf3f5a4ecb6..b05aedd20b4f 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -557,7 +557,6 @@ static void gpio_fan_shutdown(struct platform_device *pdev)
 		set_fan_speed(fan_data, 0);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int gpio_fan_suspend(struct device *dev)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
@@ -580,18 +579,14 @@ static int gpio_fan_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(gpio_fan_pm, gpio_fan_suspend, gpio_fan_resume);
-#define GPIO_FAN_PM	(&gpio_fan_pm)
-#else
-#define GPIO_FAN_PM	NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(gpio_fan_pm, gpio_fan_suspend, gpio_fan_resume);
 
 static struct platform_driver gpio_fan_driver = {
 	.probe		= gpio_fan_probe,
 	.shutdown	= gpio_fan_shutdown,
 	.driver	= {
 		.name	= "gpio-fan",
-		.pm	= GPIO_FAN_PM,
+		.pm	= pm_sleep_ptr(&gpio_fan_pm),
 		.of_match_table = of_match_ptr(of_gpio_fan_match),
 	},
 };
-- 
2.37.2

