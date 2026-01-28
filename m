Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E1C16DC28
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637140; cv=none; b=DL5PWpVh8TIJJ0OplZcxUSKkIm5H+3/iWMB1CJScpw4l9GJwhLLyvT1ZdCbthU7i6Se4cyA2E90JVtmSJinolhA/LdVl6cLdDOm3f/DG5KZM7ITq+EN4EyJbvshXsdHIuC/x+IR6+8myS8FJ4pwm0TMhg2uP8bA2u43d7QYslBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637140; c=relaxed/simple;
	bh=R08gY+siOTAFv2LdjWEX5Hadt94OH26XVGBc90sc26E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9NzKkWl76ibzutd5k9Z3X9Vs+3kIBcbsDRYhTy1rDM6gnyM7oeOdF/T8FuNDiDrKbs0/8N/OD1p8vRgoAgyP40PM6il8zWtMBqRVywbV11Wj1KhhwXmfh2QwoxWgYZ7OyqaUB0qkvAYtJS1SFraLByfSZ4Fi7CfNs4z5MYueNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRLuFYWk; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRLuFYWk"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1233bc1117fso1008038c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 13:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769637138; x=1770241938; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XxJkjKhqgeY7eSP+/+UlyZuqo3bYKaZRzWcV0KiiXw8=;
        b=HRLuFYWk8dZB8H+moiBAqHaL36UjUmprTRjfC2YyIHYoLYREG6wE7cyagHGrxv1zPv
         dm7V8H49kYqfeLI/EFRmlt3acp+VHtH/oR8G7NHHHxr3GkNCtINMPHCKKlBcmg7pWkHY
         TdNksu07kNtUEQtgXhGhSJX/fYyuaqkwgTzPs9mZTJkjRJJl2APXF7am9VQs+FV1pxF9
         YpDZlPyd+1GUFyM4xbx92thG/d9h3m+V53DZy8HSn3QAjYrJNyXzlGmzxHhT2q4JMTML
         7k/LA67Wrv9ZDw8U+hbRbX8ziconLOMQMxy7HD5glJGH9NedrzSrYIUasBvsEY1tPBCB
         f3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769637138; x=1770241938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxJkjKhqgeY7eSP+/+UlyZuqo3bYKaZRzWcV0KiiXw8=;
        b=MRmzvPxj/e0t0e0NqAt5YKt7gxivMi+lf5nXOgSeukcTx3hGVq9xPryt83gB+2GCqC
         zkfb63x9x9VtcAIednTmu//Ma2GYVZhO1gw5PcM7y5aygPphVyt6DA997Gab3P2l8Z4q
         4pMb0LHemNAkF/PBknuocrk7k0NdieJUFkkuj4lDyTzouA/ELm6mLPop5iP/iAKUoPuY
         WmcTZzZItzjGmiMDC07BhxYYRomlkfDlfa1JnxZOXPXDszYfZBBkdtoCtFGBYSfJrZQb
         5vUGvkjk8a/zmwxa9yyGVcUmyYKxnwc8UTwWevYLpB737tNNyp+TZoDnZ1h9zflDxx10
         rOoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtWDQQnFVrvg0+byHUhc/5H/yrnFrZp3WbANtTYldd8Q4c3FJDpt7KRHZBAXGhDWlsQjw5ebF9BJbB3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHSNLgYXcPKc99XTGSJW0oZpw19T6HRRBGSTjVYWP+8nHET52z
	w7u6lKb5Y/jPfXLnk6Y0ipP0jQO47JzLsXh2ytqImpTqArDvLPbjBgtt
X-Gm-Gg: AZuq6aL3pVjR6IxlZr+K12As+PeiBug99aJF9pdIkPTtxGfeqeOTLV0RQoRx/S9w2WC
	UTf5w9nbCW7tqGqmoFCQ39YINWGTVE89CZCC6w1hHdC+FwS3Ln+ochKMGwfc/CtlFRlFfDt9nRT
	RGZjoNzTpMtvAeyomrPxqj5Gc5WwgEWv/iT/ymN2FQlJHrO/YDKbonoQgwIoUl+Xp7TRjiA1XEZ
	Bg+AXyqqGwrTvMy/8gno+etFA2wzfbUGb/OlFF0I+XOhHRte0ln3WxVtCqJ5yNF8yVTaGlFNasy
	8F86xT/tqceXKFoLLyp6cNVjiTG3gtgOZX3NPs/rU9mboxCU/yWTmuFK3z8G6sXhcsw5S1cL2Se
	fMNY8krm2KFZUhi6uMt5mLZ1TDouiOJHjpyAAx3UXkvaqjeIMFNlRgQq30pBsYp4MeUX1GEoe11
	5nQQdIFsx1mDjY6OAZvQ2ndfOA
