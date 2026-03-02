Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7AE1DE4E0
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 00:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772412696; cv=none; b=PtqERp5TOObMMIfb6vPKJHjskJ/VrA7cerTUWsyQnZVw/pI7TTrGtwqh8rVWyGQlczD/sMTbMED1DzN9Il2pvoP8sfn9D1Xh1JVOe0fKE8bOUXmsDSRbyeTeY/4myGOOfip3GorCRe+HRAeYAbEGyr8EXluhMcBI6Yn7aOyPk+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772412696; c=relaxed/simple;
	bh=9P7NC5Vm7qaZiCHkdRqSRFBnkRjTJ1qnih+s08A/Ch4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFt7Vv0aTSKbZ/0Pun+yGV8qWF2QrTM2E5Hwkend17vZ5pD2iHoXpYqZNFWnAlY6LU2hxsc8VdqHhlb4Jbji8Sgyy2AAe4XpMVE49+Tm9svKULAwcvvCVDqNh/nB9v1FfSXz4DpZjTvwyZRkQCl54boR19UYlwQ0qRLuzbWWHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUKysYmR; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUKysYmR"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1273349c56bso4625276c88.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Mar 2026 16:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772412695; x=1773017495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NAGZRLGipko04MgmezM0VA2DAwnPlH8b7dMQTW3uVco=;
        b=GUKysYmR++BIA/SjwLLlWvq6G/2Tg4eJXxiiDu7keyust/Ih5BwCidjxK4WE04+vBZ
         Ks5vHceATiqm3xdBaRchqbg8OK6DvRSIUdnFz4TT/eUFiUIJOzOEadD5zmKU6WOSQZud
         JkPf4Df/fyYt3X/tBepVWSW0whjS5OOd0EhBOU03sszCStV4vyIJVeSWqgG2HDKMdmTE
         fcqIzjW2oZQqY4KGWpJzCyZ1iUqGREy7ETNUoW4wWlMIwsR9MCF7+TESCcTmJBLvw1CT
         s7SNYzpWsUidLxt4JB5TzwyrEQdTOa5wI8BaepS8z0KAHRKA2pyNWiMaUBSLPKMKKCo6
         x/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772412695; x=1773017495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAGZRLGipko04MgmezM0VA2DAwnPlH8b7dMQTW3uVco=;
        b=UzhCrYO3cloCu3MgRCRm9pI17WgEqojgfYJeSnKii+z1pRjWEhxAGUmH11pt/QcoQ5
         +HA1YZlWf836znOHQIh5t7rjLYkF/0FvJ4SmZrCHAOciN7W1oDcyNrMgQCzRUOn206OT
         +bsDZjWDm8hB2CDMtDv4yYyyPOh4/8FaaP5Y1a0v8k9EZIFE+g54GcMtqCQBa78swV3F
         aMJsPDaHirK/g0MNmfyV5YVTsB606svfHddKMjRyw95F0mf86fC4CoinA5xrqVE/W8O3
         I+N21RQTHX0Dx14ED5yKjFzuCKeFhmB+U/utSiqQD6YS024jCPt6dseBWFQXA6Kp2nJZ
         Ttkw==
X-Forwarded-Encrypted: i=1; AJvYcCXLyCaJkVeiVGEtG7R/kpub11qasmKy0xJcVhCXtcmwD8CsaITEl834C6wlkdsibgToh1P7ZHya88JjWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjlGyczYuMaQRXRq38Ydzl330o/JG7l+vgAxZDqUKc9/lp1m9J
	9PJ/fntptUDw2jtias2ll2na+g3vMJrykQMRZ9nRtbMxCp7SdnEhGvNIwkB7oEaA
X-Gm-Gg: ATEYQzwWhZ7gU+b3utljgfHMLelGfSgA6toL61FVumhWOxruXlV6O+IbLVYqZ6qoJfb
	4AKHtdAOVKEBsbOZySLr2oV+F6SAIdC3Oq3IfytAfRAZMUDoZIqnkW5JuyF5ao9F3EbYFFgDpya
	hJ6an/ZKxR40YQuSppeVlhs53PxXjF2tnCdk6HlovZB7yai14dTZ/8/dYiwWJ9STcESppemLTSP
	tMNd4+4LISKAva5Ox76WVp0i40VjbtJ70aXNMEUMQfEMjuQkNG/xBQxgfiS0CdKiAWuyvygqnYD
	VOs6s5wLDSZ2Ktf5jDhSQWo6DCje6pzzB6RAAoyTEUQ5JLecRluitkE8RmkDj3YeJWRILcY0puZ
	flcSai8kHdOIGXJxEDVjsjUk2TpU1lI/d2sHXo/fx7aLlf2ZMykbNz01v7jZAEit1DhRJNJTYP0
	P+QnYt7lFxc7W8vhv+Tb07HxUl53aQI7cvB/ES7Cfb26D8fV9qBDmkBEEtSgKj8AUrqSErHx0i
X-Received: by 2002:a05:7022:b8d:b0:11d:c04a:dc5b with SMTP id a92af1059eb24-1278fc38dd4mr2784649c88.30.1772412694770;
        Sun, 01 Mar 2026 16:51:34 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a32863sm11556763c88.10.2026.03.01.16.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 16:51:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
Date: Sun, 1 Mar 2026 16:51:31 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: axi-fan: don't use driver_override as IRQ name
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, hanguidong02@gmail.com, ysato@users.sourceforge.jp,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org,
 srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
References: <20260302002729.19438-1-dakr@kernel.org>
 <20260302002729.19438-3-dakr@kernel.org>
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
In-Reply-To: <20260302002729.19438-3-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/26 16:25, Danilo Krummrich wrote:
> Do not use driver_override as IRQ name, as it is not guaranteed to point
> to a valid string; use dev_name() instead.
> 
> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>   drivers/hwmon/axi-fan-control.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
> index b7bb325c3ad9..ec4bbb104449 100644
> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_device *pdev)
>   	ret = devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
>   					axi_fan_control_irq_handler,
>   					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -					pdev->driver_override, ctl);
> +					dev_name(&pdev->dev), ctl);

The devm_request_threaded_irq() API documentation says:

@devname:    An ascii name for the claiming device, dev_name(dev) if NULL

So NULL should be sufficient.

Nuno, was there a special reason to use driver_override ?

Thanks,
Guenter

