Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643E046983A
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189168; cv=none; b=nkhDrTZOqVibg1df1lhcRAhS+lyJr0jTI9cK5VWupEnvHl6zjBbC4/xRXoMjyq8tDB/MPV5Re8S0B/OHY1nzlneG4w6hh54OCTOZRXs+1hZ9zR9Vcb9j9KV69bmT+xUWTri9Ra01ukLbJ0MnLFe1RTqUbJOuE4RBgjQtfShoONA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189168; c=relaxed/simple;
	bh=YIZZZluHBFyTmrEhX6GjMNyPgo9I/IO4ectw5e72EpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyUToklLN+qnfn4klmCG5ybLCLVPyTP7GikqO6wSlj+7IoOCrenqRMbZqZMc8j06iT8rc70TEEY2n2tTjYsbFz1cnQYMV8k7P6Bgm13+vcVQPtp/vRGAJ5aA+8XE17ypsBp4kaMP5KYA29KoiPOiYUmb1WjrsrwaXWSjZ6gsGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIeYBlDz; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIeYBlDz"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2816842a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189166; x=1788793966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDWYtHByft8xGpxoRkCtN4AaGdhh2zPLd5cTq+npXiE=;
        b=UIeYBlDzI16xtFCFe9aI9V3JcN939MEf6x3LuaG/ZT0u+sro4BFoR9EMgyIsxeF+TO
         cfMK8/f3UKYmEFZAgOQRFN6go0TaaOU1vDstTOBeAovOwWeV/UMZIa2KK75puMkb/4fn
         EZFMi87mKD/t6R8NA9LksT2HqpbWH/Ebn2ZuEKKyL9GBeyYOxNWm8SrNm843/1B9GCLV
         g1ugFhhkrc48vxXmDj+/tZ5r+PSD+QEKb0G21ecCF7c5DcgAqF0u9RFnUS0KNfv0Ynet
         4JLoTeyEvQXAI6Vo3M5KneCvUnJwVU6N0YhLsjpHnqFKRsG7z0Uwue61Aoj0CpV9V/qm
         M9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189166; x=1788793966;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PDWYtHByft8xGpxoRkCtN4AaGdhh2zPLd5cTq+npXiE=;
        b=m8i3UOp/3fvlDVu4aLfLEvG+Hzh9W8cLzT4Cp1E9BlCXvRSNGKf/llszQ2wGX42kQN
         oaTCpPx+6HSttpH4tDUhzwoeBHDB40Xuu69yBfUPfpKsAif1Wu6H5huSpVo0VcBLB2dm
         9AB5WZQPxAMbEjhpgICxGAg3iBg6bYIkHxzF4P2isviuzmlD7dHPKAGfkbxB0RqtXqC5
         JQCfSCV2uKsevI1fAhxHHf9SBMeNiF5ssas9r+sbGMPWtG6dEECcaXyB5ytC6+N9CoRr
         ThsAdiJruR0k53TVepE8XgbDU0e0rGcZNDiuy93BDnUNNh4bCDS0XcrWKVYF5Zwkj17/
         8QJA==
X-Gm-Message-State: AFuF++kAmuLAzpBh9w5olmTh3tlnnRreZePGDz+fJYm18FczXHSJMyj4
	CdYoBSqW8bjNOTg3r2rIsYXExq0FcdkhjCyCgjoC4DSVGLk2va8wDsVdwpxpZQ==
X-Gm-Gg: AYBFou0XWuqEUuroiPqb7S4odJu3LvKohpQFVxLKwN7X5dd2SGho5Bvg7OZchq6CZRK
	Dkl7jqm2hAUdkimzX/wo7zOqZt2tuWK8Ft5FlAJ0AjgQ14Y1GK0CVr5BsjeSBt4lbDZsxCOdSvQ
	Wu8BeKSNRp9Lh9S6Jffh3V/6UV8a3pNrzbbujR7pZGRRq5Tu4LU4Xy9BkfDPUgBGv9nfu0corIb
	FIFQEfICufMw5OqtsommN9QLarK4IuAC5zyS+Kh0zZTixbt60w17HBHpuD/NJe/Ljafy9wFAfYi
	YQnXzJ+OeoGe3arGWH5beUmNK9AkQsglUrsom43caxoE4ha9N5DPal3CqVbckB+yG/OoKfHLHsy
	s/LX2kHdSnFFUVXbxfeeA0jaOv7rpSb0t6ox6NXoCHgg0qdilOH/swACPKE7xnT8V4czyaBpOsB
	iZHlghaHSOmdT3lbm+PD2WtSMIuXvDOZhdkLPjB2q9nDDSskges5kjWTNzbGQmhpmlYc3LwNC75
	gLdblEMUjCvHC84ae6eE2+7q4ps5jbvxzAZUQ==
X-Received: by 2002:a17:90b:2551:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-396d0fe384cmr47038511a91.9.1788189165520;
        Mon, 31 Aug 2026 08:12:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398b83e6962sm12867948a91.7.2026.08.31.08.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:12:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
