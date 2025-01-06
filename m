Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F621E87B
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 22:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204237; cv=none; b=D4mGVG5ZVn+/axlUxfmLPUshauVFzs7qZpSrSjyo0hkwFyjJ/LDkfaMQYJ+mc/NO5hdOQHkLFDqeg+Nm4cDRev0Z7kTjFvCyW+6mgHPLLjkYbvYOV+5kLrNrzwVRRsWCvL4CpdElq49tmJq/39SgfUATksLeoBLXyCFPyO06eFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204237; c=relaxed/simple;
	bh=fx5jas7ZtATxER12YT4CDwrpBdnKL1JT8JOOaiqKaoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lx65QPJAAUYA9sdiFe/DVbA7S4DyeSUv98moFONuz9pVAnaYbZmAbOFkKgpWXTsCQvr8SzXoe1cmieutTree7eO+VCFW4eP0QpIZVOAOBxZMKMIIGjmToZMxcQ05mzXwiNSZ6I5RQae1squlDFxxD89C4750H+6Z242w0KFEJBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jztv0RyO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jztv0RyO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21680814d42so183459555ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jan 2025 14:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204235; x=1736809035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eqaaYRBC/IIFsXYd2HfTHlAfIboMo9Qiar9RT4t6iHQ=;
        b=jztv0RyO9f6azCGcDeTxd0mxUeVJrBxYBLh2zsC6kTixNEudWO6LVnX20jCxo+bIly
         vv9MzBlX0ZKYMfoNmttluKhRUgztXhHFf++h2SudXrGImUFPU0FaNR1375oOcENEenUh
         cmxMiFEnb2PHbZCifoswhRdqHZsXeGTj4F8inVyCiu6TiwMfJOCzg+tC70ceOe/9Wul9
         kon/mcr0QiKiVkdKqRqurrwVK5NKitGsvv3TW/Zeoa+VSjh/dqgix81azkKhOJZVJT43
         thF1loDJ9r6Z99h2/M4znP2JIVoI6C+dC2zVuVay9kucob5OkGHmVKWyb2AEL4bFqbZK
         J6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204235; x=1736809035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqaaYRBC/IIFsXYd2HfTHlAfIboMo9Qiar9RT4t6iHQ=;
        b=jcirtEKuvGoUwCvPpDR/IWbCajjZQn7sVF3Qj3actbd5vpMbYN5yac930Th/Vl7icM
         TdA6vgmlVWSrtNPDlCZzWY13+VACZ+NzgluIjNhmhm8TiXbY/Ixkd5fPpDtd2R3Kmn2U
         lzKnsK2G3pjN04yGJyYcAoRObhPHjPtsduzgcDLB8aPgq/NzUEykafx7Y9zx7+xmmWcr
         gx7VdeRQODy44MN7mYa4EHcBUoSlxZxI5245NLt/oGtfm/5A7PhK60loz/iT76+UKqiZ
         oz1mimTnxO7LgG+EqSnQZGu44Z2OfEs56dIOCVD+DRjz2ajj6X+Zn3xIVL2MmLfAGeiA
         78hw==
X-Gm-Message-State: AOJu0YzLN/Q8GbUcxzurcFtV3sy9sAvElW5B0FPUQOZVG1yp5OKBvcy2
	XRCgal8MyHJ/rloTcqzQXMv5TuuvkZrICMUrN8QCZrO/DoFtWT112b5fuw==
X-Gm-Gg: ASbGncuzAqLWtk8PujRxVx02US/z4pygh71hlcq9p++HBRdCCY+rMjuDK81L72o9MnK
	wJNBxPwkqi5hQ9AhSFMh/YYuuTAltStSYazHoOlgtIqqQfP2nA/z0NHY52+X09FpabtqX3LjvPb
	RdNXjjLOqORxrZQo7SNFPsbwn2GR4y8CnJekZJvi5bfUQK8yOIDzuFj/YRqLvSfpPn+1G5atYL5
	a46IuxxfHnWND3aIOSXzZCBERVJH+unHuIZwBtFDQau5twxRQDA09rNti3eNJ5FA1cok3yHMRGC
	b6pc/wk1zAVjtArnx2Bp+vXVj4v9cw==
