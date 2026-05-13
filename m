Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55643921FB
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 04:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648186; cv=none; b=FVnrfKjoNrwYpn2nG3HPlSfozmfZR84mFf5RHvvVRrbnRfygvZhkkgZon3p9wJxMJEGTsdKILzVnCLw7SP0VLu0WxX0TFHM8hvhnqwWR7wpJgjXsHTE19X5HG2+xM2brp3bP1kCX0bdWxdXgr3pw7v5GhnXZNZOMzSeyS9pgYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648186; c=relaxed/simple;
	bh=oEFqrGJElVWsJCJsodudX+JDfgrg6P0Nyniu6jzWYn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IyhcZERd9uNJqDF0gPhHhLslyCpODlu2BpmKBFu1CTJlfFjyjr9hOprU32Hi8HC2zRZM6yK6IOnjvwSPh5OQH2EnNJakIj/MFtb+Wpgo4nWb2rSJgWy1XJ09iF5wPwNgOQ77w6ai+tGxZsgTg/fNp8T+r4doqm/UCYoSl2siuxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yexmv0Rh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yexmv0Rh"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-835386ff122so5946375b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 21:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778648184; x=1779252984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BY2NFR2OVpU0WhoUPQAwuaAExP4/KT35v4Z4OHaj9Es=;
        b=Yexmv0RhAnB3YFu28XfmvRuyVSDTYwFcYgKPsP9bNBpkkXLPtbtdVu7ze//E2Swl/w
         VpBXpwbXZUjRCEgSLnevYoa3yfRT2KUyb5NwpS0iuIlxSstVJtaiqsvTyi187kueLRO3
         gF8hhlY0D0B/1tLlLOwU5nH69sCyQn3QGxutMQv/YQls5/G4s415cJ9GVQfWkysFT8jA
         LHApzBPY4xcn8Ws5C4nmUiBok9us38iQwi/11GgBXzZUwvHsxUoDr8Bw5ZX5dRabEEWR
         TMAE14oyWf4MkeRP9kcUiPzb4IKYKaXubNJyKX06lhL5mrOSR0cyCYXVv58yhC451EZB
         jWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648184; x=1779252984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BY2NFR2OVpU0WhoUPQAwuaAExP4/KT35v4Z4OHaj9Es=;
        b=T1cevBJmOJEyP4iqsLOlkYkSrEmm+bE4/u00baa81o8oTA1L8NQlH4ZYUyXcMfafCg
         apqOKe0+bubV/1tWGO4+Lr6rbMtaLLJQXMutyOo3LYr4rF0/IvqFf2UKgRWmhZCHj8wu
         aCiNMBruBW2Hg6MCBJsjEJqYfAfjAN/qpxdnc4R5lE8kPuDVlygPWP2nxHd5UCJkfVCg
         zzuww/ODIXly9eR95XoBTYdaXCJmF3bSqpep9GNLw5breukyT9bcYPoGu1pLnkoVOtjo
         D/EsXzwcADWIhcaq0DFwDZPmMELFwGibCV5j4sm2vDj4dDlEf8mtfOeRI4xnZbeXJxmi
         sYyg==
X-Forwarded-Encrypted: i=1; AFNElJ+OXSc+Nf1/Rq3fd8gLDdf1tM3Id4S91uaUIpqWcXwwgxBkNoRNp1FWfapYVqg1blVssF1/Qy0YpRaevg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUwUjPPlPDaBLuF20MWA5SdFea99pl04NqxK8b+n/IwSSNZrMt
	qs+8k4IhIVU8tNoQCdJ9HrkJItYNyLi/mU0wsiqJ2dqDXFbfYCd3hm2c
X-Gm-Gg: Acq92OGSlPxiqtcYW0xcxaQvVqfHOCsnsA2Zounxg2+G0O9GiH682k9wDvWZG6P6ijd
	QrGnDtIiaIDwEia9tmxvUk6baezS+GFFhotgJgqw2Qa5zuiR/X77UUR1xHctoSA9MS21Uf4lTk7
	0q5Ca4rOMWh+lb0pwDeVHGWgpJay8BCypCG6jBz71mAfaeTN+KclXuPAUnYGKYcgSCr3wgcdYVf
	8vG8sh1Ci2KrDil9VAPn0fkwUnfcNGb8vff9GY6uLZOCXvxSJj2irc5iEU3INB4TYtv03xHYB88
	nNcENJw9ieloorDkIBGTqI3VK8DoqP6OwDXG/Dq24/Lr0+nVY63YE3C4b2iWMEvrqrikol5xXsZ
	aq8pYcSmB8R/NkGUFVaRvFbLokgT3gWvr4hvjX2BE1dBohAFEnQgrh/S6fdlzHjADzXk09iIXGf
	mgmiRgeAftHQTOPNrbFYWy/NYyMtkptay5UmAceiC8rh1YOTjOA7uIoFgG0cLLI8zeaPc+K7gW
