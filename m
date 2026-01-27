Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599752D838B
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509844; cv=pass; b=nSR2sw7jFMTJ6Q7zuYsdZgTflyLUTBb8lJLLF5uztu7ErIwI/qERRR4wLSqNAHRTU+KYLfCxRxGBDVhDmigrV7INcrJCXGam4IdLoYKWOAlWZe6cuhMIpZ/AGdNz7Kl0LDdqZPQOVAikvTsxSP3mOIG+7vSf3IM500gBqpzPEyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509844; c=relaxed/simple;
	bh=9g9oGfaUnztt60FB0lvS6IQwNzuIYRjQqdxAKg3eTn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UudfTTzkGAC92h7VIFbxerxZHV0kjSEQFP8pGd/NkfaTmuX/++prKhUc1Y8HL6PaVFtTmZbxE714XkZmSLGpcbNEecqJfaplcis6qcr/Zgj/h4dASqZbdBVaNSd0duQPo5RpPtGsH5BZQE5Z7xEaJe9UzLuYxfX5EPPELCYz+Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4wiKFck; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4wiKFck"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-124899ee9d3so1678995c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 02:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769509841; cv=none;
        d=google.com; s=arc-20240605;
        b=WwyWPqg4qXYxSkmsX5IHiL4V95ZJnuntqeKeQ8/L7lbUWj0kduZhhKRFPavzCXOC6W
         /7y+HGuqIZW53pkCUyDOPkwYBCtbMUU3onH9uc58yNE2eKmiOnfifKjgqyPlBr0lvq2m
         MAUknwxgRC09T6+JbVT1vdllYR/RrFuIcrRnmj9ENXRmU9RTKNiYFSPl4bd+MGEGvXH1
         4vaS82y2JabvGdUbnZfIEkIK59BejJo8VQAgwgYG5s97sJKkOsEHA5GFZqOlNg6dw0fi
         GZMh6qTY52KyLi4eJ8bB9kQlW95A+0cTO/8ZqoUlhrIpF145M7FlP8v1ghMcMFGZeenO
         IgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfFXpsHpaJ8rjQ57Q+EOmcJe+5Yzu/H9s1lzzAYZnWc=;
        fh=S03ccsj1YAMU+xbGrZyt0rn/jd9QiQhL7ilSoL5Vcv0=;
        b=W0gxskwsnCxC7DR6BqY2o5Uio5qXGGnaEStytg4/FS3/j0XaTzT+0lghlZgHyYi9Dr
         hXNx7ncVq3dswlKZkLUQPhm90/t9aFwZvoeO4dqk8y8pa3wKi6TIiE9A3oUGc9qsW5l3
         jj+KVkBqxFsp6cbzd+5VOMns7Eh0Fka49VokwZbQbl3DFsuP0z0kqjbLh/TvseVhHudt
         ec8FzxJr8k0dFqd3eH6hM0mpr3koY62UksqgZ8hBSacqtqtG7GzbLzbtNz7nqi+q3TZ4
         KRsAxZpCT+wxSx4KGklMrHqIMl6GVpMiViZVc+MfFCwOIb+DjTKEmvgNJLf+5EGd4/hz
         WupQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769509841; x=1770114641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfFXpsHpaJ8rjQ57Q+EOmcJe+5Yzu/H9s1lzzAYZnWc=;
        b=X4wiKFckA+ibnu4vdJldXofRefa7NX8L0EnTFfjrXeHGVzt6uc5vy1yCbs7urYRPA/
         YF+d5kRgr0zQfXV7C3UlVOEnirsnIZVK0YaWs0BjDxeMHVySelffbNuW2yf6H/vEKXCD
         xnO3GFYhqAYA8aOAvJmdJbUMwyhRAomSgJWjvdEXqKqujLkyWFkoIMUDPgaKEM6JVsB6
         1vxO7wsTnyW/pSRUACzWqoYSA1ikj6g4GuJzvQLDIWiRB6L1UU8k7UQc5lGreAXBD84l
         ScG2FNl3SHyFBnUtD1zjFAQm5wCaAUYGalKOccpf0GdSRtl0ehz0ha1+GsIFPtxd4yTd
         YiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509841; x=1770114641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vfFXpsHpaJ8rjQ57Q+EOmcJe+5Yzu/H9s1lzzAYZnWc=;
        b=q6KcSuPcZxCA8VnXiaAiylgPYxrLybkTapIoTChZ5FOqonGPA2oUda3Gvs/ENjgOtx
         uR1jNzMIbV0MIwP5t+pNuPBq1zaPoTb0jRE7AHZ5G/kCgzuCdIAP6Bg98jxR27b4jZr5
         3Qpswm2wuJ3mUF/G31Kt8HS0P0OfOn8B3wbm99AzP2HepSCue02EsaF3e+JwepVs5D4g
         zh8SOoikbaTy5ZxBVgySFvyDqDYYcNI0PEnaeFCfNLrjIXLRcvMs+gkeGmICxOWgUS8g
         VtS2ws9jHFq102Kp20JDpsYBFjp6iHJlQg05bymwa6+tS5jnTuBJr+QVkOjIpCVBHa5m
         LGyg==
