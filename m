Return-Path: <SRS0=etf3=UN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B21BC31E4B
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 15:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 515572173C
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 15:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfFNPfz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jun 2019 11:35:55 -0400
Received: from smtp.radiodata.biz ([116.203.112.52]:39271 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfFNPfy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jun 2019 11:35:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id 4B4363E8E7;
        Fri, 14 Jun 2019 17:35:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id m8kZQTfT285D; Fri, 14 Jun 2019 17:35:44 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id D767E3E8E6;
        Fri, 14 Jun 2019 17:35:44 +0200 (CEST)
Received: from [192.168.2.213] (raphael-WINPC.radiodata.xx [192.168.2.213])
        by mail.radiodata.biz (Postfix) with ESMTPSA id 6D3E820264;
        Fri, 14 Jun 2019 17:35:44 +0200 (CEST)
Subject: [PATCHv2] hwmon, gpio-fan: fix that sysfs_notify in void
 fan_alarm_notify is not received in userspace
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
References: <e9dbbefb-7714-921b-c5d1-4064d8c43f74@radiodata.biz>
 <2680453b-9631-3cb9-06c4-326d63e93988@roeck-us.net>
 <178c4302-3333-b60f-afbd-ff73fbe943ca@radiodata.biz>
 <20190614145256.GA464@roeck-us.net>
From:   Christian Schneider <cschneider@radiodata.biz>
Message-ID: <e5390907-9112-4aca-e2e8-acf4097bf941@radiodata.biz>
Date:   Fri, 14 Jun 2019 17:35:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614145256.GA464@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Alarms on gpio-fan can't be received from sysfs_notify, because the 
wrong kobject is passed.
This patch fixes this.

Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
---
diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 84753680a4e8..76377791ff0e 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
         struct gpio_fan_data *fan_data =
                 container_of(ws, struct gpio_fan_data, alarm_work);

-       sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
-       kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
+       sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
+       kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
  }

  static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
