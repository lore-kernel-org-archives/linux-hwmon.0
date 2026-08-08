Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2548F36212E
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Aug 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180764; cv=pass; b=hYM4RqzfA3nyyk4hq8xy7De5pSMmx8CVeFZoNPPaHRUswVfVkSINsj3NWr/QGLCbducbmXbWKym/K4COkiDAmKtGVe870bUZ0P0rmyIzrf56R7/oJtPAwmsDcgQSIdURvekOCf5CMWdSoLxbIq6C7Pr9KUZurZzVdpSEC91lSS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180764; c=relaxed/simple;
	bh=pd8FOy1ubR62uZqYb1thHiWFnOUmjn71WGhkcVdafHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDxwUA0SnYqEavYvhltKkSfKhFn3e1lsQRcIv1vPnEzERg7vz5p7wuOHMdGYuhGJCcvLjvcVl42CgaC+K2zGapfkpYqXk32PTMi5FJMILMy2FDYpc+jSnszfj5IpsMrpATruL+ug0xgbZhn6s/RIFontkJrO245U0u+gFkUlFUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faZk2APi; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faZk2APi"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8200ca16f26so4078597b3.3
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Aug 2026 02:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786180762; cv=none;
        d=google.com; s=arc-20260327;
        b=ptn1XOQhh43UYEr7kgjoVTH6Bs0OpD+vndDHF4jAK3xVOXUJr5lvKLbqjPgHg4N8F/
         GXgv31jcpFaspQSPPfHgQRNpaI6vEpXvhtdJKwDUYmjOOhVfdfQjMepDRGHkMa/fem0+
         rmzTe2qX6lkI0nSZNe9qPdbrEig8+EraOlW9a7MYiUNzYXkn1c9ZL7HYKYailQ9uVP+c
         RwcA34XMCcYapbqPxIC03DuG4dj65bbAfZ+fgqcB8GBu8M7M93Km7kDk6WJqcmDj/Cfn
         f1w8qfCmc0pVHUA669JuMh4IT2flJs+8s22nmdOLMAFXnH2VDx0T9GgJwup5l2k+4zwC
         ArIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fg2c76AY5foyHjbEy805FD3dTMeTfW3OaOdCgYpTznU=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=Gvp1djAq+IRyI1chfWFnE/kesioFXikxinhprPQS1Qz+mDAYFWrVEex2fyjI3OttoA
         xYqvXlZyp3HGGnmhkBOyNBS1J7UOx733TW+/N643sR+Fzd6pn46pyjEBaU/n8zdePmTI
         yTCSUNA6DYQBVgmPRbeWIa3lAJKhLFB3QY35G6Bb+OYg1XB36EEVo7euyKxz2Ni1Ppw5
         hw6BODPFk/9h2vPGLzvB5LNjj1oG3cwGYKHcl/OWHd7+wIBogTQpVZ05P+zHUxhpshf/
         EtsDSXzraCxHv1FB5SYi42D5/O2gWhqjKic87l2cH85IlnWRCIVn8T1pLSXuMpuekr+9
         2Irw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180762; x=1786785562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fg2c76AY5foyHjbEy805FD3dTMeTfW3OaOdCgYpTznU=;
        b=faZk2APins/kuSM+4KTgNtoiYXNX+Vxagdk4A8el3N0WxYAyzeTvAC2yXRmv07B6+o
         PE9S2K9hugJR10WCYB5/77jO0cr9+4QPfbnShm9Jo2y5W6SgM/Umyk2EYexQVOH5zZ2D
         2ypzt7hHd7jnRTJso5GQTDsq0acz6yCPSiTw5sgW7oQlOPwEx/xgTJPcA3l+04TsA1Ui
         4bfybJKLCpcwywUKWGDgLa31JwEuwb/PmjT8wd1yWm0hCG5T84sSPX9FXZP9HzKPsOla
         DtdjvkSHe2erO/UI3Icmkk4heEMumMdFibHQ6fzWhxnG1Ea2s02YOqbGXqJ9sXF9IlDv
         aSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180762; x=1786785562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fg2c76AY5foyHjbEy805FD3dTMeTfW3OaOdCgYpTznU=;
        b=JIECzhZwFTZzEr9yY7xV8PZSg4tH25z5w87l1zj9xoyMqEqiGLUwh/Y20m+LCmEEHr
         wT4cRDRAdOqymTUVOzA6OR8rSEZFzDMwHxS3daxt+ShGkEENXR8YlQpBrUMDWltZRyrR
         E18n6epZzhhvCxPn6JhSdjkGOEnPD6KkRvJiTdTuVoN9zEDvzuT+ZfBDpbKTB9RspDHa
         6CmXunll92QfdulgZteIOMbn3AyLjm1hDtBiMfUkgSNvPTcWx7S2DtlCOIzoKAcmpWc8
         M+GPp58ESTfAhv7QOU3ZVdxphCEXAiUz/02Gio6HfHG8U+kR8HyAaOjSfirZlgAW4ulC
         3Fzw==
