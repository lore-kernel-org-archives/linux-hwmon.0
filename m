Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42691346E74
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515141; cv=pass; b=kPY5UGpb3J3/eSO2Bf+TQGANoTMtdDtF+t++I7qu1x78ZBqAKv74d82i8hoHf+Dje2H3g7Wcso1IbvE0NcyaT48ccgPbiDYFfvu3Smq6mNu6WCcGRwqE4FJiu9m5dIKZSFjuMCbjnNG5/HiwGXMTiAvxFbCqO4xlfITpb0GXl9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515141; c=relaxed/simple;
	bh=pJ5yKhLQjq6Hec7gqI4eoL2dW5bjgRDHBF0GBjBJBPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBjYjj+0MX5SH1i6/pdq2Mrx0Rh/Ch1IJHhnrLBZCqlV04Q02IYb7VQT4tqiQJ1xNc6L6mYv2troAR7IoHPAJq8jf2XJHFMWdQhbVUEycgKonTFLR4aahfRXr1b0iE0cVaeXPHJmD66CjlVgtkr/y/orcvWUuKzYzTCx9WbkkIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=XhmXJ3ke; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="XhmXJ3ke"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1249b9f5703so1745963c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 03:58:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769515139; cv=none;
        d=google.com; s=arc-20240605;
        b=GMfTvhInX8rEyHjGm9yRpi/33zoFcPsXIIBOLouAxmg4i0nKwpyQ783efxPMCFHtT4
         qk5Uz6DGZfS96ArrJgLnopLlgNCZsOrkhSNYgjG5PBlNz7ra8nA7RckIrhgZaH4z4kmy
         ODBpPh+YPuMiNIC1Lvam1HQYjUN272ZMQG1KS9OsO7wfsXv2Qhj235YyPuRayD34LXJq
         G8/y7NC3tl+YcQjmjV3pFvD+OHIoa2hcE+PxUEfYVYuLfMzrs11gIYU0EnvNvK+8FBhh
         kWgLrxxOsBr76bHlFTnrabDmP9zaD3LCYk9LND311CNxhLxcLBDlj0mWU4N3sJfO7ecs
         mhNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pJ5yKhLQjq6Hec7gqI4eoL2dW5bjgRDHBF0GBjBJBPE=;
        fh=sjap1sywuljCTXl4BHuxHg+OxqkGyZaz8AaCc4FXbtI=;
        b=UoO0BRd/vAF5o7kvG/l/UXBS1Gin342lpiL+/G0mTupAYKEfRPbF7g0EHKl4th2VZC
         8Rm8QfBrdby45StkuWTHJjWJVXvhzWchrxR7aHkihqkZjHqYsw0IplRtVRYEa2Mx7Euv
         OntOqhijfK4TrRSS8nIPgqgESiCED8F2X2VY0yCa0Lvt+2qdOtCi4vGwbOvkB/A/mHb1
         FFiRQjeS/f0e4Gfs+gy/6xqK7quiNWRGSB5ykaxrpq8VakvsqVJTEp4C6ePqBD8KWDpi
         b73JvDuULW4ePKPSCb7rU84e0y34UL1ai68MgWqP93e6Va5HAejfmgqedGlp2caHsJ7N
         wx6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1769515139; x=1770119939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJ5yKhLQjq6Hec7gqI4eoL2dW5bjgRDHBF0GBjBJBPE=;
        b=XhmXJ3kenREsetRojvxDKRdyhBih/sDW5S4f3MqikAEWnUuwgmVLF/NF4IpquUaBeZ
         sbfItyZKWb6JmQ9L0XHx3C3Vpoci9rgtdkz802OkVSyMQmkYpB0BSi7Z1nrspJ/gofFe
         Do/J2HHWdanar16CsjuB5JsKNt62eklqzolDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515139; x=1770119939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pJ5yKhLQjq6Hec7gqI4eoL2dW5bjgRDHBF0GBjBJBPE=;
        b=DqWgzs0ugn6k1Vny8GbDWgWkTeOEFBPtl94dILzEBvSFQmFjtN2C56qBk10iQhc31k
         gU002iEM06Bat58DRfP1z6aFQEdBa54OWprI/W89XdHptjCeP+Fk8YiuMAitpDq4sscR
         SKSX3QrdpukBNCTbnYhaosI8IK9u5iFe0HRkozrFoqi3EfcnWH7OJMuw2UEsnJmJ1eay
         3UhObmUqUfmU9AaKPMCfdKFCD3YzxkR1GUsEWoN/PdYemTmaCbeo4f1qPJsh2VKjF1P+
         IyaokivV9R1v8mLknZPuN6/p0PqN0XGQV8kK9tJpKTP+STg0CEnzk41VQSxNQVofk3YJ
         9MkA==
X-Forwarded-Encrypted: i=1; AJvYcCX7D3g/8FOuQWQQm20hVCCAjupCjkyeN7H9F++Hlz26yuR90BVxGq1IcS/dqUG8J9rIh3Dh3CgKjyjcsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy50/+uOGWCOjUaoyz5X7DhGO7ipZnKx+dG2ibqEvB7qquWrFuC
	FZPlKJyla34nFBbQBiH7KJPky7dKa/0G6pAm3cvN2Trk3YR+f+5H42wYBRZ3jM0qmcN3hEdAVbi
	5/6Nu3rsxpJuAXNBfcwfMPc+QE5l0Rl1pFQP+IP+2
