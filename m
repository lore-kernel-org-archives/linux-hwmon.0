Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AAB1A9B3F;
	Wed,  8 Jan 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347554; cv=none; b=dRqMbbnLcDqAVhA+oAtZ1YYVQ1nPHyGWUVmwT2rWygwOCPYD8wBGkd6Ia6sWiz6BTSuqG9Y/8YimB+nqkOyAT14woDNRmMKADsAsUf1dgQljPuEoMWZT3BmqIe70dhIj68PM2RaoFhiUx57P49kos69dsIk55ir8SrDQRK4bts4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347554; c=relaxed/simple;
	bh=G4wlTr1XR8t50gkZNcxWmokscZUotU4BrknbPadgPX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDp2u/fR6Hj+hKvMGb6Ut+9ClzlWwzQaVwuuApS9ZSEU1enp3KkgGCSJkjujXONeI3hp9scp2gHdYFw4qtxYNU4GZoj+UedpXDkQ/9PPSWV9u8ges/XdIXrhQWeb4kE0z1pG+rlPX2cH9aLj3qNHkCgz8os1jTibV3ctetpDoQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzQuD2MG; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzQuD2MG"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef748105deso19159384a91.1;
        Wed, 08 Jan 2025 06:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736347552; x=1736952352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o0nhmN1KSqEqkZrVqTs3HIHBo4ZdB34xv/QQO8wjt98=;
        b=YzQuD2MGzvXXwbaJGFVOo9KS4un46qjKw4oD2118Em86Rdvv30lcrSLEpEjquWwq07
         uozNnwUGGU9dt7YYfwHSovlQ7FxLbXlhf8AXvr/zIHErzISuA5NckUoKDLpl7cMJBxXh
         Gm4zoj+Ks/7DZe86G7+nXicd9u83Tw9z38vsR+X2AHXemDKMhhWfxRhfsvJBmwxyMZdO
         fqvV/CmRb6WxGwFTxf+5MkBBA8w9W0CsAvBKnn0VgX25w5wv5/RnR+ldmAeSHsktrQxO
         kr+QMLDyug2NgIvxU591zeF7/wN52cSVHoorz4bAPg9N5YuoWDCbCC5a1/ohMlwsFm8i
         dwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736347552; x=1736952352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0nhmN1KSqEqkZrVqTs3HIHBo4ZdB34xv/QQO8wjt98=;
        b=HjxjHn2WM1VRO24MFZNSoU2ut7BWEWmCCV6VVVdJF2k9zSCvGVSJLpdHkDFG9BFhLv
         NR6l5KF9PwSpXgAHI2lLxQIB0s+wPXPR7JAxsaZOfd+qz7qSIAhF5PgrpiQvUQfIOkuQ
         vfbxwZhKir7bG92eiM82PiHgsfWk1eIC1HMgn0AvLKsvDwA2PFxujNocwkck3tiB0TI2
         SAA/TgwKAaRJLZapOBt4HqZfogjHFjSQIshj4oCDt2gYCBV8jwpX5bQkH8b2+BODbaDv
         gdZpQ0WB4KYtQGoDR7W6q6x+e6r+NglcK5DImayPXUn+wb1TbJgB42ZRvmxPfA71bU6H
         MZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUbyhFNF3Ak1BcNGV9XLsMPx5AaXZ1+6na4rUdaeipF5796DZ/On0aTC51aHQLC6qC9GMrHzPcE5rqFDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmSX9fGuVFJQz9Td03ncSiBs/fRm8oeYbzwLdYCrrO1+vuKc2
	Hotw+ImuEUlCnd0T9d3AVwPQX9iUtW3cRC8SULxWQkg2WIB8xVK4DScnRg==
X-Gm-Gg: ASbGncsvryXTsa7iFeZvDkNSsGmXKry80EaEZm76ZTG+kGG6T1rqYJBQ1RTHuGxftq6
	QdEdcBnogId5dtABCYLa7Avqiegih27+OV6G/ZfllVKPAVRLt9DUNtXttr+E8zL+xq3+xBGhFYk
	4ArsNMJvHD+1qhaa2yMuhJiAp8jn+HqoPdf+rAskBFEpW8Gt1a9yWNt0TPNtPemjwVpZ2Tokrz8
	UMNKQu0BvHAC4OOHTsiMofyyspzoUf2sLK1UURBAyNI319Z6Hl12OT4tGhOOQY41MBipDLNb6RP
	tYVTt9pSGv3aFKVsk9BOpAwEfFTKVg==
