Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358E7410D24
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895148; cv=pass; b=U35I/0fNJOh9OMjkHe4BQMpHf76HdfhWS3jiTET4bOwd3tx7gF/YZIOcYBByEMTkqMoC9pOYS6sB1mGfvzMzWkSNcqyzmhO9KEVDUmrNU7hLz9e4HXj68g3LzvMpnkVSI0SN0xPVEqOQ2JBwddjKlspLVu/KqWcCVjLscc4qacg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895148; c=relaxed/simple;
	bh=gZ75HfUKu7WCuUbWy5Owlf4qjri2OKaycpeiPa4o2fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdggOGSF3erV1rGeTTTdZzudCRBjcXAh1785ewwJ1XhUNuGpHwDf+rHh1jtYo+9SwpnoXHQHJm9xWizt9GrVi1LZUV/gg1ZhUjVaZrSAqT/bTOOSt2j1ClPx2DEGs0pX6MAvLMvtzVdxd9n3QmNkdVMiuXfvvvnasNUx6oD5iKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/2J8h1+; arc=pass smtp.client-ip=209.85.160.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/2J8h1+"
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-439712b3416so4134749fac.2
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 08:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779895144; cv=none;
        d=google.com; s=arc-20240605;
        b=LUKZJ/8a9ypxODDXod283OMI4+ytQUX2mOcvnnYZkXAym3ChKVBbC4SbmFYvfNsJ1u
         9ho0bUKbBQt/7MY7vlnTYudnD8nCYKsEp+XbhgEyzMqWJCrGm/dUCkvNqTo3+EpIw0XW
         hyYFENKJdAPwCgbHCG9zY4qwRngGZyau9HT2fQ8I2xYi3o/fC+dIeX+xvlZ5zSAxobFt
         QRNre2q8zIbODVHb1+X6wjfy4g5hnD2mhYGhRL6egMsJOYQhRjEiYPFxYivJmYmqIh0M
         FkLY3JCxSst67Xnwlp4uPWpMZTseWEtuMuLdE9CrxN4nEP2FmFaydV1Ts85SSuI6ORHx
         EHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7LRvDWq8hbZrtXlL/OzmRkuzkeMA4RIOOZP+dsA10Pw=;
        fh=wWifvNn+zUMA3/um9raYOjfZOQM7jKu2rOa8G96qnm0=;
        b=L1SpLdvWvosjPc+b4Yr1vTHyjrDnamID5aQXzb+zxeWXJDmrVov+jtj8SDF6/2Gk1e
         BNl+Wvuixhc1V9HNmaIFAK6u3uqtRGXBk1N2XCFiUebXIu4dckdHEfUjd6Y7LApVuz+8
         ZrL5QZf796s/K7oRH0xgl0K2yf/8Pk0vzLqu3sZX6pANqNXv9bHkDmjepeShMLyiRk1B
         0W0kb9Ly8uNUth2Am/kVCRWAxRaZdZ5PrSowM2IXU3HgoeJyiKsDqaqXaHOtYoVDcFh5
         V4yXZsvxIamgRFUi3EpWM2yC3j0i25FBPjNWUukYUFudBqAt75HtEeSEtVhJMP6948W3
         pmeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779895144; x=1780499944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LRvDWq8hbZrtXlL/OzmRkuzkeMA4RIOOZP+dsA10Pw=;
        b=h/2J8h1+lfXTvdbi5ehs2pbPUPH6ZqbPg/biNFieIdZnOpNQmlfOh2YMHJUzNJS6Td
         67wFtWaGsclR4ogdvHZEJWx/uMKiGY99+nAwhdgB+Ha+2qKfYO6XJ+KLsePkBV8TyITh
         oNYR4a85bFReLhnAiCcj/34ae26Wb8pu2JKJKlxLJf/oeTKzbGMrB+ptX8MCMQidyQVT
         ETlSq1m9by70VOIifb/QzvAB2GPC4JYaLccMKq2oJ0d9Xs5yUMGpPi+h32Q1cF6IV2uF
         2pTnFg+HJ4oDrVqAUxFCYEZSLs/lDX877rH1aY9UIJ3C0ku8EfZ6ziSb5YIrzAUQ6/zL
         Y/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779895144; x=1780499944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7LRvDWq8hbZrtXlL/OzmRkuzkeMA4RIOOZP+dsA10Pw=;
        b=JDP4i1mp++sXHAQN3f6/gH1cpTDgffCMj2MlVqJaCC1DRWvFNiJXgd0hfYBKdQScsf
         jW7nqURGi+b81h5SzzE+wU+0GfxmewalCPEhkoBIh0XMy/GB6FbSKBKNTtG7u+XznkL1
         T1+/3aGloBUqmL1gxahV7V80CTT66KxnxVxC1YD9AioXEtl9D3yoNvmIUozP/GTsglkR
         a/Hs4unihkSc2WsVorfqqqwqKCeJevHznJVyI76XCCoguEPtb4kDNI6ezqa5wCKsuDCs
         km726aw3JhWYbhzaN5uN1hh3+Bc6ckmU2ENtpBL+nskncV7ytxI+SjjnVWljkfDwEYMb
         Gwhg==
