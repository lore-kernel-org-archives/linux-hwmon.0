Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA165311967
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769873383; cv=none; b=SWWHkTrAE1zlvknmBrwG8YVsdKQREnL0xG9KCyfZhPeLm2DvEMfb1I+EhkvFPBPhvN166TmzWrWvhgt7ldgr0aRNoW1lZFlKc1S+Mj9ZZmLzPSC9EnOwlkj2UY7uVnjd+hQIVXLnNC4nTz87qf61+8B33jiRfoPKq5ASX2uOI6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769873383; c=relaxed/simple;
	bh=OfnW+sgWMsRSJ3W0sFHhMoPc8DQ8fJsLV+nWniMCsQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttSrhdbFaxbQ6gmCqHBpT+7EB9yotnIdZ5G/JE7u85E7EXYtm9ZGwhYng0Y3bUsmz06uzPUz7WrctelRo+d9t+cFs56E7O8HIKq6iWuVfH+GEjB32qdMz8FaEEUX6r72NvAS9+OYFoTVtqHUHs0UNmYPkAckR+UPtgAig5enDPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnJ/cxGN; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnJ/cxGN"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1233bc1117fso2735578c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 07:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769873380; x=1770478180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0HrZr9tYjh8BMSMFkt9+cvbfUu6kErhymPnX7T2QsE=;
        b=cnJ/cxGNA90dPIdrSYrSyuZbdiLeXPIMi8NszHRhGVuoqQ4+djPGxcavWne6Xs8vnF
         1+hyWbPuMQ3+fAo8ulK0TGWHyrts1a//rqqXByWudiYcg8VRbXDH3RUQs2AN9dFrw4A0
         Fx+P27j9lPchty0DRheMQ8yIbQxPhtBD+X/SG+SiS96QQm5Pd6j4ElFvVXNj0oUq1yVt
         ydqIZ1IHX31FtOrY/1ydU/3XbK6YMIr0Cd+wz/jQ63a20CVd2j1dDGtODrwn7xG3Kcpx
         ynzyFOpLvg2eauBsAr4meA2d+mqQ7Us+9UGSRlZ6vVqq+7c51EvF8cPgqWgitThGi8DY
         nC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769873380; x=1770478180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0HrZr9tYjh8BMSMFkt9+cvbfUu6kErhymPnX7T2QsE=;
        b=X0b36hHRPgdAK/A0zXdlhWTrPpwD7p5+vssT/fN8QneyWYUnCXijPFB/2cMYVfn4HJ
         UdUVjyqmSaoW5KMPop7N6MhU3xIqmgizwyybasGIXW98XO1CAhy+cw9YrydVnO4NOm0A
         LaMr1J4bbqG7fhqJJ9xRUgAphm1rg+mGdCIQpa93xP4FqhaovyhFMXGX/61sRhvuF8hL
         Bkrp39bLI8LPGMAnZ/BjbB1RvNA8y7J7ak3+FpoK10ZWKkz2b859wvXI3RtnYr7UD8Jq
         eGo0MrMdtG0PYFuc40hD3bFRK3RJC59myNF71+CPowFS6mOXfXwilRuNarnHNM2ajahh
         RVEw==
X-Forwarded-Encrypted: i=1; AJvYcCXoPtUcuMSieiZ8qCuPT6PjjHogufpLdDKCSu0Ny5Cl6MEmaeZLk3A11yor6Ry0X7tLRjQTdr2N7M0DDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxV3isOkrE2oxjqrGxOIjCrsb9DT25qX4zSl0g4anyHeJ+Hdma
	NPl7+eCOJSrhyTi+GdSMIglaDcWrxyQ1LTxsVciriGSbR7U9VE4bGS/G
X-Gm-Gg: AZuq6aIL2NlNfaDOO83l47AqvY7WVdUgNk5XpsmnWz9xqus5K3gYXfois44mSV++Yaf
	vjAY/kzT2bxhlPyq9KxmFz3/ORtyTHkA8ZGHUAFDVNCwbKWywBFXoAB/Qm0NVA1dpUWyqGesdnm
	W3rnKmnlbI7lcpe/zgRGWV5gATwRo6F1C1w4vwlzpgiXFBfPNV0J2KsyMxLJ4uw7DX3hfTo9H8r
	4p86GbbDgO7dbwKaeingyBC73mxDZrZpjlsFs+Up9OuETCBRijnobdQE1gMANNhf9YOBdbjENb6
	kvebl8yKm24MpA0jSqehv3epSEHcixk3osnSsb69hq8+MOkCPicBiOod1T5R9kazwwW2JdZiRpq
	pwLjg3vgcfvv878qOuKFWXAF7GA+KElRJC37tH/JCIwnooZ+WeiE3R71pvC++9pXqKW4GWx1tfF
	doxKfcGbTHLiFveaiSjJotF1hPpl5ZzrqMtVE=
