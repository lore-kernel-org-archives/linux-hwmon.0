Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F33C457D
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 23:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784243582; cv=none; b=RpJWKV9UIYoxhRu6EmnMWjekqswVK3U0ut34DZCb5XhUQoCZ9qVg3xj+7gqjJvR9z2SNOhLUi8XAPlSTj2lkSYLhlz8ioodOcL+mPf+PrkHlXsRxYjzoUsgdvxCAwlXm8xSZUnyoypsyp/ueJo7cGv/adahndZH7/qbH7KcqG5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784243582; c=relaxed/simple;
	bh=Kmd92D8cAwWYvCqssSAQx+PfwJXU9lrtkq9cN6zuTSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpJ0hueebTniZ5f325S1ibTH/bn0EUMBPAMwSMS8nkZwsWWmq4fUTRBV+r00utUcTnLbiu//ZKusWz4QCfRYJAJPk/8GDxlpBJ8Q+xoUjJ186A+9yQc5chejzya0wwTOCyj+2Ct80z04A/FT892OH8PpwhnXRK9NCT6ow7ARaHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxxigx4M; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxxigx4M"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e041ea211so4770343a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784243580; x=1784848380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iebyP5KXWizHvO+xaKY2uMVoQtEC55C0w7r0OcxDqEI=;
        b=gxxigx4MSknO5FEmYNRqwse6oqcnfGB4YRlBDAx5Kv/L19rqwruj11IZ8FG4rrAklx
         yweyGXZLVGVTTiUpPI7ETgRSD2BB4MIKGhmD9CDp24WuXyKvcZsJHuFMC1ERGKAYhAIE
         ZU/5fl0xeSuY76g3bwzKL6nv173MIbhSdRScyblpEjkrwZUof9086u5L+2xnHmvLW5UI
         nhx03wT2Pi/nA0bLa4NHmceRfGhGdEX97CoWY4EBFQJeaocOznKWz2wvko9qim7pypy6
         SvgRmJiOY1ptpDjRT3pjuf1wQjh0lojEKh2mlzaaueR9L6+fjS8OOU4iVsYsed4UitdF
         527g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784243580; x=1784848380;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iebyP5KXWizHvO+xaKY2uMVoQtEC55C0w7r0OcxDqEI=;
        b=HjkUrwwul7PechTSn+l8scugwvYrMV9fCdfScn5aWY2pV5F2271HiH4en5PXsOyOSq
         6Z+ONDud+5/KkFjR0fNmBHoP7ZN3wDgppRlZ1oJyct4T4V1EYR8X0TyQh1kz+68b/9NL
         Gjz4aBD1giPBzkClB4iVaDe9SLCIeffz+uNmhJ0bDN6m3S6+TxxWF3TTgDgsj/jVoKVV
         zQbu8wjSrsEE+q66K7RVByzOw2yORKSogMMCq2Rs1+0zTm4J5Xf62umMpRqjj/HX0yuR
         w5t5QI9lsUlVgiYETrqWip+k6a4GDk0Z+3x5KLJCYmir9k8Zyc1Rm1YjlfoCKnNFwIt7
         lfLQ==
X-Gm-Message-State: AOJu0YxzndmP/kiAL8fxj3GiIebdDqlK0fdhIPwgnHwSlwAyFkVEn2x3
	HgxAJDOsyMFS+JWqt9WTLhI4wMiCaTI+pbVxgf2eZUSmIwbn2gXoQkag
X-Gm-Gg: AfdE7cm1LzslG8p0blX1Vy8SyERcN6r9KtlzKi34H2ITXPzsBJpgE0aPlo5ewjIR2Zw
	mbcuvGOPLrw4/AIf4uRMF8XatPD0IF86d3B6Rl3KkqnLcUQPgcYaex1vK4MY14p7IH3d/ZMo1iQ
	aZ/+gIEcz5BUFX4XrJFdMhw40WqVQOxk0/EELBFujvhZ0SgHejFEItH1E/GguVmu0uMAS19Fvp5
	SBN1hjLZfo7TGoEhSnk5g8yD832uQn0X56SB6vnQBn6Ft1dGHcDmcGGCvkXEezXcpiX64mYE9Bf
	CT1Yc2wnvH+5eDej5wP2gELIuT7tQIOp5WJyJ4EfdYbs5UvFIGyKZK0Dew48M0BVYUCBUes+mZc
	xUFBbaxBFHbe8y1zSVmUkspEsoHuuFr/ugQeikti4a+Z79OxD8SXuo9OgF3htkdhMg5mUYj4cWd
	f7ot/P90czVAQGZTL0GSXSZn2vF2Xikie1Qt8J9XCPf3GQ9MAmJh+mTAJ5VQWQxg==
