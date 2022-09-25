Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AB5C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbiIYRam (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiIYRaj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AF2FAC8
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0DC9CB80781
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C71C433D6;
        Sun, 25 Sep 2022 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127035;
        bh=2kjoerhpXfg+NexEYY87iubJXRqM4+FWfSG0glVHnLo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M14BOskZzd33iscKMlhMD7tj0OGl7IytV8KjK4aDxjZpHCHWi9ga3e52fm4lwz2V9
         ls0NUhKYp1B0Zr0YA9uM30meZh9pB8oPE2u2D+1fBC0iVyBtFKHWQTaUud0Belxrj4
         hEKE71UrW91ItP070P+hmnAS3Mb/bcFalAQfT1LZDQDZlYJzDKVpre1iQ2ZR6pTQmp
         a7AuDZFL2VTg3UNGfE0tk/bHGimh8jT0bfvhxpxSj7+gYHTdHAlfO5LScDPemiz+X1
         w8GMDp6MorJzm84b88sGWK8DKdg8nWPNgyadUsiGuarbK6yeEnmH2ut4NA7q+nk2ST
         bb4fqW81y+Giw==
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
Subject: [PATCH 17/18] hwmon: (w83627ehf) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:58 +0100
Message-Id: <20220925172759.3573439-18-jic23@kernel.org>
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
 drivers/hwmon/w83627ehf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index af89b32a93a5..939d4c35e713 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1944,7 +1944,7 @@ static int __init w83627ehf_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-static int __maybe_unused w83627ehf_suspend(struct device *dev)
+static int w83627ehf_suspend(struct device *dev)
 {
 	struct w83627ehf_data *data = w83627ehf_update_device(dev);
 
@@ -1955,7 +1955,7 @@ static int __maybe_unused w83627ehf_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused w83627ehf_resume(struct device *dev)
+static int w83627ehf_resume(struct device *dev)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
 	int i;
@@ -2010,12 +2010,12 @@ static int __maybe_unused w83627ehf_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(w83627ehf_dev_pm_ops, w83627ehf_suspend, w83627ehf_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(w83627ehf_dev_pm_ops, w83627ehf_suspend, w83627ehf_resume);
 
 static struct platform_driver w83627ehf_driver = {
 	.driver = {
 		.name	= DRVNAME,
-		.pm	= &w83627ehf_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&w83627ehf_dev_pm_ops),
 	},
 };
 
-- 
2.37.2

