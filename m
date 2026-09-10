Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11CE2D8796
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073223; cv=none; b=nJkqXgFfty7eaEhdMfkdVuW+f9KNVHXfIRE6i5NyHWcbLHb5PnX24rQA+nrqb7A/wjTfkawNqpp4doORDZfV/QMqYPdF8i9Hbd7dNK55AXuy/SCI6grKa6axGPPn13H2coXECOtRyurh0VE42WKXQ667d8Z5aNhl27FAC0qnpLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073223; c=relaxed/simple;
	bh=GguL0Tpxu1x0tEllLbcXtpPMT4mgSFdqn0xEev8r47c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWcxyFmAdtq/Zv6BPYKd/rItN2h7/QIJZq9V4gIo0sB3PtG6QAeqlFEdsQQmoE67EmmssFbJSs7mF2jHf6eHAuwJ0AZBBC9ew6ielE9U3EfZOg2gttXl7N+Afge91jKbiTWKT3UZbmb2vIwL78/oTGvrRbIeymZWNXwDzl6h2TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHza4++x; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHza4++x"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381b831d535so317048a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073221; x=1789678021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4zWLiyM+gghJvQmir/ivYF0h32hKDaEB3alaCEee6M=;
        b=ZHza4++xOzNqbgnhwoRGfjPKhTHTMwZ9Z+BP8ZNwFCo9A7lJtQoJTEiGfOWfuwmymD
         LsVZegL5ZkdvJmg6zXgiasI7vClSW7D6XOJen2hVkOW4v6n/IjlwY6RuHptQF/lbdi03
         hBE/zhTxsy+RNI2X2jUDEMc/QWJinppY6N/3h6LDO/ngtMyDir0tOW8ohRNYsnkHsA0r
         JBcD52/mCtWRfWJ2/p5ZNxpa4L9RDpqh5W1nMGsVr/g9nA7M7SWPr8fhbcLL+TCMqMCa
         zENM7Mm/ycX2gCvRt2f5khctpMGHs+Rkia3yaOpVieXlI8BKzKsw/6zRB8UdMhPaV4Qk
         6Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073221; x=1789678021;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C4zWLiyM+gghJvQmir/ivYF0h32hKDaEB3alaCEee6M=;
        b=b2s5BbAGy7Ob/nDRTqbhGq4kK5UxEW4ynmWPurKxEzv5xrPHZnrzp+k2wtm5ue7Gr5
         uGjvaz077KIEEsRAt/wP8r72bcdkoANMguKy9qk6nwCCcjx4OTZS+3SBvNNSuhAbLyjb
         g94vb59zabY8sAvxWQN4O2qSo6nrfIH4y8938fp79P91W6n+2BiAyZDAq5pbKakbqv3z
         /BbAH94wEOHa2Bl39j2+cVxVZODZeo/D5G76g6BiFgu35TLtA0vIfEjZDGc9DkmgiblR
         uqINvvZTtTH8aUAGO2Zz/hYVwJGYasqWKd5uZZet8V053ermeK9KWKJgMFmFpKbTzqEI
         yKOw==
X-Forwarded-Encrypted: i=1; AKwUvBzmw0rSPpCdnO5A4a8MYAtXe549iT/ek93kyjo9k47CgZK/BT/nmqvGk1J3tnod/hdwldD/ZzFnNnJU6g==@vger.kernel.org
X-Gm-Message-State: AFuF++maR/zVnVegJ1RTM+BqyIy9+JcOjWmbbtmNG4hn1uis6vGKQGSs
	Vjq3jIJpRlINfnZpqXmc67IvOW4UfEI7c28t5z0vrdQpPZyhZ6LOKIlx