X-Gm-Message-State: AOJu0Yxumn8Uv1FYf60JNJqRfFjftwCdy+DYt5wPsOxr5St9llJqKo+u
	z+89REgpedXUjQJJOw8mtkND+btZxOZkax0aE1/UaTnRtJ4ro25rBsgHXzpbK3T2tm0Nd44jt93
	1+kX2cQhDNDKZ2OSinCgKGJnU9mHQk2SvpHDCei7PRQ==
X-Gm-Gg: AR+sD10mmG5AEHg6VojDVf+4nsxIB39EuFoSyCMBUpG8RQS1UOhUf5HVgl+56eDdy39
	WigKpWP0gBsTxp/Gfjryfn1VHn8a3ewWMQloAEFOHAnpNn+T3jQXAoDj0S1/criphWKNf9rIXGl
	AwfoK2dyaIZojjpBk4ouXjOJywbANmmCBphY9I7kLWvODsm6go9W3JxNh6nk4YkSj/2MXxNWRtx
	q8UPaf1IrNGH+hi3O03b7wl+PWOaBpE3C5wZStLWEsdqyH+tU9aOrFlWcBsQOAwpL/q5jSLfL3j
	Q7/F0/qpblAdt/gBlsqawY+fG3G4+B7+M3FqPAkiKLufXw==
X-Received: by 2002:a05:690c:c8c:b0:7d0:79f:339f with SMTP id
 00721157ae682-82022504c69mr183661797b3.34.1786180762177; Sat, 08 Aug 2026
 02:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808083718.2612205-1-congnt264@gmail.com> <20260808085811.ACB651F000E9@smtp.kernel.org>
