Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A8725782A
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763397205; cv=none; b=kvkRxmkO5hpzdQsqIPaTrPUThUASmVX2bHs5+MyA3cp6zTbyBUcp5xd/DCY8uZ6jRG7Ni2KdGZOp/gJsH3iFFo3UnSP7tkD+lQaT6LB8tg2HNvDWTIEdZyJ7evtlVPJZp+lNpX0g2zv7x2zqFs2s2MbBHhLlbINjvIyhyicA5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763397205; c=relaxed/simple;
	bh=sGyhS3p/hKXgzE+6/uaVP9v5Yx4OAliFvEX56NH2rK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EO0mCocmb1O4ZPgOm5e8EUpGGlGz35A+QXemkz7StCz+q5yRywmOfz0oD36+XhaNGK03SuaCN4XDTzcz2tS9tTpTIC1Fomt0maae9iyEX9pk7AKBTh4/axtxYN7m/Bm9S20ADq1dn39S9TYn9G45Z1iCqgGinhEn/ymmWDaFHvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8akL6Qh; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8akL6Qh"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso4730980a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 08:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763397203; x=1764002003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X8QGsz+eAFXJnXuGe9SU6aeP2QlSFXSTa/s71U/sOK4=;
        b=a8akL6QhG/vgSQ9vSkv2HcXdAsHK+8GJT4f1TJaQGCD4mGIwFIG1D2nPzIAa2y/gbs
         qbGkZOW2S5MKPBz1E3C9wXcMFCC95L/5QQ/Qd0XOKl1chwb+xsXxcc4rGlnKCxp5zeCF
         De7RyGosxYqAZhaboKyMz5Nda6TkwCONTgS8kc1u3bH8om1pcgvRjg6ukyrrX2uTKlv4
         9s793SL3IQJkL7f7+0IIBWL7JQ1+znsOO7xGnpQZiU0/2A8A/Usmz8eBXyl7Yi/s+4vW
         nTUiJ0ZcX6vEgcT3AqX2195ExOftqjXFwe/DLCKUdAdJjX8ytj6iPr64x5Wogc2SmGR0
         cTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763397203; x=1764002003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8QGsz+eAFXJnXuGe9SU6aeP2QlSFXSTa/s71U/sOK4=;
        b=H08JPFdUIOGUtqQPvm8cJcTGm7Hf9fO27wk4fsPK2REl+IlRxIIF60b1mXKjX3KJTo
         DP22UAiPaYAkFd0IAoIi+Xa8HdhHkHEoqhrN+LO1biqlqTqtG+8GEVjf7vuYE2P905d5
         xqe4FWsU1k0Q96d2SP2NPIcqLT0dJJ3HxP8APuUOg9EnibTOJMv9o6M3d5/1kJJDHSJd
         a+IOGTIEH3r6bn7Id8KbdQSi8IcqMB7OUx4dt1qUOflzRr+gesYnzZj+bqj2MjFOu9h4
         FR08pQ74xFMoYR0k4Y34LVXaIc0fj39owZ7a1Nbz4GXHTYAPEwpsYyngEfDPGXlelZBS
         esJw==
X-Gm-Message-State: AOJu0YyZIh+SvC5ohjqpC59izG2p9AgVZa6HT0WtUGSwO2Jm6nYvDCQn
	8IqQfYs6eq/FzjYCuhXE0YEkEYiZcqs9QB8PcYtRdgjvGVX0KsYbQYMCapCzcw==
X-Gm-Gg: ASbGncvPFMlzqtG2x0qIvOJXXUfQyKMfiIi1diSg+hrO6jW31EIlnHdqTaeXR0tuvxU
	rnwQgyBoLuJKTGujP1Lq/BXJmfdfqKpnBRYJmhJhdf3SRJg99Af1t8tNcpsJymUSxTNJIjIB1vo
	96pNU2uqVPHfETKCUq4E1GU2UYQfd+eiLLb24hcLvGnASnY3ygAErQYCWgpOhA6quUiOw9tUEGK
	gReM7QNhcBfyJVH5omrrJ7ZzI55gIr6nFMw4RpMKbdyVLzyiuTfRl39nbi7nqfis2vz9jNZ0nSN
	ziXjfHclr6hP6iR0ehiUvqMPi2CdQpZYNBkgccbzxUjFW3N2uhNgjmU1dX8R6bybiATdNQK3Ql1
	63dKAd/OJsvcHDie4Gfecbfl3H7a51iGlTfOOSh3eVHXWfhWjk8M1x+WjeA7QeIEAnJfa9WXqgx
	jhsvGDJA7RvIu46VcjTo+gtvlSFI/YxRYQYLnyieY1jnJg3ZeX
X-Google-Smtp-Source: AGHT+IEPsxQza3uk4GKhC+9GgOkjFhhhJQDAzXOtBNvvayJs4F9teOup+19h/PhnNUK2BXgQqdN6zg==
X-Received: by 2002:a17:90b:562c:b0:343:89cc:6f23 with SMTP id 98e67ed59e1d1-343eacba165mr17198898a91.14.1763397202713;
        Mon, 17 Nov 2025 08:33:22 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc375178a7esm12432915a12.18.2025.11.17.08.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 08:33:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a0b1b90d-9687-478f-8a40-c2b551d3d48f@roeck-us.net>
Date: Mon, 17 Nov 2025 08:33:21 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] add Via CHA ID to via-cputemp
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: linux-hwmon@vger.kernel.org
References: <20251117.133746.173713564005237147.rene@exactco.de>
 <9e761121-91f7-43b1-9f7f-866acf1fb7ad@roeck-us.net>
 <39A4B79C-EB4B-435F-BF08-C5689B92E70A@exactco.de>
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
In-Reply-To: <39A4B79C-EB4B-435F-BF08-C5689B92E70A@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/25 07:50, René Rebe wrote:
> Hi,
> 
>> On 17. Nov 2025, at 16:44, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/17/25 04:37, René Rebe wrote:
>>> Add Via CHA ID to via-cputemp to support reading that CPU temperature,
>>> too.
>>> Signed-off-by: René Rebe <rene@exactco.de>
>>
>> checkpatch complains:
>>
>> WARNING: From:/Signed-off-by: email name mismatch: 'From: Ren� Rebe <rene@exactco.de>' != 'Signed-off-by: René Rebe <rene@exactco.de>'
>>
>> Patch subject should start with "hwmon: (via-cputemp)"
>>
>> Your patch does not apply to the tip of the upstream kernel (v6.18-rc6). Please
>> rebase before sending the next version.
> 
> ah my bad, it applied for years and the stable release, I should of course have tested it
> with latest git. I only work thru the hundreds of patches people complain I did not upstream.
> 
>> Information available about "VIA Centaur CHA" suggests that the CPU was never
>> released. You'll have to provide more context and explain why it would be necessary
>> or even make sense to add support for it anyway.
> 
> Well they are popular enough that I have two and even this Linus Tech Tips YT
> channel got one, ...
> 
> I have no problem to keep it in https://t2linux.com <https://t2linux.com/> for fun, but I’m happy to rebase
> it if to document this last VIA CPU driver bits. Your call I guess.
> 

No, the x86 maintainers need to make that decision.

Guenter

