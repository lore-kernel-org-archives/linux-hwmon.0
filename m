Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FA014A8E
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Jan 2026 14:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769265969; cv=pass; b=ide7TByIfNZIQ7YNXj41jdZ7qO1+RBBAh3d1SNBG5SEYblGctw1BgrvYHtVm8YWTAzcQFrzlm4GxWhMYP5DtKpY1DvNO6l/mI3NhUEB17ciF5wo3NXYJifKqqK2yXKQqaetVgz3HK0cGpjMizXNCxghwDhn5f1R64sIDaXGCrQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769265969; c=relaxed/simple;
	bh=sibMAjWyxhfk26LiIahxspHYkaM94XID69jPPdNxHnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pectOp+n/ccyDWBqJiXASoosTyMNDjup0oKTlhDffOVT5NSTMrf/WSK3zEBKl/PZigeOSqcj96DbgWeq9xNZ2F5hkIWTm2AqdK//kbmE7yy2eLwCzxJJ+JHkLMFADOSCMz6vDf3RsM2OmsaKzzJnNsepd276ktemn3ZBNQr4JoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acv7uIF1; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acv7uIF1"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12336f33098so2979483c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Jan 2026 06:46:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769265967; cv=none;
        d=google.com; s=arc-20240605;
        b=KUwSZfpBdwPYSgvDQW/29Ohe3IyKkpQQxKGpbrKqfwi7WcLw2JjVl3rPMRSck3jD8i
         fgOUHjER6X/oiG73dTJV8jWUYX0YXghUCPq37R96opREy9JKIh4X1QbaAkzs4vcyobVE
         YRym5AqD+FzALW83Z3q9zVH7gmW2f3ROiw3cqOdg0GL07iZzOjw+4cMWkqmyGPnWGNK8
         60RCIDQI8MpsHUU+LeD1VTSD6tI4PpGzTN++4mzUdS4X5CXbeCXRZvQbaeWdFhnxcSTx
         wm18Wt0HpvYy9ASq+Hd4HyUx6P1fuD2eyh+4CisTbvelBJhAYJdWCs7Sprk+iQ94YgCI
         ybTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MetqOn7IpNzcaMv8vANdpkYZ5A2FXxyutxOpqexIszw=;
        fh=m2LILBCl4uSAOuQqvFf7BoJo4KwKru3AksxtlsXOLUM=;
        b=avnP5/O0uLF3owsytCaUJd4wttpRSe60W4cuk9XJXgsviej50iKMydAullrgaPDviu
         bxzAkQbcC/Ek6DQS/F0vOgtIXK/G6Si+sR9SPi4c/xFQ/jqa7zX3F3S1b9Rnh/L5Fdh6
         WzaA2nxPjBKHRm8ZiFqKKNShuZ77Lz63laIftfVo3bLhKVZCVsG1BjFTeqy5F4Nb4ySJ
         GHO38qTYqbGxc3YI7S8HhtjHZb80ueCvG/nLU0ai5tX+k0ZqdJDlJ6sjK46Hj/Bkx2fO
         vVYtEj5KBTfcY0N36ec9Yt5JRqXhFccwEr3ikFEWk4/CEV7VTFeAjE7r1G77BTAjQT6T
         AMSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769265967; x=1769870767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MetqOn7IpNzcaMv8vANdpkYZ5A2FXxyutxOpqexIszw=;
        b=acv7uIF1a7CuCmG8QUGRx/JHMc0AIdLFgpTS0Z3vxy3Stdt61riH6wXlNrK6nx0kH5
         4oOp++qhMYGmeJXlnVk3ZmQuZ8SH/xqPYVbJYAXb+u6q0QDMUH+3YzwW/xNflZTBp/Oe
         /MLq2KBk3Pi1DThxJsKp4ieV4F+M3wIM4zi+o0K9h2Sfc0dxnzhS+sdnhzBa9UJOMNbf
         Qthc13urRMsHYQrjT+YIgm5y+yuN/3UYnMh0FEEIDaufuuStaJoKVnR2+mVEw70Umoxc
         e3PiBxGTIsQ7KerW1QcE3F9ySGNfBHnVykh4nhduDJ1zwlY84ysDTCzGfhr9+GKKX/s2
         BXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769265967; x=1769870767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MetqOn7IpNzcaMv8vANdpkYZ5A2FXxyutxOpqexIszw=;
        b=UujUUKO9My2/BVIW+/LsjghOfG1hXOTUHAAHuGqL2VWnQkZ/b+Wlkg1T3TJWMxwUrr
         PICGh/xXWywd3irv/7miOEi3S6X97yCkZzDONthJxE6nzfYOWWmlVcJN8rdUeu/KQv3B
         /eK99jZoAVbtn3VpbOzgD7EMRxpO1wB9EwZq8IsqXFRHyFZVjnBlCgn71J6ZLtW0bQKx
         99Y+HePFGI5WsAD0PsbQ4DdruwVvjOdYAGo2na/3w7JRH92xhIr+dc/fo5xuwyxaTjW3
         cbNXEiWti/VMY6+qHSUNPspgzmYMGKJwzj0tE6bNJr3s2M5F0ceS8Wibu17eC0lm42UM
         kqnw==
