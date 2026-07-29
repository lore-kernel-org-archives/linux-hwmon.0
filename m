Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8383DB96B
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 20:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356618; cv=none; b=MRYof1s37D0DP4jtko2eO35Mv9sbENEa/z8Hhjy6oi0ozJY8jRnxsR0OJc4QM57+jCAlD73hnyjeVqcGR5WHkV+kb8xJIM6WvVsYRUSQP8nNL0DbjWIk/klrtgOWV59m3W6hXKmYogr8mTin42FopUQt/fnn0oen1psS1MeeL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356618; c=relaxed/simple;
	bh=QsmgOTB0+XfW4IuMxTu+A2chFmz1GsdHM4/TOVX+xxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0LtOi+oN33JcCh6T/THySTZEzyC9JsLr+Y0FUHWyNk4lo03xoHwiFy1yKGYzJwxChbpB/XjXxDfNQsczbfMIgK14u1c1Aevu5sIpPUpW0FGbEkzXTP8dp5RJ4TPe8kpAJXeZN6ayHhYSScDGWSPNmYxxIQknMq45emuCPGNznU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUNqrcal; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUNqrcal"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso1079886a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 13:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785356614; x=1785961414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bH71fmWcaZmonfoK7tsPjNB22a63jGjEHObBS1Hv1i0=;
        b=mUNqrcalKwRTuc1DK9JfoWdINDQNXvf2R9PpmWxtzDuflK3AroWw923DGVkPQDaIv9
         hX2yM/UDYb68MV4JJ99ogmBosmhmNIrWyZwZ1wLk7LmtAVFlrp0ufU/hgkr4i4u/2j5V
         IVYvMkD2c3eSXjYobC4i6xjoMYC7c90CzuAgvckND9kezK0wmzy2HXPsYGdGej/MjA4o
         TTcCjscFF79GJ067stIjbUUgpOkBffe3T4oivy/WzJSJ0d4+etLzBDDVs/KuWkh0E2R/
         8/MP/mVCDe/P9goriiMBjjGN9DavCRCgmgjwOjGtaek4sItMZPLqrlugwV60CFb+YdLs
         OaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785356614; x=1785961414;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bH71fmWcaZmonfoK7tsPjNB22a63jGjEHObBS1Hv1i0=;
        b=Lo6TCKekArkRyd5vytDA4MXyrFuUyfebef4TJgQJGAMbbNDhKcCYlzwE+Ax3le8RxO
         JBprUGmj5lvp2aHDtUiFyh0EpVpA9b96Scuhx1+qRpS/Nx76L/mQS9xxNQ1pFR04ssyj
         1kZIr7MEgQEsB+zQ2+J543yIcegdMLwRC4cRjvI8I+DEXnrZrWnsuZzozGlCKHE337U1
         ilDmPIwJvZ1fU+dJSpIr0tmkEbDXPNATWarxrcd7kd3XThHSwQiPVTe2I1arheHroSTq
         U630QCL/kVVdszSmUmWw28pDTjYln4hhgGY3ToUBEPj1WdqG5bXRBcjvb6/Y5Z1VIIFC
         cKAA==
X-Forwarded-Encrypted: i=1; AHgh+RrwZNQjQl/ueCCEm46gAgLbIaWaXRrxTLgDM3eeMZxu6kwgUYQ0eMNSvE1Gl1q2mFgmRReTOGVAsZWzcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4rQ3x+Q4rGT4unOSZhciYaonWy486tiweQvb/kPI4QsY6NSd
	0P7Klxou2+DJ0xVKcXIa/gLCoMJs+rjycIrGXhYItWPpbFmDU6hyKhxP
