Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE567F492
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707324602; cv=none; b=NBH2FH2+7wgha4lUFYAugVYD7E9w/CYnPihf+77LBP1JaVISzhgAAhedZZ/vl6DqsAlhxJYS10OECiP8ICk0ODxQvT+PIj5EGvvspXWHMx+H6Q3cNa6jX7o4vhN9thDKW4NcvbNITu/pHyXVLl28lQJKqEXjUF06xtWbRVUWLWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707324602; c=relaxed/simple;
	bh=4pMTPlMKTIPjkMHeduiSjdFuw22VnwT5PeKjWCj69A0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNIsHF5Ww0nlZvTnfNcmaL8LuCpVERSyoAMk2k44CwtpXQ4B7l15zYUC93OQsK5pvq7EEKam9+JmzK5rivo717X8QBABbwLPBleDLcye4OA9RrPKVrJERKlr3UKd12vkmiILhjbYQQd1fHQAbm7lcp6cbaWeyR3vXvzoFx34sa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9qkao8u; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9qkao8u"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2909a632e40so626863a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707324600; x=1707929400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmNZoWaSHhfjY+BBgKE9DeqCXIEBLyAoPLWFcOBJhDU=;
        b=E9qkao8uKAsVIhFg0nBXHVRCSnmyHW1SqCxPmo/m8mTHuq8rM7TlK62zuejLSO4TR+
         q0G4z4mCmKprkcbc8ME+/PXMiEBJhLJ2yEnJtfvoomMc7cV7+2r6YIGaqQiGNJSkF8ln
         bs+5hXhxIq26ufETvFbjXb8a6MImBRyKQHEi7uSYDg1jREszly7WMcWSWTzf+bdK67zf
         I8W/uql4EvhNj6EXjz85mN3L5MidKpDST+iBjQtbTpHCorE4Rc9YkFz6FmOWwuK1hsef
         RDN6gpXYGHVl6H4xGe5sFx62ZgwlShWc7ZrvkaZcxDzow1d/EgxN2YvuX3lVA0oLNYd/
         rUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707324600; x=1707929400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmNZoWaSHhfjY+BBgKE9DeqCXIEBLyAoPLWFcOBJhDU=;
        b=MZxty3K5HU24m/vWiWZ9sVmxcRykUvbBrs0zeIIdPP801jSCa59yvGmndWlRSA+BI+
         XtH07oAJdqAeZA14Qeo8noweZyXvxc1xYyBbEncxcLf53qoi1hQ3lXuz7SJutcgf/iy0
         bemw9DXndkBR4/98/soRheFiZLxxKgHGsz6BpZFaRFpzWKfgdbxmzASNkI/U33bnvkvK
         xRVYYb8SklKZc96WaRq5/yPMj5E4YVH5xSobcT6g1BoIVXD/XHeT6hIrb5oGmskqqk3j
         MMnSiIFpyyhXSyn80rsnf3IDm6OFDXRfqP6L8xhUKYHj8QwCJ3yFrsI0O7tPOIGjCxrp
         1m4Q==
X-Gm-Message-State: AOJu0YxtiubWD8d0WbHNz2YNO+fC6GEM48t48EuCJgqUvJQ2sL/Nfkj5
	TgsfXH5BiyF0jqGW+9AEIn0BONWmTE18yjO1tQjDedzj4r29YeOW
X-Google-Smtp-Source: AGHT+IGgBILtZvRY+rKn9utRrrwMkzN3q4qe31e3DZNSzBYtKgU+vjlQ9/u4SsG/VKxw/NSXbV5/+g==
X-Received: by 2002:a17:90a:c7c1:b0:296:d696:a5db with SMTP id gf1-20020a17090ac7c100b00296d696a5dbmr2884270pjb.41.1707324600147;
        Wed, 07 Feb 2024 08:50:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpCkt7Z+2jZrlzIfQ0LlEQ2up+K2mV0E8zvl3JEEAzw/3FfTWGoXvr8j2xJlKC3chSq3rxhc+WzGOUgSjWJQ5OOI7k/EXou6PAqr+XXKBz68EDuMNejjzW2IL+Pg==
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e34500b001d94a3f3987sm1667203plc.184.2024.02.07.08.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 08:49:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c2c5b8b0-d3db-4212-8311-ee54119389c4@roeck-us.net>
Date: Wed, 7 Feb 2024 08:49:57 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org
References: <b6fb236a-c3c1-4c5c-94bd-1f68b5aeac41@moroto.mountain>
 <53e0e2c7bb9cafb4efa3748ecf3ec765c262db83.camel@gmail.com>
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
In-Reply-To: <53e0e2c7bb9cafb4efa3748ecf3ec765c262db83.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/7/24 02:19, Nuno Sá wrote:
> Hi Dan,
> 
> On Wed, 2024-02-07 at 12:51 +0300, Dan Carpenter wrote:
>> Hello Nuno Sa,
>>
>> The patch 848a5019ded5: "hwmon: ltc4282: add support for the LTC4282
>> chip" from Jan 29, 2024 (linux-next), leads to the following Smatch
>> static checker warning:
>>
>> 	drivers/hwmon/ltc4282.c:732 ltc4282_write_voltage_byte_cached()
>> 	warn: no lower bound on 'val' rl='s64min-4294967294'
>>
>> drivers/hwmon/ltc4282.c
>>      723 static int ltc4282_write_voltage_byte_cached(const struct
>> ltc4282_state *st,
>>      724                                              u32 reg, u32 fs, long
>> val,
>>      725                                              u32 *cache_raw)
>>      726 {
>>      727         u32 in;
>>      728
>>      729         if (val >= fs)
>>      730                 in = U8_MAX;
>>      731         else
>> --> 732                 in = DIV_ROUND_CLOSEST(val * U8_MAX, fs);
> 
> Yeah, I guess we should likely clamp it between 0 and fs
> 

	val = clamp_val(val, 0, fs);
	in = DIV_ROUND_CLOSEST(val * U8_MAX, fs);

maybe.

Should I fix that inline or do you want to send a follow-up patch ?

Guenter




