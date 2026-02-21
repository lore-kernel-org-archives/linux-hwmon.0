Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF90313555
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 16:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771691125; cv=none; b=g6+ZLGj0km5QuYjlF4u/6540iYqUiv6O5ioV3ETN2hJSUiH+gCfhM/SCkqhDi1Ad494+pecySIHM2BVYzVFmKjALmQv4VDoRG9LdOPQzpGnGlP/dUUjmqFk9/X3AONwv2TOSrINO7+2IRSjcdIjfOsoXFC2NOhKg3A0Nl2vctQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771691125; c=relaxed/simple;
	bh=sFKEjzENXJNVnyRaJGFMPRQU81k6/dFpnETRgXUVghs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZBuhExiN/debvRKJ81X3VUK8BW6vKAMlORnZIAk0puLE6NPobBYIcwOjcB2Wm6Fk8I2FpaWIfttZWwdS1FlS5pQKyNAo9km/YV0USFS54wbmjNHeRKmCH3XyaHm2sBX+DvHrVyb7XDYT5EDe3CS9Bd7LSKAG/p+vgPgYmMB7Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTfeOG+i; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTfeOG+i"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a963f49234so11898695ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771691124; x=1772295924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=72FnToCet1+aF35ptduMaG37Zb6q/7/K7/efdNYIv+I=;
        b=iTfeOG+i6eQ9eGDqPhfqor9RtNXZYnBlUC8d8vBK/S+/qeayDMIQpO1ddZoMogQxp9
         MejSR7AT+LsRLYegFyxHLoRnDxlveu+HZUfz8eNFYxQVrbgwrlcMSHNyt70/wNHjUYEw
         MqOoMuLcWLZxLTGQ0MxPSESp5JPtqSfgZTJurZ5IUKm/MLBYOtD+MaInKH41eDkHCF7R
         bVutdpcw5SlUF9YKy9rBfFANBuRGoi1JmFXYNhVQeAo6emE2mw0fxCZp3jyb3o84XPl8
         ALnmCPvgq1ObgnY5HIML1LVuV3faE3XxEe9fPqca7+S0ud9V1mnZO+2So9iEf2KTwDOS
         3osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771691124; x=1772295924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72FnToCet1+aF35ptduMaG37Zb6q/7/K7/efdNYIv+I=;
        b=InDlH2TYdinxXMCmZjygtGl7IqwZ4AASyTPUCdqWnmZLyQXwnW0whtaGVq4+IxTSXv
         u50c5z2gEyLvqNAds26wc7XFMvPNNwcXZR0ET4IpEnd7uUJr/a1GltS9Oq858+6z/kUm
         VZIe4uTNIzmXa9YkOBHEJIHiyBqZeiFuVCvNS1D781Se49GlknkE5z+0kZo1jkRV4KHa
         s+FP/YOezI/GQjfV09UiRC1nxRKl0FB+zQ6x0fHwQl9bPH+GIT2WMPWsGoDNRVnbV0at
         nBlTDAMkwha/9NIkFryZ5P1G6sXBWZZ0yH/IArNLEW+g6Yy0wyeoNahePym4jJmFO3pS
         KtIA==
X-Gm-Message-State: AOJu0YxdmP8k7TtUCZR0cy0oykoU8UTGwJ4IsF4us+K8+hK8/kWv76IS
	aPSwvUGbmXttncax67+Mx5aovnw4XkfJDFxDE8dpv4QCvnOAsFfpE0rB4bACyw34
X-Gm-Gg: AZuq6aJtYFhOHUxCiyoZVzNUyX6fhHabkWIYmGsEN7lu4KJcDLt+7r5haKrFqQW4e6z
	697bbFazWe3hyC2qit5mO4kDc1y9lrLGqiC+TfU8UhspEJkeV2sAe8/4R/Xd5T61S9wr3W+qJ0t
	fynBQoUJezF4UEvL2TKx63fqB5A0jMyWhZUU55MHWO/SkdvC5geD/WBWuLSpGc3Dsj0F2lMWObL
	It6tv2y39oyS/XlhNQgn5uqcQfPkbbftmtyzUodEkmb/lj0a42NoeGb5T8dXAP0e5nEKBszqess
	vMhe/rlNWfcPARSK30QcthXFhd73wCldmDTq+z8tYz8xAilmsnBhwbI2m8GLJaoWqDktnl6DR/p
	G0dekEVnOiOd4aju79SDYQRSpg43xH728kFeXBgFHUV8b92QUj8v1cZfFmFQXHYpLyMCzwt9ACt
	nbP3DaBOOSoOHhWYnm9uZ5Pf3x4cM9gHMDJZNKlI3CJDzKzSfIPpNNbElF7qGJpZBbeUq4YkRHT
	3/ZJAOWG6Y=
X-Received: by 2002:a17:902:ced0:b0:2a0:d629:903c with SMTP id d9443c01a7336-2ad74516615mr31607075ad.30.1771691123696;
        Sat, 21 Feb 2026 08:25:23 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75028a63sm25901325ad.68.2026.02.21.08.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 08:25:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <61c69c54-5218-4c53-8bc9-4032d2967571@roeck-us.net>
Date: Sat, 21 Feb 2026 08:25:21 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/REQUEST] Support fan control for MSI Prestige 15 A12UC
 (16S8EMS1.107)
To: Lorenzo Ferranti <lorenzoferranti04@gmail.com>, W_Armin@gmx.de
Cc: linux-hwmon@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <CAK-2s0=4PfPXe5GUKY3NSkKZb6Biax6O5kM5SH4t_YhwzLM9EQ@mail.gmail.com>
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
In-Reply-To: <CAK-2s0=4PfPXe5GUKY3NSkKZb6Biax6O5kM5SH4t_YhwzLM9EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/21/26 07:36, Lorenzo Ferranti wrote:
> Hello,
> 
> I don't know if this is the proper way of asking for a patch for msi_wmi_platform driver.
> 

That is a platform driver. While it registers a hardware monitoring device,
it is not maintained as hardware monitoring subsystem driver. All requests
should be handled on the platform driver mailing list (copied).

Thanks,
Guenter

> Anyway, I recently switched to linux on my MSI laptop. I noticed that the drivers can correctly get my fans RPM, but cannot set them. For example, in the CoolerController app I get the message "The currently installed driver does not support control of this channel".
> 
> I am using an MSI laptop with:
> 
>   * Model: MSI Prestige 15 A12UC
>   *
> 
>     EC Firmware: 16S8EMS1.107
> 
>   *
> 
>     Kernel: 6.18.7
> 
>   *
> 
>     OS: POP!_os
> 
>   *
> 
>     CPU: 12th Gen Intel Core i7-1280P (same as Big-Nicox)
> 
>   *
> 
>     GPU: NVIDIA GeForce RTX 3050 Laptop
> 
> I tried loading msi_wmi_platform with 'force=true', but this does not enable fan control. I also tried looking at the msi-ec driver, but my firmware version is not supported yet (but I am trying to get it supported).
> 
> I would like to request that this firmware ID be added to the supported list for fan control in msi-wmi-platform. I am happy to test experimental patches or provide further debug data to help map the registers safely for this model. I sent dumps of my EC and ACPI, I hope these will be useful.
> 
> Thank you for your work on this driver!
> 

