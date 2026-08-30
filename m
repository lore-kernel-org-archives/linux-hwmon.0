Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC473B27D4
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104294; cv=none; b=Yf16kv0vHsKepOA5yfBuTVKFM4LikxNcGQ/MoXMr6Jsn9e9SS2hkr9OcNAK4ufDgEkAZ52Yfdk7WZsM0U7mfyWK1xlBOi4abmnCyGRUT7aF8FCJfl5ttJiF9EIWG9w5vmKD/clzJorry7/B6aDLLvgAg74l7iy7xkfNjcsehHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104294; c=relaxed/simple;
	bh=42a7FeYTUqyvHIggrb14edhLBGxKxj9yK2RL3MdOSbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELWeRVrZz3Zb/Xd8leyKFzfV0TIb1eGoL/dQhVTGY/Sc/AzkG2G4j+crfMNylAnYd1GkOICXvkV7rgShs3h8gXOGHaqU80GFx2QAWorTaQDHyn3VbkpDXGZQmA+mW/FTzu+HQ8/dKsXU9P/61W08y8oJlkxq2BuGdaRRbK6lSCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muvk5iVW; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muvk5iVW"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso2273528a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 08:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788104292; x=1788709092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciRQvpR+Sh+544fgrHeR8zv7MW8fKoH4Hb2ESodOcd4=;
        b=muvk5iVWSOPy9xp/zAWa1xVqYPWzkWblqEAhR3RWKJ7VIGsxgYOvepb61JnRTfYpJw
         r153OEWp+HGEjaB9cgpvFAcl5Ro5kxeexJJdi6e8CQ5tHpryHlp+Q27eOEwPjbot/KbF
         +PzjUH3Acfnr0XPQtRc446yMTTv4LEeG1XESJAfw+UIyOHTFK1G0I5orWO/32LZf+29z
         nhhl8fR5SGsDx6xKujmohXbxp1sOg4RQf22xSP+OKgIVW487MyaYLcr9Xqv6CF9LjzBM
         Ixo1pCRV9vFtja1ylmsdz38DZaM9zkdNzPcJD6rYWPMgxzWfDG0SVMDOfCaSbofVMjYH
         iAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788104292; x=1788709092;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ciRQvpR+Sh+544fgrHeR8zv7MW8fKoH4Hb2ESodOcd4=;
        b=IjrZnobMCf6NSCaRdKqjaAdWSp/96D6Yjq/WrCtuFpnQoe0cphNnelxHX6n3eoNiMR
         xZhrv9JsRjshX8juSlRpjJglt2jPTfkl5eKa3uJhTs0DlBBANLYnXUk8dBsZKoBZPC/A
         73ta0vLhdzdOqpgzuZLsOhBoOfbxIboc/pcNDM7TyCmu7nw8Ck2V5d69MOYkVZBW6o7P
         k+JYsjx40DgiPUjLn+/fcDK5FZsqJH6BDCHIp1KlGcrIIwbNyp6LTyfOCCkGbtYCeaMf
         38aTwLKncY5eLJBGVPPpV5W8xVUZeZkeZyzztUW8cHnT1jFpiTOhYbqa0QglhT+BAaDP
         iCoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpp7XsF1KUnM+jmLV/gai1zPZdysqXlF7aDaGG4FrRDNP7kebJ/R4+ndzzFtgSI5cY00IHRkZwfxW4beA==@vger.kernel.org
X-Gm-Message-State: AFuF++nbmkKVKyKbasva83BkD8Bgf7ySSv0LMIIDI2BZbKvcTzBnyrxx
	6S9fxE6S0fkhEje6RanLO3bEK7ZBJAHlITAIt9z9aedcTiTL8gqtX9gj
X-Gm-Gg: AR+sD115K/j6BpMHAKiL93NAohX3VMxUT6AtEXMwVYBL8PMTOzrxuSL+h3f2nHXHNgT
	Sxgwk7NdxFljJIBMm23QldCc7p/Cpcl9S1pAFqec3aPWn3MY5CRnbeLflQ09Fs2crRYeBkbGB/4
	m1ghAQkTds/2Kjrm7GqMcIPvVqNsDPW0oRBoKJGkI3BVA/emYmEP+i62FFStkcg2d4CkMt0gI6O
	vpTH0B4cvNNTWc5md9nrzDVFkWnW3oBjjlZrXzfvCWv685pSKsZR7cwG8SneDg4NTCl0OkqtTkb
	zXrW+dCmnshMEjpYnskiSXDM7usvZCrzRZr3mgpWpkCif1hNQ+0F4Uz4l5wnb0qMOLWcgdnVdpC
	5T1kwkcYSA88jbpWbTa9kwSobVIVGpQMqX1HqnoS6PzHsX+8rWXcwWX6U4lSLJTODspEe8Yjuo6
	32SkJ/+5vcT8uzte3WxOUnL9j8ZFgQggZeCJEetMOjJXEWQeLDtlvEKP3f0pwzcLUGStApyCSeX
	Fz9PylaAzpBhEeJ8tmLQ46+/d8WinWnZD5CiLIE0FPk7NdU
X-Received: by 2002:a05:6a20:7345:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3d266ebc963mr30705222637.5.1788104292060;
        Sun, 30 Aug 2026 08:38:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36ae4ccsm3055626a12.19.2026.08.30.08.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 08:38:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <77319f64-75d1-48d6-954d-7e1891362b08@roeck-us.net>
Date: Sun, 30 Aug 2026 08:38:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 out of
 trivial-devices.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Wensheng Wang <wenswang@yeah.net>, Cosmo Chou <chou.cosmo@gmail.com>,
 Colin Huang <u8813345@gmail.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Dixit Parmar <dixitparmar19@gmail.com>,
 Antoni Pokusinski <apokusinski01@gmail.com>,
 Eddie James <eajames@linux.ibm.com>, Thorsten Blum
 <thorsten.blum@linux.dev>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
References: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
 <20260830-alluring-goldfish-of-cubism-eef6db@quoll>
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
In-Reply-To: <20260830-alluring-goldfish-of-cubism-eef6db@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/26 02:53, Krzysztof Kozlowski wrote:
> On Wed, Aug 26, 2026 at 05:14:19PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> Move ti,tmp103 binding from trivial-devices.yaml to ti,tmp102.yaml. Both
>> devices are single temperature sensors and update "#thermal-sensor-cells"
>> property to accept values 0 and 1 (passing no argument is equivalent to
>> passing 0 as the first argument)
> 
> Why updating the property? If there are single sensors, then what is the
> cell for?
> 

It registers as temperature sensor with the thermal subsystem. The documentation
of #thermal-sensor-cells states that the property is mandatory and "... Will be
0 on sensor nodes with only a single sensor". I don't claim to understand how
this is supposed to work, but the thermal subsystem code looking for it does
seem to suggest that the property is mandatory, even if there is only a single
sensor.

Thanks,
Guenter

>>
>> Fix below CHECK_DTBS warnings:
>> arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: temperature-sensor@70 (ti,tmp103): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 5 +++--
>>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 --
>>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> Best regards,
> Krzysztof

