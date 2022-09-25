Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263B5C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbiIYRaQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbiIYRaL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D75DF5A
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 828B960B60
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0117C433D6;
        Sun, 25 Sep 2022 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127008;
        bh=zUkDP8H67QtBqYJLbhzwD9s9c4QRsHFH6Z2cc6W1OO8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kDCBcfFqKBUFR78ymtzWVUkwuyC54SEENCUISXGwNMmPhXJHoW1s2b5VeeL7YwnwF
         pgCQ/XekoQMttD1pesrLNoR8CFjFZRW31Eygfzv/7UJNNJh7FTFM262aOHIN5O6JO0
         9hghgpOWZJtEoD68RPSupIkcLf4ScLFwR1PdNnz5mzXZONlD7dBNe0ZlnslHqzIVUx
         xxW0O40HH0Lu5sASToied8vXmP/USHAKvDycaTKd3lOWTv1dY93jj7maKHn2Lt2Uam
         Z1/I/U9jJP6WUqPrUNaVmL11VbRyf3ciRI0GQIqceZFh9rREg7fL6hL6kyCUjAGWfF
         plw2WmpF4/ZVw==
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
Subject: [PATCH 10/18] hwmon: (max31730) witch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:51 +0100
Message-Id: <20220925172759.3573439-11-jic23@kernel.org>
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
 drivers/hwmon/max31730.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/max31730.c b/drivers/hwmon/max31730.c
index 9bdff881f59c..746a767c9fc6 100644
--- a/drivers/hwmon/max31730.c
+++ b/drivers/hwmon/max31730.c
@@ -404,28 +404,28 @@ static int max31730_detect(struct i2c_client *client,
 	return 0;
 }
 
-static int __maybe_unused max31730_suspend(struct device *dev)
+static int max31730_suspend(struct device *dev)
 {
 	struct max31730_data *data = dev_get_drvdata(dev);
 
 	return max31730_write_config(data, MAX31730_STOP, 0);
 }
 
-static int __maybe_unused max31730_resume(struct device *dev)
+static int max31730_resume(struct device *dev)
 {
 	struct max31730_data *data = dev_get_drvdata(dev);
 
 	return max31730_write_config(data, 0, MAX31730_STOP);
 }
 
-static SIMPLE_DEV_PM_OPS(max31730_pm_ops, max31730_suspend, max31730_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(max31730_pm_ops, max31730_suspend, max31730_resume);
 
 static struct i2c_driver max31730_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "max31730",
 		.of_match_table = of_match_ptr(max31730_of_match),
-		.pm	= &max31730_pm_ops,
+		.pm	= pm_sleep_ptr(&max31730_pm_ops),
 	},
 	.probe_new	= max31730_probe,
 	.id_table	= max31730_ids,
-- 
2.37.2

