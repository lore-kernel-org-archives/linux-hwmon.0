Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A2D1A0B08;
	Fri, 20 Dec 2024 06:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734674442; cv=none; b=c2ihAgZkKeihI6yBZS0ss9B9QApgRkBFqEjtVU7fAH4I6rsWqcH7EXSOZHkorairyWBcIl/CgKXg+fXE1Mw6wz7mYI0g8n3JFg/a9Vo/RkPxdvBmDz9LY3Xz0l+hmJ/Ix7MRQZzbfMbsLJSjhVfEaalX56NReg4MOjAiC8tmM3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734674442; c=relaxed/simple;
	bh=IY8Is6wleJJFSkkVnhp9euj6uUbmllDSBbYW0KxCQS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GI4NclkKCPzZhMykWhHfYDtSafn6qo1sZZT8Ao366x4V4oRmXzHFm0/Ri7q+pcWW7znu7J+2tNjOLH6v5kde0wQ97G7voWgHYjlQgcF6Cd4IWo0gX9j0lH+jH3dyZL5nuF1j+653iRWhgBSS6GqQ/Ndnq3bH+L50LysTcESSW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YDxXn6mtfzhZVF;
	Fri, 20 Dec 2024 13:58:01 +0800 (CST)
Received: from dggemv703-chm.china.huawei.com (unknown [10.3.19.46])
	by mail.maildlp.com (Postfix) with ESMTPS id 16BB9180A9E;
	Fri, 20 Dec 2024 14:00:36 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Dec 2024 14:00:35 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Dec
 2024 14:00:35 +0800
Message-ID: <97995e3f-edd2-e93a-0752-bbbee5a878a2@huawei.com>
Date: Fri, 20 Dec 2024 14:00:34 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 1/4] hwmon: (acpi_power_meter) Fix using uninitialized
 variables
To: Guenter Roeck <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <jdelvare@suse.com>, <liuyonglong@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>
References: <20241125093415.21719-1-lihuisong@huawei.com>
 <20241125093415.21719-2-lihuisong@huawei.com>
 <aa6e1c02-b8bf-4d25-ad21-2018af72e16f@roeck-us.net>
 <b801388b-6bc7-5e96-dd29-e68ed8c970df@huawei.com>
 <f9fc4989-f416-4d88-bc3e-ab7b9fddb4d9@roeck-us.net>
 <c66d312a-098a-84d3-0895-02d78ae3ecc9@huawei.com>
 <77fce1aa-96eb-4c3c-ab0a-a33de46b333b@roeck-us.net>
 <87367d88-b10e-29d6-2712-f8f5c24e52a4@huawei.com>
 <1ce7718c-0bf8-4009-9240-fc6e2363ed54@roeck-us.net>
 <2068a450-7752-c47b-edfc-cb2a00ac4402@huawei.com>
 <b2ea68c5-2bcb-3d3a-565a-94a35a48629e@huawei.com>
 <f1999b7b-312c-4bc5-96f2-a14ce4ae241f@roeck-us.net>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <f1999b7b-312c-4bc5-96f2-a14ce4ae241f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2024/12/19 11:50, Guenter Roeck 写道:
