Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0033F38F
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510174; cv=pass; b=eJdHLjoywIFzyFxXQWNQbOhuNiWeSijs/iRPOI+Es5H+BpgnUK4zXFTq2+EHhncduCPQ0KvwXKouCzaiwE401KKNxbXfubZ9fxK6vqNrflEaH+kNklNML3f7SFkR20CHZPiBXitTs40ypXIp2zQdVa8sxdoGf3TwZyc2K5kHrk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510174; c=relaxed/simple;
	bh=6jMpzu3juDBtBV5RLFDPbYgQsAMv2h2mjBBv+j2+R64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YHR+Y2SJEiZz+sCzDzvBbHttyOU4EZS4C7KwpoUiMb2qJeW2CGv5AJM78ukSqiGVC21S1MelefiFdO99iQ+eGCxGI1vViziAtr+TgWkqxbcz0BwBVALGTr512l8mUbyuEzUT4Wp7amgPTFd6EnCnhPAJsviYHasyBbS97xI1z8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iARLBbO/; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iARLBbO/"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124899ee9d3so1681469c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 02:36:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769510171; cv=none;
        d=google.com; s=arc-20240605;
        b=FM/d6EwbIrhlS+GrPdWS+RMKfAap19cZzlGAoQ6V4GhJZVPDc7/atUDsoRwsk5isEr
         Qk4HUwdwXgM7DKin/Q1OFZLE8J3feRQRkhqk2qnfJ90/HnNe454DkxP8fYnkiD7Gy4W+
         nY1LBuxtwg96Z9kPyU8mXIcKsIJhrX9fWNpp6e3QmwdnReCnbNoEQh1nTjQ1AUAXR/ka
         x7hDjPZ/3FW5cLxOYtd4RRtKV+zm/NxoPbNesNoJpMQ/VvmsccfWsp5Zx+M57YWlGrCZ
         ChWG6TJNQZQhZj5y9IrditH9Az41C+f6+FFQL223MHOA9pXZ9OAMVkmsXHCWuGFNx9Ru
         +DuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6jMpzu3juDBtBV5RLFDPbYgQsAMv2h2mjBBv+j2+R64=;
        fh=c8IX4HYidpg3TqRLxUcswQn7LAAYCQm5U8ZOvG6tyco=;
        b=FsSQYTzq+5sbQ/fquYWAfrxfwkVU0gQJsgXN16e2EIPFs0xd5g8kV6MxeqEEwQ057c
         Owe/3ibf9wivwCQi6svBeX8kHDyVcuS3HvGBjOIFIj195FlZDZ43/Pjy7RuMjN1DSxwS
         PsYoD/gPcyiyITGLnRK4M8LNT/r38kmZupVO133rLr4yrMZ/apC+fKQPNg4LXH/BXjUj
         Q3Hu9i8Jkd0BEhmY7MubCNt7CL63QiFtuD66Na8D1SnAJBM8GXyQXdFdhHNAZYZGaxyo
         HhsconpuY6OcnFYdbZ8T7fTnaJ17Q91CxCVWlUnNdpjSYh48yl1Nb3gx/7ZMY+ZxCak2
         FKtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769510171; x=1770114971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6jMpzu3juDBtBV5RLFDPbYgQsAMv2h2mjBBv+j2+R64=;
        b=iARLBbO/FYKLFLw/37syXj69NdZ4sl2xHPGgSCrE5rOAF6ZVh6aBlZrLvoj9MSLD74
         KDzomDynQ5hefVot7wgNw2pzka6RnnQPTSfsmF9er9vI6jflyFAewYw9X1UDWqJi0SQI
         Yrc0A2AiCDv98sutIwoy6ccgAgtCafbaE6X6RSDGKmCsRncUgQ5TS3350sSY3/OBz0k8
         loxKmuGHie9RrLh0SAXCUa069MdjYVX7LyF6YgXFfF6M6qBGZpjIz2iSgolI4nFi0I88
         RwNyJRPyaS+hnWct/zd8is/by+MOkA2mtpIf8vLBr2QKRl3j/ShBr1iXv7beNnyV01IJ
         4TXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510171; x=1770114971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jMpzu3juDBtBV5RLFDPbYgQsAMv2h2mjBBv+j2+R64=;
        b=T8/twHYRAknc2K3gt3sGHVh1A3jXqZilOup+8hxvppXZRcTsD5XVSPyUVy37Cbh0i5
         j6oRaXKj45eZh7GiD5aD5ebPPZ7+T/x303aEqX7D4NEyTmcHFmJhN4ZzyBT7qeEkztLM
         JsPfz1kZ55NnTJuc6CxDiSW5jX2kkHOuQ8o52120R40K230ac98qX45a2dhBsxubo7W1
         DkQe4F/cKY0lhAThYa8gfGdHhFhoP3GViA8676Ilkcj4TZWpIOFwhpjIuW5N+lAprV9/
         WsOAq/bwnedEylKj2KzzRJ2BWkwGH/bEfMgeP4iMWaFdlvGZivUDpFKtWryE8UHnhMab
         ONrg==
X-Forwarded-Encrypted: i=1; AJvYcCXdxfHRSqZIMAQxQoy5a7Wmg9IDI0TfYgBB91XgdbCpBFV84lH1rAIMDcdZXCgu9vymjrn7/ZRU9kIx9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzabF7YSJCz8RXkAT0z/e+1RM+jfB8ZpE8qndunWNlsvieIXssP
	/OGBpoCdwk3LebsibQohOdK+kYNRSOC6VIMM6iGdJ37jmcci9gsvfMzSgO18wp0r8hgbexkToJN
	FSYofhlbyyQXwB2uV+lA5SrPXRWFJO9Mq/wff
X-Gm-Gg: AZuq6aIZ2FjjZ4TRtFrkyLql9xKJ9tSPCAIgS97tBngFeSM4VMuDli41L5squ64x5vo
	jK1Na/vsmHvaf2MpCF0dGjTsThOuBFaExO8GNQVC62qNzy8BuYbb7+/z7l28qZ3JVzE04OIcTH1
	QakEtfG8ByhvMis+bChL2O5MMiCVqkLK16IiqJszNrSwBYyVRxSV7Ko+GH6bAhE9soVwFafd5TW
	ZEMKLWXXPNqB9xbdq7uZ42+w8L/eWhqISHxpA3K3qW6Q8ZvhE74PTW6ldATBQB7V1gnUlM=