X-Google-Smtp-Source: AGHT+IGJ6rFYgDxsR4aka4hjFQLO9kGP2/rFa30N5kK8I4yvWrpyyj7A+EHGUcLkSzjrXC0S8gPzUA==
X-Received: by 2002:a17:902:f645:b0:216:5556:8b46 with SMTP id d9443c01a7336-219e70dbcf8mr930521875ad.49.1736204234634;
        Mon, 06 Jan 2025 14:57:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e585sm298890805ad.70.2025.01.06.14.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 14:57:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2dc31c52-2ca1-459c-8423-7d367d1619a6@roeck-us.net>
Date: Mon, 6 Jan 2025 14:57:12 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (nct6683) Add another customer ID for MSI
To: John <therealgraysky@proton.me>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>
References: <RHgpMv2vm9aouIOCtyVI2mjH9atCSSL2Zo7fO9QqQwapyOv1ATQhPQGgITlRHcXcEGY_PcyxUPmbXmbPlqCGyFgaEjhuPeaCGvWY4UdB1uA=@proton.me>
 <d6d10360-a2a4-4910-b3c3-80bf9d67383a@roeck-us.net>
 <zw2UJN123_RVNb7oaPDKfZjROMOGtEoLGZN9xK1Ha-p7Nqi-f2a682LoKaHhj498dDGqbuApHa5VYNWoB8GLlUhI4cAdj213hU95zEmzxPk=@proton.me>
 <KY1Lwa2kjE7V78ZKOvQv0IavCNAQXJMIL4LYAALEUI52yxCxzzucAifFH8Y1wRFUm38ZZsBvCM0poaJL6bIqnjS1tL1o9K-h_h5-JJAe2rk=@proton.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <KY1Lwa2kjE7V78ZKOvQv0IavCNAQXJMIL4LYAALEUI52yxCxzzucAifFH8Y1wRFUm38ZZsBvCM0poaJL6bIqnjS1tL1o9K-h_h5-JJAe2rk=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/6/25 11:47, John wrote:
>> On Monday, January 6th, 2025 at 11:55 AM, Guenter Roeck linux@roeck-us.net wrote:
> 
>>> Please resend. The patch itself is almost ok, except I'd suggest to replace
>>> "The value" with "The new customer ID" or similar in the patch description.
>>> Also, please define the customer ID as "0x20d" (no leading 0) to be in line
>>> with the other MSI customer IDs.
> 
> Incorporated this change as well as reworded the commit message.
> 

That is still not the expected format. The above is unnecessary, and the 'sensors'
command output is irrelevant for the patch description.

More serious though is what checkpatch has to say:

WARNING: From:/Signed-off-by: email address mismatch: 'From: John Audia <therealgraysky@proton.me>' != 'Signed-off-by: John Audia <thereadgraysky@proton.me>'

Notice "therealgraysky" vs. "thereadgraysky"
               ^                    ^

This means I can't fix the problems myself (which I would have done
since I already spent way too much time on this).

Guenter

