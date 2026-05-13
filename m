Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE53A6EF6
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695831; cv=none; b=KmDhcrvDdtxTn/vu34FhDtifgyt2l6ETikk8NSd4WdjJqmOa17SMjf0zb5WflIbWx+ZElJB9Z4vCTZKCZKkMCqhOq+tE88lMUIsfnwlgO/s0VYQpYVoUIJd3YwnMhjX+55UgJz5VQ8jD60i8D/iZhe1LjQhmkD1Sge2L705sYMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695831; c=relaxed/simple;
	bh=NCE2MRMxYfPSlJJDT5GpL92eWwNvz7mCIZjJ+16ReT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLNRF7nyoBsagPhgVp4L512unntW9TWbg/vsurH0mqvVlxlYKE09fKCshpZ+L/Thp/oWCK9uooeqkBgHefMrrVaSSy9N2YWrpDllH5qSgV0YSySL2nuz7PhgbVzB/0BtLzQ3LhnxGoe8iiWq3fl49C2TElFfPLsuWF37sGcYigU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0I3CnKV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0I3CnKV"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba1e9d3687so47181275ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 11:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778695829; x=1779300629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WRGdkP9yJDWQqY/B/xgC7DJ566o7Fg3ddvkuKLCXLo0=;
        b=e0I3CnKV9CZTH5Q1lsWnXDKMOhxx5WcFQbQqa7RbymMIzf0ubt0bLL7Q0e0bnrJ3IU
         iPNj6ZufHwqKKLraz8lNwguTo4BVMB9rEL3NsuPlQmxPN7VgBql5Bf9iqPx/wcwy9zhI
         +77P+u4MXKiX2zdpQqeE51+6m1Jb4jvOsJ0Z1KISrR3PAEVxAEBEeXbXmnQ79izAhMwi
         y7YUx3jGyaH8Go6uKUvc+5QRuRjt3FXeBQxPPYALgbGyO1LZ0I1CGubE9eKKzWUiDVTw
         60UMnQfnMPVE/6O52QZU+i+3ocS20YCfc6jt/VRPGK/prB3tE4QJ7S+ZUCDD10V7iDt/
         8G5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778695829; x=1779300629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRGdkP9yJDWQqY/B/xgC7DJ566o7Fg3ddvkuKLCXLo0=;
        b=bNKQb3/nPpfHRUxtDTZp8Juwweb5IaJwKbIlw9XWHqIt3uK8qJaInsnEd8Wf8x85wG
         LjKElfQLO+jAm7Hq+/lS2BLaRX2a67Xswg8klxVxg2//LCBYs/tbyiW8fqc2wmTsLiJV
         TA76hzakmocY5gGiiHanTr/W777uC3ICWpsjTT/8uVnqevIC9i2rhcrFTsLHowHfKBzc
         G6b3cLf/SY7gk4+zVttQ2BOyEM22Ahdh/WFvU0Fw78y+/B/JdcxnPPpaj7nPTEE80iwq
         ZUjtQsHqrxzfwQLPf3Okldl84DDcJKXQJAcg1r1nVjVhe3RNM90IIM00l+HzwAPch+br
         mO6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+MxhCryG38OW6mYvdY7uTMQUFwStzmzNZWAFq1lp8Co6rnaAloTmzzall2IGpKyKn6M8czUkjGH10Ivw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybXA2B8QTH5Rg+LPW8VTJnA3lF5j1CiS+nvlmfA1pg2G/15OUp
	wywMv5/2rMdC+0L/Tm7vCalIXCdVtk6xWgz7IKwVZAGZmSoNbUNrH8li
X-Gm-Gg: Acq92OEb/gM1lBJcZm/LnHoM5JlxD0EDHNSBYVUzFN2xJigcz+KPSLHlfiioPYEcnww
	A9WXJRIvTapfvo/U4uYA9/0fTZd9D4cgCW2MjrowUeLyjyV0hTDslePWEI0h7Zuk619DZgexBxm
	HeyNa/brY3yxnXylBnYLozJn3UHzHzEetD617ucVMTUMoaLlJSfoDUUmW9fEiuFLUzKXJvRjytw
	V5wh9h8eAdmRxQxkRuxJsW9JZ0Aq6YNMVbDbG2r4RL8OBhOftIAMX2EnLlF+JtpZlvAy2aPREZ9
	54WLNhkjli0vwOiN1r6X8yUvgdqAtS/wEnJhUsM9QIOBBrAlkDAccl18vrTEyFs2+D3G1Rhep3O
	GD0OnsBl6cGMIUceLRCo38ByejvXWte709RGKZtLRIznGB0ZpejoCYFaxTFzijUbL2QF5Q5lnrD
	zwee2JTjABzdv/uX6ywgzN+D9+kcZPKyKqhL8nUZq26pKMSDJUt/07mQ8r12GtTAHwwmyQ1+Bj
