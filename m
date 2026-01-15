Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D338A715
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485023; cv=none; b=hLJbP5D7lT+nvntemn+caBX7aCWV2ZKtwmgNIKjo8Lv8G69e37squODgo8pKRAeqdsUaZD3/GGWzIrJ354QS4XjIktAnUJVxjTNchw488aZfTMgXt+jpGkITexJXYQoCWZjQdC1A63ffT5jCc+1M3h1Pk+oJTgijkhpAW4+5pMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485023; c=relaxed/simple;
	bh=sLScD0jLJT5TlpL/ICsGU3NJiF3/tmdvmVPvejWkxMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8JS6U5CxCYbqKWZk80tQyYDjZwoa24G+KYHXpza4ktlT9If7Opgx7UGjRzEjDzCtBjcxDRLV3dIDfQZwLBSLxDt1Du089NOsROHiXO5xhOTTdBeHK+dUX6sX1BiYTrEgxXhiCP6d0m1MftmSWRlV9A6i0s9Uk/xnx7Rkbtp9nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juT74k8c; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juT74k8c"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-121a0bcd364so1199642c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 05:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768485022; x=1769089822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLScD0jLJT5TlpL/ICsGU3NJiF3/tmdvmVPvejWkxMI=;
        b=juT74k8c+8LRIaFNSjaLbs4EqSHDmqio/nGSKRb/K47inMJz9GxGvmnHE+15kH/HmH
         KRFxMvPQKPN5mwPnKjph51wF7Y6JkfYNymwQappAOc7OE8/BK/olQwpxBC5m4zUwt3zD
         3KZDhIfEdQLXqjX+nWmbo9+tBHuUCLIf8gd5PSD31q79DfoodlJ4Dzs7FMDUnmud3qPY
         l73flu5aYlfefwILCHXQoWLjhknaU6mg1UfffEItkhsxAqNW2tp9HnEKOfFpCq9xwINQ
         rB7R1fk7xKg1jhm1xmiuiG7fxXQ6sdZiBmBsPGoZqXEB0Ase8J4zgpVSDbMCyMdoNN3F
         Xq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485022; x=1769089822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sLScD0jLJT5TlpL/ICsGU3NJiF3/tmdvmVPvejWkxMI=;
        b=mg7jcWrWtCFJSr43sg+etxezIJH3OAHj4KR9GQSq1KUtpfTixdmwYdjM5q3IgxAwML
         X9UWl0vgOqsBHOqGH4Cx02/gXORxgYFhsmdLomoK+VwbU4TTMnVRRC2p7m8z0Ihb+GTG
         Qk42naqPxiYcOTceVPJDyuUDEN+mRgW/gmJ62Uu7M1Go2X1so8/tzS3XlKJfxT/vMR1W
         kw1ILbcyZ4EGqq7U+PozuIYi6F5vkkBxZfP7CrBPzlqcx5V2WscyltReTEqvoSeC25ho
         O5HishEQJGewW9eV6y9VUNquL4e0r349qzl1J4tHJhFXYH5alpFckcsx6qXi7u+dciz+
         l1IA==
X-Gm-Message-State: AOJu0YwJ2hruQGGLysbGugaPWRlyOk36WTikljlbY7kesptURM1LGfS4
	U+j29k3GXgfZTuPWGJSkgwwdbtZYXVLPJEViZGJpDFTxfmCiUpyksiKv2221xdKmz0n4oDBsv55
	P5NTHD05VbkZ1evT8pSnj08TIuoKQwLkDETFQEUk=
X-Gm-Gg: AY/fxX4QIhzJDSWDrQIdTLO8mtHpOhUu+LlP7X1qVxXwTFRRbd+Im2xASq6SujsHxoi
	SRbMc0Zs6ETMBg3aZe0B/EXRf/KSzlMWMcPyEwm/FSRV5sFWEDvM9fjBpdSuylFCWYQVglRiL2G
	qcYQ1PKrRTvjdhfc7GDpFvyd11wKSdjcsWUwwZ23m//2B6rhGFVxas2LpTNisIOU03ZynFTMUGF
	IVqb7T1a9UIqA5hJY4p4d/tb8T61BbIDTYMmk9iTTMwfHLPFWGHbzUxwb/vJ7H/kztrcIo=
X-Received: by 2002:a05:7022:3a05:b0:123:3508:893f with SMTP id
 a92af1059eb24-1233774913amr5774365c88.31.1768485019972; Thu, 15 Jan 2026
 05:50:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net> <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
 <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net> <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
In-Reply-To: <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Thu, 15 Jan 2026 16:50:03 +0300
X-Gm-Features: AZwV_QjdTq4gioRqUvXrXRtRMZfXGs5fWOysybv5e67TUpVpkLP5lBXoChPgq-8
Message-ID: <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/14/26 05:07, TINSAE TADESSE wrote:
> ...
> >>> Hi Guenter,
> >>>
> >>> I tested changing the i801 SMBus controller to use
> >>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
> >>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
> >>> change, spd5118 resume failures (-ENXIO)
> >>> still persist, suggesting PM ordering alone is insufficient and other
> >>> firmware interactions are involved.
> >>
> >> How about the problem in the suspend function ? Is that also still see=
n ?
> >>
> >> Also, the subject talks about -EIO. Is that still seen ?
> >>
> >> Either case, can you enable debug logs for the i801 driver ?
> >> It should generate log entries when it reports errors.
> >>
> >> Thanks,
> >> Guenter
> >>
> >
> > Hi Guenter,
> >
> > Thank you for the questions. To clarify:
> >
> Please do not drop mailing lists from replies.
>
> > 1) I have not observed any failures in the suspend path. The suspend
> > callback completes successfully, and
> > I have not seen I2C errors or warnings during suspend at any point.
>
> Sorry, I seem to be missing something.
>
> In that case, what is the point of patch 3/3 of your series which
> removes hardware accesses from the suspend function ?
>
> > 2) I have also not observed -EIO in my testing. The error consistently
> > reported on resume and subsequent hwmon access is -ENXIO.
> > Earlier references to -EIO were based on assumptions rather than
> > observed logs, and I should have been clearer about that.
> >
>
> Thanks for the clarification.
>
> Guenter
>
> > I am enabling debug logging for the i801 driver to collect more
> > concrete evidence of controller state during resume.
>

Hi Guenter,

> Sorry, I seem to be missing something.
>
> In that case, what is the point of patch 3/3 of your series which
> removes hardware accesses from the suspend function ?

You are right to question this, and I agree that it needs clarification.

Patch 3/3 was originally proposed under the assumption that the resume fail=
ures
were caused by spd5118 performing I2C transactions while the
controller was not yet available,
and that removing hardware accesses from the suspend path might
mitigate the issue.
At that point, I assumed the problem was limited to the resume callback.

After enabling detailed i801 debug logging and testing with
SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
it became clear that this assumption was incorrect. The controller
itself reports "i801_smbus: No response"
both during suspend and immediately after resume, and spd5118 merely
propagates the resulting -ENXIO.
This indicates that the issue is not caused by spd5118 suspend/resume
behavior, but by the unavailability of the
SMBus controller due to platform or firmware interactions during
s2idle transitions.

Given this, I agree that patch 3/3 does not address the root cause and
does not provide a justified improvement.
I am therefore fine with dropping it.

Thank you for pointing this out.