X-Forwarded-Encrypted: i=1; AJvYcCX+NB5k3z+fTNr05yD9BNCHaatDhBBxCKtOFY3trYKkwpOjm79+iCGmU7ciIU4um6igZL7C3foqPtYfdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDAubYff/6i1dAGcSPBfl5cjXKPVwG9MGjj6vEP/tMJpEF6J8/
	q97dTPAHEBd1gk0JtSCC9DZPfsDTceKMrt6D7ogVaCHBXcR2G8YL53Hd2xbKMYH5tapOoX1xWd6
	S/aXU3eeNySJ4rcTOgo762Fzd15UhhYw=
X-Gm-Gg: AZuq6aKNtZksY7nKKlvLCfM15ykEBHLWh7RA+OUqK496bP38BnSFgIbzdeH1mSZ1sje
	Q7jIWGHJVLRwl6FYmpLXVPudGqVZaSxheOf0868oG4K6EtaPnzhNvwQgNAEKx8Lc/dkGqrjzKGa
	fJp1WARKgrAbEU6u6QF4RhQaTT+klc6t+mfMBI7lfyHMxlDu9TNxJSAodkvwBDNUCEEx8ViFRCh
	YYW+zAdrIOIMtX5LA9YA/d499dAxii+6w6DRC8KkWozNPydaRjcyCmco7L74VacIPsOtM/nCSOk
	An4M7A==
X-Received: by 2002:a05:7022:321:b0:11f:19f9:c5f9 with SMTP id
 a92af1059eb24-124a0e64fe9mr662196c88.12.1769509841143; Tue, 27 Jan 2026
 02:30:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net> <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
 <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net> <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net> <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net> <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
In-Reply-To: <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Tue, 27 Jan 2026 13:30:24 +0300
X-Gm-Features: AZwV_QhGLaO5Mu60Es5yKRgndpJQy3O60e5vY52hpkqLnZcrBh_pevLsV9y-lRs
Message-ID: <CAJ12PfOFNZPnxPecqHHEPLhcLa8iN_rBHF11-XA7OYZCxtPZ=A@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Armin Wolf <W_Armin@gmx.de>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 10:11=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 24.01.26 um 15:45 schrieb TINSAE TADESSE:
>
> > On Fri, Jan 16, 2026 at 9:24=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >> On 1/15/26 05:50, TINSAE TADESSE wrote:
> >>> On Wed, Jan 14, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@roeck-us=
.net> wrote:
> >>>> On 1/14/26 05:07, TINSAE TADESSE wrote:
> >>>> ...
> >>>>>>> Hi Guenter,
> >>>>>>>
> >>>>>>> I tested changing the i801 SMBus controller to use
> >>>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
> >>>>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
> >>>>>>> change, spd5118 resume failures (-ENXIO)
> >>>>>>> still persist, suggesting PM ordering alone is insufficient and o=
ther
> >>>>>>> firmware interactions are involved.
> >>>>>> How about the problem in the suspend function ? Is that also still=
 seen ?