X-Received: by 2002:a05:7022:6b96:b0:119:e569:f874 with SMTP id a92af1059eb24-124b105084dmr546279c88.17.1769637137851;
        Wed, 28 Jan 2026 13:52:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm3949861c88.7.2026.01.28.13.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:52:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 28 Jan 2026 13:52:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Igor Raits <igor@gooddata.com>,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>,
	Huisong Li <lihuisong@huawei.com>
Subject: Re: acpi_power_meter: power*_average sysfs read hangs, mutex
 deadlock in hwmon_attr_show since v6.18.y
Message-ID: <d45d7b8a-97dd-4db8-a785-56df128983a4@roeck-us.net>
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <1d969bd7-4969-455d-9600-e4be14a78217@roeck-us.net>
 <CAJZ5v0iGe7LSiQuotFSC68ZoZMrdaJVCMcEWtdzKbG59rrRcMQ@mail.gmail.com>
 <12855313.O9o76ZdvQC@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12855313.O9o76ZdvQC@rafael.j.wysocki>

On Wed, Jan 28, 2026 at 08:52:49PM +0100, Rafael J. Wysocki wrote:
> On Wednesday, January 28, 2026 7:45:32 PM CET Rafael J. Wysocki wrote:
> > On Wed, Jan 28, 2026 at 7:18 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > Hi all,
> > >
> > > On Thu, Jan 22, 2026 at 07:55:35PM +0100, Rafael J. Wysocki wrote:
> > > > On Thu, Jan 22, 2026 at 7:21 PM Jaroslav Pulchart
> > > > <jaroslav.pulchart@gooddata.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > after upgrading from kernel 6.17.y to 6.18.y we started to observe a regression
> > > > > in the ACPI power meter hwmon interface. Reading power*_average sysfs
> > > > > attributes blocks indefinitely and causes tasks to enter uninterruptible
> > > > > sleep (D state).
> > > >
> > > > The most recent change in the acpi_power_meter driver was made in
> > > > 6.15, so this is not a regression in that driver.
> > > >
> > > > Also, nothing suspicious is done in power1_average_min_show() and
> > > > power1_average_min_store() AFAICS.
> > > >
> > >
> > > I decided to ask AI (Gemini 3, more specifically) for an analysis of the
> > > problem, using Chris Mason's prompts for guidance. Result is below.
> > 
> > So it agrees with me in the analysis part.
> > 
Yes.

> > > The suggested fix may be a feasible workaround. Let me know what you think.
> > 
> > Well, I'm afraid it won't work if two METER_NOTIFY_CONFIG
> > notifications compete with each other because they may try to
> > unregister the hwmon device at the same time.
> > 
Good point.

> > I would just add a separate lock for the notifier (a static one should
> > suffice) and make changes to "resource" only under resource->lock.
> > 
> > Let me cut a prototype patch for this.
> > 
> 
> Something like the below (untested).
> 
> Note that it also fixes the driver removal which is tangentially related to the
> problem at hand.

I can't test it either, but I ran it through Gemini and it tells me:

  Fixes: tag missing (y) [Fixes: 16746ce8adfe ("hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register")]

  The commit addresses a deadlock regression introduced by the conversion to
  hwmon_device_register_with_info.

  CHANGE-1: New static mutex `acpi_notify_lock` introduces global serialization.
  This prevents concurrent notification handling for multiple power meter devices.
  While likely a minor impact given the nature of the device, it technically reduces parallelism compared to the per-device locking used previously.

Just for fun I tried again, this time using a model which is more prone to
false positives. It pretty much provided the same result in more detail.
It is a bit more verbose, so I attached it below. I also asked it to verify,
using the backtrace, if the patch is complete, and to suggest a patch
description. The result is also attached below.

I think this is good enough for a formal patch. WDYT ?

Thanks,
Guenter

---
commit bd510da679b28e0f7a3fed718a5bd5e87c2a46dc
Author: Rafael J. Wysocki <rafael@kernel.org>

acpi_power_meter: Fix deadlock in hwmon_attr_show