X-Gm-Message-State: AOJu0Yyt6xYo/nJoKYSPWF9UKQ2BV3zQNEvMlfGc14vEfYsS1igAuqE4
	4w+eY16kdoOB5UIs3og/OVkaO4JLZWp0ai/OK8qnzHpL68XGRbnGG3ZK9fY/Gclj84pOrvsgApB
	/guYozmxJXn5Svywlan1vVDd057Fl75hObQ==
X-Gm-Gg: AZuq6aLoT7rpaAtoaEGbc28FcQE73ia3dgY91NGdqUuD3cylL/pFoy+5VbrGvbazfPs
	ZMsIKUnu3ststvbonTatKODG2XPWBCq7/mj3eNtgL3gA8qVh8W44plyHaHeCdea8aqyTnIidyIQ
	CRxsIPMOuNhCALfdprSTcmPxUJ3Kw7oDo/wR0a+sdgIfCeA+Xqye+Y6/RGEnB/l4Ppy6v3nuyFJ
	voR7KYpSwVXe++6eO6LwnsJmKmtL4sAXYjyIsf+CDLwDASd83wIUMMyF0bcnSJsY6Snh0BttiFu
	XMZ3uqM=
X-Received: by 2002:a05:7022:4388:b0:11a:fb3c:568b with SMTP id
 a92af1059eb24-1247dbb3ffbmr3316258c88.17.1769265966867; Sat, 24 Jan 2026
 06:46:06 -0800 (PST)
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
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
In-Reply-To: <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Sat, 24 Jan 2026 17:45:50 +0300
X-Gm-Features: AZwV_QgP66CvekKvqkUlQ-m9crsBwFoSn_7N6Luqtj6xbA-HYzUC7toNDAWAlqI
Message-ID: <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 9:24=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/15/26 05:50, TINSAE TADESSE wrote:
> > On Wed, Jan 14, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 1/14/26 05:07, TINSAE TADESSE wrote:
> >> ...
> >>>>> Hi Guenter,
> >>>>>
> >>>>> I tested changing the i801 SMBus controller to use
> >>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
> >>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
> >>>>> change, spd5118 resume failures (-ENXIO)
> >>>>> still persist, suggesting PM ordering alone is insufficient and oth=
er
> >>>>> firmware interactions are involved.
> >>>>
> >>>> How about the problem in the suspend function ? Is that also still s=
een ?
> >>>>
> >>>> Also, the subject talks about -EIO. Is that still seen ?
> >>>>
> >>>> Either case, can you enable debug logs for the i801 driver ?
> >>>> It should generate log entries when it reports errors.
> >>>>
> >>>> Thanks,
> >>>> Guenter
> >>>>
> >>>
> >>> Hi Guenter,
> >>>
> >>> Thank you for the questions. To clarify:
> >>>
> >> Please do not drop mailing lists from replies.
> >>
> >>> 1) I have not observed any failures in the suspend path. The suspend
> >>> callback completes successfully, and
> >>> I have not seen I2C errors or warnings during suspend at any point.
> >>
> >> Sorry, I seem to be missing something.
> >>
> >> In that case, what is the point of patch 3/3 of your series which
> >> removes hardware accesses from the suspend function ?
> >>
> >>> 2) I have also not observed -EIO in my testing. The error consistentl=
y
> >>> reported on resume and subsequent hwmon access is -ENXIO.
> >>> Earlier references to -EIO were based on assumptions rather than
> >>> observed logs, and I should have been clearer about that.
> >>>
> >>
> >> Thanks for the clarification.
> >>
> >> Guenter
> >>
> >>> I am enabling debug logging for the i801 driver to collect more
> >>> concrete evidence of controller state during resume.
> >>
> >
> > Hi Guenter,
> >
> >> Sorry, I seem to be missing something.
> >>
> >> In that case, what is the point of patch 3/3 of your series which
> >> removes hardware accesses from the suspend function ?
> >
> > You are right to question this, and I agree that it needs clarification=
.
> >
> > Patch 3/3 was originally proposed under the assumption that the resume =
failures
> > were caused by spd5118 performing I2C transactions while the
> > controller was not yet available,
> > and that removing hardware accesses from the suspend path might
> > mitigate the issue.
> > At that point, I assumed the problem was limited to the resume callback=
.
> >
> > After enabling detailed i801 debug logging and testing with
> > SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
> > it became clear that this assumption was incorrect. The controller
> > itself reports "i801_smbus: No response"
> > both during suspend and immediately after resume, and spd5118 merely
> > propagates the resulting -ENXIO.
>
> Outch, that really hurts, because it means that something is seriously
> broken in both the suspend and resume path. The device _must_ be accessib=
le
> in the suspend path. Otherwise there is no guarantee that the device is
> accessible for normal (pre-suspend) operation. After all, someone could
> run a script reading sysfs attributes in a tight loop continuously,
> or the thermal subsystem could try to access the chip. That would suddenl=
y
> start to fail if something in the device access path starts to be suspend=
ed
> while the underlying hardware is still believed to be operational.
>
> I could imagine some hack/quirk for the resume path, such as delaying res=
ume
> for some period of time for affected hardware, but I have no idea what to
> do on the suspend side. We can not just drop device writes during suspend
> because some broken hardware/firmware does not let us actually access
> (and thus suspend) the hardware anymore by the time the suspend function
> is called.
>
> Guenter
>
> > This indicates that the issue is not caused by spd5118 suspend/resume
> > behavior, but by the unavailability of the
> > SMBus controller due to platform or firmware interactions during
> > s2idle transitions.
> >
> > Given this, I agree that patch 3/3 does not address the root cause and
> > does not provide a justified improvement.
> > I am therefore fine with dropping it.
> >
> > Thank you for pointing this out.
> >
>

