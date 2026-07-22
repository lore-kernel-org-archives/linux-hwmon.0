Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9037B36EA80
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784760110; cv=none; b=K70H2+IlXmuGNzMptOLI88qjH/BX5C82vcpx5DMN9ScyLNalYrKeCAHreWoPb1rTtKWi7azf607Bl8DOmPyK3bmVHkFqvKpX9L5MjCMKZ9u4F9Cnv7a+m8iWQEXJ+PJQjtgalzpN5MEvoyYkcrllAy5L+0jAs17TXSSxojwmaIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784760110; c=relaxed/simple;
	bh=cZQEdOKa71qlTHUqcGor8VI9FsxUyhipky3iKFipVFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3+r3dwtuW7XsaBaIDJpAAFSP7W9be+H5oMVN/P2lOErZFnV0U0BXq/rCmQbahsMqTz9HIf2Vq0+N6K3B43ISmMZRUi1zAT1Ky5GRqAaquwGYl7RxX0PiOYTKQpjjpTJmdC5uIP7F0g/TQdcMm9jl0MFJGGvGFsDHq4H6xC8gCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFWJOLmn; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFWJOLmn"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso945227a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 15:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784760108; x=1785364908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeYADC/5bgYt7Iu9XcEtEmwxBuHhd5Lj5rylR5pT0rE=;
        b=YFWJOLmnjOaWGXDWlbT6RonEkFlSrtfyLpZQcEsiJH/XwAlCEJhkxj2fHnMDm6a7Kx
         AJXsk28NG7fhozHe0MMzkEdqlktSSt6CMjmEEgOWXAQ2D2WN77RdDPrSeyRnbj0S8sUP
         haVtawOCU47WQUMjnjTvLmrdnhe2sly9KnE3GwZXu33CPk6G+BavdHcTPbX5lTPSHkeG
         Nip9oMyct7HkmkSlZ0QZL+Rs3KciaHvXYM58nUN77vsbeSxzzdN2cua1xDRj5psA2LRv
         xd4vJcwCQcU8y/EgM4H4EXGKJgoFMpCsByuluMhzmBvHJ4fZWBAVZqS1EAorLQX09O+1
         wk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784760108; x=1785364908;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZeYADC/5bgYt7Iu9XcEtEmwxBuHhd5Lj5rylR5pT0rE=;
        b=nZXxrwWoaWNAaUA0LpNhhUNzdERWKXHLwnAei9h234TlGn+4SkfosCEuHw68+BXdJK
         y7XB6hAKqWQHzcp4QtrFc+msRp956dD8DNLH9PneFhBtaBrb0Q+QHP6BvTcEfNdeJ5Bx
         aADgSwiG+lyZeWX6RKYTlxVwlp5ZU9tM6LmkbySgubMCbIBAEObxcv8+VsXa94K/r4CF
         mw7xkiIunUvmE72J0u+zBAytVii1/hr5b2LooPVG+tNbzq6x3rlMDnVWXZGS8Wr+04Mb
         deAi8rzqUn8qM3o3+m92Gm3EhsAzSo66GAaQjuwAEzTpkhxHnXe9zQ2KPcN3MJL3fZnQ
         7OrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCULnTSO4dAnd6lWHktCfgKGvbZyqEDOKFCfbtEcza1kpjwkzPNen7r2paXmSPdf2DlI9K7hrcZTpcGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysr7xmokk6b7yr+eDPtsDqW+c4YbwsnnCnSz05WVmDJtsG8KDA
	QBJBzKJ+bBM3SKriSAtvSu/QhZf8zLsuzAZshSumE7GKB2mLdePZXxGD
