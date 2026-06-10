Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C717A303
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 03:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781063886; cv=none; b=Y5KQp0Qdkz+XFtCPbqBjv5k3/TT+RfHTza7dKDxMb8zculASbUO7O7lk2o1lVMq0OK5br3PeCxgfsisQsdFCC3hC6VWcZhtqopvtZAVJs7drbGUbSBm0WWbNXnHO01xqzdbNJzrFta7pl8pBT3OCfqkIv7oGmQ2XK/OKDlpthOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781063886; c=relaxed/simple;
	bh=CU0PV2vGoubSkyPgwbhc7/8o/vSXv3qOFrp4R/22mMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Px13LhVYYC/ZH3I/Sb+rsdjIbusYftZtj+HCCdx2Tz8MKbEcfgZVyQnEYd9O9+uAqciNttQWMdRqT1hguxLlm2mA/4VJVy01IjAMngl7LJhLuc9uvjtDiCT4e/p1wGvbJbYCEFSNv53CJ7wqBdwVaReSxV+7Ktwt6vl0bkVZVOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQ1Mjm2S; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQ1Mjm2S"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36b8d414666so3552679a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 20:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781063884; x=1781668684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=enJMOywcB6oAh1mHHSf6tEl1XWGQ4tcQCZDpp6DiYQU=;
        b=qQ1Mjm2SZPN4ANHc0z1uYO82Bm9O0UdHWJt+KmDsAEjEjMExGgw0/+nNwgcqKFeAcB
         xsk0ftjWf5sQVYxWm58fNj+1Lyu5mzLsiEqOuUJGQ7PkVUqCRQMS2TFDaGu+80V9cUJW
         rd6hVl4uLE/pOuy0lXRXlP5X0U6l9IzLrV/IBk6ajJYlV8BzRoBkRUN8Y6NQZEXIhkmW
         sKj39grzbg3I9F9FOyiXrxbZDFD+U4/ot3obI3nH7YNJTcxyZxO8XuCCqCT5zOBtUuLt
         IlPoiEzD2uE3iOHnxkMNXSpf1HzPoUk2RUH2CIQmaHizl6HnD2wUeYpi7tKwWHVqx0Ul
         sq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781063884; x=1781668684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=enJMOywcB6oAh1mHHSf6tEl1XWGQ4tcQCZDpp6DiYQU=;
        b=UEauFTIIWcTWAOFI+50aHM7q+ZW6snqZDb5QOPkUs7A5y6RFsV1DaaAUR+1e3GW9CV
         DvznQGQedTJGC+iXM86numeaeNRMNopQfquRAAMHnVlStQmo6d8zhXjq+ONi1ia8zGFb
         RlR/E5/kP85e1HG4JTrst6WBL0lKhR9YA+RhY4B6mBUUQFicWAe0X9PFpPqzRtj9Imr8
         kMmlM5XWhLc0MkqrpZM/hCqhHJ1WpY5hy+XzJ0R4t2OM8OZkuOrzt7p5PK9ahRY0VB5/
         3LeFNMOVLLrfO2yMpHUZci9KLQ/UgGRVXJrseNWEox6+KXViF9c6bXQicv4IQDr7Uube
         F/PQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HzQEa4hCQ6x4DGEpAciZImo8QQDYL7MTs84sncy60fPfrkdXDifIMExhEF/IooDC2Myem4E4ITKNRGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaqQQYkW5hPNYqkLn3pzpst0W4RapWQ+NoXMcRBd13GnfNTAbG
	a/Vw2bPcKbWaQCuMGKXh42ieB6EAJ/6ivK2wri66weTSTQyoHgtiKr+s
