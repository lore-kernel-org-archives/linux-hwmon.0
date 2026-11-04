Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833943;
	b=lUZA06V/CUmQySVfpWtAcobGTGqVVfsnfscO3omgXFo7RzwnlLej57G+8iEVEANTmgle
	 PKMprvcZM8EKRyEFMepNE89UmmQr3XOVcrRRSyjORwT3WUSg+7z9uXt7pMNZzsWDLxKDv
	 bI7ONFiv001cS/GaZq8CfGDeB3KWdYDbTm+KoDtxEx7LI7BkdhAwOlP7g6qnluivbUNVe
	 d73NaWk8WTkbhUlovID31O2QSuTsxS377gza6e6zzIjtoRAExyw/zDz0+HWdZds0VIoph
	 bh2rF+0hdqFlm37J4wOifnMnsbMJHB8uDbJvyCaSWoNZyWqtey5GbW6V7CWZ2PJ1oTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833943;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=Tt8f6xDLrLqin799RWKKR1n45eTMaTLPMr99emxaFKs=;
	b=1tsyJ2uTRl1sRmUj7z4heHZT7Dc95ehi8yYKTeF/inogLftu/ueU4eAWYTgRna9CEjwQ
	 /KxC0cUDeo5NbK9zGquvroY3g0oX/fbTJnoXW6rxBC7B9em9ng3eq6SwIjBjmFeARDSvv
	 4IjZGZmwIAQ3IsDDw4LXLUc0I3abmRraGJvpwSfxeYhWkTCMMQD61f736ozHbrqx0cA4a
	 a2rMm4RkcQYWgw8i4OvVbbdjGiCBV9VXOt/pV9ELHzO3E1dvYoE/egLuGDkmMgODv/di1
	 qhNUvpUFC7tEm0leHrvQ/06N8XXfJpv/ANx9b2T5S49fYPT9zdbigei1aA2ov9HgNJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=jk0v2RLd;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0C606A31B
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 23:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B0C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=jk0v2RLd
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id OgeuxkrsoOOJnOk9VxUsdn; Wed, 04 Nov 2026 23:12:21 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Ok9UxktnOuJrPOk9VxMCjU; Wed, 04 Nov 2026 23:12:21 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6aebbbd5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Ikd4Dj_1AAAA:8
 a=4tplyJ8CkqBLgWwfL5gA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=Tt8f6xDLrLqin799RWKKR1n45eTMaTLPMr99emxaFKs=; b=jk0v2RLd7V7t
	5Isf0VkvVhm1CuU1Q3RSiK99/KOewZDK8dBIY/NTEWbfgyJ4fdhWKlqFCTr1VRa57ejBKBgiMl3lV
	A3/PNCXXbStbhwVugNt35kbhfLLtsbNFg5bQcaiOPWqYwn8/zqOYqh64z9uH8E5v0ULcP56wBOqqQ
	+asIZgOTLyqGTq2MPy3SSmu8OfXCqlZxjj0zrg40AInLXepr89CJtfXuo0efQ7dQMJgVziAm/24dB
	YTB17xeRw2s8WVVK14fR7EbhscLTjwz5H7gIK+46zt39K6OtjMHxpkMCRN4axqj99K6NiVqoRkB9v
	SJ6k8Zu7oP8J8BfRPUtcWQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45402)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOk9U-00000001X8O-2xzN;
	Thu, 05 Nov 2026 04:42:20 +0530
Message-ID: <1171e691-dea8-4ebf-8bbb-9d524974fd1c@roeck-us.net>
Date: Wed, 4 Nov 2026 15:12:19 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pmbus/mp2975) Get vout fault limits dynamically
To: Felix Radensky <fradensky@nvidia.com>
Cc: Vadim Pasternak <vadimp@nvidia.com>, linux-hwmon@vger.kernel.org
References: <20261104093213.2422350-1-fradensky@nvidia.com>
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
In-Reply-To: <20261104093213.2422350-1-fradensky@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOk9U-00000001X8O-2xzN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:45402
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCkTz9gVRCo9Vpg9au3iE1N0vRvPYnGt/GWcQABeYWzDRMZ/YEmxT45kSCxiNvOooIXH8eWViW2D2JLLxhoMaczfNuwPnmtMlfSeochTZtbaP7886QFt
 vNodDzh9ObHjGXl6NVBwnqyC8L9N/g4zdn0eSpEhu29Jh/2f+FQi63hB4a1Js0/xAiHhWhDBao3ZuYWGKCMRtT8LRxVRq227je9kh5C+lt7qj1oh/fFuhtbm

