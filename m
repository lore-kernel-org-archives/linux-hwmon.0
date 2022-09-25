Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C48C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbiIYRaO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbiIYRaF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1D8178A9
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8BB4AB80682
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C2BC433C1;
        Sun, 25 Sep 2022 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127001;
        bh=pkSIsmB94NCXe1l9JmhDKpuUYsLhipQdkUdQTiBi9c8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e9kQEU7ayZOl6aP09emB+05jmxunC5q/3O0ySaLIkQztEjsiW8AZ4qHuDhl6R/6PV
         edCJHyC40elbhd60QNAhOYvpqEvx91BOcqIfe7KLhmw+Wll59xwMSgFUZRlc47W9DJ
         K38jiQFebjo3iF2QMJrK82Z042FOgg+Hb/y/wGa/w/aUp/CJwG5UMqxjtxejbk9YBZ
         D45vsJTzIgUBt1zwmE/J9KGs2OK/M6pdU6n1F2qV64IusA0hA4Gt5o9+EzGGO3NSy4
         hUcw8+tczBpFbFIKYqhhe48pEGNp5hno5hCjYKlEQGl4sbg2Kya7EGGpIW24baMgW8
         uo2/IqThqFK+g==
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
Subject: [PATCH 08/18] hwmon: (ltc2947) Switch to EXPORT_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:49 +0100
Message-Id: <20220925172759.3573439-9-jic23@kernel.org>
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
whilst achieving the same result. In this case it also lets the
structure itself be removed.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/ltc2947-core.c | 7 +++----
 drivers/hwmon/ltc2947-i2c.c  | 2 +-
 drivers/hwmon/ltc2947-spi.c  | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
index 626f5bf2c9c7..7404e974762f 100644
--- a/drivers/hwmon/ltc2947-core.c
+++ b/drivers/hwmon/ltc2947-core.c
@@ -1120,7 +1120,7 @@ int ltc2947_core_probe(struct regmap *map, const char *name)
 }
 EXPORT_SYMBOL_GPL(ltc2947_core_probe);
 
-static int __maybe_unused ltc2947_resume(struct device *dev)
+static int ltc2947_resume(struct device *dev)
 {
 	struct ltc2947_data *st = dev_get_drvdata(dev);
 	u32 ctrl = 0;
@@ -1149,7 +1149,7 @@ static int __maybe_unused ltc2947_resume(struct device *dev)
 				  LTC2947_CONT_MODE_MASK, LTC2947_CONT_MODE(1));
 }
 
-static int __maybe_unused ltc2947_suspend(struct device *dev)
+static int ltc2947_suspend(struct device *dev)
 {
 	struct ltc2947_data *st = dev_get_drvdata(dev);
 
@@ -1157,8 +1157,7 @@ static int __maybe_unused ltc2947_suspend(struct device *dev)
 				  LTC2947_SHUTDOWN_MASK, 1);
 }
 
-SIMPLE_DEV_PM_OPS(ltc2947_pm_ops, ltc2947_suspend, ltc2947_resume);
-EXPORT_SYMBOL_GPL(ltc2947_pm_ops);
+EXPORT_SIMPLE_DEV_PM_OPS(ltc2947_pm_ops, ltc2947_suspend, ltc2947_resume);
 
 const struct of_device_id ltc2947_of_match[] = {
 	{ .compatible = "adi,ltc2947" },
diff --git a/drivers/hwmon/ltc2947-i2c.c b/drivers/hwmon/ltc2947-i2c.c
index ad0dfd3efbf8..96852bc8a964 100644
--- a/drivers/hwmon/ltc2947-i2c.c
+++ b/drivers/hwmon/ltc2947-i2c.c
@@ -36,7 +36,7 @@ static struct i2c_driver ltc2947_driver = {
 	.driver = {
 		.name = "ltc2947",
 		.of_match_table = ltc2947_of_match,
-		.pm = &ltc2947_pm_ops,
+		.pm = pm_sleep_ptr(&ltc2947_pm_ops),
 	},
 	.probe_new = ltc2947_probe,
 	.id_table = ltc2947_id,
diff --git a/drivers/hwmon/ltc2947-spi.c b/drivers/hwmon/ltc2947-spi.c
index c24ca569db1b..a33be110098c 100644
--- a/drivers/hwmon/ltc2947-spi.c
+++ b/drivers/hwmon/ltc2947-spi.c
@@ -38,7 +38,7 @@ static struct spi_driver ltc2947_driver = {
 	.driver = {
 		.name = "ltc2947",
 		.of_match_table = ltc2947_of_match,
-		.pm = &ltc2947_pm_ops,
+		.pm = pm_sleep_ptr(&ltc2947_pm_ops),
 	},
 	.probe = ltc2947_probe,
 	.id_table = ltc2947_id,
-- 
2.37.2

