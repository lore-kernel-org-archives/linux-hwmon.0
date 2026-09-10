Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3633C342D
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030559; cv=none; b=uXNBg79SR4nGMd9kdnp9I297ghXnn99I3IkpNFIUD8SZFz8Z1/qumRe3g+IGtCDmYALgTYMjlhFbq1RFaHRbGENIRpjjZhpx90zwFSdpE3PEDeRJ5l3vsmn6R9osaVL8T84/rhwHz9sBDpgU8xhywfgLM62jBTO8qxOdfDOkFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030559; c=relaxed/simple;
	bh=/999yc4tH43jkknUZe8gFX1LRg3+WirU07Kp5/QxkTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZilDs+O/vdrZoYDakOpKd7BNDY+ZMMNMPqEnDXsbLqp0Y7hMydKTEukKdOhadOHwL4gPBEhKhEhyFnYRCHTsytEdmwvIxaLkL3Ol2+2ofY+e9iyf/JjmIcFZffGKNiPjsg+rjpaaeoeVuQsm4JazoR0kcyR3ejIQD8r3tQ3Gv10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTv3o06L; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTv3o06L"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so4926521a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789030556; x=1789635356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVyWLODD25OjWObZh6Oc134fmZoV/2Feak56UJf4RC4=;
        b=VTv3o06LllkP9AX1p8YMxvlf1At1c0x2bT+dGKQ9Ot4AYdEEdn7w3ajQ9Ja7UPIlZu
         lcxT65i3g4QmBKczsjG+hefqj7+KoHZz8GsBuGipVh1xFxlTrEmkkH1xlTQZV7wJf4ET
         dJTCdVtZcYy4bUjD+gl1xZrw7op4vGuGEn8pOMEnp1uzvibzva9vnpTjWWfNgiXeH4Ud
         B/ouJ+kD/IGylHZcot4xuf8rv1Zg2YipQ55+KoflnRwnVNy8SieBcUs3FuXPPZCNtv9/
         Sa6mgNlEEhx6HOC1q7LjyW+dMzIoVoPpoLDhQxV0cn3hRNlBtaYi5ecmpo7Y5sUJInYx
         IWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030556; x=1789635356;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bVyWLODD25OjWObZh6Oc134fmZoV/2Feak56UJf4RC4=;
        b=dmQZK9YqXcSkhArlqcP3AXCJWjpgG3D9FQWv8y8e12iqRehVLVep4BsBUZj48oxNpN
         YMNR5sfyVSWFxMk3sITDEo2u8ORCAhzz8jj9LdZoMwBiZ61A7PopCYHRUJpmINXyAmpu
         XqEgGz+2GfYJsujNWHbqnNGT5HewadlN8Mg1tge1XQ4PJASglwJGItC/MdZ2XRHAkoqG
         V+XpMDfYSiDSGqigtrBYJZPFE/IX2fLXQoQ4ioRTTQ6f2LlXsOP4SnwxiGDyfV0RJ2AA
         2JkcwDowLGIbtzh4Iv0iykao7n9aw9D3weSgBZc9arqgal+W3FRocPsFD5ZIgl64xptV
         44nQ==
X-Gm-Message-State: AFuF++ldTzbEADuA+HsRCArq6VxYDC8iLTEGZLV0o6RKqNTcSE1CPgmS
	NYBvXm6bRA/itd/nkzyof2CbrLn/Aoz4a7JcJknVoynScxDBxzn66T+NI/N1mk/5
X-Gm-Gg: AYBFou0Z+ksYNeE33ejjoNpaqZnJKAfy+OAZPeIWWpSFQPF7t2sJD95g5e24lv6yfZ3
	ri++8xWRfWqCC8/2cBe2xKfaEZ40fqBgjd1M7CVzFzlnfYYerBidvqaOGFY3yqWMmXHFZXSD2On
	hk+igISSf2iBLpbN/n9EK5RFcRWD3EPeUszWjR4wZBefvFDhdU9LfXsG6/ku7p/2s78eqzphGfJ
	qFgkxObsc/djDM538gm0DfDuMYqjawS9QaKPlOkvhwvxosuDMVNQ5NX6JIfMRO8di2vALfBQm1l
	4uA1KTL4s7OVdvADTsWEFL3ox8E3L1NucAbVSmiSW7N4qUflup5UjTUMWiOwFHIXL9l6AEAGy+6
	IZyzRh1QxUhBXFHJ3Cz32s3XNjk58ZoJAGMgyriCQIK/jWQtaWGMKsQSF0+GWfX7t3Ym1XKFDiD
	p9D5pfbGByb388d+v3bge1kwZRNQGAFUQ474dtM43fuVPnNmAhT+xLJcnzDTBVPkJGsXX5ellgg
	k2ekDAargeKCxgmJoNs/kjf7bmBk73CTyveW5auhi+KIdgOVxJAYYfXOX0=
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr65034887a91.11.1789030555845;
        Thu, 10 Sep 2026 01:55:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm20691469eec.8.2026.09.10.01.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:55:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <045b177a-7501-4c73-871e-5d9f78d6bcce@roeck-us.net>
Date: Thu, 10 Sep 2026 01:55:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
To: Colin Huang <colin.huang2@amd.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Colin Huang <u8813345@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
 <20260910-add-tda38740-and-tda38725-v3-2-3e87637da3d6@gmail.com>
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
In-Reply-To: <20260910-add-tda38740-and-tda38725-v3-2-3e87637da3d6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 23:18, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Add a PMBus driver for Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>   drivers/hwmon/pmbus/Kconfig    |   9 +++
>   drivers/hwmon/pmbus/Makefile   |   1 +
>   drivers/hwmon/pmbus/tda38740.c | 150 +++++++++++++++++++++++++++++++++++++++++

