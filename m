Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEACA7BB15
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Apr 2024 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712583183; cv=none; b=WQLX0iwLDVHIr+c697U2+kXU6SbU0Hu2V21VpHDzxb6NCzsCVRm8zKrOjCUDDom+Fl3mvUZBFwol+N484O7K7vjc7bINfCoTPCGf9t9w4LsngPnzGHoUarsosSk0Ou48IN7YMybRvgXXwjzPLaqwsPiS3VJhzluRk3iCht2mDDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712583183; c=relaxed/simple;
	bh=pW4t1AncsQ8tMvf/wxv5D6LUPKTSE5Rey2z/6XrH+7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXeVKeCtdsPuCywbXqj/P6WhMSLRU6IMJLYimgY/f1d37lxvaPco6CvNF32NkS3ZUFMdaxtTuQcPDQguVLyp64lqSTr7XE6+IOAKpdz6gC3FoDfSZmYzrlnkBMmkDnTIrb4+FxM7VA/oW/A+qnbtHCQqFrU9wj0vKHjhSjU+Ms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZeseT6Ud; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZeseT6Ud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712583180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJUImv89Y37aG2kc0mQxy8vkhYbAZfTGFvjYeh6Mk8k=;
	b=ZeseT6Ud5jMwMXFRHicz1bfDecAXXYFsXQYhN/fTm2lP2aJSu3HhxmuOj92AHt3g13UJrZ
	11Bvsxeof/Pt35f6jsTFWboOm9OpgUYB413ypJWG7TznzvYx3OQ2AXfbFF+PysAotJIrIn
	ZLiKc3iYwsjbuVnt1JuF/rYElkpVvMA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-3FipTWAPPQuznv9EfwRBiw-1; Mon, 08 Apr 2024 09:32:59 -0400
X-MC-Unique: 3FipTWAPPQuznv9EfwRBiw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a466c7b0587so277408166b.0
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Apr 2024 06:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712583178; x=1713187978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJUImv89Y37aG2kc0mQxy8vkhYbAZfTGFvjYeh6Mk8k=;
        b=eWWrdeHEcILT964T2xqXUTgnsnI9uUpYZvLatFaxxHOmw3ApbnyHwWo5arCRrpI6m7
         63/LyVNU2xpcZmcqCZ8n54c6Mnqwy1NlVRMakk2kg2WfgoVXgJ3KmGio+vggXgRT9GsO
         HHKRZcjzx93h2IIu70+EHuAHSmqE5o7TCACqne1ayZ72Nh8iIN3CDmTxMYQceSY07bTf
         XhiBLD3pQktZD9xKv6AZj4qCiqW+KE3UuTDbL1pHWF+VNu3XA+PBN6R9XtxjdZpq/ruu
         5bN6IU4ZVhqPYwuObVxpF6NUkIQkV6d37LwH1/2ob/7R6mqTOAnLlIpVIbdgmyKMtQMl
         j9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeSVEMX6k5gyAfqqejQGZ+ziqanf9eXxGtv9wvI9nBvaANTNVCuxMBSjXbWYiRqozGssm9NBv5L++aFuMsIZ8LUbVP9hQsvPYX800=
X-Gm-Message-State: AOJu0YyZi4jqyqJ5By70TAQOjlzqPpfAK74KKhiiY8mDw8sJ3k8AKgdR
	gvCnbGUQOLFCKoN5wuEZg0B3xFvMpGIYEK055tmNt3FqZ/uW+Fn9bZMzwK4wMHsAoJVwLUPNl7M
	0YkFeJp72ivE7p8y4kXzGXDIfZDKOWWEgjOT1Jutpm7atReyHkxn62WmUhqss
X-Received: by 2002:a17:906:338f:b0:a51:9cce:cf6a with SMTP id v15-20020a170906338f00b00a519ccecf6amr5334597eja.53.1712583177857;
        Mon, 08 Apr 2024 06:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Kh0jumPG4b000Jp0hZYkG/hCHJH0vM+pd5NJczuFkQT1+36nYLTOYHCvrKt2qgwsMkp+4w==