X-Received: by 2002:a17:902:bd43:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2bd3022bc2cmr30436545ad.28.1778695828325;
        Wed, 13 May 2026 11:10:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ebe7f1sm156578215ad.78.2026.05.13.11.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:10:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d16eca10-59bd-48f8-9bd2-d7f14a3952bf@roeck-us.net>
Date: Wed, 13 May 2026 11:10:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
 <5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
 <bde0fa1e-93a5-4819-aa19-04554c24d31c@roeck-us.net>
 <20260513162135.2893e42d@posteo.net>
 <254b59a8-182f-4ad3-8469-4f9e9511d3a5@roeck-us.net>
 <20260513175350.07900558@posteo.net>
 <62e02950-e31b-4faa-8b36-98bbfe898367@roeck-us.net>
 <20260513195027.028b7b63@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260513195027.028b7b63@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 10:50, Wilken Gottwalt wrote:
> On Wed, 13 May 2026 09:42:08 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Wed, May 13, 2026 at 03:53:51PM +0000, Wilken Gottwalt wrote:
>>> On Wed, 13 May 2026 07:58:14 -0700
>>> Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>> ...
>>> Okay, that will get a bit complex now, because I added my hack and I see
>>> exactly what I assumed is happening.
>>>
>> ...
>>>
>>> If this does not explain the obvious issue, I have not idea how explain
>>> it further. My English is limited. This is a HID driver with data gathering
>>> functions running in the context of the USB-HID context. Callbacks from the
>>> hwmon and the debugfs subsystem call these data gathering functions, and the
>>> first function in that context, corsairpsu_request(), which can run several
>>> instances in paralellel, needs the mutex.
>>>
>>
>> You don't explain why the patches below are insufficient.
>>
>> I used guard() to keep the changes simple, but hwmon_lock() / hwmon_unlock()
>> would be similar. Please provide evidence that this does not work.
>>
>> Thanks,
>> Guenter
>> --
>>  From aa3ec1484bdd619e8fa2ce569ec653d35fbf3615 Mon Sep 17 00:00:00 2001
>> From: Guenter Roeck <linux@roeck-us.net>
>> Date: Wed, 13 May 2026 07:14:33 -0700
>> Subject: [PATCH 1/4] hwmon: Support guard() and scoped_guard for subsystem
>>   locks
>>
>> Add support for guard() and scoped_guard() for the hwmon subsystem lock
>> to simplify its use.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   Documentation/hwmon/hwmon-kernel-api.rst | 7 ++++---
>>   include/linux/hwmon.h                    | 2 ++
>>   2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
>> index 1d7f1397a827..9fcde32a140d 100644
>> --- a/Documentation/hwmon/hwmon-kernel-api.rst
>> +++ b/Documentation/hwmon/hwmon-kernel-api.rst
>> @@ -85,9 +85,10 @@ removal.
>>   When using ``[devm_]hwmon_device_register_with_info()`` to register the
>>   hardware monitoring device, accesses using the associated access functions
>>   are serialised by the hardware monitoring core. If a driver needs locking
>> -for other functions such as interrupt handlers or for attributes which are
>> -fully implemented in the driver, hwmon_lock() and hwmon_unlock() can be used
>> -to ensure that calls to those functions are serialized.
>> +for other functions such as interrupt handlers, attributes which are fully
>> +implemented in the driver, or debugfs functions, hwmon_lock() and hwmon_unlock()
>> +can be used to ensure that calls to those functions are serialized. Those
>> +functions also support guard() and scoped_guard() variants.
>>   
>>   Using devm_hwmon_device_register_with_info()
>>   --------------------------------------------
>> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
>> index 301a83afbd66..04959e044fd0 100644
>> --- a/include/linux/hwmon.h
>> +++ b/include/linux/hwmon.h
>> @@ -495,6 +495,8 @@ char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
>>   void hwmon_lock(struct device *dev);
>>   void hwmon_unlock(struct device *dev);
>>   
>> +DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
>> +
>>   /**
>>    * hwmon_is_bad_char - Is the char invalid in a hwmon name
>>    * @ch: the char to be considered
> 
> Now I am completely confused. What is that guard() and scoped_guard() patch?

Why do you think I attached it ? Why would I do that if it was already upstream ?
I wrote it this morning, that is why. You'd find it on the mailing list if
you looked.

Ok, fine, I'll send another patch without it if you don't want to apply it
even for testing.

Guenter

