Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D00C41C62
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 03:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774754187; cv=none; b=a/Aq6hpWA3DJhxxUaqVKdFfNetLCYJFUyyZactT5QfNOjIVjrWtT8X+2YmJOtOlYulh5lu0HPWlZbQBfMxneenkYmjvg71HbJgP/JE/jb2mhw6++mNUWjt4O3i/omlX80LzTjJwji5O/Ej3FHFAs56/SlGC6kMCbh9Fz6se1Lm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774754187; c=relaxed/simple;
	bh=axGodFPDfZSzrbsIxLUAOQPuaSICAFT4eVvcPYxvmtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c96MQlxzJU/tJzkbsCRKbZ043J7Vm7XIjqqkYDCDc3wxy64Ud/+nYAIr+JPfPR0C1b4FEknCocb+gh49M4JXaipNE0GF1j4m36wEItSPoO3SW+3yX1ZjGuRa89C3Yz0D9xFaeamWQlweCALMjcVOUuD7IO9P6q1vZWWUeub42+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnfrQ2E8; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnfrQ2E8"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12a695044a4so4902351c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 20:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774754184; x=1775358984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ts2G5IGF14bJ//rtU4HMlXznlauMIeD3ocH2F8DPDAk=;
        b=GnfrQ2E8vyyjwTIrEU767A0ModgFXDaU+X2+7VHTMbBhxiqjIx7C0bocxaIyu0MAVO
         jjWJa5yy5dxR5e5G6T86OYX7Jocu68wQZ5UEdbOvXQpfnR0Poz1+o6mbH9M10fThId7F
         45sEJHOU+GxTv+MheiqXCuu4UNt2RjsDbv3x2CY9J9zMtB3gpm8yg2y7JVn1B4XxX5MM
         HPmGcHNE2eDLj6YSHJSQ/Xmf80OiGexrPrJHEcwUEBDd95NzjTsWBzJdbM4/1Rwn3Ib4
         DQAVgFDhvviC6Lvz5vY2wlE91kfSmXo2CeJD883dR37Kqf0TRDZppkGJ+3vIfSKHRQeu
         g7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774754184; x=1775358984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts2G5IGF14bJ//rtU4HMlXznlauMIeD3ocH2F8DPDAk=;
        b=m5NDFr2o4tTElm1fMSKhtqWlR9F0f29HgS4mWDS023+JtctFR53mcnv5vEPPzWfMFz
         rQgG1Btvg0mJejLndRyiAxf8ZB8dxlsgRSvzlk0A8FcUjvSQwmJ1PjFq+FWlLmq0Dw/6
         ZuaDBj9T+TZBesdfCxDi++kKUaeI51L4MQhllkd0nzV1iqj9d6nv8kFqCa7MUhDBR72f
         pnsUN0veLTPlpA0hJ8+br6NuoK340s1ZUW9vc2zLDIl5Rc5FPay0GFbHrSENPJT0vI5a
         jE8yygM0icm3AJNv+ooPhrFuNNO5leaqLl+OFEjHLeQ7cflJl1gD5dHKnSJvSu0jzHef
         bSkg==
X-Gm-Message-State: AOJu0YyHBMLPk6vc/T1F3X37QnodWI6JE2ITM9rPd93FH3SMIhngjdC9
	WXoI4UXjW4qhVGJzmh5yCQIeg6yGFTmmLz0nxaSlKBoXy7iIVnTjpcoq
X-Gm-Gg: ATEYQzwE83O+o09+9RUKqHoVxH15sq4GafB2fJxx1dtBE/wIQLTewv6qo23UUXBRcVg
	ZK1Bu7Cvy6MFmy/nhXtz/7u9jh8pi7RwRvdYcM3WfFRU3DBN6DMFJKiZVafSajm9+cTI7jS4TmR
	cHFWCEqcjrDKeWJNyQJXS6A27CkY1DUSW8ufTjfCW/nGkZ4MmTZExL8odoZJntS1BN2oIWBoCHL
	cosdXeOXvAt2Eo+wR4zdVaaMXSs3Z9lTurL+oGbiLxGrjsxTvDvk4WXCEvALiqEzHxTTnRMbDhy
	pid85U5RqBMqbN1exket+t/7SBzS0SKINcOG+7F4+2r/hX1kH22T2HJMBRmksKECO6nfGX1Qhqk
	u7Krd99pFpibqh4ZMHOrCCYT4q0jZJpuYlSxV4ES2KXpurQR46ZXJHY/8gm6oRz37S9c6p8V+Dp
	y0H5eg7RBxmNtxayjidgEMyvI3h++6fO2Q8dqdqCikOGP2uHb0rqd2UEHnWWUNInlBAkv16ygG
