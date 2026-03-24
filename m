Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749813DF00F
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349381; cv=none; b=c+HQ8jbnsAYuzkh23Z3HM7uItChjn7oEksqxFdTZq49R74hrD0yXrf3kA59enFtcXzCT8WL3ysn9WEVJn7+nu8wfMM+/UaTM50vccBHTWyvk+WMo6J7CUlz4LMtfLXqqwPeItMhW7FplfwACwoBnvi/H7Lfw1qM+Hek8ymw+wFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349381; c=relaxed/simple;
	bh=bBTJ5cVFY36aRWUdg7XZBVb400xp1s5RUrHzVP9Wi6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7jHG9XonKOxuJv/i+1mg/wDGgPO/joBIbaBD35OCBIQMO1cUqiEBizkvMIU2V3kFn0dGGTFgsB0zz5Q6SAVNgV5A11CYCSPJ0LWU5Zf/tUNu2hBjr+zDy1fpUAoGfFXCqegTHaLk12v0m/gFJ1Fu+adqaB64bGlOFql6Mdy/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjZiI2zG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bHe1qYUb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjZiI2zG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bHe1qYUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774349379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHtTZ1ATMReSeQxj1Xnlx1wjJusDT0LtDKqx9YtxfEA=;
	b=RjZiI2zG6N8TA7OK9+PguA+Luj1qM1vKkZQEsICw3OWWkVQdUC9eJ+dhHVIZItG2Bth/bH
	j4NRSZ+DXBShdbX/55oY0QgnrgwLWOdLrQYZwhNau1J1M208Pg7IiHldmXKHYJC3LhaPgy
	59Li6kzo3aWSTkIKrNOEoPzfwHCAbUk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-VpgqQ_QwPAuT9vIuQx5Wjg-1; Tue, 24 Mar 2026 06:49:36 -0400
X-MC-Unique: VpgqQ_QwPAuT9vIuQx5Wjg-1
X-Mimecast-MFC-AGG-ID: VpgqQ_QwPAuT9vIuQx5Wjg_1774349375
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-439cbfcfc21so4592657f8f.2
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 03:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774349375; x=1774954175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHtTZ1ATMReSeQxj1Xnlx1wjJusDT0LtDKqx9YtxfEA=;
        b=bHe1qYUb36WuIuL2aFy0yosugG112H/XPt9APf7t47+32MTmu+fnReEkSQZtqlq/Sl
         gmaZ2HHoELaasDAFLe0Rg4uxjxeDw69ZFBSlf8wyndLrmHC9ky7Xj1X35j1FkPjzH4TU
         o/AkTvE7GIbexFvldZ3vIBt4bNPqMh4qi7y0ybaEsL5N4y5jsMV8JHa3gnrIEo0uqUut
         ZSEtuWEfwAMB3dDJ7FTtJtKt+OjFXXsXs/G72F2QU0cYO9VtiE3WsRQcciqasvpE5luK
         78+5n4JY5tRHgP9aqCgw3beVyUK6DE7BkKTTrF5S1gypkNgLVp5cFplTrKLkyUmpq0db
         WnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349375; x=1774954175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHtTZ1ATMReSeQxj1Xnlx1wjJusDT0LtDKqx9YtxfEA=;
        b=iXfIDNaaWS03VT/HdqGBbb67j5Y1GQvLHHKe81G3vv3mGXRhixIXFqYrwnA3HoAyUw
         XFfVhHmwMX8l7JgumLQh7hB68/qv7gkgwYA2gmZ9GU/jh70l9dexLJ/1VRVitjhlVEOm
         mOluQk15Gnm0yxUm8oMPXFU1hJfOSGKxcxzIRas1YBfwfykce7K8y33H+aFr6Xi8w2EE
         SxAso6m3EABPtdDZQ1z79JCNATlXD6Il8xzKYMhdp2PN/oufDqE/YhhI9z1BiYBzB0hH
         5TARDuJ5SCvnZh4U0olfThbvQ+x1PMQ1BP+C1ngDSr9yZMAUkKDsSe92Td/gQeDwxZDT
         OG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkkv+Aqf/gT5pUMdEtsMkd9eVLKnuFUwo3ykEVpzvyrBvQHFJCSlSBlphqIchgNdVbccDPUbJouX/+Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dFmKGsycZ7Zi4ml5ZFZIMpuixXiZN/NHBwhcx6Cz1RNcYIgR
	t3FVVmx1uFj+kP4nmESuy6izzhD9FX+8f94t0Lm+lQ2REsD7RCgtAjeHde8Lvo0rr8PVAJSpoAP
	J5Gh91N7RmBbOp6Bpn4N2Jh4tqKwkcNkxzkB7Nx8Z+9CTY0iJL7l4trRJ0I01F7z0