X-Gm-Gg: AZuq6aK8Qax2rOZRML8yJczu1viz873ZPpoHfXlnazM7cd+KXS02rjJHtnx7MNuu2WR
	wAMzS7IgGtETRCe1g4k3qhy22/NehSw1G1hakSJKgymcH2pKfzmxqdPs0+1lJ3IMBT4UjYUNdl6
	li6qsTFtS43cXC93MxC+WGFAQEFJarOI3a4VEgYa+zfF5gtq9JJShohFqjg1+Y/c4ExL7oScNHs
	eRX5qY0s/DuaMiSYqhK/+IxrGM9oqOJTyee+B1eVk9wV2N0TxUmcdZdi8si/Hsy0Y//r802
X-Received: by 2002:a05:7022:238a:b0:11a:c387:1357 with SMTP id
 a92af1059eb24-124a0070565mr732107c88.16.1769515139201; Tue, 27 Jan 2026
 03:58:59 -0800 (PST)
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
 <a7334568-13ce-4600-8650-607273e67976@roeck-us.net>
In-Reply-To: <a7334568-13ce-4600-8650-607273e67976@roeck-us.net>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Tue, 27 Jan 2026 12:58:32 +0100
X-Gm-Features: AZwV_QhBnmJOMJut2whouy0QDOOsNPtnN22UBBfIWJLE3JGNiRb7KMpEqqpo1do
Message-ID: <CAK8fFZ6gKs7s2rJ=f7bt24f+_cY-jGU33TvX3UP=U58uK-1KaQ@mail.gmail.com>
Subject: Re: acpi_power_meter: power*_average sysfs read hangs, mutex deadlock
 in hwmon_attr_show since v6.18.y
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Igor Raits <igor@gooddata.com>, 
	Daniel Secik <daniel.secik@gooddata.com>, Zdenek Pesek <zdenek.pesek@gooddata.com>, 
	Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Hi,
>
> On 1/23/26 02:19, Jaroslav Pulchart wrote:
> > =C4=8Dt 22. 1. 2026 v 23:28 odes=C3=ADlatel Guenter Roeck <linux@roeck-=
us.net> napsal:
> >>
> >> On 1/22/26 12:42, Rafael J. Wysocki wrote:
> >>> On Thu, Jan 22, 2026 at 8:51=E2=80=AFPM Guenter Roeck <linux@roeck-us=
.net> wrote:
> >>>>
> >>>> On 1/22/26 10:55, Rafael J. Wysocki wrote:
> >>>>> On Thu, Jan 22, 2026 at 7:21=E2=80=AFPM Jaroslav Pulchart
> >>>>> <jaroslav.pulchart@gooddata.com> wrote:
> >>>>>>
> >>>>>> Hello,
> >>>>>>
> >>>>>> after upgrading from kernel 6.17.y to 6.18.y we started to observe=
 a regression
> >>>>>> in the ACPI power meter hwmon interface. Reading power*_average sy=
sfs
> >>>>>> attributes blocks indefinitely and causes tasks to enter uninterru=
ptible
> >>>>>> sleep (D state).
> >>>>>
> >>>>> The most recent change in the acpi_power_meter driver was made in
> >>>>> 6.15, so this is not a regression in that driver.
> >>>>>
> >>>>> Also, nothing suspicious is done in power1_average_min_show() and
> >>>>> power1_average_min_store() AFAICS.
> >>>>>
> >>>>
> >>>> I suspect a circular locking problem between the hwmon lock and the
> >>>> resource lock. Unfortunately I don't immediately see it.
> >>>>
> >>>> Would it be possible to test this with a kernel which has lock debug=
ging
> >>>> enabled ? I'd test it myself but I don't have a system available
> >>>> that supports the acpi power meter.
> >>>
> >>> One problem I found in acpi_power_meter through code inspection is
> >>> calling hwmon_device_unregister() under resource->lock in
> >>> acpi_power_meter_notify(), which may be responsible for the observed
> >>> symptoms, but then I'm not sure why it started to be visible after
> >>> 6.18.
> >>>
> >>
> >> I noticed that too. It is kind of broken; a driver should never do tha=
t.
> >> The proper solution would have been to re-evaluate sensor visibility.
> >> I have a patch series to add that capability to the hwmon core, but th=
at
> >> is untested so I never submitted it.
> >>
> >> Anyway, I don't immediately see how that would trigger the problem.
> >>
> >> Guenter
> >>
> >
> > Hello,
> >
> > Thank you for the analysis and insights.
> >
> > To add some context from our side: we observe this issue shortly after
> > a server reinstall or fw updates followed by a reboot, typically when
> > hwmon sensors are accessed for the first time (e.g. by monitoring durin=
g
> > early system initialization). We have not seen it trigger during normal
> > operation, such as a simple reboot or on long-running systems.
> >
> > Given this behavior, it is possible that the issue is related to
> > hwmon_device_unregister() being triggered early during system
> > initialization, but I do not have concrete evidence at this point.
> >
> > As a workaround, we will exclude the ACPI power meter from hwmon monito=
ring
> > (Grafana Alloy) until the mentioned refactoring or a fix becomes availa=
ble.
> >
>
> Would it be possible for you to test the patch series I just sent out ?

I suppose these 5 patches from
https://lore.kernel.org/lkml/20260123182208.2229670-1-linux@roeck-us.net/
 ?
I will try them and let you know.

>
> Thanks,
> Guenter
>