X-Received: by 2002:a05:7022:90e:b0:11b:f271:835a with SMTP id
 a92af1059eb24-124a05796c7mr691227c88.3.1769510171282; Tue, 27 Jan 2026
 02:36:11 -0800 (PST)
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
In-Reply-To: <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Tue, 27 Jan 2026 13:35:53 +0300
X-Gm-Features: AZwV_QinLy-j_cnvALYToGVd4L7QWe2XHIxKaVoesvcYBamzrLzu1yitbluT9Xs
Message-ID: <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000030298e06495c3111"

--00000000000030298e06495c3111
Content-Type: multipart/alternative; boundary="00000000000030298d06495c310f"

--00000000000030298d06495c310f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 1:36=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/24/26 11:11, Armin Wolf wrote:
> > Am 24.01.26 um 15:45 schrieb TINSAE TADESSE:
> >
> >> On Fri, Jan 16, 2026 at 9:24=E2=80=AFAM Guenter Roeck <linux@roeck-us.=
net>
wrote:
> >>> On 1/15/26 05:50, TINSAE TADESSE wrote:
> >>>> On Wed, Jan 14, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@roeck-u=
s.net>
wrote:
> >>>>> On 1/14/26 05:07, TINSAE TADESSE wrote:
> >>>>> ...
> >>>>>>>> Hi Guenter,
> >>>>>>>>
> >>>>>>>> I tested changing the i801 SMBus controller to use
> >>>>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
> >>>>>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
> >>>>>>>> change, spd5118 resume failures (-ENXIO)
> >>>>>>>> still persist, suggesting PM ordering alone is insufficient and
other
> >>>>>>>> firmware interactions are involved.
> >>>>>>> How about the problem in the suspend function ? Is that also
still seen ?
> >>>>>>>
> >>>>>>> Also, the subject talks about -EIO. Is that still seen ?
> >>>>>>>
> >>>>>>> Either case, can you enable debug logs for the i801 driver ?
> >>>>>>> It should generate log entries when it reports errors.
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>> Guenter
> >>>>>>>
> >>>>>> Hi Guenter,
> >>>>>>
> >>>>>> Thank you for the questions. To clarify:
> >>>>>>
> >>>>> Please do not drop mailing lists from replies.
> >>>>>
> >>>>>> 1) I have not observed any failures in the suspend path. The
suspend
> >>>>>> callback completes successfully, and
> >>>>>> I have not seen I2C errors or warnings during suspend at any point=
.
> >>>>> Sorry, I seem to be missing something.
> >>>>>
> >>>>> In that case, what is the point of patch 3/3 of your series which
> >>>>> removes hardware accesses from the suspend function ?
> >>>>>
> >>>>>> 2) I have also not observed -EIO in my testing. The error
consistently
> >>>>>> reported on resume and subsequent hwmon access is -ENXIO.
> >>>>>> Earlier references to -EIO were based on assumptions rather than
> >>>>>> observed logs, and I should have been clearer about that.
> >>>>>>
> >>>>> Thanks for the clarification.
> >>>>>
> >>>>> Guenter
> >>>>>
> >>>>>> I am enabling debug logging for the i801 driver to collect more
> >>>>>> concrete evidence of controller state during resume.
> >>>> Hi Guenter,
> >>>>
> >>>>> Sorry, I seem to be missing something.
> >>>>>
> >>>>> In that case, what is the point of patch 3/3 of your series which
> >>>>> removes hardware accesses from the suspend function ?
> >>>> You are right to question this, and I agree that it needs
clarification.
> >>>>
> >>>> Patch 3/3 was originally proposed under the assumption that the
resume failures
> >>>> were caused by spd5118 performing I2C transactions while the
> >>>> controller was not yet available,
> >>>> and that removing hardware accesses from the suspend path might
> >>>> mitigate the issue.
> >>>> At that point, I assumed the problem was limited to the resume
callback.
> >>>>
> >>>> After enabling detailed i801 debug logging and testing with
> >>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
> >>>> it became clear that this assumption was incorrect. The controller
> >>>> itself reports "i801_smbus: No response"
> >>>> both during suspend and immediately after resume, and spd5118 merely
> >>>> propagates the resulting -ENXIO.
> >>> Outch, that really hurts, because it means that something is seriousl=
y
> >>> broken in both the suspend and resume path. The device _must_ be
accessible
> >>> in the suspend path. Otherwise there is no guarantee that the device
is
> >>> accessible for normal (pre-suspend) operation. After all, someone
could
> >>> run a script reading sysfs attributes in a tight loop continuously,
> >>> or the thermal subsystem could try to access the chip. That would
suddenly
> >>> start to fail if something in the device access path starts to be
suspended
> >>> while the underlying hardware is still believed to be operational.
> >>>
> >>> I could imagine some hack/quirk for the resume path, such as delaying
resume
> >>> for some period of time for affected hardware, but I have no idea
what to
> >>> do on the suspend side. We can not just drop device writes during
suspend
> >>> because some broken hardware/firmware does not let us actually access
> >>> (and thus suspend) the hardware anymore by the time the suspend
function
> >>> is called.
> >>>
> >>> Guenter
> >>>
> >>>> This indicates that the issue is not caused by spd5118 suspend/resum=
e
> >>>> behavior, but by the unavailability of the
> >>>> SMBus controller due to platform or firmware interactions during
> >>>> s2idle transitions.
> >>>>
> >>>> Given this, I agree that patch 3/3 does not address the root cause
and
> >>>> does not provide a justified improvement.
> >>>> I am therefore fine with dropping it.
> >>>>
> >>>> Thank you for pointing this out.
> >>>>
> >> Hi Guenter,
> >>
> >> Thanks for the continued review and for questioning the earlier
> >> direction =E2=80=94 that helped narrow this down properly.
> >>
> >> After enabling full i801 debug logging (included below in this email)
> >> and inspecting both drivers, it became clear that the resume
> >> failures are not caused by spd5118 accessing the hardware too
> >> early, nor by PM ordering issues. Instead, the SMBus controller
> >> explicitly reports =E2=80=9CSPD Write Disable is set=E2=80=9D, and any
> >> block write transactions to the SPD device consistently fail with
> >> DEV_ERR. spd5118 merely propagates the resulting -ENXIO.
> >
> > Oh no, this likely happens even when merely reading values, as the
spd5118
> > uses a page register to switch between different register pages. In
order
> > to access temperature data (page 0), you might already have to issue a
> > write access to the page register. The only reason why it works for you
> > is that the spd5118 likely already has page 0 selected by the system
firmware
> > during boot.
> >
>
> Exactly. There is no guarantee that page 0 is selected.
>
> >> With that in mind, I have dropped the earlier patch that attempted
> >> to remove hardware access from the suspend path
> >> unconditionally.
> >> That patch does not address the root cause and is no longer
> >> part of the series.
> >>
> >> I am instead proposing a minimal 2-patch series:
> >>
> >> 1/2 records whether the platform enforces SPD write disable at probe
> >> time (no behavior change).
> >> 2/2 avoids regcache writeback during suspend/resume when the device
> >> operates in read-only mode, while still allowing read access to
> >> temperature inputs.
> >>
> >> This avoids issuing SMBus transactions that are architecturally
> >> blocked on these systems, and does not rely on
> >> delays or PM ordering assumptions, and leaves behavior unchanged on
> >> platforms where SPD writes are permitted.
> >>
> >> If this direction looks acceptable, I=E2=80=99m happy to re-spin and p=
ost the
> >> series formally.
> >>
> >> Thanks again for the guidance.
> >
> > I do not know if this is a reliable solution, as the system firmware
might
> > select a different register page during resume. This will then prevent
the
> > driver from functioning.
> >
>
> No, it is not reliable. The driver is simply not usable in this scenario.
> This isn't just the temperature sensor code - the eeprom code is affected
> as well.
>
> > I would love to see the spd5118 driver working on such systems with
reduced
> > functionality, but i will leave it to Guenter to decide if this
approach is
> > maintainable.
> >
> > Besides that: did the spd5118 driver load automatically on your device?
> >
>
> I thought that was disabled. The i801 driver is supposed to detect if
write
> protect is enabled and, if so, it is supposed to not instantiate the
spd5118
> driver for DDR3. Support for this was added with commit 4d6d35d3417d
("i2c:
> smbus: introduce Write Disable-aware SPD instantiating functions").
Apparently
> the code to do this never made it into the i801 driver.
>
> The i801 driver needs to be fixed to inform the spd initialization code
> that the spd5118 address range is write protected. The patch to do this
was
> "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I have
no idea
> why that patch didn't make it upstream.
>
> Guenter
>

Hi Guenter,

> > The i801 driver needs to be fixed to inform the spd initialization code
> > that the spd5118 address range is write protected. The patch to do
> > this was
> > "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I
> > have no idea
> > why that patch didn't make it upstream.

I initially considered exposing SPD write-protection as a capability to be
consumed by spd5118.
However, spd5118 already depends on firmware-initialized state (page
selection) and cannot reliably
determine safe operation at probe time without issuing writes.
Given that, suppressing SPD instantiation in the i801 driver when SPD Write
Disable is
the only solution here.

Tested the remaining patch [1], and it does not seem to fix the issue, as
it is added at the wrong stage
in the initialization of the i801 driver. The attached log shows that
spd5118 is instantiated and fully probed
before the "do not instantiate spd5118 under SPD Write Disable" is acted
upon.
This confirms that suppressing instantiation must occur before adapter
registration in i801.
Once the adapter is registered, the SPD scan has already happened, and
spd5118 has bound successfully
based on the firmware-initialized state, even though correct operation is
impossible.
Therefore, the fix must be run prior to adapter registration.

[1]
https://lore.kernel.org/all/20250430-for-upstream-i801-spd5118-no-instantia=
te-v2-2-2f54d91ae2c7@canonical.com/


The fix is to register the SPD write-disable policy before
i2c_add_adapter(), so the I2C core never
probes SPD addresses on write-protected platforms.

--00000000000030298d06495c310f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><br>On Mon, Jan 26, 2026 at 1:36=E2=
=80=AFAM Guenter Roeck &lt;<a href=3D"mailto:linux@roeck-us.net" target=3D"=
_blank">linux@roeck-us.net</a>&gt; wrote:<br>&gt;<br>&gt; On 1/24/26 11:11,=
 Armin Wolf wrote:<br>&gt; &gt; Am 24.01.26 um 15:45 schrieb TINSAE TADESSE=
:<br>&gt; &gt;<br>&gt; &gt;&gt; On Fri, Jan 16, 2026 at 9:24=E2=80=AFAM Gue=
nter Roeck &lt;<a href=3D"mailto:linux@roeck-us.net" target=3D"_blank">linu=
x@roeck-us.net</a>&gt; wrote:<br>&gt; &gt;&gt;&gt; On 1/15/26 05:50, TINSAE=
 TADESSE wrote:<br>&gt; &gt;&gt;&gt;&gt; On Wed, Jan 14, 2026 at 5:23=E2=80=
=AFPM Guenter Roeck &lt;<a href=3D"mailto:linux@roeck-us.net" target=3D"_bl=
ank">linux@roeck-us.net</a>&gt; wrote:<br>&gt; &gt;&gt;&gt;&gt;&gt; On 1/14=
/26 05:07, TINSAE TADESSE wrote:<br>&gt; &gt;&gt;&gt;&gt;&gt; ...<br>&gt; &=
gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi Guenter,<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt=
;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I tested changing the i8=
01 SMBus controller to use<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; SET_LAT=
E_SYSTEM_SLEEP_PM_OPS() instead of<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=
 DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this<br>&gt; &=
gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; change, spd5118 resume failures (-ENXIO)<br=
>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; still persist, suggesting PM orderin=
g alone is insufficient and other<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; =
firmware interactions are involved.<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Ho=
w about the problem in the suspend function ? Is that also still seen ?<br>=
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Also=
, the subject talks about -EIO. Is that still seen ?<br>&gt; &gt;&gt;&gt;&g=
t;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Either case, can you en=
able debug logs for the i801 driver ?<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; =
It should generate log entries when it reports errors.<br>&gt; &gt;&gt;&gt;=
&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Thanks,<br>&gt; &gt;&=
gt;&gt;&gt;&gt;&gt;&gt; Guenter<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>&gt=
; &gt;&gt;&gt;&gt;&gt;&gt; Hi Guenter,<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>=
&gt; &gt;&gt;&gt;&gt;&gt;&gt; Thank you for the questions. To clarify:<br>&=
gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt; Please do not dro=
p mailing lists from replies.<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;=
&gt;&gt;&gt;&gt; 1) I have not observed any failures in the suspend path. T=
he suspend<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; callback completes successfully=
, and<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; I have not seen I2C errors or warnin=
gs during suspend at any point.<br>&gt; &gt;&gt;&gt;&gt;&gt; Sorry, I seem =
to be missing something.<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&=
gt;&gt; In that case, what is the point of patch 3/3 of your series which<b=
r>&gt; &gt;&gt;&gt;&gt;&gt; removes hardware accesses from the suspend func=
tion ?<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; 2) I h=
ave also not observed -EIO in my testing. The error consistently<br>&gt; &g=
t;&gt;&gt;&gt;&gt;&gt; reported on resume and subsequent hwmon access is -E=
NXIO.<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; Earlier references to -EIO were base=
d on assumptions rather than<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; observed logs=
, and I should have been clearer about that.<br>&gt; &gt;&gt;&gt;&gt;&gt;&g=
t;<br>&gt; &gt;&gt;&gt;&gt;&gt; Thanks for the clarification.<br>&gt; &gt;&=
gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt; Guenter<br>&gt; &gt;&gt;&gt;&g=
t;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; I am enabling debug logging for the=
 i801 driver to collect more<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; concrete evid=
