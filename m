Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A609C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbiIYR3m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbiIYR3l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:29:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2FA219D
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:29:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02DD46154A
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C71DC433C1;
        Sun, 25 Sep 2022 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664126977;
        bh=YToQx2h2DQCMGJCB7EgQVjDnap9gniTzdEwASV2fKuY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cgdz/3b1bnhI3GBUY3hxG909vh3ToYokBhI+BpcJbjytaeN64yLoPO/eBUx6FWhex
         11srx25eqv4aOShpS5LlC+VobaGaM6h7ZEN2cPm2/yWp4FRPxVrCHciq7QXH7R4C6i
         qf9ViyPcIFXdj3P4qvvM/VfC+4B4FLbnKOyfcDRKLh66abwygWvArjl6J7Oy5savDP
         4lKt9hD1jgvQj6aeS3/mu18lmb2DM1zUXXFGcMvrI3W2w1wBwJD3XDdIxR7EJZmKLN
         SZ2mfrsblPkVyH0JAxTB+HRjF/hGtxdZzfQoH5I0xyE/KhVWqTSOQcJGG1MCOMDWoD
         gPnWq9qs2GM9w==
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
Subject: [PATCH 02/18] hwmon: (abitguru3) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:43 +0100
Message-Id: <20220925172759.3573439-3-jic23@kernel.org>
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
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hwmon/abituguru3.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/abituguru3.c b/drivers/hwmon/abituguru3.c
index 8229ad30c909..afb21f73032d 100644
--- a/drivers/hwmon/abituguru3.c
+++ b/drivers/hwmon/abituguru3.c
@@ -1127,7 +1127,6 @@ static struct abituguru3_data *abituguru3_update_device(struct device *dev)
 		return NULL;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int abituguru3_suspend(struct device *dev)
 {
 	struct abituguru3_data *data = dev_get_drvdata(dev);
@@ -1146,16 +1145,12 @@ static int abituguru3_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(abituguru3_pm, abituguru3_suspend, abituguru3_resume);
-#define ABIT_UGURU3_PM	(&abituguru3_pm)
-#else
-#define ABIT_UGURU3_PM	NULL
-#endif /* CONFIG_PM */
+static DEFINE_SIMPLE_DEV_PM_OPS(abituguru3_pm, abituguru3_suspend, abituguru3_resume);
 
 static struct platform_driver abituguru3_driver = {
 	.driver = {
 		.name	= ABIT_UGURU3_NAME,
-		.pm	= ABIT_UGURU3_PM
+		.pm	= pm_sleep_ptr(&abituguru3_pm),
 	},
 	.probe	= abituguru3_probe,
 	.remove	= abituguru3_remove,
-- 
2.37.2

