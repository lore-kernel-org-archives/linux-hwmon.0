Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ACD344021
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782776157; cv=none; b=n9UEoaf+pk1Cw6G7vnqonMxwswZ+N5tVWNupVIXJKMwlle6PZbukFrIQ/N6vH0s1vPdu8jsNfy64HMdUIr+2CdqVxXIPE02uVFzGEYnzcEizpZmzhPsIio1DhVGPhlNMKFx31ZS9oEokQGO8YOr3t8HetRrCuQzcZkmQT+sFr90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782776157; c=relaxed/simple;
	bh=xUMIBALFPVNwnmPmh0J9Gd+kqaFVFdmAlpKJYLjuBYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=trs9pgQvMsxjrDpe64GF+VtfCRlVmkJgWLN2b33FC2ShAFWxVoohTz2qcprVSU3a2j2P9WW93NkMxnzDWiTK2VBDtKiJ01qZGtJ4S1Qh/kFr5qgzUui1f3p8URAHfek+peb/UX1k5Iy5kPvBYlBu8d6zOVFQMABtCYxzUmSJZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaykXtfj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaykXtfj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c9e89fded0so15817575ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 16:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782776155; x=1783380955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBRjjfWt7HST0aY+A5rk5XGMaVuDnutfJRL8vm4mSk0=;
        b=DaykXtfjtDi5bBvY/TRPYmb5tfd3LTOQ2+oP4SSDt3Ort6RpLEzvPw4BijO8vBvMc0
         SmakI5BD3Z6JHupTkz3f9JJ1Pj0Do/mFIcDtF8Xu/1tf7oYBEq1cRBLRfj6jl9XUV/r9
         N8YUqlfRdeCVjTXPPlcfdbF1ABcuNhsQ06mldXPhpysEfK8abQtiXbPZmttFDUIkG1gM
         8KQ2SBWEoUiFvTAyhaEmcx7fgBCHftP2e09ia3zeKPhtwJK2A7fqGV53H0CNjOykT9S+
         7kOx0owqfvpR3H5PoVF1U2SVeqzvrsINBsjg58p0POYl8N+qWavjHW/BGDidI2p9WKMs
         5nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782776155; x=1783380955;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sBRjjfWt7HST0aY+A5rk5XGMaVuDnutfJRL8vm4mSk0=;
        b=BWHcePhRBU6X03+5Di0OF7QR0QfWRnjxXnndjaYUpLUl34kOGDHROYHkf/KNyGGf+N
         yF/pXzGc7eePALaCJG35GdSTDsin8I7IynOcvZxAg5D24L1MsTAyvgL4c+tOCRoYMwBy
         xwEBaTTnp4kHOgHlUki0UnGfJQb91e/aiqLmucDng7q0XD1W15GO0/5h99k0zcIES6LP
         Vd7GWt9DBMDyYc3oWJ5qZvNzBT5koAKR6Vfrnj5P+W8+2PN4s7xsJ5CGR1AnbxEj5YD0
         JlFwhfvtkAnmOHu22JXQhwSoU9WN7fo2gUVwtm0MZMNATH5+E4tfNCA6IEQ/yBrFdcqX
         SCsg==
X-Gm-Message-State: AOJu0Yz9G3PMYlCFZowzHfxj20MmFVlHRnNgSuFs58b1Iu6My3t84iWk
	LHzIQx1yFHoHwF4Mg9pbnqcwJZo+4m5Fc1GzEfPIJ8wH93N5YbZLaRwHcwReVA==
X-Gm-Gg: AfdE7clQowP2QRypS/4mydusYyqPXBy68hbDaWXEZnywLYuaLRqWBUlm/ng8i9cRmxh
	tnP4o5kW2rf6AHjEpJHkEPtOImMvdUmEisiDp8l3D5J58zr4hZAC+GxkTlqbX+FaW8NLdjGqMCN
	RcZ6rdb4hQ9sG86R2gZfR4ogmsJgYy05yajRgW2B8uJ/3G0OWR8BZ3pvVuB7knJpQfdjeyV/Ya3
	Wt3EhIbfEkmpFbbT174iAIaBjm7syByGW3XuR33uQJr3UTox6+RzjnHjPgLdTgSSS1OVXT0Awob
	rDUqUr5AeimfX6SxyRKVv06k2s4EXgc2/0ZVBZFPz58MZ8dbNEk0I9BG4t/OAgG9KqPmHXPNFBZ
	fJxIu0pn8Cm3noho3tdD1ocUTNDATzrOqif2RHBIwZ4IiBqyXj1gxxjLwxkNUqh/6PfnVtr/LVH
	S7hbQ7Qoj4DglTl9OvShykwNGUWCRrC/oTCB5Q+QC1G/KetXLQQedxwA7NUuFJaA==
X-Received: by 2002:a17:902:dac8:b0:2c9:854c:a45c with SMTP id d9443c01a7336-2ca2ea2dd72mr10644665ad.34.1782776154817;
        Mon, 29 Jun 2026 16:35:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c7e1sm1422605ad.53.2026.06.29.16.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 16:35:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <876f5188-4fb7-4147-b452-5468425cf8b8@roeck-us.net>
