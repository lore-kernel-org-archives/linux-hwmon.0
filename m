Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D3632F763
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 16:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050944; cv=pass; b=ZxVt0dvKcclsp6IIclwjoFAC/IuIcj/7UWcCrGL6gZoHB4g032cHwtnJPp6iXick2zMNbnb48g7Pf7piBgbVjokwhIlakWlN3FwQA5SmpVMkjj62/auLS1uThayMDBuxISjHrqp7oXplexv9CMi/v/zp4RbH7RQsUNzMc9na4Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050944; c=relaxed/simple;
	bh=LxjhE4ad+4M4QuDhOSFV4xQtXxPt8C0iZWA46vmpN34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGSqAgj2mHKGUgMe8RGYPoSMjYtYtVZ8Y8aHVoabVnv3Y0maRZzdajg483EVgK5cMviQE5OI7Tpg5rnKd0d9JNLKIck6L498AJOAo4SNwLDF3BE1Vz6mSV0lVd+jz6OneAdLrFZJcZ+KBplH5L3MfUhRTK1YMwGVewIMpWFJcQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=og9CIMwr; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="og9CIMwr"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-126ea4e9694so183619c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 08:49:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770050942; cv=none;
        d=google.com; s=arc-20240605;
        b=Ct0bXI+l9xcErUJ/xrcKXKTGfLFNeCYrpbPgF4rxkzzeLxVWlnJbgHQOvY/NYCHaj1
         Fe8pOkIRujXUM/lQ0PT86CWdASnN57d0xY/yFw2SGv6ktK2k9rshg03UuQ3mx6Fx+CrY
         rBQx7BpPSHXtSSyjKcy/sB9BF5cLLnlsY1MseAO4Ifg0JL+/787Qb+x6CzW4exn/w+65
         rHq9KXGfHMjXG0M2fdJRIsPyMfrxHNZ5P5X5RBqohqOGsbYQ8voHXXN/PB1V/DDF5JzV
         HLBu3PF+jAWGlhLfmh29ObFptKuqn6XJ6zEJSCpbbdey5N+PLx3FmGyiO+WStS9Wwh7K
         hfsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BCN8Le0pLyitc3CNSBu8WOx/swSsqQ2swPw/Rz8TUzI=;
        fh=HZE/hcuwxkZcRnIywsgtjTJMfOq1BAnn4vhU+iH2PGw=;
        b=Q/RdAQV+xD66KkAIiHTudrhT3i1oDvTaD1VC+rdPTwbLGShOQmdKd2WdXjcBlmnpA/
         8eNQoCKm4yrYwB4nJ6/4vX84iBl3c1eNvLJMivrxAU6N6mpAXPEFNoM7SMbwj3bi+fTo
         3tyvO6Qbpi/jMlZhEIoQy8C5zIztlIkoNBpBHp/XiXnSMXbW/WUbJMq2K54X/XebVKkd
         xwHz95f1zDsa1c4XWfFExq+GCuuT7cLZ50q94NE8jWFa8FpGra0HyFHINTGFxjPo+Svg
         yNDZ7Fb0Jni3m8LebE6IKiWEL80fy6cQEmqYonF7K/AOwWmt999Td5Y0PY/j2qukh7TI
         20sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1770050942; x=1770655742; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCN8Le0pLyitc3CNSBu8WOx/swSsqQ2swPw/Rz8TUzI=;
        b=og9CIMwryTcCuW5cHCBToxyHP63/bgLVSKAiSoq7JgTJwHq412dVTREfZBNTuhT09o
         RhOa3fZma8w1tOaRxO2YBhqZaVF/0ErbfA4wms8IgOs9GCO0BlnoFTyBKODEvxJXEvbQ
         65naG0QX+7bal5nXeRwKgJ6LiXCzFieTT+uNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050942; x=1770655742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCN8Le0pLyitc3CNSBu8WOx/swSsqQ2swPw/Rz8TUzI=;
        b=l6igSHWwdQ5QUVBQvCvCb6tM/R1/crwKN3Z0lARxRsQlFkjmH9aiToedXumih6UCOX
         GU87b781ZWz9t+DitQ0kc28fyfMW8ewZsXymaTsPLWCD+AKAoZqFVOLQPPluR5jQS1c/
         o+uW/M9b/2nr/PXUv6BUwoWkR06y/UC4E2spopHDqNwrv+p/9PkKkvGvkQZuu/aJMk4x
         g+BSg8koRZEBDG4Sty6sShgd9y+jmi9nXoyNiPn2AMjLXj2AU2A7/BAzfTtvCN6dHcCq
         +1flFPMNIYDHVWEKi/4PQtkK30N52Gt7hFVyX6BLStUIcjY1p5iMc6ZZrMz0D7t3jZrn
         1IZw==
