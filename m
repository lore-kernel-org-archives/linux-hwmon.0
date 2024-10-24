Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55286189F5F;
	Thu, 24 Oct 2024 20:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729800197; cv=none; b=ok+tLQx6Q/7Su5Mbqx8T+krQ6DQgnzqnMWKCTqDdpeGtst6cN8a0c4se2Xp5ddWzedY8gLKR+x6sa0VQP4em0cD67Tjk4FIVifrQoMFd7J37mrPgK+hwfA39lray/Pvx/bKbgjSGMPBwN0eVB38hEWg5HdLhKwh2Sg1BbHqSWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729800197; c=relaxed/simple;
	bh=5nMUI/omtZ7FZa+QOF2AxfStNqPeYET740FnjYNd0FI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSiraF18hSRKeaR2hi1bNmO/txOODgb4f8wdtR2+nS0yNj2X2Ym//2XdU59Oq/14ty64JlGu1JSHKWhVPilSlfxm7hfJiiUOh9WXABDBCgRzBjLGh6K5vC2maKPTIbVyqkcFGKX5zRYmWG4c580BaTp9kccEI0q9uASofl97wWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UK6Cz6Rp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK6Cz6Rp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cf3e36a76so12853915ad.0;
        Thu, 24 Oct 2024 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729800195; x=1730404995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xSCwf94w1WmqUAnGDSKsgZ0t3A6VP7ja+mWHhm5F+7k=;
        b=UK6Cz6RpRn9GjN1Kzrctt6Hd4fjGE1Aa1ity6kZ7F3UoMsYL0HgBq4hkAEYYp0y+VJ
         EBL1bNyQ60cIU5djtBEOwM0afQLbD0b04nzbXc2xyzE0lw0xYJC1cRgm4OtelsOfKHrp
         HNBLd+pX1AcW4cj7OvmZ3nxmXvBrsntF7yDjMcKQq+sQGP96sueP+NB5C9LJRttfzdqB
         MorCLIXKWL6utcTOQtHp1F54oJX3+V23+M1b+ies5keTtd2wPitsUL3mdOBrjCSc0N1M
         qb1ROYZ19THPSgu9v4oY0zolitfS5R7aW9BA5R3k8di6Vu9Znoo2YI4ZyU1UrRx8bcFM
         9NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729800195; x=1730404995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSCwf94w1WmqUAnGDSKsgZ0t3A6VP7ja+mWHhm5F+7k=;
        b=nzeWN60rIPPp6L31Yu3X36DkOXbTfrDDMcCMkZSpf2jbaJDDFskue4OLDIalE8mH2G
         uMlL21hnaVJuCivlbjzyE3YXc3jrXzXAcAgFZK0LP1cGrRtK7MkKta2MP+xr5kElVBN/
         AExw/lH3ghRXikgJU4F10qslNA79zD0BNe64KrJLQAY4EbPv2BsjxzcIKzOYrrt9ELzB
         MU4OEp+Una8HD6Z57H8H+AadzdCUMRwt3qdQvfeYinWtr41oA4Kd4JQai6xSxJYf8cpv
         1SwLiJM/H17JWdKLKYkYS4y7xNWy8R98ElquoYyNARstPYIMr/RJ8wLWaSG1SbTkpCPa
         g/4g==
X-Forwarded-Encrypted: i=1; AJvYcCUv3GwCBkLzU992AzEFhAjXeblO/7ABg7N3b7ElqOCAczJoTdQluYKEnWypVh4IWuu8OwhCDQOcEPf8@vger.kernel.org, AJvYcCVXt1a+tMUwAPQ4OSuyWu9FgtEJa+/JLDk8tYl7DcmotVy4WFjJjJ3BjV1E7isxTXfIqAIuDuyquZE8@vger.kernel.org, AJvYcCWXhzNgbsfuaxxtoVW4vhT1mdA3ReDvjETZSHc4NeiF+v0n3oOFo4lAWQiK2t15ymgWu4Sfjd0JjvX+BeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoayZRyBH5A2CbOLMBM232YWgLDFlFFVF0znJTq5bnR33bkMwm
	xtPxGbygySdPnJR56YpoFf/PCL9ISrgBEtYa6NsKbFKebu3SEqPE
X-Google-Smtp-Source: AGHT+IHtRhzMILYXbZtooj22Y2+GrNlP86pPbugB4zhS5bRStjRPyvyKYRMvXWIHvClVKDN9zSE6CQ==
X-Received: by 2002:a17:903:2284:b0:20c:c62f:d0e1 with SMTP id d9443c01a7336-20fab2dbb51mr94699135ad.55.1729800194557;
        Thu, 24 Oct 2024 13:03:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef132f6sm75749905ad.111.2024.10.24.13.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 13:03:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3f460b62-4cd1-49dd-a98b-1fbcfdbd3af0@roeck-us.net>
Date: Thu, 24 Oct 2024 13:03:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: robh@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1729646466.git.grantpeltier93@gmail.com>
 <422a40e992e047e250a3b1295503e3b81b5515ae.1729646466.git.grantpeltier93@gmail.com>
 <7d705ac9-a109-4b49-9ac6-78bd2e9ca091@roeck-us.net>
 <ZxqjY-5MvsZfzf3U@raspberrypi>
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
In-Reply-To: <ZxqjY-5MvsZfzf3U@raspberrypi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/24 12:43, Grant Peltier wrote:
[ ... ]

>>> +	of_property_read_u32_array(child, "renesas,vout-voltage-divider",
>>
>> Ultimately this potentially applies to _all_ hardware monitoring chips,
>> so I would very much prefer a generic voltage divider property definition.
>>
> 
> There is a parallel conversation on PATCH v3 2/2 about this. Would you
> prefer that I match the implementation for maxim20730?
> 

I would prefer, in the order of preference,

1) an applicable generic property definition
2) a definition that is already used elsewhere
3) a new chips specific definition

 From my perspective, matching the maxim20730 implementation should only
be considered if the generic definition does not meet the chip requirements.

Thanks,
Guenter

