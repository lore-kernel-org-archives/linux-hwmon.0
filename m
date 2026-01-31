Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025932C0F81
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 19:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769889030; cv=pass; b=hjmBLxoNT7MB65TbDvkE+RFW0/aAGcApWcdVeibao2ihgGu44M1oSvvVixWyFUCUF9p3mL6W8GkXmKUkfQTAj6oVOE9Q3EX/mIFMGiA3ghjvXGZKeCe4PtYiWsEp/9l8ZOHfwPn7bGibg/rr65yvZf8exSdPF6jf0PLgultA2fM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769889030; c=relaxed/simple;
	bh=n/Pm7WgSCCz/NXHN5Ou5lnb5NCYPJklAKVCX+9up2do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urzEuITaNc9jVMCGkLGOPUfF1Nfg+UPgpfewZvwdvKxppaznAJ+rbquaNR5jedCsgqryZGCtx9oHUhyPs5bQkKvkGQ199Qat3gaB9j+MEh00hjQAtRMtHla4Ukjahsx37fYlKP+ibc4ZXA73J3+L9G84r94ZD/TXcn8zuMLnhMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ebz/GDAU; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ebz/GDAU"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124a1b4dd40so3989785c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 11:50:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769889028; cv=none;
        d=google.com; s=arc-20240605;
        b=GzH1+HZrEF0wbP3qOstn8/J9T7Wii4N9CrIo537It+2y/lmi+B01XTbz2D9uWTFhTF
         fB/YH6a++cZsKaLfdXLpShxnaPDi3aGYYKCaV5hxv8Iemixz1lUVHw5R3IZkJQk/oYGi
         qIVayc/ddooeiTT9pk9XU+psMfWkgSVG4ne9rNgw3QpveLQ1Qmjn++r0fn4eohy7WMI4
         rKUyrIt+syVQ57rVPKAe6cR/P/NL3fXBNVNKaLefQBxDjmxnObEhY1fAoMyri1yxx/Mt
         w+q3iX9idBfY+QgpIJJp7gqq0VeUdRe+iAqoCrS2N4jEDnppKsSZ3vjvJcio0IGUmyV/
         aKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n/Pm7WgSCCz/NXHN5Ou5lnb5NCYPJklAKVCX+9up2do=;
        fh=Psm/asWUvRC+gCGAM/lt62bylYo9IIXPzEH5XnDrSMw=;
        b=HxLNpFIqob6ojalh0T/vnX2rQTpUaQl2lxYlWcGqrvggyTgPS0kLrgshiUPWycuGVB
         Jp2BbCUDbJgDy8x2KKdB0GyDQWgxxcHb/Tb5LS2c0O8Ft+zaJ5ga7ugJtxHZd7NW+QBa
         EeC9ThzQdyxnW14QN9OV3Q6MvDmAcbXkd9ijhI+0Clov0iofanh8tbiLFCYC15rw41YJ
         Vnvnb3Dt6B/bP4G7FyXrYei8p5nxS+HIfgTuBIEZuq1ikpe2yMA0FQs5aolKVtW2f7Mq
         9IKMMlARqPLYd5dIQKqxUwSpzxU1Sk2MJXlnCGxcgW6v1+t4366cALB0VOI38NV8tLJe
         movg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769889028; x=1770493828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/Pm7WgSCCz/NXHN5Ou5lnb5NCYPJklAKVCX+9up2do=;
        b=Ebz/GDAU/VMMPDJvB8jPoPtw5g5xKdXlmjY96fWzK12YdfHBi5W+8etoaooBs8Ilnj
         MMkems212t1g9TawwaQCoqA0JrwpljG5UwsgEoxkQ+NSC56+vzx71rAk9GX0g7AGZl0F
         OGDskqF67SKkao2++FgvbPY3ITJWeNahnSRfR3DdB/MymkUW8KqZ1DWCWzhQuS4DcTCj
         c+EBSsmfbGE4OAfaA/RnhzHD+M+gpYq6y/9jjvsDuZ3QkVHfs2OzLAWhJO3Drzm17k31
         Y+aujWJM9SM01ZANLWFN343XuEpujqm28zUODo+1EIKNCDwervITTJZwyz5PLt50TovQ
         Ba0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889028; x=1770493828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n/Pm7WgSCCz/NXHN5Ou5lnb5NCYPJklAKVCX+9up2do=;
        b=wLQ3Oaxt9k64ie35imH6msLk8lY+G13mMguF4TaFhkh510ryb9cGmJJ586Z1B4/BEP
         5dVcf9yrJsIDvpvZe7hvFZIOIZ16TTFMl09bMcn6IiIcbrQBx3MmugZzV7tS35BuhqDc
         XBc4Af1BfPWltG8un4O3D97G6M50/O3ovaHeXXJNeRuDAz/v3d6ZttkJslpFyTWa9XlZ
         W3ecesR9h1x81zeCTDXysIOuadhn27ztTvzSDP/v3J0mH/9F7dcA9k9RlFI8lFKi4yGA
         GTHSKpnSIZIMj3LJ/lBWmo1XGe5XYepGxu6R/PFMGHD+/lNAg+RwVztJ33EVjjSCPynN
         0iNA==
