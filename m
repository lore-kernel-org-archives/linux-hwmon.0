Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2102A13B58A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Jan 2026 01:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769735235; cv=none; b=mcyyTIOd1mSOkFHYcQbWBVnPlnLTIaq8mmQaWrc51LZMN8e+IlFUe81wG6P0nslATRO8055NTm+yOqJhk5304PxaB4Hv5vdr4LByt8q+7atc8ndjJb5+LlEX13S3wi1LWDyUZFFBv5S5872VaORoiOnL3WVZeYA2o5jsPR030q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769735235; c=relaxed/simple;
	bh=ey8Fbrghv7IvrGEVHmiOmjsd9IdlArAVq9BRuOs7XZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtIrsb/wKe7CPiY0cWuggk/WRQZOgYTqXLtKtIdnnCXZqJFFUzb5XSPBllppyIMMhZdPNzwJ0CIaMQ/0B5M5TV9OuEoFqLIa1+pwwYHG2/2c/86SoW6qGMKcFONgsrRNSYh2BvxfEv26dqQvj0k87rJnULWvvUY7rQsrfBPp13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZ4tiUI1; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZ4tiUI1"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3285041eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 17:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769735233; x=1770340033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wAscem/PhzVmAIvKDxb8vKQL9uTniWeS58kyl4SqDM4=;
        b=FZ4tiUI10byymFfIiWGySG48CHuPAQ6xStmSX60g9beQTT+WFGKaG1jsNS4J/zZr0L
         478Gq0PYrcZtf5cqRWM7VdaUe9zO0nn/bqDvQ4NkK3KhbbSZEs3ysnRRihtrjCIqTEAX
         PoMCGPo0laLDQSXksNcOzy6c5aBqSI94vTHbvd2LECaWgoKk0URDGVP6vq13mELx2qZN
         VZ1+Pz/v27G2pBzX/NmNQl12o1nf399MzonV/DwYWMBJW/YGblClyF+fYsotBAA5p71R
         SCiDm8aBpHKYF29l+d59MJFSERx62LTPOsZdiH438LaqLY8tFIHWa3hnEcj7RRqVe8h+
         8bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769735233; x=1770340033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAscem/PhzVmAIvKDxb8vKQL9uTniWeS58kyl4SqDM4=;
        b=JIE9MUVzzBtBrOB8lbV4QnoWSLOsOmePdJ8iPUC54Nr2Bpo5lhO0F0g+fj9aWniWDu
         ztIf6a6iqkVYjzjQMoL7dgRick+5ui/0m3gS6tkBSTLS3U74hJQIrj0aCVpwAV3uznrm
         ccdYluDXoCmkWmCmvoKMJVmNnhdm3AaXBKq0BbsLhREtF0bSVQmWXmIWXtsvdVgZQibd
         gNfPkqLOaB3byyMbrof5yw+A113UBmAR9zeFpIfkXrjYIuFxxlueQR+FbRBr+Oh0yUWf
         qwVjwlmn8XSmcA+HS0I1pucK0JAHYlG0L0kRQasp72aLdkX3ZL5e9cxFJukPSQrafTRB
         Z19A==
X-Forwarded-Encrypted: i=1; AJvYcCWDcrtm7vvU9mHT76EE2nB7tTsWNeYNn8evnxewRXcFkDHqOF+A6WC93ks7z/negq1Sr6XI+oQ+Mlz+8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBzxTa//J7U5L/7ZivFuWaaE6txmf5CbK8imKO56CI6IAIitC
	5UoBWLKnZHlnZvHXNY94kLXzik9kJrY0zxXwpxxTrQHTZLDN70VLa77a
X-Gm-Gg: AZuq6aKDsSOU2YNlzc6X0S1Sj6gl4q5nlfEpmksQE1xyCKJu5bDpf5GUavVUNYGGNc9
	Gwt12LDZz3M2gCKM0rPMaFHvOF0QnY3njb8broQgW6drAb2E8Y3jblruvedL/0dHyWrphhybUNO
	d9R09+qqrGOwnBGO+WaQGrdI1Xz3PWGL4NSMn/I/Sz86kG+kucfw0ri6T5/KtMH1/sLoKPnfTJz
	suf701HiuK+S6dE0SN743aRO2KkMG9OzsUlgnsknlMtpIh89bTeQ4uFr1RXKbp/TyQnG8BcW/X3
	XvnswMfsu0ksZNFoyr0kJpmb8BFAG4xO5jmBkjfZ5rcdstSywi441Wk/YO+CapObnx0pDI2csMc
	xRjntW6pw5u/4HR9U+E1LPv611Bjz0pLC6pGYHgThXuKb1UppypkEA0PJKfYBWp9vKQE4w0crUp
	JTA0cMTb0oFRVX2tVkxylJ65ZOrig37B9Bbi7Ka7FEPhuFMKKFVVLxX/Dnm8KV
X-Received: by 2002:a05:7300:8b24:b0:2b7:1e86:35ee with SMTP id 5a478bee46e88-2b7c88dd706mr586827eec.28.1769735233062;
        Thu, 29 Jan 2026 17:07:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a17083dasm11526554eec.14.2026.01.29.17.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 17:07:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e30972fa-62de-401a-8fc2-a48a66ca2c73@roeck-us.net>
