Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2203D0932
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 02:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785812305; cv=none; b=miZr1MWIX+vb7fWRiYj4Fh8bHvfv0qMDccFKDOtXjMVX+4KRVCxGB0/tg7TFMFNkfVpIgzYWp73cQetMDyncivTPy95jULX0H5hFkaMT9dwZwdHO0YavCg/jEqxs+bv1V7m5+z+K3Iw8SYnFeWUZhksmhh44RUeGNZlj+aMoVFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785812305; c=relaxed/simple;
	bh=CP5eq71sSZzdacS2eeJlnmWSfdHgiy0KwM2u8rMXdPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uH0dblngpwYhYfoU+3J0kShfo95Xl0C2QhLHzzmSy9zY722aRouDwHhowjpWEJFcZPxy8K70KDMQwXuLGj1Eo88S0CdBwZb4dQAQhAQrJkbp9OIA/LAZNy2K8eAgHm/t/IAqbSBlg5BtMF1IKvTE5/KUgaNawYEA2tS6FAVzA28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGDhHwMG; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGDhHwMG"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso4428716a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 19:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785812303; x=1786417103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSyjvC2E+ZEYF+VG2ByzR9cOfTyNZVaptOKg2nUM3+o=;
        b=RGDhHwMGUwlOJkbLfpwHorZx4Oz8XaxBONXcv0mycyMfnJDb7KwEfCxcl21p1HgiQ4
         VXgKuuqZrR9KQEBhLC7ur1YS4TF4D75H4Qlc6EtcMorhlI23/6KPLBIpP7a4DLUD1GDJ
         FsKKtayoFLuadL96vhLgH4JcIPtJ1cef/7drmBLZ0mg9nKfFOTiT0m5a8fzbSWDZ2Vc/
         d51FSbfYn22KyLdS1mzzHKuR45Cn0TMAPrZD5++du0NdIKrVJbwj022KUYUQF3kQ3Ief
         Tq46qEP+RtpNgiY4DxJhY+waDuP2t3N0pqDh592Vqwuy4pEmt4MYhIedvnK9Ed0/mVgj
         pBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785812303; x=1786417103;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NSyjvC2E+ZEYF+VG2ByzR9cOfTyNZVaptOKg2nUM3+o=;
        b=YYiJ99AnS4ng0PPCHZH+dh1GVIcfJ0alXQrv8A5En1tQKl6PEHGn770y+Vd0KCfKXI
         U7OEn1LiYpKG++lhGG+6Zdjey1Vz5o88K3MU48tZtsphGk2gSYaqtZPMN3uaXXU2FPcl
         A0A9Z2BJXiCabscxQ5vNjRMAfTidqtvnXvz8Xg4pOQMefQpf81lzxJp8nY6TFtxLiLhX
         32EVk6PayIoN3wik89eJ7ZakuuMJB73FnC9vLzYU5a+WCa5PdS4vCb6fy18vTO7oPxEF
         Amvy7zwefdm66p0QKDwDfmGn9vhBieR8Xau8X3TnAfWhMDuKF2odTQev3XbH9QnPeiHP
         Nu9A==
X-Gm-Message-State: AOJu0YzmAJSu6082oCXRCWKFWNepW+JH8KStlSy9nwwNc27mV5WW46XW
	MnE13FrNZ2SvdOhdqdzbPmllFHYdlJjA8uDSpIZR1NT1XGDNNeZuspHd
X-Gm-Gg: AR+sD11/JmcqIYq06ghLIwgHJxs/JqH2uGMLTMGXNhzsg2rj+5DiPInaPiNzQRJ2y7B
	b0Txy+b0C6ywCm322m2ZoWF90W06jZtrLGA3es26QtrTdup2h8+9sLPp7QFM9EwxjfkmIkmYg3C
	HC75kSvjUzIS8QvkcN5xjM3iiSNKW2WTujKzcya99+3MxGuf0ENREt/LKB91NRZrlCbhRp7IipI
	RWgwlLHBKb8jeswWVC5Nwmddl218k7+YzmmEG6OVnkvnLRuejVwFO7/ZDXHthQ4aHBPuhkYiTyy
	oWVzDoawLwv/AeLANIpc3+9/2Ss3O0/kDaXbGfPZWb9t1/LpJ0Hh4OkAr2xWSjXtcvzm6ebbCg9
	UdTDjZcP/kvcsMuwcQ9f4HqgDi/3IjyKL89kNud/99dEP0PIUAA6NWag6qmGKG4FnhtVAEYzrcg
	8+kuxEUqaS2bccZnLm11hbEefouAyY6hOoOuKE41fuiie5v3YvNaw1cHFYz5CAKr51x5oLF/l0i
	tlKfLBUGbmmauUIEuP+rSWvxYOgLFzQVxkD1i6ZA8deaMm5Qw==
X-Received: by 2002:a17:90b:4a11:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-38fbc4055bdmr11262278a91.2.1785812303085;
        Mon, 03 Aug 2026 19:58:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm70968853eec.28.2026.08.03.19.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 19:58:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ad63fd4c-c109-4706-b3a0-e217307031f2@roeck-us.net>
Date: Mon, 3 Aug 2026 19:58:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] hwmon: (corsair-psu) Fix linear11 calculation
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>
References: <20260803232156.2340048-1-linux@roeck-us.net>
 <20260804001526.211161-1-ali@iusegentoo.com>
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
In-Reply-To: <20260804001526.211161-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/26 17:15, Ali Ahmet Memis wrote:
> On Mon,  3 Aug 2026 16:21:55 -0700 Guenter Roeck wrote:
>> +	if (exp >= 0)
>> +		result *= (int)(1UL << exp);
>> +	else
>> +		result /= (int)(1UL << -exp);
> 
> This breaks the build on 32 bit. result is s64 and the divisor is only known
> at runtime, so the compiler emits a libgcc call instead of a shift, and
> __divdi3 is only provided by sparc and parisc. SENSORS_CORSAIR_PSU just
> depends on HID, so i386 and 32 bit arm are reachable.
> 
> On this patch applied to 2d2338c93da7:
> 
>    $ make ARCH=i386 defconfig
>    $ ./scripts/config --set-val CONFIG_SENSORS_CORSAIR_PSU y
>    $ make ARCH=i386 olddefconfig
>    $ make ARCH=i386 vmlinux
>    [...]
>      LD      .tmp_vmlinux1
>    ld: drivers/hwmon/corsair-psu.o: in function `corsairpsu_get_value':
>    corsair-psu.c:(.text+0xa0b): undefined reference to `__divdi3'
>    ld: corsair-psu.c:(.text+0xa63): undefined reference to `__divdi3'
>    ld: corsair-psu.c:(.text+0xa83): undefined reference to `__divdi3'
>    ld: corsair-psu.c:(.text+0xaa3): undefined reference to `__divdi3'
>    make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
> 
> Only the divide is a problem, the multiply builds fine. div_s64() would do
> it, or keeping a shift on the negative branch, since the divisor is a power
> of two anyway.
> 
> The mantissa fix itself looks right to me. ((s16)((val & 0x7ff) << 5)) >> 5
> puts bit 10 of the mantissa into the sign bit of the s16 before the
> arithmetic shift brings it back, which is what the old order failed to do.
> 
> One small thing on the changelog: it says right shifting negative values is
> implementation defined and that multiply and divide are used to avoid that,
> but exp and mant are still computed with >> on values that can be negative.
> That is the normal sign extension idiom and fine in practice, it just reads
> as if those had been converted too.

Good point. Supposedly is implementation defined, but even sign_extend32()
uses it, so I'll just undo that part.

Thanks,
Guenter

