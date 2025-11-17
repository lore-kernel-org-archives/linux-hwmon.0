Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3D223F439
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394250; cv=none; b=YBjioieHi2BW6NRF2NPDUIU/ABoiSh8eyICYtdO8mrPc/2j3iVDdERXqxEVovU0iknvYMc9YyadJId+6dcS6mYH3Z7JpzroeZJb+aL3MLgAMWJcy34jUbYKvrmXaNJCkID7lbzleUGUMYg2308fnxonKRflDV2ew3SQTFtPKDTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394250; c=relaxed/simple;
	bh=HEkyxJffLh8UwBz5FLuEoEHLrFMnbm2r66mosEAtn6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S7a4MykpPaY00wc9B/A3TI71oOU54zRfvzBhs9bUFm/w5iNJ49wL+X3Qs0qXwRYCJhmo9cBZNAxyKdFKIpLJxc6LhzSuQPOguBUSIR7pzUwetDM2GnTO9ouCFGDg8xV66Id8kbvWi7CJnyUsaL9l3M3mmEmhD6E5QrTcYbsTQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNVtP/8f; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNVtP/8f"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b75e366866so2376062b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 07:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763394246; x=1763999046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3rehd6DdYXimjLUiNsuT1HJpCXceVHcuetM43ruOXe4=;
        b=jNVtP/8fvi2QkJi5ESXmTPs1AUkxVUc+AMC1Jva6ZF5zPg2aBpCSWHSUxYnGdqHpAQ
         NdhQOMHMjhUSq8I8a/BBZ6BSZ/bL1AH13aiHfSJZCfeklXd6B2DoXrtvrtXIEs9sMKjk
         FjqBBjaCKJGArPAUFG+ZxZpWwDFIofLRyh6go9lNGU0MytC+VcaSttW2kkl31wClZ3Tm
         KlkMxHUwG6Q64vD5s9VV1XyCFdjFO5wN1scmOXqh8JypF02SOcxpYHtCfVrZpmZREaED
         uatA9yu2/cysAAijIs6TO0ZPWz9A4SqJn/4Wxe4xpIs6L7yIFNyaGhZslzn++3bOc0c/
         E0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763394246; x=1763999046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3rehd6DdYXimjLUiNsuT1HJpCXceVHcuetM43ruOXe4=;
        b=asFEvFP7M7nQI7wAPa3T9ElFUutofo2dWtBFTinD1UlBFSmexI3L0SL/UnzIq/ENdv
         L9A2L4I1IRnKVvw775748yT29a4eyO7yfNKKHpW6Jknm7QdhVbNj+Hy5RPKmSynk0I9N
         3C4g8uqjzaa9AIHyVONEkM8QAQgjOuIFGIsd+zzEuiWb90P+334wkr9Zvs6yKawoW76j
         SSn0zyVwamNPJ5vnt7XbOKCNbOWqVnklrdiajUcQHDF8fguugAm5xQAK17uH9cyk92JT
         9RqNsSxEn2c1dBnXcMTe4YDVgyzeJT4zwJCPLrMpltXVZjyQfCmeoitAlSMxtgPzH8uz
         YQmw==
X-Forwarded-Encrypted: i=1; AJvYcCWCbq7L6APX6rJQZJx4W7/n0fA8PvToZC3C488nLMmJiVeYLMrC1R6IPbWIH+vZc/5bvNhGeb6gjJ557g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxozzxXKACO1bZDLcsxBimFA5XEKsFMasP+5d440+daHUq2zHN/
	iQd1Os3eLrdqha6Ats3qJ4rEXIV8OkvT7NzuqXHUSjsHj4eRswAOvEZy79+XKg==