On 11/4/26 01:32, Felix Radensky wrote:
> The over- and under-voltage fault limits of the tracking mode are
> relative to the voltage reference, which follows the VID/AVS requests
> issued to the device and therefore changes at runtime.
> 
> The driver reads the voltage reference once during probe and derives the
> limits from that snapshot, which the PMBus core caches in addition. As a
> result in2_crit and in2_lcrit reflect the operating point at probe, rather
> than the thresholds the device enforces. On systems where the device
> supplies the CPU core voltage, in2_crit was reported anywhere between
> 1.15V and 1.70V across identical systems, causing false over-voltage
> reports once the CPU voltage exceeded the value latched at probe.
> 
> Read the voltage reference and the over-voltage offset selector whenever
> a limit is requested, and mark both limits with pmbus_set_update(), so
> that the core does not cache them. The voltage reference is available on
> page 3 only. Let the core change the page, so that the page it caches
> matches the device, except for a single rail configuration, for which the
> core does not issue PAGE commands. Retry a failed page change once in that
> case, since the core would not set the page again later on. Likewise, set
> the rail page again if the change to page 3 fails, since the device can
> then be on page 3 while the core still caches the rail page.
> 

This does not explain why the retry would be necessary or even make sense.

> With the selector read at runtime, a device configured with an
> unsupported selector no longer fails to probe. The OVP1 threshold, which
> does not depend on the selector, is reported for it instead, with a
> warning.
> 
> Clamp the under-voltage limit to zero, since the offset can exceed a low
> voltage reference, while a negative value would be reported as a read
> error.
> 
> Fixes: 2c6fcbb21149 ("hwmon: (pmbus) Add support for MPS Multi-phase mp2975 controller")
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> Tested on a switch platform carrying twelve MP2975 devices, twenty one
> rails in total.
> 
> On the rail supplying the CPU core voltage in2_crit followed the CPU,
> reading 1150mV at idle and up to 1720mV under load, where the unpatched
> driver reported a constant 1195mV, derived from the reference latched at
> probe. in2_crit and in2_lcrit, which are obtained through separate page 3
> excursions, agreed on the same voltage reference within the P-state jitter
> between the two reads.
> 
> The remaining rails have a static reference, and reported the same limits
> as before the change.
> 
> A single rail device, for which the PMBus core never writes PAGE, was
> exercised with 400 page 3 excursions, with no page 3 register value
> observed in place of the sensor values. A dual rail device, for which the
> core changes the page, was exercised with 800 page 3 excursions, each
> followed by a read of the other rail, with no page 3 or other rail
> register value observed in place of the sensor values.
> 
> A single failed page change is recovered from: the rail page is set again
> if the change to page 3 fails, a failed change back from page 3 leaves the
> core caching page 3, so that it writes PAGE on the next access, and a
> direct PAGE write, used for a single rail configuration, is retried once.
> Repeated failures can still leave the device on a page the core does not
> expect, as is the case for page changes made by the core itself.
> Recovering from these within the driver would take state and write
> callbacks of its own, and still would not cover block reads, so it is not
> attempted here.
> 
> I would like this patch to be considered as is, since it fixes the
> reported limits independently of the above. If you think it necessary,
> I am happy to follow up with a separate patch to pmbus_set_page(), which
> invalidates the cached page when a page change fails, so that the next
> access writes PAGE again.
> 

There is still no explanation why it would be necessary to try setting
the page (but not any other commands) multiple times.

Guenter

