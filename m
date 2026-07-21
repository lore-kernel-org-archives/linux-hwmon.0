Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F70F3B3C0A
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 20:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784666701; cv=none; b=CZnqW7ehgnwQ5gkO7UCS8jLJnHPWf+D/i1w+vEzu6NEm0CaeQkk8Rht/XzbAbR92tEdrhj7vspveD4ahdJ+RdC8XIvqqtsp7s+KIXuTZabhy24KEDl3vkFPWG6M6TemiqN+oCUCpx8yh0sgu4svI34VR8kTSIhO47ydUFKMRb74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784666701; c=relaxed/simple;
	bh=9hBEVMu+4vjSPCQ63MZDc4V+BjsYwzKmMVjpYrfLZPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAeeFKHyCV5D6NVIfstWMQL6al7xV7M3eOu755yBnHmTYYvJp7WZmGkTXl706/JEZmWJu7x2i3wfNu2rotvgHn7Zm+kx9ASJzpVJdivPyeO33nYYrB3HLN54DT9iUfkW4k7EDKB5RrTXao0UFr0axghF14KMsYR7fI6MI++W0Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoctWmay; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoctWmay"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caea3f742bso141009065ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 13:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784666696; x=1785271496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qadhLx69r/1Oa6eC1mHfvbmGtt+p/LF5qkD9g/Ya1sI=;
        b=SoctWmaySwvZbsSe8XVyKobM7BOrBwErRchzuTQNhnw2t6/ocC0OkleExcJ0x7W9ef
         HjCEfF/ktK1YTxn5G+WD84pQhBuM1R7yGBvxoLRV9FD1bbhzySkDl71cc2W+i7pyij/J
         +YPIo6YJ2/JkxiaxVTaXvISRG0VunQotv+d+bNN2moaKAUYQ7NWHhlz89nBCQb58st6A
         vYmSBvpS3A+zOIQGJyKKL7Jl1AG3ly1+5dK/PufA7aaXGopIE6ec5qUo7tPbNehmP93O
         G2IaDvSPVInx4FeV4Ot8ayZ3OrhhjKh43JRKaVCBBfgWCXmfqX3WRN6HYeQmDpQH1LaF
         /PWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784666696; x=1785271496;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qadhLx69r/1Oa6eC1mHfvbmGtt+p/LF5qkD9g/Ya1sI=;
        b=k69mcdvW0RaA7w7w68Wjv1djcfu8T9zfpGUBcYYXUWMy1lXIVAEnchJ6lWVxUgqLlD
         r7CvcFujUYMcg8Ia5o2RwNrNBcgKJ5e4kuhcOyGAjJSsvavS75ja870qL0eJgJnvF9F1
         bsoe1RvG9yhJ4L/KYtgSQdiT/lyWxKM0zCeVaJRtY+fsqjajy5hT3WBmTQ+gwojh5MIL
         OVX6EEbOuXv3Wadafn5zObE471SWoVnvaSqHAuYH4PVVmOrtgAffq4EXlrdhA5MFXMwZ
         yxmcN+exZaBiKf2Nf51gUzFncTK+x54BoPFE4EdnZrL/HnVLDHX1TlrUzrmBYN5HMQx/
         l3+g==
X-Gm-Message-State: AOJu0YyYnveC00kP53G3MbNljJ17GW0jDcQYj56SVdqC8L38qD9auewB
	Ga/NFPkmBss7GeGSKKKkz/7RDZJpybpGbBEQblbMM3wV3iGpAVOuBvpb
X-Gm-Gg: AR+sD10BGwqNUtQlyjxgy0/NLot3y4MlDKbaPMK7OIC5R5v8d1bfHHFCRbTJgJosXDg
	yS3MnIjznvGb66qopBTsjfGcTCY8jIlSCbrSxmk8zh5ix30j7CJwTtcwyEK5sludXCPp2asu5cL
	nHhlL3gvJLUM08szx/k6EVH2SO+bRpih5KqgzCmrfRjIRSowKWOvNjCgfw4qoPgmwa1oX+w+Us9
	vz2gujFvAebJz5/61+IpXodrMxJQS8MW+dG2rEuv1ngS3N3EHUiFLctWW3fPHMeNpOm3CuK60vM
	sgVmrX+cyytlyBfcpeKdBQkdJmxCCXzD9BDkU0vKlQ0rsKnZbaxk2JOcd7Fwgf/Y5JwXuL/9AaE
	KBNVRtFwshlB0x8WyuwIdZeFOPM9LorcXnMYlfpPya+Ki+ewvYflfiwh3X+XZKY5Fs319Sppfh8
	qgoc59yNjOyxAHv+gDXSykejohj2ob9dLHVrpLtbBr00YLYdXXA5w=
X-Received: by 2002:a17:903:2cf:b0:2ce:88d7:a233 with SMTP id d9443c01a7336-2cf34a47d84mr224923765ad.33.1784666696282;
        Tue, 21 Jul 2026 13:44:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd849asm2895975ad.28.2026.07.21.13.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 13:44:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
