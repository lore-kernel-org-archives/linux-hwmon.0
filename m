Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5C73EB0FA
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 21:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785964820; cv=none; b=A+P92kpxqVGGYyVcHnAJX2DeK99thDiG7vWDo5MOpVUKXNZSGRw+ZF7tZQ19si9VqGmd7yjVP4wDngOWIOHLdKDqKf+LiSE3gKQaapsYkm9wWXgBdaW6yS4XCu9dPDJY8rxc/kzeKZvkdmB8HMVtxeRa/Asf79QlNzAyldUd96w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785964820; c=relaxed/simple;
	bh=bodGLDm1Rt56s5tXjFBbBoMGwxs2Za5OPGiF0FirFq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKXhN7JKVmyfHzAlQkoO0TGMvtFpnrSE54RfPDI4fuuWG2xv1K65OzQYiXxbcErioWKnFtKNUuFuZDX5m21tW40KBbNKiJIaOqJ8OwjdPepWjRGvuIgPeNrY532/H7I8Z5I2U7RmyCnpWxCM7aeiCsi23UmRW3EolDmTayHEcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbRQQ0Dk; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbRQQ0Dk"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1778943a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 14:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785964807; x=1786569607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2l+MBd1zwpDTBmfsmYRM7PALg3r8zuiLtOkVsobznI=;
        b=XbRQQ0DkhoXMjlS/EITSsUSFo4sU5QlR+YXZcObPqcDTaiv6JtyrSJKieSgtkQYL+m
         B/w671Lf5szJfvaz5NJuwDmQWn/htHFooOFp4aJMjbwZ54XnBPwJd2LY4tLbolKsx+VG
         excUP7Z7awR97isN1S3BBoeKS3pGp73gvkzjjQx2aINNeghC8JJTQY67jAQNWji6NNVR
         VvjVaycEgimmu8cLEQzD6cEg6nvA+TYWanQFI38A5xUDM9a52jPTuhLNRBs+LS5bInRS
         aR9uUOM6VPR6ifVvAqxIFMgoP9gRqpYbRWdecrh0fZH87PSvLKH/QHpEtzoCehtN28VK
         4NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785964807; x=1786569607;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2l+MBd1zwpDTBmfsmYRM7PALg3r8zuiLtOkVsobznI=;
        b=KvhZgx6Dj1Cb+cnIwji8QA5wKrm2gQajDg0+eVKufJO5S3QlyUC9tIjCOV6k+aIBh5
         dmb/5UYt1XN8wTWXRkuNZ7znJPjspwN0JTdBGJR5Iim3/CMdiBarm2ddCrOmLwze8Dvk
         Lyagx5h9qgPHsF4CIil2BQyMWIj0t3geBSBpnyeCHm2/gww3I6pkuaywMzX4lvnawhyw
         A1oqVeL6S2LvEviiQoc3RPibs6D4Q3Vryv0LxOirTMHM5H93qsCn1gc0DAagZG7Zezzj
         LXxRYnoNqQN2IfZbttNkbpdWpYXWZeobBO+nxmcY0ZcB94Gcf97MD+1NB18Mgj6gtrwL
         Z3jQ==
X-Gm-Message-State: AOJu0YysZXRZQ6wtx4bvnApiZZQj64MPHUfKRgRKc7/UqJoG6Q6GcuI6
	rCB3rcmB9Tj4yMp94QcO8b5pUPIdvIXyUVayM63rcRD3ds5KSJRMWF2C
X-Gm-Gg: AR+sD10gUxfRisZ3/qjSmOne30a4LWTyrHhDF/qDnCI7B6s3alTITdG50KdhlXYJJ3X
	J7ErjHOa/8UrvLOoiUavPFWqXTl2daQs0J3aIXVv6l9EFKFEJWNrDDcSiwtken1pP3VbGWiuYoL
	g0mQBvBdQkibCMgTpvPW4jCreiDndK/CxPi3h1EjWqYAn+J1XJGzh1HOPS5cNPsH/C8akcAYGna
	t+U3cW1zN9VYJ86vX2OjZL7h80KBhuuWaVxtSrDKY4LwYS+CYu+MN7umfAFKVvzVic1QHZ7PkQN
	7N0yvfWtkbTG4j/VHSawgTfvCfDI6sc8PpkWlFv4+k4BG7JilwW9kyGhtSbs6HHpbIa/aWT8JZq
	DYdTocaW+siGY5zbRBUbQS9VF6PHd44KvjfU5kLxwWqtl1uWvqjSm5G/y45OQx1t5QI6zx87nmt
	fy9I7ZHQ+u7wOG1d8MPQeZQWSTTa2Ny2xZkWJPRRaFwW3XHO2BISBdKgUiiplFP6O1HeOMGmJ8/
	KJVXFXRHsBQ5MHlQu9AySVXiStjezu+xEg3+rk=
X-Received: by 2002:a17:90b:3c06:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-3903c5bcd66mr10087884a91.14.1785964807410;
        Wed, 05 Aug 2026 14:20:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2fdsm186728a91.12.2026.08.05.14.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 14:20:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3900c082-e098-4be8-8832-db2c2836993a@roeck-us.net>
Date: Wed, 5 Aug 2026 14:20:05 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: (sysfs) Allow drivers to register const
 attributes
To: sashiko-reviews@lists.linux.dev, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
References: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
 <20260805-sysfs-const-attr-hwmon-v1-3-4c0cb2b290a1@weissschuh.net>
 <20260805200755.588371F000E9@smtp.kernel.org>
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
In-Reply-To: <20260805200755.588371F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/5/26 13:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The commit message incorrectly states that the patch switches to the `__DRIVER_ATTR()` macro, while the code actually switches to the `__DEVICE_ATTR()` macro.
> --
> 

I see no evidence that __DRIVER_ATTR actually exists anywhere ...

Guenter

> --- Patch [3]: [PATCH 3/3] hwmon: (sysfs) Allow drivers to register const attributes ---
> commit 91e4cdd2e4ad9f4eaa7572f21133759d5e925d9e
> Author: Thomas Weißschuh <linux@weissschuh.net>
> 
> hwmon: (sysfs) Allow drivers to register const attributes
> 
> This commit updates the hwmon-sysfs macros to use container_of_const() and
> __DEVICE_ATTR(). This change supports callbacks taking both const and
> non-const attribute arguments, allowing for a step-wise migration of drivers.
> 
>> Switch to the __DRIVER_ATTR() macro which can handle callbacks taking
>> both const and non-const attribute structure arguments.
> 
> [Severity: Low]
> This isn't a bug, but the commit message states the patch switches to the
> __DRIVER_ATTR() macro. However, the code actually switches to the
> __DEVICE_ATTR() macro:
> 
> include/linux/hwmon-sysfs.h:SENSOR_ATTR()
>      { .dev_attr = __DEVICE_ATTR(_name, _mode, _show, _store),
> 
> Could the commit message be updated to accurately reflect the macro used in
> the code?
> 

