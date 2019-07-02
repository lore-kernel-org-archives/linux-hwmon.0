Return-Path: <SRS0=izHe=U7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784F4C06513
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jul 2019 13:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59A18206E0
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jul 2019 13:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbfGBNYK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Jul 2019 09:24:10 -0400
Received: from smtp.radiodata.biz ([116.203.112.52]:53431 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfGBNYJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Jul 2019 09:24:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id 71C833E8E9;
        Tue,  2 Jul 2019 15:24:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id V7BHo_4B1Qwi; Tue,  2 Jul 2019 15:24:00 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id 9E6863E8E5;
        Tue,  2 Jul 2019 15:24:00 +0200 (CEST)
Received: from localhost (unknown [192.168.2.97])
        by mail.radiodata.biz (Postfix) with ESMTPSA id 5BF91201A1;
        Tue,  2 Jul 2019 15:24:00 +0200 (CEST)
From:   cschneider@radiodata.biz
To:     linux-hwmon@vger.kernel.org
Cc:     christian@ch-sc.de, linux@roeck-us.net, cschneider@radiodata.biz
Subject: [PATCH 2/2] hwmon: gpio-fan: fix sysfs notifications and udev events for gpio-fan alarms
Date:   Tue,  2 Jul 2019 15:23:38 +0200
Message-Id: <20190702132338.8856-2-cschneider@radiodata.biz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702132338.8856-1-cschneider@radiodata.biz>
References: <20190702132338.8856-1-cschneider@radiodata.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Christian Schneider <cschneider@radiodata.biz>

sysfs_notify() and kobject_uevent() are passed the wrong device.
fan_data->hwmon_dev needs to be passed, so that sysfs notification
goes to right place and generated uevent has the right information

Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
---
 drivers/hwmon/gpio-fan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index a962a9ee7225..36bca2d75e0f 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
 	struct gpio_fan_data *fan_data =
 		container_of(ws, struct gpio_fan_data, alarm_work);
 
-	sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
-	kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
+	sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
+	kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
 }
 
 static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
-- 
2.22.0

