Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5A1C7B68
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 15:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728575834; cv=none; b=ukfnUMkuzYDa9wUVr0VYVEmjc9GgZM8dV4RZBBZuAsu9HRRS9TybORxvUD8qoaFx9u8QHB9jbnxT/LqqwSrU/dp0TEsnYPMvUEgziYURlfbyd9zOuc8ltM1iF1/Hs5Zg4eeWAmIl8T4l6Uwhnk0yT5dq6ZFbSgS2L5H6k918JVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728575834; c=relaxed/simple;
	bh=X8Tn/XhmWC1IUkTv6rbdwQ2sDCgKKL59a/20Co0i2ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBRkcniHIDpXZFszfZ2UZzuxJKYQ7017R6r+Sp+/+jVUfdIWw+oeQoe+rDGySKGFDrNyWGiOi/QD2LOeq5GTqwEpEsfZhqf6/iT2wzhmowr2xfNGjOYexjCBEhkWsvuZJo/ekNkIJ+hUZs/AI6CCBRT/RRFYQ7wsOgYaSmxG8Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3tphnoA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3tphnoA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e2dc61bc41so486702a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728575832; x=1729180632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IuyYdDR37h4VZmijZY7QtQAbSoDAnvjdQqsD3nuVhtg=;
        b=h3tphnoAb43fnDbQeAExsOg5yK1xM4FlByetknv3wRl+ajfR6QwAtQakvSco6s0wBG
         JYbQxv8jcYjTGb2JMZXAiYJaLhp+Bhx8AbpqeQ1IoIkMSxOAXLjGjrc74r+vdWqnrfoC
         E7idNtLVFokcW1OojWpjzfho3yGlmGCijYrub2LtVuJXSK82uqH1SvKcHzRGEV5baMqA
         px1GmIlok0VZzC5W3AHS4bsJR+ebmd1JU52B+tIOk+QFsOUtf+MEleYqhK46H50wP4Vg
         QpOt3+QyUezUAqozf/84Ji/knm0R7qEhFRj61pTXmay5RZZaToIQE1Fi8sMN+0Hw2QPy
         aopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728575832; x=1729180632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuyYdDR37h4VZmijZY7QtQAbSoDAnvjdQqsD3nuVhtg=;
        b=PvKhjWoL61OaCFBBa0yVHtei3JnI7QgkU/khlorz9m7Zo6XzlknFqHdewnsY1mELMK
         5xEg4JO2PArKQ3Mvc6ojWzIBSqVoqPqQWFOWCDCvA84Gqk7R2cwAsMQkgBlKokiyubJd
         bKnKzBH+n/K3QAtJ/O+YX+S99ltwrG38VwffAlV/MTwB2ThRbllbnBPfADC2xU0K6pK1
         BCxkCLA9ZX1/9/ZyW5BWbadOOVA4PrNo73/eO73QmQIiNpyMIiDX60CKqJE300yTo98d
         pWW8b0NAZmDzx9AxXxTRSqxaeIeyVTHmOAf1YX9sje91G8tZJFKAwYG0iXO8eO9x6k/C
         3gmA==
X-Gm-Message-State: AOJu0Yztg3Y9DS5pVUSDDB2rN0VL2dmGvJwq4pxoLQtvc9QQss/awKCY
	NE2UWc2oT/kDcmFPxqy1C/tcLymAIM9rVekhGlZYpzYDbHDwu3JsMOsQPg==
X-Google-Smtp-Source: AGHT+IG9At131DRYnaqbf4XtTEDQ1jZ2yWV8Aek/zFil0xFW7daaT1Dc2X/UvJSlE9QtNNQAgSwe/Q==
X-Received: by 2002:a17:90a:d24c:b0:2e0:8719:5f00 with SMTP id 98e67ed59e1d1-2e2a24779cemr7196031a91.22.1728575831603;
        Thu, 10 Oct 2024 08:57:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5caa799sm3766404a91.56.2024.10.10.08.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:57:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <24441cb5-beb3-4d06-a343-e74510d2fe4f@roeck-us.net>
