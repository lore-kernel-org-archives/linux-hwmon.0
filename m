Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8C3C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbiIYRa1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232770AbiIYRa0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FD528712
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 921F0614F3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41C6C433C1;
        Sun, 25 Sep 2022 17:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127024;
        bh=xQO5Ol4D2yOlu2yUhafnHBfqvXcDNSfSPwc3AeZZOy8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qavarunn2eJlWeKhzidAr07bejW6rz5Mg4tYiOzzr1s3oXEiG4ps/TCUjGID+t51x
         iOOYvb2hI16U1mw5OR/WbCvW2haqQ6VA8Bx6W4M6SUgCtefr9FOyCAUZuMJC+AZVdz
         rPzDA03HE3qAvF+YNp+JRS4daFyKaYH0PcEge1IqbzXZjCKm3Cmx0t/p0/Y3Q3n/zN
         D+zR9IGlB8zciafYkh2/9qc9uOeWoOG3Krdo/B4QkgImChVpAOS9yTBmmdkK57yiSJ
         zdDAG0AJgcmzmW4tArsQnNg1JCAj2C7b0ZMINU7FNSbcjIr6rYaX9338Qe5oFWDUQT
         diSxKWQ67pKPQ==
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
Subject: [PATCH 14/18] hwmon: (tmp102) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:55 +0100
Message-Id: <20220925172759.3573439-15-jic23@kernel.org>
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
---
 drivers/hwmon/tmp102.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index e867a0c2e539..2bf496a62206 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -260,7 +260,6 @@ static int tmp102_probe(struct i2c_client *client)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int tmp102_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -283,9 +282,8 @@ static int tmp102_resume(struct device *dev)
 
 	return err;
 }
-#endif /* CONFIG_PM */
 
-static SIMPLE_DEV_PM_OPS(tmp102_dev_pm_ops, tmp102_suspend, tmp102_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tmp102_dev_pm_ops, tmp102_suspend, tmp102_resume);
 
 static const struct i2c_device_id tmp102_id[] = {
 	{ "tmp102", 0 },
@@ -302,7 +300,7 @@ MODULE_DEVICE_TABLE(of, tmp102_of_match);
 static struct i2c_driver tmp102_driver = {
 	.driver.name	= DRIVER_NAME,
 	.driver.of_match_table = of_match_ptr(tmp102_of_match),
-	.driver.pm	= &tmp102_dev_pm_ops,
+	.driver.pm	= pm_sleep_ptr(&tmp102_dev_pm_ops),
 	.probe_new	= tmp102_probe,
 	.id_table	= tmp102_id,
 };
-- 
2.37.2

