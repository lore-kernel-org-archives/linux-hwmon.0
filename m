Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3708F35B142
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769163603; cv=pass; b=j2ejvfPsPyw4eWKmzgGkDhxHSmJJCpcoS7fYG7HOhrlDR8ibOUUCLa3b6+4m06PNuGoRuqSqHBqMhd3lS2P/nKtL/4djBKDXmwtyylUvrroDffX7JQcl0oh8ZQ13jsJMpOBxufbr4Wt0lQFAbInXcIM/7NddGnjZlH/AS07J+GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769163603; c=relaxed/simple;
	bh=dGoB5x9VFS+4dOaBdZZ9T+GRMoADVYTmJoPFZcQ5eq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLBtbFunVBB8P840ix5Yy0okhSM5qQTVRhE2ImicfsyGsufx+ufQBwKxe9oryiAnn/qQqs4o8ifE2/oxEDytWH/FBxD+iQIVfCDVxWgkwQ3THqrlKNZvi5ZiUGSujxCInLsBh/H5J5/NTmGYdY91YgIN+T3gCuqwwCfBbgo2T3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=b2ILDSuR; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="b2ILDSuR"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-121bf277922so3510816c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 02:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769163593; cv=none;
        d=google.com; s=arc-20240605;
        b=OrbxaJe5Gigk0MChohQNztCu/tQQM94P51oIATxPZ6IB1lrNExeRoOQyspCRPQI/pY
         rKgRqaUm2Bs0MOzw1MciTZwAGsLjkRt3rs6AOxWyMdsoqoSTMyeRNH+k2qNZeEfJTh+g
         VYLofxrdhCxQK4ptH2IjKRaTSIiVvRHNYG9seqTSOXKbwxDNFqAz9og1CVFj0y0E3oQV
         vIpTpdNpyKQtl0DnNGDX08gOVg4nKuVHFPcghNstjYNCIkFkSs8NDI1F3AHZZYxAG06a
         OF9GUvmX0t92DI3xOgZ2A1NCbNjF6DiVkdRtpiUhM/ETWwvMtr3/bLYKNfl5pExCzFDF
         OSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dGoB5x9VFS+4dOaBdZZ9T+GRMoADVYTmJoPFZcQ5eq4=;
        fh=rVzK/lE2nn1tFAFV953VaBLOW8sJSoZpdc2uayxoQPE=;
        b=WTLkLqCJ1c27pZ24Cu0diDozHYcYVR0Nr1+VentiWawJM2qNPgJQkj3xKT5K24htKz
         DEmFBt48+zNVpdJ0D2gCX7asz3BKaKzgXx7kKnLdsM5RCICf01j96Rr2ZsyFFPyFmZXn
         0dILwlG+pK2TOqpXPIVg+SUmlLBLlBQezoUWaeP0g8f3i8t0cNQOH96kAvfEDH3rtUs0
         3L2YxfpsGG+bCpAzVEaYeSgZWPdiJuVB9a2abU+rbAE7gegHLww2th+whxg5P3XznH9n
         dZA3S95QkRde0zfjgvz0LuQv6iiLPAPAnS9fAt4xR1txUXfU4wrkJ0V/BzpHWuWQzE8R
         azlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1769163593; x=1769768393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGoB5x9VFS+4dOaBdZZ9T+GRMoADVYTmJoPFZcQ5eq4=;
        b=b2ILDSuRl3Qt7+s6emDtr3HjCmHvdWxOxUYlLHWsvulnzqr1q2oOCmb8TuiWwF4lG1
         8lBxNQhZlGk0g79hu/8F9tFKtRYO1DSL8yct3q64p6w2qFUqOXEcLmVRzmDRAPNMfKSM
         LpIz81KVHZUsbIUpMIlvGsPFm4D4cZu536dMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769163593; x=1769768393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGoB5x9VFS+4dOaBdZZ9T+GRMoADVYTmJoPFZcQ5eq4=;
        b=FUA7wqFNVKDHpwI0vAJdIaQVea+ZdtmxvSlqkPELoh0cdp+y9sRQ3P9TdRgVGnwrWf
         oNzxhO468xk8HgsuaqWNcvvgJq71kNyCimb6E+ySrci6vT7UxMHr3LXWPotOmZAFUN7n
         VagcTp2bnr9VOf8gzCaJdpNY9P8IL1HrkUzvIjx3D2RtyaaL6g/gAWHgoEg0rGa9sPz0
         Da+xsmDWMsDqDZhOIcnXjfLLZXbjjVIcN4RIp+A+hn4yfWxI6LRfR7t0bSWDVBOaXOlk
         zXtedOt7MxY4jdlLrDuLdI/eJZDoh0vvU1XmDGhF/+iGVV3VMC1qP3ZKmCNHrzSUcWvB
         jaSA==
X-Forwarded-Encrypted: i=1; AJvYcCWUkrLVZ8GHej0+LAGofLnub9WdDEW5v+BgbibkJ2jKjRj3ee100zJBwvIUGUY9LNcKm3KIdJBma6CNPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWRjPYNc4ugMd38H6aJV/QPAttWj1YWZUozd01zbgPonHrkDin
	UnyDRbfVqfO5lmDbicq415G6QLr4TGWojnfIJuCp9UTzZ9pgJW7aF7KYjkGcYlyUR4Y4TDl2Ej8
	0BHZocE/rxdFamdxxSLQQ8cbdMRxMGNgpAO/Hkzng