X-Gm-Gg: Acq92OGUsecHWKPt9Yr/4uec2tk46bRexCkKeukJ9XmBmgBEvLMKb2NPPNwh/Eq5ix6
	kab9hZW2veOkmc6nOgXzZDb/XFmlzqjcPdrmlrZg4/70qqTB1C9W/lxnz44P/M/etcBFiporH1M
	j5kksszt+tFLWDtnSdOpNOslnIuSmmrG8q5kPQBq53AtJM2Z5gWaDWvgr/hVMdaeW8z7ANm11h9
	/egJINhW37GmhpRj9mT69rVcK3xSQfu5kR4LqNrrvdjuXgCd7NdsU4UBWYsdx88eMHQs0QdrGjw
	yQwNf/KxondlFzb9jvJYWGWf0XYYnwmDBN+kpmC9qZ+b3xTl1GbiLfGUSkweM3G6XxJx7+cKpSk
	N5Ek9MHLsbqBK4HA3c2n/rVA2Ls25H8aP+1k8lO9QxjDIZhCkK3g7zJTYHpB8n5rXOI5qck7Eiq
	YbmlkpuneZLDE2PHSa62RC6m1gop6s9YGmHPfF1RO0GzjVQNWA8TTPhCZlGH2Hj+yGCkUnsO3Sm
	BtM7sB4Ou0=
X-Received: by 2002:a17:90b:5747:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-375212a2eebmr6290346a91.20.1781063883796;
        Tue, 09 Jun 2026 20:58:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37625ecfe47sm702153a91.0.2026.06.09.20.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 20:58:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <390d34f5-3467-4364-9a79-047aa779a026@roeck-us.net>
Date: Tue, 9 Jun 2026 20:58:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (gpd-fan) Reject EC PWM value 0 as invalid
To: Pei Xiao <xiaopei01@kylinos.cn>,
 Cryolitia PukNgae <cryolitia@uniontech.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cbdc1df2ed3443b08cbd1fc2652638deaf798c4b.1780990542.git.xiaopei01@kylinos.cn>
 <305E2395B7027B5B+e851d97c-2af5-4752-8c1c-7f92884fe874@uniontech.com>
 <e8bb6993-e533-406e-a389-5bf5d670a93e@kylinos.cn>
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
In-Reply-To: <e8bb6993-e533-406e-a389-5bf5d670a93e@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/26 18:10, Pei Xiao wrote:
> 
> 
> 在 2026/6/9 23:41, Cryolitia PukNgae 写道:
>>
>> On 6/9/26 07:41, Pei Xiao wrote:
>>> The EC firmware is expected to return values in [1, pwm_max]. A read of 0
>>> is illegal and would cause underflow in the conversion formula. Explicitly
>>> check for 0 and return -EIO.
>>>
>>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>>> ---
>>>    drivers/hwmon/gpd-fan.c | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
>>> index d1993cd645cb..decb61936b95 100644
>>> --- a/drivers/hwmon/gpd-fan.c
>>> +++ b/drivers/hwmon/gpd-fan.c
>>> @@ -341,7 +341,11 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>>>          gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
>>>    -    // Match gpd_generic_write_pwm(u8) below
>>> +    /* EC PWM register valid range is 1 ~ pwm_max; 0 is an invalid
>>> state */
>>> +    if (unlikely(!var))
>>> +        return -EIO;
>>> +
>>> +    /* Match gpd_generic_write_pwm() below */
>>>        return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
>>>    }
>>>    
>>
>> Have you ever tested the behavior on a real device? When it returns 0,
>> what state is the device in?
>>
> Hi Cryolitia,
> 
> Thanks for your  messages!
> Yes, this is not an issue, but this problem was reported during the Sashiko
> AI review.

I disagree: it is an issue. We can not assume that the EC never returns 0,
and the case must be handled, either by returning an error as implemented above
or by returning 0.

Guenter

>   The maintainer suggested I take a look. After checking, I think it might
> be better to add a check:
> if it's 0, just return directly. In case some EC returns 0 someday, causing
> an underflow,
> returning an error code would be more intuitive than returning an incorrect
> value.
> 
> https://sashiko.dev/#/patchset/cover.1780880972.git.xiaopei01@kylinos.cn?part=1
> 
> Pei.
>>
>> thanks,
>>
>> Cryolitia PukNgae
> 
> 