X-Gm-Gg: AYBFou11mZHMA72DeypO3tS4ScWl1BK8Tbtq2fyS8mtqXpGOTmP+NH1o0J+SJ8J1SLw
	YC9CUiivIw6egXdyViaHHBAM/s/e+tOgGcIybSsq4dXbLYX3nFIyhfDUq628NTNRqKObzfnnxmi
	FQPoc19tKV57MBn9gXakO6EfcrkqHwLR9UfqAtmcgrkIcF0olJmAFDZnuDOq1zoGsSwjBPhAQGh
	98MNKUOjA9GvO9fogNgklAi7dBcSBRJ6VRZ29qjsudxIXwgxMsS9IyIUny9sKXkhXCtFmzs2/+k
	KTpQqwtxAKIBMvW0vvHocczg9f7vndrkH3w4ze2Vkl66Y72M2m6pm3FrvDLpDQN87C7tcBxdrH9
	wBdMv6nIm31mndns/AlxBMgQKTdtSIzrKsofGGWFjAStLt4lHMe5Gg5f14erKYi5XKzQljAKH84
	y4a5PjkrwTOrlSI0futuyXi3TAbTSCQr/HgaHqNWl5AQccFp56TPZurSCf7khdD8tAxy6+RyFf3
	GuVTgNVOm4VAt/qiG6y1qwejPWkjWYxXr+6+3HKpgPqKpk2
X-Received: by 2002:a17:90b:5823:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39d9c0aad8dmr959717a91.16.1789073221074;
        Thu, 10 Sep 2026 13:47:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm1214256a91.17.2026.09.10.13.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:47:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0d8d281d-3de0-4f9a-b489-8a2106a68577@roeck-us.net>
Date: Thu, 10 Sep 2026 13:46:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (k10temp) Fix model id range of Zen5 Turin
To: Rong Zhang <i@rong.moe>, Clemens Ladisch <clemens@ladisch.de>,
 Gabriel Ford <gabriel@gford.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>
 <54a5620c-36cb-4dc1-bbd8-9647ff7cb708@roeck-us.net>
 <9334E4DA-5389-49BE-A9FF-48A7FF5C1C35@rong.moe>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <9334E4DA-5389-49BE-A9FF-48A7FF5C1C35@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/26 13:07, Rong Zhang wrote:
> Hi Guenter,
> 
> Thanks for your review.
> 
> 
> 于 2026年9月11日 GMT+08:00 03:00:13，Guenter Roeck <linux@roeck-us.net> 写道：
>> On 9/10/26 11:39, Rong Zhang wrote:
>>> Model 20h-2Fh are mobile processors with single CCD. For example, model
>>> 24h is Strix Point, i.e., Ryzen AI 7 (PRO) (H/HX) 360/365/370.
>>>
>>> Including mobile processors in the model id range of Zen5 Turin
>>> processors leads to bogus reporting:
>>>
>>>     k10temp-pci-00c3
>>>     Adapter: PCI adapter
>>>     Tctl:         +54.1°C
>>>     Tccd4:       +148.6°C
>>>     Tccd6:       +148.4°C
>>>     Tccd7:       +149.1°C
>>>     Tccd8:       +149.2°C
>>>     Tccd9:       +149.2°C
>>>     Tccd12:      +149.1°C
>>>     Tccd14:       +22.0°C
>>>     Tccd15:       +22.0°C
>>>     Tccd16:       +22.0°C
>>>
>>> Fix it by removing the said range.
>>>
>>> Fixes: 8440d5aca227 ("hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin")
>>> Signed-off-by: Rong Zhang <i@rong.moe>
>>> ---
>>>    drivers/hwmon/k10temp.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
>>> index 75a45010d687..3e7e63edc6a3 100644
>>> --- a/drivers/hwmon/k10temp.c
>>> +++ b/drivers/hwmon/k10temp.c
>>> @@ -523,7 +523,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>>    		}
>>>    	} else if (boot_cpu_data.x86 == 0x1a) {
>>>    		switch (boot_cpu_data.x86_model) {
>>> -		case 0x00 ... 0x2f:	/* Zen5 Turin */
>>> +		case 0x00 ... 0x1f:	/* Zen5 Turin */
>>
>> Doesn't that drop _all_ CCD temperature reporting for those chips ?
> 
> Yes, it's intentional. Mobile processors don't support Tccd at all, and
> Tctl is the only available temperature metric on such processors.

Is that documented somewhere ?

> In the commit message there is an example of bogus Tccd reporting.
> 
That does not necessarily mean that CCD reporting is not supported.
It might just mean that those processors use a different CCD offset.

Thanks,
Guenter