X-Received: by 2002:a17:906:338f:b0:a51:9cce:cf6a with SMTP id v15-20020a170906338f00b00a519ccecf6amr5334582eja.53.1712583177434;
        Mon, 08 Apr 2024 06:32:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p19-20020a17090635d300b00a51b78aed1csm3251761ejb.150.2024.04.08.06.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 06:32:57 -0700 (PDT)
Message-ID: <28bd0070-28e3-40d6-845a-7ac3d3cf67f2@redhat.com>
Date: Mon, 8 Apr 2024 15:32:56 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: Add thermal sensor driver for Surface
 Aggregator Module
To: Maximilian Luz <luzmaximilian@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ivor Wanders <ivor@iwanders.net>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20240330112409.3402943-1-luzmaximilian@gmail.com>
 <20240330112409.3402943-2-luzmaximilian@gmail.com>
 <d49ea735-3113-4c1f-a8dc-c6d8e821c4f1@roeck-us.net>
 <e8ccce25-86d5-492a-8fb4-3f39036fa91a@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e8ccce25-86d5-492a-8fb4-3f39036fa91a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/30/24 1:58 PM, Maximilian Luz wrote:
> On 3/30/24 12:58, Guenter Roeck wrote:
>> On 3/30/24 04:24, Maximilian Luz wrote:
>>> Some of the newer Microsoft Surface devices (such as the Surface Book
>>> 3 and Pro 9) have thermal sensors connected via the Surface Aggregator
>>> Module (the embedded controller on those devices). Add a basic driver
>>> to read out the temperature values of those sensors.
>>>
>>> Link: https://github.com/linux-surface/surface-aggregator-module/issues/59
>>> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
>>
>> I very much dislike the idea of having multiple drivers for hardware
>> monitoring on the same system. Please explain in detail why this and
>> the fan driver for the same system need separate drivers.
>>
>> I'll also very much want to know if we will see submissions for separate
>> voltage, current, power, energy, humidity, and/or other hardware monitoring
>> entities for the same system later on.
> 
> The Surface Aggregator EC is not really a single device, but rather a
> collection of subsystems. For example, there's one for the battery, one
> for thermal sensors, and a separate one for the fan. Not all subsystems
> are present on all devices with that EC, so we have modeled them as
> separate subdevices of the parent EC controller. This makes it quite a
> bit easier to maintain. Especially, since I haven't found any reliable
> way to auto-detect the active/supported subsystems.
> 
> For example: The Surface Book 3 has thermal sensors that can be accessed
> via this driver as well as a fan. As far as I know, however, the fan
> subsystem has been introduced later and the Surface Book 3 doesn't
> support that yet. So there's (as far as I know) no fan-monitoring
> support. Trying to access that will fail with a timeout. For that reason
> (but not specifically for that device), we have introduced the split
> into subystem devices, which are maunally registered in
> surface_aggregator_registry.c based on what we know the device actually
> supports.
> 
> Further, the devices created for these subsystems also act as a binding
> mechanism to the subsystem, speficying the subsystem ID/category used
> for making requests to it. For example, this driver probes for
> 
>     SSAM_SDEV(TMP, SAM, 0x00, 0x02)
> 
> meaning it looks for a device of the TMP subsystem on the SAM target ID
> (which can be seen as a bus number) with instance 0 and function 2. This
> (in particular subsystem ID and target ID) are directly used when making
> requests to the EC. So if we find out down the line that temperature
> sensors can be accessed on target ID KIP in addition to SAM, it's as easy
> as adding a new device match to the driver.

<snip>

Right this is all working as designed, it is just that Microsoft has
gone a pretty custom route with the Surface devices.

Guenter another way of looking at this is if there were 2 ACPI devices
describing the fan vs the temperature monitoring capabilities that too
would result in 2 drivers even though the underlying ACPI AML code
might end up talking to the same monitoring-IC in the end.

I'll go and merge patch 3/3 of this series. I'll leave merging
1/3 and 2/3 up to the hwmon subsystem of course.

Regards,

Hans