Date: Mon, 31 Aug 2026 08:12:44 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/30/26 16:21, Matthew Bettencourt wrote:
> Hello,
> 
> I believe I have identified a bug in the spd5118 driver's suspend/resume cycle where register MR11 (0x0B) becomes corrupted and set to 0x08 during spd5118_suspend().
> 
> Upon system wake, MR11 remains set to 0x08. This persists across warm reboots, causing the motherboard BIOS and OS to incorrectly identify a 32GB DIMM as only 2GB after a warm reboot. A complete cold power cycle clears MR11 back to 0x00, after which the system correctly detects the full 32GB capacity again. Blacklisting the spd5118 driver prevents the issue entirely.
> 
> To troubleshoot, I instrumented the spd5118 driver to log both the cached and physical values of MR11 before and after key function calls during suspend and resume. The corruption occurs during the regmap_update_bits() call (~lines 505–506):
> 
> regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
>                     SPD5118_TS_DISABLE, SPD5118_TS_DISABLE);
> 

That is a write to SPD5118_REG_TEMP_CONFIG, which is MR26, not MR11.
I would agree that a write to MR11 would be fatal, even mode so
writing 0x08 which changes the legacy mode bit and, yes, doing so
would be fatal.

Can you also add a debug log to spd5118_nvmem_read() ? I wonder
if that could trigger writes to MR11 through regmap. That should
not touch bit 3 of MR11, but who knows.

Thanks,
Guenter

> --- System Information ---
> System info:Motherboard: ASRock X870 Pro-A WiFi (UEFI v4.43)
> CPU: AMD Ryzen 7 9800X3D
> RAM: 64GB (2x32GB) G.Skill DDR5 (Part: F5-6400J3239G32G)
> Kernel: 7.2.0-1-default (openSUSE Tumbleweed)
> SMBus Controller: AMD PIIX4 (i2c-piix4 / bus i2c-12)
> 
> --- Testing and Logs ---
> Logging captured via dmesg shows:
> [  277.569950] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
> [  277.570507] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
> [  277.570594] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
> [  277.571150] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
> [  277.571226] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
> [  277.572067] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
> [  277.572082] [    T113] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  277.572142] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
> [  277.573073] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
> [  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  277.573140] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
> [  277.574063] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
> [  277.574130] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
> [  277.575552] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
> [  277.575617] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a7, DAT0=ff, DAT1=18
> [  277.576169] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
> [  277.576237] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a2, DAT0=f8, DAT1=18
> [  277.577061] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a2, DAT0=f8, DAT1=18
> [  277.577121] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=f8, DAT1=18
> [  277.578063] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
> [  277.578127] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
> [  277.579062] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
> [  277.579131] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=18
> [  277.579560] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=18
> [  277.579620] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=01, DAT1=18
> [  277.580170] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a3, DAT0=08, DAT1=18
> [  277.580234] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=08, DAT1=18
> [  277.581061] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
> [  277.581072] [    T113] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  277.581128] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=18
> [  277.581559] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=18
> [  277.581626] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=01, DAT1=18
> [  277.582236] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a3, DAT0=08, DAT1=18
> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
> 
> 
> --- The logs that are of interest ---
> [  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> …
> …
> …
> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
> 
> I enabled i2c debugging as well in case it helps. The lines I focusing on are “PRE BIT UPDATE…” and “POST BIT UPDATE…”, immediately after regmap_update_bits() the physical bus value for MR11 shifts to 0x08 while the regmap cache remains 0x00.
> 
> I looked through the history of spd5118 patches and bugs and noticed there has been some issues around suspend and sleep cycles. This might be a deeper issue than just the spd5118 driver.
> 
> Additional Notes:
> - Intermittent Nature: The issue is intermittent and typically reproduces within ~10 sleep/resume cycles.
> 
> - Single DIMM Testing: I was unable to reproduce the issue with only 1 DIMM installed after running over 30 sleep/resume cycles, though the intermittent nature makes it hard to rule out entirely.
> 
> - Hardware Health: Memory stability was verified with a varitey of memory tests with zero errors. Issue occurs with JEDEC and XMP profiles enabled
> 
> 
> --- Steps to Reproduce ---
> 1. Boot system from cold boot. Load the spd5118 driver.
> 2. Put system to sleep
> 3. Wake system
> 4. Check value of MR11, if corrupted warm reboot go to step 7
> 6. Go to step 2, repeat
> 7. System now shows corrupted DIMM with a size of 2GB
> 
> --- My test spd5118_suspend function ---
> static int spd5118_suspend(struct device *dev)
> {
>   struct spd5118_data *data = dev_get_drvdata(dev);
>   struct regmap *regmap = data->regmap;
>   u32 cache_val = 0, bus_val = 0;
>   u32 regval;
>   int err;
> 
>   err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
>   if (err < 0)
>   return err;
> 
> 
>   /* 1. Read cached MR11 value from RAM */
>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
> 
>   /* 2. Read physical MR11 value directly from I2C bus */
>   regcache_cache_bypass(regmap, true);
>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>   regcache_cache_bypass(regmap, false);
> 
>   /* 3. Output both on the exact same log line */
>   dev_info(dev, "PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x%02x | Bus: 0x%02x\n", cache_val, bus_val);
> 
>   regcache_cache_bypass(regmap, true);
>   regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
>   SPD5118_TS_DISABLE);
>   regcache_cache_bypass(regmap, false);
> 
>   /* 1. Read cached MR11 value from RAM */
>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
> 
>      /* 2. Read physical MR11 value directly from I2C bus */
>      regcache_cache_bypass(regmap, true);
>      regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>      regcache_cache_bypass(regmap, false);
> 
>      /* 3. Output both on the exact same log line */
>      dev_info(dev, "POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x%02x | Bus: 0x%02x\n", cache_val, bus_val);
> 
>      regcache_cache_only(regmap, true);
>      regcache_mark_dirty(regmap);
> 
>      return 0;
> }

