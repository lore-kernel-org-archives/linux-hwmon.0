Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C829537E315
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822284; cv=none; b=bO25Ad1sCdqiP5kf3VqY7+NQCwr0FSy1ISIrCdXIlj6AZlVdTwiO9Fnfcb/8DwK+za9gqY8X6wk7ft8pMsOFfLFP+o2q38LBVU4P+WaGhq8OFmgLAYgXMQl38RiTjQIh9TxBhk0n6OXETJ3QdGNn4jnEz2LM9bOMXKMflZCi6TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822284; c=relaxed/simple;
	bh=RMwtDs2I/ZWY2wxwmWL2JE/o7Wvxl3ntG6n7oWUk9l0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Kgq081dTgxY4btsvQNEMWoGqsQZxVlA5LlGZ95Vf4tp8yCSriFiddOnSzZMJDdgyzL4zdGhE61X1G875q0svwjOZg4Y4q1UNqfG8AjFAanD/dLj7OQKepR13tO3LyS+J2FZ7V8JBHV9aIzcdka+6JDbyuoxZufQvTRUAt32ujoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNTwJYGR; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNTwJYGR"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so7520106a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773822280; x=1774427080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rw9skmW7gSQA7A9LKea8FsTJ3gcQNsDZ0b0TEAKCRIo=;
        b=nNTwJYGRe4Hp5GfYu+Bdrw2vyO9jKoiRCr0Ei/PCT3thbfZJZCuJZgpbp7XExzzhLM
         5gOKCUhN9e69X8JaF2x/WnPXRiIOW31fHsdYhJq4xeIeDxNXYOE7fFt14YscAtpaHfnh
         WRrYCU2AijzXq7JXE678XNiWhyCX3njyn1KxWDHi/i5R2lagjslX/kLi8/65Z50D+dZz
         2MdvIChtVa023ohOa65qkZFypFX2bvBf8t792ZnGj2IJdEL/Gbh2HxCGKSePB5Xe7RDp
         l3oG3oukH/AJVLSuiD8lVi8fKKxSk51sJi1+feM+rHMU+E3aDZG//E+TxmC32yNpbrPG
         /8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773822280; x=1774427080;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rw9skmW7gSQA7A9LKea8FsTJ3gcQNsDZ0b0TEAKCRIo=;
        b=AfgA1Rb9qEVCGgoHs8rrtORl2JD0S1Xa0F4qhxhUIkAqRNO+PcJxbmgiWvpyIZFQhg
         jYz4VOuEb0aDhKMma7NUxkWJ+stiSMDPCRn/hWvD7zbTUVTu+xRz7Sh1kCnxkvH+l2uT
         KXXv3e77PBaJNjmLpX5Xnkb/s9Qq2ZhIfjNigyGB7/yddvDEo8orNODUMMNjBxY92Opi
         ikWFcdZp3KyJTK9iv6rV0qgSmftDUxsFuiFW3SlnNbNHw+9JpD8dE+hvDZUfy3h5qfHF
         GbW4t/u3lOJd8Mho5hPOJ3eyXtUrKynfjh2lGta/VXcaw5Qm/ZAkWeBb1rklriJF+k/2
         lqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaYtDG8mp2vrfh0tqeBc/9FdPf4eHq7F+BwRKYQ5kwUKctRSUGQFTmJqjXETk0VZ38TgKuglv2NpWplQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrwQTMJz+KwWNm8clzdyo8IDZ4ON6MKPQvOfU5QxQJNGKeockS
	LkNgO59yFS5aXXv77Fb0DP55O6isEhkqAHGKBhaELB/Kzmr/19+JxQ6R
X-Gm-Gg: ATEYQzziKipbNLDAWY289KMwaSVQ3E1ktyT3CdkLeMSMApwH/uIs5geFZGgsFkBSomn
	0Ul105zl2Yl7dn1ac/iB8NR9lqwcuJUKPXjcW1TVs+BiZlq0O9QYC3Ti6B0LpjW+gGoepIINGIb
	IniCxQW15D3fxj5lDrGhj+yrgya8CRHZ7M0Fv8ZjIiNqAp+SDqAdYIR/2VU+wCxGn5pkFpZ6zRG
	OZYAPWkZS7It4TGjfjrwQx/k+E8p7z8AjuiBGg86il50O52Qe/E3yDP56JLrRUopjCX6mZ2g6oC
	aOhMQiLpMDGJRLpV7/nP7F4VN4z7nVv+QJIg7RFbwBWmGYeZQaoyxEa3ek004YfqAym5+nQo+SY
	pjL8/JbFMGpJOEqHdsRxzl6rJpJ5ZusY7Saokye3kPM2iiKx0/ZHuuieGNhB4WP0rpysZOsJ/k7
	7niUGdYV1Ucyl8kWCJk80xBDZUyfiCi0hsoP1qBn4/frm8R25EnjWi8Ow8IOyVSIthreno2xaW
X-Received: by 2002:a17:902:e850:b0:2b0:7224:a4ea with SMTP id d9443c01a7336-2b07224a622mr8770365ad.39.1773822279704;
        Wed, 18 Mar 2026 01:24:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e615fb6sm17613125ad.66.2026.03.18.01.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:24:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <73d65018-d78b-4964-954e-bc02db11f0ef@roeck-us.net>
Date: Wed, 18 Mar 2026 01:24:37 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add mps mpm369x driver bindings
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, corbet@lwn.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: wyx137120466@gmail.com, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260318070115.1609-1-Yuxi.Wang@monolithicpower.com>
 <0111019cffc080de-4f80c201-5cfb-4bcc-ab98-8c8747aa4639-000000@us-west-1.amazonses.com>
 <69ee987f-37d6-424f-bcf0-9a13c176b08b@roeck-us.net>
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
In-Reply-To: <69ee987f-37d6-424f-bcf0-9a13c176b08b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/18/26 01:02, Guenter Roeck wrote:
> On 3/18/26 00:02, Yuxi Wang wrote:
>> Add a device tree bindings for mpm369x device family,
>> which includes mpm3695-20 and mpm3690S-15.
>>
>> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
>> ---
>>   Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>> index a482aeadcd44..7b9d9bc89d07 100644
>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>> @@ -342,6 +342,10 @@ properties:
>>               # Monolithic Power Systems Inc. digital step-down converter mp9945
>>             - mps,mp9945
>>               # Temperature sensor with integrated fan control
>> +          - mps,mpm3695-20
>> +            # Monolithic Power Systems Inc. multi-phase controller mpm3695-20
>> +          - mps,mpm3690S-15
>> +            # Monolithic Power Systems Inc. multi-phase controller mpm3690S-15
> 
> Each of the series supports several power levels,
> indicated by the -xx extension.
> 
> For the most part, the chip variants are register compatible, with few exceptions.
> Specifying the extension in the devicetree compatible string therefore does
> no make sense unless really needed.
> 

Also, please note that mps,mpm3695 is already documented in
Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml.
MPM3690 and its variants should be listed there as well.
At least one of those (MPM3690-50D) also supports PMBus.

Thanks,
Guenter

