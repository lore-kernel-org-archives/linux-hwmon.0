Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CD232AACF
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624296; cv=none; b=Rj3f/cXzTBSVnqKj6NsJV1bw+QqGqiwQfpiBe/0uB5Vvd7D6gYb47cc3WhWy/i3zNdG1A4CA6OGf/LfHAQoqvYqRjrtfyZL3A0KcRmEjGp6ia31ceqBNPxUpUBeVQScnwJnBZI32Uj5M9x+SSiI2F2Liw1juPH/6ls9V9h6DHUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624296; c=relaxed/simple;
	bh=z6HqVvjrRZwDtLZ0aZQZ4E0/om9TTG2acbvgmUcLPtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HArYY1315SrdtfyGfywRh1VRFL6xavrdwEUBshUt4p8KCj981sTZNGsgXwuqH7qb12mLchSnaDo+0wGHwQTqWXQGqRp+U2vL1V2qX8zk70oC70vWrPWq282GRZTPiqkWjv9hSAwIAJtf28Gh10+kfYlHanhoKLtuFwkB/fDeR5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gs+Dw+EC; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gs+Dw+EC"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124a95e592fso74081c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 10:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769624294; x=1770229094; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0qJ3Pv+XrYbJcjXa5Kbl78tEiMouGJOHkvxNsGhCms=;
        b=Gs+Dw+EClCzKnblpXgj2phdTokE88BEBRufk5tqnugr0SCjukOBk2/hi/IUdNjP4aN
         8FEorXGUN0qYTbF8piiwhjiGpTY7xs5LwHBQHwLUjl9KhvTDWBr4f9U8lFGEsr7ARrNk
         i7rgytjwiOU+JI1JqqxJ1H54XIWMtF7w7+k7d2kmuJLqjmiMy9vQnUm55ozmrUe+n5/+
         3XlUi8GRdYfOhnmXTao0NtLwPKCC3Tl+8qwOEb1Nq4Mcm5Lyn6jYxDMLtF4FL+C3Mm6l
         3r0wynJShIoTzxNgHNFYXwRFssDa49FgvfDCGgz9mFVQmfKOGSK9oU/XuOKvpIAO3Jml
         7/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769624294; x=1770229094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0qJ3Pv+XrYbJcjXa5Kbl78tEiMouGJOHkvxNsGhCms=;
        b=VvYERL1C1UUvf9oFMQiweajEAfOdJKxbPJQErfl++zUvumNYS/jOrd3EXox0EruJ+B
         hBklIfIxJAga8jS2u/1cwvzc9BROZLM3AFgpzFaYPWAaAKksZ77gIjcejHvIE0BGGde2
         0cRVAYu8QfoaMMVCmbu3YxoiQyZ0e9vJisG5UjUFrO5t4OkOwHLUwYIvCzAcxQrGHIKN
         jm6zyD3+S1kwVybQ0zC9PJqLdhpoZ9HdQgqZfZvjr8XQQB/HDgcANjnVxBnd7zu4eN9L
         CBe3REvsL7X6qjmdQxkLSWE6vs643GY4blhV44WAyZ1nO9offTTtAYw6zdJbQfZt93Hz
         TeYw==
X-Forwarded-Encrypted: i=1; AJvYcCXwenU2EjcxhXx83p1MwoiCnUj9sIhQv9gteVnh9Cx4HHk7XUBGoNUBEhUanW3K8DEz3WF/TgO+TuHD0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0mqFdyHiajQGwM6ApCm4Y4nI8f2VuW/XNgQ5eDGDquviX2+Ut
	PHfDfftwGkUqQG1zur97M/Vjo/gMslCa13H37uUbygJOtp7epouB/pfI
X-Gm-Gg: AZuq6aKDkcrEQGVAIcwxcIDigkmLChghx7jSWoDqedmAKhRprkQYR+LAT04xPnbtoQt
	94Edwcuw5Rfh4DcxA5ZOIxOJfAKsrHDyUwh/AmeW+Jyd9PsqAHMqG/3WQE3Pm6JPNCLfsNptvLq
	I+mCt70Wa6aypV2iV3MYfzkowCatTxRaoTT0nn1jZfxREWDdtkvXJVDq/ou95QLPxy342Clp2iX
	POIpWMLFgo8kalJRujt4L1ENoSJurwg563Pk6aTdzLdC3SJRjaY0hZnmSh6d25tnjq+Ej19Ifxv
	Drd6fUhlyWwLX9BGBKXHTLYX8b55cuFOQZjdLKg8oHC9eyyFSBHORlMxB+8QC72IY46GwNfaGGS
	MYHdnvdbIJSSSAqDYjN+PNgAgRlC1mLM8NFV+gi7zY8+Hg80MRPW0OihXnrEop7s7ZuUOkMA93z
	PiMpjUzduRa5wg8p3SRBv3Qyo2
X-Received: by 2002:a05:7301:4196:b0:2b7:24fc:f638 with SMTP id 5a478bee46e88-2b78d54358amr3228247eec.0.1769624294049;
        Wed, 28 Jan 2026 10:18:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abedcasm3607087eec.21.2026.01.28.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:18:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 28 Jan 2026 10:18:12 -0800
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
Message-ID: <1d969bd7-4969-455d-9600-e4be14a78217@roeck-us.net>
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <CAJZ5v0jSbGtRYkjqeuYaT3LXbeZ-xk_Gc0dbCpTZPc6nBD8eCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jSbGtRYkjqeuYaT3LXbeZ-xk_Gc0dbCpTZPc6nBD8eCQ@mail.gmail.com>