> On 12/18/24 19:45, lihuisong (C) wrote:
>>
>> 在 2024/12/12 11:00, lihuisong (C) 写道:
>>>
>>> 在 2024/12/12 9:51, Guenter Roeck 写道:
>>>> On 11/26/24 19:43, lihuisong (C) wrote:
>>>>> Hi Guenter，
>>>>>
>>>>> How about the modification as below? But driver doesn't know what 
>>>>> the time is to set resource->power_alarm to false.
>>>>>
>>>> It's a start, but incomplete because power_alarm must be reset.
>>>>
>>>> See below.
>>>>
>>>>> 在 2024/11/27 0:19, Guenter Roeck 写道:
>>>>>> On 11/25/24 23:03, lihuisong (C) wrote:
>>>>>>>
>>>>>>> 在 2024/11/26 12:04, Guenter Roeck 写道:
>>>>>>>> On 11/25/24 17:56, lihuisong (C) wrote:
>>>>>>>>> Hi Guente,
>>>>>>>>>
>>>>>>>>> Thanks for your timely review.
>>>>>>>>>
>>>>>>>>> 在 2024/11/26 0:03, Guenter Roeck 写道:
>>>>>>>>>> On 11/25/24 01:34, Huisong Li wrote:
>>>>>>>>>>> The 'power1_alarm' attribute uses the 'power' and 'cap' in the
>>>>>>>>>>> acpi_power_meter_resource structure. However, these two 
>>>>>>>>>>> fields are just
>>>>>>>>>>> updated when user query 'power' and 'cap' attribute, or 
>>>>>>>>>>> hardware enforced
>>>>>>>>>>> limit. If user directly query the 'power1_alarm' attribute 
>>>>>>>>>>> without queryng
>>>>>>>>>>> above two attributes, driver will use the uninitialized 
>>>>>>>>>>> variables to judge.
>>>>>>>>>>> In addition, the 'power1_alarm' attribute needs to update 
>>>>>>>>>>> power and cap to
>>>>>>>>>>> show the real state.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>>>>>>>>>>> ---
>>>>>>>>>>>   drivers/hwmon/acpi_power_meter.c | 10 ++++++++++
>>>>>>>>>>>   1 file changed, 10 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/hwmon/acpi_power_meter.c 
>>>>>>>>>>> b/drivers/hwmon/acpi_power_meter.c
>>>>>>>>>>> index 2f1c9d97ad21..4c3314e35d30 100644
>>>>>>>>>>> --- a/drivers/hwmon/acpi_power_meter.c
>>>>>>>>>>> +++ b/drivers/hwmon/acpi_power_meter.c
>>>>>>>>>>> @@ -396,6 +396,9 @@ static ssize_t show_val(struct device *dev,
>>>>>>>>>>>       struct acpi_device *acpi_dev = to_acpi_device(dev);
>>>>>>>>>>>       struct acpi_power_meter_resource *resource = 
>>>>>>>>>>> acpi_dev->driver_data;
>>>>>>>>>>>       u64 val = 0;
>>>>>>>>>>> +    int ret;
>>>>>>>>>>> +
>>>>>>>>>>> +    guard(mutex)(&resource->lock);
>>>>>>>>>>>         switch (attr->index) {
>>>>>>>>>>>       case 0:
>>>>>>>>>>> @@ -423,6 +426,13 @@ static ssize_t show_val(struct device 
>>>>>>>>>>> *dev,
>>>>>>>>>>>               val = 0;
>>>>>>>>>>>           break;
>>>>>>>>>>>       case 6:
>>>>>>>>>>> +        ret = update_meter(resource);
>>>>>>>>>>> +        if (ret)
>>>>>>>>>>> +            return ret;
>>>>>>>>>>> +        ret = update_cap(resource);
>>>>>>>>>>> +        if (ret)
>>>>>>>>>>> +            return ret;
>>>>>>>>>>> +
>>>>>>>>>>>           if (resource->power > resource->cap)
>>>>>>>>>>>               val = 1;
>>>>>>>>>>>           else
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> While technically correct, the implementation of this 
>>>>>>>>>> attribute defeats its
>>>>>>>>>> purpose. It is supposed to reflect the current status as 
>>>>>>>>>> reported by the
>>>>>>>>>> hardware. A real fix would be to use the associated 
>>>>>>>>>> notification to set or
>>>>>>>>>> reset a status flag, and to report the current value of that 
>>>>>>>>>> flag as reported
>>>>>>>>>> by the hardware.
>>>>>>>>> I know what you mean.
>>>>>>>>> The Notify(power_meter, 0x83) is supposed to meet your 
>>>>>>>>> proposal IIUC.
>>>>>>>>> It's good, but it depands on hardware support notification.
>>>>>>>>>>
>>>>>>>>>> If there is no notification support, the attribute should not 
>>>>>>>>>> even exist,
>>>>>>>>>> unless there is a means to retrieve its value from ACPI (the 
>>>>>>>>>> status itself,
>>>>>>>>>> not by comparing temperature values).
>>>>>>>>> Currently, the 'power1_alarm' attribute is created just when 
>>>>>>>>> platform support the power meter meassurement(bit0 of the 
>>>>>>>>> supported capabilities in _PMC).
>>>>>>>>> And it doesn't see if the platform support notifications.
>>>>>>>>>  From the current implementation of this driver, this sysfs 
>>>>>>>>> can also reflect the status by comparing power and cap,
>>>>>>>>> which is good to the platform that support hardware limit from 
>>>>>>>>> some out-of-band mechanism but doesn't support any notification.
>>>>>>>>>
>>>>>>>>
>>>>>>>> The point is that this can also be done from userspace. 
>>>>>>>> Hardware monitoring drivers
>>>>>>>> are supposed to provide hardware attributes, not software 
>>>>>>>> attributes derived from it.
>>>>>>>>
>>>>>>> So this 'power1_alarm' attribute can be exposed when platform 
>>>>>>> supports hardware enforced limit and notifcations when the 
>>>>>>> hardware limit is enforced, right?
>>>>>>> If so, we have to change the condition that driver creates this 
>>>>>>> sysfs interface.
>>>>>>
>>>>>> This isn't about enforcing anything, it is about reporting an alarm
>>>>>> if the power consumed exceeds the maximum configured.
>>>>>>
>>>>> -->
>>>>>
>>>>> index 2f1c9d97ad21..b436ebd863e6
>>>>> --- a/drivers/hwmon/acpi_power_meter.c
>>>>> +++ b/drivers/hwmon/acpi_power_meter.c
>>>>> @@ -84,6 +84,7 @@ struct acpi_power_meter_resource {
>>>>>          u64             power;
>>>>>          u64             cap;
>>>>>          u64             avg_interval;
>>>>> +       bool            power_alarm;
>>>>>          int                     sensors_valid;
>>>>>          unsigned long           sensors_last_updated;
>>>>>          struct sensor_device_attribute sensors[NUM_SENSORS];
>>>>> @@ -396,6 +397,9 @@ static ssize_t show_val(struct device *dev,
>>>>>          struct acpi_device *acpi_dev = to_acpi_device(dev);
>>>>>          struct acpi_power_meter_resource *resource = 
>>>>> acpi_dev->driver_data;
>>>>>          u64 val = 0;
>>>>> +       int ret;
>>>>> +
>>>>> +       guard(mutex)(&resource->lock);
>>>>>
>>>>>          switch (attr->index) {
>>>>>          case 0:
>>>>> @@ -423,10 +427,21 @@ static ssize_t show_val(struct device *dev,
>>>>>                          val = 0;
>>>>>                  break;
>>>>>          case 6:
>>>>> -               if (resource->power > resource->cap)
>>>>> -                       val = 1;
>>>>> -               else
>>>>> -                       val = 0;
>>>>> +               /* report alarm status based on the notification 
>>>>> if support. */
>>>>> +               if (resource->caps.flags & POWER_METER_CAN_NOTIFY) {
>>>>> +                       val = resource->power_alarm;
>>>>> +               } else {
>>>>> +                       ret = update_meter(resource);
>>>>> +                       if (ret)
>>>>> +                               return ret;
>>>>> +                       ret = update_cap(resource);
>>>>> +                       if (ret)
>>>>> +                               return ret;
>>>>> +                       if (resource->power > resource->cap)
>>>>> +                               val = 1;
>>>>> +                       else
>>>>> +                               val = 0;
>>>>> +               }
>>>>
>>>> It would have to be something like
>>>>
>>>>         ret = update_meter(resource);
>>>>         if (ret)
>>>>             return ret;
>>>>
>>>>         val = resource->power_alarm || resource->power > 
>>>> resource->cap;
>>>>         /* clear alarm if no longer active */
>>>>         resource->power_alarm &= resource->power > resource->cap;
>>>>
>>>> This ensures that alarms are cached if supported, and that cached 
>>>> values are
>>>> reported at once. It is far from perfect but the best I can think 
>>>> of since
>>>> there is no notification that the alarm is cleared.
>>>>
>>> Indeed, since there is no notification that the alarm is cleared, 
>>> driver have to compare 'power' and 'cap' to clear it anyway.
>>> If platform support notify to OSPM, driver also need to update 
>>> 'power' to show this alarm status.
>>> In this case, no need to update 'cap' which can be updated by nofity 
>>> 0x82 event, right? But this also depands on the initialization of 
>>> the "resource->cap" the probe phase needs to add.
>>> For the platform doesn't support notify, driver have to update 'cap' 
>>> and 'power' to show this status, right?
>>>
>>> But considering above two cases, directly to update 'power' and 
>>> 'cap' is simple to handle this without more switch case.
>>> what do you think, Guenter?
>>
>> Hi Guenter,
>>
>> What do you think? Looking forward to your reply.😁
>>
>
> This is getting too complicated for a reply after a casual glance at 
> the driver,
> and I don't currently have time for a deeper look into the driver, sorry.
All right. Thanks for your review and advice. We want to make it more 
useful.
I will send out v2 first based on our discussion and my understanding.
>
> Guenter
>
>> /Huisong Li
>>
>>>>
>>>>>                  break;
>>>>>          case 7:
>>>>>          case 8:
>>>>> @@ -853,6 +868,7 @@ static void acpi_power_meter_notify(struct 
>>>>> acpi_device *device, u32 event)
>>>>>                  sysfs_notify(&device->dev.kobj, NULL, 
>>>>> POWER_AVG_INTERVAL_NAME);
>>>>>                  break;
>>>>>          case METER_NOTIFY_CAPPING:
>>>>> +               resource->power_alarm = true;
>>>>>                  sysfs_notify(&device->dev.kobj, NULL, 
>>>>> POWER_ALARM_NAME);
>>>>>                  dev_info(&device->dev, "Capping in progress.\n");
>>>>>                  break;
>>>>>
>>>>>> .
>>>>>
>>>>
>>>>
>>>> .
>>>
>>> .
>
> .
