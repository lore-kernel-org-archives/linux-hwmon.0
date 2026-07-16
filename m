Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95D2F8EB0
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 00:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784162080; cv=none; b=n8DsHa/c6s7iSkjmVtqB+8+927yvGLxXWOtRm9Fi3Ch60Aujr8Ka2MSGLby3nBoWSz2qkgWGJltlNeTxrete325/7iWXGVKfJYQYhMNNd0d8nfbHcEzlzhTBgS0iYQzftQwH3fRfA0uoVkJwV4Qb6r+FccPNCOpDDcbxWMeEvUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784162080; c=relaxed/simple;
	bh=CkM9n05E1JJV18aPmEQArMI/CFcr1QAuKsnppFuHYTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2ZEvSNGs8VG3DumFMJkUNDrpCkAKTlCMulIMytWKjzq8vzEVaYjd4sB5GFqo8ozh7sh3ZUtj1MTS/3vRbao0cmt3RtyBii4v5foLZYRsNZpv0t6mQ7QRZqK+IcGRKPT17pVjODVFGQGHFa2b63h+EgWSJWCD7rcPaeDreUZHtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U01WBPd9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U01WBPd9"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848743155bcso1167191b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jul 2026 17:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784162078; x=1784766878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLH47Bsvp6OcohDkOWI4H8aLbKmYqkgNg0YQkcC0sus=;
        b=U01WBPd9m8qkf6K9aDLXEdVT+lM3Ivodw57JEmBx6yYVZsSbuKWcU2Uiv04nAIjrNu
         cl7dyB4sr6JVFaQfP3tvPp8k4M+RIdzqTcfxc2kuTehMOYMu6mwCc0Y1S97ji1rfFLLx
         DfblQAHUg9uFk54DxHqzbXtLuzCttMYouvUGw6qqhxdwvQzvDUNmz6I844uLekk/o955
         HvNatXp29TTPB3PQ1Mg4Wpuor6AM2UGu//O8FEVeoE4UIcLPsIdGMMITyQOgA63IuPv6
         iT/vkaqV3/bRkFCr7d6Q2HqqoChkQKdhRKQWQLV2Qq7382qso/IlyImcpOMX5nD4kA0I
         mWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784162078; x=1784766878;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KLH47Bsvp6OcohDkOWI4H8aLbKmYqkgNg0YQkcC0sus=;
        b=eUOvonJwtdZ3bKORXDAwCAgtOzMDxTqfIBKLDHk36bCNVvr69hi/GLtJNCP4dbikwl
         4AY/ENLnCgcn1zT3C1qveOdDMo+XV9aASdcm4qzqm5G2IGxjgig2+dgLkjWY8Ao/Xm1h
         UPcc1OTalDyqww55bD5OHuzDdM6pQ0B7hu5o40U0l/2EM4anw2doYOamSR+qZn46CV/7
         JrzAf/dYXzHRNuARReJaLVQ/9CtSbDHfuB1W7PGFPXczHkNBLeYI0BIAOtD3pX/3MIo0
         /inoOUM3AS3HC4aTt1+4r0H9JdeMq6yLZ/+aSEc9BmHMU+hfxUK4VwcznXlDcT/k8wf8
         2ZTw==
X-Gm-Message-State: AOJu0Yy2pIZk2vnu9MnKIGhRse8MEm1gwYMHITTMFGc0+NRMKtfe8xxQ
	POLDH3wCohQ7u2Eh2MCSZnd0CdL4rzIDp4rXsPoLv2s7ZbNZNwGaIlta
X-Gm-Gg: AfdE7cm7LmC3jw7v4mmPjPN4ou1mYAAgZejXiBWBRPpOzluOgXKnzjv0rl3AbZKKtyW
	hvf3z4gaAGK46JL+tIGMELZlzO7vdIF1srxofJLjjUBtam98KCukowMOX9kN3QywRh5emMXyWTB
	ERgXByh4cLOM9A1JUDDo75roEJ9BgWEB93FlQiFJ75x6zDcjoRt1wXfsmLTcfv8hOTvUZXgPA7N
	jT9e2QwdZynt53HkhgMRz/hWHWEYLZHZsk6+sLvsb5LteSzOewnNggB3/6kfkUrgse8XO4Pzldl
	nY5E/WGeg7qOxL9Wr4T+J+50oBkPkhAFwm09a/nU89CTq/s1BNeJgn3dmb0w1v+8yMvCHa27ej+
	bdEZDy0uiORnrRtiEGKpD755B2U06r3xx0tnT9Yv8mYdYo6cQes7W3zZci8Agn7Mx+D8O+UwhfK
	oYs9ygqihwpXdHEFBOmgh5gbd2n07Oy6yU8KmUBzVAvrFgszktEa8=
X-Received: by 2002:a05:6a00:bd8a:b0:847:8b11:596d with SMTP id d2e1a72fcca58-848896b9d6cmr16954941b3a.41.1784162078527;
        Wed, 15 Jul 2026 17:34:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6be5dasm3911662b3a.31.2026.07.15.17.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 17:34:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <05fd58a3-ba71-49e9-afd8-c31a17c9e3bb@roeck-us.net>
Date: Wed, 15 Jul 2026 17:34:36 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: emc1812: reject channel index 0 in device tree
 config
To: Ivy Lopez <skunkolee@gmail.com>, marius.cristea@microchip.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260716002543.26711-1-skunkolee@gmail.com>
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
In-Reply-To: <20260716002543.26711-1-skunkolee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 17:25, Ivy Lopez wrote:
> Channel index 0 is reserved for the internal diode and is set
> unconditionally before parsing child nodes. If a child node specifies
> reg = 0, it silently overwrites the internal diode label
> 

The label string "internal_diode" is completely meaningless.
If anything, it should be dropped. I see it as a good thing,
not as a bug, that it can be overwritten.

NACK.

Guenter

