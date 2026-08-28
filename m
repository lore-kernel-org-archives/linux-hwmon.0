Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8853515C5
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932723; cv=none; b=escKYxABh/BY9QvX4SHKgRseHiSCwHhX++CyiahNTaPlO17CGFmcZxgdhiq0H/UVEG904Wy7l7CfcsuqoPupxjawTm3dbddL6SE9EF28ZXWf/ARpRq87CeWZl1JlyikQzRfSUDWK06w2JHLwEsLi9RrPwJVvSSqJeYvd/xM7SOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932723; c=relaxed/simple;
	bh=QjDYzM+B84BbFBFY2XiRrMaalijI6ccJ60p4UBFt1qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKbCfPTCsx8lvzLlNNthWm/VdmcW0XnJbNHQRZy9dtzhcKbp2Ue5cojFWxLML7OJtnSNg78NDkIjtr0qBoyE/iDxksq4JxLaOh2Sa54h6zOFlvY+GMPqHygEcaOEMPVjbGOHO8VH/wYYe8M/uiJTvaUogjJNu/JRdsTU+5ZuOe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oA7IAWwX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oA7IAWwX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3968e063f84so943697a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787932721; x=1788537521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5wUVUOJ+BNRj/aLvsZKiuH7D96YZP/aRZ4u0ysxDiw=;
        b=oA7IAWwXs4EfmtZ+GtkkVWgeuOImFdXooYtTvOXVFcYQV/NUIyucFzwxtCNZT2v5nM
         nxZJrj7qmrG3o1fk0YwAG9WbX5A6AklMxzefPqBDpgmvAP1jyXJQbwjl9e2H6KY48DiD
         Qsym5H45qBobXHWploM61GBwipD4zTZuuTBIsR7cIeBng936LVTTbkhcWhPz8HcPvloQ
         KUIEqWzW6nGv03/X8AedZ70ourbXO6G8bf/0jq6mNDgi9+H6q2ZoIaXkBQVIkMc+YJWN
         csmy4VWYuwNqOqvCriP+fClcZMB3UgV55bx8thJmk5D3p+A0+JQegH/EGrE4L6CTvkoT
         J70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932721; x=1788537521;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J5wUVUOJ+BNRj/aLvsZKiuH7D96YZP/aRZ4u0ysxDiw=;
        b=Ro+lYG/RpvOz6+dC9i1wUPAHztuwqvYFYKkEyLYbmOTAc7/3UCsT01mvmHhbjixy6X
         UsKKnZHKBaBptBrHtB47N0PIKVCm2VxjxMom00Mp+nFrpY5+RqnadyhyZS+weCG/cXeU
         IQaTZCto/A5VJtjmbDeKtZ3LbxzpyboQA0luwSILoT+ZZ2gkuqs8h7GXG2zXSd7gbtuZ
         m1htXpboHspoA8NNc/8nhoNjRAqoirOl3sLf7Xxm24CMIaiBHSw4hr9JJyaDqRDa6iB1
         VUTONjFcSzxmdfjYtAt2Nu4M4FIeeID+EYdKqFWpKYzU+PgmvhyzDLB/MA9REFYqEp+J
         SoBA==
X-Gm-Message-State: AFuF++luSqJ8qIcH+bR5TcZSPfj5hoeDQuDDInDVYmfE5cfQHVgfftbC
	cQETybv3oeKOlu9oyy+b6Jzoey3iw6RvKU/pa3NxMv152nk3gORHWdjC