ence of controller state during resume.<br>&gt; &gt;&gt;&gt;&gt; Hi Guenter=
,<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt; Sorry, I seem to be=
 missing something.<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&g=
t; In that case, what is the point of patch 3/3 of your series which<br>&gt=
; &gt;&gt;&gt;&gt;&gt; removes hardware accesses from the suspend function =
?<br>&gt; &gt;&gt;&gt;&gt; You are right to question this, and I agree that=
 it needs clarification.<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; =
Patch 3/3 was originally proposed under the assumption that the resume fail=
ures<br>&gt; &gt;&gt;&gt;&gt; were caused by spd5118 performing I2C transac=
tions while the<br>&gt; &gt;&gt;&gt;&gt; controller was not yet available,<=
br>&gt; &gt;&gt;&gt;&gt; and that removing hardware accesses from the suspe=
nd path might<br>&gt; &gt;&gt;&gt;&gt; mitigate the issue.<br>&gt; &gt;&gt;=
&gt;&gt; At that point, I assumed the problem was limited to the resume cal=
lback.<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; After enabling det=
ailed i801 debug logging and testing with<br>&gt; &gt;&gt;&gt;&gt; SET_LATE=
_SYSTEM_SLEEP_PM_OPS() in the i801 driver,<br>&gt; &gt;&gt;&gt;&gt; it beca=
me clear that this assumption was incorrect. The controller<br>&gt; &gt;&gt=
;&gt;&gt; itself reports &quot;i801_smbus: No response&quot;<br>&gt; &gt;&g=
t;&gt;&gt; both during suspend and immediately after resume, and spd5118 me=
rely<br>&gt; &gt;&gt;&gt;&gt; propagates the resulting -ENXIO.<br>&gt; &gt;=
&gt;&gt; Outch, that really hurts, because it means that something is serio=
usly<br>&gt; &gt;&gt;&gt; broken in both the suspend and resume path. The d=
evice _must_ be accessible<br>&gt; &gt;&gt;&gt; in the suspend path. Otherw=
ise there is no guarantee that the device is<br>&gt; &gt;&gt;&gt; accessibl=
e for normal (pre-suspend) operation. After all, someone could<br>&gt; &gt;=
&gt;&gt; run a script reading sysfs attributes in a tight loop continuously=
,<br>&gt; &gt;&gt;&gt; or the thermal subsystem could try to access the chi=
p. That would suddenly<br>&gt; &gt;&gt;&gt; start to fail if something in t=
he device access path starts to be suspended<br>&gt; &gt;&gt;&gt; while the=
 underlying hardware is still believed to be operational.<br>&gt; &gt;&gt;&=