This commit fixes a deadlock in the ACPI power meter driver by reordering
locking and introducing a separate mutex for notification processing. It
addresses a regression where sysfs attribute reads would block
indefinitely.

> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 29ccdc2fb7ff..de408df0c4d7 100644
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

This isn't a bug, but would it be better to use a per-device mutex in 
struct acpi_power_meter_resource instead of a static global one? A global
lock serializes notifications across all power meter devices in the
system, which might cause unnecessary contention if multiple devices are
present and one of them is slow to unregister.

[ ... ]

> @@ -823,18 +825,26 @@ static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
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

[ ... ]

> @@ -953,7 +963,8 @@ static void acpi_power_meter_remove(struct acpi_device *device)
>  		return;
>  
>  	resource = acpi_driver_data(device);
> -	hwmon_device_unregister(resource->hwmon_dev);
> +	if (!IS_ERR(resource->hwmon_dev))
> +		hwmon_device_unregister(resource->hwmon_dev);
>  
>  	remove_domain_devices(resource);
>  	free_capabilities(resource);

This commit appears to fix a major regression introduced in a previous
version, but it is missing a Fixes: tag. Based on the description, the
following tag seems appropriate:

Fixes: 16746ce8adfe ("hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register")

The above commit switched the driver to the new hwmon API which introduced
the core locking that led to the deadlock fixed here.

---
Completeness and patch description:

The patch bd510da679b28e0f7a3fed718a5bd5e87c2a46dc completely resolves the reported regression.


  Analysis of the Regression and Fix
  The log at logs/acpi/acpi.log confirms a classic AB-BA deadlock between the hwmon core and the acpi_power_meter driver. This deadlock was introduced when the driver was converted to the new
  hwmon_device_register_with_info API, which uses internal core locking.


  The Deadlock Cycle:
   1. Task A (Sysfs Read): hwmon_attr_show() takes the hwmon core lock (hwdev->lock) and then calls power_meter_read(), which attempts to take the driver lock (resource->lock).
   2. Task B (ACPI Notify): acpi_power_meter_notify() (on a METER_NOTIFY_CONFIG event) takes the driver lock (resource->lock) and then calls hwmon_device_unregister(), which attempts to take
      the hwmon core lock (hwdev->lock).


  The patch breaks this cycle by moving hwmon_device_unregister() and hwmon_device_register_with_info() outside of the driver's resource->lock. To maintain safety against concurrent
  notifications, it introduces a new acpi_notify_lock.


  Verification against acpi.log
   * The log shows multiple tasks (alloy) blocked in hwmon_attr_show+0x36. This offset corresponds to the point where the hwmon core attempts to acquire its internal mutex.
   * One task (alloy:5921) is specifically shown inside power_meter_read, confirming it holds the core lock and is waiting for the driver lock.
   * By ensuring that the notification handler no longer holds resource->lock when calling into the hwmon core, the "B" side of the deadlock is eliminated.


  Suggested Improved Patch Description
  The current description is a bit sparse on the technical details of the lock inversion. Here is a more detailed version:


    1 hwmon: (acpi_power_meter) Fix deadlock between hwmon core and driver lock
    2
    3 The conversion of the acpi_power_meter driver to the new hwmon registration
    4 API (hwmon_device_register_with_info) in commit 16746ce8adfe introduced a
    5 deadlock between the hwmon core's internal mutex (hwdev->lock) and the
    6 driver's internal mutex (resource->lock).
    7
    8 The deadlock occurs during ACPI notification handling:
    9 1. hwmon_attr_show() (sysfs read) takes hwdev->lock and then calls
   10    power_meter_read(), which attempts to take resource->lock.
   11 2. acpi_power_meter_notify() (ACPI event) takes resource->lock and then
   12    calls hwmon_device_unregister(), which attempts to take hwdev->lock.
   13
   14 Break this deadlock by moving the hwmon registration and unregistration
   15 calls in the notification handler outside of resource->lock. Introduce a
   16 new global acpi_notify_lock to serialize notification events, ensuring
   17 that the sequence of unregistering the old hwmon device and registering a
   18 new one remains atomic with respect to other notifications.
   19
   20 Also add a check for valid hwmon_dev in acpi_power_meter_remove() and
   21 acpi_power_meter_notify() using !IS_ERR() to handle cases where
   22 registration might have failed.
   23
   24 Fixes: 16746ce8adfe ("hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register")
