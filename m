Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BF924677B
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693576; cv=none; b=TUPab8BipUM+d/WEXxMmYEuuiAGZ4+CNIOKIH4WEDfQ4SEFcK4dO41bhFzwKie0ErgLosxcSrimnCRCMUjr8M5KUG5isuakdsQMQUHVXB1ZSMMj6o0KjP1DGWSWhbG2IoWK4WITLCoLxArxxzwYFYvgWKk3oAS4ic05QSgbklXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693576; c=relaxed/simple;
	bh=/YUkyMvPt6U+pQ5Roi7nh+XtCxYVUN74DezD4OjWa9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGEBsBmmzxuuStRbRg2Min/PTSE0HZvIOuYdztLrjlqIqhWyUXoIjyBXRlf6PZK4NohmgK5iJmxFTfG4OWmDxk29DBZl7At7GjCDB0XEUHTMchoaK00I1/W6gCDj6s3M+qtGziAdvUmXG4ARhE6mABD+ffoO9UFXO9rg9bhThlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1Eyy/dH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1Eyy/dH"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-381018b9375so1279466a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783693574; x=1784298374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKZTQkHZkeTjhPFHa5agjLsOx5G5hOnFb+f0Lw0BHyk=;
        b=d1Eyy/dHBtXrp9iXoge829Mg6xvj/pWuGdJw8s0ctD5ng7l78MH2qn3lNIqAh0ejms
         9DKEurpNP829V3IfE3vsAMYP51sT5g7yiODkxEhu2YfkFsPg8+KJ5sFPVlzV8nrRANeO
         qbU/AfhHizziWpEtnDKsqulmE+N10tLUbBz1KE6ordVJG6M+urRDi41OHnk2pPLGzF7N
         Kaa+LMZ+YodDzaANhfp1tjOnQKuPvy0SYI7mSQCnIDW6ZoYn5haNAv9xT+zbp+ViBgfZ
         8JjkMfnBmXq4+08tq0oucPhvmm6MmKOU9nRHu8ZwXx0Wb33rnSVbcJAD3eRfD23eK8V0
         Z31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693574; x=1784298374;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BKZTQkHZkeTjhPFHa5agjLsOx5G5hOnFb+f0Lw0BHyk=;
        b=G8rhsSkuV+2euAVfCBWXoC5WX/gTot8gQ8eddyIBKoCsezJuKVWDSnAaV8zWQtr3ZI
         MPbKcJontCWNN66xDHq4gkw4m3K1cH/PfSagJyJdlpKvOU4WwUya5exCoW8kQN738gpY
         t8IANq+tiazEHJRoG6hcN9hKUblVdf7oESqp8idqPjg2TIiS7WG1N/EZ6S3tqwr1Gb7S
         tZpPocBVPsCN/Jv2EC3UltMe+6d5ojWGx8aonAiF2gFIUVYA+vV2MpXOmFSIYNEWdfi7
         wH/tZVtF1TLS7Xav6hl/VZJJy0LcZDv6GMVs0/AYo+8ZmEwXLS8dzQg1WGGI0ML4ZNsi
         XaXg==
X-Forwarded-Encrypted: i=1; AHgh+Rqsb9G6VT8IbEt8EFhU7VEHKpU2RSwrA5TgnW/2MHIRPH+6+IUXmYiUAhGhvU9qQZUC3txNS92Z9Xh4jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYj7pnccTlYsSoZ8YCWCShb17nz9Y2MfCU9KXJYqKkKDcpHRy3
	U8zF1iix+V0DmnyzLK/UHcHkJHBeRCyw3dwaAmpFJttO3ApVHCYEWQpW
X-Gm-Gg: AfdE7cnZeQDERvoBOMv1lYhCtkBo6YTytBF5ra4uAmjY9Xwpgy9haLefsEemXsUW+Pz
	0Rqu7oYdKE6+WPB0imtXclqe0k0IE82gpSDn6cPZdBvScJ1vKh5/GaAGtkmGGQMBYmVQ5rWwnKI
	yzAlOS9v8iVSl+UfVOfSQDclE+YUn+vcTYYcQCwjgxDLSjQRQcHwViQTATYCZkaDOiHJyPKhz6+
	APM3LkCMh+U31stKW+RP3Mo68HBcobUhZtOrR52wjmht93L2gGVHcrhAHRhsKA6hahqez15zRfr
	Qzvin7UG20qe/q0SC6d/5+MzO7m9SPu4OKtr7SDJ9z8BqHDq6u+6KHQ1ASuS9lWLXNXoe5xEwmU
	v2sHQIsmrQ/2u9Q81PEBK6VQCiZ+2t6jEM/XN3GQUbGkOzSdsRfwB5RbJ1Yx0NkuWCb6+Ldo5iA
	BfQmQW6GIKBeAx27jr/imvoIL12B581lrheneSlanSe8GMZw0LSzo7GvrCwzUuHQ==
X-Received: by 2002:a17:90b:564f:b0:37f:d6d5:8e8c with SMTP id 98e67ed59e1d1-3893d91fed4mr11239462a91.0.1783693574235;
        Fri, 10 Jul 2026 07:26:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55a47286sm2771225a91.10.2026.07.10.07.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:26:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <91905ecd-b7fa-46ea-8936-90c37b85e794@roeck-us.net>
Date: Fri, 10 Jul 2026 07:26:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] hwmon/misc: amd-sbi: Move core sbtsi support from
 hwmon to misc
To: Akshay Gupta <Akshay.Gupta@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, NaveenKrishna.Chatradhi@amd.com,
 Anand.Umarji@amd.com, Prathima.Lk@amd.com
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-2-Akshay.Gupta@amd.com>
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
In-Reply-To: <20260710111642.850022-2-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 04:16, Akshay Gupta wrote:
> From: Prathima <Prathima.Lk@amd.com>
> 
> Move SBTSI(Side-Band Temperature Sensor Interface) core functionality out
> of the hwmon-only path and into drivers/misc/amd-sbi so it can be reused
> by non-hwmon consumers.
> 
> I2C probe parsing is moved from drivers/hwmon/sbtsi_temp.c
> into drivers/misc/amd-sbi/tsi.c under CONFIG_AMD_SBTSI. The core driver
> stores struct sbtsi_data on the bus device and registers an auxiliary
> device amd-sbtsi.temp-sensor.<addr> per target.
> The current hwmon temp sensor will now require the CONFIG_AMD_SBTSI
> configuration as a new dependency.
> 
> This split prepares the driver for additional interfaces while keeping
> hwmon support in hwmon subsystem on top of common SBTSI core logic.
> 
> Add platform dependencies to clarify this driver is intended to run on
> the BMC and not on the managed node.
> 
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>

Regarding Sashiko's comments, I asume there can only be one of these
in a given system.

Given that,

Acked-by: Guenter Roeck <linux@roeck-us.net>

[ Assuming that the series will be picked up together through some
   other maintainer ]

Thanks,
Guenter

