Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462041EBA1E
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758831183; cv=none; b=KQQqFoXfu0gwR0O0rXlo9rnQDaijdGWHuw6n6lUePUNH5fT80a8TAJUEjYIfqNNk4m7ShB6tLzvpnR4SwkntNNPQTfzJqIGQytkfosv/acRn+6WLIo0T0ZU3RUn/KKPe7Hv1VyMomAoFeJik0AtImeUUwObzbhCGrLMxhQl8a9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758831183; c=relaxed/simple;
	bh=OPr4wd6wvakoXDFdLWCCUymjgV11dNs5Xp/NA419X0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgjicZkh+ewJ5rdLJL18gXwOVQVOo7AB6uojm86vitooEIgjoYuRBrGsYbSi/XtJxqiF8pWWAd/3QwcZNC+bXMPtDwqY//kDSA6lwnWS4RMPbRsAqC8ZsOxffqZ1Lpf/ILcK2337GQG3KVH8FfYZYlkSXjLxdPShVegctBYiPAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=E4xXJ/sk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="E4xXJ/sk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b35f6f43351so189793266b.1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1758831180; x=1759435980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLjsdrb7kU47e3HE3GVEoXLGLRJiTUoQk+TEJ2IGyGo=;
        b=E4xXJ/sk9Pv2yw2VoemAcc4H+L4NoG6NvnX68S5CeKEqtCHxTxtT0Fjdok78pmbTGZ
         0OCrZ6Gf42BLAOY7MXwXtTcMT8kaYlVCngWFCZwqpf+brttlo3mqe9qbS4oZmIk2q/Nv
         SNGMWCF/ZBmT+A75XeRQisJRdCZ+POH63mMPcVkZSNDJJNEoW7ZT5F1Z4tCiO2YrSA/B
         oUDcvgnPtzSJMX+Vg3FOu64TeCxEIE/4YlJxEDJYRafZynB1iERXFWZebr6w809fF6NB
         61/Q4pzSWd2g0mRKguyvbshVv5FM7CgW9/tBAfogJPqGCHR2Goky4jhZLLQfFYJrV+kR
         wPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758831180; x=1759435980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLjsdrb7kU47e3HE3GVEoXLGLRJiTUoQk+TEJ2IGyGo=;
        b=gxU+4PuNH8nnZNnmht0eCmhbD3Exr7rCHt5lqYgLuvvMTlFbuNy0Qs1y1Pqq+ECh/s
         QpdnzQwNkM+c56f6n21Rq1Hwe9HUNr9iUKZFNzANM4KCF/wPTyRcWyhwxfE/fiR/RtZE
         YHEt3nhPNXr5Y1WmYhzICHMGHP/2IhyIKQhzE1rX0iyWJek2kO71DJZ/K9cVoK6wXqdP
         Xa6AFTNuRP73ywGEFHkyv79rPxcAEAOdki62oRZGMMFhNTicItO+8oZFh8p244xmw9ao
         9d4hEhCf6XeXDQcCGZ2paKHvmX4ParNuDikZ2WTYTWlr/2amnNg27+tWjL+KhNP5WRmb
         jzNg==
X-Gm-Message-State: AOJu0YyxExRyTFxW5FWk3Sx87t97fYl10JT1EwVQTev8Yufz1OEZdRuD
	NW8PLftc42Zhx3zow+89DwxRqApImG83VHSt25/J2JLHd67L0jVFvAlAtpVMudm5vaJQhu6OOcQ
	XxSyiE7pybEoj2UTYJXcgQyBjj1tTbb523uyQisMmIg==
X-Gm-Gg: ASbGncv/B/9qmK95pw42LfxnkTltk5q5MrTX8tI3bNPJGe2K+SMZH7jZu0Hk4aeHUx2
	xZptTq9uvFeh9/f9J1AHjykq1cPzArKXQiKjBQ+YMslMriUja8xADjuBniHUoptVGRLcUklMrnJ
	ywvjGulsymw9lg48Vn2xCPurKC5wkJduD9Ssyc/WeSPxMDpEHR55ANexEbfFwkduL2VyFasFNDx
	LuPF6bMEnnIWZEL/tY=
X-Google-Smtp-Source: AGHT+IEpi7Wc/4pCcJuLv/6FrFXhrLYQdU1ecNgEGjclujLL3Yn39S9vkw9Cn/jIptsgq59J0PczgaOeUc8EmOuXdDA=
X-Received: by 2002:a17:907:3f98:b0:b04:4175:62f7 with SMTP id
 a640c23a62f3a-b34ba545295mr502805366b.33.1758831179513; Thu, 25 Sep 2025
 13:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924213027.1887516-1-robert.marko@sartura.hr>
 <f019dcef-afdd-4d18-b28c-b214fa14f1c8@roeck-us.net> <CA+HBbNFe+7XT3bSUEagsXiug-bmh=fBfLAW0d7WR73Di8-ozTA@mail.gmail.com>
 <357f9a92-df60-4e6c-9019-40a4adbf0702@roeck-us.net>
