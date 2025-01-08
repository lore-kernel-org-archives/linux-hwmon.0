Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14D8249EB;
	Wed,  8 Jan 2025 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348267; cv=none; b=FkMN/S02lD8W8UM1N3tOur1ZIQuWZfMv9R4G5IQ2thxuCDQb+u2BPVh/nwZ9e1e+wEH02M6UFYhZgtkHPNdYQtRdqWq5PC+h84I3iSxmcyDFqWZSxyNPzif0vmQVhAn6b3T48yaqDCvr3BNPeJ8e4/vjSRdLKI0uTGeVrv4oOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348267; c=relaxed/simple;
	bh=oyVpRZnT5CkPJLLXwSeW+cDGEPB8gLQ3nOyF2bolkVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvUdFGVponhOVx9zcFZvzCKYkpffyOLzCxrz8AxBgvnmkoQbUnEPapggM4i1Jnlw62eOxgnKzKUeg1CjUr/M9VVBa9Y56+wNM8KatqVp/ETsTK7AeNoB1L9R/QjaXfsld2zuPqE7vh/weF1TS81zk6QEWFa0/hDVZ5Hvs3yj3nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmhB5+VF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmhB5+VF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2165cb60719so256193405ad.0;
        Wed, 08 Jan 2025 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736348265; x=1736953065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lB+0XBbg9t20EBPDvbZTQrlfF1Ts3SlcnQAqz0qFORE=;
        b=VmhB5+VFydJVJPG1R9tuGdUtcUFrucFiSPA8+Cja8gI9kTBPgbeV/CV9Q0Zm/9Fa7/
         auwPes3CvskCjNb1NY2HHeX7gd3nxAysBstb0DYTAt6bYsdZpR50bjv/J2F6+XUnhkJ3
         yxw41UuV5BJqlUY6C7zlbFEG5rcdPkSmGUkvNuZG/IP09JEIA7FQJuWzgYeYBCpf5YQ8
         yY9JsMG1U7jbvN4anEj/bfC0i8LPSuXUkW0fpwLdEVS+M17Es6LS+SZlMxV+ayzGAw6A
         agX0uGRnSjhKUg11uTjw5Ds8gdVeDDRohLcxDSkqNhMolxqEuCS9iKmkPZXoTq2KCvCb
         bq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736348265; x=1736953065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB+0XBbg9t20EBPDvbZTQrlfF1Ts3SlcnQAqz0qFORE=;
        b=DrpWfLBBIQ/jWF8KIPl9z1JpEK9Dh7Vgt0oXzNoCvMQA7cxJv+tU2nKDjlDdtZ+PTT
         Tcm+gW33Nz0quV2E4UfZJCkBhiruFhGOW7qr6CcRZOhPwNnJOVhq030HDb6Iaz6KtZ6M
         IgPZcckEpe81Io4biP3WiGIUV6j2zdBk71TmEoiCbEUSNgiQYn1XISS6nmLrh44PfSt+
         uXJXg1dPjWF+eXIKl1Zfn4ZpS8es+aKZM44s90icH2K1TGpUbR9bJi92JGF0njOv2iD2
         yktRAvPs2LflD5yfzu+jJ4+fX5H813LMO1Qd0E44Uq0fQ2wUpXzQvdrIIOwZusJN7px8
         EixQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyClui1LhKm3JYNXpwgQFRb0j7661iZI1qhaxe0J1mukA6IWeyW5lYVwheLnp5vVlqaoIw4evhu1sjNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJ8dl4qkuebyns8Ofe5W5FpqS7L2O7odxf/2RdRFGnYpsVX9s
	+6meMsWhfjrGy68ttFQyMcuCLQf+Fr7jceVJ94xOK2JNCfHiC7yt
X-Gm-Gg: ASbGncs33ov56jpyCMtY1LLDova6GhaoPqQLvrfX1bGIrNds8Rej9I3J16XskiieyW1
	UtVQOxO1w/xPR9DMjH23DdobbBqBCu6tJkRFtJaHqQg/1WjKk8NUG1/rJ49yC0nNT6uPMxo+EFD
	KkesygkRuazIyA4E2NM5nM2OTOaoe77SJxis8yTbhwxzKhcabieK+/xkY/eHna7khsafylET2gV
	5ijLNEfVn6yGg+x+GGf1dbOjycfNAeHeinGW6GmIaUURnwz0jq7HohElUyIt3paLmP7PcPhz3cP
	sur6X55QYY5DITPt2vtJUdZzf6G2yw==