gt;<br>&gt; &gt;&gt;&gt; I could imagine some hack/quirk for the resume pat=
h, such as delaying resume<br>&gt; &gt;&gt;&gt; for some period of time for=
 affected hardware, but I have no idea what to<br>&gt; &gt;&gt;&gt; do on t=
he suspend side. We can not just drop device writes during suspend<br>&gt; =
&gt;&gt;&gt; because some broken hardware/firmware does not let us actually=
 access<br>&gt; &gt;&gt;&gt; (and thus suspend) the hardware anymore by the=
 time the suspend function<br>&gt; &gt;&gt;&gt; is called.<br>&gt; &gt;&gt;=
&gt;<br>&gt; &gt;&gt;&gt; Guenter<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;=
&gt; This indicates that the issue is not caused by spd5118 suspend/resume<=
br>&gt; &gt;&gt;&gt;&gt; behavior, but by the unavailability of the<br>&gt;=
 &gt;&gt;&gt;&gt; SMBus controller due to platform or firmware interactions=
 during<br>&gt; &gt;&gt;&gt;&gt; s2idle transitions.<br>&gt; &gt;&gt;&gt;&g=
t;<br>&gt; &gt;&gt;&gt;&gt; Given this, I agree that patch 3/3 does not add=
ress the root cause and<br>&gt; &gt;&gt;&gt;&gt; does not provide a justifi=
ed improvement.<br>&gt; &gt;&gt;&gt;&gt; I am therefore fine with dropping =
it.<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; Thank you for pointin=
g this out.<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt; Hi Guenter,<br>&gt; &=
gt;&gt;<br>&gt; &gt;&gt; Thanks for the continued review and for questionin=
g the earlier<br>&gt; &gt;&gt; direction =E2=80=94 that helped narrow this =
down properly.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; After enabling full i801 d=
ebug logging (included below in this email)<br>&gt; &gt;&gt; and inspecting=
 both drivers, it became clear that the resume<br>&gt; &gt;&gt; failures ar=
