Return-Path: <SRS0=h1Ez=US=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B721C31E49
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jun 2019 08:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74F7D20823
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jun 2019 08:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731064AbfFSIrq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jun 2019 04:47:46 -0400
Received: from smtp.radiodata.biz ([116.203.112.52]:40105 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730418AbfFSIrq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jun 2019 04:47:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id F38493E8E7;
        Wed, 19 Jun 2019 10:47:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tWBkc41srDnj; Wed, 19 Jun 2019 10:47:36 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id 90B3D3E8E6;
        Wed, 19 Jun 2019 10:47:36 +0200 (CEST)
Received: from [192.168.2.213] (raphael-WINPC.radiodata.xx [192.168.2.213])
        by mail.radiodata.biz (Postfix) with ESMTPSA id 4E27820222;
        Wed, 19 Jun 2019 10:47:36 +0200 (CEST)
Subject: Re: [PATCH] Fix sysfs_notify and kobject_uevent in fan_alarm_notify
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Christian Schneider <christian@ch-sc.de>
References: <20190617093343.1366-1-cschneider@radiodata.biz>
 <20190617170422.GA13276@roeck-us.net>
From:   Christian Schneider <cschneider@radiodata.biz>
Message-ID: <e64607f6-d2d3-44a9-4e4b-90e5ab2d74ab@radiodata.biz>
Date:   Wed, 19 Jun 2019 10:47:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190617170422.GA13276@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,
unfrotunately I found a problem with my patch. It didn't appear on the 
devices, where I tested, only when distributing the patch to more 
devices, it occurs sometimes.

There is a possible race condition. In gpio_fan_probe, the IRQ handler 
for the fan alarm is registered before the hwmon_dev is initialised.
So it is possible, that the handler executes, while fandata->hwmon_dev 
is still unitialised and the handler runs in an invalid pointer dereference.

The obvious fix, moving the
/* Configure alarm GPIO if available. */
if (fan_data->alarm_gpio) {
	err = fan_alarm_init(fan_data);
	if (err)
		return err;
}
block after

/* Make this driver part of hwmon class. */
fan_data->hwmon_dev =
	devm_hwmon_device_register_with_groups(dev,
					       "gpio_fan", fan_data,
					       gpio_fan_groups);

doesn't work. Sysfs doesn't have a fan1_alarm attribute anymore then.

It is not yet clear to me, why creation of the attribute fails in this 
case. I need to investigate further.
In the meanwhile, please revert my patch.

I'm sorry for the disturbance I created....

BR, Christian


Am 17.06.2019 um 18:04 schrieb Guenter Roeck:
> On Mon, Jun 17, 2019 at 11:33:43AM +0200, cschneider@radiodata.biz wrote:
>> From: Christian Schneider <christian@ch-sc.de>
>>
>> sysfs_notify and kobject_uevent are passed the wrong kobject.
>> that why notifications can't be received and uevents have the wrong path.
>> this patch fixes this.
>>
>> Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
> 
> Applied.
> 
> In the future, please version your patches, add a change log,
> and reflect the subsystem and driver in the subject line.
> 
> Thanks,
> Guenter
> 
>> ---
>>   drivers/hwmon/gpio-fan.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
>> index 84753680a4e8..76377791ff0e 100644
>> --- a/drivers/hwmon/gpio-fan.c
>> +++ b/drivers/hwmon/gpio-fan.c
>> @@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
>>   	struct gpio_fan_data *fan_data =
>>   		container_of(ws, struct gpio_fan_data, alarm_work);
>>   
>> -	sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
>> -	kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
>> +	sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
>> +	kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
>>   }
>>   
>>   static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
