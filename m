Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C38218E91
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 04:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784520740; cv=none; b=OW5EEa8T8Lt7rgsPeyNl/WfB+gMpUWEYjftA+pOzcs6l/vngAjWJugoQxU6R8cs/YsiVWQ613In0DznwlX5F43YIXUJ+qRiiTTTg7JCtKuSR+0862oEwV7T5GWxIHFEOqtKCYnSVF6DE4JI4utcAeSVMzXx1mK1n26lLBu2NJGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784520740; c=relaxed/simple;
	bh=MahNnmHfBFKaEQlOxNZeB9MlIEjVptgN6UdiJXJxTKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ku2j/nHWxyIbmRVGB/QbkjUmDc62Rw6Mp5A7Q08meI5CWpJZUe/UVaCx7vaYiaT478Qr9xPGRsVx9HQnSCw7/QwbDFOEdYwShllSnZMGk5bD0s2cXdUmQx0bYqVcM9OFEBNHd6impQpJmgi2Cy63ZsULNnTJx4vnX1YALIjtMok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnV8EnCZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnV8EnCZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caed617615so106918845ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784520738; x=1785125538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsPfgXM8yCBKdRd6xHG+Wz0jhhmcKdYGDlTmaSBPLLE=;
        b=BnV8EnCZhkFe/s8HIYTPQuhXP1liy2hm1TXANIxtqv0j9AnkZcreIHYzCAIzZRCDbr
         9y6fvOvtFctcTyFILcg2sajpptHZ/3J4PwC/hlrp5UGJ64L96fwDWzIBF7GHAHr9iQXE
         /w3FVK+OFmo3hPSF0hYeFKkiHrqgqquYiYbhE5C73aYce/HzpFb7FTK+e5TwAgp/Mrm+
         ut6jKkK0DqQ9MBQYJym1c7Z/n6XwHQBluPYgNAXe4/lxGxZJ9PtNXXXSaOCQ7Or/mvzx
         ZD0Z98wprQjmeNVYke1I1AAVASQ5JPo71obRPPz25e1hxSZHR5qlzj5EHw4qCa1m5lk/
         vBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784520738; x=1785125538;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZsPfgXM8yCBKdRd6xHG+Wz0jhhmcKdYGDlTmaSBPLLE=;
        b=TrcamccdszJirLA8wLlLrpKi/p0FoSu4tDXCqtInKLhsTi6+9DqPbMPoQRd5k1o78C
         w6vl/N03CW1RM/YRSFv1pqzwzI4gDdtPz1Owtg7i0yVjllKkETktl0tZIAcHFVlhA8FN
         Uge7jL0eTDUQ2oaUPYUGn24NRkp9gMyXt+W9NIsHsixUOYDVIiYMIC91dUEAidUWr8jF
         l4TTIEoC2XDe8GaXl6cftZMDmDD6GDgAnmGvZDY82zQQONQIBLUXtMnjjZNnzerj6+GQ
         RNot52p3VpB/H20CSf5Xhi1ZSr/XBZ1v065S/p4G+95aP9/jnmM+GbYqmI+CX6pANswi
         pF+A==
X-Gm-Message-State: AOJu0YxutPxNk+e/8DXVxx9sWqoxR4oWe7241Q4QNzr4UYNMGo8rFr7C
	uftaYDNNOuA3GmhDdiYQABKxuvGqVWdomo01uQ26cDDgSLF1EmyEPWf1
X-Gm-Gg: AfdE7cl7b+uwHqzx9ZMD1P5FBFt9H2/Rncjd60YMG4bT86g4/SxXsJhJ8aeqE++k0Df
	Ga+s87aUzhd2ql2CrPXGw2Qnsgdd4in46bgWftMjDBacUaTO29T3j++adVNs2clCP0xepBJEUk6
	KiiTWHP2nYmIoogqbpT33Q5IUkoYNmGRfEBfuyNzhiVp0WkEOKpNfg5MYVTRdNjVyT94Gnn5AQ6
	c1jXhfqkSD4iyB9oBONfjGw6mGFp3x4WUSvbBXO88dq6IKvoUWT2XUpd1yvvbRKBJ9sLoV6hNI/
	OMIlYB9Yos1nSfiXdMf6F2lVkDGkRsbeebZPAAGE5mH70H8m3hbGpF349DOFr8hVn07du0xnsAz
	qUF8AnTkQDPLr3X3YO+6CnBa1ahu7eCGoMpTL1GvRKdkKx6kJUXNvris4leqbMNAhiG2dE8AwI/
	fJz/M333Evj9JqEE18N4/5lpyTJ5dqEu74mLSzL8POD4hunuMh5gs=
