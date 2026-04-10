Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF273D3492
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775837133; cv=none; b=au6HF/A64nlgE9Qeon+86bgFB3vcBbdOiPS9QGsQ7b0wPVg4d6uDhrbbXcGnojhN+HNzG353b00CqdBANq3C39BMSZ3UKxBQYlzUL29h1/10hETMt6grTQdAyrbw+GyHgg9Og/Iuzj5WoK9PFACVsTT9HfWUY/PpUsVpOisdrgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775837133; c=relaxed/simple;
	bh=JVRuMiNPOp0rOofZTG53QZRaqC74TDxdD8KJao+OyDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cR+r3d7hUIs5wb8PjE+Gj+LcTCtgQscrmm9UhyAB6E0ZvCA/VHGQgPlPavimjyeAxMLqgKy/247Z73Nsid/aCrLi5j7zk3gllr+rJdwHdcDFQk9RsrP0287PRuFqY07e6mMaEhhKmBExOXbuHorctCAEDRdj94jvc9GbRSVKecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuRaOaie; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuRaOaie"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1271257ae53so9647073c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775837131; x=1776441931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Rdw806p54hv0WYSi4dT+YA4YfP2LywL8N5qs00NGoaw=;
        b=QuRaOaieu5197qqcbBHLklo/tOSO3415VwdBIoU/HvW4k3fIStMcY+SoswyjVimKQ/
         RzI54FnErDWH0XEmG1OgGr9nm83ViRjfwF2CdH2ql7e/hmpKex/UHfuS5FjEegP7ol0E
         bBu+XvPx7FCUYf7Tg9ZVDnRDZxhS8LK386ES4pLrpOABeSJZ9PEUVfhZ2fVd+zu90cqa
         8632w3y+4wovSGWoA6TccZT1GdOydKmFu0ZlOKsCr5ouOVXOc98H5vmAid8/LRl3NFlp
         pCeYGchsIV+T7Dcdgy1PWTjhyLpGoqOxqWQs0sncdrO8jBcNHY0VeKJ5uYu0FnmBlvxW
         6cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775837131; x=1776441931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rdw806p54hv0WYSi4dT+YA4YfP2LywL8N5qs00NGoaw=;
        b=EfSlWm0riuhqPhX2qz27jLQs4BjW8lXSJOS8XiSH8VY8Wuuk9QNhidg4hhY1o1Ooy6
         6qifuPj9H7bBeW/lrHycuDKOs3o0TQbVmEPVn7aQaKt1mHDvtMWqDR7L5Ku3XLRBBQps
         26tSWcDg0txJh6Cg5c1xa2yAvECPNepujwoXzQm58beFb0SRbDSqEckfedwuPeDYV6Eu
         T1qmANW8XjsPLiVQLfsuSx4OwQzlVNeXdVf6IVKzf8cq8ZQXv50OrgSKco/cS9xtDYJS
         u3Y4MU6WfK5m2u/ccEhZ5q06TMcoztbD/2cx82XCsgnBZc9ufJDC3ef5R0yV9iNRmcwF
         TOOA==
X-Forwarded-Encrypted: i=1; AJvYcCVcWh7sEpPcj6RUhp31TR01ZeBy3/5aZD3T1oIWyNo32NAT944+ZtcCbZBVSKSKIuQriLOLK1xve2CMjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4c2nFXwlQTAAGLWjZzd1xwxev1RzBkC7vNUovpk7jNxXazy1v
	NeI21E50opiz6BoiSFFxwLIF6rEGp1VNta4FQIwsgLRUu1MCN9oN5UPv
X-Gm-Gg: AeBDieuLfHI5g99+TURmnFxDlRjD54qds8yc5oW+Mq0f3ce9eOtXt2UePnCy+eXtOb2
	qhSgydXzemJO7XSc2FdL1wsALZ+Y85ZJENgBGCqQXX/LLck6GjrGEaQCOnfjdGlq/WGxxt2HQUY
	k02NRXhxGuzI4tGSPaMewqUEvZqAqMbl8BFC6P40KguLxN3J5wmpzJsXVlIFQehPHUzChIBjl3z
	i33l+8nmsMJMDKVhOJaegdkavyCsd9XsfOul2MHKcYcr1u/30A5364OOryLwIhrbB4YqkH4BHeN
	PIJHraLxqQWWuJt+inS5YA5tu4Z+4BB1Qg+bj1T/ZUqdBsTKcb7HxjC6kqTQ7Gr9xp3xoIbUyKP
	ttGmk8toODDTS4TrlRVVZ5lhQJGhVwQs3ukdUH4qEbBLiBcj9Huc4tC2MiIkzN7kCtqTD6GXVXg
	V9pWvT8KL8q1W95rb1Uqo6T2VF4wp1bI9WZgGps/6hh8PDSNup+lDHhunKHhVK0VpZcv8O6MYNA
	4eBJoz86Oc=
X-Received: by 2002:a05:7022:492:b0:12a:6c7e:bef2 with SMTP id a92af1059eb24-12c34e68eb6mr1904050c88.7.1775837131226;
        Fri, 10 Apr 2026 09:05:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c69b3sm4849901eec.1.2026.04.10.09.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 09:05:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <54fec616-3cc2-4d73-9ddf-aadcf41c924e@roeck-us.net>
Date: Fri, 10 Apr 2026 09:05:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] hwmon: emc2305: Validate fan channel index
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
 <20260402122514.1811737-2-florin.leotescu@oss.nxp.com>
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
In-Reply-To: <20260402122514.1811737-2-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/26 05:25, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The fan channel index is used to access per-channel data structures.
> Validate the index agains the number of available channels
> before use to prevent out-of-bounds access if an invalid
> value is provided.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>   drivers/hwmon/emc2305.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e..0b42b82c8e22 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -548,6 +548,12 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   		return ret;
>   	}
>   
> +	if (ch >= data->pwm_num) {
> +		dev_err(dev, "invalid reg %u for node %pOF (valid range 0-%u)\n", ch, child,
> +			data->pwm_num - 1);
> +		return -EINVAL;
> +	}
> +
>   	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
>   
>   	if (ret)

Please address Sashiko's concerns regarding channel index validation.
It seems valid to me. Feel free to ignore the other comments.

https://sashiko.dev/#/patchset/20260402122514.1811737-1-florin.leotescu%40oss.nxp.com

Thanks,
Guenter