X-Gm-Gg: AZuq6aLHpNCl44UquoPh4amXOpLRRAAgIGA6/vJbOcr9VYJ8JjFzd2RNgsFPIirac+d
	+DWrQEBtNfRuvUlSSOlDE25UG6vIMKoJhOvZRcEa3zUVp14Bvxwcuc2egnxPR2Avskxn2zw3Byi
	X3ai/+efNIDy8rfiMgaHZH6oj+e/k4Qf6MiKt9rM4mNpsuczA3aQ7fuPl3bV+EKmMgb6Vmh/IM3
	v83c2H+6dmra2tLht0NYfTBQ1lqUrrQz0PxBXRvB+yoFBn9ZqzVhsVRBtPxrbrCNKy4mxAl
X-Received: by 2002:a05:7022:6b8d:b0:11b:aca4:be1f with SMTP id
 a92af1059eb24-1247dbba399mr1114972c88.17.1769163593476; Fri, 23 Jan 2026
 02:19:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <CAJZ5v0jSbGtRYkjqeuYaT3LXbeZ-xk_Gc0dbCpTZPc6nBD8eCQ@mail.gmail.com>
 <e03c8b69-e667-45b8-b82c-2cd4f1c96bdf@roeck-us.net> <CAJZ5v0hvKzKTWA8jFYVDHttd+hDv1juu87vgyhf2udOGbqrQdg@mail.gmail.com>
 <d7f34e0f-e258-4fef-93eb-1ef0a3123d95@roeck-us.net>
In-Reply-To: <d7f34e0f-e258-4fef-93eb-1ef0a3123d95@roeck-us.net>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Fri, 23 Jan 2026 11:19:26 +0100
X-Gm-Features: AZwV_QhiDa_iFisfl1Vycn-TcgZOZh_Dv08_jX6jKVuFlFsGfCq5GEQALLr-n9E
Message-ID: <CAK8fFZ4izdX_HDtGN60CZ3Ta61nqkUg7ncViM=mGgxKki_5FoQ@mail.gmail.com>
Subject: Re: acpi_power_meter: power*_average sysfs read hangs, mutex deadlock
 in hwmon_attr_show since v6.18.y
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Igor Raits <igor@gooddata.com>, 
	Daniel Secik <daniel.secik@gooddata.com>, Zdenek Pesek <zdenek.pesek@gooddata.com>, 
	Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 22. 1. 2026 v 23:28 odes=C3=ADlatel Guenter Roeck <linux@roeck-us.n=
et> napsal:
>
> On 1/22/26 12:42, Rafael J. Wysocki wrote:
> > On Thu, Jan 22, 2026 at 8:51=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 1/22/26 10:55, Rafael J. Wysocki wrote:
> >>> On Thu, Jan 22, 2026 at 7:21=E2=80=AFPM Jaroslav Pulchart
> >>> <jaroslav.pulchart@gooddata.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> after upgrading from kernel 6.17.y to 6.18.y we started to observe a=
 regression
> >>>> in the ACPI power meter hwmon interface. Reading power*_average sysf=
s
> >>>> attributes blocks indefinitely and causes tasks to enter uninterrupt=
ible
> >>>> sleep (D state).
> >>>
> >>> The most recent change in the acpi_power_meter driver was made in
> >>> 6.15, so this is not a regression in that driver.
> >>>
> >>> Also, nothing suspicious is done in power1_average_min_show() and
> >>> power1_average_min_store() AFAICS.
> >>>
> >>
> >> I suspect a circular locking problem between the hwmon lock and the
> >> resource lock. Unfortunately I don't immediately see it.
> >>
> >> Would it be possible to test this with a kernel which has lock debuggi=
ng
> >> enabled ? I'd test it myself but I don't have a system available
> >> that supports the acpi power meter.
> >
> > One problem I found in acpi_power_meter through code inspection is
> > calling hwmon_device_unregister() under resource->lock in
> > acpi_power_meter_notify(), which may be responsible for the observed
> > symptoms, but then I'm not sure why it started to be visible after
> > 6.18.
> >
>
> I noticed that too. It is kind of broken; a driver should never do that.
> The proper solution would have been to re-evaluate sensor visibility.
> I have a patch series to add that capability to the hwmon core, but that
> is untested so I never submitted it.
>
> Anyway, I don't immediately see how that would trigger the problem.
>
> Guenter
>

Hello,

Thank you for the analysis and insights.

To add some context from our side: we observe this issue shortly after
a server reinstall or fw updates followed by a reboot, typically when
hwmon sensors are accessed for the first time (e.g. by monitoring during
early system initialization). We have not seen it trigger during normal
operation, such as a simple reboot or on long-running systems.

Given this behavior, it is possible that the issue is related to
hwmon_device_unregister() being triggered early during system
initialization, but I do not have concrete evidence at this point.

As a workaround, we will exclude the ACPI power meter from hwmon monitoring
(Grafana Alloy) until the mentioned refactoring or a fix becomes available.

Best regards,
Jaroslav
