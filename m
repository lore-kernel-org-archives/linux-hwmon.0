Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE1D37A496
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454011; cv=pass; b=esqdbasUmQSwf3GuLfA2kKWNua0UhSbMxhsO4hB2jJhFiKR/X6Xf5kOWotXSw89w55Zm8FwBZIK3Zp1Uhj9871IiPXi5VO3rH+wpoOnbYfLIpS36I54bmJlXyuc18wndmnM26FKR/Z5ri1o2tS0JMVz+p1wC1LElO93XLWVK5fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454011; c=relaxed/simple;
	bh=BZEOoUQ0Lo8ipUdfeprRBNlw3oHG9gKfH8cF4qSYIoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piIvDK77wWcmvAVQzTUqwkRna8vlEKw/SAYKtPl9hES/EbtswbfZWMu/F+T1T+9bEwdlWjWYzeCsRkO2VIgvrOEUd/Ct0K8lQMb5nzOrjEKsGl0HApyB51l9oMrl9xypPI6tJ6h7QcszbtfVlW2GTHstbDlmvqcogcyUlc24vZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INEVnWV0; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INEVnWV0"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a49a40209dso3496081fa.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 23:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789454007; cv=none;
        d=google.com; s=arc-20260327;
        b=WW12bKpq6Iz4fiLrIm0SFqz1tibQ+tvCqn4JMN1KxDOxR2SkFD9c9SBJczHBpGOwDO
         Da3+Mp1ST2LDnfn23I23PF/F3Sa/lnbpynK6f9rwCvQl18fMKnCw6PoqVaS1awKqJpZK
         r86h+HLdjP4ZYty56BHTrVN1mcnqAunhE3WfJyxeRWD/LXJClixMHzw0h/jIPI3yErHQ
         PRQ9w4W76Z70Ww1Ge25cH+UrAtMpvCn6R/xKT9x1MoZlp/N4XtxkZ8rSxnQqwM21I3Gs
         G3z2LNzyyxAaRKlGH09Q1xiZFdIJSOretAN4vcjMQbqMu0UHwARWyy4MPY5aA6IFjQmx
         YgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=casfK5KttDr72ePpP2HDg9NJjIeM9xhCgNcIOIAZHLU=;
        fh=DC8aF5w2Px4qgRzzbBU5tNt8GbVp9MIm22CeI6InVtI=;
        b=UJYFb9G9dpX/TF+qp49mRDDyHpDI2UjEBkGMzILKW1QKp/V6txu1+mDh+YJnD3o2Ux
         oEKKDTRr+NAFZo/Cq6y+XAiBYRYnQXhZ9tBJghYZIipnZ4YbxFhS+hssoyEP6CUHpixH
         eZkAT+x+ivJgFeaqJn8WA2rVar/Y/OkD3FGVQTQCL/BZ4DNXZHqtVBFDpkRFthU5TlF9
         BkpjIT+1ZfEkKB0msE3jBlv8YHqPi4pDLfanoZFs4+evcRm/MgQBCiuva++F36uUHyYP
         nYWr3HzYlHRzp+IaBXB2SfdeXVBTXzq+gSabbfud2X9K8sQqXwRg/UbpXWUyW/Hx2R6T
         5RCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789454007; x=1790058807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=casfK5KttDr72ePpP2HDg9NJjIeM9xhCgNcIOIAZHLU=;
        b=INEVnWV0PvdxQlTaTjwdP2xGWFazm551SmIDA4IRh85WL5aZbeQlkRtOKglJ3dyrvK
         KQRhFMyiY+YdHC5utMdDi7ZBnkbWN6l+2vPokNj3Ez3MDpdytuJNWFwtOtcFUrRP9gUJ
         EfFypWsrQQ0Lg7N/t4WhBgaG0USpxscw6GPLulrOe8tY47AMqxGtZifJcXjrgh7BFCIG
         lNI3z3ziRAj1x0To9LypcIzK2oOuvh03gVaEe1NRvunPRPSGAUbeV4n499A8JWgcoUV2
         Uneq5jl+hr4jwnfseQpTCB8t24Y+5lGEZGwF+a67vOiXtlfmx4zXNHg+WIoU8UhkEYCa
         6c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454007; x=1790058807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=casfK5KttDr72ePpP2HDg9NJjIeM9xhCgNcIOIAZHLU=;
        b=qzmEAtxKrnEGTzpnUUaMA3kUPfcLSWIIOCEpzFWJiXfA0OHWppbO/RzLNxuf+b3OpM
         pzPJLOz55p9cFwYUvEfMvvmM+Tmyact2own/9/B0kqCl4yuo9CFaSws/MaMEEjFYepIX
         fq6lyS/J3DfSQvVXfL2mN9BKLhJOuzLXS59xNP38WhERZxxbDsJUlOkQbXejdXyC8xxL
         g8MklWgPm8mjTWZXlEmhxk4zML7Zw1RbZJRNg+DG81N8D5ZxUAZvXQX5WeNBM5+FJqNs
         F8C86npvWS/Zs2fXVFv5y1bx6TOETB1NphOMbkmUNmK/NMjmFNQJGtJrFIR7lg906buh
         3EFg==
