Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93B61B29BB
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724949882; cv=none; b=kCrSzD8UifPQu95DB/HDLDQWaVf6AcRHW6A4LhgAJPHJhu8Lfm7NlMmOSnpoDU3sOH2f0ztekWlsAcMoiJl7hLe9YOw9anF0P0g89OMe/QA3z8EmM5iTAPsomQhq5De+MszH/22YmRfSBNLRNNznwfC3NH30uSQupLZeqGRitkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724949882; c=relaxed/simple;
	bh=83/3YLsPQ8MFBeqfBIblcQlJTv7Bc7nldDIQh4GvkC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p1uIIqaSVefc8vSHqrTVczsSJKrtwwzEK8RPA478Vyu1Y+4HMP16XtWihMs+GqVYAzEDU9eSRzSEyHylV8yksBllaJp1ldAXbAEixjGsH+EO+kGftaVD2F47KFDOimuUiab9OMGIsx34h46FIONzUH7hss4vrnXpzKZdi8iWK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ro5ve4wB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ro5ve4wB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-201ed196debso7515505ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724949880; x=1725554680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6/s19oZgj6F57IBYFZ4y8t8IJmWR0KGLGF4NmkqqPU8=;
        b=Ro5ve4wB4+ispbTbTLlslmLnEVRNrQ41ywRWVywN3EXyN1KyoNEa9rdN3a5FweIlsU
         Q7KdUoXWucufqOPihUN5I9OSifTYpI3jYdTgZaq1Mah/0J0Tb1IKO3V/53aBgn9HZc0P
         dvbsUnSlV7Mr8lW198VJ/pzZnjG1UBRqTuHhSDXRPhTqJkk90y1pmadnsXY6vVUufOhA
         K95wEYtFfFDZRzVGd2I/5Vj350IALoLOWMJpGyn1/ZpnU4t/v3BRJ29MlwD+NDXUcS/y
         eAtIvYTu+JCAhM1h+0Js0oe3WgQZ71ZecnPL0VLO33Goo8F3uuRlHD0OePAiMypyxfjY
         aPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949880; x=1725554680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/s19oZgj6F57IBYFZ4y8t8IJmWR0KGLGF4NmkqqPU8=;
        b=wPkksrRdHYc8rAa16/o7G0Icgg1poCLsjzCVU0ZunnFNSK7kcmPdtOHOspZM6IGPK9
         /kEMtxazDzZ8CMGBooUsl8vxJPq574s380QWY2DEDxOKpXe+Ai3xcQ8xmxlUa4aYT2pG
         r0djMC7RA6jxS5L9Q1rYrPhTxjuD7AFMs2s0cx/GchgHkbUVb4CIvS1Tk0yezWTrBPhU
         RWqTUN/AzGqlN6ecTsRIyllCxTp71tJMnrFb7E9ggY729wm+Sp2lONbHGqnuEzFQ4qh2
         yvftmCpRQh/NIz7ztFOu5TpIKmV7+W4N2yXoEm42qD51F1rZzo+Wj+QFdMMdc/TclE7+
         Xtjg==
X-Gm-Message-State: AOJu0Yx7iUDLZ2PdsVNbKirnLRFppzXJmxg0MKfA8fOHpcrmk5BiPJD6
	HgrrgLI5qQe1g7BL9KmgoHawKVjN9SZQWVp0FaBMER+qZrf+PBh16MMPqQ==
X-Google-Smtp-Source: AGHT+IGdhd3KTK44SYIRKl5dMKINO8YaqXYoA546U0WWBK2YeR/AEIPehsM/QW2ES76/JgNSRAm9bA==
X-Received: by 2002:a17:902:c94d:b0:1ff:4967:66b with SMTP id d9443c01a7336-2050c4e0745mr41258235ad.56.1724949879687;
        Thu, 29 Aug 2024 09:44:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051556ace9sm13466555ad.308.2024.08.29.09.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 09:44:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2104a78d-acd7-4b04-b5cc-bb4e73c2d9fb@roeck-us.net>
Date: Thu, 29 Aug 2024 09:44:37 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] hwmon: (ina2xx) Mark regmap_config as const
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-5-linux@roeck-us.net>
 <ZtCLji0GiNhoA5PB@tzungbi-laptop>
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
In-Reply-To: <ZtCLji0GiNhoA5PB@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 07:54, Tzung-Bi Shih wrote:
> On Tue, Aug 27, 2024 at 08:34:48AM -0700, Guenter Roeck wrote:
>> Doing so reveals a potential problem in the driver: If both supported
>> chips are present in a single system, the maximum number of registers
>> may race when devic es are instantiated since max_registers is updated
>                       ^

Fixed, thanks.

> 
>> in the probe function. Solve the problem by setting .max_registers to the
>> maximum register address of all supported chips. This does not make a
>> practical difference while fixing the potential race condition and reducing
>> code complexity.
> 
> It also makes regmap could access out-of-boundary (e.g. [1]).  Is it harmless?
> 
> [1]: https://elixir.bootlin.com/linux/v6.10/source/drivers/base/regmap/regmap-debugfs.c#L441
> 

Yes, that is not worth bothering about. Any driver not using regmap but accessing
i2c registers directly could do the same, after all. The regmap limits are just
another level of protection against invalid accesses, but they are not essential.
On top of that, direct i2c accesses to the chip are still possible, even
while using regmap.

If we wanted to be really paranoid, we could provide chip specific readable_reg /
writeable_reg / volatile_reg callbacks, but IMO that would be overkill.

Thanks,
Guenter

