Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAC224B1E
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769541824; cv=pass; b=eufaBLDF5n8qeEZDCZxOZylWWn6KwxF0QPIIgboZnJZHhKnuj/GeGTKKIWSC1fKGVCGjHyPyByLEpNfQL4pXw7xToFO68Pvr2kbxIjWP0cI9jYY+cxpytde+dJWj++uTaS1rnNZPTRI4Z03d4DhNu3wuLbntVnl03WrtJDa8UL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769541824; c=relaxed/simple;
	bh=otIBrgPhNANQLm27xLPDSeuyzg87coMDWyVvNaCgh34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEaiBxcMiy2Cz7pzbcF15gfi4+HCYJBB89DC2vnmTgUTSsXIVYtyLsZVTbeb/KUL8idY7+BthVboSi4Jz94S/Dl3d/KadgoEoynlRGG+Qo9E5fbeqilLxbj3gZSQzWqwN8kcRvPjrvy5kWu0Yjc5MxsR1zpFxgSOopWj7twr1wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaU1Isfd; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaU1Isfd"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124877d78a6so3724404c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 11:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769541822; cv=none;
        d=google.com; s=arc-20240605;
        b=D44pIw+VqDVZ/lVTmTb/yMaHZMk+SwrdL8y7jdpU4ML1HHlfnunYn2hg0ydcj53caN
         sPxzTn/GOOd8qH5LSMkaMoiyb/ii/u0K7M62UOPozPDVKOsepuYYyz6VM/BB3+tlVpUp
         wyIMd/vpZHJchNsO/6VzXMXMojGXG9g1rowje2v7BP42Fz+vT9f5MrseItSATFIk8YvH
         2fZh3kIXS1l+zACl+Mt4g0i9BS5y7xxrdI8pLyPASBTET9nvxa8yyRNhsC98bATN3aQ7
         FV7cdei6YRUMUckE6bcrkgbpvvTgxsfCjMq6Dk4qcteM25AP4+kw6KiqkN4U0MzQqyVw
         GpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X1Ljmnc3jvrUWouZUSKrvimmjGl6uGM58yfKDYeoGs8=;
        fh=kj0+g60DT9nn7AjMMrjEaB5iABa7VjQEPVdjMsfCDuA=;
        b=C+7oaGiuoE0V/CeLJq1q080r3GRztmqX88fCHcyWyr8W2pAFPncDK+pXOQ/BYqXO91
         WoEkEV8pZktkDoixu3tijAip471ywF0Lzd+IemXDOHZ9+413B4cx+KMqrZIa9il7cRal
         w5IQeUlsVvxl1lgXbzbsldVFV2HwKi16L8dfWTb+GjLFL4tDRmQNeiBzmtjo4vZkOB2l
         4hBzlGNIYJjpsywGyWmSzxZ2hrSS1prFp6Uiifx1DKoEE1GAgQtmIvZlQ7oA/URZU7/7
         vsCt7afx8HuhmFK7dOYijBzfS8Ng2LLm3Q1cPgqqwVSAugn97g/KWAPrmalfxC0aiyWI
         +oYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769541822; x=1770146622; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X1Ljmnc3jvrUWouZUSKrvimmjGl6uGM58yfKDYeoGs8=;
        b=UaU1IsfdMpKkrg3zWruATSavJCo+r9aEmuEv0bx0TW96BgeHWB+dsHGLUu44TM+PY3
         j/76TfXySeWVk+byQcAayucQW8AXuX5hMOJdqbsvqvmCTac7ewSHbbJKfbSMOJPrHhg0
         SPsfJImXzUtEtiVmLoVD4jSiuB9e8xooQGBZXOr50UY83sEJ6PQfwG/gSQ61WkxY/RGn
         5tF5GM4YJpvR2bIVAaNoFBEG/hqN/zFqtRQGHBItzmyb+2eNMaJB2rKwvm7k0TqgfQhx
         pYPv4myVVl5Q/0clDP8HHBYMj15EXGg1uNygDZcyh4nmuUVYfO5P0pNKaqFUwxkWhCQM
         hvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769541822; x=1770146622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1Ljmnc3jvrUWouZUSKrvimmjGl6uGM58yfKDYeoGs8=;
        b=SnG+FYk30i6bBi4F1iO3dhwj7FxzZfaEs9d5WzFKAeJ/S4JSTCBfqlCv7jnmI2gKG9
         uo/7iTIvSlW3NskQa3wY7HoVys3R0WrCk6jMTj32BJws+nl3RJ8c4+OETrfB/nj9250G
         +OGyl2M845LQz+N/QZ/cI26B+IqQhaWkzAilzUpU9ot8T1+YS2elDvsaGeBa3b5+UCe9
         69+XMHsbFeLI2iOy+9s7gDCYnrpjq0Rm0ZkncD2IGmsMiJqOmrq5I8vXH635+AF4Zjn4
         YA10PjGaPadzdx3xscl0Zv5SwHTsBOxmA9VH/T+qqGwTwXb40m1biDSgPgQBDwmY8315
         SEqA==