In-Reply-To: <20260808085811.ACB651F000E9@smtp.kernel.org>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Sat, 8 Aug 2026 16:19:11 +0700
X-Gm-Features: AUfX_mxQrAoGr3BaW7w3K_8fDZegiZEg_B84a8nklKQleIDy4-JOpboIcOQOUUo
Message-ID: <CAJpJ=GuiQy0XtcER6=Va7VmfuGF__3BGSrjKiYRriEEUbUaEPA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (max6621) fix negative temperature offset and crit readings
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 3:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Writing the maximum allowed temperature of 128=C2=B0C to hwmon_t=
emp_crit silently wraps to -128=C2=B0C in hardware.
> - [Medium] Fractional temperature precision is discarded due to shifting =
and integer division before scaling.
> --
>
> --- Patch [1]: [PATCH] hwmon: (max6621) fix negative temperature offset a=
nd crit readings ---
> commit a073f1d4838dda93adf9b46f8e3cc16f1b662f82
> Author: Cong Nguyen <congnt264@gmail.com>
>
> hwmon: (max6621) fix negative temperature offset and crit readings
>
> This patch fixes temperature reporting for the max6621 driver. It
> addresses an issue where negative temperatures were reported as large
> positive numbers due to missing sign extension before scaling the 16-bit
> register values.
>
> Cc: stable@vger.kernel.org
>
> >       - temp_input used an s8 intermediate, which is correct for the
> >         -127..127 range but reports the documented +128 degrees C maxim=
um as
> >         -128 degrees C.
>
> [Severity: High]
> This is a pre-existing issue, but while fixing the read path for the +128
> degrees C maximum, is it possible that the write path still wraps to -128
> degrees C?
>
> When writing to hwmon_temp_crit, max6621_write() in drivers/hwmon/max6621=
.c
> clamps the input to MAX6621_TEMP_INPUT_MAX (128000) and divides by 1000L:
>
> drivers/hwmon/max6621.c:max6621_write() {
>     ...
>     case hwmon_temp_crit:
>         ...
>         /* Clamp to allowed range to prevent overflow. */
>         val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
>                 MAX6621_TEMP_INPUT_MAX);
>         val =3D val / 1000L;
>
>         return regmap_write(data->regmap, reg, val);
> }
>
> If a user writes 128000 to temp_crit, it gets clamped and divided to 128
> (0x80). For an 8-bit two's complement alert register in the MAX6621
> hardware, 0x80 is interpreted as -128 degrees C.
>
> Could this cause continuous false thermal alerts and potential unintended
> system throttling?
>
> > diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> > index e86ec6d237ca6..9becd098d840b 100644
> > --- a/drivers/hwmon/max6621.c
> > +++ b/drivers/hwmon/max6621.c
> [ ... ]
> > @@ -225,8 +224,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_=
types type, u32 attr,
> >                        * The temperature is given in two's complement a=
nd 8
> >                        * bits is used for the register conversion.
> >                        */
> > -                     temp =3D (regval >> MAX6621_REG_TEMP_SHIFT);
> > -                     *val =3D temp * 1000L;
> > +                     *val =3D (sign_extend32(regval, 15) >>
> > +                             MAX6621_REG_TEMP_SHIFT) * 1000L;
>
> [Severity: Medium]
> This is a pre-existing issue, but does this arithmetic right shift discar=
d
> the hardware's fractional temperature precision?
>
> By shifting right by MAX6621_REG_TEMP_SHIFT (6 bits) before multiplying b=
y
> 1000L, the lower 6 fractional bits are lost, dropping up to 0.984 degrees=
 C
> of precision.
>
> Would it be better to multiply by 1000L first and then shift or divide to
> expose the full fractional precision provided by the MAX6621 device?
>
> The same precision loss also happens when writing hwmon_temp_offset in
> drivers/hwmon/max6621.c:
>
> drivers/hwmon/max6621.c:max6621_temp_mc2reg() {
>     return (val / 1000L) << MAX6621_REG_TEMP_SHIFT;
> }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808083718.26=
12205-1-congnt264@gmail.com?part=3D1

Thanks for the review. Both points are pre-existing and on the
write/precision side, so I'd like to keep this patch focused on the
sign-extension read fix and handle them separately:

- temp_crit write / +128 =C2=B0C: agreed this is a pre-existing write-path
issue. max6621_write() clamps to MAX6621_TEMP_INPUT_MAX (128000), so
128 =C2=B0C lands in the (non-shifted) alert register as 0x80; if that
register is interpreted as signed, it wraps. I'll send a separate
patch to tighten the clamp once I've confirmed the alert register
width/sign against the datasheet =E2=80=94 it's orthogonal to this read-sid=
e
fix.
- Fractional precision: also pre-existing =E2=80=94 both the read (>>
MAX6621_REG_TEMP_SHIFT before scaling) and the write
(max6621_temp_mc2reg() divides by 1000 before shifting) discard the 6
fractional bits, so the driver has always reported at 1 =C2=B0C resolution.
Exposing the 1/64 =C2=B0C resolution is a behavioural change rather than a
fix, so I'd prefer to do that as a follow-up.

This patch only restores the sign of the existing values, which were
being reported as large positives for negative offsets and crit
thresholds.