X-Received: by 2002:a05:7022:458c:b0:128:d362:31e8 with SMTP id a92af1059eb24-12ab28d7803mr4583889c88.20.1774754184421;
        Sat, 28 Mar 2026 20:16:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aba581027sm4842493c88.4.2026.03.28.20.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 20:16:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f158d290-69b5-46bb-a49d-a6162d39e2a1@roeck-us.net>
Date: Sat, 28 Mar 2026 20:16:22 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (ads7871) Add mutex to serialize SPI
 transactions
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, me@brighamcampbell.com
References: <20260328182015.220298-1-tabreztalks@gmail.com>
 <20260328182015.220298-2-tabreztalks@gmail.com>
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
In-Reply-To: <20260328182015.220298-2-tabreztalks@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/26 11:20, Tabrez Ahmed wrote:
> If userspace reads multiple channels concurrently, the driver can
> overwrite ongoing REG_GAIN_MUX writes before the conversion completes.
> 
> Add a mutex to the driver's private data structure to serialize
> hardware access and prevent concurrent userspace reads from corrupting
> the ADC multiplexer state. Update error paths to ensure the mutex
> is properly unlocked.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

When using the with_info API to register the hwmon device, the subsystem already
serializes sysfs accesses. The next patch converts the driver to use the
with_info API. Pleas explain why the extra protection is necessary.

Sashiko has the same feedback:

https://sashiko.dev/#/patchset/20260328182015.220298-1-tabreztalks%40gmail.com

Guenter

> ---
>   drivers/hwmon/ads7871.c | 26 ++++++++++++++++++--------
>   1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> index 9bfdf9e6bcd77..02e69bef2ca12 100644
> --- a/drivers/hwmon/ads7871.c
> +++ b/drivers/hwmon/ads7871.c
> @@ -59,11 +59,13 @@
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/err.h>
>   #include <linux/delay.h>
> +#include <linux/mutex.h>
>   
>   #define DEVICE_NAME	"ads7871"
>   
>   struct ads7871_data {
>   	struct spi_device *spi;
> +	struct mutex lock;
>   };
>   
>   static int ads7871_read_reg8(struct spi_device *spi, int reg)
> @@ -98,6 +100,8 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
>   	uint8_t channel, mux_cnv;
>   
>   	channel = attr->index;
> +
> +	mutex_lock(&pdata->lock);
>   	/*
>   	 * TODO: add support for conversions
>   	 * other than single ended with a gain of 1
> @@ -107,11 +111,11 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
>   	ret = ads7871_write_reg8(spi, REG_GAIN_MUX,
>   				 (MUX_CNV_BM | MUX_M3_BM | channel));
>   	if (ret < 0)
> -		return ret;
> +		goto out_unlock;
>   
>   	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
>   	if (ret < 0)
> -		return ret;
> +		goto out_unlock;
>   	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
>   	/*
>   	 * on 400MHz arm9 platform the conversion
> @@ -121,21 +125,27 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
>   		i++;
>   		ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
>   		if (ret < 0)
> -			return ret;
> +			goto out_unlock;
>   		mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
>   		msleep_interruptible(1);
>   	}
>   
>   	if (mux_cnv == 0) {
>   		val = ads7871_read_reg16(spi, REG_LS_BYTE);
> -		if (val < 0)
> -			return val;
> +		if (val < 0) {
> +			ret = val;
> +			goto out_unlock;
> +		}
>   		/*result in volts*10000 = (val/8192)*2.5*10000*/
>   		val = ((val >> 2) * 25000) / 8192;
> -		return sysfs_emit(buf, "%d\n", val);
> +		ret = sysfs_emit(buf, "%d\n", val);
> +		goto out_unlock;
>   	}
>   
> -	return -ETIMEDOUT;
> +	ret = -ETIMEDOUT;
> +out_unlock:
> +	mutex_unlock(&pdata->lock);
> +	return ret;
>   }
>   
>   static SENSOR_DEVICE_ATTR_RO(in0_input, voltage, 0);
> @@ -194,7 +204,7 @@ static int ads7871_probe(struct spi_device *spi)
>   		return -ENOMEM;
>   
>   	pdata->spi = spi;
> -
> +	mutex_init(&pdata->lock);
>   	hwmon_dev = devm_hwmon_device_register_with_groups(dev, spi->modalias,
>   							   pdata,
>   							   ads7871_groups);