X-Forwarded-Encrypted: i=1; AKwUvBxHl4Ll8CzmG/0M2eToqcI8+86+V4qq95NMHL1OpNgvC+W3VknQkzSttasYfgsOYdhfRXXoPN8HY14vYg==@vger.kernel.org
X-Gm-Message-State: AFuF++m5ojUd6Fu8ku3IuVW0QrNXjoE4tDTGnEpZUwXe2tawJEPX2gdx
	SP5QUpGkWsXdPsXXtW/6UiihSvuhbu44j1jmidzq/g+7rym1YCo6+opNERh4tpzr4cbi5bQAM74
	FnAO26B1sR3i94wfhCu2WtTFM+kKfS4Q=
X-Gm-Gg: AYBFou1Ss8U2hcZK7pspLpzJcLUlFuyypZPFXzu2kCP7YD557TMhIZAXYuOq0kHWpz+
	YzT7Cb6djJen2Jzsjbtn6MMhx2w5ILURmkAsGR5c98K57sAkz6ny+Vc2+EV5XfVxccd99ZKWE+c
	jLTmslelwRIXkcJrXdO1XPY1XYQYk7+VFHwEN4ScgYZ/LHuTETya6jI7OJ+TmTVf5z09XRrDQ6M
	QwA07FcklWaAdxCEtnRo4YarKoaas/tlt30UaVL6AJSkcUVkgjoirkUMshFA7dAq5uzzSWAawFq
	oihRD9GSPwUtzwxTPPtsd6s5b5RNCbo79eg2FTaEG3hQ7Z0OYtv7MZyvHhf0Juyga3Fx95qOXeL
	F5kOxcXcq+GRW
X-Received: by 2002:a2e:bc8b:0:b0:3a3:29d8:8b00 with SMTP id
 38308e7fff4ca-3a5d19a7c11mr2780671fa.10.1789454007172; Mon, 14 Sep 2026
 23:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915052021.6959-1-syhuang3@nuvoton.com> <20260915052843.397FF1F000FF@smtp.kernel.org>
In-Reply-To: <20260915052843.397FF1F000FF@smtp.kernel.org>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Tue, 15 Sep 2026 14:33:15 +0800
X-Gm-Features: AcwNN1WwzpMg6DbhyfieH-d57sUuGMCMER0oo83Syvu7n2pAq0NeQmN3AZLllEU
Message-ID: <CACW=pY5n1ku3m4QPgBkx4+r_nHr7s8GqYWUZ77DH+rgOvNq9dw@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8815=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:28=E5=AF=AB=E9=81=93=EF=BC=9A

> > +     [nct7715] =3D {
> > +             .config_reg_16bits =3D true,
> > +             .set_mask =3D 0x8060,     /* 12-bit mode, 4 samples / sec=
ond */
> > +             .clr_mask =3D 1 << 7,     /* no one-shot mode */
>
> [Severity: Medium]
> Will this leave bit 14 unchanged if it was previously set by a bootloader=
 or
> left over from a warm reboot?
>
> During driver probe, lm75_generic_probe() calls lm75_write_config() to
> initialize LM75_REG_CONF. The regmap update mask used is:
> clr_mask | set_mask | LM75_SHUTDOWN
>
> For nct7715, set_mask is 0x8060 and clr_mask is 0x0080. Bit 14 (0x4000) i=
s
> missing from both masks. Because of this, regmap_update_bits() will
> silently ignore the 0 in bit 14 of set_mask and preserve its prior value
> from the hardware configuration register.
>
> If bit 14 remains set, can the sensor operate at 8 Hz instead of the
> intended 4 Hz, leading to a mismatch between the hardware state and the
> driver state which expects and reports a 250ms interval?
>
> Should 0x4000 be included in clr_mask to ensure the hardware is properly
> initialized to 4 samples / second?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915052021.69=
59-1-syhuang3@nuvoton.com?part=3D1

I will update the patch in v4 to include bit 14 in the NCT7715 clear
mask, ensuring that the default conversion rate is initialized to 4 Hz.