Date: Thu, 10 Oct 2024 08:57:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add static visibility member to struct hwmon_ops
To: Heiner Kallweit <hkallweit1@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <c16acf3c-6ca6-4033-a115-58f6031ed868@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c16acf3c-6ca6-4033-a115-58f6031ed868@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/24 08:38, Heiner Kallweit wrote:
> Several drivers return the same static value in their is_visible
> callback, what results in code duplication. Therefore add an option
> for drivers to specify a static visibility directly.
> 

Yes, that works. Minor comment below. With that fixed, we are good to go.

Thanks,
Guenter

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/hwmon/hwmon.c | 19 +++++++++++++++----
>   include/linux/hwmon.h |  4 +++-
>   2 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 9c35c4d03..8e9159e8d 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -145,6 +145,17 @@ static const struct class hwmon_class = {
>   
>   static DEFINE_IDA(hwmon_ida);
>   
> +static umode_t hwmon_ops_is_visible(const struct hwmon_ops *ops,
> +				    const void *drvdata,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int channel)
> +{
> +	if (ops->visible)
> +		return ops->visible;
> +
> +	return ops->is_visible(drvdata, type, attr, channel);
> +}
> +
>   /* Thermal zone handling */
>   
>   /*
> @@ -267,8 +278,8 @@ static int hwmon_thermal_register_sensors(struct device *dev)
>   			int err;
>   
>   			if (!(info[i]->config[j] & HWMON_T_INPUT) ||
> -			    !chip->ops->is_visible(drvdata, hwmon_temp,
> -						   hwmon_temp_input, j))
> +			    !hwmon_ops_is_visible(chip->ops, drvdata, hwmon_temp,
> +						  hwmon_temp_input, j))
>   				continue;
>   
>   			err = hwmon_thermal_add_sensor(dev, j);
> @@ -506,7 +517,7 @@ static struct attribute *hwmon_genattr(const void *drvdata,
>   	const char *name;
>   	bool is_string = is_string_attr(type, attr);
>   
> -	mode = ops->is_visible(drvdata, type, attr, index);
> +	mode = hwmon_ops_is_visible(ops, drvdata, type, attr, index);
>   	if (!mode)
>   		return ERR_PTR(-ENOENT);
>   
> @@ -1033,7 +1044,7 @@ hwmon_device_register_with_info(struct device *dev, const char *name,
>   	if (!dev || !name || !chip)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (!chip->ops || !chip->ops->is_visible || !chip->info)
> +	if (!chip->ops || !(chip->ops->visible || chip->ops->is_visible) || !chip->info)
>   		return ERR_PTR(-EINVAL);
>   
>   	return __hwmon_device_register(dev, name, drvdata, chip, extra_groups);
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 5c6a421ad..667229956 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -368,7 +368,8 @@ enum hwmon_intrusion_attributes {
>   
>   /**
>    * struct hwmon_ops - hwmon device operations
> - * @is_visible: Callback to return attribute visibility. Mandatory.
> + * @visible:	Static visibility. If non-zero, @is_visible is ignored.
> + * @is_visible: Callback to return attribute visibility. Conditionally mandatory.

"Mandatory unless 'visible' is non-zero".

>    *		Parameters are:
>    *		@const void *drvdata:
>    *			Pointer to driver-private data structure passed
> @@ -412,6 +413,7 @@ enum hwmon_intrusion_attributes {
>    *		The function returns 0 on success or a negative error number.
>    */
>   struct hwmon_ops {
> +	umode_t visible;
>   	umode_t (*is_visible)(const void *drvdata, enum hwmon_sensor_types type,
>   			      u32 attr, int channel);
>   	int (*read)(struct device *dev, enum hwmon_sensor_types type,

