Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C5F43B4BD
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277954; cv=none; b=eyxigAWix1biBeGrTJ0DccjOXPFPiDN7r+25GRnR8vBJlFx8mVZOZB/eT+1f5Ka6pnsLq+fN6gUt0mNF9OI72sNdEwrAvS36OBUZzgX72jso3ZX73NkQshsR3lj6h5nW75kpQ31RZmYuoq1mLZl8vk+zX6GmhAUaXwdSueGAVAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277954; c=relaxed/simple;
	bh=qo4B/VQg4R+HIO7ngGNWGs2o3buHaJOuHDhTIuyaKDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdQ2xK+UupslSMsENgXQ5cm11OCAVB856seCAYSCV07oOuuaB7ehs89HxSEbjHKIZjdDBpwrNc9hcFGAtg2EQ30NsWwQmqZ9saNVvknY7aArWZiT5Cpww0B/m1+pFvbEFRnzEnYyOQp/qbketnMnivhfSyuNdV64TWw/qr1X2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4Jpl0Xm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4Jpl0Xm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d942c7cc2fso10476495ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277952; x=1788882752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WYsUBtiu7T2+UaZ7oUOCjJO0hwH1VaOOpnsEx1gGuc=;
        b=A4Jpl0XmDBWBX9V4rg3KonHfeoBLqepqSv5eGC8+zN8XWA8xIzCglUKJ62wLTsh6Oa
         k2CdGTatiYDzu4I0YlNsbHX+IFEgb6+thcVK01sohBv6IWbB6ZO2u2tmRl2vR9KEzVZI
         T1ZqkDeSsBw9JQR8ysiVTYupvXI9GFl83rfa7juPfQ7d/jJntiRznFzvnUEwH8SB16Tl
         wdKhNL0B8uXfL0Gkpe33WS48tZcfxqkYWMhfwqi1LQpzOSwVdBfqtCBwsDCnqC7wyGut
         H/yxxQiRj2dDneFA6aEnAHQorKkBJrk4ehhatIM6Z/FQ4GFjgfB5r/QIoM+oA8HvNSVS
         D2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277952; x=1788882752;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WYsUBtiu7T2+UaZ7oUOCjJO0hwH1VaOOpnsEx1gGuc=;
        b=EtM5D581lQbIe8aUf5dodLeALAgmiaxlCSWanck/O0eC0A+WCZlu0adUyF720bvo+z
         5wnuItF477e+Xg+0CVTThZ1gl5kTGlQzCQd1tHiumSR77KxtEKyu41vMiR+32tfHNCe3
         1gqW2Smd+8zH4S17skE4Z2+dvP9qYOz+VM9ghxo/HfUzci0KRz4J13y558R3Sj35o8+5
         W3B5Ff3UT79TxgFyxOYN8MYcpnGelb7hpI+gzvSaG+krtQOCBHb30GrNW4559gWFR9Qh
         iEyvarmqzhUqxn8bJjFM+XdsQDSNoPTTXGe0RyXirqPIw6hpytl6EOmdezVPwRhVnERi
         PhbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMwVp+6h9dpSmrPhpoYawA05o876kQq2otvYxT1H5XAjne6TYMh5/mWUbSqZ46ySYSvQl4Y/+55+PyGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m0pYdwEMcPVFxHVtA9qxLXQ9jhwZhmF2x4Ttx/u6+M461pP0xu
	InzSoE7gjwxXE6TqSa44u2eyEyM8MR0VNdOivmHjgncPmvv9iNN7g4MZKA1h+A==
