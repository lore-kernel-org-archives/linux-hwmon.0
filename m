Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB9355049
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530429; cv=none; b=cZDS4dk1Aa3xONt2yk/0yVjMIiEbTEA/DnAksJJ/QgELP+jS0wWFjiavj/VGAR/wyBySaEj5Zicn4umHIuwuOqU1utlzleM+3QCaLPr4WDHjh9ZFff8CNiwEUcMCQKkIKdSlai4ZhVpQ/E0w5CrnSzKcQBJE5cfnrtynOM9uEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530429; c=relaxed/simple;
	bh=y8v5V+tYIM6n3wnDXvrdbFANd4Jq/4/oDnIJmLqx420=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+QtL2W9EK3E/5sIbhoEE2A/7f5g27Sz8ITDlRPxiV7Zsw5bfPvVWqn7CDY1LEaZrteM961dkeSv81pXAsDPHx3LupH3+GT23DJmW+if/qqLhOYV1BnEUAOKVL71jP7XXqxrJJ9GbxVLdPB9lxCKNoiBz7bl9VM5VrOfBj/w6aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyhKpQ58; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyhKpQ58"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b73112ab62so4922294eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 08:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769530427; x=1770135227; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foZbL69h+8hDXLGAkMe9gWFOExWjvLu/2tjx7FoVudk=;
        b=TyhKpQ58YZbSQd6ipu7/XJocYKNnSrfQ2NZuLhjl+c2hSyz0P4bwmZrSe/Sqb3C997
         a7VXSgtg2PAElc3/HDMBDe+uPU5VTh8F1v1RxLLTZk672ya9beXO7PBkpJwMKBJjBjhX
         QwGoTftN9Miko+F4JSEYBNH3poDJCZAQZHQmlFNaySMgf85IZCZO0Tnf4HqJg30sST2x
         wS2rzvP92zW2ZEgDAxY87w4fMuX2nVhW+o7WvW3t635tXvKgUZZ2MIjWjnplPUQBRXwK
         vfJusUTnowKnuSMI6XYWTphyhQw69xKQqSzMpc02QxVyZJaw6CTHNA3v/G8eamm/zpG1
         FN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530427; x=1770135227;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foZbL69h+8hDXLGAkMe9gWFOExWjvLu/2tjx7FoVudk=;
        b=Y7zT9ZnCS+2RTRx1fftmKnG0zQj2wjZ4GzrShEH1iAVMA7lrwnHCbC0OesraU+Gnqy
         YRW7MMoWdf58UvPafrIygUK/L5u2vomcXeooW+p+iQEFDfN28Bu1ME+slx0WbEe9k4fN
         J+oVdbRYPstKibZ2o0WVjKKs92nadPsrv1wswA3alebYMv5SXUVVQRvcFbqzW2tPKqHz
         Ak7rl75tvOxYDejA4CH7ZcBpla1vGZOMIC7gSgLrzqpheU8gNGc6Aez6wusbaXu9yvUK
         o506+cJXkB0D0a+5SqS39b9Z6ctf+bonYEJ3ovMxjrACHGC0uNDRi5YHyOfZOg13OJHj
         vBZg==
X-Forwarded-Encrypted: i=1; AJvYcCXaqkmMeu2CVYAgO/+QMW+EsG9zLkbqHH1nMkCJ3nfSVZgwXP9nAXgOzzpAyCD9lRlNVzLqCXjCzlJkZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6c0w+Yq6rjDtwIrKYbvN3Nr8SEOownjA0iaSEnL/Jpdwy1Wr6
	JGuQ0W4AUkaxE5Ui2C9sBsrQSdduNjArj8AIJJsEmLDzW329C3SJScHL
X-Gm-Gg: AZuq6aJ3AhSOJ6Cl5v2kHuyQIm6zUUbjgYzqd+ROIUvGfhaUcB35NkiYEveBuMo/2si
	CjfwNMv7Qx6IdGeUSaWP2VC9KQC8BnmUw/+dY99ulu/3lVc/cpiB1XkpztEUL4eCGMViZFp0GLP
	qFtGusIJaJSNLzTzd8/x7p0Z6opAC64maGeOM3wlBfEF/5E/zyZ1eCMj1b92URDDz6jNrBlh5Fm
	SFyM5aWng6m+S5fXHUOUb1gVbeWtcG3SYR8tJ9aVXF6Wb9mJtaHamB7Dd3Gd84JZ8AZFpzY+Epm
	ErCD/YjIMr+js3TsA5D0GpkDyo2aTB5J63Zow/pBlNT9hVhlwV3dxH6WmxVo/VNA8Xdu5eQ9uU4
	z5ga2KYvGdshUonCUJ4H9NrOd7Scm2ycW2RjkTNUsVSSunjDxDIN7WwOHk/7W4CIWBCyC7H7gtg
	ovgIIpSwaS56ZHsdiJwbfq2tIa
