Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E8149DE5
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Feb 2024 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709126634; cv=none; b=taeddnKjqg/35UKF+ApN9tTn2C5lQXJla2AgvQk/F9VvHhOngRvDrCrDlbMkLBpMU4axqEwvdgQNuoEZOwnqvPQBicVA547/1y+ba1bZvpkPcZYJ/9hUL1wLSYulsffKQZivMDTQ4vt8vzBWTX/rgiGRv7lI2DORY84v9jZJ/DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709126634; c=relaxed/simple;
	bh=J0pBZVG/kTNtQjh0TGoSqnc1pSpyF2AqAzhFgvJaJbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgUCxGMc23BuYpfurF2YztsLZH58g+oArtOTP95UUNzM/73plOIctoZNSKgEffrI6N6LarhknMnSM/2TEmyhVLb8hJeRq4hpltka/VbAgH06Or6uqIlAgRjzs3cU8Lk/fW4Bb0LyccG1SHNDrzWMVOmCW/bkFHvSaxzeEEt1i44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gVUodj8u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gVUodj8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709126631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKq+KbCVvhl5Mkuq8KIf4CJGUk342M8pPpaYXQOAlfk=;
	b=gVUodj8uoXQVTaLSgyFOE7+sxZ+BXSxkn4t9sGL7lteLl3H95PgaxHfjQ2yMipsxQZt0M4
	lzl1N3tXSRsGLU/NRetb4qROxViwAM9Zh6SShkHQSnrqC5i1/N5JhWJBnbrcuI4PHdD5rb
	z1dvg1GwvTIlznWI2Ehd+JZfcUcTPpc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-OdBuImBqPdy54CNqM-2a2Q-1; Wed, 28 Feb 2024 08:23:50 -0500
X-MC-Unique: OdBuImBqPdy54CNqM-2a2Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3fcf5b93faso298815166b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Feb 2024 05:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126629; x=1709731429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKq+KbCVvhl5Mkuq8KIf4CJGUk342M8pPpaYXQOAlfk=;
        b=AV9Zgt7mAT6PILe4Sh2UA5esljKkycaPxlrBGQj3Qvrkyb05/X7d6c4E2TOW3G+Q+X
         g9N22g84Log2HNEbpkHZkoQ7tN84GI18Ya8Y33IFon9KLU9zpUdopXAs6lOy2Ji3ImZv
         T0K2PoczAtXQw83v1VRwg7+xBJ+73pxQSvdJYWw4wp49aNdhBNLTAQb2b8DBT7EIX8l6
         fX8d+9Vtz2rP/S+GA+ho06uwRt4CkcJ9L2BVgxLEpf4VAMdflqkIs9zL5tQuS3RXEZp3
         8yaR7uv9JXWtqrbZBBs/ZrJEg3wPWW+ntJc+TE1Zs86C6/MTtDXrcAD2X5L+faRiLprU
         9gcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM4QQxz8Zo6EgKwAGXy6RK/5jXYv2sHz/7mIIn/VFKx01r8qtHvCn0Uq1nNP4NPv8TIkGSUiqMwEG4Zt354TN1lDTZiefk5RSx7+0=
X-Gm-Message-State: AOJu0YxZT0zPkMhShqtH06Y9imEgiPQE5KtPzLXd8UaGURHnxe+GxQff
	Q/sBX1eE8ObojXWhpEEHfkMS2eXLMUUMSoJ2IpOJ9zoS7NmCaAjiAmuZmkCedWgGrW9o9wlp4q2
	BZrzjNnwHyPAej1eVA/94WM2FghcENmfd9bN1aaaFi87ivLlI2rrCChUQljAf
X-Received: by 2002:a17:906:5a95:b0:a43:eb29:a293 with SMTP id l21-20020a1709065a9500b00a43eb29a293mr1522618ejq.5.1709126629245;
        Wed, 28 Feb 2024 05:23:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCxC/SMtA4W6mzulwwMdFiwybWP/9ffS59LzWkV0Sb2HZmnAM5CGQsVznOpvrUUdOBQ+YnWA==
X-Received: by 2002:a17:906:5a95:b0:a43:eb29:a293 with SMTP id l21-20020a1709065a9500b00a43eb29a293mr1522600ejq.5.1709126628814;
        Wed, 28 Feb 2024 05:23:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gv18-20020a170906f11200b00a413d1eda4bsm1848568ejb.87.2024.02.28.05.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:23:48 -0800 (PST)