X-Received: by 2002:a05:6a00:2291:b0:835:4776:7d7b with SMTP id d2e1a72fcca58-83f042b9b10mr1696659b3a.42.1778648183897;
        Tue, 12 May 2026 21:56:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf0cesm30881108b3a.46.2026.05.12.21.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 21:56:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9fa93f79-526f-427b-bc43-1216fb5ce94e@roeck-us.net>
Date: Tue, 12 May 2026 21:56:22 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
To: sashiko-reviews@lists.linux.dev,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, linux-hwmon@vger.kernel.org
References: <20260511-d1u74t-v1-2-623c2bc1532a@nexthop.ai>
 <20260513031519.A55BCC2BCB0@smtp.kernel.org>
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
In-Reply-To: <20260513031519.A55BCC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/12/26 20:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The driver fails to verify the number of bytes read (`rc`) from `PMBUS_MFR_MODEL` before calling `strncmp(buf, "D1U74T-W", 8)`.
> - [Low] Copy-paste errors in `Documentation/hwmon/d1u74t.rst` for `in2_*` attributes.
> - [Low] Inconsistent error handling styles for failure modes returning `-ENODEV` in the probe function.
> --
> 
> commit a76e770177dc6ee5472b638d5e12f032fd0a5cd5
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
> 
> This commit introduces a new PMBus driver for Murata D1U74T power supplies.
> It relies on the core PMBus framework and checks the manufacturer ID and
> model string during probe.
> 
>> diff --git a/Documentation/hwmon/d1u74t.rst b/Documentation/hwmon/d1u74t.rst
>> new file mode 100644
>> index 0000000000000..f7786ebba0b47
>> --- /dev/null
>> +++ b/Documentation/hwmon/d1u74t.rst
>> @@ -0,0 +1,97 @@
> [ ... ]
>> +in2_label		"vout1"
>> +in2_input		Measured input voltage
>> +in2_crit		Critical input over voltage
>> +in2_crit_alarm		Critical input over voltage alarm
>> +in2_lcrit		Critical input under voltage fault
>> +in2_lcrit_alarm		Critical input under voltage fault alarm
>> +in2_max			Maximum input over voltage
>> +in2_max_alarm		Maximum input over voltage alarm
>> +in2_min			Minimum input under voltage warning
>> +in2_min_alarm		Minimum input under voltage warning alarm
>> +in2_rated_min		Minimum rated input voltage
>> +in2_rated_max		Maximum rated input voltage
> 
> This isn't a bug, but should these descriptions refer to output voltage
> instead of input voltage, since the label is vout1?
> 
> [ ... ]
>> diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
>> new file mode 100644
>> index 0000000000000..3127e0e5a23de
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/d1u74t.c
>> @@ -0,0 +1,85 @@
> [ ... ]
>> +static int d1u74t_probe(struct i2c_client *client)
>> +{
>> +	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
>> +	struct device *dev = &client->dev;
>> +	int rc;
>> +
>> +	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
>> +	if (rc < 0)
>> +		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
>> +
>> +	if (rc != 9 || strncmp(buf, "Murata-PS", 9)) {
>> +		buf[rc] = '\0';
>> +		dev_err(dev, "Unsupported Manufacturer ID '%s'\n", buf);
>> +		return -ENODEV;
>> +	}
> 
> This isn't a bug, but could dev_err_probe() be used here for consistency
> with the other error paths in this function?
> 
>> +
>> +	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
>> +	if (rc < 0)
>> +		return dev_err_probe(dev, rc,
>> +				     "Failed to read PMBUS_MFR_MODEL\n");
>> +
>> +	if (strncmp(buf, "D1U74T-W", 8)) {
>> +		buf[rc] = '\0';
>> +		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n",
>> +				     buf);
>> +	}
> 
> Does this code evaluate stale data in the buffer if the model read returns
> fewer than 8 bytes?
> 
> The buf array isn't cleared between the manufacturer and model reads. If
> i2c_smbus_read_block_data() successfully returns a length smaller than 8,
> strncmp() could end up comparing against leftover characters from the
> previous Murata-PS string since rc isn't verified before the comparison.
> 
I think those are all valid issues. Please fix.

Thanks,
Guenter

