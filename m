Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0079E5D908
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Feb 2024 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706970165; cv=none; b=clbIXSeg4ZOAsUDrJgeaSvfE+0eZovMm5sEGp0lxkB3l6nlHL/6Q8n2CZq6gHQMsTLC/la5h/ZUABMqMEu7bw6mbCMw+FPE8r6rM2ok2SwQDTkRpVeOHhgRFMbjup6XoKQdKD5h4nQhPO7U4yF980PbYfdS1M38iw86oIi/Ot10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706970165; c=relaxed/simple;
	bh=PrIMWk6WiIx/F30p3tmvGplX10rZECwBwq/uYP+hWow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMQrnYNTnQa5O0W9qN1/SmJzI/eBLN+27UuDvjjB9IAV+tsODW/YM1oZ4XoiYQTukYtPDuZuaE2lOpNEz3fndd5PG2eC5ThDI/v+khkqIew3PXBwfIUjDyRVK0Pecbikv7uGR0dP4bdwGfdXrsiiUwJwdycGPjlAKq5ONLq/2gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fr+F6I0S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fr+F6I0S"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d731314e67so22045615ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Feb 2024 06:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706970163; x=1707574963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lar8+DEYByB26BO1W2Y+xi5fjc4udKQ/8U5P1WHlxuQ=;
        b=fr+F6I0S3wlRnp/dgYK/uQfgtIB9eOBmCbGfBIpU6Yz7kKjCOcwdXDalJh1TEiVzCE
         f3XkVC+uitV7DeFRxGiWafRnJnS4aRTKoMtkogCEU0GKTz1V8opVLEZiWubUdz/Mmk8H
         3xGUnmpZitZe//dY+z72GE26sQTHJuAhznxvgHz67bUOsMQx5AewVZokE2kPgiHElTTA
         mmD5JT61jbgpmPBX2A0UEdtUIU05kka4MC9bG+g31Ucxdkk0/vgWaRbQ1XQDYUTjzY0T
         3Jz/XZz7y/VyB1SHbGRtQNdhmMUnXdGRuE3XcMID72gUclpt/k1BcIwXNWYNsOebs2zU
         Ibog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706970163; x=1707574963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lar8+DEYByB26BO1W2Y+xi5fjc4udKQ/8U5P1WHlxuQ=;
        b=HRyzYqWsVje0FcD/lbws8JClTZEOAEOQL/G2cLUIphJhhb164GTnb8VJ/y6gAigq0B
         qnOCQt/PDgoS53ltRb/p3hJEM774vyfx4z400dKBWTUVr5aRAGRMYGQIsWf0XgU2rj8I
         57v52HjP/FydJXWWKVl3rGuTcgKjpoc0JJLEvhYgmRiEzoK/ezfuxQaHj5cDMJ4gfT0s
         Z2LcQWVvRE+dnfMV3MF6ZD2ovTqfwS6uOPDaA7hN7m9MNP0XT3koCeNPzXxTAsBWDach
         +gjieJXuuW3n5f/9pdbu935n2UBtlCJ/FlHSBtbxdEqamIzhlBVMonB239FUFbnCdMpP
         25PQ==
X-Gm-Message-State: AOJu0YzSPwdusx6DzJfbN2UJ+f0sv3CzknvnRDYEItIEkCTq9U+TBHSq
	xTWHlx7JYsfpchj6xf9/gKOZLaGVIunoKip5IXkTZzytfdNtFzmI
X-Google-Smtp-Source: AGHT+IFQEPoId7thmxcwoet1tk+YGlorC1f2+P5th71pKcYa/TmUDnRqg5mNpUjQrYD/kdVcKTxDmQ==
X-Received: by 2002:a17:902:f545:b0:1d9:5d65:c1b with SMTP id h5-20020a170902f54500b001d95d650c1bmr7272206plf.41.1706970163181;
        Sat, 03 Feb 2024 06:22:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVdvgSj8XlsRnO83JbSFJB566bGv3sqrrBEnbHTQGyB8lbCir7JI/2J4TSFAlgadna/kN15MYBvPugRhsLY+ku0JSKjfw4kvFytCfwEEZUyEaePhSWSwlvemlB57L9XPhGwMo9JNJzsBUSYajmjUY+AUmjo0kU8PYGgpfPUXgxCCqMa09uA5B3LSKqIy9RKcDuXwg==
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902f20a00b001d916995423sm3355002plc.99.2024.02.03.06.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 06:22:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <382a2754-f5b0-4c71-a292-7fe2095a45cb@roeck-us.net>
Date: Sat, 3 Feb 2024 06:22:41 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [groeck-staging:hwmon-next 13/34]
 drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for
 'surface_fan_hwmon_is_visible'
Content-Language: en-US
To: Ivor Wanders <ivor@iwanders.net>
Cc: W_Armin@gmx.de, linux-hwmon@vger.kernel.org, lkp@intel.com,
 luzmaximilian@gmail.com, oe-kbuild-all@lists.linux.dev
References: <ffd297c3-4ac7-45e5-bf76-8f4e4e9e603c@roeck-us.net>
 <20240203141610.5838-1-ivor@iwanders.net>
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
In-Reply-To: <20240203141610.5838-1-ivor@iwanders.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/24 06:16, Ivor Wanders wrote:
>> Yes, I already fixed this up.
> 
> Appreciate the confirmation, thank you for fixing this.
> 

No worries. Sorry, I should have added a note to the commit message,
but it was late last night and I forgot. I'll do that now.

Guenter

