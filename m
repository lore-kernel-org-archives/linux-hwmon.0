Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32354347535
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 20:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772570537; cv=none; b=qGNz0csQO7pMCwxYUP2hwOzn+wcCy3nN5NaN8M4KYrzOmIySicFqeW7dvm0AeD90x8QC025Z2sUs3sx6bEBXmXLqn3RlsxfCfshPkulxh6fjA5nMQFPQA1Fag17gXoqZm/7A1TBDsC5x9jwXPHhAYUpzGCRPKmW9SJ5SN/TJTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772570537; c=relaxed/simple;
	bh=vzBFx4evnBTa7E2dlBm4ELnNDF6x5xalbTNnpdUEqoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObdCyxXwy+xvF8dTFoHwsglTlhAYoU2pyqdBE6GSSqM5UJajS1qXmboKKq+PldIl+RHNhuHmfHlOoATCAac+/QbCrhbOBxqcr1TfWOTAA+VV63Hb3POjUVD/u+PaBcE5sN0aW94M+4+SgUV4rZZ2UKaCOT4dy0AEFloGApHXmro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzYSTOjB; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzYSTOjB"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdd80beee1so1942232eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 12:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772570535; x=1773175335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t9gfebauMAuHMIdiLQhr6K7nq5Xi5Dh492EQEuK+SJc=;
        b=OzYSTOjBHcUrgMa6X6+BFK0u3KweAZetow7/JMdQnb7geQF1/wcRO84X9Gvcn6MQyD
         djRUPWRT2BmhhUqaSPt+Unlsicohw29WfQHggBhKf44FBoRUdG6qSnoHZw1Am9qsXWP6
         z2sHLAhjD3hJsoarKfAxDGRON1/qaRpz+MHqmk120C1EXXvLOzBvN3z/uzoyHZN4R0zd
         oES/6Tum5GgUE/idhL0xoeKLfPf5bFW5pQiYZPMKsWlIWt+fYA8DFBheJuuJW/Cl/W4m
         lnDMtop20dFBcSRlYetrSEy3uo18nHdFqQoFIO4S0Mvm7ssXeOFC7T+tteHPGm9X6fMP
         V1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772570535; x=1773175335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9gfebauMAuHMIdiLQhr6K7nq5Xi5Dh492EQEuK+SJc=;
        b=LSTxlswBAE3fWNIqKufuP97smHgPOxGFVw7vMPknF9ux5CLAr8tzU2rMwK5WRz8Gci
         GdKGEM1nk2RKbEGyh6NluNP5ypK4ar8Zr+ddGw/Ob2nzMOr3MWbV0TVc0TBZOOaOsLsa
         TDVYqPQoWZEJa7a1OAufG5d/7XRrf2rDVSFyIppSE5vhQnNqdr/tX+u+CoOLj7BwMM3a
         yHxplIebnRzCPTkREC3+DG3QuOBnM4vxsWxn5qTSpwcZfmD7zeZ3biCBzC30z8oALt4l
         sRxhFyO6vxji35AXYcdk0YOhfGjOSl2EK+W/iecFoLjWk7IWDHlVX7rlZWnqHAJP7myG
         xxCg==
X-Forwarded-Encrypted: i=1; AJvYcCXgihC7IUBaCid+eG/eA33Gtc9sksq/tJBJxRBtwN/7I351MlZ6SYG2IDH0LU/checp12uHru4nzJpjaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWA2LROl1wkUxFsQmnD0g8lfwxMIGhAdOURh4auGZTXftdl5xx
	zoU7fWkmiJKehC+9uBHss321l591FOHqM31D3+y5g/U47/Y2G9GVjXuP