Hi all,

On Thu, Jan 22, 2026 at 07:55:35PM +0100, Rafael J. Wysocki wrote:
> On Thu, Jan 22, 2026 at 7:21 PM Jaroslav Pulchart
> <jaroslav.pulchart@gooddata.com> wrote:
> >
> > Hello,
> >
> > after upgrading from kernel 6.17.y to 6.18.y we started to observe a regression
> > in the ACPI power meter hwmon interface. Reading power*_average sysfs
> > attributes blocks indefinitely and causes tasks to enter uninterruptible
> > sleep (D state).
> 
> The most recent change in the acpi_power_meter driver was made in
> 6.15, so this is not a regression in that driver.
> 
> Also, nothing suspicious is done in power1_average_min_show() and
> power1_average_min_store() AFAICS.
> 

I decided to ask AI (Gemini 3, more specifically) for an analysis of the
problem, using Chris Mason's prompts for guidance. Result is below.

The suggested fix may be a feasible workaround. Let me know what you think.

Thanks,
Guenter

---
Summary of crash or warning
Deadlock in acpi_power_meter driver between sysfs read and ACPI notify.

Kernel version if available
6.18.6-1.gdc.el9.x86_64

Cleaned up copy of oops or stack trace
[  740.721209] Call Trace:
[  741.467334]  power_meter_read+0x1ea/0x2c0 [acpi_power_meter]
[  741.475320]  hwmon_attr_show+0x5e/0x130
[  741.481343]  dev_attr_show+0x19/0x60
[  741.487325]  sysfs_kf_seq_show+0xbf/0x140
[  741.494315]  seq_read_iter+0x112/0x510
[  741.503544]  vfs_read+0x215/0x340

[  740.286380] INFO: task alloy:5901 blocked for more than 122 seconds.
[  740.326290] Call Trace:
[  740.336311]  __schedule+0x2b5/0x690
[  740.341312]  schedule+0x23/0x80
[  740.354335]  __mutex_lock.constprop.0+0x3c9/0xa00
[  740.360318]  hwmon_attr_show+0x36/0x130

Explanation of the problem
The acpi_power_meter driver exhibits a deadlock when acpi_power_meter_notify
is called with METER_NOTIFY_CONFIG while a userspace process is concurrently
reading a sysfs attribute (e.g., power1_average).

The deadlock occurs because acpi_power_meter_notify acquires resource->lock
and then calls hwmon_device_unregister. The hwmon_device_unregister function
(via device_unregister and kernfs_remove) waits for all active sysfs callbacks
to complete. However, the active sysfs callback (power_meter_read) tries to
acquire resource->lock which is already held by acpi_power_meter_notify.

Sequence of events:
1. Userspace reads power1_average.
2. hwmon_attr_show is called. It calls power_meter_read.
3. power_meter_read attempts to acquire resource->lock.
4. Concurrently, ACPI triggers acpi_power_meter_notify with METER_NOTIFY_CONFIG.
5. acpi_power_meter_notify acquires resource->lock.
6. acpi_power_meter_notify calls hwmon_device_unregister.
7. hwmon_device_unregister waits for the active hwmon_attr_show (and thus
   power_meter_read) to return.
8. power_meter_read is blocked waiting for resource->lock.
9. acpi_power_meter_notify is blocked waiting for power_meter_read to finish.

This results in a deadlock and hung tasks. Other tasks trying to read sysfs
attributes also hang waiting for the hwmon core lock (hwdev->lock) which is
held by the blocked reader.

Functions, snippets and call traces of code related to the problem

drivers/hwmon/acpi_power_meter.c:

static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
{
        struct acpi_power_meter_resource *resource;
        int res;

        if (!device || !acpi_driver_data(device))
                return;

        resource = acpi_driver_data(device);

        switch (event) {
        case METER_NOTIFY_CONFIG:
                mutex_lock(&resource->lock);
                free_capabilities(resource);
                remove_domain_devices(resource);
                hwmon_device_unregister(resource->hwmon_dev); /* DEADLOCK HERE */
                res = read_capabilities(resource);
                /* ... */
                mutex_unlock(&resource->lock);
                break;
        /* ... */
}

static int power_meter_read(struct device *dev, enum hwmon_sensor_types type,
                            u32 attr, int channel, long *val)
{
        struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
        int ret = 0;

        if (type != hwmon_power)
                return -EINVAL;

        guard(mutex)(&res->lock); /* BLOCKED HERE */

        switch (attr) {
        case hwmon_power_average:
                ret = update_meter(res);
                /* ... */
        }
        return 0;
}

Suggested Fix
Move hwmon_device_unregister out of the critical section protected by
resource->lock. It should be called before acquiring the lock to modify
the resource structure.

drivers/hwmon/acpi_power_meter.c:

        case METER_NOTIFY_CONFIG:
-               mutex_lock(&resource->lock);
-               free_capabilities(resource);
-               remove_domain_devices(resource);
-               hwmon_device_unregister(resource->hwmon_dev);
+               if (resource->hwmon_dev) {
+                       hwmon_device_unregister(resource->hwmon_dev);
+                       resource->hwmon_dev = NULL;
+               }
+
+               mutex_lock(&resource->lock);
+               free_capabilities(resource);
+               remove_domain_devices(resource);
                res = read_capabilities(resource);
