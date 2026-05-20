Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B436EA9E
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282701; cv=none; b=NZXxGiK9p4P1GM7S2aMk4y8pPlI1XNq4QWWcgLTahQCCRWSw2jPXQ/8eFqydG8szV9rLVJMugm5I962wpT03GVur+XVSgYTovWhzSfgtYXNlgfkrRCfWHelTBOwkErVf3rImFsHiAl0laEvBPaBEHGiDSAeDsi2oBkD9OncV00E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282701; c=relaxed/simple;
	bh=NP60WGi8GH0H/7w1dLpPD+lKN9kMplKrNfkXabRWs+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlCZQ4hprljzX7fJl1bt1xgRse50sATDAi6XEVgPOj4qtF3tp4uKuvKnG0nOGZPPJLegzaa+bth2R0hGGHgv4JCk0dfpgKeaWiSD8+JeuBiTHHkIvEWZh8KNqUdPF2maA6ZoxyUaVPM4b0Aydpy6VazICnTn1zfrPXHSnYRecuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnU73emK; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnU73emK"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso4818769eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779282693; x=1779887493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=K/2nZxlj/dTPCVoBNLYxJ83qty/pBq2Cd2V6Lynogrg=;
        b=qnU73emKJaZwSyuh5bmU/7xuy/BKo5Bo4nnBkBVq+EDnWTkrZLG+2cpyBdW+gLgwxU
         NGPTquWaKO6n0Q7KIxKjL2+G71jAswrrTjkJjFJzUtGs8/fzcxTdD8Ybc8ZzrtElxLA9
         rkexKXIbfWm/LJ1Wt73ErUdwBK2QRiQSjXrVZlXBZxWxsZgESgxTnrkYVNt16O8lmUNP
         N6nitJULs28po1K8kFBzB/7Bf+0EN5sOutlrWcDfgaCs/9rnS/JYp9tN58c8HOJMJ+p+
         Y4TCBUqByoDE9pDe6IKS2oIh0pehErpJZY2hvDVB8cF1r1nIJBwrxSdmrY+QWlaieWhD
         cgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282693; x=1779887493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/2nZxlj/dTPCVoBNLYxJ83qty/pBq2Cd2V6Lynogrg=;
        b=WPjJchxP/N3iX0V0TJktfJXOSyu1mE+5E3Vv7Q3eyNDuR/6eLrR6RYSlK4njWcpi+b
         AGiEF75EwRDso5xSwo8LyOUxjej1noA6pz8pGhXb6U3IXtVxjZ5NrZRZxEEQKCzS4Xgh
         HZ5/6/IlX8edYkyVrEQwjD6a2ySmNNWknaZILjCq/hZ6Ezalvv5yZqEgKJL7cQh4ynuk
         60czQHYk1K4tFil9wVRU6hgfWsq/PK1Vm2d1bBeipOjcqN6UFL+z2Klgy52Nqe8uhzmN
         OK9GtRt9o8QxX7IYKT2uVNpp88V9p1sTXXrksIk/tEbvlH8irksLwl8R0mURcjYYvPRD
         AZPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xqiEtfNbAfCo28Hu2Cdbv046Ti+zeBw30JTM3+rm7x/xdYuY/LEEdYmvV2Eo7RswAuwR4Y5oXVPHMpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweMvPdmbKKS2s7bSDh4QK0Bb+MPK0bM3GLr8JOOWYr3piSFh70
	KlbUBAVlTgZ8hvN37Srcvpsl8uHhzmN4U/SVBNO3uSvHMaHvHv32BWtn
X-Gm-Gg: Acq92OEinjTZOfEihytUNcT/3TCeYFPjDLzPU3/1xacFicr/N6phU5LkwLzP/YB9nER
	dAcwaxlI+yNLar73mkTbuS5GnF73WiKppXM3uTId+vx6MYFchy1bjblsYhbM3WsQqVMgA4FIzzN
	hFj3S7XjoVbe04tW+rQ2kXw4WOikweVADpq5RJEc+JS1tfNUFPNHlERUVwNDfH8cNctbYUQnTyo
	dOakdJsPz+wBX7rt7r5eqDX5JgHLqp2IfRgSNuZPIbPHLoVgBLvoZeVdRhA7zzFOwngh3AnaYCX
	tVuVFHLHiXmff0Lgdu5o78Rb+riq3250I7jMyAdRkR/6C8UyKhGBtOgK6HfxaAEJR5CmHdFfP8m
	7xAYcG9NW3Kd33aNusck1178TffgHwQM97iuzALIuBYIM9AyqyhoakwonHFc+8JuS8C+vjbGitT
	CummsUmIR5p2viRJC91AOvH5ALgNNWxz3p70QGHJt54V9X2Z3i9Hm7OSaQvPmOFpKP4SCbmA7M
X-Received: by 2002:a05:7300:7490:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-30398677242mr11847624eec.22.1779282693191;
        Wed, 20 May 2026 06:11:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc9d4sm18280200eec.23.2026.05.20.06.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 06:11:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b64144fe-e753-42fa-bf9b-59835090d465@roeck-us.net>
Date: Wed, 20 May 2026 06:11:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: lenovo-ec-sensors: Fix NULL pointer
 dereference when DMI match fails
To: Kean Ren <rh_king@163.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <58352b37-a87a-49f0-ac89-da226f2266dc@roeck-us.net>
 <20260520055205.87493-1-rh_king@163.com>
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
In-Reply-To: <20260520055205.87493-1-rh_king@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 22:52, Kean Ren wrote:
> Hi Guenter,
> 
> Thank you for the review!
> 
>>> Remove all five manual release_region() calls that are now handled
>>> automatically, and drop the unnecessary braces on the single-statement
>>> blocks that previously contained them.
>>
>> [Severity: Medium]
>> Is this description accurate? The patch diff shows that only four
>> release_region() calls were removed.
>>
>>> As far as I can see there are only four calls in the code. Description
>>> problem ?
> Yes, you are right, thanks for your point out, I will update it.
> 
>>> @@ -541,7 +541,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>>    	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
>>>    	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
>>>    	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
>>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>>    		return -ENODEV;
>>>    	}
>>
>> [Severity: Medium]
>> This isn't a bug, but could these curly braces be removed? The commit
>> message mentions dropping the unnecessary braces on the single-statement
>> blocks, but they appear to have been left intact here.
>>
>>> Hmm, yes, the description does not match the code changes. Please drop
>>> the now unnecessary {}.
> Thanks, you are right, it is unnecessary {}, I have removed it in the V2 2/2,

I have seen that, but that patch only removes one of the now unnecessary {},
and they should be removed when they were made unnecessary (i.e., in this
patch).

Thanks,
Guenter