Date: Thu, 29 Jan 2026 17:07:11 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: (acpi_power_meter) Fix deadlocks related to
 acpi_power_meter_notify()
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Cc: linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Igor Raits <igor@gooddata.com>, Daniel Secik <daniel.secik@gooddata.com>,
 Zdenek Pesek <zdenek.pesek@gooddata.com>,
 Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <12855313.O9o76ZdvQC@rafael.j.wysocki>
 <d45d7b8a-97dd-4db8-a785-56df128983a4@roeck-us.net>
 <6252535.lOV4Wx5bFT@rafael.j.wysocki>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <6252535.lOV4Wx5bFT@rafael.j.wysocki>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rafael,

On 1/29/26 06:18, Rafael J. Wysocki wrote:
> ---
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Subject: [PATCH v1] hwmon: (acpi_power_meter) Fix deadlocks related to acpi_power_meter_notify()
> 
> The acpi_power_meter driver's .notify() callback function,
> acpi_power_meter_notify(), calls hwmon_device_unregister() under a lock
> that is also acquired by callbacks in sysfs attributes of the device
> being unregistered which is prone to deadlocks between sysfs access and
> device removal.
> 
> Address this by moving the hwmon device removal in
> acpi_power_meter_notify() outside the lock in question, but notice
> that doing it alone is not sufficient because two concurrent
> METER_NOTIFY_CONFIG notifications may be attempting to remove the
> same device at the same time.  To prevent that from happening, add a
> new lock serializing the execution of the switch () statement in
> acpi_power_meter_notify().  For simplicity, it is a static mutex
> which should not be a problem from the performance perspective.
> 
> The new lock also allows the hwmon_device_register_with_info()
> in acpi_power_meter_notify() to be called outside the inner lock
> because it prevents the other notifications handled by that function
> from manipulating the "resource" object while the hwmon device based
> on it is being registered.  The sending of ACPI netlink messages from
> acpi_power_meter_notify() is serialized by the new lock too which
> generally helps to ensure that the order of handling firmware
> notifications is the same as the order of sending netlink messages
> related to them.
> 
> In addition, notice that hwmon_device_register_with_info() may fail
> in which case resource->hwmon_dev will become an error pointer,
> so add checks to avoid attempting to unregister the hwmon device
> pointer to by it in that case to acpi_power_meter_notify() and
> acpi_power_meter_remove().
> 
> Fixes: 16746ce8adfe ("hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register")
> Reported-by: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>   drivers/hwmon/acpi_power_meter.c |   17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -47,6 +47,8 @@
>   static int cap_in_hardware;
>   static bool force_cap_on;
>   
> +static DEFINE_MUTEX(acpi_notify_lock);
> +
>   static int can_cap_in_hardware(void)
>   {
>   	return force_cap_on || cap_in_hardware;
> @@ -823,18 +825,26 @@ static void acpi_power_meter_notify(stru
>   
>   	resource = acpi_driver_data(device);
>   
> +	guard(mutex)(&acpi_notify_lock);
> +
>   	switch (event) {
>   	case METER_NOTIFY_CONFIG:
> +		if (!IS_ERR(resource->hwmon_dev))
> +			hwmon_device_unregister(resource->hwmon_dev);
> +
>   		mutex_lock(&resource->lock);
> +
>   		free_capabilities(resource);
>   		remove_domain_devices(resource);
> -		hwmon_device_unregister(resource->hwmon_dev);
>   		res = read_capabilities(resource);
>   		if (res)
>   			dev_err_once(&device->dev, "read capabilities failed.\n");
>   		res = read_domain_devices(resource);
>   		if (res && res != -ENODEV)
>   			dev_err_once(&device->dev, "read domain devices failed.\n");
> +
> +		mutex_unlock(&resource->lock);
> +
>   		resource->hwmon_dev =
>   			hwmon_device_register_with_info(&device->dev,
>   							ACPI_POWER_METER_NAME,
> @@ -843,7 +853,7 @@ static void acpi_power_meter_notify(stru
>   							power_extra_groups);
>   		if (IS_ERR(resource->hwmon_dev))
>   			dev_err_once(&device->dev, "register hwmon device failed.\n");
> -		mutex_unlock(&resource->lock);
> +
>   		break;
>   	case METER_NOTIFY_TRIP:
>   		sysfs_notify(&device->dev.kobj, NULL, POWER_AVERAGE_NAME);
> @@ -953,7 +963,8 @@ static void acpi_power_meter_remove(stru
>   		return;
>   
>   	resource = acpi_driver_data(device);
> -	hwmon_device_unregister(resource->hwmon_dev);
> +	if (!IS_ERR(resource->hwmon_dev))
> +		hwmon_device_unregister(resource->hwmon_dev);

Gemini says that this is still racy:

Description: Race condition between remove and notify. acpi_power_meter_remove()
unregisters the hwmon device and frees the resource structure without acquiring
acpi_notify_lock. If acpi_power_meter_notify() is running concurrently (e.g.
waiting on the lock), remove() can free the resource while notify() still holds
a pointer to it. When notify() acquires the lock, it will access the freed
resource (Use-After-Free).

Additionally, both functions may attempt to unregister the same hwmon device
concurrently (Double Unregister) because remove() reads resource->hwmon_dev
without protection. acpi_power_meter_remove() must acquire acpi_notify_lock
and clear device->driver_data, and acpi_power_meter_notify() must re-validate
the resource pointer after acquiring the lock.

Maybe I am missing something, but I think it has a point. it is not a new
problem, but still ...

Thanks,
Guenter