X-Forwarded-Encrypted: i=1; AFNElJ+1eGHxiE51KMhd34ZdyvbUGG6yGk6/KDTG8cCIaRQxq4bZjtjW+MFgTF//JOMUWjDZjemEKMKQkvM63Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8XHBEhoFPtG/WNAfhYG+SKUfptsKdLNfjxOUg4zK9BsklBLmT
	20Xa0rt8Zcbpec4zmg/oimXrV38JMuwH/rj4xPuBvug3ahInqd1BtfC7TAO4UTs+GDdjJKGMoFt
	hBAScC1sEzef/OVpbBjJdqa/c5I2sxSQ=
X-Gm-Gg: Acq92OG7guU3sMxJM5vDD8Yz2loALttEAvw4weBPQns8mOmuKW2QyFK07QeaXhIRtb+
	djuWXiNZ/ZltlXiL0hdcL30rM7miYH/P0BNHa4xIjTykFZxYs/0JP3aezUy9D5bxq9GzPQq11AP
	IEaF1o5NlyaCZhVGyNTOW1k44BEuhdXWQx4wLkjhhleGeI12sq8KCcqKJxrtOn7R0Uh9XgehVFw
	aoISxB2laP8Q5amR1pl3d/kaF3Of6esop+x0H7hwTF7xhxh9Q2nOs5FNMYF/d307VaVbogg2fcI
	cTzBzULy+w==
X-Received: by 2002:a05:6820:178a:b0:67c:1e60:3e90 with SMTP id
 006d021491bc7-69d7ead7d36mr12221633eaf.6.1779895144228; Wed, 27 May 2026
 08:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527115311.13398-1-zhanwei919@gmail.com> <ahb3VMRCQpofblbW@black.igk.intel.com>
In-Reply-To: <ahb3VMRCQpofblbW@black.igk.intel.com>
From: =?UTF-8?B?5Y2gd2Vp?= <zhanwei919@gmail.com>
Date: Wed, 27 May 2026 23:18:52 +0800
X-Gm-Features: AVHnY4IiIrYCVLBF4XWxDARC7wP_O5GrLj1re-8BUianaKxWN4OIP872Vp02R4Y
Message-ID: <CA+qUFcnP-XEPHJD-+djRydD92-bAz5bxxVaRHGJ3nrpwtq4m7w@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/xe/hwmon: report a single fan for DG2 instead of two
To: Raag Jadav <raag.jadav@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the detailed explanation -- that make sense

I can think of two paths forward:

1) Have fan_input_read() return -ENODATA if one channel has started
 reporting pulses but another remains silent for, say, 30 seconds.
 This way the phantom entry still appears in sysfs but userspace
 tools like `sensors` can handle the "no data" case gracefully
 instead of showing a misleading 0 RPM.

2) Drop the code change entirely and instead add a short note in
 Documentation/gpu/xe/xe_hwmon.rst explaining that on DG2 boards
 where the OEM routes multiple physical fans through a shared tach
 line, fan{2,3}_input may read 0, so future contributors don't end
 up re-attempting the same v1 patch I just sent.


What do you think?


