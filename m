Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A83E4AEBEA
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 17:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197311; cv=none; b=H91pJbfpYzLy5Qw6j9QOaR4yJuLMh5g5bAZ81HvCgoGiWPYoxanffpR7Rk3UriCj8o5uhHCMRu/f4VIAkEA+tWnPidJUCYq0g3lYWTb1oFIJPWsCBnMf0H6L3mPEZrEa3xQJWM7C4a62heVob9HdcqwPr9tfot0dyxkpNYNZrRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197311; c=relaxed/simple;
	bh=kr5g6GNUMtBa+tXeTXZLb+I7ViUaE1bE5v3zANTsJgE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=amFV+PIRl8D1JK0ZIICSxYBhehy85j4Nk418SgJfkWXqShzby268Tok40WnyBQPrf/ZD3QCzQ/e9NEPVsffQMVSBaK1uDCGyLfc1ifwexJdo5IxjqZxc0tMaD23LPxdLnN3KKPwxrABWPfP7K5V1md8gLOWP4xV57Ko2AHCgviU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/kyvbFf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/kyvbFf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71a50caa9so47565285ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 10:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788197308; x=1788802108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSF8QJep9IJ+coJzLubQ1xQE1rTiksz/vyaXfkfr/tw=;
        b=X/kyvbFfm5P86ksILcRaNjg2Xz2gDTSSRcHY1IRGS7WiGXUJm4jG7tQ+be7yKycmDt
         +C9xfSnOxmkFwYy9aKDzW6IeZp2dcArv8Hb9Mx3DLNmyY/jtWAbwp/vNqJyMJ3mHMgPU
         1FBolumHNW+XJMwcwcVg8O3Y057/evKuWqWG9F+7b3lCEzk0QnK4jJtHdyXlseyCa2xb
         oo0h21d6hauCOOtg5jfqwEK/Beh0NrIeUDUzq4cqiA4RylOccdrj6dKnJwMucSB/yWep
         gu87DUcO+eAw57yzo1Gd4v8e6+LbVbofCeqmBkSgFQ4wisdXMNhrAodo4RcVcr4kNWnc
         g/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197308; x=1788802108;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:sender:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSF8QJep9IJ+coJzLubQ1xQE1rTiksz/vyaXfkfr/tw=;
        b=EERSQS25SiXJh4rI9eHu753PSe//9S/sVbJ991xLfHUeWBNJf8bc3KC3eg7FTNkxxH
         xMsELB2yocbgDsA4X87CU+AjVwrUFAVEvCp7NTHLuowJ0hbs1dDeaej4DBD50xe7MmFP
         pB0oVQASHYPlL9++JwwwUGqp4CGQAYzUvcWxp/vl50Jsn6NUjwtopPvDuifKBmSl1hxN
         MyFJAuSvjAkHhNLq5XDWZiGmXay3q1b0TTto60Oxml34fh/o7p/a2YHUgHbeN5KYa9Rf
         9YT0Qyr5yxWLby7VBxZ8MzVF9YuGl6m6FJZmYF245FHXxoIt0Mq20HS6AtCEegZuV9qU
         TDIg==
X-Gm-Message-State: AFuF++n7c5UHDA1esCPU5QouV5obIcXFW44bemQMXcBAUWBFdYWwl/xn
	KStl5/elYadsXGH4ze9gzuHunwI02P+hg7E2q7+NDc9kLqZo+ckeLwwbwI9Yvg==
X-Gm-Gg: AYBFou0MFfrCM5AxLwHnv2LVh3hmC3Fnh+8lsZ3jjjFYddXifWjhG7uEWu9JUaVi2XK
	mPCak9zeC3J2lcRPe1AXHWavcm4HyAEPfoMVLwcFYSUPV/pM//FbyfQwe7SGbQgurxD2NNzP2+H
	AWKtNnFKhFSVix2nEi/trh6z4wKB4NG5nimMRhVPPBLnoZ2io7v3jnIeBHVU+ZOjcuDOtvOd0/7
	SSdd6caduFPJZEmQVuEQi2VB+O7lbQ8Ueug/XwalpyPHnVkMLwGnW5qKast9eTHeCBluUMg/gIQ
	0nrwoPkYp3WHYQ6n0en6cDiTs80eHNpjEHZyBjcYKGLblFqypBq3lQ+FthWoCRtxgT04NX5hEVz
	LMU8NY2uEArLVHuRHI1p2FkYbfX4dPC+rCvjfI2Bak55YIMQfXruVXu1CQg90+a+kdtgnE1AMKm
	yRSMUKtLwb6/XjmkWMegkYSkLJOXp5Pl5Eaip5B3b9HrwQQdSAj+HxoyzKjijiHZPO+jR1OF409
	VGIV6GjE/19QPgSbuApm8FcUsnaMbdc+6estE4=