X-Forwarded-Encrypted: i=1; AJvYcCWg9BWoMsp8gb7SRtG5pe+2phs93vTv6YC/ANXXFjpGOBS/efPJw4WKTCsLHfg3CwLByVlJ14vnljK23Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuVd5fTI24sRrDEToWYDGHca39LytUsSGPtLFarzDLy1jLKs5/
	kgZnk6XtM7cJUrKAaWez7JqBwLU+U1lIj8RVc/SmPs2/IoqHwORNvbKHCgM+S7w4GIZfcx4hbg4
	AA1HzT6UCs3HxRc1tWUu9dopk2fcjs3rNMdE6lBFG
X-Gm-Gg: AZuq6aKO8bCnhA029ZErrJaQpMPPeQ/vAHtVr6+HaHXcfpFTj/0CxUCUjgRsZiY5bzv
	+vv+CVxLpgGSN3VTbu3Wonv/2R+SsijTHaSKe8twX8rfha66280Os0uAB2q6EV4uJQSa2jFw3uG
	YkOnsOqiI9PrtyXWshnjiL4O41LD9K3xsb5SN2rs/Zw5lQ2wVoXRFICWxnIU5z2rQ2ALMHW/U1D
	N6qKRG5evV2IdREGcQ250D9o96tdbQ9FCdP33SeXsVTtM4eZOSBEnqjJojRY1KOlZO+9s/6
X-Received: by 2002:a05:7022:6610:b0:119:e56b:958a with SMTP id
 a92af1059eb24-125c0f88d5dmr5930820c88.15.1770050941664; Mon, 02 Feb 2026
 08:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <CAJZ5v0jSbGtRYkjqeuYaT3LXbeZ-xk_Gc0dbCpTZPc6nBD8eCQ@mail.gmail.com>
 <e03c8b69-e667-45b8-b82c-2cd4f1c96bdf@roeck-us.net> <CAJZ5v0hvKzKTWA8jFYVDHttd+hDv1juu87vgyhf2udOGbqrQdg@mail.gmail.com>
 <d7f34e0f-e258-4fef-93eb-1ef0a3123d95@roeck-us.net> <CAK8fFZ4izdX_HDtGN60CZ3Ta61nqkUg7ncViM=mGgxKki_5FoQ@mail.gmail.com>
 <a7334568-13ce-4600-8650-607273e67976@roeck-us.net> <CAK8fFZ6gKs7s2rJ=f7bt24f+_cY-jGU33TvX3UP=U58uK-1KaQ@mail.gmail.com>
 <fff54ec8-496e-4c26-b652-358dc4de0de0@roeck-us.net> <CAK8fFZ4wEUdMAHkfdC_z8ohYB_rEXZ=dHArc75jDibgQ_-ozKw@mail.gmail.com>
 <4f151d4c-fdc6-4281-87b0-b7120eeb1b46@roeck-us.net>
