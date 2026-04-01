Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D33DB624
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058986; cv=none; b=DCr+Ze/1T7x3qyNH9qDa5fOJh6wTZ+/U7S+x37Q1u3rwNOw6Gs12xyt0Jyxs/r4zNPq07o0Wf8jCw3A/gdheaYGfKyera0mS73cE4FBe1CgAlSTuZDYv0sLpcfqZNhT3SG1NAEjqd6hqIOKL7ejaBhMlJCErGmWFnXPtdkeu+zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058986; c=relaxed/simple;
	bh=6nrrHXppovFSVNa6/SNOBL90VZQsL/cvQ6m4nJzAtjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=io4jYum2nRUfhm1UFW01MS9YAY9YnzQ0jwD3is8gksjAteCZQPvqNtTXa8Gvv9J0r7hVCbRdpeARRhtY68V2tSf//pFzSs/JkrTQr1kTYM1VJ4W3lLvkepjAcTWV+I7TIXxnTP55OyFXwmL7E09PtcdnPw1Q2LW3KYTAVYIR4UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ9Dl4hc; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJ9Dl4hc"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c15849aa2cso7533034eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775058984; x=1775663784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BAZhMSEaDOIkmjgeHLvshSeiFddyrMMf+jaqx7Ru3j8=;
        b=aJ9Dl4hc/hQzKk+2C25Vg5cn8NG1ZVgaI18lmsWixS/T4C4ADWiQNS0K1AArKM9p5L
         A4jnug4nt/OXA/4HehW0M5dAknaozDLizpIZI4M9hOpHcWJbq5altjQaXeuisvwr1ykr
         cFsdozn2YnkbRpa0VU93+gSOALQxDWMhHrrDoDyH5l41IKEKz/c4AlztEhiQB77+76Hj
         ajjjYalhPIddMcieLePF/L5YRvX0clRxEDuJYIiP+gC8ux5QunvDd/L6XDaqS731UG+a
         JN8p4diWKPgJzjTEFfvxSyKRnNOH1g90+L4TQAvmnc1+3kk23GvX7hmJMXNYc/VTc6lS
         mJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775058984; x=1775663784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAZhMSEaDOIkmjgeHLvshSeiFddyrMMf+jaqx7Ru3j8=;
        b=tOJvYfD4H3eHaNf4ZT2vmYXbasFKOAdGsRarH5I7Yf3UVzylFCGkMEQ8dut+ThzW7h
         oLxgy1VLtTMgj6FGhoTPg0juOduRLsdpf3OCcOJaZMzzzdhqvw9b3sUSfchuJCBmg851
         LTUAAW0PyncPvz2TsPvzsc79+Ooclr7DooTV4q3+j9q7meKczxHLICGzo5h+vYLuCk8x
         dtZv/pUjsfIj9jO6TyiUDpl/7+qKp1oQvi1RGGqVgnKRkYzwPotCkpxwoUC6I3B1ywuW
         hF5Yh5YPPFoxbxhyI3ziiaN0nH9F/tzZYIGPFPtdUqfvhIYc1eTdrw0RaAKXFPO7uA5t
         t8Sg==
X-Gm-Message-State: AOJu0YzCL00xdq3AZ714JIdcQZujK2Loo6o/IP7+n7DzwJnWBK2Mln52
	loQNL+f2+/BxrtbVM5Ueyw796Gj67WHhAF8STV+oTt6d9Uf6Lk65QGt1yooGtg==
X-Gm-Gg: ATEYQzx7RP395iMUEnUpGCFfNyWnrnUbnKyrwdZdGZyCPKH8QfyUpe/ocvZEJqNH5Ue
	Bjx//ceE0ceiaZkc8f0Po7ub7ZMF8dIBkrSCitiVCPs4mFhBNPZG+97lrYnBWUnHMh13bYXgf4g
	JcFrDrkOUwtJQaHDvRn+bpsHVy6I+0Z9cDY9wP7QZMTJqF+VxGW3Hw2OCtI5lIKotH8OduIjLLX
	Eu2h+KP7OWsHFGVMaXbfcHI5B4LaCq6z3i61Pv6MjlxeAfB9HboYPwMMiv5NKr/Q99duRra2cwk
	/4HtDK3YXGNIdkB4IFBi5DckAZ7QhC8YMsGJTahXHRTOVxPLi1yhswy2HxnYpJvisZ4WeGARXA3
	VVL0UjpOy8YxYU5kjfm56JJrYJB23iEwdI6sXB3tLS/7Su6GBiHXwtkbcqnjVhVc65X2XQGWtLT
	shfluLDai4oQDHexrFLjc+XooB+8bM8u0Z+CqmCzCaAhOqEDdHQeMYuanjaxwahQY9KMXJEYF8