X-Forwarded-Encrypted: i=1; AJvYcCWKu7fmQRA0iaWuaG1y4swrl8WvnGcrKLyeHgoVG8H/vQSBfWOxhx+/gBpZvASCheh100nq5E8LJqrXXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ854gnsZigUrp6WaxkXm5CKsUwviXvmiM4MJ7j2/KJlVNH3pV
	GZqOuzsLSEvNHRLJ1BgNE4nfcj8AG0PP/kKfwp+RvTY0BjGzffoGyvqVKoVx03v8UPcDDNr6Ely
	L275siqYT2SvJgXOpqa+mDc4DrYFQMD+x5vuz7Ww=
X-Gm-Gg: AZuq6aLwSg0nXpPBMvh7OkLyBFk461Qvo5Xc/9e+dx8Vh7+EtPtV3CqyP0sRVN1sSzq
	epi0EUoekkZIAY15Kd22PF0ScJ8MfdlATvHsfcUdUdFEc3iHTO0aYkNjhAscxuQSQrZ4m/wHebg
	e+/FAXGCPhX5n7/qRceGto0nNYMwmlGrK43SLi+BL2q+F4D+0iMoAs7LjKkUwil8GIQJdddenF8
	UvOq/vJIBs9AYszN7rpmg79Jm32gKJJY6Wwhi2YQA6dvWXXg1U4tb9YMDISz2yX1KEx74O0
X-Received: by 2002:a05:7022:608d:b0:11f:2c69:31 with SMTP id
 a92af1059eb24-124a00e8fb0mr1761897c88.46.1769541821762; Tue, 27 Jan 2026
 11:23:41 -0800 (PST)
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
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com> <6249756d-7e49-464e-bb7e-11dfba3085f3@roeck-us.net>
In-Reply-To: <6249756d-7e49-464e-bb7e-11dfba3085f3@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Tue, 27 Jan 2026 22:23:24 +0300
X-Gm-Features: AZwV_QjGqNcx8n0XKi0y0qkHY8c95cY12M1KlP2VRLoTE86l24RERVaH6NMXtvI
Message-ID: <CAJ12PfODdy+rgBumHv5gUeaqikUGMkADg-UoBLuZPrtBanF40w@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000b408fd0649638fd2"

--000000000000b408fd0649638fd2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 7:39=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/27/26 02:35, TINSAE TADESSE wrote:
> >
> >
> > On Mon, Jan 26, 2026 at 1:36=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et <mailto:linux@roeck-us.net>> wrote:
> >  >
> >  > On 1/24/26 11:11, Armin Wolf wrote:
> >  > > Am 24.01.26 um 15:45 schrieb TINSAE TADESSE:
> >  > >
> >  > >> On Fri, Jan 16, 2026 at 9:24=E2=80=AFAM Guenter Roeck <linux@roec=
k-us.net <mailto:linux@roeck-us.net>> wrote:
> >  > >>> On 1/15/26 05:50, TINSAE TADESSE wrote:
> >  > >>>> On Wed, Jan 14, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@ro=
eck-us.net <mailto:linux@roeck-us.net>> wrote:
> >  > >>>>> On 1/14/26 05:07, TINSAE TADESSE wrote:
> >  > >>>>> ...
> >  > >>>>>>>> Hi Guenter,
> >  > >>>>>>>>
> >  > >>>>>>>> I tested changing the i801 SMBus controller to use
> >  > >>>>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
> >  > >>>>>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With=
 this