X-Google-Smtp-Source: AGHT+IHbT2o3TOPCw1CGoZjkHnJ/ZMpei9q3EINXPmHJpHAcW8nrqRcEz9aEDv8OKk2PG547ivOXmQ==
X-Received: by 2002:a17:903:1248:b0:216:2dc5:2330 with SMTP id d9443c01a7336-21a83fd2400mr50068415ad.36.1736348264803;
        Wed, 08 Jan 2025 06:57:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96eb1dsm328661965ad.78.2025.01.08.06.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:57:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5854a361-f88e-49e6-8807-f86c42aabd1a@roeck-us.net>
Date: Wed, 8 Jan 2025 06:57:42 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon: (acpi_power_meter) Remove redundant
 'sensors_valid' variable
To: Huisong Li <lihuisong@huawei.com>, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jdelvare@suse.com, liuyonglong@huawei.com,
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com
References: <20250107113330.7970-1-lihuisong@huawei.com>
 <20250107113330.7970-4-lihuisong@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250107113330.7970-4-lihuisong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/25 03:33, Huisong Li wrote:
> The 'sensors_valid' in acpi_power_meter_resource structure is always '1'
> after querying power once. The default value of this variable is zero which
> just ensure user can query power successfully without any time requirement
> at first time. We can get power and fill the 'sensors_last_updated' field
> at probing phase to make sure that a valid value is returned to user at
> first query within the sampling interval. Then this redundant variable can
> be safely removed.
> 

The "benefit" of this change is the saved variable. The cost associated with it
is that update_meter() is now _always_ called from setup_attrs(), during probe
and when handling configuration change notifications. It seems to me that this
is much more costly than keeping the variable since it is unlikely that the show
functions are actually called within the sampling time.

I fail to see why removing a variable would be more beneficial than the overhead
of unnecessarily calling update_meter() during probe (which also increases probe
time) and while handling configuration change notifications.

This would need a much better rationale to be acceptable.

Guenter

> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> ---
>   drivers/hwmon/acpi_power_meter.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 594f7681d523..49bef3350439 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -85,7 +85,6 @@ struct acpi_power_meter_resource {
>   	u64		cap;
>   	u64		avg_interval;
>   	bool		power_alarm;
> -	int			sensors_valid;
>   	unsigned long		sensors_last_updated;
>   	struct sensor_device_attribute	sensors[NUM_SENSORS];
>   	int			num_sensors;
> @@ -316,15 +315,14 @@ static ssize_t set_trip(struct device *dev, struct device_attribute *devattr,
>   }
>   
>   /* Power meter */
> -static int update_meter(struct acpi_power_meter_resource *resource)
> +static int update_meter(struct acpi_power_meter_resource *resource, bool check)
>   {
>   	unsigned long long data;
>   	acpi_status status;
>   	unsigned long local_jiffies = jiffies;
>   
> -	if (time_before(local_jiffies, resource->sensors_last_updated +
> -			msecs_to_jiffies(resource->caps.sampling_time)) &&
> -			resource->sensors_valid)
> +	if (check && time_before(local_jiffies, resource->sensors_last_updated +
> +			msecs_to_jiffies(resource->caps.sampling_time)))
>   		return 0;
>   
>   	status = acpi_evaluate_integer(resource->acpi_dev->handle, "_PMM",
> @@ -336,7 +334,6 @@ static int update_meter(struct acpi_power_meter_resource *resource)
>   	}
>   
>   	resource->power = data;
> -	resource->sensors_valid = 1;
>   	resource->sensors_last_updated = jiffies;
>   	return 0;
>   }
> @@ -349,7 +346,7 @@ static ssize_t show_power(struct device *dev,
>   	struct acpi_power_meter_resource *resource = acpi_dev->driver_data;
>   
>   	mutex_lock(&resource->lock);
> -	update_meter(resource);
> +	update_meter(resource, true);
>   	mutex_unlock(&resource->lock);
>   
>   	if (resource->power == UNKNOWN_POWER)
> @@ -429,7 +426,7 @@ static ssize_t show_val(struct device *dev,
>   			val = 0;
>   		break;
>   	case 6:
> -		ret = update_meter(resource);
> +		ret = update_meter(resource, true);
>   		if (ret)
>   			return ret;
>   		/* need to update cap if not to support the notification. */
> @@ -699,6 +696,10 @@ static int setup_attrs(struct acpi_power_meter_resource *resource)
>   		return res;
>   
>   	if (resource->caps.flags & POWER_METER_CAN_MEASURE) {
> +		res = update_meter(resource, false);
> +		if (res)
> +			goto error;
> +
>   		res = register_attrs(resource, meter_attrs);
>   		if (res)
>   			goto error;
> @@ -898,7 +899,6 @@ static int acpi_power_meter_add(struct acpi_device *device)
>   	if (!resource)
>   		return -ENOMEM;
>   
> -	resource->sensors_valid = 0;
>   	resource->acpi_dev = device;
>   	mutex_init(&resource->lock);
>   	strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);

