Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF601C54EE9
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbiIYRaS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232985AbiIYRaR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45151DF5A
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D19E8B81366
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE3DC433D7;
        Sun, 25 Sep 2022 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127012;
        bh=OE1ncISOjmOPCpTKxd6MjYis+R8dh6UFMC2w0wD0pQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PtWICk2+N6AA6DvfAXYsp3NPyPUz94+/V8M22y+xwLAEqvtU2Gs8m3IwKpWrgU7qP
         I5lb21k5I4kUWeaQ7/8pP+PJK2zAUu8gZ5QmW7eiHjghdZ8JCMO+sZReAhvhEFXRqy
         zeHWheSzjNOsPudGjV/vcC35HiHNBrQacqe4QG2PQrqyIGN1GAuGjB3DGDeXTPLZxi
         J4f55TPjh1iOr9Hu4PjpuAc5Qw8YTOTRX2sBIPAdy3lx/yl3oFXkb0sia8mTXqC5Nc
         XHqC8Fugnilp1YysjaReS5StpVIcHvjjJwVh4YtpgJ4J//y7TLlYKjiLucbyL0McxP
         jkHmDkdTao1fA==
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
Subject: [PATCH 11/18] hwmon: (max6639) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:52 +0100
Message-Id: <20220925172759.3573439-12-jic23@kernel.org>
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
if !CONFIG_PM_SLEEP. This allows the removal of #ifdef guards whilst
achieving the same result.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Roland Stigge <stigge@antcom.de>
---
 drivers/hwmon/max6639.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 936861131d74..9b895402c80d 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -571,7 +571,6 @@ static int max6639_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int max6639_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -609,7 +608,6 @@ static int max6639_resume(struct device *dev)
 	return i2c_smbus_write_byte_data(client,
 			MAX6639_REG_GCONFIG, ret & ~MAX6639_GCONFIG_STANDBY);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct i2c_device_id max6639_id[] = {
 	{"max6639", 0},
@@ -618,13 +616,13 @@ static const struct i2c_device_id max6639_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, max6639_id);
 
-static SIMPLE_DEV_PM_OPS(max6639_pm_ops, max6639_suspend, max6639_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(max6639_pm_ops, max6639_suspend, max6639_resume);
 
 static struct i2c_driver max6639_driver = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		   .name = "max6639",
-		   .pm = &max6639_pm_ops,
+		   .pm = pm_sleep_ptr(&max6639_pm_ops),
 		   },
 	.probe_new = max6639_probe,
 	.id_table = max6639_id,
-- 
2.37.2