> >  > >>>>>>>> change, spd5118 resume failures (-ENXIO)
> >  > >>>>>>>> still persist, suggesting PM ordering alone is insufficient=
 and other
> >  > >>>>>>>> firmware interactions are involved.
> >  > >>>>>>> How about the problem in the suspend function ? Is that also=
 still seen ?
> >  > >>>>>>>
> >  > >>>>>>> Also, the subject talks about -EIO. Is that still seen ?
> >  > >>>>>>>
> >  > >>>>>>> Either case, can you enable debug logs for the i801 driver ?
> >  > >>>>>>> It should generate log entries when it reports errors.
> >  > >>>>>>>
> >  > >>>>>>> Thanks,
> >  > >>>>>>> Guenter
> >  > >>>>>>>
> >  > >>>>>> Hi Guenter,
> >  > >>>>>>
> >  > >>>>>> Thank you for the questions. To clarify:
> >  > >>>>>>
> >  > >>>>> Please do not drop mailing lists from replies.
> >  > >>>>>
> >  > >>>>>> 1) I have not observed any failures in the suspend path. The =
suspend
> >  > >>>>>> callback completes successfully, and
> >  > >>>>>> I have not seen I2C errors or warnings during suspend at any =
point.
> >  > >>>>> Sorry, I seem to be missing something.
> >  > >>>>>
> >  > >>>>> In that case, what is the point of patch 3/3 of your series wh=
ich
> >  > >>>>> removes hardware accesses from the suspend function ?
> >  > >>>>>
> >  > >>>>>> 2) I have also not observed -EIO in my testing. The error con=
sistently
> >  > >>>>>> reported on resume and subsequent hwmon access is -ENXIO.
> >  > >>>>>> Earlier references to -EIO were based on assumptions rather t=
han
> >  > >>>>>> observed logs, and I should have been clearer about that.
> >  > >>>>>>
> >  > >>>>> Thanks for the clarification.
> >  > >>>>>
> >  > >>>>> Guenter
> >  > >>>>>
> >  > >>>>>> I am enabling debug logging for the i801 driver to collect mo=
re
> >  > >>>>>> concrete evidence of controller state during resume.
> >  > >>>> Hi Guenter,
> >  > >>>>
> >  > >>>>> Sorry, I seem to be missing something.
> >  > >>>>>
> >  > >>>>> In that case, what is the point of patch 3/3 of your series wh=
ich
> >  > >>>>> removes hardware accesses from the suspend function ?
> >  > >>>> You are right to question this, and I agree that it needs clari=
fication.
> >  > >>>>
> >  > >>>> Patch 3/3 was originally proposed under the assumption that the=
 resume failures
> >  > >>>> were caused by spd5118 performing I2C transactions while the
> >  > >>>> controller was not yet available,
> >  > >>>> and that removing hardware accesses from the suspend path might
> >  > >>>> mitigate the issue.
> >  > >>>> At that point, I assumed the problem was limited to the resume =
callback.
> >  > >>>>
> >  > >>>> After enabling detailed i801 debug logging and testing with
> >  > >>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
> >  > >>>> it became clear that this assumption was incorrect. The control=
ler
> >  > >>>> itself reports "i801_smbus: No response"
> >  > >>>> both during suspend and immediately after resume, and spd5118 m=
erely
> >  > >>>> propagates the resulting -ENXIO.
> >  > >>> Outch, that really hurts, because it means that something is ser=
iously
> >  > >>> broken in both the suspend and resume path. The device _must_ be=
 accessible
