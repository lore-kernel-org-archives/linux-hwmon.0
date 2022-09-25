Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A216EC6FA82
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbiIYRaT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbiIYRaS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533642182B
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C354B614F3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23FFC433D6;
        Sun, 25 Sep 2022 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127016;
        bh=gOO0EmLnme3sUtILSsI4WKvOsYnbjS7ZhnDDnsRutjc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jxj0sjq8Q/OaVNaQmMp/lcYpItIa8ev9DdT9N0sT2JE8f4CkZHU7Vxzg4LsUdiuRo
         N9rQMNeS4U4gJKet+RlkpzCxysMz9KMXJIf1cuRhiTouBhq/OR3wd90tGgPX9OAgET
         VBXaMhh/2XWF99yeaOKLjwattD3IDD9cnmMtvjq85ZusWMy6bqRH/9DzQ/QhYBhGhj
         qNetiyJxQZyUnxcTEDl0pE30qiZF/BNqYjnbDbJnNvSzv/MaJ0Pf59kS0JgMxObLu2
         5/R4xSniOVb4380MAQ9ILYZ5N2bHRugJ7ddR2AStRO9mN6BMFggBXODbg2HkwnxZtE
         DapJ9J8KAFUdQ==
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
Subject: [PATCH 12/18] hwmon: (nct6775) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:53 +0100
Message-Id: <20220925172759.3573439-13-jic23@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220925172759.3573439-1-jic23@kernel.org>
References: <20220925172759.3573439-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

These newer PM macros allow the compiler to see what code it can remove
if !CONFIG_PM_SLEEP. This allows the removal of __maybe_unused markings
whilst achieving the same result.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Zoltán Kővágó <dirty.ice.hu@gmail.com>
---
 drivers/hwmon/nct6775-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index 41c97cfacfb8..b34783784213 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -355,7 +355,7 @@ static void nct6791_enable_io_mapping(struct nct6775_sio_data *sio_data)
 	}
 }
 
-static int __maybe_unused nct6775_suspend(struct device *dev)
+static int nct6775_suspend(struct device *dev)
 {
 	int err;
 	u16 tmp;
@@ -386,7 +386,7 @@ static int __maybe_unused nct6775_suspend(struct device *dev)
 	return err;
 }
 
-static int __maybe_unused nct6775_resume(struct device *dev)
+static int nct6775_resume(struct device *dev)
 {
 	struct nct6775_data *data = dev_get_drvdata(dev);
 	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
@@ -467,7 +467,7 @@ static int __maybe_unused nct6775_resume(struct device *dev)
 	return err;
 }
 
-static SIMPLE_DEV_PM_OPS(nct6775_dev_pm_ops, nct6775_suspend, nct6775_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(nct6775_dev_pm_ops, nct6775_suspend, nct6775_resume);
 
 static void
 nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio_data)
@@ -934,7 +934,7 @@ static int nct6775_platform_probe(struct platform_device *pdev)
 static struct platform_driver nct6775_driver = {
 	.driver = {
 		.name	= DRVNAME,
-		.pm	= &nct6775_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&nct6775_dev_pm_ops),
 	},
 	.probe		= nct6775_platform_probe,
 };
-- 
2.37.2

