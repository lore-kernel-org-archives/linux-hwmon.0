Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374762C026C
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 16:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396867; cv=none; b=DUzbWG+zucrbRFuIh2ykFaLrnDGTLA9gOGfBeC9jPOuIGdqmhxCEJJ2QVfp2p4QdsDwFVKt46RWTi7edR6xIhGkkzYsC5LfDfiGoln0WXkH6v42fB7dcxph8AAVZnaLnvRBlSt11JLW5AutpoSd3POunhd4tXBeETlbpiamC6FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396867; c=relaxed/simple;
	bh=+Tri3+Y75EFKL4gc7BucYZKcTlL+uMjzyQqIuhRwO0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dx/oodZRrrdJeSnTqbBa4Sp96NDRzJUUgzEoAphF4+G/67G3OLSmU9POFAGqGjt3hlLLQYV/c3OWwn1uy28nCDIlp4G0DHSUNDctI/UnKnQZyUOnUIdiG826d/AH7MNvbvtTlTuIukaoZqjoFj5kBvgg+//xf9XbYu59UQ+CP04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvHfauPI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvHfauPI"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34101107cc8so3986902a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 08:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763396865; x=1764001665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=g9bXO5ksyx851MCyyDIbfVy53xQYO9Txx5ddxxITMLs=;
        b=lvHfauPI14kTvuFK1px0MsWz+5rdDx0ib2X7AKuQnM+5XRw+N08lmFALoGJ5RgZrTm
         j/Rx6RvXI39lgjso1eEIWNTANm5kPtDzNe4O+gc4d72RK66Ok7cggH83W0qoAE2H5woR
         EGjY6neoJzNs3jk1Ptv78bUaY7iQM7Q6WJ5kHGjQMc3f4kgbPHDeAqv98xQnUIxt3mXq
         Ggpe7/hC0YI1rBLKkq/sl2P0hC7aBcQS6MZ534iPCLwEnsCqVJC9ZxcMW3zMbzcplf7M
         ZZEvh2qnNqlyCJS+PVEZ5xen5wIrNbi3S+8VkD9PzYdFZSftAAGSofyIXkA/S8U1XtQI
         ygkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763396865; x=1764001665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9bXO5ksyx851MCyyDIbfVy53xQYO9Txx5ddxxITMLs=;
        b=UqEUlJR6Sto1YhAV8KGIwolJvDxjGDk6ZlGQjNU0dugThj8p+RW/r/JMkLBjjiZ1gn
         hC1Omb1kemcekZjClJ8EBFtXxSv+4d3hjWCUTHpBmqqqghLP3H1KeBGKCbP+2pYAX3dx
         h2rePLZsgoagCdf1dHo8ogPWSQ6iMOmFCp9x6gCJNJGfEmQjmV6S9kvFTT7FSFvBTx2I
         4zH/BqVxta+zp35WAjqIOqtb1tJ019K/cFGfY0dtEVgDSUc3wq5g0HnyjEFXdlsiB2sU
         ez1J+KdlfGfhft6kl6D8mfG2mNdGpdOMWNaHPz+UsCUeMg953NQUE9J4GYN944sJOjTD
         XHFw==
X-Forwarded-Encrypted: i=1; AJvYcCXMLcUiUO9Dq8Hl4Pr63GprAhz2QOlCUYWsQzq3muXCqEgjpUDdFXH3Tk5jD6ufz+Ys2yYfj/BWY/POMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFKQhe655nDkEpFWJw5snP2mxk5NzZwUUGjVl6rYF+e+Bvgwbo
	w9X0RAet0f2tfQIAtKJsKzvs+0ygur4qBnCQl+KWhuGjJMvYJpag4H4P
X-Gm-Gg: ASbGncvTwMC6di14SpWl17fYX9G9pN3lC7IV5kcRzQUuDa5dqZipI4dtCv4Je3Tmjsf
	v2QOJmptET4qVmPx+PljUcoUC7+BQn3idP+ecFqLVdiF1vyfBxXg+MYc7/ogr0srAzCwMsws6bu
	6MQQGoumINelXEdNcmQ80WFheR76ScqXnZ3Jspjxta9E489e/4jrUHepjD7ukx9XCAinXdLghXm
	e07MMgZiOAEZkSoVNXfsfz9FjWtUgomE9VnM+0mHTws8nRpykD+DDI7JMwpSFlbRgeDm4/+4m2b
	26J22DfjgSZmu3+r/crE4j3LdAvfxY50GP7gs2obKgFKbxwqUJUib1Rqrx41yqD3xPty2qN5q9I
	QRCTR8E56wzXR6VL3ck5rD1jAWXgfKAzQ2D7INxfqqpMQTRoSDUHOTaS2G1aij6PNjj69C34/JK
	EOoSxsZXwwcySa8mo2KPiezIrj+Yt8diDKUOBE6//7IqCZIUCTOoOMa8KJKGndyEBCyJbr/Yqey
	bXn5Lrb
X-Google-Smtp-Source: AGHT+IHzLJJ5Y3QBnuwz3zctFFWMcGjBrgknfml8ngA07+MHeXbweTwUzUs3p/Rw21AlWCRbdW2vOw==
X-Received: by 2002:a17:90b:4a4f:b0:33b:ba55:f5eb with SMTP id 98e67ed59e1d1-343f9d91d06mr12418122a91.1.1763396865313;
        Mon, 17 Nov 2025 08:27:45 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343eacc6c37sm5827402a91.14.2025.11.17.08.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 08:27:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <89beb0aa-57f5-4baa-b59e-0beaca6f002f@roeck-us.net>
Date: Mon, 17 Nov 2025 08:27:42 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: Add tids in bindings and wsen as vendor
To: Thomas Marangoni <Thomas.Marangoni@becom-group.com>,
 linux-hwmon@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 Jonathan.Cameron@huawei.com, Frank.Li@nxp.com, michal.simek@amd.com,
 rodrigo.gobbi.7@gmail.com, chou.cosmo@gmail.com, wenswang@yeah.net,
 nuno.sa@analog.com, paweldembicki@gmail.com, apokusinski01@gmail.com,
 eajames@linux.ibm.com, vassilisamir@gmail.com, heiko@sntech.de,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 kever.yang@rock-chips.com, mani@kernel.org, dev@kael-k.io,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251117123809.47488-1-Thomas.Marangoni@becom-group.com>
 <20251117123809.47488-4-Thomas.Marangoni@becom-group.com>
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
In-Reply-To: <20251117123809.47488-4-Thomas.Marangoni@becom-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/25 04:38, Thomas Marangoni wrote:
> This patch adds the tids driver to the bindings as trivial-devices
> and adds the WSEN manufacturer to the vendor-prefixes.

This patch should be the first patch in the series.

> ---
>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 2eff6f274302..e120767ce119 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -488,6 +488,8 @@ properties:
>             - ti,tsc2003
>               # Winbond/Nuvoton H/W Monitor
>             - winbond,w83793
> +            # Temperature sensor with i2c interface
> +          - wsen,tids-2521020222501

I think this should just be "wsen,tids".

>   
>   required:
>     - compatible
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 42d2bc0ce027..2cf753fdf5a7 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1823,6 +1823,8 @@ patternProperties:
>       description: Wobo
>     "^wolfvision,.*":
>       description: WolfVision GmbH
> +  "^wsen,.*":
> +    description: Würth Elektronik eiSos GmbH & Co. KG
>     "^x-powers,.*":
>       description: X-Powers
>     "^xen,.*":

