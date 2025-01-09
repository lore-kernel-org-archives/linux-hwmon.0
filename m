Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092607BAEC;
	Thu,  9 Jan 2025 01:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736387496; cv=none; b=Id/bMKPW7wKxPNP2YWJOqdo5764+L98yhyLP076ktxiNvL9fIzIGYlVLsF3MXwspHwmepIbFgCSue4ETO0M/qMFVmhuyZHaHqiKcdsdKUyK8BJOGPnwTBjnZO2AZg/lYf3u3FjA8ylSCtU1rnLecR0o4bTNrTvr4/ld4I210kWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736387496; c=relaxed/simple;
	bh=PnVx48Igt1hhtvWF1PiaqCz2Q9Pk9eiSbAwd6Pvyti8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lwlH4YljT7XIPScb954pFaEtCIg2l1tm20XwOEAs4fPmILCU0m0/PW5JdxepJ134Jn6gELGdBvseI2/73X9rQ2qeM9qznXif5AOjFFWRVjv8oOS7t7TdJLj+j5+4djsoBxM0wmMFi1HVXWem3+fiwB3L3PMSO0CSGfn1TICvvzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YT6lX4R3jz20ncP;
	Thu,  9 Jan 2025 09:34:32 +0800 (CST)
Received: from dggemv704-chm.china.huawei.com (unknown [10.3.19.47])
	by mail.maildlp.com (Postfix) with ESMTPS id CC86014037D;
	Thu,  9 Jan 2025 09:34:09 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 9 Jan 2025 09:34:09 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 9 Jan
 2025 09:34:08 +0800
Message-ID: <e89642a8-15d5-a000-c6e4-09953b07aed4@huawei.com>
Date: Thu, 9 Jan 2025 09:34:08 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] hwmon: (acpi_power_meter) Remove redundant
 'sensors_valid' variable
To: Guenter Roeck <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <jdelvare@suse.com>,
	<liuyonglong@huawei.com>, <zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>
References: <20250107113330.7970-1-lihuisong@huawei.com>
 <20250107113330.7970-4-lihuisong@huawei.com>
 <5854a361-f88e-49e6-8807-f86c42aabd1a@roeck-us.net>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <5854a361-f88e-49e6-8807-f86c42aabd1a@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2025/1/8 22:57, Guenter Roeck 写道:
> On 1/7/25 03:33, Huisong Li wrote:
>> The 'sensors_valid' in acpi_power_meter_resource structure is always '1'
>> after querying power once. The default value of this variable is zero 
>> which
>> just ensure user can query power successfully without any time 
>> requirement
>> at first time. We can get power and fill the 'sensors_last_updated' 
>> field
>> at probing phase to make sure that a valid value is returned to user at
>> first query within the sampling interval. Then this redundant 
>> variable can
>> be safely removed.
>>
>
> The "benefit" of this change is the saved variable. The cost 
> associated with it
> is that update_meter() is now _always_ called from setup_attrs(), 
> during probe
> and when handling configuration change notifications. It seems to me 
> that this
> is much more costly than keeping the variable since it is unlikely 
> that the show
> functions are actually called within the sampling time.
>
> I fail to see why removing a variable would be more beneficial than 
> the overhead
> of unnecessarily calling update_meter() during probe (which also 
> increases probe
> time) and while handling configuration change notifications.
That's what it sounds like.
Ok, let's drop this patch.
>
> This would need a much better rationale to be acceptable.
>
> Guenter
>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>> ---
>>   drivers/hwmon/acpi_power_meter.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwmon/acpi_power_meter.c 
>> b/drivers/hwmon/acpi_power_meter.c
>> index 594f7681d523..49bef3350439 100644
>> --- a/drivers/hwmon/acpi_power_meter.c
>> +++ b/drivers/hwmon/acpi_power_meter.c
>> @@ -85,7 +85,6 @@ struct acpi_power_meter_resource {
>>       u64        cap;
>>       u64        avg_interval;
>>       bool        power_alarm;
>> -    int            sensors_valid;
>>       unsigned long        sensors_last_updated;
>>       struct sensor_device_attribute    sensors[NUM_SENSORS];
>>       int            num_sensors;
>> @@ -316,15 +315,14 @@ static ssize_t set_trip(struct device *dev, 
>> struct device_attribute *devattr,
>>   }
>>     /* Power meter */
>> -static int update_meter(struct acpi_power_meter_resource *resource)
>> +static int update_meter(struct acpi_power_meter_resource *resource, 
>> bool check)
>>   {
>>       unsigned long long data;
>>       acpi_status status;
>>       unsigned long local_jiffies = jiffies;
>>   -    if (time_before(local_jiffies, resource->sensors_last_updated +
>> -            msecs_to_jiffies(resource->caps.sampling_time)) &&
>> -            resource->sensors_valid)
>> +    if (check && time_before(local_jiffies, 
>> resource->sensors_last_updated +
>> +            msecs_to_jiffies(resource->caps.sampling_time)))
>>           return 0;
>>         status = acpi_evaluate_integer(resource->acpi_dev->handle, 
>> "_PMM",
>> @@ -336,7 +334,6 @@ static int update_meter(struct 
>> acpi_power_meter_resource *resource)
>>       }
>>         resource->power = data;
>> -    resource->sensors_valid = 1;
>>       resource->sensors_last_updated = jiffies;
>>       return 0;
>>   }
>> @@ -349,7 +346,7 @@ static ssize_t show_power(struct device *dev,
>>       struct acpi_power_meter_resource *resource = 
>> acpi_dev->driver_data;
>>         mutex_lock(&resource->lock);
>> -    update_meter(resource);
>> +    update_meter(resource, true);
>>       mutex_unlock(&resource->lock);
>>         if (resource->power == UNKNOWN_POWER)
>> @@ -429,7 +426,7 @@ static ssize_t show_val(struct device *dev,
>>               val = 0;
>>           break;
>>       case 6:
>> -        ret = update_meter(resource);
>> +        ret = update_meter(resource, true);
>>           if (ret)
>>               return ret;
>>           /* need to update cap if not to support the notification. */
>> @@ -699,6 +696,10 @@ static int setup_attrs(struct 
>> acpi_power_meter_resource *resource)
>>           return res;
>>         if (resource->caps.flags & POWER_METER_CAN_MEASURE) {
>> +        res = update_meter(resource, false);
>> +        if (res)
>> +            goto error;
>> +
>>           res = register_attrs(resource, meter_attrs);
>>           if (res)
>>               goto error;
>> @@ -898,7 +899,6 @@ static int acpi_power_meter_add(struct 
>> acpi_device *device)
>>       if (!resource)
>>           return -ENOMEM;
>>   -    resource->sensors_valid = 0;
>>       resource->acpi_dev = device;
>>       mutex_init(&resource->lock);
>>       strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
>
> .