X-Google-Smtp-Source: AGHT+IEmMrZ6HWAiUvd/VogA30Djh7eZaNVZuPbqTdZ9k/53cPbJMD2R76fb5RliRgjyrnbhXQI5DQ==
X-Received: by 2002:a17:90b:1f91:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-2f548ec7934mr4662360a91.20.1736347551706;
        Wed, 08 Jan 2025 06:45:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a36c18dsm1732100a91.44.2025.01.08.06.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:45:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dfa0e28b-d25c-4170-958c-d5e8f5cbea39@roeck-us.net>
Date: Wed, 8 Jan 2025 06:45:49 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hwmon: (acpi_power_meter) Fix uninitialized
 variables
To: Huisong Li <lihuisong@huawei.com>, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jdelvare@suse.com, liuyonglong@huawei.com,
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com
References: <20250107113330.7970-1-lihuisong@huawei.com>
 <20250107113330.7970-2-lihuisong@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250107113330.7970-2-lihuisong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/25 03:33, Huisong Li wrote:
> The 'power1_alarm' attribute uses the 'power' and 'cap' in the
> acpi_power_meter_resource structure. Currently, these two fields are just
> updated when user query 'power' and 'cap' attribute. If user directly query
> the 'power1_alarm' attribute without queryng above two attributes, driver
> will use uninitialized variables to judge.
> 
> So this patch adds the setting of alarm state and update 'cap' in the
> notification callback and update 'power' and 'cap' if needed to show the
> real alarm state.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> ---
>   drivers/hwmon/acpi_power_meter.c | 27 +++++++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 2f1c9d97ad21..0b337d4fb212 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -84,6 +84,7 @@ struct acpi_power_meter_resource {
>   	u64		power;
>   	u64		cap;
>   	u64		avg_interval;
> +	bool		power_alarm;
>   	int			sensors_valid;
>   	unsigned long		sensors_last_updated;
>   	struct sensor_device_attribute	sensors[NUM_SENSORS];
> @@ -396,6 +397,9 @@ static ssize_t show_val(struct device *dev,
>   	struct acpi_device *acpi_dev = to_acpi_device(dev);
>   	struct acpi_power_meter_resource *resource = acpi_dev->driver_data;
>   	u64 val = 0;
> +	int ret;
> +
> +	guard(mutex)(&resource->lock);
>   
>   	switch (attr->index) {
>   	case 0:
> @@ -423,10 +427,17 @@ static ssize_t show_val(struct device *dev,
>   			val = 0;
>   		break;
>   	case 6:
> -		if (resource->power > resource->cap)
> -			val = 1;
> -		else
> -			val = 0;
> +		ret = update_meter(resource);
> +		if (ret)
> +			return ret;
> +		/* need to update cap if not to support the notification. */
> +		if (!(resource->caps.flags & POWER_METER_CAN_NOTIFY)) {
> +			ret = update_cap(resource);
> +			if (ret)
> +				return ret;
> +		}
> +		val = resource->power_alarm || resource->power > resource->cap;
> +		resource->power_alarm = resource->power > resource->cap ? true : false;

The result of the comparison is already a boolean. ? : is unnecessary.

>   		break;
>   	case 7:
>   	case 8:
> @@ -847,12 +858,20 @@ static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
>   		sysfs_notify(&device->dev.kobj, NULL, POWER_AVERAGE_NAME);
>   		break;
>   	case METER_NOTIFY_CAP:
> +		mutex_lock(&resource->lock);
> +		res = update_cap(resource);
> +		if (res)
> +			dev_err(&device->dev, "update cap failed when capping value is changed.\n");

Please make this dev_err_once() to avoid logging noise if the problem
is persistent.

> +		mutex_unlock(&resource->lock);
>   		sysfs_notify(&device->dev.kobj, NULL, POWER_CAP_NAME);
>   		break;
>   	case METER_NOTIFY_INTERVAL:
>   		sysfs_notify(&device->dev.kobj, NULL, POWER_AVG_INTERVAL_NAME);
>   		break;
>   	case METER_NOTIFY_CAPPING:
> +		mutex_lock(&resource->lock);
> +		resource->power_alarm = true;
> +		mutex_unlock(&resource->lock);
>   		sysfs_notify(&device->dev.kobj, NULL, POWER_ALARM_NAME);
>   		dev_info(&device->dev, "Capping in progress.\n");
>   		break;

