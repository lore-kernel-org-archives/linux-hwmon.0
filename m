Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7D8C54EE9
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbiIYR3j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiIYR3i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:29:38 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3708E26
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:29:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 3C87BCE0E3F
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151AEC433D7;
        Sun, 25 Sep 2022 17:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664126973;
        bh=4OakupbKTJ0j38aQm6BHp3o3nPFW3nmpk3VSlmgcE90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HblNsseQ8U8/ipJ8X4OscR8Kf5/ArcNRQoAqtUGIBBqZbrt5f6ioHvM9LPuUVjvjA
         8Fx2IH+71lTJT+6FX42LxUAlwbD+snRO0ATzFAgQYmGjTb5scIIKKfDFX5aY4OuxEZ
         QAG8O4H2wHiCpeT3jT8ZJVXXq4QCzhNuxeddxy7FPTfTq0tj9GHWNPhG7uS6DOtRss
         Bf/nbEtcaARy5BGaYOXaTBTKgnYQukJ16rC5msjBLUz5aTYd8BlM8KAlWkIB7UzHnZ
         CqJoqArgCoVyQO5SHqo4musy4K4ZNmY+a46Dyiutd3n4wiTB2CjDR9P6chQSBWl8wG
         UfNJfvwdECbbg==
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
Subject: [PATCH 01/18] hwmon: (abitguru) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:42 +0100
Message-Id: <20220925172759.3573439-2-jic23@kernel.org>
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
if !CONFIG_PM_SLEEP.  This allows the removal of messy #ifdef barriers.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hwmon/abituguru.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
index 681f0623868f..a7cae6568155 100644
--- a/drivers/hwmon/abituguru.c
+++ b/drivers/hwmon/abituguru.c
@@ -1504,7 +1504,6 @@ static struct abituguru_data *abituguru_update_device(struct device *dev)
 		return NULL;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int abituguru_suspend(struct device *dev)
 {
 	struct abituguru_data *data = dev_get_drvdata(dev);
@@ -1526,16 +1525,12 @@ static int abituguru_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(abituguru_pm, abituguru_suspend, abituguru_resume);
-#define ABIT_UGURU_PM	(&abituguru_pm)
-#else
-#define ABIT_UGURU_PM	NULL
-#endif /* CONFIG_PM */
+static DEFINE_SIMPLE_DEV_PM_OPS(abituguru_pm, abituguru_suspend, abituguru_resume);
 
 static struct platform_driver abituguru_driver = {
 	.driver = {
 		.name	= ABIT_UGURU_NAME,
-		.pm	= ABIT_UGURU_PM,
+		.pm	= pm_sleep_ptr(&abituguru_pm),
 	},
 	.probe		= abituguru_probe,
 	.remove		= abituguru_remove,
-- 
2.37.2

