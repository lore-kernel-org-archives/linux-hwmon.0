Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC052E6CC0
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 13:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923709; cv=none; b=TqySZG0N5r2q9/+Oe6o/BU4m+vqXpWq6Cf86sB5BfjU1QWLlOiI9zij770qFEejNWzJCWXK9Wwbtia2DWlHLKPHvZuszvOq0lnmCymNwWTNQT8bI3HbiT6cFbHHb0CtSM331RI4NtOfiXfUdUFzwn4riREiUitCu0BI8UpcdYcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923709; c=relaxed/simple;
	bh=eYQroF+hz1sPCFgXW5zWcKDi94tK3SmEBjPEWUHLREg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQWgEHo3wyzLGCMVlN1Mga4BBg47DnahsQDGQx5NsG6o+aayPptToz31T5BENXd2yTA1hSOPVzwt8ITVtsDgqff9GxAm1tSSKfthZ8xhNFtD+s3G/Eso4vy1OLToJ7vPGEVipSbLmEebAeRlp1eKgKynb1qEd7x9Xu0EBBxdkU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpsaupWM; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpsaupWM"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c86214eead7so568088a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2026 06:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780923707; x=1781528507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk09PdaozbLBYoylQHl5ZtVjU8sfgb2d5kfgNmIhJY0=;
        b=BpsaupWMK40hTilwAxZ2PRIFdyBUFQFHMdNFyi+w+eW+if2ko/ZkAP6VEnVDHPZR9X
         o/ch2jAU7/TIhJpeKBD6RnOfDueBX5wq6thAzEhwnVbTbQyPzr6AoQawq0HKI8uVpQLH
         NErugkajnOVNOf01JsIhWQl+dP/qCGlFJtkSk+ROk6HZP7DzIEW0tds60F+EStM7/1Gs
         hm2tusXmlUmPtvaLQq6+2QAqqZucYXM9DcZyqBZzs50Eal0ENfsYezMflyjcwQSRnWEb
         g7LXTwzMkeb5CI1dPoHaQZg92nVfbRjiCqqb8YmJFvm+t3a3qPTpoUiAgb97uNh2sqc5
         DK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923707; x=1781528507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk09PdaozbLBYoylQHl5ZtVjU8sfgb2d5kfgNmIhJY0=;
        b=SeThcxW1s6SxBTJlHLDb07IR7RJTuMtZiZeAaXdSwdiYqUmBEUt9E4QxqALfxqRU9x
         jXGDmDfkETxi7xP4d4s6P35l4ami25kA5MNCVxUNPXb0bVp+8vzOuW5tstHWS9zrDK38
         hBSQJiyPPs/fyWl/nsbD2f/3uv/AIZXAetzLARS3Dn9mZdgV+B5rAlbIrRf/QoDZ5fcH
         EOZhcLdgaxirNWh5RRz6SzGTr6gyJCcglLqh4grKP5OfvDYrN6lsNNUmGiOY2gO5DS3l
         9eKXaSu2/gMVgDn8ekKbUX/B8xOjKGD3siRn+ZiFQV3tcSSTJGOhZefmraTOOt045r7x
         xRJw==
X-Gm-Message-State: AOJu0YyrR2fp/vYXF2Bzwth8gnDYr0mtxmLzNs3s3dz2l2dz8rzXo8lh
	J0sGDcJqMhnqKZNso9lxKNiafCQPAn2qk/xLshoUCK0C2cTkCGUHABJM
X-Gm-Gg: Acq92OF15oqt4NOPXzJpPbaBENvUfRQof9kB3WUVHOpGMKBZq8k3fjzQz3tDP+zNL4a
	toHWhGaM50h2goQBK95qHPFoVx+pDMAQ4/pjKh+IDNvbiTpEoJHtig8NuOC8bW1IG2cHrpDWU+A
	OVy0wMvEZj/W+FSyorV6isIpbO1CoQxQNJc/Ww/x2NOaBZ71gqoeY4RWHiF33PZ8jCnWX7gKEO5
	DLqnGk6essHiyheiy+Jlp6MQ6DXISItp6MYVep5/PmfxP4rd4Ykrzk9tft9Yg8TF2gxY1JkqKiI
	7e6Fv4Y3juq2Na+oS32Dli3LCXvh1XupJ65hHTUQJlt9DwdMMstmzUodWmzS37B6zzlZhuBFMfo
	NJ3kZgPA73F6nNdTDsIkqaF1roEQJ7b8FJzMV+6qdkIRBSRF2bEFmmt1J7SsQ+wUo9Y3p3gpLFR
	c0CztKqdczSinc8b61we2vfSqXAX3UxvKtyTtiRKYouYHZGVidwcK3wBYdBl0tsYiPQCfOcXeC3
	QaMsOUSeGU=
