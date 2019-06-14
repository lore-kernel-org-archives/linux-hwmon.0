Return-Path: <SRS0=etf3=UN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230FFC31E4B
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 14:17:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFDDD21721
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 14:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbfFNORG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jun 2019 10:17:06 -0400
Received: from smtp.radiodata.biz ([116.203.112.52]:53659 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbfFNORG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jun 2019 10:17:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id A5BAE3E8E7;
        Fri, 14 Jun 2019 16:17:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kBRGNska-F2Q; Fri, 14 Jun 2019 16:16:56 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id 7C6963E8E6;
        Fri, 14 Jun 2019 16:16:56 +0200 (CEST)
Received: from [192.168.2.213] (raphael-WINPC.radiodata.xx [192.168.2.213])
        by mail.radiodata.biz (Postfix) with ESMTPSA id 2FA9D20264;
        Fri, 14 Jun 2019 16:16:56 +0200 (CEST)
Subject: Re: [PATCH] hwmon, gpio-fan: fix that sysfs_notify in void
 fan_alarm_notify is not received in userspace
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <e9dbbefb-7714-921b-c5d1-4064d8c43f74@radiodata.biz>
 <2680453b-9631-3cb9-06c4-326d63e93988@roeck-us.net>
From:   Christian Schneider <cschneider@radiodata.biz>
Message-ID: <178c4302-3333-b60f-afbd-ff73fbe943ca@radiodata.biz>
Date:   Fri, 14 Jun 2019 16:16:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2680453b-9631-3cb9-06c4-326d63e93988@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 14.06.2019 um 15:05 schrieb Guenter Roeck:
> On 6/14/19 6:52 AM, Christian Schneider wrote:
>> From: Christian Schneider <cschneider@radiodata.biz>
>>    To: linux-hwmon
> 
> The above should not be part of the e-mail body.
> 
>> Alarms on gpio-fan can't be received from sysfs_notify, because the 
>> wrong kobject is passed.
>> This patch fixes this.
> 
> Empty line here please.
> 
>> Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
>> ---
>> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
>> index 84753680a4e8..5f3a35db18a1 100644
>> --- a/drivers/hwmon/gpio-fan.c
>> +++ b/drivers/hwmon/gpio-fan.c
>> @@ -54,7 +54,7 @@ static void fan_alarm_notify(struct work_struct *ws)
>>          struct gpio_fan_data *fan_data =
>>                  container_of(ws, struct gpio_fan_data, alarm_work);
>>
>> -       sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
>> +       sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
>>          kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
>>   }
>>
> You'll want to make the same change for kobject_uevent().

Actually, uevents are send and can be received as is. I have tried 
changing the kobject for kobject_uevent(), too, and only the content of 
the uevent changes.
Since I don't know what would be the "right" one, I left it as is.
If you say, that it would be correct with the hwmon_dev kobject, I'll 
add this to the patch.

> 
> Thanks,
> Guenter