X-Received: by 2002:a17:90b:48c4:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-38e4b51bd8fmr95341a91.24.1784243579738;
        Thu, 16 Jul 2026 16:12:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm275938eec.7.2026.07.16.16.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 16:12:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <091279bb-391e-4c0a-8ecc-a51f95be3f27@roeck-us.net>
Date: Thu, 16 Jul 2026 16:12:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hwmon: (adt7470) Add thermal zone sensor support
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-4-cc55ef35edde@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260716-adt7470_thermalzone-v1-4-cc55ef35edde@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/26 14:21, Luiz Angelo Daros de Luca wrote:
> Expose the ADT7470 external temperature sensors to the thermal framework
> via Device Tree. The thermal callbacks use the driver's cached sensor data,
> avoiding any I2C bus traffic during frequent polling by the thermal core.
> 

Detailed explanation why HWMON_C_REGISTER_TZ does not work or is
insufficient goes here and into the driver code as comment.

Thanks,
Guenter

> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> ---
>   drivers/hwmon/adt7470.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index b865f4bd50f8..44fe310f0650 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -150,6 +150,11 @@ struct adt7470_cooling_device {
>   	int pwm_index;
>   };
>   
> +struct adt7470_thermal_sensor {
> +	struct adt7470_data *data;
> +	int id;
> +};
> +
>   struct adt7470_data {
>   	struct regmap		*regmap;
>   	struct mutex		lock;
> @@ -181,6 +186,7 @@ struct adt7470_data {
>   	unsigned int		auto_update_interval;
>   
>   	struct adt7470_cooling_device cooling_devices[ADT7470_PWM_COUNT];
> +	struct adt7470_thermal_sensor thermal_sensors[ADT7470_TEMP_COUNT];
>   };
>   
>   /*
> @@ -957,6 +963,47 @@ static int adt7470_register_cooling_devices(struct device *dev,
>   	return 0;
>   }
>   
> +static int adt7470_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct adt7470_thermal_sensor *sensor = thermal_zone_device_priv(tz);
> +	struct adt7470_data *data = sensor->data;
> +
> +	mutex_lock(&data->lock);
> +	*temp = 1000 * data->temp[sensor->id];
> +	mutex_unlock(&data->lock);
> +
> +	return 0;
> +}
> +
> +static const struct thermal_zone_device_ops adt7470_thermal_ops = {
> +	.get_temp = adt7470_get_temp,
> +};
> +
> +static int adt7470_register_thermal_sensors(struct device *dev,
> +					    struct adt7470_data *data)
> +{
> +	int i;
> +
> +	for (i = 0; i < ADT7470_TEMP_COUNT; i++) {
> +		struct thermal_zone_device *tz;
> +
> +		data->thermal_sensors[i].data = data;
> +		data->thermal_sensors[i].id = i;
> +
> +		tz = devm_thermal_of_zone_register(dev, i, &data->thermal_sensors[i],
> +						   &adt7470_thermal_ops);
> +		if (IS_ERR(tz)) {
> +			if (PTR_ERR(tz) == -ENODEV)
> +				continue;
> +			return dev_warn_probe(dev, PTR_ERR(tz),
> +					      "failed to register thermal zone %d\n",
> +					      i);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static ssize_t pwm_max_show(struct device *dev,
>   			    struct device_attribute *devattr, char *buf)
>   {
> @@ -1401,6 +1448,10 @@ static int adt7470_probe(struct i2c_client *client)
>   		err = adt7470_register_cooling_devices(dev, data);
>   		if (err)
>   			return err;
> +
> +		err = adt7470_register_thermal_sensors(dev, data);
> +		if (err)
> +			return err;
>   	}
>   
>   	data->auto_update = kthread_run(adt7470_update_thread, client, "%s",
> 