> >>>>>>
> >>>>>> Also, the subject talks about -EIO. Is that still seen ?
> >>>>>>
> >>>>>> Either case, can you enable debug logs for the i801 driver ?
> >>>>>> It should generate log entries when it reports errors.
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Guenter
> >>>>>>
> >>>>> Hi Guenter,
> >>>>>
> >>>>> Thank you for the questions. To clarify:
> >>>>>
> >>>> Please do not drop mailing lists from replies.
> >>>>
> >>>>> 1) I have not observed any failures in the suspend path. The suspen=
d
> >>>>> callback completes successfully, and
> >>>>> I have not seen I2C errors or warnings during suspend at any point.
> >>>> Sorry, I seem to be missing something.
> >>>>
> >>>> In that case, what is the point of patch 3/3 of your series which
> >>>> removes hardware accesses from the suspend function ?
> >>>>
> >>>>> 2) I have also not observed -EIO in my testing. The error consisten=
tly
> >>>>> reported on resume and subsequent hwmon access is -ENXIO.
> >>>>> Earlier references to -EIO were based on assumptions rather than
> >>>>> observed logs, and I should have been clearer about that.
> >>>>>
> >>>> Thanks for the clarification.
> >>>>
> >>>> Guenter
> >>>>
> >>>>> I am enabling debug logging for the i801 driver to collect more
> >>>>> concrete evidence of controller state during resume.
> >>> Hi Guenter,
> >>>
> >>>> Sorry, I seem to be missing something.
> >>>>
> >>>> In that case, what is the point of patch 3/3 of your series which
> >>>> removes hardware accesses from the suspend function ?
> >>> You are right to question this, and I agree that it needs clarificati=
on.
> >>>
> >>> Patch 3/3 was originally proposed under the assumption that the resum=
e failures
> >>> were caused by spd5118 performing I2C transactions while the
> >>> controller was not yet available,
> >>> and that removing hardware accesses from the suspend path might
> >>> mitigate the issue.
> >>> At that point, I assumed the problem was limited to the resume callba=
ck.
> >>>
> >>> After enabling detailed i801 debug logging and testing with
> >>> SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
> >>> it became clear that this assumption was incorrect. The controller
> >>> itself reports "i801_smbus: No response"
> >>> both during suspend and immediately after resume, and spd5118 merely
> >>> propagates the resulting -ENXIO.
> >> Outch, that really hurts, because it means that something is seriously
> >> broken in both the suspend and resume path. The device _must_ be acces=
sible
> >> in the suspend path. Otherwise there is no guarantee that the device i=
s
> >> accessible for normal (pre-suspend) operation. After all, someone coul=
d
> >> run a script reading sysfs attributes in a tight loop continuously,
> >> or the thermal subsystem could try to access the chip. That would sudd=
enly
> >> start to fail if something in the device access path starts to be susp=
ended
> >> while the underlying hardware is still believed to be operational.
> >>
> >> I could imagine some hack/quirk for the resume path, such as delaying =
resume
> >> for some period of time for affected hardware, but I have no idea what=
 to
> >> do on the suspend side. We can not just drop device writes during susp=
end
> >> because some broken hardware/firmware does not let us actually access
> >> (and thus suspend) the hardware anymore by the time the suspend functi=
on
> >> is called.
> >>
> >> Guenter
> >>
> >>> This indicates that the issue is not caused by spd5118 suspend/resume
> >>> behavior, but by the unavailability of the
> >>> SMBus controller due to platform or firmware interactions during
> >>> s2idle transitions.
> >>>
> >>> Given this, I agree that patch 3/3 does not address the root cause an=
d
> >>> does not provide a justified improvement.
> >>> I am therefore fine with dropping it.
> >>>
> >>> Thank you for pointing this out.
> >>>
> > Hi Guenter,
> >
> > Thanks for the continued review and for questioning the earlier
> > direction =E2=80=94 that helped narrow this down properly.
> >
> > After enabling full i801 debug logging (included below in this email)
> > and inspecting both drivers, it became clear that the resume
> > failures are not caused by spd5118 accessing the hardware too
> > early, nor by PM ordering issues. Instead, the SMBus controller
> > explicitly reports =E2=80=9CSPD Write Disable is set=E2=80=9D, and any
> > block write transactions to the SPD device consistently fail with
> > DEV_ERR. spd5118 merely propagates the resulting -ENXIO.
>
> Oh no, this likely happens even when merely reading values, as the spd511=
8
> uses a page register to switch between different register pages. In order
> to access temperature data (page 0), you might already have to issue a
> write access to the page register. The only reason why it works for you
> is that the spd5118 likely already has page 0 selected by the system firm=
ware
> during boot.
>
> > With that in mind, I have dropped the earlier patch that attempted
> > to remove hardware access from the suspend path
> > unconditionally.
> > That patch does not address the root cause and is no longer
> > part of the series.
> >
> > I am instead proposing a minimal 2-patch series:
> >
> > 1/2 records whether the platform enforces SPD write disable at probe
> > time (no behavior change).
> > 2/2 avoids regcache writeback during suspend/resume when the device
> > operates in read-only mode, while still allowing read access to
> > temperature inputs.
> >
> > This avoids issuing SMBus transactions that are architecturally
> > blocked on these systems, and does not rely on
> > delays or PM ordering assumptions, and leaves behavior unchanged on
> > platforms where SPD writes are permitted.
> >
> > If this direction looks acceptable, I=E2=80=99m happy to re-spin and po=
st the
> > series formally.
> >
> > Thanks again for the guidance.
>
> I do not know if this is a reliable solution, as the system firmware migh=
t
> select a different register page during resume. This will then prevent th=
e
> driver from functioning.
>
> I would love to see the spd5118 driver working on such systems with reduc=
ed
> functionality, but i will leave it to Guenter to decide if this approach =
is
> maintainable.
>
> Besides that: did the spd5118 driver load automatically on your device?
>
> Thanks,
> Armin Wolf
>
> >
> >
> > [   13.530830] i2c-core: driver [spd5118] registered
> > ...
> > [   29.555298] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> > ...
> > [   29.582447] i2c i2c-14: Creating spd5118 at 0x52
> > [   29.590744] spd5118 14-0052: probe
> > ...
> > [   29.618983] spd5118 14-0052: DDR5 temperature sensor: vendor
> > 0x00:0xb3 revision 2.2
> > [   29.619662] i2c i2c-14: client [spd5118] registered with bus id 14-0=
052
> > ...
> > [ 1057.504362] PM: suspend entry (s2idle)
> > [ 1057.944405] spd5118 14-0052: Entering suspend path...
> > [ 1057.945387] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
> > size=3D8, addr=3D0x52, read_write=3D1
> > [ 1057.946251] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
> > size=3D8, addr=3D0x52, read_write=3D1
> > [ 1057.946866] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
> > size=3D8, addr=3D0x52, read_write=3D1
> > [ 1057.948324] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
> > size=3D8, addr=3D0x52, read_write=3D1
> > [ 1057.949817] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
> > size=3D8, addr=3D0x52, read_write=3D0
> > [ 1057.949904] i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4,
> > SMBHSTCNT=3D0x15, SMBHSTSTS_DEV_ERR=3D4
> > [ 1057.949952] i801_smbus 0000:00:1f.4: No response
> > [ 1057.950215] i801_smbus 0000:00:1f.4: Entering suspend path...
> > [ 1059.338647] ACPI: EC: interrupt blocked
> > [ 1060.756385] ACPI: EC: interrupt unblocked
> > [ 1060.926423] i801_smbus 0000:00:1f.4: Entering resume path...
> > [ 1060.926623] spd5118 14-0052: Entering resume path...
> > [ 1060.927930] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
> > size=3D8, addr=3D0x52, read_write=3D0
> > [ 1060.927969] i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4,
> > SMBHSTCNT=3D0x15, SMBHSTSTS_DEV_ERR=3D4
> > [ 1060.927995] i801_smbus 0000:00:1f.4: No response
> > [ 1060.928477] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
> > size=3D8, addr=3D0x52, read_write=3D0
> > [ 1060.928517] i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4,
> > SMBHSTCNT=3D0x15, SMBHSTSTS_DEV_ERR=3D4
> > [ 1060.928543] i801_smbus 0000:00:1f.4: No response
> > [ 1060.928582] spd5118 14-0052: Failed to write b =3D 0: -6
> > [ 1060.928707] spd5118 14-0052: PM: dpm_run_callback(): spd5118_resume
> > returns -6
> > [ 1060.928981] spd5118 14-0052: PM: failed to resume async: error -6
> > [ 1062.414560] PM: suspend exit
> >