Raag Jadav <raag.jadav@intel.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=8827=E6=97=
=A5=E5=91=A8=E4=B8=89 21:53=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, May 27, 2026 at 07:53:11PM +0800, Zhan Wei wrote:
> > xe_hwmon_pcode_read_fan_control() currently hardcodes *uval =3D 2 when
> > queried with FSC_READ_NUM_FANS on DG2. This causes fan2_input to be
> > exposed via sysfs, but on the tested Arc A750 LE (DG2 G10, PCI ID
> > 0x56a1) fan2_input reads 0 RPM permanently while fan1_input correctly
> > reports ~800 RPM with both physical fan physically spinning.
> >
> > The RPM is calculated delta-based from a tach pulse counter:
> >
> >     rotations =3D (reg_val - fi->reg_val_prev) / 2;
> >
> > so a constant-zero RPM means the register at offset 0x138170
> > (BMG_FAN_2_SPEED) simply does not accumulate pulses on DG2 silicon.
> > The i915 driver does not expose fan2 on DG2 at all -- it only maps
> > PCU_PWM_FAN_SPEED (0x138140, identical to BMG_FAN_1_SPEED), consistent
> > with the observation that only one fan tach register is wired on DG2.
>
> i915 is for legacy cards (like DG1) which only has a single channel
> in hardware. I just happen to extend the support to DG2 for the folks
> that might be using it.
>
> > Report a single fan for DG2 to keep the phantom fan2_input out of
> > sysfs.  Battlemage paths are unchanged.
> >
> > Tested on Arc A750 LE (DG2 G10): with this patch applied, fan2_input
> > no longer appears in /sys/class/hwmon/hwmonX/ and `sensors xe-pci-0300`
> > shows fan1 only.
> >
> > Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
> > Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
> > ---
> > Open questions for reviewers: this is verified only on DG2 G10. Owners
> > of G11 (e.g. ASRock Challenger A750) and G12 (e.g. Sparkle Titan A750
> > with three physical fans) -- does fan2_input or fan3_input ever read
> > non-zero in your setup? If so, the right fix is a per-subplatform
> > table rather than a flat 1.
>
> There's no straight answer here :)
>
> root@DUT2147DG2FRD:/home/gta# cat /sys/class/drm/card0/device/device
> 0x56a1
>
> root@DUT2147DG2FRD:/home/gta# sensors xe-pci-0300
> xe-pci-0300
> Adapter: PCI adapter
> pkg:         758.00 mV
> fan1:         636 RPM
> fan2:         652 RPM
> pkg:          +47.0=C2=B0C
> vram:         +50.0=C2=B0C
> pkg:              N/A  (max =3D 190.00 W)
> pkg:          14.37 kJ
>
>
> The way this works is upto the OEMs how they design their cards. Some reu=
se
> a single channel for multiple physical fans while some use 1:1 mapped mul=
tiple
> channels for each fan.
>
> This is unfortunately not possible to figure out from the driver without
> FSC_READ_NUM_FANS command (which has been found to be not working on some
> cards and hence the hardcoded value).
>
> Raag
>
> >  drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmo=
n.c
> > index de3f2aeffc3f..2a60a76b1971 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -860,9 +860,15 @@ static int xe_hwmon_pcode_read_fan_control(const s=
truct xe_hwmon *hwmon, u32 sub
> >  {
> >       struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon->xe);
> >
> > -     /* Platforms that don't return correct value */
> > +     /*
> > +      * The PCODE FAN_SPEED_CONTROL subcommands return an error on DG2=
, so we
> > +      * answer the FSC_READ_NUM_FANS query here. DG2 only wires a sing=
le fan
> > +      * tachometer register (BMG_FAN_1_SPEED =3D=3D 0x138140, shared w=
ith i915's
> > +      * PCU_PWM_FAN_SPEED); BMG_FAN_2/3_SPEED read 0 on DG2 silicon. R=
eporting
> > +      * one fan keeps a phantom fan2_input that always reads 0 out of =
sysfs.
> > +      */
> >       if (hwmon->xe->info.platform =3D=3D XE_DG2 && subcmd =3D=3D FSC_R=
EAD_NUM_FANS) {
> > -             *uval =3D 2;
> > +             *uval =3D 1;
> >               return 0;
> >       }
> >
> > --
> > 2.43.0
> >