Hi Guenter,

Thanks for the continued review and for questioning the earlier
direction =E2=80=94 that helped narrow this down properly.

After enabling full i801 debug logging (included below in this email)
and inspecting both drivers, it became clear that the resume
failures are not caused by spd5118 accessing the hardware too
early, nor by PM ordering issues. Instead, the SMBus controller
explicitly reports =E2=80=9CSPD Write Disable is set=E2=80=9D, and any
block write transactions to the SPD device consistently fail with
DEV_ERR. spd5118 merely propagates the resulting -ENXIO.

With that in mind, I have dropped the earlier patch that attempted
to remove hardware access from the suspend path
unconditionally.
That patch does not address the root cause and is no longer
part of the series.

I am instead proposing a minimal 2-patch series:

1/2 records whether the platform enforces SPD write disable at probe
time (no behavior change).
2/2 avoids regcache writeback during suspend/resume when the device
operates in read-only mode, while still allowing read access to
temperature inputs.

This avoids issuing SMBus transactions that are architecturally
blocked on these systems, and does not rely on
delays or PM ordering assumptions, and leaves behavior unchanged on
platforms where SPD writes are permitted.

If this direction looks acceptable, I=E2=80=99m happy to re-spin and post t=
he
series formally.

Thanks again for the guidance.


[   13.530830] i2c-core: driver [spd5118] registered
...
[   29.555298] i801_smbus 0000:00:1f.4: SPD Write Disable is set
...
[   29.582447] i2c i2c-14: Creating spd5118 at 0x52
[   29.590744] spd5118 14-0052: probe
...
[   29.618983] spd5118 14-0052: DDR5 temperature sensor: vendor
0x00:0xb3 revision 2.2
[   29.619662] i2c i2c-14: client [spd5118] registered with bus id 14-0052
...
[ 1057.504362] PM: suspend entry (s2idle)
[ 1057.944405] spd5118 14-0052: Entering suspend path...
[ 1057.945387] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
size=3D8, addr=3D0x52, read_write=3D1
[ 1057.946251] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
size=3D8, addr=3D0x52, read_write=3D1
[ 1057.946866] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
size=3D8, addr=3D0x52, read_write=3D1
[ 1057.948324] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
size=3D8, addr=3D0x52, read_write=3D1
[ 1057.949817] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
size=3D8, addr=3D0x52, read_write=3D0
[ 1057.949904] i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4,
SMBHSTCNT=3D0x15, SMBHSTSTS_DEV_ERR=3D4
[ 1057.949952] i801_smbus 0000:00:1f.4: No response
[ 1057.950215] i801_smbus 0000:00:1f.4: Entering suspend path...
[ 1059.338647] ACPI: EC: interrupt blocked
[ 1060.756385] ACPI: EC: interrupt unblocked
[ 1060.926423] i801_smbus 0000:00:1f.4: Entering resume path...
[ 1060.926623] spd5118 14-0052: Entering resume path...
[ 1060.927930] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
size=3D8, addr=3D0x52, read_write=3D0
[ 1060.927969] i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4,
SMBHSTCNT=3D0x15, SMBHSTSTS_DEV_ERR=3D4
[ 1060.927995] i801_smbus 0000:00:1f.4: No response
[ 1060.928477] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
size=3D8, addr=3D0x52, read_write=3D0
[ 1060.928517] i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4,
SMBHSTCNT=3D0x15, SMBHSTSTS_DEV_ERR=3D4
[ 1060.928543] i801_smbus 0000:00:1f.4: No response
[ 1060.928582] spd5118 14-0052: Failed to write b =3D 0: -6
[ 1060.928707] spd5118 14-0052: PM: dpm_run_callback(): spd5118_resume
returns -6
[ 1060.928981] spd5118 14-0052: PM: failed to resume async: error -6
[ 1062.414560] PM: suspend exit
