Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0826370D62
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773820630; cv=none; b=jZbTezXDHSDXUcjSBx+Rte7Yf94qP6AxYKbzEZoD+xoOQrYc0GeOSt+vgn7maNx8rC/+ml0NiWLg1Kyh3cRNmSXegfsk6xKnwGqfKCHNxhAIfLIaEjRP6BCmstUcCz4MqWNwOhp1HrLrVlXv/bY+H5q/jmtfsnTBliGxCFmzvJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773820630; c=relaxed/simple;
	bh=YfDNY7iT313cuWLGUm3tugBriz8wM1xUVFpg1wKyFdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGyjU2m8+IFBS+9tsx2UM+/g12I3vcJwm/Uj46Zg4EOVqwzE1/Ak6Y1yLT0u1W0KDXhwtGAT60H/4QojCwVgzrpoKWYqTSWh5ZqoGY+wcruT9V90Am0/LUfaJ93rvPNmWpADd8aoCpH6hGd5kHAdSKV7zUjjyUGTmQNi277H8IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XioBKofw; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XioBKofw"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82985f42664so4356568b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773820627; x=1774425427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PP/+AhmvNJgyxIG32WMnq0PVn4gPH/Re0miowrwzYdM=;
        b=XioBKofwOjSvw9ZJSuxbeyg/DqL45J0qKGnufEOceOQznjCK3+CKOrs0V/R6c40TlX
         xt2Flla8rN9b5l2AbrKfNJzewWv2eXw82JPe6EBbP/caRgyF3PW0Pw7geiJXVtMTc3Rl
         qsbaCUx2+QcB7Bx1h+g1+s+KTEGy0rlUThZwFJkZ1HEma54RNstbO9nAgVaVeMP9RlIt
         kuDHBt73/+rAwcj2eUEmC6jdwyHPByNUUUg3iGrKb+cQBZyeMxUbvl9dTwgDpkf0TzRB
         W652oIkePEZmBGFE7w/UaBBpp4iQ5x3eBUto0mgxn4Fu0VR/wqIl4+v1kXuH1ZWu+iFj
         A7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773820627; x=1774425427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PP/+AhmvNJgyxIG32WMnq0PVn4gPH/Re0miowrwzYdM=;
        b=JUoCk+xiL2FIH4Rqh4cM4YFMF3lNv1JenmwcGIOXY7HWLA4AbaxQIbFrnzGQGXDWqF
         zVEGMAwJ56JPFlDDKR6zjc8SB5OQZux/qhAGx1BTC2RB02qJoUYLlKab3Spr0Ro0wg5s
         JZk7IkwlJXytUjxpC/Z0xJRgYXSZJ0spT2ot38Syim2TDmuhjKFvSVGNZ13MGB0LnfRV
         L99L74EbdLed2ADeKy9zRoH6UbxQ3SJmGuJv8loz+tpTlfU4SgZWdhUNt2ue/i/nkLOM
         ocv3GmfRHlLeWm8wxBTW3in9KdvMZ3HLuYfnpCMz0KDXPMpioub58tWsrTHGWzHft5g0
         +VCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXItBsubhs1Z5V7BlN+KhkYXB39TQK+eYjThGUovk9Kc3AJ92xPuj8Ke75eH4RjhJraqIWzgoL/CEq/VA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq//fF/U0zCkj9SN0jajTnCvoCGUVdc/h2yRsxHK2Ux2467J8D
	cjK37VzoYbp/n1dDZHGmHOwyoIsfRLlpHrKPKflECHy26D3AzpgBYVdG