X-Received: by 2002:a05:7022:438e:b0:11b:9386:a38f with SMTP id a92af1059eb24-124b10a4651mr5014930c88.22.1769873380367;
        Sat, 31 Jan 2026 07:29:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9e0304bsm14332370c88.14.2026.01.31.07.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 07:29:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 31 Jan 2026 07:29:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Igor Raits <igor@gooddata.com>,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>,
	Huisong Li <lihuisong@huawei.com>
Subject: Re: [PATCH v1] hwmon: (acpi_power_meter) Fix deadlocks related to
 acpi_power_meter_notify()
Message-ID: <30300396-25b0-4d56-b8dd-c65d221c80bb@roeck-us.net>
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <12855313.O9o76ZdvQC@rafael.j.wysocki>
 <d45d7b8a-97dd-4db8-a785-56df128983a4@roeck-us.net>
 <6252535.lOV4Wx5bFT@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6252535.lOV4Wx5bFT@rafael.j.wysocki>

Hi all,

On Thu, Jan 29, 2026 at 03:18:11PM +0100, Rafael J. Wysocki wrote:

I decided to apply the patch below as-is. While we don't have confirmation
that it fixes the immediate problem, it is a starting point and won't make
the situation worse. A complete fix which does not require re-registering
the hardware monitoring device will require more work and will not be
suitable for LTS backports.

Thanks,
Guenter

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
>  drivers/hwmon/acpi_power_meter.c |   17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -47,6 +47,8 @@
>  static int cap_in_hardware;
>  static bool force_cap_on;
>  
> +static DEFINE_MUTEX(acpi_notify_lock);
> +
>  static int can_cap_in_hardware(void)
>  {
>  	return force_cap_on || cap_in_hardware;
> @@ -823,18 +825,26 @@ static void acpi_power_meter_notify(stru
>  
>  	resource = acpi_driver_data(device);
>  
> +	guard(mutex)(&acpi_notify_lock);
> +
>  	switch (event) {
>  	case METER_NOTIFY_CONFIG:
> +		if (!IS_ERR(resource->hwmon_dev))
> +			hwmon_device_unregister(resource->hwmon_dev);
> +
>  		mutex_lock(&resource->lock);
> +
>  		free_capabilities(resource);
>  		remove_domain_devices(resource);
> -		hwmon_device_unregister(resource->hwmon_dev);
>  		res = read_capabilities(resource);
>  		if (res)
>  			dev_err_once(&device->dev, "read capabilities failed.\n");
>  		res = read_domain_devices(resource);
>  		if (res && res != -ENODEV)
>  			dev_err_once(&device->dev, "read domain devices failed.\n");
> +
> +		mutex_unlock(&resource->lock);
> +
>  		resource->hwmon_dev =
>  			hwmon_device_register_with_info(&device->dev,
>  							ACPI_POWER_METER_NAME,
> @@ -843,7 +853,7 @@ static void acpi_power_meter_notify(stru
>  							power_extra_groups);
>  		if (IS_ERR(resource->hwmon_dev))
>  			dev_err_once(&device->dev, "register hwmon device failed.\n");
> -		mutex_unlock(&resource->lock);
> +
>  		break;
>  	case METER_NOTIFY_TRIP:
>  		sysfs_notify(&device->dev.kobj, NULL, POWER_AVERAGE_NAME);
> @@ -953,7 +963,8 @@ static void acpi_power_meter_remove(stru
>  		return;
>  
>  	resource = acpi_driver_data(device);
> -	hwmon_device_unregister(resource->hwmon_dev);
> +	if (!IS_ERR(resource->hwmon_dev))
> +		hwmon_device_unregister(resource->hwmon_dev);
>  
>  	remove_domain_devices(resource);
>  	free_capabilities(resource);
