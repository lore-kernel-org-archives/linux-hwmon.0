Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7359C43F8C6
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248237; cv=none; b=hEHE6FL1w9kdGgmPNdocpIle7yQBg2pcVBpYgvkDfHtPdahkCD3cW71BGaU5oHQIHqyE5nCS2jsPGAoEI5OjKInmkFhqrHbzqYLAOwFttNsAPWNeOVobnMWz+quq/l2NqexyvOfINpCSbBSEQehyReKRH7xIXHzIySDYa7DDIJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248237; c=relaxed/simple;
	bh=as/tB2J1qJ/XmVAAS+U3LSRuI+LNUzFS2duMgwDmutA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JpxxCkl0cBGARZIjlQG94o9Fk/5q4m4zoZiOsK7fbyXzij5Ngi6lhROiUscn68pXXkLNYC3u3TL73gEBOBlFHlQGEIs89IJ3GnealwjnclCQpADH+S7Wx8z8YCWMZbiYb348tNwxLAZ/jIC3UQbIrGbN3G8yBBmsbHMZMKIo8Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bS+sqNBT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bS+sqNBT"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so723417a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248235; x=1785853035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AemIBNPvyLNz8qFstYKlP7drLF6IsiF6+LqbZEPn79A=;
        b=bS+sqNBTYLRaQXGBHJOndScqXiK2o5KGqzLYGBIxRGOSoL17JinihpYIR4O1LcqwSi
         k8bYbosA8KNVwYXUBM2zlRYvlABgl2gBS5nN8DwCd2k1f0vmUZLnR/uG8wUJxWrJ9qYg
         LwUMp1P4jcLBH5cH+ipoBX1BXwiRaGP4Jh53+QecY42pQnsUuDwPQGMZ2LRTmRLEv6QQ
         60XWsGbOdmup22PWxXuzaS5uniyUh9xu5STR6hNgR0LFbed7Z5u6xqGELzlbx5JSdmlj
         /Z+SmGFm342h/CEGjuywk+WE/R00R7Q9yjyM1B9iw3W/rYod7hZ+BTge6aBdIx+nbbNJ
         hGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248235; x=1785853035;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AemIBNPvyLNz8qFstYKlP7drLF6IsiF6+LqbZEPn79A=;
        b=qzI+qRXegJElEQ4A72y7uoYG3pK3AgtZi/MOtu+ixe/BDAtzRc9/AusAh+1pPcrgvi
         VBdxz8d9asNq7dsRhF7xLgCw5FnqzAOGLzHavxXumssQZBEGbwl5746Z3F90VeRwOyC3
         X+i7yyQ3/2ud9fm7E7tlPYxcgJWhDTrKnVZo77rXG8brTDBi309B9QcFsp075+fetBel
         md5vY3uyT92nTQ2ChPu1/N3i8ZHxE0/eZV0fbd2pxlkhXwhzT2twRGFkrBFhDBztoRLc
         9/dUeMZs18CeEEM9ZSFPDc8619PlWNjjAsUQnNtQToAPf+hb6YqLfbcNhhda8ho/LTf3
         1T4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrVrE8Edqs04y3YXqjC/mJbYyM9xxeNggU7YU9gtb6NFW4tUBX2M1XO/EI3ueDBOrTfBidxBJ35JfnRzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlGSpiqWEOP2k2ncI5aj5mI28e9L2QAfbqtPqR528felDduZyQ
	6ygNdHXDJHACpTeHgSgRDCBxmX1DCQbadNzmHudewgrLWKzCop6VZZem
X-Gm-Gg: AR+sD12CoM3UQtX4yQToM6kCcKWxqamhBbw7wKncNOpq9uWyRBhVdvrI1oMiP5Z9EpW
	hGiSbM/Ndjuh81xgn6Hb6v1M0fyLaGmfrf1UlOZSSs1AGbE53EjpblLt63Qp7aNqiie9BoMl242
	96Wfv1VqeL7cgo7Uk6r1xiM130ZdlNanZNMkybQVSjbmyVJ9+QAgiFvMKnqkoPPd3CXVtWWNlJP
	/Y+nyYfTI961BWmKiUwp64sDoWh1zR9UQ1mrzi44TKZ7vr/p3ygWvHc0fbkjty85m5JD0SY8ocr
	rM0NprNe+yJ0KSQWXVU5/nZUA1fjqLBHFAnxEIoHBUCN4Jj97caU85KfF+esDOV34Puwo48lWiT
	T/c+jBpgQiC+lURU/UAGrv00sWrqEdWkBiJ/lJs+S0+n9TBu7qqLtd8vBG9OE5bRHpO1OjO9Ils
	YsO91tFxMODvX1qaXlVFkoWXRJT9AdvSPPpbZXF9n0A4qJdUcYmY4=
X-Received: by 2002:a17:90b:1a8d:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-38f6a20d0e4mr2580594a91.3.1785248234687;
        Tue, 28 Jul 2026 07:17:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm31636283c88.14.2026.07.28.07.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:17:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1aeec2cc-490b-44b8-9c93-64caf7f961f4@roeck-us.net>
Date: Tue, 28 Jul 2026 07:17:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
To: tze.yee.ng@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1784785709.git.tze.yee.ng@altera.com>
 <d29d05f8bc25a89a0dbf59c8a0bb705f676a58a0.1784785709.git.tze.yee.ng@altera.com>
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
In-Reply-To: <d29d05f8bc25a89a0dbf59c8a0bb705f676a58a0.1784785709.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 23:02, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Add a hardware monitor driver for Altera SoC FPGA devices using the
> Stratix 10 service layer. Sensor channels are selected based on the
> service layer compatible string.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

I assume that the series will be applied through some other maintainer tree.

Guenter

