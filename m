Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374083;
	b=ACU2MDWwv7daLIDt0lRL68kc5okXsbOIfLULZokrSvkRLhHrhQuknl6tHW3RxJD4kGDd
	 e97kwI4a7hP6kErcIsWZJqUu5BZjzcA5FNW9V6sqLgVLwqn8NFCqlN2EeHyhtmMrU0UNw
	 nIcdin8Usop9wTEDMI2Agk4LQskNzJThGhr9X57gi9hA+6GS4FSiLrH8RY9L0fpAeRdwL
	 PAnx0LP020SrCL9K+1v//+ESNPklVVdUEGVSBsmgdWGhSAct5KjnrxT73ZVFzopWqWkwP
	 J6NyO5OqwGkNgQUDe7DmJ8d8YTnUSMGY60gWloqQi1VSuzlRbLYO4zdWEMZvRAtw7oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374083;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=vQ5FRArC2ZnEPKKPaPjuVLbuNV/uTWsvatVZMzOfl7k=;
	b=Pl+kokrpJgqx7sJTpe5SdkQ66z/sRdiLsSwD381Cw+pv7zKGAHxp7J2lKhC5kk6Bsm3c
	 j260hv7z5r8oaJRc6ZR/Ynv8YL8JGmfr5sihwJEQkbkAe5HnSQyOchWJNjaQd9sa9EwJN
	 1og0OwHggwr/3HLL3GYYWkpmSTuJ0g0//ypeu8poNonCNm4To6WuKhmWYNLljFo5xQIY7
	 Eq0LR45KrhW6gyWbfq3vRdRzHtqHVY1nbPpboa5N/OAS/5QWwZR1m2ZTgc9SGbbtBA4f9
	 2Tw4ZVj5dFEc3UNtkr1GOD7+/pBznUDoaweLH331Jy8IQxbtMgjgKxCihfMAdGmdNpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=UfEN9WXT;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0B0606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 15:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=UfEN9WXT
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id MlERxMim7LvgbMoWKxPf1B; Fri, 30 Oct 2026 15:27:56 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MoWKxUgphbxHHMoWKxvuDD; Fri, 30 Oct 2026 15:27:56 +0000
X-Authority-Analysis: v=2.4 cv=QK5oRhLL c=1 sm=1 tr=0 ts=6ae4b77c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=NwsDAfFHb5WiQZMDeqIA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=vQ5FRArC2ZnEPKKPaPjuVLbuNV/uTWsvatVZMzOfl7k=; b=UfEN9WXTpJ77
	z+RxtHgkW4trnNONR9oAIFDeOETp0LDBcQwSmWRv0rxlMgQWhL33w6wPyu1BYHmi6v0mLQ2g2PZBw
	WeeLtPHeVYc9Ba5pyY18+naABetNlU6IgK1MEiBp4vyV1yg5YDAP3wwjIukKmfX+0a2CfoY1YmRbV
	yx76JQBiVb2QD07GhlL+Ivz9W+VohlbgcV0wKCjnDSWujl9CsTSQH6GX/4CathFhzt8feIjKSgGTo
	QRlF7GJpd45XyxIX3dAhVn6W4t0mKg/jxTornhqR0OxTgJFcRFZR9I/YbsOi4qJEouraZ7KbQgPN5
	y576ZlqskYtn0ksMDxkNcQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41232)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMoWJ-00000001Ugr-2eXi;
	Fri, 30 Oct 2026 20:57:55 +0530
Message-ID: <82c524ad-762f-48ab-b94f-8e1dece2c72a@roeck-us.net>
Date: Fri, 30 Oct 2026 08:27:54 -0700
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
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20830) Add support for MAX20810,
 MAX20815, LTM4739, LTM4740
To: Carlos Jones <carlosjr.jones@analog.com>
Cc: alexisczezar.torreno@analog.com, conor+dt@kernel.org, corbet@lwn.net,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, robh@kernel.org, skhan@linuxfoundation.org
References: <d8c327b8-3113-4490-83b2-70cf3ccd3224@roeck-us.net>
 <20261030100348.1955-1-carlosjr.jones@analog.com>
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
In-Reply-To: <20261030100348.1955-1-carlosjr.jones@analog.com>
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
X-Exim-ID: 1xMoWJ-00000001Ugr-2eXi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:41232
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDPMWJCYU/FMKIbBy4gBMlySLAuLxZWgmrOMsLcjenz4uZe+Il73WJ71Kg4y7yCg9g8vnvoAbtNm+TO366djBult89fHwYTzNVG2fnfc8yowmPZ5SU4j
 bwHDyZOgsK5domflTlzXLpQiamShRITU5k/ymn6YSvANsb/1gIKGhJRLgaNOcTHquzRAoHcFBiF7U2TsgyZYgXNC9Y8J7qLerYnX7ucQ+NqS6CjkJ+WLEw2P

Hi Carlos,

On 10/30/26 03:03, Carlos Jones wrote:
> From: Carlos Jones Jr <carlosjr.jones@analog.com>
> 
> Hi Guenter,
> 
> Thanks for the review.
> 
>> According to the datasheets, MAX20810 reports "MAX20810", and MAX20815
>> reports "MAX20815". I find no reference to the "B" variants on the
>> Analog Web page.
>>
>> LTM4739, according to its datasheet, reports "LTM4739", and LTM4740
>> reports "LTM4740".
>>
>> Please explain the discrepancy.
> 
> The discrepancy is between the datasheets and what the parts actually store
> in IC_DEVICE_ID (0xAD).
> 
> The LTM4739 and LTM4740 are uModule products built around the MAX20810 and
> MAX20815 dies, respectively. On the hardware I tested, reading IC_DEVICE_ID
> returns the internal MAX die identifier, not the LTM part name:
> 
>      LTM4739 -> "MAX20810B"
>      LTM4740 -> "MAX20815B"
> 
> So the modules report the die's ID (with a "B" die/stepping suffix), which is
> not the string the LTM datasheets currently document. This is a datasheet vs
> silicon mismatch, not a driver choice: the driver matches what the silicon
> actually returns so that probe succeeds on real hardware.
> 
> I only added the IDs I could confirm on hardware (MAX20810B / MAX20815B, as
> reported by the LTM4739 / LTM4740 modules). I deliberately did not add the
> "MAX20810" / "MAX20815" / "LTM4739" / "LTM4740" strings, since no part I have
> reports them. The driver keeps the LTM4739/LTM4740 naming and device-tree
> compatibles for the modules while matching on the MAX die IDs they report.
> 
> I raised this with the product line and a datasheet correction has been
> initiated to document the MAX20810B / MAX20815B IC_DEVICE_ID values.
> 
> If you'd prefer the discrepancy spelled out in-tree, I'm happy to add a note to
> the commit message and a code comment in a v2.
> 

Please do. At the very least we should know what we get into. _If_ parts
do exist which match the current datasheets, it should at least be documented
why those are not matched.

Thanks,
Guenter