X-Forwarded-Encrypted: i=1; AJvYcCXkO2JclEqS7UGVsP5bbg7Op1qfAIaSVTKMkj5OW/GlXqpPAcebkx/lGtrL9TQAYIvyJ0GpMPTWfFnaJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAlpVbksl2STQAOiYX3j6wYIobSk0PTMC/cal+I4apDvnYhM+9
	zFdwsLLpGeFpezyobMfFgnuGkZgkeShWXRZn9qroahWYLuGVgV///r8qa+o9gHkgTzLhp6RUsd5
	H7wY/cx1FLGgwQdR7n3lxIe6NiWUvUQ9Muws1a/M=
X-Gm-Gg: AZuq6aLi8ANcbInLtEZQ/bGUy9H072gl8vRJQ8yth+DX+DqBC49htNX/H+mFCCkD1hm
	38lM9rBdntPg6ypU6UcP9ahe+oEr26dRHngbmWoYhDa1cGYOlfRxI18Cf/KRWeA01yWJhOpN0I7
	RFwSoU/WHBGN6sSCz4fYmPtLXzeddo+gJkP6OLdtvmaDyq7B/sDSrBHUvnIFq30dhmmKyFnlLkG
	FghyRXWUCTt6+sHv03KT0Bkz5mNvcS5Gf8zf0/QLLRXzbv358JjOBQUXc3KoSXnERn3EOYPwdoj
	VF3ITwFa