X-Gm-Gg: ATEYQzwYkZaTMHm+SOcJ47ZuCvoAKdDOfM7WsAGP5/QMCSgVYNj81EV13HR4pXaGPEA
	8+C1bPzlKWkktHywZUkPHnqqW8TwHaAN8Jqa0+Znv/ZrMZPi6sbWVGQRkH4Ogoc8moArfgQSSt9
	FcrPgLzlxQsPk5KoHmH+eKOLZW1v6IbAxKOeMvx5gbuc9CCF6XZsJ2Ghm6s2lllnz5bPYVsh5AV
	cvwFc7HR5SbcZ6WROXjtnTp+qy11Neyw63CvXdXkS+wIXyhSLXPE7HjOmX0YyqiwAexH4ykvlH+
	hGUOyNdEGhZDCVf6EqvLtHht250b9ezDConiOrH/FsxV3RylFEQ8TVYm3Ik5Sb6BZV083kZKNk6
	5FfYwauQvv+pOzhJo1a4PgPygcEIvIMcFxvHcakJ/V02NS6vGzCJY05dY
X-Received: by 2002:a05:6000:1861:b0:43b:4396:6738 with SMTP id ffacd0b85a97d-43b6427b2c2mr24403823f8f.50.1774349374706;
        Tue, 24 Mar 2026 03:49:34 -0700 (PDT)
X-Received: by 2002:a05:6000:1861:b0:43b:4396:6738 with SMTP id ffacd0b85a97d-43b6427b2c2mr24403748f8f.50.1774349374089;
        Tue, 24 Mar 2026 03:49:34 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b647120a1sm38624039f8f.30.2026.03.24.03.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:49:33 -0700 (PDT)
Message-ID: <6f1e98b3-4b86-4b7f-8c91-d8d5721aeb25@redhat.com>
Date: Tue, 24 Mar 2026 11:49:32 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] dpll: zl3073x: add hwmon support for input
 reference frequencies
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>, Simon Horman <horms@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Jakub Kicinski <kuba@kernel.org>
References: <20260320105915.149068-1-ivecera@redhat.com>
 <20260320105915.149068-4-ivecera@redhat.com>
 <964752ec-8e6d-444a-aad0-80da3acb2dab@roeck-us.net>
 <7dbb5130-72cf-49d2-bfac-3439deb1b2e3@redhat.com>
 <20260323154825.1a2320c4@kernel.org>
 <50a1671c-9901-426a-97ed-bf36400fe9a7@roeck-us.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <50a1671c-9901-426a-97ed-bf36400fe9a7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/24/26 6:16 AM, Guenter Roeck wrote:
> On 3/23/26 15:48, Jakub Kicinski wrote:
>> On Fri, 20 Mar 2026 14:48:01 +0100 Ivan Vecera wrote:
>>> On 3/20/26 1:21 PM, Guenter Roeck wrote:
>>>> On 3/20/26 03:59, Ivan Vecera wrote:
>>>>> Expose measured input reference frequencies via the hwmon interface
>>>>> using custom sysfs attributes (freqN_input and freqN_label) since
>>>>> hwmon has no native frequency sensor type. The frequency values are
>>>>> read from the cached measurements updated by the periodic work thread.
>>>>>
>>>>> Cache the device ready state in struct zl3073x_dev so that
>>>>> freq_input_show() can return -ENODATA without an I2C access when
>>>>> the device firmware is not configured.
>>>>>
>>>>> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
>>>>
>>>> "frequency" is not a hardware monitoring attribute. I understand that it is
>>>> convenient to report it as one, and that other drivers implement it as
>>>> well,
>>>> but that doesn't change that.
>>>>
>>>> I understand that the code lives outside the hardware monitoring
>>>> subsystem and is
>>>> thus not in control of its maintainers, so you can essentially do
>>>> whatever you want,
>>>> even if it is wrong. That doesn't change the fact that it is wrong.
>>>>
>>>> However, do _not_ try to add it into the official list of hardware
>>>> monitoring
>>>> attributes. I would NACK that.
>>>
>>> Understood. I recognize that frequency falls outside the strict scope of
>>> hardware monitoring and does not belong in the official hwmon ABI.
>>>
>>> I'm using it here as a convenient way to expose these specific driver
>>> metrics, but I hear you loud and clear. I will absolutely not propose
>>> adding frequency to the official list of hwmon attributes or
>>> documentation.
>>>
>>> Thank you for your time and for reviewing the patch.
>>
>> Guenter, should this be a debugfs interface, then?
>>
> 
> There is nothing that prevents the actual (generated ?) frequency to
> be reported as sysfs attribute attached to the chip (spi) driver, if
> it is indeed of interest. If it is of interest for all dpll drivers,
> it could be attached to the dpll device, the chip driver could make it
> available via dpll_device_ops to the dpll subsystem, and the dpll
> subsystem could provide a common API function (such as the existing
> temp_get) and generate a common set of sysfs attributes for all dpll
> devices.
> 
>> Also an hwmon noob question - isn't it better for the monitoring
>> interface to report frequency error / instability in this case
>> instead of absolute value? Or do you not know the expected freq?
>>
> In the hardware monitoring world one would have min/max attributes and
> one or more alarm attributes. I never heard about the idea of reporting
> deviations, and for typical hardware monitoring attributes it does not
> really make sense. What would be a "deviation" of a temperature/
> voltage/current/power/humidity sensor ? Such attributes typically have
> an operational range, and they are allowed and even expected to
> fluctuate within that range.

Ivan, my take on all the above is that using the HWmon interface here is
stretching it too much. I think it would be better to move debugfs
and/or netlink events.

/P

