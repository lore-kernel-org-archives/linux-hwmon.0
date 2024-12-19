Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4035354727;
	Thu, 19 Dec 2024 03:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734580217; cv=none; b=WBa2DXiu13CnFGM4mUhsgKrb474I+56z+rf4xk06z8PHUrlYm/Ub3d5Eva1lKcuXTAgmhOIMklW6DcbP2Q8O7f6jbeTs1Z/k0pHorVBu0WR37bLVoU7j1XCsGb4hzbgxHBmogh+vsZTIrR5zPx7xHNZEowEGK9Z4nRSGBYFH5qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734580217; c=relaxed/simple;
	bh=/c5kyZvSoZodl4OuOHRv3XBuU1rpIGinCqzAmQ63/QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UpAvq+/RorW9dEsHLrSJOq+dTQQKVwEphP/fETwwuBshYWiLiwNx8UR1BkiSoFBcfR12r52Wl/zy204TwuFFzyDG10XqRHNy2TV2qZiMQtjSrpDLWQdROn8phMK3HHLCQSKrx6Q8E5gx2fUOjJCUZGBgdxJsJU/Sx7arj5GDqLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyLiv4LV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyLiv4LV"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725abf74334so309890b3a.3;
        Wed, 18 Dec 2024 19:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734580214; x=1735185014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=P/RXSdlYCurZNt7gHEJldKTq68jBWsZpzA3EWLVNuY4=;
        b=fyLiv4LVrboHffuKOMQOQyoXVsGgSNo6dgUkcr1wRh/CnGavwVpTIMVJXC+qSB6T81
         nUr+KhQkmj5XERyU/kBMjG6MORanKFwKt/A9maCGEgXwCA57Nmqu4vIUMR19JyrmwiRI
         /Zp+SgjU1bPOtNFJmWT4dYEYvZVA/IUok7nftKrh9sc56YfEdc8WCeQ7hV58I58RO8vN
         +c1rRy6f4A6FdbhM5YorJpJdCU7ZsPZnCQ3kkOsT7hYYhIi8LlT3yBsty+rqG5hc2iW5
         ooEJIUkJpG9gUDx+UBWgk5+zSsYO4jM0h6z445JdjYTMrKaALcRkWMy9fpv7fbzxRPU1
         iWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734580214; x=1735185014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/RXSdlYCurZNt7gHEJldKTq68jBWsZpzA3EWLVNuY4=;
        b=PIPI8Xn/szifx0lEtwFZEUSVEV+kAf3cvGKkW0pCUdxvyefIzKhcNUfRMc6JHHNvaq
         XBhTjUV23o9Zk1ZUgy9WaYo/YkaJyvbZJRSslL515DdH/JSiTFFIh/zY9z+jLzut5HO2
         R4zaVEBv1Cwpj3kQrHlY0luP/BcR6h0WwsvgKyW8IcPbTrRnyRurpu4W8Ge5zZWiFPaV
         2GDMJgOXTKKUqTGJ/0TNarJUQwOeAgq18t4VpCYCfJ2J7MzOIieMZxoqdoGH/5SsIgxi
         If2rW+i6MRrWDxu+c5UUNSrAPF0TpoFIdetVxONA7Q5G4tY2SaKLCsjOjH3IMzni/LAl
         t7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWplERFgYyxE334lCu9dAeDWsFxMx/PT6Pms6SlvxfIZmlkkBZNOrLVlyC3sXkLM56iOez2jQJWyzgDq8lk@vger.kernel.org, AJvYcCXVExS8TcaZA597PUWyzEwQjJf/NYUTKE4yfAgLcxkgQENr7h6WkI4l4vnVVWFIvy5Wjx6DxlT+D/CVRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWo24QsIOfX0XqvYclOcFXktc74KanMFjBH7ypYGkrXVO3QSq
	dY3d4GM8ZkwuCVCfvgfdBkr4b+uvnsaKbHg/GHw/iG5By8JIse87