X-Received: by 2002:a05:7022:628d:b0:11a:fe6f:806a with SMTP id
 a92af1059eb24-125c0fdfb0bmr3134197c88.31.1769889027954; Sat, 31 Jan 2026
 11:50:27 -0800 (PST)
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
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de> <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
In-Reply-To: <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Sat, 31 Jan 2026 22:50:11 +0300
X-Gm-Features: AZwV_QhCVNL4VMm843eTmmKqpzImXOApjP7BdCo9NwD8TYbajIGbuLLcbSkR3OM
Message-ID: <CAJ12PfM5xf0+Qy07S5OoLPkpnhZz+bj5a+hTSGTfrEFN2R6PCw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 1:35=E2=80=AFPM TINSAE TADESSE
<tinsaetadesse2015@gmail.com> wrote:
>
>
>
> On Mon, Jan 26, 2026 at 1:36=E2=80=AFAM Guenter Roeck <linux@roeck-us.net=
> wrote:
> >
> > On 1/24/26 11:11, Armin Wolf wrote:
> > > Am 24.01.26 um 15:45 schrieb TINSAE TADESSE:
> > >
> > >> On Fri, Jan 16, 2026 at 9:24=E2=80=AFAM Guenter Roeck <linux@roeck-u=
s.net> wrote:
> > >>> On 1/15/26 05:50, TINSAE TADESSE wrote:
> > >>>> On Wed, Jan 14, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@roeck=
-us.net> wrote:
> > >>>>> On 1/14/26 05:07, TINSAE TADESSE wrote:
> > >>>>> ...
> > >>>>>>>> Hi Guenter,
> > >>>>>>>>
> > >>>>>>>> I tested changing the i801 SMBus controller to use
> > >>>>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
> > >>>>>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With th=
is
> > >>>>>>>> change, spd5118 resume failures (-ENXIO)
> > >>>>>>>> still persist, suggesting PM ordering alone is insufficient an=
d other
> > >>>>>>>> firmware interactions are involved.
> > >>>>>>> How about the problem in the suspend function ? Is that also st=
ill seen ?
> > >>>>>>>
> > >>>>>>> Also, the subject talks about -EIO. Is that still seen ?
> > >>>>>>>
> > >>>>>>> Either case, can you enable debug logs for the i801 driver ?
> > >>>>>>> It should generate log entries when it reports errors.
> > >>>>>>>
> > >>>>>>> Thanks,
> > >>>>>>> Guenter
> > >>>>>>>
> > >>>>>> Hi Guenter,
> > >>>>>>
> > >>>>>> Thank you for the questions. To clarify:
> > >>>>>>
> > >>>>> Please do not drop mailing lists from replies.
> > >>>>>
> > >>>>>> 1) I have not observed any failures in the suspend path. The sus=
pend
> > >>>>>> callback completes successfully, and
> > >>>>>> I have not seen I2C errors or warnings during suspend at any poi=
nt.
> > >>>>> Sorry, I seem to be missing something.
> > >>>>>
> > >>>>> In that case, what is the point of patch 3/3 of your series which
> > >>>>> removes hardware accesses from the suspend function ?
> > >>>>>
> > >>>>>> 2) I have also not observed -EIO in my testing. The error consis=
tently
> > >>>>>> reported on resume and subsequent hwmon access is -ENXIO.
> > >>>>>> Earlier references to -EIO were based on assumptions rather than
> > >>>>>> observed logs, and I should have been clearer about that.
> > >>>>>>
> > >>>>> Thanks for the clarification.
> > >>>>>
> > >>>>> Guenter
> > >>>>>
> > >>>>>> I am enabling debug logging for the i801 driver to collect more
> > >>>>>> concrete evidence of controller state during resume.
> > >>>> Hi Guenter,
> > >>>>
> > >>>>> Sorry, I seem to be missing something.
> > >>>>>
> > >>>>> In that case, what is the point of patch 3/3 of your series which
> > >>>>> removes hardware accesses from the suspend function ?
> > >>>> You are right to question this, and I agree that it needs clarific=
ation.
> > >>>>
> > >>>> Patch 3/3 was originally proposed under the assumption that the re=
sume failures
> > >>>> were caused by spd5118 performing I2C transactions while the
> > >>>> controller was not yet available,
> > >>>> and that removing hardware accesses from the suspend path might
> > >>>> mitigate the issue.
> > >>>> At that point, I assumed the problem was limited to the resume cal=
lback.
> > >>>>
> > >>>> After enabling detailed i801 debug logging and testing with
> > >>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
> > >>>> it became clear that this assumption was incorrect. The controller
> > >>>> itself reports "i801_smbus: No response"
> > >>>> both during suspend and immediately after resume, and spd5118 mere=
ly
> > >>>> propagates the resulting -ENXIO.
> > >>> Outch, that really hurts, because it means that something is seriou=
sly
> > >>> broken in both the suspend and resume path. The device _must_ be ac=
cessible
> > >>> in the suspend path. Otherwise there is no guarantee that the devic=
e is
> > >>> accessible for normal (pre-suspend) operation. After all, someone c=
ould
> > >>> run a script reading sysfs attributes in a tight loop continuously,
> > >>> or the thermal subsystem could try to access the chip. That would s=
uddenly
> > >>> start to fail if something in the device access path starts to be s=
uspended
> > >>> while the underlying hardware is still believed to be operational.
> > >>>
> > >>> I could imagine some hack/quirk for the resume path, such as delayi=
ng resume
> > >>> for some period of time for affected hardware, but I have no idea w=
hat to
> > >>> do on the suspend side. We can not just drop device writes during s=
uspend
> > >>> because some broken hardware/firmware does not let us actually acce=
ss
> > >>> (and thus suspend) the hardware anymore by the time the suspend fun=
ction
> > >>> is called.
> > >>>
> > >>> Guenter
> > >>>
> > >>>> This indicates that the issue is not caused by spd5118 suspend/res=
ume
> > >>>> behavior, but by the unavailability of the
> > >>>> SMBus controller due to platform or firmware interactions during
> > >>>> s2idle transitions.
> > >>>>
> > >>>> Given this, I agree that patch 3/3 does not address the root cause=
 and
> > >>>> does not provide a justified improvement.
> > >>>> I am therefore fine with dropping it.
> > >>>>
> > >>>> Thank you for pointing this out.
> > >>>>
> > >> Hi Guenter,
> > >>
> > >> Thanks for the continued review and for questioning the earlier
> > >> direction =E2=80=94 that helped narrow this down properly.
> > >>
> > >> After enabling full i801 debug logging (included below in this email=
)
> > >> and inspecting both drivers, it became clear that the resume
> > >> failures are not caused by spd5118 accessing the hardware too
> > >> early, nor by PM ordering issues. Instead, the SMBus controller
> > >> explicitly reports =E2=80=9CSPD Write Disable is set=E2=80=9D, and a=
ny
> > >> block write transactions to the SPD device consistently fail with
> > >> DEV_ERR. spd5118 merely propagates the resulting -ENXIO.
> > >
> > > Oh no, this likely happens even when merely reading values, as the sp=
d5118
> > > uses a page register to switch between different register pages. In o=
rder
> > > to access temperature data (page 0), you might already have to issue =
a
> > > write access to the page register. The only reason why it works for y=
ou
> > > is that the spd5118 likely already has page 0 selected by the system =
firmware
> > > during boot.
> > >
> >
> > Exactly. There is no guarantee that page 0 is selected.
> >
> > >> With that in mind, I have dropped the earlier patch that attempted
> > >> to remove hardware access from the suspend path
> > >> unconditionally.
> > >> That patch does not address the root cause and is no longer
> > >> part of the series.
> > >>
> > >> I am instead proposing a minimal 2-patch series:
> > >>
> > >> 1/2 records whether the platform enforces SPD write disable at probe
> > >> time (no behavior change).
> > >> 2/2 avoids regcache writeback during suspend/resume when the device
> > >> operates in read-only mode, while still allowing read access to
> > >> temperature inputs.
> > >>
> > >> This avoids issuing SMBus transactions that are architecturally
> > >> blocked on these systems, and does not rely on
> > >> delays or PM ordering assumptions, and leaves behavior unchanged on
> > >> platforms where SPD writes are permitted.
> > >>
> > >> If this direction looks acceptable, I=E2=80=99m happy to re-spin and=
 post the