e not caused by spd5118 accessing the hardware too<br>&gt; &gt;&gt; early, =
nor by PM ordering issues. Instead, the SMBus controller<br>&gt; &gt;&gt; e=
xplicitly reports =E2=80=9CSPD Write Disable is set=E2=80=9D, and any<br>&g=
t; &gt;&gt; block write transactions to the SPD device consistently fail wi=
th<br>&gt; &gt;&gt; DEV_ERR. spd5118 merely propagates the resulting -ENXIO=
.<br>&gt; &gt;<br>&gt; &gt; Oh no, this likely happens even when merely rea=
ding values, as the spd5118<br>&gt; &gt; uses a page register to switch bet=
ween different register pages. In order<br>&gt; &gt; to access temperature =
data (page 0), you might already have to issue a<br>&gt; &gt; write access =
to the page register. The only reason why it works for you<br>&gt; &gt; is =
that the spd5118 likely already has page 0 selected by the system firmware<=
br>&gt; &gt; during boot.<br>&gt; &gt;<br>&gt;<br>&gt; Exactly. There is no=
 guarantee that page 0 is selected.<br>&gt;<br>&gt; &gt;&gt; With that in m=
ind, I have dropped the earlier patch that attempted<br>&gt; &gt;&gt; to re=
move hardware access from the suspend path<br>&gt; &gt;&gt; unconditionally=
.<br>&gt; &gt;&gt; That patch does not address the root cause and is no lon=
ger<br>&gt; &gt;&gt; part of the series.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; =
I am instead proposing a minimal 2-patch series:<br>&gt; &gt;&gt;<br>&gt; &=
gt;&gt; 1/2 records whether the platform enforces SPD write disable at prob=
e<br>&gt; &gt;&gt; time (no behavior change).<br>&gt; &gt;&gt; 2/2 avoids r=
egcache writeback during suspend/resume when the device<br>&gt; &gt;&gt; op=
erates in read-only mode, while still allowing read access to<br>&gt; &gt;&=
gt; temperature inputs.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; This avoids issui=
ng SMBus transactions that are architecturally<br>&gt; &gt;&gt; blocked on =
these systems, and does not rely on<br>&gt; &gt;&gt; delays or PM ordering =
assumptions, and leaves behavior unchanged on<br>&gt; &gt;&gt; platforms wh=
ere SPD writes are permitted.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; If this dir=
ection looks acceptable, I=E2=80=99m happy to re-spin and post the<br>&gt; =
&gt;&gt; series formally.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Thanks again fo=
r the guidance.<br>&gt; &gt;<br>&gt; &gt; I do not know if this is a reliab=
le solution, as the system firmware might<br>&gt; &gt; select a different r=
egister page during resume. This will then prevent the<br>&gt; &gt; driver =
from functioning.<br>&gt; &gt;<br>&gt;<br>&gt; No, it is not reliable. The =
driver is simply not usable in this scenario.<br>&gt; This isn&#39;t just t=
he temperature sensor code - the eeprom code is affected<br>&gt; as well.<b=
r>&gt;<br>&gt; &gt; I would love to see the spd5118 driver working on such =
systems with reduced<br>&gt; &gt; functionality, but i will leave it to Gue=
nter to decide if this approach is<br>&gt; &gt; maintainable.<br>&gt; &gt;<=
br>&gt; &gt; Besides that: did the spd5118 driver load automatically on you=
r device?<br>&gt; &gt;<br>&gt;<br>&gt; I thought that was disabled. The i80=
1 driver is supposed to detect if write<br>&gt; protect is enabled and, if =
so, it is supposed to not instantiate the spd5118<br>&gt; driver for DDR3. =
Support for this was added with commit 4d6d35d3417d (&quot;i2c:<br>&gt; smb=
us: introduce Write Disable-aware SPD instantiating functions&quot;). Appar=
ently<br>&gt; the code to do this never made it into the i801 driver.<br>&g=
t;<br>&gt; The i801 driver needs to be fixed to inform the spd initializati=
on code<br>&gt; that the spd5118 address range is write protected. The patc=
h to do this was<br>&gt; &quot;i2c: i801: Do not instantiate spd5118 under =
SPD Write Disable&quot;. I have no idea<br>&gt; why that patch didn&#39;t m=
ake it upstream.<br>&gt;<br>&gt; Guenter<br>&gt;<br><br>Hi Guenter,<br><br>=
&gt; &gt; The i801 driver needs to be fixed to inform the spd initializatio=
n code<br>&gt; &gt; that the spd5118 address range is write protected. The =
patch to do<br>&gt; &gt; this was<br>&gt; &gt; &quot;i2c: i801: Do not inst=
antiate spd5118 under SPD Write Disable&quot;. I<br>&gt; &gt; have no idea<=
br>&gt; &gt; why that patch didn&#39;t make it upstream.<br><br>I initially=
 considered exposing SPD write-protection as a capability to be consumed by=
 spd5118. <br>However, spd5118 already depends on firmware-initialized stat=
e (page selection) and cannot reliably <br>determine safe operation at prob=
e time without issuing writes. <br>Given that, suppressing SPD instantiatio=
n in the i801 driver when SPD Write Disable is=C2=A0<div>the only solution =
here.<br><br>Tested the remaining patch [1], and it does not=C2=A0seem to f=
ix the issue, as it is added at the wrong stage <br>in the initialization o=
f the i801 driver. The attached log shows that spd5118 is instantiated and =
fully probed <br>before the &quot;do not instantiate spd5118 under SPD Writ=
e Disable&quot; is acted upon. <br>This confirms that suppressing instantia=
tion must occur before adapter registration in i801. <br>Once the adapter i=
s registered, the SPD scan has already happened, and spd5118 has bound succ=
essfully <br>based on the firmware-initialized state, even though correct o=
peration is impossible. <br>Therefore, the fix must be run prior to adapter=
 registration.<br><br>[1] <a href=3D"https://lore.kernel.org/all/20250430-f=
