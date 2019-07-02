Return-Path: <SRS0=izHe=U7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB87C06513
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jul 2019 13:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 858EF206E0
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jul 2019 13:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfGBNYB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Jul 2019 09:24:01 -0400
Received: from smtp.radiodata.biz ([116.203.112.52]:43123 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbfGBNYA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Jul 2019 09:24:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id 9BB6A3E8E7;
        Tue,  2 Jul 2019 15:23:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oCMwPXskRp0G; Tue,  2 Jul 2019 15:23:50 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id E00093E8E5;
        Tue,  2 Jul 2019 15:23:50 +0200 (CEST)
Received: from localhost (unknown [192.168.2.97])
        by mail.radiodata.biz (Postfix) with ESMTPSA id 98949201A1;
        Tue,  2 Jul 2019 15:23:50 +0200 (CEST)
From:   cschneider@radiodata.biz
To:     linux-hwmon@vger.kernel.org
Cc:     christian@ch-sc.de, linux@roeck-us.net, cschneider@radiodata.biz
Subject: [PATCH 1/2] hwmon: gpio-fan: move fan_alarm_init after devm_hwmon_device_register_with_groups
Date:   Tue,  2 Jul 2019 15:23:37 +0200
Message-Id: <20190702132338.8856-1-cschneider@radiodata.biz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Christian Schneider <cschneider@radiodata.biz>

This makes it possible to use the hwmon_dev in fan_alarm_notify(). Otherwise
it would be possible, that a interupt arrives and fan_alarm_notify() is
executed, before hwmon_dev is initialized.

Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
---
 drivers/hwmon/gpio-fan.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 84753680a4e8..a962a9ee7225 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -510,13 +510,6 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fan_data);
 	mutex_init(&fan_data->lock);
 
-	/* Configure alarm GPIO if available. */
-	if (fan_data->alarm_gpio) {
-		err = fan_alarm_init(fan_data);
-		if (err)
-			return err;
-	}
-
 	/* Configure control GPIOs if available. */
 	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
@@ -535,6 +528,13 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	if (IS_ERR(fan_data->hwmon_dev))
 		return PTR_ERR(fan_data->hwmon_dev);
 
+	/* Configure alarm GPIO if available. */
+	if (fan_data->alarm_gpio) {
+		err = fan_alarm_init(fan_data);
+		if (err)
+			return err;
+	}
+
 	/* Optional cooling device register for Device tree platforms */
 	fan_data->cdev = devm_thermal_of_cooling_device_register(dev, np,
 				"gpio-fan", fan_data, &gpio_fan_cool_ops);
-- 
2.22.0