In-Reply-To: <357f9a92-df60-4e6c-9019-40a4adbf0702@roeck-us.net>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 25 Sep 2025 22:12:48 +0200
X-Gm-Features: AS18NWCKnUfh9WVkpM_OSxaxZf7VUhId85ZGgBMXi-ITxknGdPPRPS4QBkHAASE
Message-ID: <CA+HBbNHcO=NintKBz8CmYRruiuHM8EFU+wQjw0-JbGKMK2xv2g@mail.gmail.com>
Subject: Re: [PATCH] hwmon: sparx5: make it selectable for ARCH_MICROCHIP
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	daniel.machon@microchip.com, luka.perkov@sartura.hr, 
	benjamin.ryzman@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 5:33=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Thu, Sep 25, 2025 at 11:15:52AM +0200, Robert Marko wrote:
> > On Thu, Sep 25, 2025 at 12:07=E2=80=AFAM Guenter Roeck <linux@roeck-us.=
net> wrote:
> > >
> > > On 9/24/25 14:30, Robert Marko wrote:
> > > > LAN969x uses the same sensor and driver, so make it selectable for
> > > > ARCH_MICROCHIP.
> > > >
> > > LAN969x _is_ the Ethernet switch driver for Sparx5, so this descripti=
on does
> > > not really make sense. Same as what ? Itself ?
> > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > >   drivers/hwmon/Kconfig | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > > > index 840d998f850a..ba2b7b2f6c44 100644
> > > > --- a/drivers/hwmon/Kconfig
> > > > +++ b/drivers/hwmon/Kconfig
> > > > @@ -632,7 +632,7 @@ config SENSORS_I5K_AMB
> > > >
> > > >   config SENSORS_SPARX5
> > > >       tristate "Sparx5 SoC temperature sensor"
> > > > -     depends on ARCH_SPARX5 || COMPILE_TEST
> > > > +     depends on ARCH_MICROCHIP || COMPILE_TEST
> > >
> > > ... and silently disable it for ARCH_SPARX5 at the same time ? That i=
s not what
> > > the description says, and is completely unacceptable unless explained=
.
> > >
> > > >       help
> > > >         If you say yes here you get support for temperature monitor=
ing
> > > >         with the Microchip Sparx5 SoC.
> > >
> > > ... and, on top of all that, still claim to support Sparx5 even that =
is
> > > no longer the case.
> > >
> > > Ah, I see, this patch depends on patches in linux-next. You might wan=
t to say that.
> > > Also, there is context missing: If the sensor is _only_ supported on =
Sparx5
> > > (which everything but the dependency suggests), it does not make sens=
e to extend
> > > the dependencies. Why make the sensor configurable for _all_ microchi=
p architectures
> > > if it is only supported on Sparx5 ? Maybe there is some other series =
explaining
> > > this, but this patch is all I got and it does not explain anything. I=
t is only
> > > confusing and does not make sense on its own.
> >
> > Hi Guenter,
> > I should have extended the description a bit.
> >
> > LAN969x uses the same sensor as SparX-5, and they both select ARCH_MICR=
OCHIP so
> > SparX-5 only configs can still select this driver.
>
> You mean ARCH_LAN969X (in contrast to ARCH_SPARX5 and LAN969X_SWITCH) ?

Both ARCH_LAN969X (Which is now in linux-next) and ARCH_SPARX5 select
ARCH_MICROCHIP
which was introduced to avoid the need to keep adding new ARCH symbols
to individual drivers.

LAN969X_SWITCH is just the switchdev driver for ARCH_LAN969X.

> That makes sense, but it really needs to be explained in the patch
> description. Also, since ARCH_MICROCHIP does not exist for arm64 in the
> upstream kernel, a note that this depends on other patches in linux-next
> would have been helpful. You may know that, and others may know that, but
> I don't, and digging through that cost me at least an hour of time which
> I don't have.

Yes, I should have pointed out that this depends on linux-next since
the prerequisite
Kconfig.platforms change for ARM64 is in linux-next, but it should
land in the regular ARM tree
if its not already there.

If there is need for a v2, I will make sure to expand the description.
Sorry for the confusion.

Regards,
Robert
>
> Guenter



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