Date: Mon, 29 Jun 2026 16:35:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] hwmon: (occ) Fix sysfs device unreg deadlock
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260625164700.2797362-1-ninad@linux.ibm.com>
 <20260625164700.2797362-2-ninad@linux.ibm.com>
 <20260625165954.B7A301F00A3A@smtp.kernel.org>
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
In-Reply-To: <20260625165954.B7A301F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 6/25/26 09:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] Releasing the driver lock before unregistering the hwmon device introduces a data race on the shared `occ->group` structures.
> - [High] Pending sysfs reads execute hardware access via `occ_poll()` after the device has been explicitly deactivated due to a missing `occ->active` check.
> 
> Pre-existing issues:
> - [High] The exact same sysfs unregistration deadlock fixed in `occ_active()` remains unfixed in `occ_shutdown()`.
> - [High] Repeatedly toggling the OCC active state via sysfs causes an unbounded memory leak due to `devm_kcalloc` allocations that are never explicitly freed.

The driver apparently has a number of issues. I understand that not all of them
can be fixed immediately, but it looks like this patch introduces new problems.
Please have a look.

Thanks,
Guenter

> --
> 
> commit 834d342f5072edda5a28c9ccd24f73161c2356f5
> Author: Ninad Palsule <ninad@linux.ibm.com>
> 
> hwmon: (occ) Fix sysfs device unreg deadlock
> 
> This commit addresses a deadlock when unregistering the hwmon device by
> releasing the driver lock before calling hwmon_device_unregister(). This
> allows pending sysfs operations to complete without blocking unregistration.
> 
>> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
>> --- a/drivers/hwmon/occ/common.c
>> +++ b/drivers/hwmon/occ/common.c
>> @@ -1149,15 +1149,22 @@ int occ_active(struct occ *occ, bool active)
>>   			goto unlock;
>>   		}
>>   	} else {
>> +		struct device *hwmon_dev = occ->hwmon;
>> +
>>   		if (!occ->active) {
>>   			rc = -EALREADY;
>>   			goto unlock;
>>   		}
>>   
>> -		if (occ->hwmon)
>> -			hwmon_device_unregister(occ->hwmon);
>>   		occ->active = false;
>>   		occ->hwmon = NULL;
>> +
>> +		mutex_unlock(&occ->lock);
> 
> [Severity: High]
> Could releasing occ->lock here expose the shared occ->group structures to
> concurrent modification?
> 
> If one thread unregisters the device while another thread concurrently
> activates it, the activating thread calls occ_setup_sensor_attrs() which
> dynamically reallocates the attributes:
> 
> occ_setup_sensor_attrs()
>      ...
>      occ->group.attrs = devm_kcalloc(...)
> 
> Since the unregistering thread is simultaneously iterating over occ->groups,
> does this risk a NULL pointer dereference in sysfs_remove_file() due to
> reading an uninitialized pointer?
> 
>> +
>> +		if (hwmon_dev)
>> +			hwmon_device_unregister(hwmon_dev);
> 
> [Severity: High]
> Since occ->lock is dropped before unregistering, could pending sysfs accesses
> now communicate with deactivated hardware?
> 
> If a sysfs read or write is waiting for occ->lock in occ_update_response() or
> occ_set_user_power_cap(), it will wake up once the lock is released here.
> Because those functions do not verify if occ->active is still true after
> acquiring the lock, will they proceed to call occ_poll() or send_cmd() on a
> device that has just been deactivated?
> 
>> +
>> +		return 0;
>>   	}
>>   
>>   unlock:
> 
> [ ... ]
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the exact same deadlock
> still exist in occ_shutdown()?
> 
> Looking at occ_shutdown():
> 
> occ_shutdown() {
>      mutex_lock(&occ->lock);
>      occ_shutdown_sysfs(occ);
>      if (occ->hwmon)
>          hwmon_device_unregister(occ->hwmon);
>      ...
> }
> 
> Since this continues to hold occ->lock while unregistering the hwmon device,
> wouldn't a concurrent sysfs read waiting for occ->lock in
> occ_update_response() cause an AB-BA deadlock during driver unbind?
> 
> [Severity: High]
> This is a pre-existing issue, but does repeatedly toggling the active state
> via sysfs cause an unbounded memory leak of occ->attrs?
> 
> When the device is activated, occ_setup_sensor_attrs() allocates arrays:
> 
> occ_setup_sensor_attrs() {
>      occ->attrs = devm_kcalloc(dev, num_attrs, sizeof(*occ->attrs),
>                                GFP_KERNEL);
>      ...
> }
> 
> Since these are devres allocations, they are only cleaned up when the platform
> device unbinds. When occ_active is toggled to false, they are not explicitly
> freed. If a management script repeatedly writes to the occ_active sysfs
> attribute, will this continuously leak occ->attrs and occ->group.attrs?
> 