Hi Armin,

> >> Besides that: did the spd5118 driver load automatically on your device=
?
Yes.


> >> Oh no, this likely happens even when merely reading values, as the
> >> spd5118
> >> uses a page register to switch between different register pages. In
> >> order
> >> to access temperature data (page 0), you might already have to issue a
> >> write access to the page register. The only reason why it works for yo=
u
> >> is that the spd5118 likely already has page 0 selected by the system
> >> firmware
> >> during boot.

I tested the assumption by explicitly attempting to switch the SPD5118
page in i2c_probe()
using the same mechanism as the existing recovery logic. On my
platform, the write to
SPD5118_REG_I2C_LEGACY_MODE fails with SMBHSTSTS_DEV_ERR, and the page
remains unchanged.
This demonstrates that page selection requires a write and cannot be
performed on platforms
with SPD write disable. Temperature reads therefore only work because
firmware has
pre-selected page 0, and Linux has no way to recover if that state is
lost (e.g. across suspend).
This confirms that a =E2=80=9Cread-only SPD=E2=80=9D mode cannot be made ro=
bust.

/* Simulate later temp read attempts depend on startup page writes */
dev_info(dev, "(i2c-probe) Initial legacy_mode =3D 0x%02x\n", mode);
i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode |
SPD5118_LEGACY_PAGE_MASK);
mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
dev_info(dev, "(i2c-probe) Updated legacy_mode =3D 0x%02x\n", mode);

/* Log output */
i801_smbus 0000:00:1f.4: SPD Write Disable is set
i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
...
spd5118 14-0052: (i2c-probe) Initial legacy_mode =3D 0x00
i801_smbus 0000:00:1f.4: i801 access: command=3Db, size=3D2, addr=3D0x52, r=
ead_write=3D0
i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4, SMBHSTCNT=3D0x9,
SMBHSTSTS_DEV_ERR=3D4
i801_smbus 0000:00:1f.4: i801 access: command=3Db, size=3D2, addr=3D0x52, r=
ead_write=3D1
spd5118 14-0052: (i2c-probe) Updated legacy_mode =3D 0x00