X-Received: by 2002:a05:6a21:390:b0:3b4:731e:6fad with SMTP id adf61e73a8af0-3b4d3a5723fmr12311277637.16.1780923707038;
        Mon, 08 Jun 2026 06:01:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4e59sm16084682a12.16.2026.06.08.06.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:01:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <415d47b8-3c41-4c86-b0fb-51a1dae0577f@roeck-us.net>
Date: Mon, 8 Jun 2026 06:01:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] hwmon: (gpd-fan): Initialize EC before registering
 hwmon device
To: sashiko-reviews@lists.linux.dev, xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
References: <tencent_BEAA4E485EAFA713FF395F57AC083EEE3507@qq.com>
 <20260608015308.166CF1F00893@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260608015308.166CF1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/26 18:53, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Reading a PWM value of 0 from the EC results in an integer underflow, causing sysfs reads to return a spurious error code.
> - [High] The driver statically and exclusively requests standard Super I/O ports, preventing dynamic resource sharing and risking I/O collisions.
> --
> 
> commit 56dbaa61ebc060459a8d3ef1f7c952d1f935af40
> Author: Pei Xiao <xiaopei01@kylinos.cn>
> Subject: hwmon: (gpd-fan): Initialize EC before registering hwmon device
> 
> This patch moves the EC initialization before the hardware monitoring
> device registration. This prevents a race condition where sysfs reads
> could return invalid values before the EC is properly initialized.
> 
>> Some buggy firmware won't initialize EC properly on boot. Before its
>> initialization, reading RPM will always return 0, and writing PWM will have
>> no effect. So move gpd_init_ec to before hwmon device register.
> 
> [Severity: High]
> This is a pre-existing issue, but does the driver handle a valid PWM read
> of 0 correctly?
> 
> Looking at gpd_wm2_read_pwm(), the raw PWM value 'var' is an unsigned 8-bit
> integer. If the EC returns 0 (e.g., when the fan is stopped), the expression
> '(var - 1)' mathematically underflows and promotes to a signed integer (-1).
> Multiplying by 255 and passing it to DIV_ROUND_CLOSEST yields a negative value:
> 
> gpd_wm2_read_pwm() {
>      ...
>      return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
> }
> 
> This negative return value propagates up to gpd_fan_hwmon_read(), which
> interprets it as an error code (-1 mapping to -EPERM), causing the sysfs read
> for pwm1 to fail. Can this be updated to safely handle a PWM value of 0?
> 

Series applied, but you might want to have a look into the problems reported here
(especially this one).

Thanks,
Guenter


>> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
>> index 7284babd4f5c9..745b3fb9e3a49 100644
>> --- a/drivers/hwmon/gpd-fan.c
>> +++ b/drivers/hwmon/gpd-fan.c
>> @@ -643,6 +643,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
>>   
>>   	dev_set_drvdata(dev, data);
>>   
>> +	gpd_init_ec(data);
>>   	hwdev = devm_hwmon_device_register_with_info(dev,
>>   						     DRIVER_NAME,
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this probe function
> exclusively claim globally shared Super I/O ports?
> 
> Looking earlier in gpd_fan_probe(), the driver statically requests standard
> Super I/O address and data ports exclusively for the lifetime of the module:
> 
> gpd_fan_probe() {
>      ...
>      region = devm_request_region(dev, res->start,
>                                   resource_size(res), DRIVER_NAME);
>      ...
> }
> 
> Because Super I/O ports are globally shared, permanently claiming them prevents
> other drivers (like watchdogs or RTCs) from probing. Should this use
> request_muxed_region() to dynamically lock the ports around each I/O sequence
> instead?
> 
>>   						     data,
>> @@ -651,9 +652,6 @@ static int gpd_fan_probe(struct platform_device *pdev)
>>   	if (IS_ERR(hwdev))
>>   		return dev_err_probe(dev, PTR_ERR(hwdev),
>>   				     "Failed to register hwmon device\n");
>> -
>> -	gpd_init_ec(data);
>> -
>>   	return 0;
>>   }
> 