In-Reply-To: <4f151d4c-fdc6-4281-87b0-b7120eeb1b46@roeck-us.net>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Mon, 2 Feb 2026 17:48:35 +0100
X-Gm-Features: AZwV_Qg-Z86It63WG7mLh3EaECuQjkUS0rUhn8KgZZJIYFsFZmHm47Ne5ImaBcU
Message-ID: <CAK8fFZ401-nez_CgDTTnQiPT=oBRRJuYooXyEKFuCdHpGCPXtA@mail.gmail.com>
Subject: Re: acpi_power_meter: power*_average sysfs read hangs, mutex deadlock
 in hwmon_attr_show since v6.18.y
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Igor Raits <igor@gooddata.com>, 
	Daniel Secik <daniel.secik@gooddata.com>, Zdenek Pesek <zdenek.pesek@gooddata.com>, 
	Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"

>
> On Thu, Jan 29, 2026 at 04:26:37PM +0100, Jaroslav Pulchart wrote:
> > >
> > > On 1/27/26 03:58, Jaroslav Pulchart wrote:
> > > ...
> > > >>> Hello,
> > > >>>
> > > >>> Thank you for the analysis and insights.
> > > >>>
> > > >>> To add some context from our side: we observe this issue shortly after
> > > >>> a server reinstall or fw updates followed by a reboot, typically when
> > > >>> hwmon sensors are accessed for the first time (e.g. by monitoring during
> > > >>> early system initialization). We have not seen it trigger during normal
> > > >>> operation, such as a simple reboot or on long-running systems.
> > > >>>
> > > >>> Given this behavior, it is possible that the issue is related to
> > > >>> hwmon_device_unregister() being triggered early during system
> > > >>> initialization, but I do not have concrete evidence at this point.
> > > >>>
> > > >>> As a workaround, we will exclude the ACPI power meter from hwmon monitoring
> > > >>> (Grafana Alloy) until the mentioned refactoring or a fix becomes available.
> > > >>>
> > > >>
> > > >> Would it be possible for you to test the patch series I just sent out ?
> > > >
> > > > I suppose these 5 patches from
> > > > https://lore.kernel.org/lkml/20260123182208.2229670-1-linux@roeck-us.net/
> > > >   ?
> > >
> > > Correct.
> > >
> > > > I will try them and let you know.
> > > >
> > > Thanks !
> >
> >
> > The issue is still there:
> > ...
>
> Thnaks a lot for testing.
>
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.105931] INFO: task alloy:5985 blocked for more than 124 seconds.
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.114475]       Tainted: G            E 6.18.7-2.gdc.el9.x86_64 #1
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.122872] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.132932] task:alloy           state:D stack:0     pid:5985 tgid:5871  ppid:1      task_flags:0x400140 flags:0x00080001
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.145975] Call Trace:
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.149985]  <TASK>
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.154931]  __schedule+0x2b5/0x690
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.160934]  schedule+0x23/0x80
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.166498]  schedule_timeout+0xe8/0x100
> > 1769654277410 2026-01-29T02:37:57.410Z Jan 29 03:37:57 10.8.8.76  [ 741.172936]  __wait_for_common+0x99/0x1c0
> > 1769654277660 2026-01-29T02:37:57.660Z Jan 29 03:37:57 10.8.8.76  [ 741.179148]  ? __pfx_schedule_timeout+0x10/0x10
> > 1769654277660 2026-01-29T02:37:57.660Z Jan 29 03:37:57 10.8.8.76  [ 741.185936]  acpi_ipmi_space_handler.part.0+0x1ac/0x370 [acpi_ipmi]
> > 1769654277660 2026-01-29T02:37:57.660Z Jan 29 03:37:57 10.8.8.76  [ 741.194929]  acpi_ev_address_space_dispatch+0x16d/0x3c0
>
> Looks like acpi holds another lock. Can you check if the patch submitted by
> Rafael fixes the problem ?

Hello,

I tested the patch as a standalone change, and the issue is still present.

However, I can now reliably reproduce the problem. It is triggered while
Dell iDRAC is being reset or updated and is temporarily unavailable. During
this time, a [kipmi0] task enters D state for an extended period, and
shortly after (or during this), the ACPI power meter hwmon interface ends up
in the locked state described earlier.

This explains why we mostly observe the issue after redeployments in our
environment: server redeployments typically include iDRAC firmware updates
or resets performed together with operating system installation or updates.

Best

>
> Thanks,
> Guenter