Message-ID: <807c658b-358f-47c3-b14a-f1b76e9208c6@redhat.com>
Date: Wed, 28 Feb 2024 14:23:47 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform/x86: wmi: Do not instantiate older WMI
 drivers multiple times
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: jithu.joseph@intel.com, linux@weissschuh.net,
 ilpo.jarvinen@linux.intel.com, Dell.Client.Kernel@dell.com,
 jdelvare@suse.com, linux@roeck-us.net, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240226193557.2888-1-W_Armin@gmx.de>
 <20240226193557.2888-2-W_Armin@gmx.de> <20240227203058.eun4ylvhk4t7uogk@pali>
 <a8602a4a-39e1-46c3-9fe9-b6896c75fa73@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a8602a4a-39e1-46c3-9fe9-b6896c75fa73@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Armin,

On 2/27/24 23:47, Armin Wolf wrote:
> Am 27.02.24 um 21:30 schrieb Pali Rohár:
> 
>> On Monday 26 February 2024 20:35:56 Armin Wolf wrote:
>>> Many older WMI drivers cannot be instantiated multiple times for
>>> two reasons:
>>>
>>> - they are using the legacy GUID-based WMI API
>>> - they are singletons (with global state)
>>>
>>> Prevent such WMI drivers from binding to WMI devices with a duplicated
>>> GUID, as this would mean that the WMI driver will be instantiated at
>>> least two times (one for the original GUID and one for the duplicated
>>> GUID).
>>> WMI drivers which can be instantiated multiple times can signal this
>>> by setting a flag inside struct wmi_driver.
>> What do you think about opposite direction? Adding ".singleton = true"
>> into every driver which is not compatible with duplicated initialization
>> and having the default value that drivers are not singletons.
>>
>> But if the direction it to not accept new "legacy" drivers and start get
>> rid of all "legacy" drivers by rewriting them, then it does not matter
>> if "no_singleton" or "is_singleton" is used...
> 
> Hi,
> 
> i want to make sure that i wont forget any legacy WMI drivers. This way, the
> older legacy WMI drivers automatically initialize no_singleton with false.
> 
> Also i intent to not accept new legacy WMI drivers.

Somewhat offtopic question, how do you plan to handle the case where
there are 2 WMI GUIDs for what really is a single "thing",
specifically one main WMI GUID for a vendor specific interface
for say the embedded-controller and a separate GUID for events ?

IIRC we have several such cases. I thought we even have a case
where the main WMI GUID already is bound to using wmi_bus wmi_driver,
while the event guid is listened to by using wmi_install_notify_handler()
but I cannot find the code doing this, so I might be mistaken on this.

Regards,

Hans