X-Gm-Gg: ASbGnct3LO9dYngFlB3wyy95h2yy9IyH49r45KZANC7WTuSgytn/qfrK47dYT679ARK
	hEx3m+52YtnJIIOdiPuOKwX2we+UqQ7LfEePAFd5+I4caMPuQWQAgsD1fwtmX7JZ0Pdoeg2KH3G
	qXh2Jd8Heiv1Qf8TZR3AXtnCTZjTC+sMGJVyxNhH1f/0pd/NeTBVda+I3b+LK+jNMMyLw5to6bJ
	iTjCPEC0kwGrgkf5SZl94BHl4OwXdm2bMPLQWWIESyBKD3EdLSMMkZGVR2pdqwkyl3bme7oJohO
	zeAuE/Ly/v+Ak+dK0lKodkfzxj6IhohZS5NFw8yoIEDhI+Mbs+bl3moSwFEBzOHB6zTFP2lfNXa
	G7Lv+G7FPrrL46d5GM6/OX3aBvgpHDT62cqXOXEXWk5UvfzEFrdpPee/hu6wuytL97Q5Lu5M0iZ
	Jo6QQg1dReg2uDiGiZWJjDCV1BtxLs6WLCd/BiajRQ3QMJhrNvQSdsDbyT4cHAtX672XBw9g==
X-Google-Smtp-Source: AGHT+IFC0GsQiXx83PgatOX1fUg0DCztuPOugkqPKRPMyTr2E16cQB1Qhh/hpvEHeZnXIxSegWvmHQ==
X-Received: by 2002:a05:6a20:7290:b0:352:3695:fa64 with SMTP id adf61e73a8af0-35ba228d6d6mr15182302637.37.1763394246290;
        Mon, 17 Nov 2025 07:44:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aee8afsm13732955b3a.8.2025.11.17.07.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 07:44:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9e761121-91f7-43b1-9f7f-866acf1fb7ad@roeck-us.net>
Date: Mon, 17 Nov 2025 07:44:04 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] add Via CHA ID to via-cputemp
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, linux-hwmon@vger.kernel.org
References: <20251117.133746.173713564005237147.rene@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251117.133746.173713564005237147.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/25 04:37, René Rebe wrote:
> Add Via CHA ID to via-cputemp to support reading that CPU temperature,
> too.
> 
> Signed-off-by: René Rebe <rene@exactco.de>

checkpatch complains:

WARNING: From:/Signed-off-by: email name mismatch: 'From: Ren� Rebe <rene@exactco.de>' != 'Signed-off-by: René Rebe <rene@exactco.de>'

Patch subject should start with "hwmon: (via-cputemp)"

Your patch does not apply to the tip of the upstream kernel (v6.18-rc6). Please
rebase before sending the next version.

Information available about "VIA Centaur CHA" suggests that the CPU was never
released. You'll have to provide more context and explain why it would be necessary
or even make sense to add support for it anyway.

> 
> --- a/arch/x86/include/asm/cpu_device_id.h	2025-10-07 17:07:15.564453320 +0200
> +++ b/arch/x86/include/asm/cpu_device_id.h	2025-10-07 17:12:32.812472408 +0200
> @@ -19,6 +19,7 @@
>   #define X86_CENTAUR_FAM6_C7_A		0xa
>   #define X86_CENTAUR_FAM6_C7_D		0xd
>   #define X86_CENTAUR_FAM6_NANO		0xf
> +#define X86_CENTAUR_FAM6_CHA		0x47

I can not touch this code without Ack from x86 maintainers, but you did not
copy the respective mailing list nor any x86 maintainers. This is especially
necessary since the CPU was never released.

>   
>   #define X86_STEPPINGS(mins, maxs)    GENMASK(maxs, mins)
>   /**
> --- a/drivers/hwmon/via-cputemp.c	2025-10-07 17:03:12.142438673 +0200
> +++ b/drivers/hwmon/via-cputemp.c	2025-10-07 17:53:55.232621776 +0200
> @@ -134,7 +134,8 @@
>   			data->msr_vid = 0x198;
>   			break;
>   		case 0xF:
> -			/* Nano */
> +		case 0x47:
> +			/* Nano / CHA */
>   			data->msr_temp = 0x1423;
>   			break;
>   		default:
> @@ -273,6 +274,7 @@
>   	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_A,	NULL),
>   	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_D,	NULL),
>   	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_NANO,	NULL),
> +	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_CHA,	NULL),
>   	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 7, X86_MODEL_ANY,		NULL),

The hard-coded numbers were changed to defines with commit 5cfc7ac7c1bf6 ("hwmon:
Convert to new X86 CPU match macros"). I don't know why that commit did not also
change the case statement above. Either case, I'd suggest to either use defines
everywhere or not at all.

Guenter