> > >> series formally.
> > >>
> > >> Thanks again for the guidance.
> > >
> > > I do not know if this is a reliable solution, as the system firmware =
might
> > > select a different register page during resume. This will then preven=
t the
> > > driver from functioning.
> > >
> >
> > No, it is not reliable. The driver is simply not usable in this scenari=
o.
> > This isn't just the temperature sensor code - the eeprom code is affect=
ed
> > as well.
> >
> > > I would love to see the spd5118 driver working on such systems with r=
educed
> > > functionality, but i will leave it to Guenter to decide if this appro=
ach is
> > > maintainable.
> > >
> > > Besides that: did the spd5118 driver load automatically on your devic=
e?
> > >
> >
> > I thought that was disabled. The i801 driver is supposed to detect if w=
rite
> > protect is enabled and, if so, it is supposed to not instantiate the sp=
d5118
> > driver for DDR3. Support for this was added with commit 4d6d35d3417d ("=
i2c:
> > smbus: introduce Write Disable-aware SPD instantiating functions"). App=
arently
> > the code to do this never made it into the i801 driver.
> >
> > The i801 driver needs to be fixed to inform the spd initialization code
> > that the spd5118 address range is write protected. The patch to do this=
 was
> > "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I have=
 no idea
> > why that patch didn't make it upstream.
> >
> > Guenter
> >
>
> Hi Guenter,
>
> > > The i801 driver needs to be fixed to inform the spd initialization co=
de
> > > that the spd5118 address range is write protected. The patch to do
> > > this was
> > > "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I
> > > have no idea
> > > why that patch didn't make it upstream.
>
> I initially considered exposing SPD write-protection as a capability to b=
e consumed by spd5118.
> However, spd5118 already depends on firmware-initialized state (page sele=
ction) and cannot reliably
> determine safe operation at probe time without issuing writes.
> Given that, suppressing SPD instantiation in the i801 driver when SPD Wri=
te Disable is
> the only solution here.
>
> Tested the remaining patch [1], and it does not seem to fix the issue, as=
 it is added at the wrong stage
> in the initialization of the i801 driver. The attached log shows that spd=
5118 is instantiated and fully probed
> before the "do not instantiate spd5118 under SPD Write Disable" is acted =
upon.
> This confirms that suppressing instantiation must occur before adapter re=
gistration in i801.
> Once the adapter is registered, the SPD scan has already happened, and sp=
d5118 has bound successfully
> based on the firmware-initialized state, even though correct operation is=
 impossible.
> Therefore, the fix must be run prior to adapter registration.
>
> [1] https://lore.kernel.org/all/20250430-for-upstream-i801-spd5118-no-ins=
tantiate-v2-2-2f54d91ae2c7@canonical.com/
>
>
> The fix is to register the SPD write-disable policy before i2c_add_adapte=
r(), so the I2C core never
> probes SPD addresses on write-protected platforms.
>


Hi Guenter,

While investigating this issue, I previously mentioned
about a flow where SPD write disabled state can be
exported as a capability from the i801 controller, so
that the SPD5118 hwmon driver consumes it.

The SPD write disabled state is known to the controller
driver (i2c-i801), but this information is not
propagated to client drivers. As a result, auto-detected
devices may be instantiated and probed even though the
controller cannot support the required access model.

This raises a major architectural question:

Should SMBus / I2C controller drivers be able to
advertise bus-level capability constraints (such as SPD
write disabled state) to client drivers, so that clients can
make an informed decision during probe?

A capability-based approach would allow:
* controller drivers to expose what is possible on a given bus
* client drivers to decide whether they can operate correctly
* avoidance of device-specific policy in controller drivers
* consistent handling across different SPD-capable devices

I actually tested the possibility of detecting, propagating,
and consuming the SPD write disabled state using an I2C
adapter capability flag. Using this approach, I was able to
fix the issue even with the CONFIG_SENSORS_SPD5118_DETECT
kernel configuration enabled.

At this stage, I am not proposing a specific implementation.
The goal of this RFC is to get agreement on whether this type
of problem should be solved through capability propagation,
and if so, what mechanism would be preferred.

Any feedback on design direction, or existing infrastructure
that could be reused would be very welcome.
