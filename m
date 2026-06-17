Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDB126059D
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jun 2026 05:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781675885; cv=none; b=ffBi9mwF2ofF1yQVFlzq+PsQRP5CJruD6FJXred424QY+7Jkb59sheQVsLkU0qJa5107MuFqXRsTTg4rtOZOCGHyEc/og/wXG9AuLpFqgOmZvBe+BjkAmsgKlG9l+/h7T924LFlqIXibgwL93xTkpMRHl+EuZnQeHfGIksRPXkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781675885; c=relaxed/simple;
	bh=ifP1Jm9pQSvr4BBArcOmxENG+EW9+nj1rdJ9cv+TplY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7eM73yeK2rELBNKjGWAU2cANy4DVcZizZtS8OFpZfVGYdDI15RzTO6yf0Qb5xu61oaLHYdvWlrI7rD71t54jlknY/Y5GB0EoUGeGnWawnjyh79U3/yftmxgR6pN0I9r6Ncfy33SzXgQP5KSrs2jYH32AdSsbbDTlcM45kOkZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CehtRShK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CehtRShK"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68d9dc18so7355025e87.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 22:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781675882; x=1782280682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVtSo+MU4Z53OtbGrnPGc6UwBuGxvobCSSEYgeFvA3c=;
        b=CehtRShK2t1SxqRDb131sNl0Uu2ULwdKTO3KRBErhU7LcHaSMQcVan4XsU8Abt6ACI
         iD8Pzn1RJHwLa3jflFdg9oeHbirC7FP7jkEP3Pi0QPHbOBbKJg2NFCrHiYal+5qLx+08
         i2RqGKTbTJdUxjPZqGEANV7PDD3YCCjq4HKrKsPeWTPHXxOAaYv+ttBUx+6uyeULroem
         InoNfMJdgNUcI5jbfDG82tptFfb79jXcLrykfyo4pG2lR67kCApKeGjvihok+rIVSfbd
         HrV2RlgZPzNw6EEl7joeX19ZEpyj4KjEUB3zr8lTzd58JKYJCOdbIqYUwxjiUWJNU0L/
         kIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781675882; x=1782280682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVtSo+MU4Z53OtbGrnPGc6UwBuGxvobCSSEYgeFvA3c=;
        b=UM8Wftt/zSSEZr1Ls/HBhMQE4ZJBh1HIsU/6UpByGY6fq8YpJJjNakpa0VV7l380x+
         oIQG1QMCCxNrFU7YBoyFCOXICy7l8a+dICZ+NRykUHeoUagp6RkF34thgMRFFPRKUOIT
         MLFzBIudjuSMElTNKCjZ6wEVqMfPF91rGjfJpX4DvTUutqRRAiEBxmDUSqQd91t5ZcHB
         Zzr9afaUhEZcOeM2fgKbJ/PahfQ2Msca2B9e2oBokRGv2d9wGv7Zk+tEuXDeB+4HlZTX
         QPcYuslSKlkZw+98R1ZwqWY4BFJQ0GjFe+v81vS/Ar8JvAniL00CVpWyKHpUZNr5IYvF
         +eIg==
X-Forwarded-Encrypted: i=1; AFNElJ/DrQrpYaghGnf7V3E8ZxXl+d8MsLWdaDwEe9gg/3nEZmLc/pNDJnfzkjbPOWDFwRJhZGHpvkRc9e0SWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzThYYVBi6L1h1ZfpdMlxw//93D4VKpYYoWxDapH0eYoK7aaMDC
	MOsTA7o/Od6dUiXx0ZIDk9h8fyD7rs1SAXlCZNNXy+JZ3rHTt4b0eiDc
X-Gm-Gg: Acq92OHwXvVj1CeQBZ/0tU6psDDw2vT4DqIUixMWI7nA1MYwecjrV5YAe9j0tXPDjm7
	d0qqrWtkXsMHqrnGcgJ3hDoGa/CgX6Oe6RFlWsJiWNxxZgtO2vCoC3I+wh/3qscCLKPJaVRHgrf
	Ap07yk6Ah7+XnWBaQIFQZe8o27rL5HE0NopTHPDuyYhEwHfiOtFLtxxFmR0klsko85uUJkENGGp
	R2YTFAhd7sxG4EsQM5HbCeMROLO7Bi30W3fioYo5FoBpylt/wF2j+M+ITlSUnWb7fFXb9Hgo5Ks
	o6kB/tCTCP86HEZTGXNzcmP60/VmTpLguLpw88kyeNPRLnMvdbSD/uyLfhjSR3n9IG4N3rzRWsC
	GVcxSFWVmBA9VG/8vKRtvxLl2RxOcw5GR5Dfx6kJwgBOi7BVkGnEh+rtZ5/kBcQEr5jhxA2q1uw
	Jzhn69fcyiyETtRSsDGMdt+ZOlA4lPS085EONpcJhTMwmbOLSQIAkU2hxnrofWUaMLsC9iqw==
X-Received: by 2002:ac2:547b:0:b0:5aa:517b:65bb with SMTP id 2adb3069b0e04-5ad47ffe467mr313621e87.37.1781675882037;
        Tue, 16 Jun 2026 22:58:02 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19ad3asm12697871fa.31.2026.06.16.22.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 22:58:00 -0700 (PDT)
Message-ID: <a7f0ca96-d6bb-4106-ac47-b9f646fa26cf@gmail.com>
Date: Wed, 17 Jun 2026 08:57:58 +0300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] hwmon: adm1275: Support ROHM BD12790
To: Guenter Roeck <linux@roeck-us.net>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
 <d66b9de3-db06-4f83-9c2a-b45e341bfc9c@roeck-us.net>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <d66b9de3-db06-4f83-9c2a-b45e341bfc9c@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/06/2026 17:15, Guenter Roeck wrote:
> On 6/15/26 23:44, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> Add support for ROHM BD12790 hot-swap controller which is largely
>> similar to Analog Devices adm1272.
>>
>> The BD12790 uses the same selectable 60V/100V voltage ranges and
>> 15mV/30mV current-sense ranges as the ADM1272, and the same VRANGE
>> (bit 5) and IRANGE (bit 0) layout in PMON_CONFIG. It therefore uses
>> a dedicated coefficient table that mirrors adm1272_coefficients, with
>> the following differences derived from BD12790 datasheet Table 1 (p.18):
>> - power 60V/30mV: m=17560 (vs. 17561)
>> - power 100V/30mV: m=10536 (vs. 10535)
>> - temperature: b=31880 (vs. 31871, reflecting T[11:0] = 4.2*T + 3188)
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>>
>> ---

// snip

>> -/* The BD12780 data sheets mark TSFILT bit as reserved. */
>> -#define BD12780_PMON_DEFCONFIG        (ADM1278_VOUT_EN | 
>> ADM1278_TEMP1_EN)
>> +/* The BD127x0 data sheets mark TSFILT bit as reserved. */
>> +#define BD127X0_PMON_DEFCONFIG        (ADM1278_VOUT_EN | 
>> ADM1278_TEMP1_EN)
> 
> Please don't use such placeholders. Just use BD12780_PMON_DEFCONFIG
> for both chips, similar to how the defines for all other chips
> are handled.

Ok, thanks.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
