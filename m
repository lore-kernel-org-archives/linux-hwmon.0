Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7513112BA
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 01:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722156; cv=none; b=QP30U1yDqQ4TpWVzD9TP4DzGXyIET3kq0/X76VYy0P2yXcVyaALuXbiaLt0PE9urmMmb/KXtjDM24+LGKYZfCaC3u7Nm5BOZKv26Rw7jV/LU9f+f6iHBiH7Cc71T52FOZXmHUDFmi8uopvTwrq1A99ca9P+kadV9Nk1uKZJCcDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722156; c=relaxed/simple;
	bh=l86ufggAd4c7tUjUM1xUPtCifs1068odxp7kjf00w2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukJvjddWpbZQCfGUmrBlMkAx5nxSU4bwRcUlimaM+652Aw1w4StgBGn7e8XSNvKmGbrGQqT60Sn0vv3yRrhuvpkTFH23NS3ATKtz4SM3gNAGXUWN/U2ytzdWRaEGzQi/L4p8CCKpoxZaoU0P4f8oyD/ib819Ghz+Jd0ropO8CLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyHgIL79; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyHgIL79"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-130c9dcbd25so6810195c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 18:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778722154; x=1779326954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fHK8+ySx1qJ4ZPnZp6f5AvHndZduIM6uMuNhMEw3KMc=;
        b=KyHgIL79SiVkQgv2AMSJ//hGKj66mrFlOYA+m3TIbClBqyvf/fXW34R9l4bVdcwrWk
         dPdvhYq4N4/G6igloW0bKkwmfmEdw/pwJP9JXwzyzZX/o3s1LG8axY2Xun3y85/P9/pt
         bAsnCTMmHVQOv5kLkvFcwnbsPbQ/TTJXnftroLIgiYmD77lBnm2IRCX/CXvFl/bVl0w7
         VIQivp1tv9ieqMD2svGlgijaLvvQWwQwzaXig+J6hj5O0x0vFAwcuQCyVmrEG5YOT0e0
         fKtOxiNkl9m9/zi4ynB1tQrkm067DfIP0M4Ltw8umfAlLuFO239hz4vlPPpFLAs119gU
         7qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778722154; x=1779326954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHK8+ySx1qJ4ZPnZp6f5AvHndZduIM6uMuNhMEw3KMc=;
        b=XDEsHCMBH0Y0B0a1NckHL0nuEMI+5079kVyiDDg7kpgXiZgrW/RGxHAsokr+/7qPsQ
         c1osMmQxMtsVO3pU30PiZlb441ta6wnQtjFpA/rcejKQI3T56AlcvnSUb2lIPMAjHY8k
         UXp/vbUUZvKWbTNvj3MGbzygewp3T/KhcEJKVGE/8Nutd7XShCMLhXfvEvd+3So6okc4
         SHo6wSr/uzVJdpaIqJTxSQzAZqhOuqXiNZ3Sdb3HQ+/wpkMJgSqtOTQKrIgJ+HvcG6FZ
         LoRmfVPhVIMbXfdD06U4DCn5dsEI1qZ3+d+zEqrNu5Kc1ONYIYJEnvVku7SheTjIF3X8
         YZ7g==
X-Forwarded-Encrypted: i=1; AFNElJ+8QDIZXQascM/f48D3sOOcyyVmX2+kDNB1uq6I4s/fTvQDZJsf+FxQBhd140DcCR4Z2OoAQbBRn8K/VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIhHgMuWsqa41FQqQWBLFLM7pMckaBIgK4myUc1Nsy4ij3JV4V
	ji8O13mRLLWfOibD4WPw8ACscuieqhXpToYxtn6+hqEuUXDtSnWpxNX5
X-Gm-Gg: Acq92OGCrDOqAlmKzLq8MLg1/czB13Pjq/IIhIn6K3w5anQuDxU7y4HOHax97bojRkH
	u8rT4NMQbi5QgZG7YFgHhqylBdqIyhmn9YnItKjhHlYtccaBJcA72FgRmpFZOGFXMuN55oA9w/3
	iviNcn1fXv5IsYOogd2/7YHsuxl1+sNXdCOeOHyRfq0jXyQARf9hFHYjQdt/4iF5JSS3rWl34Tq
	y6URR24ku1WBIuRDZW+5P+Oms6GABtKJq7vUCfH2Z6hzN3Vd+N8+seWRLfXRyDcmxgCTcPyJHI3
	LN2VIX9+QC8JAnTGwMGVJAm56JBp0bnoUBy8wDYAnL6o4g8Ll493R9s2MM3PL4mHyHqxtkxKXUA
	OG9Ppio8Po/O5xVlbtAvuVecGSAyvdwFY2FtJFo68aFbSNxFTRvYTlY6XTA0C+c7Ek6qroj0FZr
	DrQ7xAJyw8LDypfFqOqjFIETSPjDB/t4UZpmrFE79q0xHtGTR1XlA/VJmaS/Up7sXTWNu18Ji+
X-Received: by 2002:a05:7022:90e:b0:134:74a6:7db1 with SMTP id a92af1059eb24-134c8d412d1mr1063490c88.20.1778722153814;
        Wed, 13 May 2026 18:29:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm2119725c88.0.2026.05.13.18.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:29:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d59e3a08-cfc1-4231-9adc-14b62f3aff90@roeck-us.net>
Date: Wed, 13 May 2026 18:29:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: lenovo-ec-sensors: Fix NULL pointer
 dereference when DMI match fails
To: Kean <rh_king@163.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260514011411.4167069-3-rh_king@163.com>
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
In-Reply-To: <20260514011411.4167069-3-rh_king@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 18:14, Kean wrote:
> dmi_first_match() returns NULL if the running system does not match any
> entry in thinkstation_dmi_table. Without a NULL check, the subsequent
> dmi_id->driver_data access dereferences a NULL pointer, causing a kernel
> oops or panic.
> 
> Add a NULL check and return -ENODEV to gracefully fail the probe when
> the driver is loaded on an unsupported platform.
> 

How would that happen in practice ? The driver init code has

         if (!dmi_check_system(thinkstation_dmi_table))
                 return -ENODEV;

Please provide a reproducer.

Thanks,
Guenter

