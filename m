Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EABD331A4B
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 02:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778724900; cv=none; b=tw7DPfoqZsvpCBDUGz3mlQoNjEf8iKEFeGNL5m+n4EfqnSdKllLnenXckYfjcb7xZ+Nap70ovcdZfOhBA6e/bOpHSix/kOluVpvup/LoCB4hzFYubyD5ybyqNGINHRbYIqz+59OkhrSXyBL2XCls7ukqq3M+3LgHLO4mBckeTHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778724900; c=relaxed/simple;
	bh=mLwa8hT48xikqr5alwbZvYtL+YPKEw0F1k3NSY7iBY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3aIrBJ7+T+158wlql1BRozmDIJnij5z0vPS8uvb95/oJ0oNiuNoQl7NPiJn2RzCX2aKtY+yl7vK42qmsa64TELCxZEzq5ahRUrDIEXWLsBznIGt1ay61nOTXpuMkfBrE7/Q4wsdUFFWUWoSaAZB/+7x9ZAn3IwCQIIoIC5Pgoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDWWqIA5; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDWWqIA5"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1329fc4bf77so235388c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 19:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778724898; x=1779329698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YFeSFQ5fWNanAAto4axcgqwLVs3s/DcV44ZRpfZXmiU=;
        b=XDWWqIA5Czf0E89jwc6ppleI6Mvv1MMf3kFGMLpff58E/beMcuyyCqY4xzzOg81Jde
         3m+obkFfW+EzFo51GdG/RW4IoD0uhsrILsTkDnxU6FkFRd90AfvyOQQlZdVYP/SpFjwQ
         KJLxAnsXQVTzrvnA+nNao3Cxppe5n7U6cn0dOimau57PYzajgZeXntXhCQ/l57w+cIZW
         amofgPMnGmh94MDwM4HraevU2/ZsfEzavsa9swyI3rxdZWhsXBPCpjd6n6QYMhOy7Pi7
         1k8D7k62D2E1t9NWVlWxKBinc0HFAYywWmJpzeWLFUuVaI1Le4VvcBcrmyNxkCVzAXdr
         knBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778724898; x=1779329698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFeSFQ5fWNanAAto4axcgqwLVs3s/DcV44ZRpfZXmiU=;
        b=CjcxHw8JVqJ5fQHaiIL6X+Hy/nFtQ1wLHg+NjNbxf8W42nV2U1si03R69uZ/zQopJg
         jk4/PBAETMOkBfYiicro+dXpseQfQOYBbH069kn5Dnz1U0tRochBEdayNKNgd50eFgxy
         t1BdSvZ9CasZYGeqY08h16xj/1lMHntcC1fUrnY8K+9qSvXKeU30ozUG0irjpwo/28Ah
         eFOcxorsw86RP5AkQryBNGeHlCgUZZ83yclfoc9t4Re9FIu0GAA9PV9/OAs9dGrkF9UL
         SyFRyodOD6IeVKOUUl7SiBUIVoLyFjbEKw5AZYirePPb+71uGYA7FICfhbWrneDPVFXs
         jFDQ==
X-Gm-Message-State: AOJu0YzaI3BrZYDA1cl/rmY8l0u40jqjAB899zLsacT3r7tARnytFOHA
	1zCDFsEweoL+SrRFpECFFRTAVsK8u1t8Jk1okJ6UzRJpUWOWlleEcD1T
X-Gm-Gg: Acq92OGoPfL5JONDJ9V0dOZD9Ckss8JVMun/Mk0V/4PKaIo5EZOBfM5ppvVl139XefC
	v/dO0A5zrJKFq/VXdEJ9sP2EsbQkokLvmF0A0giEl8JMi8R4EvWy5QK4HfTlk7RAjEkVGw3eiQ+
	YYZaVUM9DMmCk3H5WUt4paFgiSYlTyAM1zCBPglMX9Pz3pbSe1TI6By30zgAeXsNdBtvce8uLsF
	t3cuU1UutM2TyePjSArWMJVo6OreJZg17hXsSRycoWXnLjji/5MWm27gp6gFsdIX3duiY+i7OdO
	14ETPRwyhjHVgh1sZUHZcpnAAlX4EK+bmPRbadKh0DLMJEOf7ijIHqUAsAg0EbUz9VNxL83bMHB
	hy+dftEz/lPGznHX3eYzNdx2T+/rnPqMd0JP6splmjANdVxZqKiXH8DLQTkI0WxW8JZ0u8jP+T9
	m/fsc6iLU8BxrpgNCeGHetl8awW4vn3vI7bsNhDo4/6NzcFImjt5d9aGNs2YnNIzE4ja7af7DO
X-Received: by 2002:a05:7022:2605:b0:12a:68cc:3efb with SMTP id a92af1059eb24-13436682901mr3723291c88.16.1778724897922;
        Wed, 13 May 2026 19:14:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cf44668asm1498825c88.6.2026.05.13.19.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 19:14:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <69b9cc9b-1336-4093-8fd0-e1816e038926@roeck-us.net>
Date: Wed, 13 May 2026 19:14:56 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] hwmon: (pmbus/adm1266) replace probe-time RTC seed
 with rtc_class device
To: sashiko-reviews@lists.linux.dev,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
References: <20260512-adm1266-v3-4-a81a479b0bb0@nexthop.ai>
 <20260514015706.D7E91C19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260514015706.D7E91C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 18:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing Kconfig dependency on RTC_CLASS causing potential build failures.
> --
> 
> commit f54ef3c53db957606d5afd59cb615359c244ece4
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> hwmon: (pmbus/adm1266) replace probe-time RTC seed with rtc_class device
> 
> This commit drops the probe-time seed and adm1266_set_rtc() entirely. It adds
> an rtc_class device whose read_time and set_time callbacks read and write the
> SET_RTC frame to expose the time stamp policy properly.
> 
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
>> index 080e7dbd0c069..05b31bb08f38c 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
> 
> [ ... ]
> 
>> @@ -517,21 +517,73 @@ static int adm1266_config_nvmem(struct adm1266_data *data)
> 
> [ ... ]
> 
>> +static int adm1266_register_rtc(struct adm1266_data *data)
>> +{
>> +	struct rtc_device *rtc;
>> +
>> +	rtc = devm_rtc_allocate_device(&data->client->dev);
> 
> Could this introduce a build regression if CONFIG_RTC_CLASS is disabled?
> 
> The patch unconditionally adds calls to RTC subsystem functions like
> devm_rtc_allocate_device() and devm_rtc_register_device(). These functions
> are implemented in the RTC core, which is governed by CONFIG_RTC_CLASS.
> 
> There are no fallback stubs in linux/rtc.h for these allocation functions
> when the subsystem is disabled. Does CONFIG_SENSORS_ADM1266 need a dependency
> on RTC_CLASS in drivers/hwmon/pmbus/Kconfig to prevent unresolved external
> symbols during linking?
> 

That would be unacceptable. The driver has to work on systems with no RTC.

Guenter



