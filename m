Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C27C79F5;
	Thu,  9 Jan 2025 01:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386100; cv=none; b=Wwo1QnZgwAEOlrc0tg+qveoz37VxjDNhh6FLfLwm0v17tOASpToH55+Yp78F7ctZ6dHad8me2ROxXGZVb9i9EAfPKfC9FzxEBd2pzCH2or7ESOegWk41PInOrvrH1kID6Z6TNAgOtqUMsX/jN3NNHlxfFlY/gEljaV3pmrzc7+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386100; c=relaxed/simple;
	bh=qyHox4WveX69RdWPh5w2iOEt9ZvhQTx1khSkg7bGnmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TzIl5+48n4t1Z51wUE7ybjI0+JOpdJvEG3Jo8PYSUMOuoP6eSVPzQf7JgwbDBiGiWf+RYkbrrR4LkAUv0XGxuEKxWKmYSSQUd1/UlHMVHhuCE9hTooj9OUgDDXJty/O6bSnKORRhndv053utdR1T22zrrOwJ8B8U2FScHArWOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YT6Xj3R6fz1kxtR;
	Thu,  9 Jan 2025 09:25:09 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C7A4180214;
	Thu,  9 Jan 2025 09:28:11 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 9 Jan 2025 09:28:11 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 9 Jan
 2025 09:28:10 +0800
Message-ID: <d1d2382f-f618-a318-579e-8318057fbf15@huawei.com>
Date: Thu, 9 Jan 2025 09:27:24 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/3] hwmon: (acpi_power_meter) Fix uninitialized
 variables
To: Guenter Roeck <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <jdelvare@suse.com>,
	<liuyonglong@huawei.com>, <zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>
References: <20250107113330.7970-1-lihuisong@huawei.com>
 <20250107113330.7970-2-lihuisong@huawei.com>
 <dfa0e28b-d25c-4170-958c-d5e8f5cbea39@roeck-us.net>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <dfa0e28b-d25c-4170-958c-d5e8f5cbea39@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2025/1/8 22:45, Guenter Roeck 写道:
> On 1/7/25 03:33, Huisong Li wrote:
>> The 'power1_alarm' attribute uses the 'power' and 'cap' in the
>> acpi_power_meter_resource structure. Currently, these two fields are 
>> just
>> updated when user query 'power' and 'cap' attribute. If user directly 
>> query
>> the 'power1_alarm' attribute without queryng above two attributes, 
>> driver
>> will use uninitialized variables to judge.
>>
>> So this patch adds the setting of alarm state and update 'cap' in the
>> notification callback and update 'power' and 'cap' if needed to show the
>> real alarm state.
>>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>> ---
>>   drivers/hwmon/acpi_power_meter.c | 27 +++++++++++++++++++++++----
>>   1 file changed, 23 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/hwmon/acpi_power_meter.c 
>> b/drivers/hwmon/acpi_power_meter.c
>> index 2f1c9d97ad21..0b337d4fb212 100644
>> --- a/drivers/hwmon/acpi_power_meter.c
>> +++ b/drivers/hwmon/acpi_power_meter.c
>> @@ -84,6 +84,7 @@ struct acpi_power_meter_resource {
>>       u64        power;
>>       u64        cap;
>>       u64        avg_interval;
>> +    bool        power_alarm;
>>       int            sensors_valid;
>>       unsigned long        sensors_last_updated;
>>       struct sensor_device_attribute    sensors[NUM_SENSORS];
>> @@ -396,6 +397,9 @@ static ssize_t show_val(struct device *dev,
>>       struct acpi_device *acpi_dev = to_acpi_device(dev);
>>       struct acpi_power_meter_resource *resource = 
>> acpi_dev->driver_data;
>>       u64 val = 0;
>> +    int ret;
>> +
>> +    guard(mutex)(&resource->lock);
>>         switch (attr->index) {
>>       case 0:
>> @@ -423,10 +427,17 @@ static ssize_t show_val(struct device *dev,
>>               val = 0;
>>           break;
>>       case 6:
>> -        if (resource->power > resource->cap)
>> -            val = 1;
>> -        else
>> -            val = 0;
>> +        ret = update_meter(resource);
>> +        if (ret)
>> +            return ret;
>> +        /* need to update cap if not to support the notification. */
>> +        if (!(resource->caps.flags & POWER_METER_CAN_NOTIFY)) {
>> +            ret = update_cap(resource);
>> +            if (ret)
>> +                return ret;
>> +        }
>> +        val = resource->power_alarm || resource->power > resource->cap;
>> +        resource->power_alarm = resource->power > resource->cap ? 
>> true : false;
>
> The result of the comparison is already a boolean. ? : is unnecessary.
Right, will fix in v3.
>
>>           break;
>>       case 7:
>>       case 8:
>> @@ -847,12 +858,20 @@ static void acpi_power_meter_notify(struct 
>> acpi_device *device, u32 event)
>>           sysfs_notify(&device->dev.kobj, NULL, POWER_AVERAGE_NAME);
>>           break;
>>       case METER_NOTIFY_CAP:
>> +        mutex_lock(&resource->lock);
>> +        res = update_cap(resource);
>> +        if (res)
>> +            dev_err(&device->dev, "update cap failed when capping 
>> value is changed.\n");
>
> Please make this dev_err_once() to avoid logging noise if the problem
> is persistent.

will fix in v3.

Thanks.

>
>> + mutex_unlock(&resource->lock);
>>           sysfs_notify(&device->dev.kobj, NULL, POWER_CAP_NAME);
>>           break;
>>       case METER_NOTIFY_INTERVAL:
>>           sysfs_notify(&device->dev.kobj, NULL, 
>> POWER_AVG_INTERVAL_NAME);
>>           break;
>>       case METER_NOTIFY_CAPPING:
>> +        mutex_lock(&resource->lock);
>> +        resource->power_alarm = true;
>> +        mutex_unlock(&resource->lock);
>>           sysfs_notify(&device->dev.kobj, NULL, POWER_ALARM_NAME);
>>           dev_info(&device->dev, "Capping in progress.\n");
>>           break;
>
> .
