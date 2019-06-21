Return-Path: <SRS0=Sbn2=UU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120FAC43613
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jun 2019 08:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E42CA206BA
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jun 2019 08:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfFUIbE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jun 2019 04:31:04 -0400
Received: from smtp.radiodata.biz ([116.203.112.52]:35897 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbfFUIbE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jun 2019 04:31:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id 811F73E8E7;
        Fri, 21 Jun 2019 10:31:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id D-rL4qcOdQq7; Fri, 21 Jun 2019 10:30:53 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id 702783E8E6;
        Fri, 21 Jun 2019 10:30:53 +0200 (CEST)
Received: from [192.168.2.213] (raphael-WINPC.radiodata.xx [192.168.2.213])
        by mail.radiodata.biz (Postfix) with ESMTPSA id 275CF2011A;
        Fri, 21 Jun 2019 10:30:53 +0200 (CEST)
Subject: Re: [PATCH] Fix sysfs_notify and kobject_uevent in fan_alarm_notify
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Christian Schneider <christian@ch-sc.de>
References: <20190617093343.1366-1-cschneider@radiodata.biz>
 <20190617170422.GA13276@roeck-us.net>
 <e64607f6-d2d3-44a9-4e4b-90e5ab2d74ab@radiodata.biz>
 <dfa89854-8784-6d7a-9abe-06914791de32@radiodata.biz>
 <20190619195354.GA29429@roeck-us.net>
From:   Christian Schneider <cschneider@radiodata.biz>
Message-ID: <c97f4c9c-a374-8a25-27ee-698689f525ce@radiodata.biz>
Date:   Fri, 21 Jun 2019 10:30:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619195354.GA29429@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 19.06.2019 um 20:53 schrieb Guenter Roeck:
> On Wed, Jun 19, 2019 at 12:00:37PM +0200, Christian Schneider wrote:
>> Ok, seems that moving that block, where fan_alarm_init is called down, isn't
>> a problem on master.
>> I need to use 4.9, cause we have an embedded device that needs patches, and
>> they are only available for older kernels.
>>
>> In 4.9, fan_alarm_init() does fan_data->alarm = alarm;
>> When fan_alarm_init() is called after
>> devm_hwmon_device_register_with_groups(), then fan_data->alarm is not yet
>> set, so the sysfs attribute is not created.
>>
>> when I move the fan_data->alarm = alarm; out of fan_alarm_init() before
>> devm_hwmon_device_register_with_groups() and the fan_alarm_init() after,
>> then it works, and doesn't have a race condition.
>>
>> On master, populating fan_data->alarm_gpio is done in
>> gpio_fan_get_of_data(fan_data); as far as I understand, so moving the
>> fan_alarm_init() block further down shouldn't be a problem.
>>
>> I don't know, how I can test this with master kernel. Unfortunately, the
>> device, I'm using doesn't have a recent kernel. And on my normal (desktop)
>> pc, I don't have a gpio fan.
>> How should I proceed now?
>>
> 
> Essentially, we'll need two patches: One to move fan_alarm_init() after
> devm_hwmon_device_register_with_groups(), and then the notification patch.
> For the backport to v4.9, the first patch will have to be slightly modified:
> The first part will a simple
> 	fan_data->alarm = pdata->alarm;
> at the location where fan_alarm_init() is called now, the second part is to move
> the call to fan_alarm_init() after devm_hwmon_device_register_with_groups().
> 
> It is ok to test the result with your 4.9 based kernel; we'll just have to be
> careful when reviewing the mainline patch.
> 
> Thanks,
> Guenter

Ok,
it seems like it is working as expected now on my 4.9 kernel. No 
race-condition and notification is received.
I will adopt the changes to mainline kernel, but not sure if I can make 
it today. Might be Monday, till I have the patch.

BR, Christian

> 
>>
>> BR, Christian
>>
>> Am 19.06.2019 um 09:47 schrieb Christian Schneider:
>>> Hi,
>>> unfrotunately I found a problem with my patch. It didn't appear on the
>>> devices, where I tested, only when distributing the patch to more devices,
>>> it occurs sometimes.
>>>
>>> There is a possible race condition. In gpio_fan_probe, the IRQ handler for
>>> the fan alarm is registered before the hwmon_dev is initialised.
>>> So it is possible, that the handler executes, while fandata->hwmon_dev is
>>> still unitialised and the handler runs in an invalid pointer dereference.
>>>
>>> The obvious fix, moving the
>>> /* Configure alarm GPIO if available. */
>>> if (fan_data->alarm_gpio) {
>>>      err = fan_alarm_init(fan_data);
>>>      if (err)
>>>          return err;
>>> }
>>> block after
>>>
>>> /* Make this driver part of hwmon class. */
>>> fan_data->hwmon_dev =
>>>      devm_hwmon_device_register_with_groups(dev,
>>>                             "gpio_fan", fan_data,
>>>                             gpio_fan_groups);
>>>
>>> doesn't work. Sysfs doesn't have a fan1_alarm attribute anymore then.
>>>
>>> It is not yet clear to me, why creation of the attribute fails in this
>>> case. I need to investigate further.
>>> In the meanwhile, please revert my patch.
>>>
>>> I'm sorry for the disturbance I created....
>>>
>>> BR, Christian
>>>
>>>
>>> Am 17.06.2019 um 18:04 schrieb Guenter Roeck:
>>>> On Mon, Jun 17, 2019 at 11:33:43AM +0200, cschneider@radiodata.biz wrote:
>>>>> From: Christian Schneider <christian@ch-sc.de>
>>>>>
>>>>> sysfs_notify and kobject_uevent are passed the wrong kobject.
>>>>> that why notifications can't be received and uevents have the wrong
>>>>> path.
>>>>> this patch fixes this.
>>>>>
>>>>> Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
>>>>
>>>> Applied.
>>>>
>>>> In the future, please version your patches, add a change log,
>>>> and reflect the subsystem and driver in the subject line.
>>>>
>>>> Thanks,
>>>> Guenter
>>>>
>>>>> ---
>>>>>    drivers/hwmon/gpio-fan.c | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
>>>>> index 84753680a4e8..76377791ff0e 100644
>>>>> --- a/drivers/hwmon/gpio-fan.c
>>>>> +++ b/drivers/hwmon/gpio-fan.c
>>>>> @@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
>>>>>        struct gpio_fan_data *fan_data =
>>>>>            container_of(ws, struct gpio_fan_data, alarm_work);
>>>>> -    sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
>>>>> -    kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
>>>>> +    sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
>>>>> +    kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
>>>>>    }
>>>>>    static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