X-Gm-Gg: ASbGncuMVg7G6bbE6NZwGEq8r+OLh8azkczL/R8S8QaLBbNqifYOUwGV8qDLeE9Igkq
	q7uxeTstG8ke2nFj53qaI3ii4MO/+jKyEk+kugd9Eaz3ysVQGP3z4giDH/WyeBTUBNNy6xue+FS
	NOBQbEjI8kOvPVesfBng8hC8+LOsMeajL8/9KT+cEem+1vSWze0N/P3Dy4f/DnIQjW4SJPc1Z4C
	XOSeB0SrjaVdBetK0IWgDdflsj2n1Qe4yASbRdUZaLu1aM2CA9MGTgB7Bs4TQvAtpu9rIlvrqxc
	cTb5mNVvAc+/1rhyExP6NDTY7AVo4Q==
X-Google-Smtp-Source: AGHT+IEgR/olPlTuq1cflAd0ilh1YPOb4/Y4cRuTVkc+Dlbaj10rqBVjRqco6nU+77LTtvzd6iJ4Kw==
X-Received: by 2002:a05:6a20:728b:b0:1e1:aab8:3887 with SMTP id adf61e73a8af0-1e5b489b0abmr10161474637.39.1734580214278;
        Wed, 18 Dec 2024 19:50:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e32f7ea0sm205840a12.78.2024.12.18.19.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 19:50:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f1999b7b-312c-4bc5-96f2-a14ce4ae241f@roeck-us.net>
Date: Wed, 18 Dec 2024 19:50:11 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] hwmon: (acpi_power_meter) Fix using uninitialized
 variables
To: "lihuisong (C)" <lihuisong@huawei.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jdelvare@suse.com, liuyonglong@huawei.com, zhanjie9@hisilicon.com,
 zhenglifeng1@huawei.com
References: <20241125093415.21719-1-lihuisong@huawei.com>
 <20241125093415.21719-2-lihuisong@huawei.com>
 <aa6e1c02-b8bf-4d25-ad21-2018af72e16f@roeck-us.net>
 <b801388b-6bc7-5e96-dd29-e68ed8c970df@huawei.com>
 <f9fc4989-f416-4d88-bc3e-ab7b9fddb4d9@roeck-us.net>
 <c66d312a-098a-84d3-0895-02d78ae3ecc9@huawei.com>
 <77fce1aa-96eb-4c3c-ab0a-a33de46b333b@roeck-us.net>
 <87367d88-b10e-29d6-2712-f8f5c24e52a4@huawei.com>
 <1ce7718c-0bf8-4009-9240-fc6e2363ed54@roeck-us.net>
 <2068a450-7752-c47b-edfc-cb2a00ac4402@huawei.com>
 <b2ea68c5-2bcb-3d3a-565a-94a35a48629e@huawei.com>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <b2ea68c5-2bcb-3d3a-565a-94a35a48629e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/18/24 19:45, lihuisong (C) wrote:
> 
> 在 2024/12/12 11:00, lihuisong (C) 写道:
>>
>> 在 2024/12/12 9:51, Guenter Roeck 写道:
>>> On 11/26/24 19:43, lihuisong (C) wrote:
>>>> Hi Guenter，
>>>>
>>>> How about the modification as below? But driver doesn't know what the time is to set resource->power_alarm to false.
>>>>
>>> It's a start, but incomplete because power_alarm must be reset.
>>>
>>> See below.
>>>
>>>> 在 2024/11/27 0:19, Guenter Roeck 写道:
>>>>> On 11/25/24 23:03, lihuisong (C) wrote:
>>>>>>
>>>>>> 在 2024/11/26 12:04, Guenter Roeck 写道:
>>>>>>> On 11/25/24 17:56, lihuisong (C) wrote:
>>>>>>>> Hi Guente,
>>>>>>>>
>>>>>>>> Thanks for your timely review.
>>>>>>>>
>>>>>>>> 在 2024/11/26 0:03, Guenter Roeck 写道:
>>>>>>>>> On 11/25/24 01:34, Huisong Li wrote:
>>>>>>>>>> The 'power1_alarm' attribute uses the 'power' and 'cap' in the
>>>>>>>>>> acpi_power_meter_resource structure. However, these two fields are just
>>>>>>>>>> updated when user query 'power' and 'cap' attribute, or hardware enforced
>>>>>>>>>> limit. If user directly query the 'power1_alarm' attribute without queryng
>>>>>>>>>> above two attributes, driver will use the uninitialized variables to judge.
>>>>>>>>>> In addition, the 'power1_alarm' attribute needs to update power and cap to
>>>>>>>>>> show the real state.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>>>>>>>>>> ---
>>>>>>>>>>   drivers/hwmon/acpi_power_meter.c | 10 ++++++++++
>>>>>>>>>>   1 file changed, 10 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
>>>>>>>>>> index 2f1c9d97ad21..4c3314e35d30 100644
>>>>>>>>>> --- a/drivers/hwmon/acpi_power_meter.c
>>>>>>>>>> +++ b/drivers/hwmon/acpi_power_meter.c
>>>>>>>>>> @@ -396,6 +396,9 @@ static ssize_t show_val(struct device *dev,
>>>>>>>>>>       struct acpi_device *acpi_dev = to_acpi_device(dev);
>>>>>>>>>>       struct acpi_power_meter_resource *resource = acpi_dev->driver_data;
>>>>>>>>>>       u64 val = 0;
>>>>>>>>>> +    int ret;
>>>>>>>>>> +
>>>>>>>>>> +    guard(mutex)(&resource->lock);
>>>>>>>>>>         switch (attr->index) {
>>>>>>>>>>       case 0:
>>>>>>>>>> @@ -423,6 +426,13 @@ static ssize_t show_val(struct device *dev,
>>>>>>>>>>               val = 0;
>>>>>>>>>>           break;
>>>>>>>>>>       case 6:
>>>>>>>>>> +        ret = update_meter(resource);
>>>>>>>>>> +        if (ret)
>>>>>>>>>> +            return ret;
>>>>>>>>>> +        ret = update_cap(resource);
>>>>>>>>>> +        if (ret)
>>>>>>>>>> +            return ret;
>>>>>>>>>> +
>>>>>>>>>>           if (resource->power > resource->cap)
>>>>>>>>>>               val = 1;
>>>>>>>>>>           else
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> While technically correct, the implementation of this attribute defeats its
>>>>>>>>> purpose. It is supposed to reflect the current status as reported by the
>>>>>>>>> hardware. A real fix would be to use the associated notification to set or
>>>>>>>>> reset a status flag, and to report the current value of that flag as reported
>>>>>>>>> by the hardware.
>>>>>>>> I know what you mean.
>>>>>>>> The Notify(power_meter, 0x83) is supposed to meet your proposal IIUC.
>>>>>>>> It's good, but it depands on hardware support notification.
>>>>>>>>>
>>>>>>>>> If there is no notification support, the attribute should not even exist,
>>>>>>>>> unless there is a means to retrieve its value from ACPI (the status itself,
>>>>>>>>> not by comparing temperature values).
>>>>>>>> Currently, the 'power1_alarm' attribute is created just when platform support the power meter meassurement(bit0 of the supported capabilities in _PMC).
>>>>>>>> And it doesn't see if the platform support notifications.
>>>>>>>>  From the current implementation of this driver, this sysfs can also reflect the status by comparing power and cap,
>>>>>>>> which is good to the platform that support hardware limit from some out-of-band mechanism but doesn't support any notification.
>>>>>>>>
>>>>>>>
>>>>>>> The point is that this can also be done from userspace. Hardware monitoring drivers
>>>>>>> are supposed to provide hardware attributes, not software attributes derived from it.
>>>>>>>
>>>>>> So this 'power1_alarm' attribute can be exposed when platform supports hardware enforced limit and notifcations when the hardware limit is enforced, right?
>>>>>> If so, we have to change the condition that driver creates this sysfs interface.
>>>>>
>>>>> This isn't about enforcing anything, it is about reporting an alarm
>>>>> if the power consumed exceeds the maximum configured.
>>>>>
>>>> -->
>>>>
>>>> index 2f1c9d97ad21..b436ebd863e6
>>>> --- a/drivers/hwmon/acpi_power_meter.c
>>>> +++ b/drivers/hwmon/acpi_power_meter.c
>>>> @@ -84,6 +84,7 @@ struct acpi_power_meter_resource {
>>>>          u64             power;
>>>>          u64             cap;
>>>>          u64             avg_interval;
>>>> +       bool            power_alarm;
>>>>          int                     sensors_valid;
>>>>          unsigned long           sensors_last_updated;
>>>>          struct sensor_device_attribute  sensors[NUM_SENSORS];
>>>> @@ -396,6 +397,9 @@ static ssize_t show_val(struct device *dev,
>>>>          struct acpi_device *acpi_dev = to_acpi_device(dev);
>>>>          struct acpi_power_meter_resource *resource = acpi_dev->driver_data;
>>>>          u64 val = 0;
>>>> +       int ret;
>>>> +
>>>> +       guard(mutex)(&resource->lock);
>>>>
>>>>          switch (attr->index) {
>>>>          case 0:
>>>> @@ -423,10 +427,21 @@ static ssize_t show_val(struct device *dev,
>>>>                          val = 0;
>>>>                  break;
>>>>          case 6:
>>>> -               if (resource->power > resource->cap)
>>>> -                       val = 1;
>>>> -               else
>>>> -                       val = 0;
>>>> +               /* report alarm status based on the notification if support. */
>>>> +               if (resource->caps.flags & POWER_METER_CAN_NOTIFY) {
>>>> +                       val = resource->power_alarm;
>>>> +               } else {
>>>> +                       ret = update_meter(resource);
>>>> +                       if (ret)
>>>> +                               return ret;
>>>> +                       ret = update_cap(resource);
>>>> +                       if (ret)
>>>> +                               return ret;
>>>> +                       if (resource->power > resource->cap)
>>>> +                               val = 1;
>>>> +                       else
>>>> +                               val = 0;
>>>> +               }
>>>
>>> It would have to be something like
>>>
>>>         ret = update_meter(resource);
>>>         if (ret)
>>>             return ret;
>>>
>>>         val = resource->power_alarm || resource->power > resource->cap;
>>>         /* clear alarm if no longer active */
>>>         resource->power_alarm &= resource->power > resource->cap;
>>>
>>> This ensures that alarms are cached if supported, and that cached values are
>>> reported at once. It is far from perfect but the best I can think of since
>>> there is no notification that the alarm is cleared.
>>>
>> Indeed, since there is no notification that the alarm is cleared, driver have to compare 'power' and 'cap' to clear it anyway.
>> If platform support notify to OSPM, driver also need to update 'power' to show this alarm status.
>> In this case, no need to update 'cap' which can be updated by nofity 0x82 event, right? But this also depands on the initialization of the "resource->cap" the probe phase needs to add.
>> For the platform doesn't support notify, driver have to update 'cap' and 'power' to show this status, right?
>>
>> But considering above two cases, directly to update 'power' and 'cap' is simple to handle this without more switch case.
>> what do you think, Guenter?
> 
> Hi Guenter,
> 
> What do you think? Looking forward to your reply.😁
> 

This is getting too complicated for a reply after a casual glance at the driver,
and I don't currently have time for a deeper look into the driver, sorry.

Guenter

> /Huisong Li
> 
>>>
>>>>                  break;
>>>>          case 7:
>>>>          case 8:
>>>> @@ -853,6 +868,7 @@ static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
>>>>                  sysfs_notify(&device->dev.kobj, NULL, POWER_AVG_INTERVAL_NAME);
>>>>                  break;
>>>>          case METER_NOTIFY_CAPPING:
>>>> +               resource->power_alarm = true;
>>>>                  sysfs_notify(&device->dev.kobj, NULL, POWER_ALARM_NAME);
>>>>                  dev_info(&device->dev, "Capping in progress.\n");
>>>>                  break;
>>>>
>>>>> .
>>>>
>>>
>>>
>>> .
>>
>> .