X-Gm-Gg: ATEYQzy0SvnZQnniYtvpSvYbaO1p/KEV/+Rpstx540e1SBAY+8lnEk8+MIZFuXNy1K7
	DxQqPtpYfR0LCWV4bq4ZA3ZngFPvq8/W1as9gjrLtzayrvuHYOKlIY7+E3dXLqTijzfSWZtcxc/
	FFF6QFSiz8h+xBa+JAaL1A+K+81v7iPrBCs3kCDKDr5ldwRxnEOk1vXelOrj1ZJj+g0sa1aNDBo
	P5Uuj9ZEjYty4FdIb/45ozasWk7dZkvSHtVgR8q+k6D/cl48uy3PjcjkZoMvjrX1J4Gs7kUBeUp
	7jhOrFfHT+M6df38fR6EPkWkLbO4Mf3eI0ANq2D8oTe37lKa0ZBwNVvGOI7W/n8LYis27iNhi2G
	KxVjAdrkYNc9Omvcu9CxoCccaY2tEAKihANZD720RAk4DrUVevlTR5JowOpnMX+KxX8B4lczaQH
	0PLXj8b7ySf5IlIk1liw/AbloqdisUUJZN+vAXPQ6pUD3r0wvJku43oGaDyqq0sJ9D9Fm3pZQ6+
	Dcgt8XZRCo=
X-Received: by 2002:a05:7301:eab:b0:2bd:816b:734d with SMTP id 5a478bee46e88-2be23974110mr1130937eec.18.1772570535199;
        Tue, 03 Mar 2026 12:42:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1ce921dasm3329714eec.10.2026.03.03.12.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 12:42:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <72010133-5acc-43ac-8372-d0d830291ef0@roeck-us.net>