X-Received: by 2002:a05:693c:3017:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2b78d8cc6e9mr1589269eec.4.1769530427130;
        Tue, 27 Jan 2026 08:13:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a9e1b39sm17459343eec.21.2026.01.27.08.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:13:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Jan 2026 08:13:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Igor Raits <igor@gooddata.com>,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>
Subject: Re: acpi_power_meter: power*_average sysfs read hangs, mutex
 deadlock in hwmon_attr_show since v6.18.y
Message-ID: <69665f53-a3ef-4129-afd5-5f7622f70e6b@roeck-us.net>
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <CAJZ5v0jSbGtRYkjqeuYaT3LXbeZ-xk_Gc0dbCpTZPc6nBD8eCQ@mail.gmail.com>
 <e03c8b69-e667-45b8-b82c-2cd4f1c96bdf@roeck-us.net>
 <CAJZ5v0hvKzKTWA8jFYVDHttd+hDv1juu87vgyhf2udOGbqrQdg@mail.gmail.com>
 <483f36e1-4ddc-4c22-aaba-c78156ebc0e2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <483f36e1-4ddc-4c22-aaba-c78156ebc0e2@huawei.com>

On Fri, Jan 23, 2026 at 10:53:02AM +0800, lihuisong (C) wrote:
> 
> On 1/23/2026 4:42 AM, Rafael J. Wysocki wrote:
> > On Thu, Jan 22, 2026 at 8:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 1/22/26 10:55, Rafael J. Wysocki wrote:
> > > > On Thu, Jan 22, 2026 at 7:21 PM Jaroslav Pulchart
> > > > <jaroslav.pulchart@gooddata.com> wrote:
> > > > > Hello,
> > > > > 
> > > > > after upgrading from kernel 6.17.y to 6.18.y we started to observe a regression
> > > > > in the ACPI power meter hwmon interface. Reading power*_average sysfs
> > > > > attributes blocks indefinitely and causes tasks to enter uninterruptible
> > > > > sleep (D state).
> > > > The most recent change in the acpi_power_meter driver was made in
> > > > 6.15, so this is not a regression in that driver.
> > > > 
> > > > Also, nothing suspicious is done in power1_average_min_show() and
> > > > power1_average_min_store() AFAICS.
> > > > 
> > > I suspect a circular locking problem between the hwmon lock and the
> > > resource lock. Unfortunately I don't immediately see it.
> > > 
> > > Would it be possible to test this with a kernel which has lock debugging
> > > enabled ? I'd test it myself but I don't have a system available
> > > that supports the acpi power meter.
> > One problem I found in acpi_power_meter through code inspection is
> > calling hwmon_device_unregister() under resource->lock in
> > acpi_power_meter_notify(), which may be responsible for the observed
> > symptoms, but then I'm not sure why it started to be visible after
> > 6.18.
> The hwmon_attr_show first hold hwdev->lock and then hold resource->lock in
> acpi_power_meter driver.
> Although driver call hwmon_device_unregister under resource->lock in
> acpi_power_meter_notify(),
> hwmon_device_unregister does't hold hwdev->lock.
> So this may not be the root cause of this problem.

It might be if userspace has one or more open attribute file(s). That might
be the case since other code in the driver calls sysfs_notify(), suggesting
that files are expected to remain open. Of course, that would mean that
userspace is all messed up because having an open file descriptor on a
since unregistered hwmon device doesn't really help much - worse, if a read
is executed after unregistering the hwmon driver, using a _different_
instance of the hwmon lock but the same resource lock would really mess
things up.

We'd need some active debugging to figure out if that is the problem.
Either case, re-registering the hwmon driver from acpi_power_meter_notify()
is conceptually wrong, so I am a bit surprised that this ever worked in the
first place.

Guenter
