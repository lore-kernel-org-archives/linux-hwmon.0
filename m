Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813411DED7B;
	Wed, 29 Jan 2025 16:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167812; cv=none; b=heRCJsU9BWZu4SgLOheUz9RZPQiFCRhF2DFv7VLt6nexHGR0et8bFT0XZb+zVP+OOEXzHtMxxY6bsitlxWUf2YObJqXYXynPMniuwLDSkafwwoN/OAhVK6alrnCD4J34gOpOxHUxfREODe5fNwcihuqq12U0gEg7zB4QenLBxLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167812; c=relaxed/simple;
	bh=SbI96DxGaVN7ilMsg5TicDi/x0EbFo9fVmX/y7emjDE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lxlj+OsJaXd3WfnDK7UrT0wNX9rqC2V7Wi45l5Vnz1UZPDLDuJIg8fevGSiEI0IwyY9AoAWTTiu98+fDMWq/CvrN2H1W/QdCuH8Uyv5wdNfLTZ5+sstkGUtc/upS4xOYvU9eHn6V8iVGgJt2kVsB6essjmwjQ/PsPqxPQUfL7KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS86Ob1B; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS86Ob1B"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21680814d42so117865585ad.2;
        Wed, 29 Jan 2025 08:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167811; x=1738772611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=36dtZRAay9N4M7y7ZHTCiePhRr5R5jhfAKCEXGuNcUE=;
        b=XS86Ob1BCct7tjJ+nGxZu+8/Z3pVS4TavZ8mnk6OFcCwlJFYhvk20XGpakIVjkU1au
         1G7TPk6LloMtL//66MiNruznnXQONfWA+iwpJk3wg+q0Jp+QixYN17YWovVETHgDpcEK
         p6C/gOa7xMprwXwi+w/p0tcC+vMIE3bUewvPI36lj/a4/wCqtEMMUIXIGwnoL35c2r8u
         WgacQiCaAoV1SrR7/xfiZblAXpooIdQ90BnBoZ6WevyIVZ2PuPPxPhOs3hvX4OYEk1xg
         x9EUt3sZXnlmsi7G871GIyva1pSeQMhBNJxiBQjSRp6B6f+4I3odGMBC7zp42wKubAh+
         ECbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167811; x=1738772611;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36dtZRAay9N4M7y7ZHTCiePhRr5R5jhfAKCEXGuNcUE=;
        b=Sj3gsQDyTU3j2pMzMOwCwKqZjfWy5CGCdPC8aBQmxkjFo+070SDJTil0de1Odkta6q
         jesACWjJfsMJJI1A/DGVJOmvjoLV6Dmo6o860pj4YSCk3a+q0hwo3krKm1ms5OV7luba
         QwlP2iu9RgM6ROWT14JSu7Jj08zYf6ja8m2o+vzmqba/8mxtCdQGVKiAh2Y2Vv02GsbT
         eLTqFL+7mny/fKi+z6N3oDwbxpBtpQLmiYRebw5pcWe1q3eMidfU5t2/YbMo9GWNmCO5
         626I576Ylp6kRNb3NUisxYA3H7HdKfTQM5I38y9hA3G9OlAiMJQsER7f83KHkGVhpbH4
         ylmg==
X-Forwarded-Encrypted: i=1; AJvYcCUACYdK/gbPHws/LSrgXdsZHDInOtFTFMJyKgYZEFtQz4U3HNT7k8X8QN9x86lYwaqrQfLilC4fxET+VPWN@vger.kernel.org, AJvYcCUvNbpWihNSssQ8RemZWhR03xsQ0jCtZ18gTbk0RCPDkjZxkMkLvPLj6GChcxppGuO433S4LbKdyuUb+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvoQ6BepkIRYcSwofZk3517bnqx4IXnTHLRjBLyLXe+9Hfzzks
	w/VYkDVKorIA/p2OZhBUn8Mn1SQF38fN9rGshGF7hFxJXHXhk+a8
X-Gm-Gg: ASbGnctQNto46467PoozIvuzGYpBAjRHs+gwPG098Ap8OeOEd7FN/fwLujomh7KQz8j
	jUmgShwXsF9OOsqWQ2LfKwE65ITMRz24BarXc46Gnt91Zfg/A6oIOyP4Atf737twsWRgBgJPfF/
	sFTVNoMN3QOYZFV30HMBWm13yxgU3qoynue+320AcFl6o3CVCD6boW5WUVEzAidYBGrQBNf6emc
	rKYiNqnkHnApEduxMJzFCQEtSZgHI3cYJkuN1VvhdxRweCibOSKh1BWy81SyT4SJVHYkvz7PFNl
	3IwYAUN2tf4EIoxLvfKtxiNuf7PLr+0zpthsEN+mXcIUMlyTO8+7kd3Odd1k4lTw
X-Google-Smtp-Source: AGHT+IHsAfwU0/HctHajSKJaE2H3yHI0zgzHhK1BNRRNa2tyjSHwhuPvRCnwSiLrYDjVuwcRcvmI7w==
X-Received: by 2002:a05:6a21:6b02:b0:1e0:ce71:48e0 with SMTP id adf61e73a8af0-1ed7a6f9345mr6269699637.39.1738167810633;
        Wed, 29 Jan 2025 08:23:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c5afsm11680281b3a.131.2025.01.29.08.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 08:23:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <adee0116-0f75-4ed8-aae7-4cbb7a3a2df7@roeck-us.net>
Date: Wed, 29 Jan 2025 08:23:28 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmom/applesmc: add imacpro
From: Guenter Roeck <linux@roeck-us.net>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250123121728.1383-1-evepolonium@gmail.com>
 <2346bf1d-9292-40cf-84fe-fb173baeed08@roeck-us.net>
Content-Language: en-US
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
In-Reply-To: <2346bf1d-9292-40cf-84fe-fb173baeed08@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/25 08:06, Guenter Roeck wrote:
> On Thu, Jan 23, 2025 at 05:47:28PM +0530, Atharva Tiwari wrote:
>> Add iMacPro to whitelist as one iMacPro is released.
>> The iMacPro 1,1
>>
>> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> 
> Applied to hwmon-next.
> 

I should add that I fixed the subject line (there is no hwmom subsystem)
and adjusted the description, so there is no need to comment on that.

Guenter

