Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4913C1406
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928335; cv=none; b=mx0txVtJODYrWghrVC/iwKe/eiOpn/iqMjGcd2mRQymCgu6vgLQffBBlS56ofSWTYJWu8qUA78eU1pemRiV65IekwKCMdQrf7h2tgDEdR852b1M3bbHUzFdel74SnfFdAL2Ui3bVmj7QBlFVSGQZdUISuU7dPruclY/zARFdo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928335; c=relaxed/simple;
	bh=Iaoxk46tvSh8+Ny6bGv5Jc0llkY7SsZnVR3a5Mw2F+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1h1G2D2BHI+x2WDtzspC1lJwxRXZM6ryX05GfyXH8QppT5M6CeFjA8jrtbB5GZwTCNYKH1tJ06n5VGS5G5JyRPED+MgOqXzcacJhBK3YBJGX4ELj6Imfaws/dIieZayBus8nYTwCbyYZBNXEax6pAf1XSb4Kll6dWBkKON4tRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9g69ZIB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9g69ZIB"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845c92bc464so756958b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784928333; x=1785533133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHn4RRq87Wsfa+wmQLY9ofTV9/may/6+/3F978R2CLM=;
        b=J9g69ZIB1J5URvJlBwwOrbB/XZitLpfxJCE0LQMdg/PxCcAoCc+kwLxh54qg5Uo6ui
         VgQZv+cHB74Ug7xgJp7boBQDlqG9A3pyEgvQejFxcfzrOVE+PEjp2xQ4+I+fmF5kess4
         2LXEn71HHZVI2Xi7RJAQrRojFRKATSOAi28hmhd5QVgUhflcKQ5wDRVTjEw1r+1+uz0W
         rwTocwlxlZ3gm889h9f4ZB/DFiFjlFuZ8jB1gHmeS+6sg3ym0Paqc7BSptDsLIWDHrdN
         qh0fI2NErfQ99Npv6WcJLLXKcW+CgijReUJ6zhT/FNe4ai5Rj7I6ZtjjlEQksU7AtTwn
         z7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928333; x=1785533133;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bHn4RRq87Wsfa+wmQLY9ofTV9/may/6+/3F978R2CLM=;
        b=BhsXQPQxFxJAmlP9hUU2YmC0Czb9AOnP4+FNk84/DTfn8zu626pMWb8N+9tT+9Jz4I
         Y085+QyOkStPAcnfpr/L2JJnHqzHqmqZsMR6QThGneKtP3xnQ/mX72/HX/955g+59XxD
         95J17cl8sH2TnH8EgpEin1VOwuBf3I/PJb0JjuEFnUynkQcN5ke+3fqlqRo6xN5AQI3c
         +DH5HAmjkyr6OVs1nyW+8NWjWCYb3EIKsm8fWCieyu1MDx6Ws8jDXYXQ+SnrLdK8EWvj
         crKjcoDy+bOl/ITZnsE7PqN1e9kYUi6kmo8F8NAHrwWRwRhx5u5fivwW/VA6uuBTDo3t
         VIUg==
X-Gm-Message-State: AOJu0Yzd2nveUOfa+YqJ9x4LxbDbkBDq/6cpht4t8eLaDrD2FS2r48Jv
	SUs+dX6jqz+lb/b5pPRjcZxv8z2Z2bg3Ud6H5s/72ClrpKZyKttlycEI
X-Gm-Gg: AR+sD11QYKrWBcr+7RSz2fRvVTBOzsTFV9vJFAI8ROw1Nw6JaepfMrVzGyocHnPsFRz
	tGKAapjJXxKaRSDzY9lfi35upwIixzjGtdOjaovynZbqha61WkPrU7rSfbvhz/W8rlLO28v9yQW
	VggECGKoNSu9jQL0PPlLHLK4KQ/zGYM3BggEE2Wynlb3CtoRtMnJ/bF03KSoe5lGmA3zgvx3+4x
	aUDna80eYq9QUrEV6lpWljz1hUkksCuUWlYFSurX9YwuLRewEZpctRUwB080mVn57BetT0G7zl9
	hoexo9KvuKs0292JjsHkQ+Xw10MJqnUsRYTfvX7t0cAfRZOc2x3skydfueA9/OxgKm/ATv+gbMl
	6m9rsSap8s+mdCd9MH1YQWBTlj4d5dr5RALbsaJvyjn1WLnzgczOlpsFxvYvsbctWqTGNpURXz4
	ETxRP548NZkQTpCr22kF9yKCHXZVm6r96dAw2eCsRPr+lOIBZ9pTA=
X-Received: by 2002:a05:6a21:389:b0:3c3:7cd0:fc27 with SMTP id adf61e73a8af0-3c67d9b3dddmr67804637.3.1784928333394;
        Fri, 24 Jul 2026 14:25:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm3933937eec.4.2026.07.24.14.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 14:25:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f826634e-5613-4368-b23b-fabcdf2830f9@roeck-us.net>
Date: Fri, 24 Jul 2026 14:25:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "corbet@lwn.net"
 <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>, Debjit Ghosh <dghosh@juniper.net>,
 Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
 Santhanakrishnan Balraj <sbalraj@juniper.net>, Brian Mak <makb@juniper.net>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
 <acd92cd2-ec1d-447e-9e80-35ec5289fd0f@roeck-us.net>
 <20260724194229.261194-1-sanman.pradhan@hpe.com>
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
In-Reply-To: <20260724194229.261194-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/26 12:42, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> On Fri, Jul 24, 2026 at 10:53:36 -0700, Guenter Roeck wrote:
>> I get delivery errors for the following addresses.
>>       ddevineni@juniper.net
>>       gvlaev@juniper.net
>>       avadhutn@juniper.net
>>
>> meaning they are quite obviously _not_ involved in the patch approval
>> path. Please drop those addresses. Also, per
>> Documentation/process/submitting-patches.rst:
>>
>>    Any further SoBs (Signed-off-by:'s) following the author's SoB are
>>    from people handling and transporting the patch, but were not
>>    involved in its development. SoB chains should reflect the **real**
>>    route a patch took as it was propagated to the maintainers and
>>    ultimately to Linus, with the first SoB entry signalling primary
>>    authorship of a single author.
>>
>> Does the above SoB sequence really reflect the approval patch for this
>> patch ?
> 
> Thank you for the review.
> 
> Just to clarify the sign-off history, this driver consolidates work
> from several internal commits developed by multiple contributors over a
> number of years. Each Signed-off-by line was carried over from the
> contributor's original commit, where they signed off on their own work
> I did not add any sign-offs on their behalf.
> 
> The contributions were roughly as follows:
> 
>    * Georgi Vlaev: original driver
>    * Dhruva Devineni: MAX16550 support
>    * Debjit Ghosh: MAX16545 support and device-specific data
>    * Santhanakrishnan Balraj: severe-OCP filter
>    * Avadhut Naik and JawaharBalaji Thirumalaisamy: device-tree probing
>    * Brian Mak: fixes
> 
> Some of these contributors have since left the company, so their
> juniper.net addresses now bounce. I've removed those addresses from
> the recipient list to avoid further delivery errors.
> 
> My intention in retaining the Co-developed-by and Signed-off-by lines
> was to preserve the original authorship and sign-off history. However,
> I'm happy to adjust the attribution chain if there is a preferred way
> to handle contributors whose email addresses are no longer active.
> 

Please only keep the Co-developed-by: lines, as per the guidance above.

Thanks,
Guenter