X-Received: by 2002:a17:90b:2b90:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-396d0fce294mr45883518a91.12.1788197308117;
        Mon, 31 Aug 2026 10:28:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm520607a91.12.2026.08.31.10.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 10:28:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
Date: Mon, 31 Aug 2026 10:28:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
From: Guenter Roeck <linux@roeck-us.net>
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
Content-Language: en-US
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
In-Reply-To: <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/31/26 08:12, Guenter Roeck wrote:
> On 8/30/26 16:21, Matthew Bettencourt wrote:
>> Hello,
>>
>> I believe I have identified a bug in the spd5118 driver's suspend/resume cycle where register MR11 (0x0B) becomes corrupted and set to 0x08 during spd5118_suspend().
>>
>> Upon system wake, MR11 remains set to 0x08. This persists across warm reboots, causing the motherboard BIOS and OS to incorrectly identify a 32GB DIMM as only 2GB after a warm reboot. A complete cold power cycle clears MR11 back to 0x00, after which the system correctly detects the full 32GB capacity again. Blacklisting the spd5118 driver prevents the issue entirely.
>>
>> To troubleshoot, I instrumented the spd5118 driver to log both the cached and physical values of MR11 before and after key function calls during suspend and resume. The corruption occurs during the regmap_update_bits() call (~lines 505–506):
>>
>> regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
>>                     SPD5118_TS_DISABLE, SPD5118_TS_DISABLE);
>>
> 
> That is a write to SPD5118_REG_TEMP_CONFIG, which is MR26, not MR11.
> I would agree that a write to MR11 would be fatal, even mode so
> writing 0x08 which changes the legacy mode bit and, yes, doing so
> would be fatal.
> 
> Can you also add a debug log to spd5118_nvmem_read() ? I wonder
> if that could trigger writes to MR11 through regmap. That should
> not touch bit 3 of MR11, but who knows.
> 
> Thanks,
> Guenter
> 
>> --- System Information ---
>> System info:Motherboard: ASRock X870 Pro-A WiFi (UEFI v4.43)
>> CPU: AMD Ryzen 7 9800X3D
>> RAM: 64GB (2x32GB) G.Skill DDR5 (Part: F5-6400J3239G32G)
>> Kernel: 7.2.0-1-default (openSUSE Tumbleweed)
>> SMBus Controller: AMD PIIX4 (i2c-piix4 / bus i2c-12)
>>

Actually, we can see what is happening in the log below.

Context: Bit 0 of ADDR is the direction. Bit 0=1 -> read operation.
Bit 1..7 of ADDR is the I2C address.

>> --- Testing and Logs ---
>> Logging captured via dmesg shows:
>> [  277.569950] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>> [  277.570507] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>> [  277.570594] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
>> [  277.571150] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18

Read MR26 for 0x51, 0x53 (0x00 -> enabled)

>> [  277.571226] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>> [  277.572067] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18

Read MR11 of 0x53 (=0x00)

>> [  277.572082] [    T113] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  277.572142] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
>> [  277.573073] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18

Read MR11 of 0x51 (=0x00)

>> [  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  277.573140] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>> [  277.574063] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18

Read MR11 of 0x53 (=0x00)

>> [  277.574130] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
>> [  277.575552] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
                                                                          ^^      ^^       ^^
This is unexpected. It was supposed to read MR11 from 0x51, but the returned data is 0xff,
and the CMD and ADD register values are changed. 0xff is returned to the calling code as MR11.

>> [  277.575617] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a7, DAT0=ff, DAT1=18
>> [  277.576169] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18

Read MR26 of 0x53 (=0x00, enabled)

>> [  277.576237] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a2, DAT0=f8, DAT1=18
>> [  277.577061] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a2, DAT0=f8, DAT1=18

Write 0xf8 into MR11 of 0x51. This is where things go wrong. The call originates
from regmap, which tries to configure page 0 (lower 3 bit) while leaving the upper
bits alone (which were 0xff from above corrupted read).

>> [  277.577121] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=f8, DAT1=18
>> [  277.578063] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18

Read MR11 of 0x53 (=0x00)

>> [  277.578127] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
>> [  277.579062] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18

Read MR26 of 0x51 (0x00 -> enabled)

>> [  277.579131] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=18
>> [  277.579560] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=18