X-Received: by 2002:a05:7300:a897:b0:2be:1cb2:3a6 with SMTP id 5a478bee46e88-2c9334b62d3mr2166249eec.33.1775058983720;
        Wed, 01 Apr 2026 08:56:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df5ed3sm96210eec.6.2026.04.01.08.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 08:56:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <258dd77a-a8d9-4540-a32a-91a3f13c6ed5@roeck-us.net>
Date: Wed, 1 Apr 2026 08:56:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
To: ASHISH YADAV <ashishyadav78@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
References: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
 <20260401104550.115715-3-Ashish.Yadav@infineon.com>
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
In-Reply-To: <20260401104550.115715-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/1/26 03:45, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add the pmbus driver for Infineon XDP720 Digital eFuse Controller.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
> XDP720 Digital eFuse Controller provides accurate system telemetry
> (V, I, P, T) and reports analog current at the IMON pin for post-processing.
> 
> The Current and Power measurement depends on the RIMON and GIMON values.
> Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
> https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
> 
> The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
> The value of RIMON (kohm) can be provided by the user through device tree using
> infineon,rimon-micro-ohms  property.

Please have a look at

https://sashiko.dev/#/patchset/20260401104550.115715-1-Ashish.Yadav%40infineon.com

Main concern is the power measurement range, but also please use 1000000000000ULL
as suggested.

Thanks,
Guenter

> ---
>   drivers/hwmon/pmbus/Kconfig  |   9 +++
>   drivers/hwmon/pmbus/Makefile |   1 +
>   drivers/hwmon/pmbus/xdp720.c | 123 +++++++++++++++++++++++++++++++++++
>   3 files changed, 133 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/xdp720.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index fc1273abe357..c419e3ecce90 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -702,6 +702,15 @@ config SENSORS_XDP710
>   	  This driver can also be built as a module. If so, the module will
>   	  be called xdp710.
>   
> +config SENSORS_XDP720
> +	tristate "Infineon XDP720 family"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  XDP720.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called xdp720.
> +
>   config SENSORS_XDPE152
>   	tristate "Infineon XDPE152 family"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d6c86924f887..1cac7ccae79f 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
>   obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>   obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>   obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
> +obj-$(CONFIG_SENSORS_XDP720)	+= xdp720.o
>   obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
>   obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
>   obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
> diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
> new file mode 100644
> index 000000000000..382dc3f9ce80
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdp720.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controller
> + *
> + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/of_device.h>
> +#include <linux/bitops.h>
> +#include <linux/math64.h>
> +#include "pmbus.h"
> +
> +/*
> + * The IMON resistor required to generate the system overcurrent protection.
> + * Arbitrary default Rimon value: 2k Ohm
> + */
> +#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> +#define XDP720_TELEMETRY_AVG 0xE9
> +
> +static struct pmbus_driver_info xdp720_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +
> +	.m[PSC_VOLTAGE_IN] = 4653,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = -2,
> +	.m[PSC_VOLTAGE_OUT] = 4653,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = -2,
> +	/*
> +	 * Current and Power measurement depends on the RIMON (kOhm) and
> +	 * GIMON(microA/A) values.
> +	 */
> +	.m[PSC_CURRENT_OUT] = 24668,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	.R[PSC_CURRENT_OUT] = -4,
> +	.m[PSC_POWER] = 4486,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -1,
> +	.m[PSC_TEMPERATURE] = 54,
> +	.b[PSC_TEMPERATURE] = 22521,
> +	.R[PSC_TEMPERATURE] = -1,
> +
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
> +		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_INPUT |
> +		   PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static int xdp720_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +	int ret;
> +	u32 rimon;
> +	int gimon;
> +
> +	info = devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret = i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
> +		return ret;
> +	}
> +
> +	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
> +	ret &= GENMASK(0, 0);
> +	if (ret == 1)
> +		gimon = 18200; /* output gain 18.2 microA/A */
> +	else
> +		gimon = 9100; /* output gain 9.1 microA/A */
> +
> +	if (of_property_read_u32(client->dev.of_node,
> +				 "infineon,rimon-micro-ohms", &rimon))
> +		rimon = XDP720_DEFAULT_RIMON; /* Default if not set via DT */
> +	if (rimon == 0)
> +		return -EINVAL;
> +
> +	/* Adapt the current and power scale for each instance */
> +	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
> +		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000);
> +	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
> +		info->m[PSC_POWER] * rimon * gimon, 1000000000000);
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct of_device_id xdp720_of_match[] = {
> +	{ .compatible = "infineon,xdp720" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, xdp720_of_match);
> +
> +static const struct i2c_device_id xdp720_id[] = {
> +	{ "xdp720" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, xdp720_id);
> +
> +static struct i2c_driver xdp720_driver = {
> +	.driver = {
> +		   .name = "xdp720",
> +		   .of_match_table = xdp720_of_match,
> +	},
> +	.probe = xdp720_probe,
> +	.id_table = xdp720_id,
> +};
> +
> +module_i2c_driver(xdp720_driver);
> +
> +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Controller");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");

