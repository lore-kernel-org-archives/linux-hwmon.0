Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793820732;
	b=cixMzTl0gAsNMpYFCwbnY7upKZd5HWthIsPLBGFsn6EAZCZQaY0T07V3rV4xMTXHy4fV
	 EDOK47i+tVPFwGkwVuy4du3grKGdKiJNU/J7+vXelx76Bes1xXwco6SLfC+G7HX4hOK/3
	 SO6ew9fgEaHAC0eDTav2ICyVj6pxDddb1p21NLf5CwzNRxK+kdbyOJBoZznCUTml+lLFh
	 zCM2eLY8w/GvuF2YSDhxXgrT9Dbx6vuhXWuYgVkeJ/tIY+MbeRbeSX6e5ezysnHS3xDGn
	 yy1UbNvOZTtn7dbLk2fosY6wBEek0XR++XVm14JTTX0A4gjiMBc+EXSayGuLKhhCRag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
	b=bxKDGTlWgylsvd/r9dULiPB7yvAfxGfLRYXyqPxGP+c/VmhKDc2D421QgPJ33qn9W7ve
	 3PJjQsv06cCsfE5o1kW6FFVzs0eeqGmNwvfYg/7/NiJGpJV9g4uBTjSLkITzNlM5RiuHF
	 +HciICZxOKyGTxJn2xsuy/O8cQfQfu8sgSkeHsJqSIUXiL3DPo1a+OAJCYOpSs8DZT2El
	 tyMv8+bP7F2nXu+MYc/V7iRpD1Oe4VBHBBkHsQtD85Slbe8bCR0qbjOq05n9+jfvfYvk0
	 5+ddNpJJkF6lk3HeusGIVaJ+1+hkGjmOxHq5QYdNM51rTyxHn8droDDZUi/wH3IzUFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBjDeZwg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB61606D169
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 19:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB61606D169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBjDeZwg
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so506064a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 11:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793820731; cv=none;
        d=google.com; s=arc-20260327;
        b=gTaVLXP+RElKkAjnmysf1UlsP8yXCaPDs83nSF6j2a0z8HlaJ9p4O64P0gR4QlK9io
         xYVSKJkEotqPKjBc/PwBjLXysMtc0Me3mM5YIuF1TpRn/INYPQg89Uhp8UXH7ieALV7X
         J9yjGYXDbw8FL2NPXxVfUTWA38Ajcwi0+Qb4FZ4NI6lUmxHEJIimmxqGHApXdOXFdIwB
         xeXhMVe0i8PIE6kdFY1isYf4WI+WHHxLtI/Oftwrue7VAwlWNFDbvVJ0UswAyUiQ57XW
         dULT8DSW0dDrZL96iFlYKyYZhcW2ANAM/pVzkI7deC8i+4aNKYCE6oFWZqcnsACocE4a
         fLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
        fh=hg4r8Wj05mF4dXiFdFs+/eYl86EOdWs4AKGQpTl4/tk=;
        b=qFa3aJR+BOWW7jWKrm8BeUAGKNJCvRbFDVEvCLwkB0+Os2J6yQUkZCI9bawVgLRNE/
         dMXH4lypQnG/Pt1MfbhmbaErbuE2e/r6E4yh+Ucru72mN9q0v0aoDybXqiBcHuMhvGZG
         r5MOCCbmhtdhiLXpNmeG6lXUzMBfmvO1jwKPlHNSE3kQx41j/QcKRY0zpL/dAPbgNvs8
         xRJzYGAsze37LAq3zg8U0seVOrux6leBrDeTGVV50DKdD3urRKW04whZbEkx9EkoiyDG
         Q58DzTZdhfsN+IssQ1S+q8q50VyDKkFfHxt5yRTj4wMeSubOfhq/PYP7mqzRuRhYarCf
         U48g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820731; x=1794425531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
        b=lBjDeZwga7mGWRX50cxyouzQX9R/oabQ4gMEvGHsC/zGTM7cH8KABlfArCyy6+MG+H
         HWj/y0q40Oc8kfYFQEBovfOpgUcSTIpczlit+411W6H0lo7MeoN5z4X4QUpqL4Vwae3r
         wfcpSB7xrmBoxAAflkij3BX5LfqwJXG1ybLECSHUXLqXXhED7SgDMTnrCr0DSByp4OGU
         IIsxiQNogY1X/Yu3Y2dvI7ECHGp1VmIRAeqCybKWIjMyHcMyZIbVDuvgmR/hpxLiKP4T
         SZvX1fv7OKMWVqlNBn0TyunwvdbedsO58kp+18kIrr0xLoXsjeUzCV+LhctYZHEcTz32
         Jz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820731; x=1794425531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
        b=yB8QfQK0d1ZkXzuojcX+aZytObrisz0hd81wjm5FvYirQj4P0PnAkiGnQO3JkEBrVA
         H2is++Y7sSdDuALrmv+g/lK7AxoeokMKVi0U3wKU69tkv8omrT03xRP9kQrptz4yXbDc
         q1Zt7n7cHpIIBn8ech8tPGHEngA8j46yMwDJ77J4abVdG40vOEV3wMvGtqNrN3u965/7
         eosL1f0Si7u/xI3xBXmKwgreidPifvOrhPlbaA/+xM3plkFmjDZs165WExNul7FSss30
         TW4QlCBwmcu8ZtWhtex+VFKBr1xPLe+l2dIvV5ZQ+FVmpLBbMQQ9v6XH9c265C3QZGqI
         nrBw==