Date: Tue, 3 Mar 2026 12:42:13 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: add driver for ARCTIC Fan Controller
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Aureo Serrano <aureo.serrano@arctic.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <FR6P281MB590006F97DAC7A5C224D957BEF7FA@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
 <51d91216-8949-44a9-93d9-646d3f3563b1@t-8ch.de>
 <8dd3367b-4a7c-414b-a4f4-41dc54578e2b@roeck-us.net>
 <d1d27763-c49d-4d02-9157-ec798bd10604@t-8ch.de>
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
In-Reply-To: <d1d27763-c49d-4d02-9157-ec798bd10604@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/3/26 11:30, Thomas Weißschuh wrote:
> On 2026-03-03 11:00:25-0800, Guenter Roeck wrote:
>> On 3/3/26 10:10, Thomas Weißschuh wrote:
>>> Hi!
>>>
>>> On 2026-03-03 08:25:04+0000, Aureo Serrano wrote:
>>>>   From 1cc962124ca4343e682219372b08dec5d611d1af Mon Sep 17 00:00:00 2001
>>>> From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
>>>> Date: Tue, 3 Mar 2026 15:06:35 +0800
>>>> Subject: [PATCH] hwmon: add driver for ARCTIC Fan Controller
>>>>
>>>> Add hwmon driver for the ARCTIC Fan Controller (USB HID VID 0x3904,
>>>> PID 0xF001) with 10 fan channels. Exposes fan RPM and PWM via sysfs.
>>>> Device pushes IN reports ~1 Hz; PWM set via OUT reports.
>>>>
>>>> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
>>>> ---
>>
>> checkpatch reports:
>>
>> total: 11 errors, 53 warnings, 6 checks, 360 lines checked
>>
>> primarily because the patch uses spaces instead of tabs.
> 
> It looks like it was pushed through some Microsoft mail product with
> copious amounts of force.
> 
> (...)
> 
>>>> +     }
>>>> +     for (i = 0; i < ARCTIC_NUM_FANS; i++) {
>>>> +           priv->fan_rpm[i] = (u32)(buf[rpm_off + i * 2] |
>>>> +                             (buf[rpm_off + i * 2 + 1] << 8));
>>>
>>> get_unaligned_u32()
>>>
>>
>> That doesn't seem to exist. get_unaligned_le16(), maybe, but the data
>> is never unaligned. le16_to_cpup() might do.
> 
> Indeed, get_unaligned_le16() is the one.
> Does the HID core guarantee that raw event buffers are always aligned
> sufficiently to access them as *u32? Personally I don't know all the
> alignment requirements of all the supported architectures.
> get_unaligned_le16() will always do the right thing and avoids typecasts.
> 

Good point.

> (...)
> 
>>>> +     } else {
>>>> +           spin_unlock_irqrestore(&priv->lock, flags);
>>>
>>> You can use the new guard() syntax from cleanup.h to avoid manual
>>> unlocks on error paths.
>>>
>>
>> Why would this code need interrupt disabled spinlocks in the first place ?
> 
> I *suspect* that it tries to be compatible with some semaphores in the
> HID core.
> 
>> It reads individual entries from priv, but even if those are updated
>> in parallel I don't see why that would warrant disabling interrupts,
>> both here and in arctic_fan_parse_report().
>>
>> The hwmon core already serializes read and write operations, so
>> the locks (much less interrupt disabling spinlocks) are not needed
>> for that either.
> 
> The HID callbacks can be fired at any time from the HID core,
> concurrently to hwmon core logic. But I also dislike the spinlocks.
> Maybe a mutex works, too?
> 

Ah yes, I can see that arctic_fan_parse_report() reads all pwm values and
arctic_fan_write() writes them to the controller. That does not explain
why it would be necessary to disable interrupts, though, and even doing
that is still not safe.

Example: arctic_fan_write() updates the pwm value for channel 1,
writes the new value into priv->pwm_duty[1], and creates an output
buffer with pwm values for all channels. After preparing the message,
it releases the spinlock. The raw event handler receives and handles
updated pwm values which are completely different. Then the old,
now obsolete, values are sent to the controller (and, worse, the
new cached value in priv->pwm_duty[1] would no longer match the value
that was just sent to the controller).

That can never be made safe if the controller updates pwm values
autonomously, no matter if spinlocks are involved or not. That would only
work if fan control is manual, and in that case it would not be necessary
to re-read pwm values from each raw event. The current code isn't safe
even if fan control is manual, since reports from the controller will
overwrite cached values and requests to change a value can overlap with
reports returning the old value.

In this context ...

Other drivers also use complete() from raw events and wait_for_completion()
variants after writing a command, so the code sequence in arctic_fan_send_report()
will require closer scrutiny. It is not obvious to me why the loop and the
msleep() calls would be needed for this driver but not for others.

> (...)
> 
>>>> +static int arctic_fan_probe(struct hid_device *hdev,
>>>> +                     const struct hid_device_id *id)
>>>> +{
>>>> +     struct arctic_fan_data *priv;
>>>> +     struct device *hwmon_dev;
>>>> +     int ret;
>>>> +
>>>> +     ret = hid_parse(hdev);
>>>> +     if (ret)
>>>> +           return ret;
>>>> +
>>>> +     priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
>>>> +     if (!priv)
>>>> +           return -ENOMEM;
>>>> +
>>>> +     priv->out_buf = devm_kmalloc(&hdev->dev, ARCTIC_REPORT_LEN, GFP_KERNEL);
>>>> +     if (!priv->out_buf)
>>>> +           return -ENOMEM;
>>>
>>> The 32 byte buffer could be on the stack, saving this allocation and
>>> avoiding a shared resource.
>>
>> It might need to be cache aligned, but even then it could be part of
>> struct arctic_fan_data.
> 
> What would be the advantage of that over an on-stack placement?
> 

Sorry, I should have said "cache line aligned", not just "cache aligned".
Data on the stack won't be cache line aligned. I don't know if that is needed
here, but some USB transactions require it (which is why USB drivers often
allocate buffers separately).

>>>> +
>>>> +     priv->hdev = hdev;
>>>> +     spin_lock_init(&priv->lock);
>>>> +     hid_set_drvdata(hdev, priv);
>>>> +
>>>> +     ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
>>>> +     if (ret)
>>>> +           return ret;
>>>> +
>>>> +     ret = hid_hw_open(hdev);
>>>> +     if (ret)
>>>> +           goto out_stop;
>>>> +
>>>> +     hid_device_io_start(hdev);
>>>> +
>>>> +     hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
>>>> +                                          priv, &arctic_fan_chip_info,
>>>> +                                          NULL);
>>>
>>> You could assign directly to priv->hwmon_dev.
>>
>> I don't immediately see where priv->hwmon_dev is used in the first place.
> 
> Indeed.
> 
> 
> Thomas