>>From 0d95ea92928715b0de029b801b8604c1fdb4f78c Mon Sep 17 00:00:00 2001
> From: John Audia <therealgraysky@proton.me>
> Date: Wed, 1 Jan 2025 08:27:59 -0500
> Subject: [PATCH] hwmon: (nct6683) Add another customer ID for MSI
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The new customer ID was found on a MPG X870E CARBON WIFI (MS-7E49) with
> a NCT6687D chip.
> 
> For reference, sample output of sensors with this commit applied. Note-
> the value of -40.0 for Thermistor 0 is to be expected as I do not have
> a probe connected to that sensor.
> 
> nct6687-isa-0a20
> Adapter: ISA adapter
> VIN0:               1.01 V  (min =  +0.00 V, max =  +0.00 V)
> VIN1:               1.01 V  (min =  +0.00 V, max =  +0.00 V)
> VIN2:               1.30 V  (min =  +0.00 V, max =  +0.00 V)
> VIN3:             672.00 mV (min =  +0.00 V, max =  +0.00 V)
> VIN4:             704.00 mV (min =  +0.00 V, max =  +0.00 V)
> VIN5:               2.03 V  (min =  +0.00 V, max =  +0.00 V)
> VIN6:             448.00 mV (min =  +0.00 V, max =  +0.00 V)
> VIN7:               1.50 V  (min =  +0.00 V, max =  +0.00 V)
> VCC:                3.26 V  (min =  +0.00 V, max =  +0.00 V)
> VSB:                3.33 V  (min =  +0.00 V, max =  +0.00 V)
> AVSB:               3.33 V  (min =  +0.00 V, max =  +0.00 V)
> VTT:                2.03 V  (min =  +0.00 V, max =  +0.00 V)
> VBAT:               3.22 V  (min =  +0.00 V, max =  +0.00 V)
> VREF:               1.79 V  (min =  +0.00 V, max =  +0.00 V)
> fan1:              635 RPM  (min =    0 RPM)
> fan2:              647 RPM  (min =    0 RPM)
> fan3:                0 RPM  (min =    0 RPM)
> fan4:                0 RPM  (min =    0 RPM)
> fan12:               0 RPM  (min =    0 RPM)
> fan13:               0 RPM  (min =    0 RPM)
> fan14:               0 RPM  (min =    0 RPM)
> fan15:               0 RPM  (min =    0 RPM)
> fan16:               0 RPM  (min =    0 RPM)
> AMD TSI Addr 98h:  +45.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)  sensor = AMD AMDSI
> Diode 0 (curr):    +52.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)  sensor = thermal diode
> Thermistor 15:     +47.5°C  (low  =  +0.0°C)
>                              (high = +124.0°C, hyst = +34.0°C)
>                              (crit =  +0.0°C)  sensor = thermistor
> SMBus 0:           +53.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)
> SMBus 1:           +52.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)
> Thermistor 0:      -40.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)  sensor = thermistor
> Thermistor 15:     +47.5°C  (low  =  +0.0°C)
>                              (high = +124.0°C, hyst = +34.0°C)
>                              (crit =  +0.0°C)  sensor = thermistor
> intrusion0:       ALARM
> beep_enable:      disabled
> 
> Signed-off-by: John Audia <thereadgraysky@proton.me>
> ---
> V1 -> V2: Leading 0 removed from customer ID, commit msg changed
> 
>   Documentation/hwmon/nct6683.rst | 1 +
>   drivers/hwmon/nct6683.c         | 3 +++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
> index 2a7a78eb1b46..2302b1ac95b1 100644
> --- a/Documentation/hwmon/nct6683.rst
> +++ b/Documentation/hwmon/nct6683.rst
> @@ -65,4 +65,5 @@ ASRock X570	NCT6683D EC firmware version 1.0 build 06/28/19
>   ASRock X670E	NCT6686D EC firmware version 1.0 build 05/19/22
>   MSI B550	NCT6687D EC firmware version 1.0 build 05/07/20
>   MSI X670-P	NCT6687D EC firmware version 0.0 build 09/27/22
> +MSI X870E	NCT6687D EC firmware version 0.0 build 11/13/24
>   =============== ===============================================
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index f71615e06a8f..288f497d364a 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -175,6 +175,7 @@ superio_exit(int ioreg)
>   #define NCT6683_CUSTOMER_ID_MSI		0x201
>   #define NCT6683_CUSTOMER_ID_MSI2	0x200
>   #define NCT6683_CUSTOMER_ID_MSI3	0x207
> +#define NCT6683_CUSTOMER_ID_MSI4	0x20d
>   #define NCT6683_CUSTOMER_ID_ASROCK		0xe2c
>   #define NCT6683_CUSTOMER_ID_ASROCK2	0xe1b
>   #define NCT6683_CUSTOMER_ID_ASROCK3	0x1631
> @@ -1227,6 +1228,8 @@ static int nct6683_probe(struct platform_device *pdev)
>   		break;
>   	case NCT6683_CUSTOMER_ID_MSI3:
>   		break;
> +	case NCT6683_CUSTOMER_ID_MSI4:
> +		break;
>   	case NCT6683_CUSTOMER_ID_ASROCK:
>   		break;
>   	case NCT6683_CUSTOMER_ID_ASROCK2:

