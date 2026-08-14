Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91F33ADB3
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 03:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786678529; cv=none; b=IsA/porPOYcuqpkj2H64NLIJCr/csdzXxf9ghDzLVFWggoTLs2zfMGgaWSPdfSD/dozS1GaOc7HCcCXsQI72Uiv7NkCGh7vHxE8/ZFpf0UcroqJVsTVmkxiRGJcKdqoEX5XDhZdm0tqoFM/bohMTMC8eE0G3Jx/JFsT8SYoELck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786678529; c=relaxed/simple;
	bh=JjxPe4RE4tfINJ4J6+717yrctY7M2s9W5UvVL1w96DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfNlGZa4yNxshXKCj62jKK9cJR/0sZZO7MdySQOwu0bkPV8RGh005aiBP5QxUGFr7K4BA1+qeq7ac1VD8acWOVfxyRXi95aMi3zjM8u9KDfElqj1ume9vJKDU59tYz1Lr5SuajTAsckn8ApBHs7p7Vau3OOMkdUXepgo7KM0CyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqhBmtyq; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqhBmtyq"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so747664a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 20:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786678525; x=1787283325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Az41CYaroyotAz7JNv849XOLanTXMznGgg+V2BVkDF8=;
        b=ZqhBmtyqpo4l1iZAkFtT4LBkV/nELr4IDsCqaloP78nYaclkoeUjTxnnTKf8nlxg7U
         4sCAy7qnmXNDDSI5V6T8GnuYUIvLosrhcUMVjci+WgdvjitZGJDWO94UYt0lmpVFgwU9
         K3Z7PJlXc5bmQSMXTsL9v/q6ai4IZ4hgTc3q4zFctKe1ZtmYAofnFudeyAbQbXCEVvOl
         Cv+/5HqJqbiNYFlNscv3e3gBkqTbrse8unDrF4Czod6lkozrnn3FcAcV80MFPnFzicwl
         FJAi53vm5HO65qfbdx0QIXU6SpPkCd6uV5MWVV5yLUytjRYOyGgdmsFBJVICaEBYxgkt
         uLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786678525; x=1787283325;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Az41CYaroyotAz7JNv849XOLanTXMznGgg+V2BVkDF8=;
        b=gnEk7g3gJugvqde8wvU20DcwWvJH4Z5b4m8P3soYUGm/UBFD1MvoTNL4gOyIedjRhq
         agkdEcm0LRvLvrKPUbOpfvV+aS3ytKCrqRtK9SI66CEY9osDrI5ysI57rQWTctnXpYSM
         S0viciFa8n2gcN8PMNGOijnA4Ln2mxNtNGnCpLTzDkQzNhZVSblBARarudHJz6/01ye2
         KNLI/r3VMPJHNcawxKDpmpN2YIzh76i5tp4wnyEFUfQgI2SZdTZeOo0pfvAxx72MBQT3
         bdX7xKa6h89sma8SHlByWpeUwW6wacgOUSOk77V1lHoN0HHmyyKmpxrwL0C853/Zo1FK
         +ZCw==
X-Gm-Message-State: AOJu0Yy5LVs1n2QeWKv0P878NH3posaIuO41gfhaR1ANnO9SJ62a3HWM
	Xumnh0Vi68aXigo1warJ6A14+f/qh36Oy67jFMX3VKTPge1Js8JKgNP5HBVqPg==
X-Gm-Gg: AR+sD116nQCbyjLHD4b8dIQN34oUadq93l5KhcJexFKIdmtxLW3rqG1rT64maWBs3Z+
	mR+YJZt29WrFRV/HQJh1LhJPXdIft0vjs00iTcXBVWIGWJQUFsyjq+1Oa+GMWGoTRcSk1fAr2ph
	OxKO2NqvVFLI6OnZOhcw9czYB5i8FDwQfiDV3jH0W1+aQJWMOAgT8LTdvIhEAe1QsRvbgrjp2cB
	Y/i0aCsvIL0wORzNz7x/xxPkEkfFmpFeIQos+W6oE99qg7grgnXlDEoLUn0IXkd5+apKdi2CdXG
	ye8xZaOT2VF6j2b5LS11vE+k+mSvywXTmcXzDzIeZ3mkwRAowUkbcqeAjtBnpFssrV+jmQt87BG
	ec8IV22sMOlOXn4pBB/jvh1KUAOThNrgv1VYSKyI3N/Rd38c6eR08iaZMDUnLMGUFpMbZmluLBd
	KiXGvXJOQR47xRoxO6AuKVJgB1WRIBDiLNWSufY5pA4FPUsmBPyytZilDwEMil6ljQoMmAYos9w
	HRkbyxBR6BJgVHhD6Dj0Q1cPI5PLSArYsUifA==
X-Received: by 2002:a17:90b:3907:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-3933bd2cd30mr2513248a91.21.1786678525278;
        Thu, 13 Aug 2026 20:35:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eaca2959sm630066a91.9.2026.08.13.20.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 20:35:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3164e669-494b-4c9b-ac77-b58a47a9d30e@roeck-us.net>
Date: Thu, 13 Aug 2026 20:35:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (w83627hf) fix out of bounds read of PWM register
 array
To: sashiko-reviews@lists.linux.dev,
 Mark Sercombe <sercombe.joel.mark@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260813211950.535148-1-sercombe.joel.mark@gmail.com>
 <20260814011934.E6B271F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260814011934.E6B271F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/26 18:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit message inaccurately claims to fix a runtime out-of-bounds array access and hardware register read, but this vulnerability is a static analyzer false positive and did not actually exist at runtime.
> --
> 
> --- Patch [1]: [PATCH] hwmon: (w83627hf) fix out of bounds read of PWM register array ---
> commit 541d179df68e1d4e07bc936b67920fc0623c9326
> Author: Mark Sercombe <sercombe.joel.mark@gmail.com>
> 
> hwmon: (w83627hf) fix out of bounds read of PWM register array
> 
> This commit replaces a hardcoded loop bound with num_pwms in
> w83627hf_update_device() to prevent an out-of-bounds array access reported
> by a static analyzer. It also updates num_pwms to correctly account for the
> W83627HF having two PWMs.
> 
>> w83627hf_update_device() reads PWM registers in a loop bounded by a
>> hard coded "i <= 2", i.e. three iterations, for every chip type. For
>> the W83627HF, W836X7HF_REG_PWM() indexes regpwm_627hf[], which only has
>> two entries. The third iteration therefore reads regpwm_627hf[2], one
>> element past the end of the array, and issues a read of a non existent
>> PWM register.
> 
> [Severity: Medium]
> Does the loop actually ever reach the third iteration for W83627HF at runtime?
> 
> Looking at the loop body in w83627hf_update_device():
> 
> drivers/hwmon/w83627hf.c:w83627hf_update_device() {
> ...
> 		for (i = 0; i <= 2; i++) {
> 			u8 tmp = w83627hf_read_value(data,
> 				W836X7HF_REG_PWM(data->type, i));
> 			/* bits 0-3 are reserved  in 627THF */
> 			if (data->type == w83627thf)
> 				tmp &= 0xf0;
> 			data->pwm[i] = tmp;
> 			if (i == 1 &&
> 			    (data->type == w83627hf || data->type == w83697hf))
> 				break;
> 		}
> ...
> }
> 
> It appears there is already a conditional break that stops the loop when i is 1,
> meaning the loop never proceeds to a third iteration where i would be 2.
> 
> Could the commit message be more precise that this is addressing a static
> analyzer false positive rather than an actual runtime bug?
> 

I'd rather not touch the driver in the first place. A few lines further down
is similar code. We'd end up with no end of cosmetic non-functional patches
if we start to "fix" those. Sashiko finds enough real bugs. Let's fix those
instead of fixing non-bugs.

Guenter