X-Gm-Gg: AR+sD11yL+NbDx0PnPkXvkjGj0Ejld3zniLtDx9/wwJcVgE44qEfPowm/Flde9wjQER
	xiqzD4fvXcSVjTkWRFfS1bZXNL6bLQCQD+zeXpot4pQOf4TW5tfyGL2phuvaS0aW1Qi8nL/gbMY
	W/ojYKCuU5j7VxgjoAnz+zwMn380VDAWWQjHjNd9focK4PbcMsLa4qKxYRf9ZfzmwqX9CG55CpE
	9urXYLTQKkVg88Crqgk6E1NXQcTgCj9NwjxGJKB9PyQO8h7u8OWE6bfrEvTS1bSoXzIeQCxsSdq
	h7tjKv+EOcM+77dGKZuAmsfKtdleXG0f45aKffwn17txk5+OSA4smK+MGZc1pkrWF2N0b2m5oe2
	J7iGNgYk6hScY9SdvZPQrSZ7EcCldE3cyCGO9E3RnLNJX1K/i6QSateb7nohGnod7Cn56ck7hHA
	hRh1GEDC4GQGqFf5HrbjVYpr3QZIvc+z5LiPsmZ+7CHEv+793L6QcstSSINm3ZhSnWadytebZgl
	NSa8hMVHsORn3DWQMjJd60YfiKtcK39er2nAQ==
X-Received: by 2002:a17:90b:1f87:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-396d0a6589dmr17223817a91.0.1787932721178;
        Fri, 28 Aug 2026 08:58:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea7fa9sm7912829a91.4.2026.08.28.08.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 08:58:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b9792be3-fcd6-468c-9149-7e33640ee167@roeck-us.net>
Date: Fri, 28 Aug 2026 08:58:39 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only
 fans
To: sashiko-reviews@lists.linux.dev, Cong Nguyen <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260828105018.2392383-1-congnt264@gmail.com>
 <20260828110142.725E61F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260828110142.725E61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/26 04:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Converting to `devm_pm_runtime_enable()` and placing it at the end of `probe()` incorrectly reverses the teardown order, causing PM runtime to be disabled too early. This leads to a regulator enable count leak and exposes a sysfs race condition on driver unbind.
> --
> 
> commit 728a875c515df8244bd554b338f4f008d88b3b9e
> Author: Cong Nguyen <congnt264@gmail.com>
> 
> hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
> 
> This commit changes the driver to use devm_pm_runtime_enable() during probe
> and removes the manual pm_runtime_disable() from gpio_fan_stop(). This ensures
> PM runtime is automatically disabled on unbind, fixing an imbalance for
> alarm-only fans.
> 
>> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
>> index 084828e1e2817..0bd5561b7a405 100644
>> --- a/drivers/hwmon/gpio-fan.c
>> +++ b/drivers/hwmon/gpio-fan.c
>> @@ -524,8 +524,6 @@ static void gpio_fan_stop(void *data)
>>   	mutex_lock(&fan_data->lock);
>>   	set_fan_speed(data, 0);
>>   	mutex_unlock(&fan_data->lock);
>> -
>> -	pm_runtime_disable(fan_data->dev);
>>   }
>>   
>>   static int gpio_fan_probe(struct platform_device *pdev)
>> @@ -581,7 +579,9 @@ static int gpio_fan_probe(struct platform_device *pdev)
>>   	}
>>   
>>   	pm_runtime_set_suspended(&pdev->dev);
>> -	pm_runtime_enable(&pdev->dev);
>> +	err = devm_pm_runtime_enable(&pdev->dev);
>> +	if (err)
>> +		return err;
> 
> [Severity: High]
> Does moving the pm_runtime_disable() action to the end of probe reverse the
> teardown order in a way that breaks unbind?
> 
> Because devm unwinds in LIFO order, registering devm_pm_runtime_enable() at
> the end of gpio_fan_probe() means pm_runtime_disable() will execute first
> during unbind. The cleanup action for gpio_fan_stop() is registered
> earlier in probe via devm_add_action_or_reset(), so it will execute after
> PM runtime has already been disabled.
> 
> When gpio_fan_stop() calls set_fan_speed(..., 0), it invokes
> pm_runtime_put_sync(). Since PM runtime is already disabled, this will
> fail with -EACCES. This bypasses the runtime suspend callback, leaving the
> hardware regulator permanently enabled and causing a regulator enable count
> leak.
> 
Seems to me that this will need a more comprehensive fix.

Thanks,
Guenter

>>   	/* If current GPIO state is active, mark RPM as active as well */
>>   	if (fan_data->speed_index > 0) {
>>   		int ret;
> 