Documentation is missing.

>   3 files changed, 160 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index bcfdc4ce4c10..e4ca80dd0574 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -763,6 +763,15 @@ config SENSORS_TDA38640_REGULATOR
>   	  If you say yes here you get regulator support for Infineon
>   	  TDA38640 as regulator.
>   
> +config SENSORS_TDA38740
> +	tristate "Infineon TDA38725/TDA38740"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  TDA38725 and TDA38740.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called tda38740.
> +
>   config SENSORS_TPS25990
>   	tristate "TI TPS25990"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index e288fe72a437..eb06d47816fd 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_STEF48H28)	+= stef48h28.o
>   obj-$(CONFIG_SENSORS_SQ24860)	+= sq24860.o
>   obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
>   obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
> +obj-$(CONFIG_SENSORS_TDA38740)	+= tda38740.o
>   obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
>   obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>   obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
> diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda38740.c
> new file mode 100644
> index 000000000000..df5173d8da0c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon TDA38725/TDA38740
> + *
> + * Copyright (c) 2023 9elements GmbH
> + *
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include "pmbus.h"
> +
> +#define TDA38740_VOUT_SCALE_DEFAULT_MICRO	1000000
> +#define TDA38740_VOUT_SCALE_MIN_MICRO		100000
> +#define TDA38740_VOUT_SCALE_MAX_MICRO		2000000
> +
> +struct tda38740_data {
> +	struct pmbus_driver_info info;
> +	u32 vout_scale_micro;
> +};
> +
> +static int tda38740_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct tda38740_data *data;
> +	int ret;
> +	u64 scaled;
> +
> +	if (reg != PMBUS_READ_VOUT)
> +		return -ENODATA;
> +
> +	ret = pmbus_read_word_data(client, page, phase, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	data = container_of(pmbus_get_driver_info(client), struct tda38740_data,
> +			    info);
> +
> +	scaled = (u64)ret * data->vout_scale_micro;
> +	scaled = DIV_ROUND_CLOSEST_ULL(scaled,
> +				       TDA38740_VOUT_SCALE_DEFAULT_MICRO);
> +

The chip supports VOUT_SCALE_LOOP, which should be used for any VOUT scaling.
VOUT values should not be manipulated manually.

Also, Sashiko is correct in complaining about not scaling other VOUT
related commands, both on the read and write side. The chip _does_ support
limit commands.

> +	return clamp_val(scaled, 0, U16_MAX);
> +}
> +
> +/*
> + * TDA38725/TDA38740 only support Linear format for VOUT related commands,
> + * with exponents in the range of -8 to -12 (see datasheet VOUT_MODE
> + * description). Direct format is not supported by this device.
> + */
> +static int tda38740_identify(struct i2c_client *client,
> +			     struct pmbus_driver_info *info)
> +{
> +	int vout_mode;
> +
> +	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> +	if (vout_mode < 0 || vout_mode == 0xff)
> +		return vout_mode < 0 ? vout_mode : -ENODEV;
> +
> +	if ((vout_mode >> 5) != 0)
> +		return -ENODEV;
> +
> +	info->format[PSC_VOLTAGE_OUT] = linear;
> +
> +	return 0;
> +}
> +
> +static struct pmbus_driver_info tda38740_info = {
> +	.pages = 1,

The chips support the PAGE command, described as "Allows access
of each loop via paging". I don't know what exactly that refers to,
but it does look like it supports multiple pages.
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_POWER] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +	    | PMBUS_HAVE_IIN
> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> +	.identify = tda38740_identify,
> +};
> +
> +static int tda38740_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct tda38740_data *data;
> +	const char *propname;
> +	u32 vout_scale_micro;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	propname = "infineon,vout-scale-micro";
> +	if (device_property_present(dev, propname)) {
> +		ret = device_property_read_u32(dev, propname, &vout_scale_micro);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "%s property read fail.\n",
> +					     propname);
> +	} else {
> +		vout_scale_micro = TDA38740_VOUT_SCALE_DEFAULT_MICRO;
> +	}
> +
> +	if (vout_scale_micro < TDA38740_VOUT_SCALE_MIN_MICRO ||
> +	    vout_scale_micro > TDA38740_VOUT_SCALE_MAX_MICRO)
> +		return -EINVAL;
> +
> +	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
> +	data->vout_scale_micro = vout_scale_micro;
> +	data->info.read_word_data = tda38740_read_word_data;
> +
> +	return pmbus_do_probe(client, &data->info);
> +}
> +
> +static const struct i2c_device_id tda38740_id[] = {
> +	{ .name = "tda38725"},
> +	{ .name = "tda38740"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tda38740_id);
> +
> +static const struct of_device_id __maybe_unused tda38740_of_match[] = {
> +	{ .compatible = "infineon,tda38725"},
> +	{ .compatible = "infineon,tda38740"},
> +	{ },

No "," here.

> +};
> +MODULE_DEVICE_TABLE(of, tda38740_of_match);
> +
> +/* This is the driver that will be inserted */

Pointless comment.

> +static struct i2c_driver tda38740_driver = {
> +	.driver = {
> +		.name = "tda38740",
> +		.of_match_table = of_match_ptr(tda38740_of_match),
> +	},
> +	.probe = tda38740_probe,
> +	.id_table = tda38740_id,
> +};
> +
> +module_i2c_driver(tda38740_driver);
> +
> +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
> 