Disable temperature sensor support on 0x53 (MR26 := 0x01)

>> [  277.579620] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=01, DAT1=18
>> [  277.580170] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a3, DAT0=08, DAT1=18

Read MR11 of 0x51. Since 0xf8 was written above, 0x08 is "as expected".

>> [  277.580234] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=08, DAT1=18
>> [  277.581061] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18

Read MR11 of 0x53 (0x00 -> page 0)

>> [  277.581072] [    T113] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  277.581128] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=18
>> [  277.581559] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=18

Disable temperature sensor support on 0x51 (MR26 := 0x01)

>> [  277.581626] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=01, DAT1=18
>> [  277.582236] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a3, DAT0=08, DAT1=18

Read MR11 from 0x51, wrong as before

>> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>
>>
>> --- The logs that are of interest ---
>> [  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> …
>> …
>> …
>> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>
>> I enabled i2c debugging as well in case it helps. The lines I focusing on are “PRE BIT UPDATE…” and “POST BIT UPDATE…”, immediately after regmap_update_bits() the physical bus value for MR11 shifts to 0x08 while the regmap cache remains 0x00.
>>
>> I looked through the history of spd5118 patches and bugs and noticed there has been some issues around suspend and sleep cycles. This might be a deeper issue than just the spd5118 driver.
>>

Those problems are related to I2C controllers on some Intel boards, which disable
write operations. That does not affect AMD systems.

The problem is that one of the MR11 read operations fails or, rather, returns
bad data. This bad data then corrupts the register when written back.
This by itself is odd. There should be at least a debug log message if there is
an error in piix4_transaction(). Is there anything on address 0x22 on that I2C bus ?
It almost appears as if there is a parallel access to the I2C controller (for
example from ACPI) which would corrupt the data for the spd5118 access.

>> Additional Notes:
>> - Intermittent Nature: The issue is intermittent and typically reproduces within ~10 sleep/resume cycles.
>>
>> - Single DIMM Testing: I was unable to reproduce the issue with only 1 DIMM installed after running over 30 sleep/resume cycles, though the intermittent nature makes it hard to rule out entirely.
>>

Both is not surprising, given that we are dealing with corrupted data when
reading from MR11. I have no idea how that corruption can happen. The above
is a wild guess: If there is indeed ACPI access to the I2C controller, the
only remedy I can think of would be to black-list the I2C controller driver
itself.

Thanks,
Guenter

>> - Hardware Health: Memory stability was verified with a varitey of memory tests with zero errors. Issue occurs with JEDEC and XMP profiles enabled
>>
>>
>> --- Steps to Reproduce ---
>> 1. Boot system from cold boot. Load the spd5118 driver.
>> 2. Put system to sleep
>> 3. Wake system
>> 4. Check value of MR11, if corrupted warm reboot go to step 7
>> 6. Go to step 2, repeat
>> 7. System now shows corrupted DIMM with a size of 2GB
>>
>> --- My test spd5118_suspend function ---
>> static int spd5118_suspend(struct device *dev)
>> {
>>   struct spd5118_data *data = dev_get_drvdata(dev);
>>   struct regmap *regmap = data->regmap;
>>   u32 cache_val = 0, bus_val = 0;
>>   u32 regval;
>>   int err;
>>
>>   err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
>>   if (err < 0)
>>   return err;
>>
>>
>>   /* 1. Read cached MR11 value from RAM */
>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
>>
>>   /* 2. Read physical MR11 value directly from I2C bus */
>>   regcache_cache_bypass(regmap, true);
>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>>   regcache_cache_bypass(regmap, false);
>>
>>   /* 3. Output both on the exact same log line */
>>   dev_info(dev, "PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x%02x | Bus: 0x%02x\n", cache_val, bus_val);
>>
>>   regcache_cache_bypass(regmap, true);
>>   regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
>>   SPD5118_TS_DISABLE);
>>   regcache_cache_bypass(regmap, false);
>>
>>   /* 1. Read cached MR11 value from RAM */
>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
>>
>>      /* 2. Read physical MR11 value directly from I2C bus */
>>      regcache_cache_bypass(regmap, true);
>>      regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>>      regcache_cache_bypass(regmap, false);
>>
>>      /* 3. Output both on the exact same log line */
>>      dev_info(dev, "POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x%02x | Bus: 0x%02x\n", cache_val, bus_val);
>>
>>      regcache_cache_only(regmap, true);
>>      regcache_mark_dirty(regmap);
>>
>>      return 0;
>> }
> 