> >  > >>> in the suspend path. Otherwise there is no guarantee that the de=
vice is
> >  > >>> accessible for normal (pre-suspend) operation. After all, someon=
e could
> >  > >>> run a script reading sysfs attributes in a tight loop continuous=
ly,
> >  > >>> or the thermal subsystem could try to access the chip. That woul=
d suddenly
> >  > >>> start to fail if something in the device access path starts to b=
e suspended
> >  > >>> while the underlying hardware is still believed to be operationa=
l.
> >  > >>>
> >  > >>> I could imagine some hack/quirk for the resume path, such as del=
aying resume
> >  > >>> for some period of time for affected hardware, but I have no ide=
a what to
> >  > >>> do on the suspend side. We can not just drop device writes durin=
g suspend
> >  > >>> because some broken hardware/firmware does not let us actually a=
ccess
> >  > >>> (and thus suspend) the hardware anymore by the time the suspend =
function
> >  > >>> is called.
> >  > >>>
> >  > >>> Guenter
> >  > >>>
> >  > >>>> This indicates that the issue is not caused by spd5118 suspend/=
resume
> >  > >>>> behavior, but by the unavailability of the
> >  > >>>> SMBus controller due to platform or firmware interactions durin=
g
> >  > >>>> s2idle transitions.
> >  > >>>>
> >  > >>>> Given this, I agree that patch 3/3 does not address the root ca=
use and
> >  > >>>> does not provide a justified improvement.
> >  > >>>> I am therefore fine with dropping it.
> >  > >>>>
> >  > >>>> Thank you for pointing this out.
> >  > >>>>
> >  > >> Hi Guenter,
> >  > >>
> >  > >> Thanks for the continued review and for questioning the earlier
> >  > >> direction =E2=80=94 that helped narrow this down properly.
> >  > >>
> >  > >> After enabling full i801 debug logging (included below in this em=
ail)
> >  > >> and inspecting both drivers, it became clear that the resume
> >  > >> failures are not caused by spd5118 accessing the hardware too
> >  > >> early, nor by PM ordering issues. Instead, the SMBus controller
> >  > >> explicitly reports =E2=80=9CSPD Write Disable is set=E2=80=9D, an=
d any
> >  > >> block write transactions to the SPD device consistently fail with
> >  > >> DEV_ERR. spd5118 merely propagates the resulting -ENXIO.
> >  > >
> >  > > Oh no, this likely happens even when merely reading values, as the=
 spd5118
> >  > > uses a page register to switch between different register pages. I=
n order
> >  > > to access temperature data (page 0), you might already have to iss=
ue a
> >  > > write access to the page register. The only reason why it works fo=
r you
> >  > > is that the spd5118 likely already has page 0 selected by the syst=
em firmware
> >  > > during boot.
> >  > >
> >  >
> >  > Exactly. There is no guarantee that page 0 is selected.
> >  >
> >  > >> With that in mind, I have dropped the earlier patch that attempte=
d
> >  > >> to remove hardware access from the suspend path
> >  > >> unconditionally.
> >  > >> That patch does not address the root cause and is no longer
> >  > >> part of the series.
> >  > >>
> >  > >> I am instead proposing a minimal 2-patch series:
> >  > >>
> >  > >> 1/2 records whether the platform enforces SPD write disable at pr=
obe
> >  > >> time (no behavior change).
> >  > >> 2/2 avoids regcache writeback during suspend/resume when the devi=
ce
> >  > >> operates in read-only mode, while still allowing read access to
> >  > >> temperature inputs.
> >  > >>
> >  > >> This avoids issuing SMBus transactions that are architecturally
> >  > >> blocked on these systems, and does not rely on
> >  > >> delays or PM ordering assumptions, and leaves behavior unchanged =
on
> >  > >> platforms where SPD writes are permitted.
> >  > >>
> >  > >> If this direction looks acceptable, I=E2=80=99m happy to re-spin =
and post the
> >  > >> series formally.
> >  > >>
> >  > >> Thanks again for the guidance.
> >  > >
> >  > > I do not know if this is a reliable solution, as the system firmwa=
re might
> >  > > select a different register page during resume. This will then pre=
vent the
> >  > > driver from functioning.
> >  > >
> >  >
> >  > No, it is not reliable. The driver is simply not usable in this scen=
ario.
> >  > This isn't just the temperature sensor code - the eeprom code is aff=
ected
> >  > as well.
> >  >
> >  > > I would love to see the spd5118 driver working on such systems wit=
h reduced
> >  > > functionality, but i will leave it to Guenter to decide if this ap=
proach is
> >  > > maintainable.
> >  > >
> >  > > Besides that: did the spd5118 driver load automatically on your de=
vice?
> >  > >
> >  >
> >  > I thought that was disabled. The i801 driver is supposed to detect i=
f write
> >  > protect is enabled and, if so, it is supposed to not instantiate the=
 spd5118
