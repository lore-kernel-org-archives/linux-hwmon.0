Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A857E823B7
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707325468; cv=none; b=gsidqBCn2DkQ3pwSd+JIrSDHwRlb+mYhzof7vlMIIdXSi1yl3F6Q1ZbAHptB04lX3GiCOTZrv+tjqAfmEJU8vKQD/doRfCMzeNeEyIj3hzopOz4qfu+GjRNGtNITvyimJXR8eBBR2XoBoIC/ukeEaW2t45PcCIqnGrHXP9+pVzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707325468; c=relaxed/simple;
	bh=4qdoCKJOz/eiKRsj07jPg+cL1Anco17k4fRjIGPB8aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxLs0WHTQkPc03w35BAQ//DaLyMwiAlNOcle6uydz8Ookc2mR1JMm4RYYD3F2V48a1CbaGkx2S4oRqyoywBKxX1f50zt+lDBdCHhTMGslP9A9js2ZOaVRMpznnW1xmRep1kij4o/vaHITc2upSzTt2DvUNBHtJ766n5M6cB2arw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2v4dPX+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2v4dPX+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d8ef977f1eso7439755ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 09:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707325466; x=1707930266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bUd6R+6Y77ov54KEXXuqZL2yeLBUdSdNB1b1hHNgV/I=;
        b=d2v4dPX+ilUgfuVPYamd7NIclvxEZcov6NVAHuWKoumK80DrUB+1F/OHgYfdQ3UbQI
         vyebCvpabpcqkTLFChm2EVCNB09WHYKIJlYmzSXhBz0sAb00Xeh3Uk5lB+SyBzFv+tVN
         Kmiu14jsuecGjl79EcP/6gLADIAKFiuv0h/fwhLZgInDOntEeyp24PKiR1uJtVfu5EVZ
         nKzYB3LxMytkMzU7lGubsV3FFk1eGOcVwME1Y9o1nnDjSXaCLgnKsjKefMrlbKaxu//s
         iA/ptY5DLkTpR1P7EOCKeq5/HA3bf7jP/8aQ7eL85P2mEMHdfQQ3RQI6zi6eYxjf+sxJ
         WmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707325466; x=1707930266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUd6R+6Y77ov54KEXXuqZL2yeLBUdSdNB1b1hHNgV/I=;
        b=nQ5ZDsdWsd/tU+V11EeHwL88M5tBpDHtE451U9pEmOvKUKHPUKqnyIsjExJpqquIkx
         8QMKX2IZzaWayJALVqXY0qKh/64yPhOi2Sov/+pSJtufKUHLPYNyfUCOLpZ+TDFDfM8J
         jQ4TlbIqvQi5pAH/iiz2tg4KTg5Pr6X6ljZehg59HheJrc89h2Y7Kay71wyxZ0Hx5J7Y
         kaquJrIaJKHTKOATgGUu7HG698HKEBJpctQIa7KEFR6THhGbtp5d5fmEtUiZWHmE/yj+
         pYFNdTd+G+1h3+O4jpLlEngNbXhVzHa8NV11Ca3knWoQWvnec32xuW8xEhJAQhPWP1Qq
         ohJA==
X-Gm-Message-State: AOJu0Ywra1t6CdSz/iolWzQK1K1Y3qTIP1CAG1eyGzUlHFJzmonoa0t6
	60cp8XGVAUjxWSYE696ISQXj9qMI1J2vMWT+bEoV1C1cZgmR+bLX
X-Google-Smtp-Source: AGHT+IHBVkmOltjuz8pgdDRsKyaJ4X8WLVDR2knXqzNoTEUQKDDM4wqY3zOGmSjb8ObkDFd9880KFA==
X-Received: by 2002:a17:902:6803:b0:1d9:66df:f7b3 with SMTP id h3-20020a170902680300b001d966dff7b3mr4707596plk.45.1707325465810;
        Wed, 07 Feb 2024 09:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/PpR41EaP4fc+JHTTgs5olDeGzpdyR6GIVMKKgk5Z9CC/mAmZz1lNHfqA7gmrS+diYQQj6KWd4qF05aqnbucybBMgrlyx7os=
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ku4-20020a170903288400b001d8d7323ea2sm1681086plb.74.2024.02.07.09.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 09:04:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6b640839-545d-4230-b6f8-abe034e08aae@roeck-us.net>
Date: Wed, 7 Feb 2024 09:04:24 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] hwmon: Add support for Amphenol ChipCap 2
Content-Language: en-US
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-hwmon@vger.kernel.org
References: <c61a90ff-7f63-4181-96fd-ca5a5029386d@moroto.mountain>
 <ca9be823-8b43-4f51-9bc0-8ee5de7df4a2@gmail.com>
 <563343c4-8893-44d8-a398-ea36a9cd396a@moroto.mountain>
 <294e4634-89d4-415e-a723-b208d8770d7c@gmail.com>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <294e4634-89d4-415e-a723-b208d8770d7c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/24 02:23, Javier Carrasco wrote:
> 
> 
> On 07.02.24 11:16, Dan Carpenter wrote:
>> On Wed, Feb 07, 2024 at 11:08:18AM +0100, Javier Carrasco wrote:
>>>
>>> The ret variable should be initialized to 0 because if no irqs are
>>> defined, the function should not fail i.e. the driver supports that case.
>>> That is probably the reason why I did not notice in my tests.
>>
>> These days everyone has the GCC extension to automatically zero out
>> stack variables so it wouldn't have shown up in testing.  It's still
>> technically a bug, but I don't know how many people it would affect in
>> real life (probably a small number).
>>
>> regards,
>> dan carpenter
>>
> That is right, but because a small number is greater than zero, I am
> glad that you found this issue now before the driver is released.
> 
> By the way, Smatch caught this while gcc, coccinelle and the language
> server protocol I use did not... great tool.
> 

gcc is notoriously bad with finding uninitialized variable problems.
Maybe that is because of that gcc extension, I don't know. It is
quite annoying, though.

Guenter