>>> Tested on a ASUS Prime B650-Plus.
>>>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>>   drivers/hwmon/dell-smm-hwmon.c                 |  1 +
>>>   drivers/platform/x86/dell/dell-wmi-ddv.c       |  1 +
>>>   drivers/platform/x86/intel/wmi/sbl-fw-update.c |  1 +
>>>   drivers/platform/x86/intel/wmi/thunderbolt.c   |  1 +
>>>   drivers/platform/x86/wmi-bmof.c                |  1 +
>>>   drivers/platform/x86/wmi.c                     | 12 ++++++++++++
>>>   include/linux/wmi.h                            |  2 ++
>>>   7 files changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>>> index 6d8c0f328b7b..168d669c4eca 100644
>>> --- a/drivers/hwmon/dell-smm-hwmon.c
>>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>>> @@ -1587,6 +1587,7 @@ static struct wmi_driver dell_smm_wmi_driver = {
>>>       },
>>>       .id_table = dell_smm_wmi_id_table,
>>>       .probe = dell_smm_wmi_probe,
>>> +    .no_singleton = true,
>>>   };
>>>
>>>   /*
>>> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
>>> index db1e9240dd02..0b2299f7a2de 100644
>>> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
>>> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
>>> @@ -882,6 +882,7 @@ static struct wmi_driver dell_wmi_ddv_driver = {
>>>       },
>>>       .id_table = dell_wmi_ddv_id_table,
>>>       .probe = dell_wmi_ddv_probe,
>>> +    .no_singleton = true,
>>>   };
>>>   module_wmi_driver(dell_wmi_ddv_driver);
>>>
>>> diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
>>> index 040153ad67c1..75c82c08117f 100644
>>> --- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
>>> +++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
>>> @@ -131,6 +131,7 @@ static struct wmi_driver intel_wmi_sbl_fw_update_driver = {
>>>       .probe = intel_wmi_sbl_fw_update_probe,
>>>       .remove = intel_wmi_sbl_fw_update_remove,
>>>       .id_table = intel_wmi_sbl_id_table,
>>> +    .no_singleton = true,
>>>   };
>>>   module_wmi_driver(intel_wmi_sbl_fw_update_driver);
>>>
>>> diff --git a/drivers/platform/x86/intel/wmi/thunderbolt.c b/drivers/platform/x86/intel/wmi/thunderbolt.c
>>> index e2ad3f46f356..08df560a2c7a 100644
>>> --- a/drivers/platform/x86/intel/wmi/thunderbolt.c
>>> +++ b/drivers/platform/x86/intel/wmi/thunderbolt.c
>>> @@ -63,6 +63,7 @@ static struct wmi_driver intel_wmi_thunderbolt_driver = {
>>>           .dev_groups = tbt_groups,
>>>       },
>>>       .id_table = intel_wmi_thunderbolt_id_table,
>>> +    .no_singleton = true,
>>>   };
>>>
>>>   module_wmi_driver(intel_wmi_thunderbolt_driver);
>>> diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
>>> index 644d2fd889c0..df6f0ae6e6c7 100644
>>> --- a/drivers/platform/x86/wmi-bmof.c
>>> +++ b/drivers/platform/x86/wmi-bmof.c
>>> @@ -94,6 +94,7 @@ static struct wmi_driver wmi_bmof_driver = {
>>>       .probe = wmi_bmof_probe,
>>>       .remove = wmi_bmof_remove,
>>>       .id_table = wmi_bmof_id_table,
>>> +    .no_singleton = true,
>>>   };
>>>
>>>   module_wmi_driver(wmi_bmof_driver);
>>> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
>>> index 29dfe52eb802..349deced87e8 100644
>>> --- a/drivers/platform/x86/wmi.c
>>> +++ b/drivers/platform/x86/wmi.c
>>> @@ -883,6 +883,18 @@ static int wmi_dev_probe(struct device *dev)
>>>       struct wmi_driver *wdriver = drv_to_wdrv(dev->driver);
>>>       int ret = 0;
>>>
>>> +    /* Some older WMI drivers will break if instantiated multiple times,
>>> +     * so they are blocked from probing WMI devices with a duplicated GUID.
>>> +     *
>>> +     * New WMI drivers should support being instantiated multiple times.
>>> +     */
>>> +    if (test_bit(WMI_GUID_DUPLICATED, &wblock->flags) && !wdriver->no_singleton) {
>>> +        dev_warn(dev, "Legacy driver %s cannot be instantiated multiple times\n",
>>> +             dev->driver->name);
>>> +
>>> +        return -ENODEV;
>>> +    }
>>> +
>>>       if (wdriver->notify) {
>>>           if (test_bit(WMI_NO_EVENT_DATA, &wblock->flags) && !wdriver->no_notify_data)
>>>               return -ENODEV;
>>> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
>>> index 781958310bfb..63cca3b58d6d 100644
>>> --- a/include/linux/wmi.h
>>> +++ b/include/linux/wmi.h
>>> @@ -49,6 +49,7 @@ u8 wmidev_instance_count(struct wmi_device *wdev);
>>>    * @driver: Driver model structure
>>>    * @id_table: List of WMI GUIDs supported by this driver
>>>    * @no_notify_data: Driver supports WMI events which provide no event data
>>> + * @no_singleton: Driver can be instantiated multiple times
>>>    * @probe: Callback for device binding
>>>    * @remove: Callback for device unbinding
>>>    * @notify: Callback for receiving WMI events
>>> @@ -59,6 +60,7 @@ struct wmi_driver {
>>>       struct device_driver driver;
>>>       const struct wmi_device_id *id_table;
>>>       bool no_notify_data;
>>> +    bool no_singleton;
>>>
>>>       int (*probe)(struct wmi_device *wdev, const void *context);
>>>       void (*remove)(struct wmi_device *wdev);
>>> -- 
>>> 2.39.2
>>>
> 