X-Gm-Gg: AYBFou1QhVhwuZ3eIwXSbNsoVB+Tb6lqmTHUm4pGCLAsC5HmshF4t1rinh8+8M0S8zt
	jiyRqXJ7yjP31aH0pe+L8zP2J0h/BLEafnYH6S88Y9gRVrksO2oRaaqTdjH2YjDOM/DsA3jzaDy
	Rt8YiPuG9WZMUfpBskDGyIaRjXl9r/OBLVRbWjh507APmkPHrBELxMXBEipbpEXmfMj0eZRJU8C
	rwlokPxZSd4RCETtzq7atM4urydFF7pU1dObg4turP0TDHOGRnUCNo3AwAUk495HECet82uSOs9
	aG8enze/UoH3JP7Rlt3uynLf+ot194xIXx8ECXsntl2tA3gtH6ylfJqzM3nD9z++/L7ncbXTOEq
	aHOd0Fp4vgA0/Ko9Zf0Feaeeo10yypZ+ShJTHKn8so6pJiq8PLDKjP9R9QtSlhg8F+s9QPJ9h4a
	76wRW5S0uNGVF4nJSoIqAf9spz65JQ/tisbhO/ECgMWmZkbuTuHVlhJzmI8kVv4bQcchJbUt32a
	1vddGYNQg+wCRz+8/bxvvk/xcPV/tu6rikEDNvQvimS5XDbkg==
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d74df0328amr583020155ad.12.1788277951579;
        Tue, 01 Sep 2026 08:52:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd6348f0sm795365ad.23.2026.09.01.08.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:52:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4cc20c64-bd95-4689-81b3-3f01d9c3bc8e@roeck-us.net>
Date: Tue, 1 Sep 2026 08:52:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
To: Conor Dooley <conor@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
 <20260831-dominion-data-c8b6f691dd5b@spud>
 <ZQ4PR01MB12023835F6083F45484E1ED3F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260901-contrite-cathouse-f50c63af6323@spud>
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
In-Reply-To: <20260901-contrite-cathouse-f50c63af6323@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 03:14, Conor Dooley wrote:
> On Tue, Sep 01, 2026 at 01:24:39AM +0000, Changhuang Liang wrote:
>>> On Sat, Aug 29, 2026 at 06:19:40PM -0700, Changhuang Liang wrote:
>>>> +patternProperties:
>>>> +  "^fan@[0-9a-f]+$":
>>>> +    $ref: fan-common.yaml#
>>>> +    unevaluatedProperties: false
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        description:
>>>> +          PWM channel index. The driver allows two fans to share the
>>> same
>>>> +          PWM channel, or each fan to use a dedicated channel.
>>>
>>> Doesn't matter what the driver can do, the description should describe what
>>> the hardware supports.
>>> pw-bot: changes-requested
>>> Does this fan-tach controller provide the PWMs?
>>> If so (although Guenter may correct me), I think the fan-tach controller needs
>>> to be.
>>>
>>> If you don't do that, I think you're going to run into problems with having
>>> multiple nodes with the same unit address when two fans share a pwm?
>>>
>>> I think what you're supposed to do is drop "reg" and replace it with "pwms",
>>> but once again Guenter may correct me there.
>>> e.g. aspeed,g6-pwm-tach.yaml
>>>
>>
>> Perhaps I can refer to aspeed,g6-pwm-tach.yaml and change "^fan@[0-9a-f]+$" to
>> "^fan-[0-9]+$", which would remove the reg property. In fact, the driver does not
>> use reg either.
>>
>> Our fan-tach controller does not include PWM. The JHB100 SoC will have a separate
>> PWM controller. (This controller uses the same IP as the JH7110 SoC, but there are
>> some differences in driver implementation.)
>>
>> The JHB100 has 8 PWM channels and 16 fan tach channels.
>>
>> So currently we expect the Device Tree to be configured like this:
>>
>> 	pwm0: pwm {
>> 		compatible = "starfive,jhb100-pwm";
>> 	};
>> 	
> 
>>
>> 	fan0: pwm-fan0 {
>> 		compatible = "pwm-fan";
>> 		pwms = <&pwm0 0 40000 0>;
>> 	};
> 
>>
>> fan-controller {
>> 	compatible = "starfive,jhb100-fan-tach";
>>
>> 	fan@0 {
>> 		tach-ch = <0x0>, <0x8>;
>> 	};
> 
> Truncating this for readability, but it looks wrong to me. How does the
> feedback loop work here when there's no way to determine which fan is
> connected to a tach channel? The unit address of the child nodes has no
> dt enforced guarantee to line up with node names of the fans or pwm
> indices.

Normally (for other fan controllers) the fan would have a target speed.
The controller measures the speed and adjusts pwm output values until
the fan speed matches the expected value. The controller needs to know
the association between tachometer input and pwm output for this to work.
Typically (for classic fan controllers) that association is static.
In the Aspeed G6 fan controller it is dynamic/configurable.

I thought this is the case here as well, but I have no idea if that is
correct (or if there is a chip-internal feedback loop to start with).

Guenter