X-Forwarded-Encrypted: i=1; AKwUvBztohU+qeSOh53YnY1glHyNUo0VghywicSDEvJGOTP0zWxBIfhbWpilsh8vAJX40ILoCpTPF+gQCuIN9Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DuAfKQFRdckgUYSbjmg1EK+joff+oYPtn0Vxd5WUNYNmSOCxl
	m3fOpEPUB/n2+94L3BHH5HYZZ9iLXyZiIc19/4DaiT8mcupu5bmfz2NwWnah97ZUyUUIh4xkbug
	1FYrGCfCqbH/qFZxVCkYFAdzYFO5bXMU=
X-Gm-Gg: AYBFou1L3Cj8hSqcV9uai762Jaf95tNmgCQQtKkLVouL24iRRDrxBHC/6OFV2cZhet5
	cvA5NbPvTfUtBO9wN2EWh93c7SRVdh09JP1/0PGl8aAJu7/1Yc0J34t21HlCGqXLFqQSAFI9cc8
	+tnkkF6FwtHCG7xc6PZPfJ5kG027RmgAGucWIrwnAU0bDMStAarIEfD7cWwVsWArGkTMxVG1TgS
	yNS58fTo4QsN2rS7AJkj2nQPZ4R+IwNHjNtRi7IaHkKOt7Wrh17dkMouEY1ofzplhDYeae2A0ig
	eLb7xfa8Lfw4Rf59XYwmgHkC1v2b4h8x3hUjTZiuYKtNQBLykDCdPOW1SJMY7rwLoUHPymMIb9i
	DgbQ6ocPxmpjsYOxWRvPgcGvB7794gSJ6Q0RIdTJGHcY4Fqczq/0U
X-Received: by 2002:a05:6300:6301:b0:3eb:3b69:77d2 with SMTP id
 adf61e73a8af0-3eb3b699956mr8004490637.37.1793820730833; Wed, 04 Nov 2026
 11:32:10 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101223125.302001-1-pmazzini@gmail.com> <20261101223125.302001-7-pmazzini@gmail.com>
 <20261104192845.41b086ea@kemnade.info>
In-Reply-To: <20261104192845.41b086ea@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 4 Nov 2026 19:31:44 +0000
X-Gm-Features: AclHuK_sPS6tNsygd2RlmqWR3IgNt41nRWT_eWvnGH5AVKDifX_oDkfFeu2npZs
Message-ID: <CAAxh=jtn2W91m9RUQqN-o=FEr+F9H2gdTKgE5UQ+MQX9w_QDWg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] regulator: sy7636a: bind to the I2C device directly
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Nov 2026 19:28:45 +0100, Andreas Kemnade wrote:
> we need that regulator enabled for i2c access, if Patch 5 is merged befor=
e
> this it will happily try to access the device without it being accessible=
.

Right, I will move this patch before the hwmon read change in v3.

Pablo

On Wed, Nov 4, 2026 at 6:29=E2=80=AFPM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
>
> On Sun,  1 Nov 2026 22:31:24 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> [...]
> > -     ret =3D devm_regulator_get_enable_optional(&pdev->dev, "vin");
> > +     ret =3D devm_regulator_get_enable_optional(dev, "vin");
> >       if (ret)
> > -             return dev_err_probe(&pdev->dev, ret,
> > +             return dev_err_probe(dev, ret,
> >                                    "failed to get vin regulator\n");
> >
> we need that regulator enabled for i2c access, if Patch 5 is merged befor=
e
> this it will happily try to access the device without it being accessible=
.
>
> But it then is just another error code than ENODATA.
>
> So if that is considered harmful,  probably this patch needs to be reorde=
red.
>
> [...]
> > --- a/include/linux/mfd/sy7636a.h
> > +++ /dev/null
>
> but if it goes in first, this part will make trouble.
>
> Regards,
> Andreas
>
> > @@ -1,34 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * Functions to access SY3686A power management chip.
> > - *
> > - * Copyright (C) 2021 reMarkable AS - http://www.remarkable.com/
> > - */
> > -
> > -#ifndef __MFD_SY7636A_H
> > -#define __MFD_SY7636A_H
> > -
> > -#define SY7636A_REG_OPERATION_MODE_CRL               0x00
> > -/* It is set if a gpio is used to control the regulator */
> > -#define SY7636A_OPERATION_MODE_CRL_VCOMCTL   BIT(6)
> > -#define SY7636A_OPERATION_MODE_CRL_ONOFF     BIT(7)
> > -#define SY7636A_REG_VCOM_ADJUST_CTRL_L               0x01
> > -#define SY7636A_REG_VCOM_ADJUST_CTRL_H               0x02
> > -#define SY7636A_REG_VCOM_ADJUST_CTRL_MASK    0x01ff
> > -#define SY7636A_REG_VLDO_VOLTAGE_ADJULST_CTRL        0x03
> > -#define SY7636A_REG_POWER_ON_DELAY_TIME              0x06
> > -#define SY7636A_REG_FAULT_FLAG                       0x07
> > -#define SY7636A_FAULT_FLAG_PG                        BIT(0)
> > -#define SY7636A_REG_TERMISTOR_READOUT                0x08
> > -
> > -#define SY7636A_REG_MAX                              0x08
> > -
> > -#define VCOM_ADJUST_CTRL_MASK        0x1ff
> > -// Used to shift the high byte
> > -#define VCOM_ADJUST_CTRL_SHIFT       8
> > -// Used to scale from VCOM_ADJUST_CTRL to mv
> > -#define VCOM_ADJUST_CTRL_SCAL        10000
> > -
> > -#define FAULT_FLAG_SHIFT     1
> > -
> > -#endif /* __LINUX_MFD_SY7636A_H */
>
