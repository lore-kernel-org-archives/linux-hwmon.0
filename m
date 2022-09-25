Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABC9C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiIYR3o (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbiIYR3n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:29:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9949BC1B
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:29:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46AB26154A
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED335C433B5;
        Sun, 25 Sep 2022 17:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664126981;
        bh=t+f32U4mCYn82OJ5N8FI9jt8YtCfdyXt2g/ABpqP4JA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vc8jsTHdoZJwPp3yWRuCdzTHmfRcBJzEAEWWWgUmh9buL9gZk1t2LNVLy8o2/uDJt
         jcrjOOJOTIbIS7tjhILjXq+qBMVS7JEz0VXnX8d6klycwptmiiKVmu967b8XMnjHfX
         p//GJeR/B9Y0LBE6b4UppM/nRlddu//PCjYfiRrZw4YY3zOD6M20op1/pgBwVp8kQA
         z//E1p1JZnVlQ3YgDudEB1EqMkxxocBAOr5RCvXSJP2SSYyWz2c+nqXlufBOqpgzyv
         /XnK/8U6HWUXfTXxSuyuP0i9ja8AnM3RjABcsBZlgq0jPbW2LLy6PZ7V5puf111vwB
         Zc7sQIKiX/dbg==
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
Subject: [PATCH 03/18] hwmon: (acpi_power_meter) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:44 +0100
Message-Id: <20220925172759.3573439-4-jic23@kernel.org>
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
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/hwmon/acpi_power_meter.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index d2545a1be9fc..6d02947409d5 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -927,8 +927,6 @@ static int acpi_power_meter_remove(struct acpi_device *device)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-
 static int acpi_power_meter_resume(struct device *dev)
 {
 	struct acpi_power_meter_resource *resource;
@@ -946,9 +944,8 @@ static int acpi_power_meter_resume(struct device *dev)
 	return 0;
 }
 
-#endif /* CONFIG_PM_SLEEP */
-
-static SIMPLE_DEV_PM_OPS(acpi_power_meter_pm, NULL, acpi_power_meter_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(acpi_power_meter_pm, NULL,
+				acpi_power_meter_resume);
 
 static struct acpi_driver acpi_power_meter_driver = {
 	.name = "power_meter",
@@ -959,7 +956,7 @@ static struct acpi_driver acpi_power_meter_driver = {
 		.remove = acpi_power_meter_remove,
 		.notify = acpi_power_meter_notify,
 		},
-	.drv.pm = &acpi_power_meter_pm,
+	.drv.pm = pm_sleep_ptr(&acpi_power_meter_pm),
 };
 
 /* Module init/exit routines */
-- 
2.37.2

