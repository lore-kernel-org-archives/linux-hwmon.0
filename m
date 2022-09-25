Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE4BC04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbiIYRaF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbiIYRaA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E82178AA
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:29:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 47446614F3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3DCC4314C;
        Sun, 25 Sep 2022 17:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664126993;
        bh=Gp003LvB+6K2HgRspjYrH6YT8jx8F5kMBuvXWbfKmIk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hB83SSLPfNOLH0/XohL22dIOhAbK78thq+EDyeWBK1kNg0d5nZzTaCk/G7vkTheuM
         /3MVIkWgCLV479Kf8z53VoOwnTeKupAEu0BdG15vxCwWlF+6fzQfF9AKK/MiZVPtXe
         irp6LLFdX+xaTsxEnvwPZm6XdgdaP7ZdolAaZFcGz3FFA3fr4eq5TBWD7CkHJrvugj
         c38Fr77P6R168Ry0L+IbZDW8Qw/gyCeln8M1mml2Jm82+cX5TB4ho5x6AtdOKlValD
         7I6xfoN/9OMOqkGE39eNw2l9LaFVO1YE3FjSwOvBjIVlEQfZ2onjYnxjDYqK22lViF
         DLCbPNmnss7RQ==
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
Subject: [PATCH 06/18] hwmon: (it87) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:47 +0100
Message-Id: <20220925172759.3573439-7-jic23@kernel.org>
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
 drivers/hwmon/it87.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 0e543dbe0a6b..7bd154ba351b 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3179,7 +3179,7 @@ static int it87_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-static void __maybe_unused it87_resume_sio(struct platform_device *pdev)
+static void it87_resume_sio(struct platform_device *pdev)
 {
 	struct it87_data *data = dev_get_drvdata(&pdev->dev);
 	int err;
@@ -3211,7 +3211,7 @@ static void __maybe_unused it87_resume_sio(struct platform_device *pdev)
 	superio_exit(data->sioaddr);
 }
 
-static int __maybe_unused it87_resume(struct device *dev)
+static int it87_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct it87_data *data = dev_get_drvdata(dev);
@@ -3238,12 +3238,12 @@ static int __maybe_unused it87_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(it87_dev_pm_ops, NULL, it87_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(it87_dev_pm_ops, NULL, it87_resume);
 
 static struct platform_driver it87_driver = {
 	.driver = {
 		.name	= DRVNAME,
-		.pm     = &it87_dev_pm_ops,
+		.pm     = pm_sleep_ptr(&it87_dev_pm_ops),
 	},
 	.probe	= it87_probe,
 };
-- 
2.37.2

