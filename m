Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A5323E325
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 23:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782342317; cv=none; b=j1Z77FK/k2wq32g3Q5IScGKWldeOxXevIoVLK7iotUKTAMsG5G3xDzPEN3wFT5TOvq5iosa5XIWoD5ErejEVYQtoveX7aZFtLsQERMHmA1XC1QmqVrjxqX28D3j2fNCoi+w2meuH/E1SZ7WeLPrYEToQVEx+v86iN+Rww7dRl30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782342317; c=relaxed/simple;
	bh=gynj2dGH5FgL9qzO6qtbfYXsLFqkQ1aykc51xjVQg+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hui+uHiL05p166GKLdZIfmkX9gqXUeQD5HrHxPlyhriiwwaxWrVWwJxXs+XeBNW2/IryfTI/opv32+0pcpD3Ej28f38kUB9lhGj8n7zpviF+jLxoT5E4eVtLPueNtErKpKdW4VdRb8+ClnQj6VIPGn9GyQKzYrDN1vGQJZUAp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2+BPKVL; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2+BPKVL"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so3352315eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 16:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782342315; x=1782947115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=niyLWU/ttGbd6hmzxlaxgBvZslSa/DW105Jk0cDVl5s=;
        b=d2+BPKVL+gc9afclbJn98lCpIrCKTJKhorscyCvE8wvof/ejMx1YpvHHAF3BFL4Cha
         OjhqETw+A+IABaNFb0gjLaOcUHoPlQNPfGOeKWQ7xCqrMkaQ1l123c7tV5NV7DNYIuXF
         pj/Oo7oaG/RHXXOe5JNy48kSbZGbhzBNiRamcQG5lbuLbsiqTjU1uYRT5wxite4dThzf
         jTJVtju6V7beMX5PErGTCO9s1m4xvRNGLSVx+fMH0j7Dr7wAldFHabDuP+U6qm87QaTk
         etUrVc3T/3eqRSxKoieamDFeba4NN5gJ/T83ILJxZrno2a/gO2dl/5A3PTlarwyseay+
         mpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782342315; x=1782947115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niyLWU/ttGbd6hmzxlaxgBvZslSa/DW105Jk0cDVl5s=;
        b=rbvibw/DO13j7a6226s0CJm2v7yxMo12cZgCqClZn/6bC1TKxGSAI4mdn4+5IZrPNN
         /NwziXN84/IbGVxLOEh28AlrlX4Zegm+jEva83CcMofOy3iVXs6NvLN/ULjwUPY7YxBI
         jvSbr06sqnJWTYFt2cIGRpq/UVkZs+SzT3ZsQLEAtAhgpvHoJQlFGGqtHdFeP5cBtrMt
         3X4m81VYb3vEEji6vwXlbK8hBn/kWFH3c774cTdqlaOdp5VzNxMUFms5nS2xTIJCCYX6
         RixVt72WSG0Y85aQogiLWvR5I3WPSDhqArulFbXcInKMlc5fPX6YmvzJOjBPAcKLeCpb
         /lwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJ3mosJYoIaVvLX6deOvCKnjYAbgGpoauDzwxjKIqRdQAdMSSuJaOlKd1Usv/K/s6Af0/0z5HfccgHNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjzg0NYBvY04RDYyn3duo2C4EPKvBNzo2BgZxA8//hGIDgxe7V
	4HQye/rum6SE+fyRm4/JCaLIe/7OtxQN5vb3sVUWX+SP3mAk4+fJT+rh
X-Gm-Gg: AfdE7cnRG1W3LVKPp7LFLFGgfBpy2uPJHyT1ElvjIWOmNYPl/mK8pQlj4f1YGfaDGw7
	ICSPzkvv9Y3Sx6F9/ayphWCkSusFyTBU6B6e8URBEkUiATeAkV91eva66tAAJ+n9X/Bcr3qa7BJ
	yAx2/0h7WTRNrBCVZP9E/wHIAAz0ugQ4yM0Iclk5sq95yDK2bSfSkgt/tIMU4vjpBJtJ7YhYLNM
	HXwK5gzv4109qk3/ZDfjB4MFUwwJM0Eiyb29WCH3b5/BMa9tZmRs1dkfd85iQofxYElA5Znoy0l
	0uhmjjUsGNxGuzBPa7r790zhOGJJLcI0STO17U5DWZuf1kVW6MGpQGZASSpaRM8ifxUqZnVwLLo
	FB4aP8TpUZdTLJ7/bB2NcyMZC0QD2IkzoO58XYmS6KMDwgij0l591XWmAAAI7xoGjnq+pE5ghV8
	4dKTMiCOxIumzGX5wMFuVHduWQn7D7qpRwqCF7JCdEg4Aqi7cT2pS8yn/aUSnobA==
X-Received: by 2002:a05:7300:8184:b0:2ed:e16:6b4a with SMTP id 5a478bee46e88-30c84df4aadmr181662eec.32.1782342315240;
        Wed, 24 Jun 2026 16:05:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca4a9b6sm1991504eec.24.2026.06.24.16.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 16:05:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eed3e19b-8cc7-4aef-b058-b2242c94c940@roeck-us.net>
Date: Wed, 24 Jun 2026 16:05:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>,
 Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
 <20260623-anybody-gutter-e6ca04f53bdb@spud>
 <CYYPR02MB98280DF78A07EADACFD084EE83EE2@CYYPR02MB9828.namprd02.prod.outlook.com>
 <20260623-scared-judgingly-7efc1c188670@spud>
 <CYYPR02MB9828EECB3F6AFDD2A7BD3E9B83ED2@CYYPR02MB9828.namprd02.prod.outlook.com>
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
In-Reply-To: <CYYPR02MB9828EECB3F6AFDD2A7BD3E9B83ED2@CYYPR02MB9828.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/26 15:36, Selvamani Rajagopal wrote:
>> -----Original Message-----
>> From: Conor Dooley <conor@kernel.org>
>> Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's FD5121
>>
>>
>> My point is that what's actually being controlled is missing. Maybe it
>> is obvious to you, but it is not to me. Your nodename in your example is
> 
> 
> You are right. This chip may not be a "controller" in the traditional sense as it doesn't control anything.
> We can change node naming to sensor or regulator so that it aligns with the convention.
> 

One of the problems here is that the chip datasheet is not public,
so we can not verify what this actually is. The only available
public document appears to be the "onsemi FD512x Ax Digital Controller
User Manual" which describes the chip as follows.

"The FD512x Digital Controller is a programmable device designed
for machine vendors to configure their equipment at the factory."

That really does not explain anything at all, and actually looks like
an AI generated summary with the AI not understanding what it is talking
about. According to the onsemi web page, the chip does not exist,
and it appears that it is not available to buy from any distributors
either.

Guenter

> 
>>> +      fd5121@50 {
>> which doesn't comply with node naming requirements and I wanted to come
>> up with a suggestion for what it should be.
>> I am assuming that its power or voltage that you're controlling so
>> either it should be hwmon@ or regulator@.
>>
> 