X-Gm-Gg: ATEYQzxF2xmCaU4neGtnoOQ1X22W1vB778yqooegHULBFVz0Xzh7iBwxI9jcM+5PZpq
	qjVtx5LE2EQRlnWEi/8jItes8QObVeLgIDeojPXp6fWPfAOhEFs6OelEzAnCOduIkQ6BWLocfaB
	Rps4sScp9U2VD4mDSPokd4i+SHX/sb3u0x3JwUZ4NlpFEOjpjg2LL1E3tIPYf40wCuW86mJemQO
	LAkg4VpAd3Cz/dUOG2xeKmPpZ8dpcKa8y6i7DLWLRvEa7PuzRz/Vv/uyqgMjvyGMH12C2SzQJ89
	T508aN2gAysHMmGOzUO1Q82zk1WmUpW4BbNC4M0Hly1T3cAIU0Xk46Df6zI3KPdxoD3f0YbKaf9
	2ayaq7lnVX4cDU/a7njwcUJ1mxfl+SvYXBXrujxpJvZ2iCuh5vcsIHgwKUfng3uWIkfw9ltEZqd
	hpnf1NWmVhO4VwuhI5ZMKKT5qJYhWM2ieCzbOmLLmWFYI3Cl2H1ghU21EbZeOQaspJ94NvtQsM
X-Received: by 2002:a05:6a00:12d5:b0:82a:1044:3582 with SMTP id d2e1a72fcca58-82a6ae70a27mr2457787b3a.28.1773820626922;
        Wed, 18 Mar 2026 00:57:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbe1af0sm1894539b3a.41.2026.03.18.00.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 00:57:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1e125855-53b8-44e4-a330-fc85e3afb833@roeck-us.net>
Date: Wed, 18 Mar 2026 00:57:04 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: add mpm369x driver
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, corbet@lwn.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: wyx137120466@gmail.com, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260318070115.1609-1-Yuxi.Wang@monolithicpower.com>
 <0111019cffc12220-1800bb62-f2e0-4194-99a3-7d2ba03532c6-000000@us-west-1.amazonses.com>
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
In-Reply-To: <0111019cffc12220-1800bb62-f2e0-4194-99a3-7d2ba03532c6-000000@us-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 00:02, Yuxi Wang wrote:
> Add support for mps mpm369x chip family,
> which includes mpm3695-20 and mpm3690S-15.
> 

mpm3695 is already supported by the mpq8785 driver, and mpm3690 can
and should be added to the same driver.

Any register adjustments besides the temperature register, if needed,
that can easily be added to that driver.

Thanks,
Guenter

> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> ---
>   Documentation/hwmon/index.rst   |   1 +
>   Documentation/hwmon/mpm369x.rst |  75 +++++++++++++++++++++
>   MAINTAINERS                     |   7 ++
>   drivers/hwmon/pmbus/Kconfig     |   9 +++
>   drivers/hwmon/pmbus/Makefile    |   1 +
>   drivers/hwmon/pmbus/mpm369x.c   | 115 ++++++++++++++++++++++++++++++++
>   6 files changed, 208 insertions(+)
>   create mode 100644 Documentation/hwmon/mpm369x.rst
>   create mode 100644 drivers/hwmon/pmbus/mpm369x.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index b2ca8513cfcd..340df0ccc9f1 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -190,6 +190,7 @@ Hardware Monitoring Kernel Drivers
>      mp5990
>      mp9941
>      mp9945
> +   mpm369x
>      mpq8785
>      nct6683
>      nct6775
> diff --git a/Documentation/hwmon/mpm369x.rst b/Documentation/hwmon/mpm369x.rst
> new file mode 100644
> index 000000000000..df15eb1f81c3
> --- /dev/null
> +++ b/Documentation/hwmon/mpm369x.rst
> @@ -0,0 +1,75 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mpm369x
> +====================
> +
> +Supported chips:
> +
> +  * MPS mpm3695-20
> +
> +    Prefix: 'mpm3695-20'
> +
> +  * MPS mpm3690S-15
> +
> +    Prefix: 'mpm3690S-15'
> +
> +Author:
> +
> +	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +MPM3695-20 and MPM3690S-15 Controller.
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_lcrit**
> +
> +**in2_lcrit_alarm**
> +
> +**in2_rated_max**
> +
> +**in2_rated_min**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96ea84948d76..26b2949b2dd6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17948,6 +17948,13 @@ S:	Maintained
>   F:	Documentation/hwmon/mp9945.rst
>   F:	drivers/hwmon/pmbus/mp9945.c
>   
> +MPS MPM369X DRIVER
> +M:	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/mpm369x.rst
> +F:	drivers/hwmon/pmbus/mpm369x.c
> +
>   MR800 AVERMEDIA USB FM RADIO DRIVER
>   M:	Alexey Klimov <alexey.klimov@linaro.org>
>   L:	linux-media@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index fc1273abe357..4aadecd49209 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -517,6 +517,15 @@ config SENSORS_MP9945
>   	  This driver can also be built as a module. If so, the module will
>   	  be called mp9945.
>   
> +config SENSORS_MPM369X
> +	tristate "MPS MPM369X"
> +	help
> +	  If you say yes here you get hardware monitoring support for MPS
> +	  MPM369X chip family.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mpm369x.
> +
>   config SENSORS_MPQ7932_REGULATOR
>   	bool "Regulator support for MPQ7932"
>   	depends on SENSORS_MPQ7932 && REGULATOR
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d6c86924f887..58f38f2013b0 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -52,6 +52,7 @@ obj-$(CONFIG_SENSORS_MP5926)	+= mp5926.o
>   obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
>   obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
>   obj-$(CONFIG_SENSORS_MP9945)	+= mp9945.o
> +obj-$(CONFIG_SENSORS_MPM369X)	+= mpm369x.o
>   obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
>   obj-$(CONFIG_SENSORS_MPQ8785)	+= mpq8785.o
>   obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
> diff --git a/drivers/hwmon/pmbus/mpm369x.c b/drivers/hwmon/pmbus/mpm369x.c
> new file mode 100644
> index 000000000000..3f1fe9c28ca7
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mpm369x.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * mpm369x.c  - pmbus driver for mps mpm369x
> + *
> + * Copyright 2026 Monolithic Power Systems, Inc
> + *
> + * Author: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pmbus.h>
> +#include "pmbus.h"
> +
> +#define PAGE	0x01
> +#define MPM369x_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
> +			 PMBUS_HAVE_IOUT | PMBUS_HAVE_TEMP | \
> +			 PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT | \
> +			 PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP)
> +
> +static int mpm369x_read_byte_data(struct i2c_client *client, int page,
> +				  int reg)
> +{
> +	return -ENODATA;
> +}
> +
> +static int mpm369x_read_word_data(struct i2c_client *client, int page, int phase,
> +				  int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_READ_TEMPERATURE_1:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * Because the Temperature format used by the chip is a 2-byte,
> +		 * twos complement integer and the sign bit is bits[9].
> +		 * Report that signed short integer.
> +		 */
> +		if (ret & 0x200)
> +			ret = (ret & 0x1ff) | 0xfe00;
> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info mpm369x_info = {
> +	.pages = PAGE,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +
> +	.m[PSC_VOLTAGE_IN] = 40,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = 0,
> +
> +	.m[PSC_CURRENT_OUT] = 16,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	.R[PSC_CURRENT_OUT] = 0,
> +
> +	.m[PSC_VOLTAGE_OUT] = 800,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 0,
> +
> +	.m[PSC_TEMPERATURE] = 1,
> +	.b[PSC_TEMPERATURE] = 0,
> +	.R[PSC_TEMPERATURE] = 3,
> +
> +	.read_word_data = mpm369x_read_word_data,
> +	.read_byte_data = mpm369x_read_byte_data,
> +	.func[0] = MPM369x_FUNC,
> +};
> +
> +static int mpm369x_probe(struct i2c_client *client)
> +{
> +	return pmbus_do_probe(client, &mpm369x_info);
> +}
> +
> +static const struct i2c_device_id mpm369x_id[] = {
> +	{ "MPM3695-20", 0 },
> +	{ "MPM3690S-15", 1 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, mpm369x_id);
> +
> +static const struct of_device_id mpm369x_of_match[] = {
> +	{ .compatible = "mps,mpm3695-20" },
> +	{ .compatible = "mps,mpm3690S-15" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mpm369x_of_match);
> +
> +static struct i2c_driver mpm369x_driver = {
> +	.probe = mpm369x_probe,
> +	.driver = {
> +			.name = "mpm369x",
> +			.of_match_table = mpm369x_of_match,
> +		   },
> +	.id_table = mpm369x_id,
> +};
> +
> +module_i2c_driver(mpm369x_driver);
> +MODULE_AUTHOR("Yuxi Wang <Yuxi.Wang@monolithicpower.com>");
> +MODULE_DESCRIPTION("MPS MPM369x pmbus driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");