X-Received: by 2002:a17:903:2ec8:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2cf349fec81mr140545595ad.37.1784520737792;
        Sun, 19 Jul 2026 21:12:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347430f8sm49965465ad.67.2026.07.19.21.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 21:12:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d8d49283-d85c-4009-b638-fc6dcce5f304@roeck-us.net>
Date: Sun, 19 Jul 2026 21:12:16 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
To: sashiko-reviews@lists.linux.dev, tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
References: <cover.1784516953.git.tze.yee.ng@altera.com>
 <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784516953.git.tze.yee.ng@altera.com>
 <20260720033718.783F01F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260720033718.783F01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/19/26 20:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Hardware monitoring functionality is registered as a platform device rather than an auxiliary device, violating hwmon subsystem layering rules.
> 
> Pre-existing issues:
> - [High] Asynchronous service layer APIs and resources are destroyed before client devices are unregistered, leading to a Use-After-Free and NULL pointer dereference race condition.
> --
> 
> --- Patch [1]: [PATCH v6 1/2] firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device ---
> commit 552947f984c2b5770daa9717c679362b5561cfa3
> Author: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device
> 
> Add asynchronous Stratix 10 service layer support for hardware monitor
> temperature and voltage read commands in stratix10_svc_async_send() and
> stratix10_svc_async_prepare_response().
> 
> Register a socfpga-hwmon platform device from the service layer driver
> when hardware monitor support is enabled, similar to the RSU device.
> 
>> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
>> index c24ca5823078f..fc38afed5b7fe 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
> [ ... ]
>> @@ -2013,16 +2028,38 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_put_device;
>>   
>> +	if (IS_ENABLED(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)) {
>> +		svc->stratix10_svc_hwmon =
>> +			platform_device_alloc(SOCFPGA_HWMON, 0);
>> +		if (!svc->stratix10_svc_hwmon) {
>> +			dev_err(dev, "failed to allocate %s device\n",
>> +				SOCFPGA_HWMON);
>> +		} else {
>> +			svc->stratix10_svc_hwmon->dev.parent = dev;
>> +
>> +			ret = platform_device_add(svc->stratix10_svc_hwmon);
> 
> [Severity: Medium]
> Should the hardware monitoring functionality be implemented as an auxiliary
> device driver instead of a platform device?
> 
> The hardware monitoring subsystem guidelines state that when hardware
> monitoring is a secondary function of a chip, it should be implemented as an
> auxiliary device and reside in drivers/hwmon/.
> 
> Does registering socfpga-hwmon directly as a platform device from this
> firmware service driver bypass the architectural layering rules for hwmon?
> 

It should be implemented as auxiliary driver, but feel free to ignore since
I only recently added this guidance to Sashiko.

> [ ... ]
>> @@ -2046,6 +2083,9 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
>>   	struct stratix10_svc_controller *ctrl = platform_get_drvdata(pdev);
>>   	struct stratix10_svc *svc = ctrl->svc;
>>   
>> +	if (svc->stratix10_svc_hwmon)
>> +		platform_device_unregister(svc->stratix10_svc_hwmon);
>> +
>>   	stratix10_svc_async_exit(ctrl);
>>   
>>   	of_platform_depopulate(ctrl->dev);
> 
> [Severity: High]
> This is a pre-existing issue, but can the destruction order in
> stratix10_svc_drv_remove() lead to a NULL pointer dereference or a
> use-after-free race condition?
> 
Pre-existing, so your call if you want to fix it or not.

Thanks,
Guenter

> When stratix10_svc_async_exit() is called, it destroys the async ID pool
> and sets actrl->invoke_fn to NULL:
> 
> drivers/firmware/stratix10-svc.c:stratix10_svc_async_exit() {
>      ...
>      ida_destroy(&actrl->async_id_pool);
>      actrl->invoke_fn = NULL;
>      ...
> }
> 
> However, the RSU client device is unregistered after this destruction step
> via platform_device_unregister(svc->stratix10_svc_rsu).
> 
> If a user interacts with a client device's sysfs attribute while the module
> is being unloaded, could the still-active client device invoke
> stratix10_svc_async_send()?
> 
> If so, it would concurrently access freed asynchronous channels or attempt
> to execute actrl->invoke_fn(actrl, &args, &res) after it has been locklessly
> cleared, resulting in a kernel crash.
> 
> Would it be safer to unregister all child and client devices before the
> resources they depend on are torn down?
> 