X-Gm-Gg: AR+sD12j1knsWlK8ZjjUDwGmVc8ljqOvGugl96JJP70q6eqlJDGqwW4rylyEZJvhC4i
	Lke9UD0Pli0hN/byfs2pv8AbopbIjXfe1hS86pQ5v8JUM0smsKgmOU4fK/Z3C+8lTtTkupEKcr/
	cyFkzOnaF0Wj4GvNqNK177zMc6OqR9/ypuPl5fOXwUKX4reSomqVkDFBxJLKflRkmw0xO67XKTZ
	QzfHWV7nRflNiid7nT6JJObX268uI/7dNtHKcgb/6KIjn47sjIWzK57tPGPFYQ9TCJt5xiI3tMp
	nxwCx/9Dp74cRGWslPjLrrFwvC/ghmiuKk3QND91GIkxdibB+8onBwVmudSihtg9qBZb5wZGaIB
	qZ5WBcJn+Mqqu3qb8WAtn5ud0WIGI5upPax7WiTdlbhNEvNAEezLE2rFv+GxjOwooJ93X7Tux6c
	PIXtvlPdjsie3LK+wwPWV4JOeth/R1SvU+SQt0QVGrRppyJ4QpjkRL+qHeQqLgG8e9EQU++2QSd
	pmHigdMiCjFRPnfPVoWkTtHbqa3BtEgQgPr9Q==
X-Received: by 2002:a17:90b:3803:b0:381:6466:7160 with SMTP id 98e67ed59e1d1-38f99254a39mr301005a91.26.1785356614020;
        Wed, 29 Jul 2026 13:23:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm19379339c88.5.2026.07.29.13.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 13:23:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d0625bd7-b5e0-4419-bcdd-9f7a5f8c38fa@roeck-us.net>
Date: Wed, 29 Jul 2026 13:23:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon-next PATCH v4 3/4] hwmon: (adt7470) Expose fan control via
 PWM framework
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
 <20260729-adt7470_thermalzone-v4-3-c14039dfa0e6@gmail.com>
 <12dfeaae-f806-4adc-95f1-97fe10ef748e@roeck-us.net>
 <amnoV4Vlxmc5QgVC@monoceros>
 <e535a9c5-28a5-470c-be21-95e1812e5e01@roeck-us.net>
 <CAJq09z5diKf9HpJ0B_7tyo2-2wPfojyG4pRY1qhRQ3fzx0Gr4A@mail.gmail.com>
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
In-Reply-To: <CAJq09z5diKf9HpJ0B_7tyo2-2wPfojyG4pRY1qhRQ3fzx0Gr4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 12:05, Luiz Angelo Daros de Luca wrote:
> Hi Guenter, Uwe,
> 
> Thank you both for the detailed reviews. I hope I'll address all the
> points discussed in the next version.
> 
>>>> No, I won't accept this. It has to be either or. A pwm channel modeled as pwm
>>>> subsystem channel must not be visible via hwmon attributes.
>>>
>>> I didn't look in detail, but maybe my red line is a bit more lax. IMHO
>>> it's not OK to be able to modify a setting that results from pushing
>>> hwmon knobs using PWM operations or vice-versa. Switching between
>>> exclusive use at runtime is IMHO ok.
>>>
>> It is my call to make, and my call is either-or to avoid confusion.
> 
> Guenter, I agree and followed your strict "either-or" directive. If
> the device is bound via the PWM framework (i.e., #pwm-cells is present
> in the DT), the driver completely hides all legacy hwmon PWM
> attributes.
> 

Yes, that is what I am looking for, assuming it is per channel.
We do not want to unconditionally disable automatic fan control support
by the chip just because a single channel is used as generic PWM controller.

> One implementation detail: currently, the driver hides the hwmon
> attributes only if #pwm-cells is present and IS_REACHABLE(CONFIG_PWM)
> is true. If the DTS has #pwm-cells but the PWM framework is disabled
> in the kernel, it emits a dev_warn and falls back to exposing the
> hwmon attributes. Please let me know if you would prefer to
> unconditionally hide the hwmon attributes merely based on the presence
> of the DT property, regardless of the CONFIG_PWM state.
> 
No, that would be overkill.

Thanks,
Guenter

