Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7044334DA
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742421; cv=none; b=s+EemEevkjCsqxS7oZKAUbM12kzNR44Ns6BL2DPmHL80r62FqQQxNEAIm5TeINcd3ieyf9IBwiQKkVS34yiOszHbYlGiuSlo6ysUUdI/JHhkuwwSUs8ar0VWg5aTonvoe14/MrScgfUEcnnVMBlDNCodOOIkozAafXSdnY3ZCC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742421; c=relaxed/simple;
	bh=PkGK2fm3HmR1ilYx5RK49tVeiQMY7CKA8zevtlSfvao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rai6ullp+E+XHfkfYqBg4pNfHPHn8UgDkLvnn24aWT0c7QKI3VaVxOfO2Y9nQgaEpqFNqQ8GJK9sHvU0HdLxFb+0a6KRe0HEgbtSt9cBRcGjVN/NHAwIPFnEOg+aJceD8+shWfoguMX9n2azAvLNNd+BDowIpdx0YF5MWLTeEwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUNtPpkH; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUNtPpkH"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so6303868a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 10:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784742419; x=1785347219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7V7nXmMwXVDQS+JNg/opkYCOVS43thsWpLZ1957ncxY=;
        b=dUNtPpkHLXg2tuAST82urZWqoexRaX3jopCxDzm4HT8QXsGISburudN9RkhohNQJeb
         82K50GjFfmFJE74TGsFfiSkGdVbmGyQYFJK0ethblcDZ0DWC3DvyUUoPhbOjspbZZZMp
         mWtBu/tmwj7gKnYuArD1G97ux5FF723NJY7mWS8h0PmzitZla0wkcT6+Z62bzAGTGgXL
         4jLJn37xiZgAbHFlaX4tmRub+1VudP2RD2wnLKuw7ZBKGFjpffXXBR5ev1N/1H+DvVcv
         3HvpRhJ/wCLbzttjQvfZm2BjgUecbl68Yuhk895Zxzj73S6X3REnPqGUd3gjm8FsKCmY
         /BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784742419; x=1785347219;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7V7nXmMwXVDQS+JNg/opkYCOVS43thsWpLZ1957ncxY=;
        b=j06yqs+gCQqCGr7e6eCA5zIndsvFdi+dyPCizIQeOPFsHFPyDIUCRn+BspEFnzcPfN
         O9kCFUWjQUrolAS4bdD78sdTAvp8LY7gNNI4CdQge9icpBDYDgWs71MvRPuD03lnsPTI
         4KafZiQ+14xp6dxh2glC+TTmXZONfknDW2DQp4QZoWnOOdLkAvf0BycA5Y0rY/uwNyKN
         BcbwAEDABtgp6QxT0jp9iSvoxZ7npvMgbS9zehqfhWY/fLTmMexEaWx4h1Tk0B6+7dXw
         dWX9XsCZkTT6zPeBGv//sDdnbFJInWCIqgTLsH59IGtmFs8kU5Zk2IBwMkUzPqPeSSWK
         dz/A==
X-Gm-Message-State: AOJu0YxuRurbvYXYIu95m+voQWqbuDdNgSFUWXbaIuL1yp5iRSxF5RZ+
	3Iv6yCPwZvK1i7RFa16u6giqLtPNsXDIyIEYcdQb4fEsM8/PKU08mI4i
X-Gm-Gg: AR+sD11rnIJChU/XiUyZ6YNaVqCYQVO+8tsSUauWBRFtjaXJjgmj7s/9hrtVuNCsrgu
	FiDKcqHrSu71bOwJzGZ6zr7a5JeB19hJAjAeuRGRloP0TAYoNpx2+Kvu+P5paQ8xmgd57mMPHnr
	Km37eB9le1903qWu9/fwlflc4ZUDiqM3r9MAlU3UHp0zdQYK2h7UR47jUAWuOdcAMj4teMtbJpS
	1p//4yuynva59byBHhx2BIhxuANF8oMRH4GoirJXgN8MmGwP0i1XaCm2VeXFBWg+FUTbSqPicRL
	5sjofjFxilEvXSqB1E0rHPESV+Dh6D38r/+O78aiErnjaqHfvBv0viMuopEq+R0DKp7ON1uQiR+
	GDh0+rma9U7/Y6ZKB8s4fc3vUJnVV3z56KnbinjEgnGkFk0DY3O3tCVmNQi83gVj3qQSojwSyhd
	AXAf9T1A61FVzKIm7pjqWxJOUpRB41bSMTKmi1pSDjyAc7h3S+9ic=
X-Received: by 2002:a05:6a21:114c:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c3ad80c405mr24682840637.32.1784742419481;
        Wed, 22 Jul 2026 10:46:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3149198adabsm1188162eec.8.2026.07.22.10.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 10:46:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
Date: Wed, 22 Jul 2026 10:46:57 -0700
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
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
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
In-Reply-To: <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
...
>>
>> I am curious: Why not use static initialization and use the is_visible
>> function to determine if an attribute is visible or not ?
> 
> ACK. There is already a comment in v1 suggesting the use of dynamic allocation based on the available attributes rather than static initialization. The intent is to avoid having to perform enable flag checks in multiple places.
> . >

You lost me, sorry. There is only a single is_visible function,
and its intent is exactly to handle situations where some sensors
are not always available.

What would be those "multiple places" ?

>>  From the earlier exchange I had the impression that there is a large
>> number of current and voltage channels, but it looks like there is only
>> one each. That doesn't really warrant or need all this dynamic code
> 
> Yes, this hardware only supports one or two channels (voltage and current). What we discussed earlier was that each channel can have up to three threshold alarms (warning, critical, and emergency). However, the hwmon framework currently supports only two limit alarms for these sensor types. I have not added support for the third alarm threshold in this series to keep the initial driver support aligned with the existing hwmon capabilities. Once the basic driver support is accepted, I can queue a follow-up series to add support for the third limit alarm.
> 

What does that have to do with attribute visibility ?

Guenter