Date: Tue, 21 Jul 2026 13:44:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
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
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 11:30, Manaf Meethalavalappu Pallikunhi wrote:
> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
> hardware monitor. The driver exposes battery voltage and current
> monitoring through hwmon interface.
> 
> The BCL driver provides
> - Real-time voltage and current readings
> - Configurable threshold-based alarms
> - Interrupt-driven notifications when thresholds are exceeded
> - Automatic threshold management with polling-based recovery
> - Hardware-specific scaling factors and threshold representations
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>   MAINTAINERS                    |    1 +
>   drivers/hwmon/Kconfig          |   11 +
>   drivers/hwmon/Makefile         |    1 +
>   drivers/hwmon/qcom-bcl-hwmon.c | 1443 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 1456 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1b178d3a91ad..8b7d3c3c6252 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22182,6 +22182,7 @@ L:	linux-hwmon@vger.kernel.org
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
> +F:	drivers/hwmon/qcom-bcl-hwmon.c
>   
>   QUALCOMM BLUETOOTH DRIVER
>   M:	Bartosz Golaszewski <brgl@kernel.org>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 50d744db3045..8618c88932c3 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1955,6 +1955,17 @@ config SENSORS_PWM_FAN
>   	  This driver can also be built as a module. If so, the module
>   	  will be called pwm-fan.
>   
> +config SENSORS_QCOM_SPMI_BCL
> +	tristate "Qualcomm SPMI BCL hardware monitoring"
> +	depends on SPMI
> +	select REGMAP_SPMI
> +	help
> +	  Say yes here to enable support for Qualcomm battery over current
> +	  and under voltage alarms monitor.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called qcom-bcl-hwmon.
> +
>   config SENSORS_QNAP_MCU_HWMON
>   	tristate "QNAP MCU hardware monitoring"
>   	depends on MFD_QNAP_MCU
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 63809eeec2f4..cb61983d437c 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -204,6 +204,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>   obj-$(CONFIG_SENSORS_PROM21_XHCI)	+= prom21-xhci.o
>   obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
>   obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
> +obj-$(CONFIG_SENSORS_QCOM_SPMI_BCL)	+= qcom-bcl-hwmon.o
>   obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>   obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmon.c
> new file mode 100644
> index 000000000000..a21433b45482
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
> @@ -0,0 +1,1443 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Qualcomm pmic BCL driver for battery overcurrent and
> + * battery or system under voltage monitor
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/workqueue.h>
> +
> +/* BCL common regmap offset */
> +#define REVISION1			0x0
> +#define REVISION2			0x1
> +#define STATUS				0x8
> +#define INT_RT_STS			0x10
> +#define EN_CTL1				0x46
> +
> +/* BCL GEN1 regmap offsets */
> +#define MODE_CTL1			0x41
> +#define VADC_L0_THR			0x48
> +#define VCMP_L1_THR			0x49
> +#define IADC_H0_THR			0x4b
> +#define IADC_H1_THR			0x4c
> +#define VADC_CONV_REQ			0x72
> +#define IADC_CONV_REQ			0x82
> +#define VADC_DATA1			0x76
> +#define IADC_DATA1			0x86
> +
> +/* BCL GEN3 regmap offsets */
> +#define VCMP_CTL			0x44
> +#define VCMP_L0_THR			0x47
> +#define PARAM_1				0x0e
> +#define IADC_H1_THR_GEN3		0x4d
> +
> +#define BCL_IN_INC_MV			25
> +#define BCL_ALARM_POLLING_MS		50
> +
> +/**
> + * enum bcl_limit_alarm - BCL alarm threshold levels
> + * @BCL_LIMIT_ALARM_LVL0: Level 0 alarm threshold
> + * @BCL_LIMIT_ALARM_LVL1: Level 1 alarm threshold
> + * @BCL_LIMIT_ALARM_MAX: sentinel value
> + *
> + * Defines the two threshold levels for BCL monitoring. Each level corresponds
> + * to different severity of in or curr conditions.
> + */
> +enum bcl_limit_alarm {
> +	BCL_LIMIT_ALARM_LVL0,
> +	BCL_LIMIT_ALARM_LVL1,
> +
> +	BCL_LIMIT_ALARM_MAX,
> +};
> +
> +/**
> + * enum bcl_channel - BCL supported sensor channel type
> + * @CHANNEL_IN: in (voltage) channel
> + * @CHANNEL_CURR: curr (current) channel
> + * @CHANNEL_MAX: sentinel value
> + *
> + * Defines the supported channel types for bcl.
> + */
> +enum bcl_channel {
> +	CHANNEL_IN,
> +	CHANNEL_CURR,
> +
> +	CHANNEL_MAX,
> +};
> +
> +/**
> + * enum bcl_thresh_type - voltage or current threshold representation type
> + * @THRESH_TYPE_ADC: Raw ADC value representation
> + * @THRESH_TYPE_INDEX: Index-based voltage or current representation
> + *
> + * Specifies how voltage or current thresholds are stored and interpreted in
> + * registers. Some PMICs use raw ADC values while others use indexed values.
> + */
> +enum bcl_thresh_type {
> +	THRESH_TYPE_ADC,
> +	THRESH_TYPE_INDEX,
> +};
> +
> +/**
> + * enum bcl_battery_config - Battery configuration types
> + * @BCL_BATT_1S: Single cell battery
> + * @BCL_BATT_2S: Two cells in series
> + * @BCL_BATT_3S: Three cells in series
> + * @BCL_BATT_UNKNOWN: Unknown or not applicable
> + */
> +enum bcl_battery_config {
> +	BCL_BATT_1S,
> +	BCL_BATT_2S,
> +	BCL_BATT_3S,
> +	BCL_BATT_UNKNOWN,
> +};
> +
> +/**
> + * enum bcl_fields - BCL register field identifiers
> + * @F_V_MAJOR: Major revision info field
> + * @F_V_MINOR: Minor revision info field
> + * @F_CTL_EN: Monitor enable control field
> + * @F_LVL0_ALARM: Level 0 alarm status field
> + * @F_LVL1_ALARM: Level 1 alarm status field
> + * @F_IN_MON_EN: voltage monitor enable control field
> + * @F_IN_L0_THR: voltage level 0 threshold field
> + * @F_IN_L1_THR: voltage level 1 threshold field
> + * @F_IN_INPUT_EN: voltage input enable control field
> + * @F_IN_INPUT: voltage input data field (LSB for 16-bit data)
> + * @F_IN_INPUT1: voltage input data MSB for 16-bit voltage data
> + * @F_CURR_MON_EN: current monitor enable control field
> + * @F_CURR_H0_THR: current level 0 threshold field
> + * @F_CURR_H1_THR: current level 1 threshold field
> + * @F_CURR_INPUT: current input data field (LSB for 16-bit data)
> + * @F_CURR_INPUT1: current input data MSB for 16-bit current data
> + * @F_MAX_FIELDS: sentinel value
> + *
> + * Enumeration of all register fields used by the BCL driver for accessing
> + * registers through regmap fields.
> + */
> +enum bcl_fields {
> +	/* Common fields - present in all BCL variants */
> +	F_V_MAJOR,
> +	F_V_MINOR,
> +	F_CTL_EN,
> +	F_LVL0_ALARM,
> +	F_LVL1_ALARM,
> +
> +	/* Voltage monitoring fields */
> +	F_IN_MON_EN,
> +	F_IN_L0_THR,
> +	F_IN_L1_THR,
> +	F_IN_INPUT_EN,
> +	F_IN_INPUT,
> +	F_IN_INPUT1,	/* MSB for 16-bit voltage data */
> +
> +	/* Current monitoring fields */
> +	F_CURR_MON_EN,
> +	F_CURR_H0_THR,
> +	F_CURR_H1_THR,
> +	F_CURR_INPUT,
> +	F_CURR_INPUT1,	/* MSB for 16-bit current data */
> +
> +	F_MAX_FIELDS
> +};
> +
> +/**
> + * struct bcl_channel_cfg - BCL channel related configuration
> + * @default_scale_nu:  Default scaling factor in nano unit
> + * @base: Base threshold value in milli unit
> + * @max: Maximum threshold value in milli unit
> + * @step: step increment value between two indexed threshold value
> + * @thresh_type: Array specifying threshold representation type for each alarm level
> + *
> + * Contains hardware-specific configuration and scaling parameters for different
> + * channel(voltage and current)..
> + */
> +struct bcl_channel_cfg {
> +	u32 default_scale_nu;
> +	u32 base;
> +	u32 max;
> +	u32 step;
> +	u8 thresh_type[BCL_LIMIT_ALARM_MAX];
> +};
> +
> +/**
> + * struct bcl_desc - BCL device descriptor
> + * @reg_fields: Array of register field definitions for this device variant
> + * @channel_cfg: Array of channel configurations indexed by battery config
> + *               PMICs without battery detection: only [BCL_BATT_1S] is defined
> + *               PMICs with battery detection: [BCL_BATT_2S], [BCL_BATT_3S]
> + * @battery_config_field: Register field for battery configuration detection
> + *                        NOTE: This is an ABSOLUTE address, not relative to BCL base
> + *                        Set to REG_FIELD(0, 0, 0) if not used
> + * @num_reg_fields: Number of register field definitions for this device variant
> + * @data_field_bits_size: data read register bit size
> + * @thresh_field_bits_size: lsb bit size those are not included in threshold register
> + *
> + * Contains hardware-specific configuration and scaling parameters for different
> + * BCL variants. Each PMIC model may have different register layouts and
> + * conversion factors.
> + */
> +struct bcl_desc {
> +	const struct reg_field *reg_fields;
> +	struct bcl_channel_cfg channel_cfg[BCL_BATT_3S + 1][CHANNEL_MAX];
> +	const struct reg_field battery_config_field;
> +	u8 num_reg_fields;
> +	u8 data_field_bits_size;
> +	u8 thresh_field_bits_size;
> +};
> +
> +/**
> + * struct bcl_alarm_data - BCL alarm interrupt data
> + * @irq: IRQ number assigned to this alarm
> + * @irq_enabled: Flag indicating if IRQ is enabled
> + * @irq_wake_enabled: Flag indicating if IRQ wake is enabled
> + * @shutting_down: Flag preventing work from re-enabling IRQ during teardown
> + * @type: Alarm level type (LVL0, or LVL1)
> + * @device: Pointer to parent BCL device structure
> + * @a_lock: Mutex for protecting alarm state
> + * @alarm_poll_work: delayed_work to poll alarm status
> + *
> + * Stores interrupt-related information for each alarm threshold level.
> + * Used by the IRQ handler to identify which alarm triggered.
> + */
> +struct bcl_alarm_data {
> +	int			irq;
> +	bool			irq_enabled;
> +	bool			irq_wake_enabled;
> +	bool			shutting_down;
> +	enum bcl_limit_alarm	type;
> +	void			*device;
> +	/* Protects alarm IRQ enable/disable state */
> +	struct mutex		a_lock;
> +	struct delayed_work	alarm_poll_work;
> +};
> +
> +/**
> + * struct bcl_device - Main BCL device structure
> + * @dev: Pointer to device structure
> + * @regmap: Regmap for accessing PMIC registers
> + * @fields: Array of regmap fields for register access
> + * @bcl_alarms: Array of alarm data structures for each threshold level
> + * @lock: Mutex for protecting concurrent hardware access
> + * @base: the BCL regbase offset from regmap
> + * @last_in_input: Last valid voltage input reading in millivolts
> + * @last_curr_input: Last valid current input reading in milliamps
> + * @last_in_updated: Timestamp of last voltage input update
> + * @last_curr_updated: Timestamp of last current input update
> + * @desc: Pointer to device descriptor with hardware-specific parameters
> + * @hwmon_dev: Pointer to registered hwmon device
> + * @hwmon_info: Dynamically built hwmon channel info array
> + * @hwmon_chip_info: Dynamically built hwmon chip info structure
> + * @hwmon_name: Sanitized name for hwmon device
> + * @batt_config: Detected battery configuration (only for SMB2360/2370)
> + * @batt_config_regfield: Regmap field for battery configuration register
> + * @in_attrs: Voltage channel attributes mask
> + * @curr_attrs: Current channel attributes mask
> + *
> + * Main driver structure containing all state and configuration for a BCL
> + * monitoring instance. Manages voltage and current monitoring, thresholds,
> + * and alarm handling.
> + */
> +struct bcl_device {
> +	struct device		*dev;
> +	struct regmap		*regmap;
> +	u16			base;
> +	struct regmap_field	*fields[F_MAX_FIELDS];
> +	struct bcl_alarm_data	bcl_alarms[BCL_LIMIT_ALARM_MAX];
> +	/* Protects hardware register access and device state */
> +	struct mutex		lock;
> +	u32			last_in_input;
> +	s32			last_curr_input;
> +	unsigned long		last_in_updated;
> +	unsigned long		last_curr_updated;
> +	const struct bcl_desc	*desc;
> +	struct device		*hwmon_dev;
> +	const struct hwmon_channel_info **hwmon_info;
> +	struct hwmon_chip_info	hwmon_chip_info;
> +	char			*hwmon_name;
> +	enum bcl_battery_config	batt_config;
> +	struct regmap_field	*batt_config_regfield;
> +	u32			in_attrs;
> +	u32			curr_attrs;
> +};
> +
> +static const u8 in_attr_to_lvl_map[] = {
> +	[hwmon_in_min] = BCL_LIMIT_ALARM_LVL0,
> +	[hwmon_in_lcrit] = BCL_LIMIT_ALARM_LVL1,
> +	[hwmon_in_min_alarm] = BCL_LIMIT_ALARM_LVL0,
> +	[hwmon_in_lcrit_alarm] = BCL_LIMIT_ALARM_LVL1,
> +};
> +
> +static const u8 in_lvl_to_attr_map[BCL_LIMIT_ALARM_MAX] = {
> +	[BCL_LIMIT_ALARM_LVL0] = hwmon_in_min_alarm,
> +	[BCL_LIMIT_ALARM_LVL1] = hwmon_in_lcrit_alarm,
> +};
> +
> +static const u8 curr_attr_to_lvl_map[] = {
> +	[hwmon_curr_max] = BCL_LIMIT_ALARM_LVL0,
> +	[hwmon_curr_crit] = BCL_LIMIT_ALARM_LVL1,
> +	[hwmon_curr_max_alarm] = BCL_LIMIT_ALARM_LVL0,
> +	[hwmon_curr_crit_alarm] = BCL_LIMIT_ALARM_LVL1,
> +};
> +
> +static const u8 curr_lvl_to_attr_map[BCL_LIMIT_ALARM_MAX] = {
> +	[BCL_LIMIT_ALARM_LVL0] = hwmon_curr_max_alarm,
> +	[BCL_LIMIT_ALARM_LVL1] = hwmon_curr_crit_alarm,
> +};
> +
> +/* Interrupt names for each alarm level */
> +static const char * const bcl_int_names[BCL_LIMIT_ALARM_MAX] = {
> +	[BCL_LIMIT_ALARM_LVL0] = "max-min",
> +	[BCL_LIMIT_ALARM_LVL1] = "critical",
> +};
> +
> +static const struct reg_field bcl_pm7250b_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_IN_MON_EN]	= REG_FIELD(MODE_CTL1, 0, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_INPUT_EN]	= REG_FIELD(VADC_CONV_REQ, 0, 0),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_MON_EN]	= REG_FIELD(IADC_CONV_REQ, 0, 0),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_pm8350c_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 1),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_INPUT_EN]	= REG_FIELD(VADC_CONV_REQ, 0, 0),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_MON_EN]	= REG_FIELD(IADC_CONV_REQ, 0, 0),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_pm8550_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VCMP_L0_THR, 0, 5),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
> +};
> +
> +static const struct reg_field bcl_pmh0101_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VCMP_L0_THR, 0, 6),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 6),
> +	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_IN_INPUT1]	= REG_FIELD(VADC_DATA1 + 1, 0, 7),
> +	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
> +};
> +
> +static const struct reg_field bcl_pmih0108_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_IN_INPUT1]	= REG_FIELD(VADC_DATA1 + 1, 0, 7),
> +	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +	[F_CURR_INPUT1]	= REG_FIELD(IADC_DATA1 + 1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_smb2360_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_smb2370_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_IN_INPUT1]	= REG_FIELD(VADC_DATA1 + 1, 0, 7),
> +	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +	[F_CURR_INPUT1]	= REG_FIELD(IADC_DATA1 + 1, 0, 7),
> +};
> +
> +static const struct bcl_desc pm7250b_data = {
> +	.reg_fields = bcl_pm7250b_reg_fields,
> +	.num_reg_fields = F_CURR_INPUT + 1,
> +	.data_field_bits_size = 8,
> +	.thresh_field_bits_size = 7,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base = 2250,
> +		.max = 3600,
> +		.step = 25,
> +		.default_scale_nu = 194637,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_CURR] = {
> +		.max = 10000,
> +		.default_scale_nu = 305180,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +static const struct bcl_desc pm8350c_data = {
> +	.reg_fields = bcl_pm8350c_reg_fields,
> +	.num_reg_fields = F_CURR_INPUT + 1,
> +	.data_field_bits_size = 8,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base = 2250,
> +		.max = 3600,
> +		.step = 25,
> +		.default_scale_nu = 194637,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_CURR] = {
> +		.max = 10000,
> +		.default_scale_nu = 305180,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +static const struct bcl_desc pm8550_data = {
> +	.reg_fields = bcl_pm8550_reg_fields,
> +	.num_reg_fields = F_CURR_MON_EN + 1,
> +	.data_field_bits_size = 0,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base = 2250,
> +		.max = 3600,
> +		.step = 25,
> +		.thresh_type = {THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +};
> +
> +static const struct bcl_desc pmih0108_data = {
> +	.reg_fields = bcl_pmih0108_reg_fields,
> +	.num_reg_fields = F_MAX_FIELDS,
> +	.data_field_bits_size = 16,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base = 2250,
> +		.max = 3600,
> +		.step = 25,
> +		.default_scale_nu = 194637,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_CURR] = {
> +		.max = 20000,
> +		.default_scale_nu = 610370,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +static const struct bcl_desc pmh0101_data = {
> +	.reg_fields = bcl_pmh0101_reg_fields,
> +	.num_reg_fields = F_CURR_MON_EN + 1,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base = 1500,
> +		.max = 4000,
> +		.step = 25,
> +		.thresh_type = {THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +};
> +
> +/* Register 0x2a50 mapping: 0 -> 2S, 1 -> 3S */
> +static const struct bcl_desc smb2360_data = {
> +	.reg_fields = bcl_smb2360_reg_fields,
> +	.num_reg_fields = F_CURR_INPUT + 1,
> +	.data_field_bits_size = 8,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0x2a50, 0, 1),
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_IN] = {
> +		.base = 4500,
> +		.max = 8400,
> +		.step = 50,
> +		.default_scale_nu = 432918,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_CURR] = {
> +		.max = 20000,
> +		.default_scale_nu = 540679,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +	.channel_cfg[BCL_BATT_3S][CHANNEL_IN] = {
> +		.base = 6750,
> +		.max = 12600,
> +		.step = 75,
> +		.default_scale_nu = 648790,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_3S][CHANNEL_CURR] = {
> +		.max = 20000,
> +		.default_scale_nu = 540679,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +static const struct bcl_desc smb2370_data = {
> +	.reg_fields = bcl_smb2370_reg_fields,
> +	.num_reg_fields = F_MAX_FIELDS,
> +	.data_field_bits_size = 16,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0x2a50, 0, 1),
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_IN] = {
> +		.base = 4500,
> +		.max = 8400,
> +		.step = 50,
> +		.default_scale_nu = 432918,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_CURR] = {
> +		.max = 20000,
> +		.default_scale_nu = 1441603,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +	.channel_cfg[BCL_BATT_3S][CHANNEL_IN] = {
> +		.base = 6750,
> +		.max = 12600,
> +		.step = 75,
> +		.default_scale_nu = 648790,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_3S][CHANNEL_CURR] = {
> +		.max = 20000,
> +		.default_scale_nu = 1441603,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +/**
> + * bcl_convert_raw_to_milliunit - Convert raw value to milli unit
> + * @bcl: BCL device structure
> + * @raw_val: Raw ADC value from hardware (signed for current, unsigned for voltage)
> + * @type: type of the channel, in or curr
> + * @field_width: bits size for data or threshold field
> + *
> + * Return: value in milli unit
> + */
> +static int bcl_convert_raw_to_milliunit(const struct bcl_device *bcl,
> +					s32 raw_val,
> +					enum bcl_channel type,
> +					u8 field_width)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	u32 def_scale = desc->channel_cfg[bcl->batt_config][type].default_scale_nu;
> +	u32 scaling_factor = (field_width > 8) ? def_scale : (def_scale << field_width);
> +
> +	return DIV_ROUND_CLOSEST((s64)raw_val * scaling_factor, 1000000);
> +}
> +
> +/**
> + * bcl_convert_milliunit_to_raw - Convert milli unit to raw value
> + * @bcl: BCL device structure
> + * @mval: threshold value in milli unit
> + * @type: type of the channel, in or curr
> + * @field_width: bits size for data or threshold field
> + *
> + * Return: Raw ADC value for hardware
> + */
> +static unsigned int bcl_convert_milliunit_to_raw(const struct bcl_device *bcl,
> +						 int mval,
> +						 enum bcl_channel type,
> +						 u8 field_width)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	u32 def_scale = desc->channel_cfg[bcl->batt_config][type].default_scale_nu;
> +	u32 scaling_factor = (field_width > 8) ? def_scale : (def_scale << field_width);
> +
> +	return DIV_ROUND_CLOSEST_ULL((u64)mval * 1000000, scaling_factor);
> +}
> +
> +/**
> + * bcl_convert_milliunit_to_index - Convert milliunit to in or curr index
> + * @bcl: BCL device structure
> + * @val: in or curr value in milli unit
> + * @type: type of the channel, in or curr
> + *
> + * Converts a value in milli unit to an index for BCL that use indexed thresholds.
> + *
> + * Return: Index value
> + */
> +static unsigned int bcl_convert_milliunit_to_index(const struct bcl_device *bcl,
> +						   int val,
> +						   enum bcl_channel type)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	const struct bcl_channel_cfg *cfg = &desc->channel_cfg[bcl->batt_config][type];
> +	u64 diff = (u64)val - cfg->base;
> +
> +	return DIV_ROUND_CLOSEST_ULL(diff, cfg->step);
> +}
> +
> +/**
> + * bcl_convert_index_to_milliunit - Convert in or curr index to milli unit
> + * @bcl: BCL device structure
> + * @val: index value
> + * @type: type of the channel, in or curr
> + *
> + * Converts an index value to milli unit for BCL that use indexed thresholds.
> + *
> + * Return: Value in millivolts or milliamps
> + */
> +static unsigned int bcl_convert_index_to_milliunit(const struct bcl_device *bcl,
> +						   int val,
> +						   enum bcl_channel type)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	const struct bcl_channel_cfg *cfg = &desc->channel_cfg[bcl->batt_config][type];
> +
> +	return cfg->base + val * cfg->step;
> +}
> +
> +static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	u32 raw_val;
> +
> +	int thresh = clamp_val(value, desc->channel_cfg[bcl->batt_config][CHANNEL_IN].base,
> +			       desc->channel_cfg[bcl->batt_config][CHANNEL_IN].max);
> +
> +	if (desc->channel_cfg[bcl->batt_config][CHANNEL_IN].thresh_type[lvl] == THRESH_TYPE_ADC)
> +		raw_val = bcl_convert_milliunit_to_raw(bcl, thresh, CHANNEL_IN,
> +						       desc->thresh_field_bits_size);
> +	else
> +		raw_val = bcl_convert_milliunit_to_index(bcl, thresh, CHANNEL_IN);
> +
> +	return regmap_field_write(bcl->fields[F_IN_L0_THR + lvl], raw_val);
> +}
> +
> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	u32 raw_val;
> +
> +	int thresh = clamp_val(value, 0, desc->channel_cfg[bcl->batt_config][CHANNEL_CURR].max);
> +
> +	if (desc->channel_cfg[bcl->batt_config][CHANNEL_CURR].thresh_type[lvl] == THRESH_TYPE_ADC)
> +		raw_val = bcl_convert_milliunit_to_raw(bcl, thresh, CHANNEL_CURR,
> +						       desc->thresh_field_bits_size);
> +	else
> +		raw_val = bcl_convert_milliunit_to_index(bcl, thresh, CHANNEL_CURR);
> +
> +	return regmap_field_write(bcl->fields[F_CURR_H0_THR + lvl], raw_val);
> +}
> +
> +static int bcl_in_thresh_read(struct bcl_device *bcl, enum bcl_limit_alarm lvl, long *out)
> +{
> +	int ret, thresh;
> +	u32 raw_val = 0;
> +	const struct bcl_desc *desc = bcl->desc;
> +
> +	ret = regmap_field_read(bcl->fields[F_IN_L0_THR + lvl], &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	if (desc->channel_cfg[bcl->batt_config][CHANNEL_IN].thresh_type[lvl] == THRESH_TYPE_ADC)
> +		thresh = bcl_convert_raw_to_milliunit(bcl, raw_val, CHANNEL_IN,
> +						      desc->thresh_field_bits_size);
> +	else
> +		thresh = bcl_convert_index_to_milliunit(bcl, raw_val, CHANNEL_IN);
> +
> +	*out = thresh;
> +
> +	return 0;
> +}
> +
> +static int bcl_curr_thresh_read(struct bcl_device *bcl, enum bcl_limit_alarm lvl, long *out)
> +{
> +	int ret, thresh;
> +	u32 raw_val = 0;
> +	const struct bcl_desc *desc = bcl->desc;
> +
> +	ret = regmap_field_read(bcl->fields[F_CURR_H0_THR + lvl], &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	if (desc->channel_cfg[bcl->batt_config][CHANNEL_CURR].thresh_type[lvl] == THRESH_TYPE_ADC)
> +		thresh = bcl_convert_raw_to_milliunit(bcl, raw_val, CHANNEL_CURR,
> +						      desc->thresh_field_bits_size);
> +	else
> +		thresh = bcl_convert_index_to_milliunit(bcl, raw_val, CHANNEL_CURR);
> +
> +	*out = thresh;
> +
> +	return 0;
> +}
> +
> +static int bcl_curr_input_read(struct bcl_device *bcl, long *out)
> +{
> +	int ret;
> +	u32 raw_val = 0, msb = 0;
> +	s32 signed_val;
> +	const struct bcl_desc *desc = bcl->desc;
> +
> +	/* Return cached value if read too soon after last update */
> +	if (time_before(jiffies, bcl->last_curr_updated + HZ)) {
> +		*out = bcl->last_curr_input;
> +		return 0;
> +	}
> +
> +	ret = regmap_field_read(bcl->fields[F_CURR_INPUT], &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	/* For 16-bit data, read MSB and combine with LSB */
> +	if (desc->data_field_bits_size == 16) {
> +		ret = regmap_field_read(bcl->fields[F_CURR_INPUT1], &msb);
> +		if (ret)
> +			return ret;
> +		raw_val |= FIELD_PREP(GENMASK(15, 8), msb);
> +	}
> +
> +	/*
> +	 * Current ADC reading is in 2's complement form.
> +	 * Sign extend the value based on data field bit size.
> +	 */
> +	signed_val = sign_extend32(raw_val, desc->data_field_bits_size - 1);
> +
> +	bcl->last_curr_input =
> +		bcl_convert_raw_to_milliunit(bcl, signed_val, CHANNEL_CURR,
> +					     desc->data_field_bits_size);
> +	bcl->last_curr_updated = jiffies;
> +
> +	*out = bcl->last_curr_input;
> +
> +	return 0;
> +}
> +
> +static int bcl_in_input_read(struct bcl_device *bcl, long *out)
> +{
> +	int ret;
> +	u32 raw_val = 0, msb = 0;
> +	const struct bcl_desc *desc = bcl->desc;
> +
> +	/* Return cached value if read too soon after last update */
> +	if (time_before(jiffies, bcl->last_in_updated + HZ)) {
> +		*out = bcl->last_in_input;
> +		return 0;
> +	}
> +
> +	ret = regmap_field_read(bcl->fields[F_IN_INPUT], &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	/* For 16-bit data, read MSB and combine with LSB */
> +	if (desc->data_field_bits_size == 16) {
> +		ret = regmap_field_read(bcl->fields[F_IN_INPUT1], &msb);
> +		if (ret)
> +			return ret;
> +		raw_val |= FIELD_PREP(GENMASK(15, 8), msb);
> +	}
> +
> +	bcl->last_in_input =
> +		bcl_convert_raw_to_milliunit(bcl, raw_val, CHANNEL_IN,
> +					     desc->data_field_bits_size);
> +	bcl->last_in_updated = jiffies;
> +
> +	*out = bcl->last_in_input;
> +
> +	return 0;
> +}
> +
> +static int bcl_read_alarm_status(struct bcl_device *bcl,
> +				 enum bcl_limit_alarm lvl, long *status)
> +{
> +	int ret;
> +	u32 raw_val = 0;
> +
> +	ret = regmap_field_read(bcl->fields[F_LVL0_ALARM + lvl], &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*status = raw_val;
> +
> +	return 0;
> +}
> +
> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	regmap_field_read(bcl->fields[F_V_MAJOR], &raw_val);
> +
> +	return raw_val;
> +}
> +
> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	regmap_field_read(bcl->fields[F_V_MINOR], &raw_val);
> +
> +	return raw_val;
> +}
> +
> +static void bcl_hwmon_notify_event(struct bcl_device *bcl, enum bcl_limit_alarm alarm)
> +{
> +	if (bcl->in_attrs)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_in,
> +				   in_lvl_to_attr_map[alarm], 0);
> +
> +	if (bcl->curr_attrs)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_curr,
> +				   curr_lvl_to_attr_map[alarm], 0);
> +}
> +
> +static void bcl_alarm_enable_poll(struct work_struct *work)
> +{
> +	struct bcl_alarm_data *alarm = container_of(work, struct bcl_alarm_data,
> +							 alarm_poll_work.work);
> +	struct bcl_device *bcl = (struct bcl_device *)alarm->device;
> +	long status;
> +	int ret;
> +
> +	scoped_guard(mutex, &bcl->lock)
> +		ret = bcl_read_alarm_status(bcl, alarm->type, &status);
> +
> +	/* If read failed or shutting down, reschedule */
> +	if (ret || READ_ONCE(alarm->shutting_down)) {
> +		if (!READ_ONCE(alarm->shutting_down))
> +			schedule_delayed_work(&alarm->alarm_poll_work,
> +					      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +		return;
> +	}
> +
> +	/* Check if alarm cleared and IRQ needs re-enabling */
> +	scoped_guard(mutex, &alarm->a_lock) {
> +		if (!status && !alarm->irq_enabled) {
> +			alarm->irq_enabled = true;
> +			enable_irq(alarm->irq);
> +
> +			if (!alarm->irq_wake_enabled && !enable_irq_wake(alarm->irq))
> +				alarm->irq_wake_enabled = true;
> +
> +			bcl_hwmon_notify_event(bcl, alarm->type);
> +			return;
> +		}
> +	}
> +
> +	/* Alarm still active, reschedule polling */
> +	if (!READ_ONCE(alarm->shutting_down))
> +		schedule_delayed_work(&alarm->alarm_poll_work,
> +				      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +}
> +
> +static irqreturn_t bcl_handle_alarm(int irq, void *data)
> +{
> +	struct bcl_alarm_data *alarm = data;
> +	struct bcl_device *bcl = (struct bcl_device *)alarm->device;
> +	long status;
> +
> +	if (READ_ONCE(alarm->shutting_down))
> +		return IRQ_HANDLED;
> +
> +	guard(mutex)(&bcl->lock);
> +
> +	if (bcl_read_alarm_status(bcl, alarm->type, &status) || !status)
> +		return IRQ_HANDLED;
> +
> +	bcl_hwmon_notify_event(bcl, alarm->type);
> +
> +	guard(mutex)(&alarm->a_lock);
> +	if (alarm->shutting_down)
> +		return IRQ_HANDLED;
> +
> +	if (alarm->irq_enabled) {
> +		alarm->irq_enabled = false;
> +		disable_irq_nosync(alarm->irq);
> +	}
> +
> +	if (alarm->irq_wake_enabled) {
> +		disable_irq_wake(alarm->irq);
> +		alarm->irq_wake_enabled = false;
> +	}
> +
> +	schedule_delayed_work(&alarm->alarm_poll_work,
> +			      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static umode_t bcl_hwmon_is_visible(const void *data,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_label:
> +		case hwmon_in_min_alarm:
> +		case hwmon_in_lcrit_alarm:
> +			return 0444;
> +		case hwmon_in_min:
> +		case hwmon_in_lcrit:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +		case hwmon_curr_label:
> +		case hwmon_curr_max_alarm:
> +		case hwmon_curr_crit_alarm:
> +			return 0444;
> +		case hwmon_curr_max:
> +		case hwmon_curr_crit:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)
> +{
> +	struct bcl_device *bcl = dev_get_drvdata(dev);
> +
> +	guard(mutex)(&bcl->lock);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_min:
> +		case hwmon_in_lcrit:
> +			return bcl_in_thresh_write(bcl, val, in_attr_to_lvl_map[attr]);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_max:
> +		case hwmon_curr_crit:
> +			return bcl_curr_thresh_write(bcl, val, curr_attr_to_lvl_map[attr]);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int bcl_in_read(struct bcl_device *bcl, u32 attr, long *value)
> +{
> +	guard(mutex)(&bcl->lock);
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return bcl_in_input_read(bcl, value);
> +	case hwmon_in_min:
> +	case hwmon_in_lcrit:
> +		return bcl_in_thresh_read(bcl, in_attr_to_lvl_map[attr], value);
> +	case hwmon_in_min_alarm:
> +	case hwmon_in_lcrit_alarm:
> +		return bcl_read_alarm_status(bcl, in_attr_to_lvl_map[attr], value);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int bcl_curr_read(struct bcl_device *bcl, u32 attr, long *value)
> +{
> +	guard(mutex)(&bcl->lock);
> +
> +	switch (attr) {
> +	case hwmon_curr_input:
> +		return bcl_curr_input_read(bcl, value);
> +	case hwmon_curr_max:
> +	case hwmon_curr_crit:
> +		return bcl_curr_thresh_read(bcl, curr_attr_to_lvl_map[attr], value);
> +	case hwmon_curr_max_alarm:
> +	case hwmon_curr_crit_alarm:
> +		return bcl_read_alarm_status(bcl, curr_attr_to_lvl_map[attr], value);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int bcl_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *value)
> +{
> +	struct bcl_device *bcl = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		return bcl_in_read(bcl, attr, value);
> +	case hwmon_curr:
> +		return bcl_curr_read(bcl, attr, value);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int bcl_hwmon_read_string(struct device *dev,
> +				 enum hwmon_sensor_types type,
> +				 u32 attr, int channel, const char **str)
> +{
> +	if (type == hwmon_in && attr == hwmon_in_label)
> +		*str = "Voltage";
> +	else if (type == hwmon_curr && attr == hwmon_curr_label)
> +		*str = "Current";
> +	else
> +		*str = NULL;
> +
> +	return *str ? 0 : -EOPNOTSUPP;
> +}

Please drop those labels. Labels are intended to show _where_
a sensor is located or which current/voltage is monitored.
That a voltage is a voltage and that a current is a current
does not need a label and defeats the purpose of the label.

> +
> +static const struct hwmon_ops bcl_hwmon_ops = {
> +	.is_visible	= bcl_hwmon_is_visible,
> +	.read		= bcl_hwmon_read,
> +	.read_string	= bcl_hwmon_read_string,
> +	.write		= bcl_hwmon_write,
> +};
> +
> +static int bcl_detect_battery_config(struct bcl_device *bcl)
> +{
> +	u32 reg_val = 0;
> +	int ret;
> +
> +	ret = regmap_field_read(bcl->batt_config_regfield, &reg_val);
> +	if (ret) {
> +		dev_err(bcl->dev, "Failed to read battery config register: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Map register value to battery configuration.
> +	 * As per hardware documentation:
> +	 * 0 -> 2S, 1 -> 3S, 2 -> 4S (unsupported)
> +	 */
> +	switch (reg_val) {
> +	case 0:
> +		bcl->batt_config = BCL_BATT_2S;
> +		return 0;
> +	case 1:
> +		bcl->batt_config = BCL_BATT_3S;
> +		return 0;
> +	default:
> +		dev_err(bcl->dev, "Unsupported battery configuration: 0x%x\n",
> +			reg_val);
> +		return -EINVAL;
> +	}
> +}
> +
> +static int bcl_update_scaling_factors(struct bcl_device *bcl)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	int ret;
> +
> +	/* Check if battery detection is supported */
> +	if (desc->battery_config_field.reg == 0) {
> +		/* No battery detection - use BCL_BATT_1S */
> +		bcl->batt_config = BCL_BATT_1S;
> +		dev_dbg(bcl->dev, "Using default 1S battery configuration\n");
> +		return 0;
> +	}
> +
> +	bcl->batt_config_regfield = devm_regmap_field_alloc(bcl->dev,
> +							    bcl->regmap,
> +							    desc->battery_config_field);
> +	if (IS_ERR(bcl->batt_config_regfield)) {
> +		dev_err(bcl->dev, "Failed to allocate battery config regmap field\n");
> +		return PTR_ERR(bcl->batt_config_regfield);
> +	}
> +
> +	ret = bcl_detect_battery_config(bcl);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(bcl->dev,
> +		 "%dS battery: BASE=%u mV,MAX=%u mV,STEP=%u mV,V_SCALE=%u nV, I_SCALE=%u nA\n",
> +		 bcl->batt_config + 1,
> +		 desc->channel_cfg[bcl->batt_config][CHANNEL_IN].base,
> +		 desc->channel_cfg[bcl->batt_config][CHANNEL_IN].max,
> +		 desc->channel_cfg[bcl->batt_config][CHANNEL_IN].step,
> +		 desc->channel_cfg[bcl->batt_config][CHANNEL_IN].default_scale_nu,
> +		 desc->channel_cfg[bcl->batt_config][CHANNEL_CURR].default_scale_nu);
> +
> +	return 0;
> +}
> +
> +static int bcl_build_hwmon_info(struct bcl_device *bcl)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	struct hwmon_channel_info *in_info = NULL, *curr_info = NULL;
> +	const struct hwmon_channel_info **info_array;
> +	int num_channels = 0;
> +	u32 val = 0;
> +	bool in_mon_enabled = false;
> +	bool in_input_enabled = false;
> +	bool curr_mon_enabled = false;
> +	int ret;
> +
> +	/* Check if voltage monitoring is enabled */
> +	ret = regmap_field_read(bcl->fields[F_IN_MON_EN], &val);
> +	if (ret)
> +		return ret;
> +	in_mon_enabled = !!val;
> +
> +	/* Check if voltage input reading is enabled */
> +	if (desc->data_field_bits_size != 0) {
> +		ret = regmap_field_read(bcl->fields[F_IN_INPUT_EN], &val);
> +		if (ret)
> +			return ret;
> +		in_input_enabled = !!val;
> +	}
> +
> +	/* Check if current monitoring is enabled */
> +	if (desc->num_reg_fields > F_CURR_H0_THR) {
> +		ret = regmap_field_read(bcl->fields[F_CURR_MON_EN], &val);
> +		if (ret)
> +			return ret;
> +		curr_mon_enabled = !!val;
> +	}
> +
> +	/* Ensure at least one channel is enabled */
> +	if (!in_mon_enabled && !curr_mon_enabled) {
> +		dev_err(bcl->dev, "No BCL channels enabled in hardware\n");
> +		return -ENODEV;
> +	}
> +
> +	if (in_mon_enabled) {
> +		u32 *in_config;
> +
> +		bcl->in_attrs = HWMON_I_LABEL | HWMON_I_MIN | HWMON_I_LCRIT |
> +				HWMON_I_MIN_ALARM | HWMON_I_LCRIT_ALARM;
> +
> +		if (in_input_enabled)
> +			bcl->in_attrs |= HWMON_I_INPUT;
> +
> +		in_info = devm_kzalloc(bcl->dev, sizeof(*in_info), GFP_KERNEL);
> +		if (!in_info)
> +			return -ENOMEM;
> +
> +		in_config = devm_kzalloc(bcl->dev, 2 * sizeof(u32), GFP_KERNEL);
> +		if (!in_config)
> +			return -ENOMEM;
> +
> +		in_config[0] = bcl->in_attrs;
> +		in_info->type = hwmon_in;
> +		in_info->config = in_config;
> +		num_channels++;
> +	}
> +
> +	if (curr_mon_enabled) {
> +		u32 *curr_config;
> +
> +		bcl->curr_attrs = HWMON_C_INPUT | HWMON_C_LABEL | HWMON_C_MAX |
> +				  HWMON_C_CRIT | HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM;
> +
> +		curr_info = devm_kzalloc(bcl->dev, sizeof(*curr_info), GFP_KERNEL);
> +		if (!curr_info)
> +			return -ENOMEM;
> +
> +		curr_config = devm_kzalloc(bcl->dev, 2 * sizeof(u32), GFP_KERNEL);
> +		if (!curr_config)
> +			return -ENOMEM;
> +
> +		curr_config[0] = bcl->curr_attrs;
> +		curr_info->type = hwmon_curr;
> +		curr_info->config = curr_config;
> +		num_channels++;
> +	}
> +
> +	/* Allocate info array (num_channels + 1 for NULL terminator) */
> +	info_array = devm_kcalloc(bcl->dev, num_channels + 1,
> +				  sizeof(*info_array), GFP_KERNEL);
> +	if (!info_array)
> +		return -ENOMEM;
> +
> +	num_channels = 0;
> +	if (in_info)
> +		info_array[num_channels++] = in_info;
> +	if (curr_info)
> +		info_array[num_channels++] = curr_info;
> +
> +	bcl->hwmon_info = info_array;
> +
> +	bcl->hwmon_chip_info.ops = &bcl_hwmon_ops;
> +	bcl->hwmon_chip_info.info = bcl->hwmon_info;
> +

I am curious: Why not use static initialization and use the is_visible
function to determine if an attribute is visible or not ?

 From the earlier exchange I had the impression that there is a large
number of current and voltage channels, but it looks like there is only
one each. That doesn't really warrant or need all this dynamic code
to generate the description.

> +	return 0;
> +}
> +
> +static void bcl_alarm_work_cleanup_action(void *data)
> +{
> +	struct bcl_alarm_data *alarm = data;
> +
> +	/* Set shutting_down flag to prevent work from being rescheduled */
> +	scoped_guard(mutex, &alarm->a_lock)
> +		WRITE_ONCE(alarm->shutting_down, true);
> +
> +	cancel_delayed_work_sync(&alarm->alarm_poll_work);
> +}
> +
> +static void bcl_alarm_wake_cleanup_action(void *data)
> +{
> +	struct bcl_alarm_data *alarm = data;
> +
> +	guard(mutex)(&alarm->a_lock);
> +	if (alarm->irq_wake_enabled) {
> +		disable_irq_wake(alarm->irq);
> +		alarm->irq_wake_enabled = false;
> +	}
> +}
> +
> +static int bcl_alarm_irq_init(struct platform_device *pdev,
> +			      struct bcl_device *bcl)
> +{
> +	int ret, irq_num, i;
> +	struct bcl_alarm_data *alarm;
> +
> +	for (i = 0; i < ARRAY_SIZE(bcl->bcl_alarms); i++) {
> +		alarm = &bcl->bcl_alarms[i];
> +		alarm->type = i;
> +		alarm->device = bcl;
> +		ret = devm_mutex_init(bcl->dev, &alarm->a_lock);
> +		if (ret)
> +			return ret;
> +
> +		/* Initialize work before IRQ request */
> +		INIT_DELAYED_WORK(&alarm->alarm_poll_work, bcl_alarm_enable_poll);
> +
> +		irq_num = platform_get_irq_byname(pdev, bcl_int_names[i]);
> +		if (irq_num < 0)
> +			return irq_num;
> +
> +		alarm->irq = irq_num;
> +		alarm->irq_enabled = true;
> +
> +		ret = devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
> +						bcl_handle_alarm, IRQF_ONESHOT,
> +						bcl_int_names[i], alarm);
> +		if (ret)
> +			return ret;
> +
> +		ret = devm_add_action_or_reset(&pdev->dev, bcl_alarm_work_cleanup_action,
> +					       alarm);
> +		if (ret)
> +			return ret;
> +
> +		if (!enable_irq_wake(irq_num))
> +			alarm->irq_wake_enabled = true;
> +
> +		ret = devm_add_action_or_reset(&pdev->dev, bcl_alarm_wake_cleanup_action,
> +					       alarm);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int bcl_regmap_field_init(struct device *dev, struct bcl_device *bcl,
> +				 const struct bcl_desc *data)
> +{
> +	int i;
> +
> +	/*
> +	 * Note: We use a mutable local copy of struct reg_field (not const)
> +	 * because we need to modify the .reg field to add the BCL base offset.
> +	 */
> +	for (i = 0; i < data->num_reg_fields; i++) {
> +		struct reg_field field = data->reg_fields[i];
> +
> +		/* Skip uninitialized fields */
> +		if (field.reg == 0 && field.lsb == 0 && field.msb == 0)
> +			continue;
> +
> +		field.reg += bcl->base;
> +
> +		bcl->fields[i] = devm_regmap_field_alloc(dev, bcl->regmap, field);
> +		if (IS_ERR(bcl->fields[i]))
> +			return PTR_ERR(bcl->fields[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int bcl_probe(struct platform_device *pdev)
> +{
> +	struct bcl_device *bcl;
> +	int ret;
> +	u32 reg;
> +
> +	bcl = devm_kzalloc(&pdev->dev, sizeof(*bcl), GFP_KERNEL);
> +	if (!bcl)
> +		return -ENOMEM;
> +
> +	bcl->dev = &pdev->dev;
> +	bcl->desc = device_get_match_data(&pdev->dev);
> +	if (!bcl->desc)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "Failed to get device match data\n");
> +
> +	ret = devm_mutex_init(bcl->dev, &bcl->lock);
> +	if (ret)
> +		return ret;
> +
> +	bcl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!bcl->regmap)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "Couldn't get parent's regmap\n");
> +
> +	ret = device_property_read_u32(&pdev->dev, "reg", &reg);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to read 'reg' property\n");
> +
> +	bcl->base = reg;
> +
> +	ret = bcl_regmap_field_init(bcl->dev, bcl, bcl->desc);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Unable to allocate regmap fields\n");
> +
> +	ret = regmap_field_read(bcl->fields[F_CTL_EN], &reg);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to read BCL enable status\n");
> +
> +	if (!reg)
> +		return dev_err_probe(&pdev->dev, -ENODEV, "BCL is not enabled by bootloader\n");
> +
> +	ret = bcl_update_scaling_factors(bcl);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to update scaling factors\n");
> +
> +	ret = bcl_build_hwmon_info(bcl);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to build hwmon info\n");
> +
> +	dev_set_drvdata(&pdev->dev, bcl);
> +
> +	bcl->hwmon_name = devm_hwmon_sanitize_name(&pdev->dev,
> +						   dev_name(bcl->dev));
> +	if (IS_ERR(bcl->hwmon_name))
> +		return PTR_ERR(bcl->hwmon_name);
> +
> +	bcl->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +							      bcl->hwmon_name,
> +							      bcl,
> +							      &bcl->hwmon_chip_info,
> +							      NULL);
> +	if (IS_ERR(bcl->hwmon_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(bcl->hwmon_dev),
> +				     "Failed to register hwmon device\n");
> +
> +	ret = bcl_alarm_irq_init(pdev, bcl);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to initialize alarm IRQs\n");
> +
> +	dev_dbg(&pdev->dev, "BCL hwmon device with version: %u.%u registered\n",
> +		bcl_get_version_major(bcl), bcl_get_version_minor(bcl));
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id bcl_match[] = {
> +	{
> +		.compatible = "qcom,pm7250b-bcl",
> +		.data = &pm7250b_data,
> +	}, {
> +		.compatible = "qcom,pm8350c-bcl",
> +		.data = &pm8350c_data,
> +	}, {
> +		.compatible = "qcom,pm8550-bcl",
> +		.data = &pm8550_data,
> +	}, {
> +		.compatible = "qcom,pmh0101-bcl",
> +		.data = &pmh0101_data,
> +	}, {
> +		.compatible = "qcom,pmih0108-bcl",
> +		.data = &pmih0108_data,
> +	}, {
> +		.compatible = "qcom,smb2360-bcl",
> +		.data = &smb2360_data,
> +	}, {
> +		.compatible = "qcom,smb2370-bcl",
> +		.data = &smb2370_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, bcl_match);
> +
> +static struct platform_driver bcl_driver = {
> +	.probe	= bcl_probe,
> +	.driver	= {
> +		.name		= "qcom-bcl-hwmon",
> +		.of_match_table	= bcl_match,
> +	},
> +};
> +
> +module_platform_driver(bcl_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm SPMI BCL HWMON driver");
> +MODULE_LICENSE("GPL");
> 