or-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com/" t=
arget=3D"_blank">https://lore.kernel.org/all/20250430-for-upstream-i801-spd=
5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com/</a><br><br><br>The fix=
 is to register the SPD write-disable policy before i2c_add_adapter(), so t=
he I2C core never=C2=A0</div><div>probes SPD addresses on write-protected p=
latforms.</div><div><br></div></div>
</div>

--00000000000030298d06495c310f--
--00000000000030298e06495c3111
Content-Type: application/octet-stream; name=dmesg_i2c_i801_logs_3-partial
Content-Disposition: attachment; filename=dmesg_i2c_i801_logs_3-partial
Content-Transfer-Encoding: base64
Content-ID: <f_mkwgnhom0>
X-Attachment-Id: f_mkwgnhom0

Li4uClsgICAgMC4yMTY1MjZdIEFDUEk6IENvcmUgcmV2aXNpb24gMjAyNTA4MDcKWyAgICAwLjI1
MzU0OF0gQUNQSTogUE06IFJlZ2lzdGVyaW5nIEFDUEkgTlZTIHJlZ2lvbiBbbWVtIDB4NjFkMDUw
MDAtMHg2MWYwNGZmZl0gKDIwOTcxNTIgYnl0ZXMpClsgICAgMC4yNzExMzhdIGFjcGlwaHA6IEFD
UEkgSG90IFBsdWcgUENJIENvbnRyb2xsZXIgRHJpdmVyIHZlcnNpb246IDAuNQouLi4KWyAgICAw
Ljg0MDY5Ml0gQUNQSTogRUM6IEVDIHN0YXJ0ZWQKLi4uClsgICAgMS4zMTk3NTBdIFBDSTogVXNp
bmcgQUNQSSBmb3IgSVJRIHJvdXRpbmcKLi4uClsgICAxMS45Njg5NTBdIGkyYy1jb3JlOiBkcml2
ZXIgW3NwZDUxMThdIHJlZ2lzdGVyZWQKLi4uClsgICAyOC4xNDQ4ODJdIGk4MDFfc21idXMgMDAw
MDowMDoxZi40OiBTUEQgV3JpdGUgRGlzYWJsZSBpcyBzZXQKWyAgIDI4LjE0NTA0Ml0gaTgwMV9z
bWJ1cyAwMDAwOjAwOjFmLjQ6IFNNQnVzIHVzaW5nIFBDSSBpbnRlcnJ1cHQKWyAgIDI4LjE0NTA2
OF0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IENyZWF0ZSBpVENPIGRldmljZS4uLgpbICAgMjgu
MTQ4OTI4XSBpODAxX3NtYnVzIDAwMDA6MDA6MWYuNDogUmVnaXN0ZXJpbmcgYWRhcHRlciBTTUJ1
cyBJODAxIGFkYXB0ZXIgYXQgMDAwMDowMDoxZi40ClsgICAyOC4xNjkzNjJdIGk4MDFfc21idXMg
MDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD0wLCBzaXplPTEsIGFkZHI9MHg1MCwg
cmVhZF93cml0ZT0xClsgICAyOC4xNjkzOTVdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAx
IHRpbWVvdXQ6IHN0YXR1cz0weDQsIFNNQkhTVENOVD0weDUsIFNNQkhTVFNUU19ERVZfRVJSPTQK
WyAgIDI4LjE2OTQxMV0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IE5vIHJlc3BvbnNlClsgICAy
OC4xNjk2NDBdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD0w
LCBzaXplPTEsIGFkZHI9MHg1MSwgcmVhZF93cml0ZT0xClsgICAyOC4xNjk2NzFdIGk4MDFfc21i
dXMgMDAwMDowMDoxZi40OiBpODAxIHRpbWVvdXQ6IHN0YXR1cz0weDQsIFNNQkhTVENOVD0weDUs
IFNNQkhTVFNUU19ERVZfRVJSPTQKWyAgIDI4LjE2OTY5NF0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFm
LjQ6IE5vIHJlc3BvbnNlClsgICAyOC4xNzAwMTVdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBp
ODAxIGFjY2VzczogY29tbWFuZD0wLCBzaXplPTEsIGFkZHI9MHg1MiwgcmVhZF93cml0ZT0xClsg
ICAyOC4xNzA3OTBdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFu
ZD0wLCBzaXplPTMsIGFkZHI9MHg1MiwgcmVhZF93cml0ZT0xClsgICAyOC4xNzE0MzBdIGk4MDFf
c21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD0zLCBzaXplPTMsIGFkZHI9
MHg1MiwgcmVhZF93cml0ZT0xClsgICAyOC4xNzE5NTNdIGk4MDFfc21idXMgMDAwMDowMDoxZi40
OiBpODAxIGFjY2VzczogY29tbWFuZD01LCBzaXplPTIsIGFkZHI9MHg1MiwgcmVhZF93cml0ZT0x
ClsgICAyOC4xNzI0NzVdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29t
bWFuZD0xMywgc2l6ZT0yLCBhZGRyPTB4NTIsIHJlYWRfd3JpdGU9MQpbICAgMjguMTczMDAwXSBp
ODAxX3NtYnVzIDAwMDA6MDA6MWYuNDogaTgwMSBhY2Nlc3M6IGNvbW1hbmQ9MTQsIHNpemU9Miwg
YWRkcj0weDUyLCByZWFkX3dyaXRlPTEKWyAgIDI4LjE3MzUyNF0gaTgwMV9zbWJ1cyAwMDAwOjAw
OjFmLjQ6IGk4MDEgYWNjZXNzOiBjb21tYW5kPTIsIHNpemU9MiwgYWRkcj0weDUyLCByZWFkX3dy
aXRlPTEKWyAgIDI4LjE3NDE2NV0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IGk4MDEgYWNjZXNz
OiBjb21tYW5kPTFhLCBzaXplPTIsIGFkZHI9MHg1MiwgcmVhZF93cml0ZT0xClsgICAyOC4xNzQx
ODldIGkyYyBpMmMtMTQ6IENyZWF0aW5nIHNwZDUxMTggYXQgMHg1MgpbICAgMjguMTc4OTIzXSBz
cGQ1MTE4IDE0LTAwNTI6IHByb2JlClsgICAyOC4xNzk4ODJdIGk4MDFfc21idXMgMDAwMDowMDox
Zi40OiBpODAxIGFjY2VzczogY29tbWFuZD0wLCBzaXplPTMsIGFkZHI9MHg1MiwgcmVhZF93cml0
ZT0xClsgICAyOC4xODA0ODJdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2Vzczog
Y29tbWFuZD1iLCBzaXplPTIsIGFkZHI9MHg1MiwgcmVhZF93cml0ZT0xClsgICAyOC4xODE1Mjdd
IGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD1iLCBzaXplPTgs
IGFkZHI9MHg1MiwgcmVhZF93cml0ZT0xClsgICAyOC4xODIxMDBdIGk4MDFfc21idXMgMDAwMDow
MDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD01LCBzaXplPTgsIGFkZHI9MHg1MiwgcmVhZF93
cml0ZT0xClsgICAyOC4xODI2NTJdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2Vz
czogY29tbWFuZD0yLCBzaXplPTgsIGFkZHI9MHg1MiwgcmVhZF93cml0ZT0xClsgICAyOC4xODMx
NzRdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD0zLCBzaXpl
PTgsIGFkZHI9MHg1MiwgcmVhZF93cml0ZT0xClsgICAyOC4xODM3MDJdIGk4MDFfc21idXMgMDAw
MDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD00LCBzaXplPTgsIGFkZHI9MHg1MiwgcmVh
ZF93cml0ZT0xClsgICAyOC4xOTUwODVdIHNwZDUxMTggMTQtMDA1MjogRERSNSB0ZW1wZXJhdHVy
ZSBzZW5zb3I6IHZlbmRvciAweDAwOjB4YjMgcmV2aXNpb24gMi4yClsgICAyOC4xOTU3MTBdIGky
YyBpMmMtMTQ6IGNsaWVudCBbc3BkNTExOF0gcmVnaXN0ZXJlZCB3aXRoIGJ1cyBpZCAxNC0wMDUy
ClsgICAyOC4xOTU5MDZdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29t
bWFuZD0wLCBzaXplPTEsIGFkZHI9MHg1MywgcmVhZF93cml0ZT0xClsgICAyOC4xOTU5MjNdIGk4
MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIHRpbWVvdXQ6IHN0YXR1cz0weDQsIFNNQkhTVENO
VD0weDUsIFNNQkhTVFNUU19ERVZfRVJSPTQKWyAgIDI4LjE5NTkzM10gaTgwMV9zbWJ1cyAwMDAw
OjAwOjFmLjQ6IE5vIHJlc3BvbnNlClsgICAyOC4xOTYxMjJdIGk4MDFfc21idXMgMDAwMDowMDox
Zi40OiBpODAxIGFjY2VzczogY29tbWFuZD0wLCBzaXplPTEsIGFkZHI9MHg1NCwgcmVhZF93cml0
ZT0xClsgICAyOC4xOTYxNTldIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIHRpbWVvdXQ6
IHN0YXR1cz0weDQsIFNNQkhTVENOVD0weDUsIFNNQkhTVFNUU19ERVZfRVJSPTQKWyAgIDI4LjE5
NjE3NV0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IE5vIHJlc3BvbnNlClsgICAyOC4xOTczMjBd
IGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD0wLCBzaXplPTEs
IGFkZHI9MHg1NSwgcmVhZF93cml0ZT0xClsgICAyOC4xOTczNDBdIGk4MDFfc21idXMgMDAwMDow
MDoxZi40OiBpODAxIHRpbWVvdXQ6IHN0YXR1cz0weDQsIFNNQkhTVENOVD0weDUsIFNNQkhTVFNU
U19ERVZfRVJSPTQKWyAgIDI4LjE5NzM1Ml0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IE5vIHJl
c3BvbnNlClsgICAyOC4xOTc1MzldIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2Vz
czogY29tbWFuZD0wLCBzaXplPTEsIGFkZHI9MHg1NiwgcmVhZF93cml0ZT0xClsgICAyOC4xOTc1
NTddIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIHRpbWVvdXQ6IHN0YXR1cz0weDQsIFNN
QkhTVENOVD0weDUsIFNNQkhTVFNUU19ERVZfRVJSPTQKWyAgIDI4LjE5NzU2OV0gaTgwMV9zbWJ1
cyAwMDAwOjAwOjFmLjQ6IE5vIHJlc3BvbnNlClsgICAyOC4xOTc3NTRdIGk4MDFfc21idXMgMDAw
MDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD0wLCBzaXplPTEsIGFkZHI9MHg1NywgcmVh
ZF93cml0ZT0xClsgICAyOC4xOTc3NzVdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIHRp
bWVvdXQ6IHN0YXR1cz0weDQsIFNNQkhTVENOVD0weDUsIFNNQkhTVFNUU19ERVZfRVJSPTQKWyAg
IDI4LjE5Nzc5MF0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IE5vIHJlc3BvbnNlClsgICAyOC4x
OTc5ODNdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD0wLCBz
aXplPTAsIGFkZHI9MHg0OCwgcmVhZF93cml0ZT0wClsgICAyOC4xOTgwMDRdIGk4MDFfc21idXMg
MDAwMDowMDoxZi40OiBpODAxIHRpbWVvdXQ6IHN0YXR1cz0weDQsIFNNQkhTVENOVD0weDEsIFNN
QkhTVFNUU19ERVZfRVJSPTQKWyAgIDI4LjE5ODAyMF0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6
IE5vIHJlc3BvbnNlClsgICAyOC4xOTgyMTBdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAx
IGFjY2VzczogY29tbWFuZD0wLCBzaXplPTAsIGFkZHI9MHg0OSwgcmVhZF93cml0ZT0wClsgICAy
OC4xOTgyMzFdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIHRpbWVvdXQ6IHN0YXR1cz0w
eDQsIFNNQkhTVENOVD0weDEsIFNNQkhTVFNUU19ERVZfRVJSPTQKWyAgIDI4LjE5ODI0N10gaTgw
MV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IE5vIHJlc3BvbnNlClsgICAyOC4xOTg0NDhdIGk4MDFfc21i
dXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2VzczogY29tbWFuZD0wLCBzaXplPTAsIGFkZHI9MHg0
YSwgcmVhZF93cml0ZT0wClsgICAyOC4xOTkwNTNdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBp
ODAxIGFjY2VzczogY29tbWFuZD1mZSwgc2l6ZT0zLCBhZGRyPTB4NGEsIHJlYWRfd3JpdGU9MQpb
ICAgMjguMTk5MjQ5XSBpODAxX3NtYnVzIDAwMDA6MDA6MWYuNDogaTgwMSBhY2Nlc3M6IGNvbW1h
bmQ9MCwgc2l6ZT0wLCBhZGRyPTB4NGIsIHJlYWRfd3JpdGU9MApbICAgMjguMTk5MjcyXSBpODAx
X3NtYnVzIDAwMDA6MDA6MWYuNDogaTgwMSB0aW1lb3V0OiBzdGF0dXM9MHg0LCBTTUJIU1RDTlQ9
MHgxLCBTTUJIU1RTVFNfREVWX0VSUj00ClsgICAyOC4xOTkyODddIGk4MDFfc21idXMgMDAwMDow
MDoxZi40OiBObyByZXNwb25zZQpbICAgMjguMTk5MzA2XSBpODAxX3NtYnVzIDAwMDA6MDA6MWYu
NDogRW5hYmxlIGhvc3Qgbm90aWZ5IGludGVycnVwdC4uLgpbICAgMjguMTk5MzE4XSBpODAxX3Nt
YnVzIDAwMDA6MDA6MWYuNDogUmVnaXN0ZXJpbmcgb3B0aW9uYWwgdGFyZ2V0cy4uLgouLi4KWyAg
MTU2LjcxODc3N10gUE06IHN1c3BlbmQgZW50cnkgKHMyaWRsZSkKWyAgMTU3LjE3NTA2NV0gaTgw
MV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IGk4MDEgYWNjZXNzOiBjb21tYW5kPTFhLCBzaXplPTgsIGFk
ZHI9MHg1MiwgcmVhZF93cml0ZT0xClsgIDE1Ny4xNzc1NzRdIGk4MDFfc21idXMgMDAwMDowMDox
Zi40OiBpODAxIGFjY2VzczogY29tbWFuZD1iLCBzaXplPTgsIGFkZHI9MHg1MiwgcmVhZF93cml0
ZT0xClsgIDE1Ny4xNzgyNzJdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBpODAxIGFjY2Vzczog
Y29tbWFuZD0xYSwgc2l6ZT04LCBhZGRyPTB4NTIsIHJlYWRfd3JpdGU9MQpbICAxNTcuMTc5MDAz
XSBpODAxX3NtYnVzIDAwMDA6MDA6MWYuNDogaTgwMSBhY2Nlc3M6IGNvbW1hbmQ9Yiwgc2l6ZT04
LCBhZGRyPTB4NTIsIHJlYWRfd3JpdGU9MQpbICAxNTcuMTc5MjU1XSBpODAxX3NtYnVzIDAwMDA6
MDA6MWYuNDogaTgwMSBhY2Nlc3M6IGNvbW1hbmQ9MWEsIHNpemU9OCwgYWRkcj0weDUyLCByZWFk
X3dyaXRlPTAKWyAgMTU3LjE3OTMwMF0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IGk4MDEgdGlt
ZW91dDogc3RhdHVzPTB4NCwgU01CSFNUQ05UPTB4MTUsIFNNQkhTVFNUU19ERVZfRVJSPTQKWyAg
MTU3LjE3OTMzM10gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IE5vIHJlc3BvbnNlClsgIDE1OC41
NjMyNTJdIEFDUEk6IEVDOiBpbnRlcnJ1cHQgYmxvY2tlZApbICAxNzYuNDQ3MzYzXSBBQ1BJOiBF
QzogaW50ZXJydXB0IHVuYmxvY2tlZApbICAxNzYuNjE2MDM1XSBpODAxX3NtYnVzIDAwMDA6MDA6
MWYuNDogaTgwMSBhY2Nlc3M6IGNvbW1hbmQ9Yiwgc2l6ZT04LCBhZGRyPTB4NTIsIHJlYWRfd3Jp
dGU9MApbICAxNzYuNjE2MDgyXSBpODAxX3NtYnVzIDAwMDA6MDA6MWYuNDogaTgwMSB0aW1lb3V0
OiBzdGF0dXM9MHg0LCBTTUJIU1RDTlQ9MHgxNSwgU01CSFNUU1RTX0RFVl9FUlI9NApbICAxNzYu
NjE2MTA3XSBpODAxX3NtYnVzIDAwMDA6MDA6MWYuNDogTm8gcmVzcG9uc2UKWyAgMTc2LjYxNjIx
NF0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IGk4MDEgYWNjZXNzOiBjb21tYW5kPWIsIHNpemU9
OCwgYWRkcj0weDUyLCByZWFkX3dyaXRlPTAKWyAgMTc2LjYxNjI0OV0gaTgwMV9zbWJ1cyAwMDAw
OjAwOjFmLjQ6IGk4MDEgdGltZW91dDogc3RhdHVzPTB4NCwgU01CSFNUQ05UPTB4MTUsIFNNQkhT
VFNUU19ERVZfRVJSPTQKWyAgMTc2LjYxNjI3M10gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IE5v
IHJlc3BvbnNlClsgIDE3Ni42MTYzMDldIHNwZDUxMTggMTQtMDA1MjogRmFpbGVkIHRvIHdyaXRl
IGIgPSAwOiAtNgpbICAxNzYuNjE2MzU4XSBzcGQ1MTE4IDE0LTAwNTI6IFBNOiBkcG1fcnVuX2Nh
bGxiYWNrKCk6IHNwZDUxMThfcmVzdW1lIHJldHVybnMgLTYKWyAgMTc2LjYxNjYzOF0gc3BkNTEx
OCAxNC0wMDUyOiBQTTogZmFpbGVkIHRvIHJlc3VtZSBhc3luYzogZXJyb3IgLTYKWyAgMTc4LjA2
MTQ2MF0gUE06IHN1c3BlbmQgZXhpdAo=
--00000000000030298e06495c3111--