> >  > driver for DDR3. Support for this was added with commit 4d6d35d3417d=
 ("i2c:
> >  > smbus: introduce Write Disable-aware SPD instantiating functions"). =
Apparently
> >  > the code to do this never made it into the i801 driver.
> >  >
> >  > The i801 driver needs to be fixed to inform the spd initialization c=
ode
> >  > that the spd5118 address range is write protected. The patch to do t=
his was
> >  > "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I h=
ave no idea
> >  > why that patch didn't make it upstream.
> >  >
> >  > Guenter
> >  >
> >
> > Hi Guenter,
> >
> >  > > The i801 driver needs to be fixed to inform the spd initialization=
 code
> >  > > that the spd5118 address range is write protected. The patch to do
> >  > > this was
> >  > > "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I
> >  > > have no idea
> >  > > why that patch didn't make it upstream.
> >
> > I initially considered exposing SPD write-protection as a capability to=
 be consumed by spd5118.
> > However, spd5118 already depends on firmware-initialized state (page se=
lection) and cannot reliably
> > determine safe operation at probe time without issuing writes.
> > Given that, suppressing SPD instantiation in the i801 driver when SPD W=
rite Disable is
> > the only solution here.
> >
> > Tested the remaining patch [1], and it does not seem to fix the issue, =
as it is added at the wrong stage
> > in the initialization of the i801 driver. The attached log shows that s=
pd5118 is instantiated and fully probed
> > before the "do not instantiate spd5118 under SPD Write Disable" is acte=
d upon.
> > This confirms that suppressing instantiation must occur before adapter =
registration in i801.
> > Once the adapter is registered, the SPD scan has already happened, and =
spd5118 has bound successfully
> > based on the firmware-initialized state, even though correct operation =
is impossible.
> > Therefore, the fix must be run prior to adapter registration.
> >
> > [1] https://lore.kernel.org/all/20250430-for-upstream-i801-spd5118-no-i=
nstantiate-v2-2-2f54d91ae2c7@canonical.com/ <https://lore.kernel.org/all/20=
250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical=
.com/>
> >
> >
> > The fix is to register the SPD write-disable policy before i2c_add_adap=
ter(), so the I2C core never
> > probes SPD addresses on write-protected platforms.
> >
>
> Do you have SENSORS_SPD5118_DETECT enabled in your configuration ? It sho=
uld be disabled
> on systems with DMI enabled.
>
> Guenter
>

Hello Guenter,

Disabling CONFIG_SENSORS_SPD5118_DETECT completely avoids the issue on
affected platforms,
even without any code changes. This confirms that the failures are
triggered specifically by automatic
SPD5118 instantiation on systems where the i801 controller enforces
SPD Write Disable.
The existing Kconfig already documents that auto-detection is optional
and that, on x86, instantiation
is expected to be coordinated by the SMBus subsystem.

The fact that disabling auto-detection avoids the issue is evidence
that instantiation itself is
unsafe under SPD Write Disable, not that spd5118 is malfunctioning.

The existing Kconfig help already says "Disabling the detect function
will speed up boot time and reduce
the risk of mis-detecting=E2=80=A6", and the attached patch documents the
reason why mis-detection can happen.

--000000000000b408fd0649638fd2
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-hwmon-spd5118-Document-detect-limitations-under-SPD-.patch"
Content-Disposition: attachment; 
	filename="0001-hwmon-spd5118-Document-detect-limitations-under-SPD-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mkwzauoy0>
X-Attachment-Id: f_mkwzauoy0

RnJvbSAwNThhZTYzMzYzOTJmMjZiY2ZkODI1ZmE5YzAxOTE0YzUyZjQ3YzRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaW5zYWUgVGFkZXNzZSA8dGluc2FldGFkZXNzZTIwMTVAZ21h
aWwuY29tPgpEYXRlOiBUdWUsIDI3IEphbiAyMDI2IDIyOjExOjI1ICswMzAwClN1YmplY3Q6IFtQ
QVRDSF0gaHdtb246IHNwZDUxMTg6IERvY3VtZW50IGRldGVjdCBsaW1pdGF0aW9ucyB1bmRlciBT
UEQgV3JpdGUKIERpc2FibGUKCkRvY3VtZW50IHRoYXQgb24gc29tZSB4ODYgcGxhdGZvcm1zIHRo
ZSBTTUJ1cyBjb250cm9sbGVyIG1heSBlbmZvcmNlClNQRCBXcml0ZSBEaXNhYmxlLCB3aGljaCBj
YW4gcHJldmVudCByZWxpYWJsZSBvcGVyYXRpb24gb2YgU1BENTExOApkZXZpY2VzLiBJbiBzdWNo
IGNvbmZpZ3VyYXRpb25zLCBhdXRvbWF0aWMgZGV0ZWN0aW9uIG1heSByZXN1bHQgaW4KcHJvYmUg
ZmFpbHVyZXMgdW5sZXNzIGluc3RhbnRpYXRpb24gaXMgY29vcmRpbmF0ZWQgYnkgdGhlIFNNQnVz
CmNvbnRyb2xsZXIgZHJpdmVyLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBUaW5zYWUgVGFkZXNzZSA8dGluc2FldGFkZXNzZTIwMTVAZ21haWwuY29tPgotLS0KIGRyaXZl
cnMvaHdtb24vS2NvbmZpZyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9LY29uZmlnIGIvZHJpdmVycy9od21vbi9L
Y29uZmlnCmluZGV4IDE1NzY3OGI4MjFmYy4uMzA5ZmE2Mzk4MDRkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2h3bW9uL0tjb25maWcKKysrIGIvZHJpdmVycy9od21vbi9LY29uZmlnCkBAIC0yMzQyLDYg
KzIzNDIsMTIgQEAgY29uZmlnIFNFTlNPUlNfU1BENTExOF9ERVRFQ1QKIAkgIEkyQyBTTUJ1cyBz
dWJzeXN0ZW0uIERldmljZXRyZWUgYmFzZWQgc3lzdGVtcyB3aWxsIGluc3RhbnRpYXRlCiAJICBh
dHRhY2hlZCBkZXZpY2VzIGlmIHRoZSBESU1NcyBhcmUgbGlzdGVkIGluIHRoZSBkZXZpY2V0cmVl
IGZpbGUuCiAKKwkgIE5vdGUgdGhhdCBvbiBzb21lIHg4NiBwbGF0Zm9ybXMgdGhlIFNNQnVzIGNv
bnRyb2xsZXIgbWF5IGVuZm9yY2UKKwkgIFNQRCBXcml0ZSBEaXNhYmxlLCB3aGljaCBjYW4gcHJl
dmVudCByZWxpYWJsZSBvcGVyYXRpb24gb2YgU1BENTExOAorCSAgZGV2aWNlcy4gSW4gc3VjaCBj
b25maWd1cmF0aW9ucywgYXV0b21hdGljIGRldGVjdGlvbiBtYXkgbGVhZCB0bworCSAgcHJvYmUg
ZmFpbHVyZXMgdW5sZXNzIGluc3RhbnRpYXRpb24gaXMgY29vcmRpbmF0ZWQgYnkgdGhlIFNNQnVz
CisJICBjb250cm9sbGVyIGRyaXZlci4KKwogCSAgRGlzYWJsaW5nIHRoZSBkZXRlY3QgZnVuY3Rp
b24gd2lsbCBzcGVlZCB1cCBib290IHRpbWUgYW5kIHJlZHVjZQogCSAgdGhlIHJpc2sgb2YgbWlz
LWRldGVjdGluZyBTUEQ1MTE4IGNvbXBsaWFudCBkZXZpY2VzLiBIb3dldmVyLCBpdAogCSAgbWF5
IHJlc3VsdCBpbiBtaXNzZWQgRElNTXMgdW5kZXIgc29tZSBjaXJjdW1zdGFuY2VzLgotLSAKMi40
Ny4zCgo=
--000000000000b408fd0649638fd2--
