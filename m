Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EEB3B895E
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 15:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030503; cv=none; b=l4u+2OKNeN4w3iN0MDOs0+7lR6vJMY2iway6TIqzPwmcowi+jmb2J1hgDi54sREIEJahSW3x1Y2VPNKv1cJQMGBPoPCr0Ahfe76DKZN1dxfSZelkdgC1P85tSQQUUPVY/u3PQBMJ1C2dN9qtq17MuATESysG7is+kHrIpReHWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030503; c=relaxed/simple;
	bh=I82qCAapuq5q4XLsdlrx/cBUqFtHqRFuOYioPzImCLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVKi52/NJ6Rv0QnKhh7/rNOXtdTTxb113kW8HXDs8GvsG0Fbvkiqy7CBIkNSkCix0dMgZzMzhARCB59ifNMLKzl5zMOcttOdVU19t/3Yd7JMwnEAmcf0MdpPC1M1+s194+qSk12gy4uYRuZ2u72f/sRpYaa+KnPHielaAs6V63o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnNuNjR6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnNuNjR6"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1755713a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 08:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786030501; x=1786635301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbrmQ+GhkVEYubpdUNjaSBaIV7BvrLU3vULivoHV6Ks=;
        b=dnNuNjR6V3XOnbyCTm2mqXFwVpmNxbMVGxQjowCGYR4n6HR8Sgn0f3S76rauk3SXVv
         JnqKC9ArrZNFoTNVZv0pkrbp/33CjNcILlPwjWY7+qdJHCbe+3r6xPpJ3xaP8xEeHP1i
         9pJG5bQU/cVdj1MfnKePWqItT0AJNXd90b5BLSbR0vMHxA4yLMEb3h3vYB3Fj/9JYpNg
         6Z4eBeoi486nHpV8HIRHIR15PWoGCtsDLfhEsZKWP9+1RSFocQvEmueWbbBJ6WzzQ/Aa
         pzoZ9Z+1/3aJDobjrmZyWUkTLbsqU5zDHzrslSM3uGmmp3N2ktPq6THN7JBzf/VWFkQD
         STSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030501; x=1786635301;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bbrmQ+GhkVEYubpdUNjaSBaIV7BvrLU3vULivoHV6Ks=;
        b=XPIX+EKM92/Au9KA6odyyOmPLP8h+aP/MYoKzwswhgfjvuWuoMZ9JI529PmVCce/SP
         WM15VyemUeFmfcooHWjk0dbQoqmHllfBdiwK8x7bkftJV5puuVbxTqy/xkrDIXfc97od
         jIaClfKq2q/qjpGxOjHEBsxBNOXyCCeEoUYAZStl+MmTt7sKSbU7InrEJHbehyVAOZnQ
         forkw16gqI2/TsuoUjzi8BAPxuQNXkCbwq8UOruEx5DZ/3p7lYjArNZZgD8cCAax8BuD
         S+C5x8YLMFEA/Mu8y0nM35kWbGlO9AJPJ6wo4mwiEC0GtHGucUVl+OpubTu3CnZCw20w
         M3rQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0cfVi+C18j+WZPlcTJdFbHN/nm+/Wk3XTUImquf9Lwzk+1Th4ssOl4O4kBfu2k4edBR26b6U+bnwINQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0RrENR8HAEDjDypkHn16SpvJRXolBTr6J5D72D0rAVffdX43o
	TRX/kJqJ9Cv9iUzIS6OjBE90fjO7b54S5xJ/eHMoDMkwu5S1Mvo/BSGG
X-Gm-Gg: AR+sD13EzIWufkNjCwlBvrnr92I58V+vl3nzG7+XGg9A6nLWVBjrzRhwdatjFeTVHLT
	Aesq1Hreh37jq3ckgyqnAPQTiF/WkXK/mWMNVwGALkGi5X8KUPMRQ9U4LwiBbCPiH9ZnoccOXje
	b7m48TH/vARYdzUwsTDB5OrtQyW2bvgoFwSIUD37f7jHlEzBLbp9Hq2qnsqOy7J4ers4Iik/HVx
	aOC+KXgZYDT8WmmUp04zYONcUWwHCleproOkiB+MZPQo/kyHXBcfi+tqQCGIFQt1W+PxXnRgGZI
	0jbRYr/i7RZvemdtGRa+Xjnj4DiUQDWSVF1b8OkBQCvTC1twV18hTbfhR3uwvZdAntdQzNTLjJT
	dT0eSaW1gG2FQ/UWYigVPXac44qEntOwbjmos3z9nxj6McbxCgYd6T5C8iIgVCC64TOZ88uMdGI
	Qw1ZXBAIs1C+a79nJgu8TBNc8hDXv2KCezD0xZLx0SXxf9xsN+ngwD4q0Q5+XuoTvkCGH1CaMZF
	aWgUOPImg91KNqShgsRKMW838RtYhmtKwt2Ag==
X-Received: by 2002:a05:6a21:9992:b0:3bf:b68f:4685 with SMTP id adf61e73a8af0-3cb85f43e7cmr17944621637.23.1786030500875;
        Thu, 06 Aug 2026 08:35:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm42980668eec.21.2026.08.06.08.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 08:35:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d027eec5-ca83-4aba-a3c1-4724c77df0dc@roeck-us.net>
Date: Thu, 6 Aug 2026 08:34:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260806-axiado-ax3000-pwm-fan-v1-0-f6db4cf2166b@axiado.com>
 <20260806-axiado-ax3000-pwm-fan-v1-2-f6db4cf2166b@axiado.com>
 <anRaB--HAHoWFkDo@monoceros>
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
In-Reply-To: <anRaB--HAHoWFkDo@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/26 03:04, Uwe Kleine-König wrote:

> If there is a hwmon lock that serializes calls to hwmon_ops::read and
> hwmon_ops::write, .pwm_lock isn't needed. (Unless I miss something,
> please double check. Also I'm unsure if there is such a hwmon
> serialization.)
> 

In hwmon_attr_show(), hwmon_attr_show_string(), and hwmon_attr_store():

	guard(mutex)(&hwdev->lock);

Guenter