X-Gm-Gg: AR+sD111Mpr1v9vzb4bCenU+v7eMqh5FxzBw9SwycPBbs30zlRBNILO5sF0Vin0OYDd
	uT/ILgoUDRQ9M2qyapL0tOzLowbs85OPp3kdCbKOwH4KWovHIBDb+w8mxiURPaAMSqKCuDGmAph
	YHPYY97yEC2Helydft3QrIy70pK2CTfDJ33bGdysNQ5Yw+fvyhezYTD3kxBX/S1gqFyrKGDYv5e
	L2y35ASLTpGSoYi+pGiw/+7qUi2f9jVZ1clTY88VsAQV+qY0R8ETFIGa0F6pylETUeIPmy9dnsN
	aasLjdz9vNgxQcT9uskHk2HQhxHRdA6qRA0iswaMnDJ+HMKl5keEWPnBRc3jS9o1zr06NlMLDdy
	z57T0DN76GTiTxWLE+Fl6jyP2yoWOQBOKVxc7/+64Qe5jYvHPUEoC0iyY/WlqvyVmJypiIgQK/c
	8d9NEd0eGVoAdqrmWW8REAu5w+GrtasMHkt2IErdbG+Ut7HGuDwSc=
X-Received: by 2002:a17:90b:55c4:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-38ec659a779mr603536a91.21.1784760107776;
        Wed, 22 Jul 2026 15:41:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9218a343sm3984157a91.16.2026.07.22.15.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 15:41:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <82ee0c19-1b6c-4815-87b8-0132820de6bf@roeck-us.net>
Date: Wed, 22 Jul 2026 15:41:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (nct6775-core) Fix number of temperature registers
 for NCT6116
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Gerhart?= <gerhart@posteo.de>
References: <20260722142846.2302075-1-linux@roeck-us.net>
 <b89e04deaef5e6612649c77700c089005f1410f9.camel@siemens.com>
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
In-Reply-To: <b89e04deaef5e6612649c77700c089005f1410f9.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 14:06, Florian Bezdeka wrote:
> On Wed, 2026-07-22 at 07:28 -0700, Guenter Roeck wrote:
>> Unlike NCT6106, NCT6116 only has three temperature registers, and with
>> it only three temperature source and temperature source configuration
>> registers. The register addresses match those of NCT6106 and can be
>> re-used.
>>
>> The code used a separate array to list the temperature source registers
>> for NCT6116, but used the size of the NCT6106 register array to set
>> the number of registers. The NCT6106 register array provides six addresses,
>> while the temperature source register array for NCT6116 only provides three
>> addresses. This causes a KASAN report.
>>
>> BUG: KASAN: global-out-of-bounds in nct6775_probe+0x936/0x46f0 [nct6775]
>> Read of size 2 at addr ffffffffc19561a6 by task modprobe/954
>> ...
>> Call Trace:
>>   dump_stack+0x7d/0xa7
>>   print_address_description.constprop.0+0x1c/0x220
>>   ? __kasan_kmalloc.constprop.0+0xc9/0xd0
>>   ? __kmalloc_node_track_caller+0x194/0x5b0
>>   ? nct6775_probe+0x936/0x46f0 [nct6775]
>>   ? nct6775_probe+0x936/0x46f0 [nct6775]
>> ...
>>
>> Fix the problem by hard-coding the number of temperature and temperature
>> configuration registers to three for NCT6116. Drop the unnecessary
>> NCT6116_REG_TEMP_SOURCE array and re-use NCT6106_REG_TEMP_SOURCE.
> 
> Thanks a lot for taking over and the super fast response/fix. Highly
> appreciated!
> 
> Have you checked how far we get with the auto-stable apply process? I'm
> expecting that 5.10 (and maybe 5.15 in addition) will need some manual
> backporting. Happy to help there, just let me know.
> 

Is anyone still using those old releases with that driver ?
I'd assume that would either be industrial systems or PC style
systems. For such systems, I would not want to be responsible for
all the unfixed security issues in them. A problem like this one
is really like trying to take care of a small broken leaf in
a forest of problems.

So, no, I don't plan to do any explicit backports to older kernels.
I would strongly suggest that anyone still on 5.10 or 5.15 based
kernels should consider switching to the most recent LTS kernel.

But, sure, please feel free to submit a backport to older kernels.

Thanks,
Guenter

