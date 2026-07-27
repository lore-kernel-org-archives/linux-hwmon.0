Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED66D3F6C30
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175755; cv=pass; b=IPA5xxGFoAQcULDZI3JrmhOqzzqzZwe6KRaTJ2YUjaK20e44k14lGzrzUMDjYMlIuYlX9w1N64zYVVX94SeHhl8r0wWYkaSjv4Ri7JTnGAMxoC6SwQv2UbO3C8HY1HXlhbXKfL/Bn8yN+EuwDk5E4vxz+tH5qzTWuLe1Gu2utQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175755; c=relaxed/simple;
	bh=t5fZcw/jjaYDA0tgytVhmZIkJqKe6LkqZRiKGv2M3U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSUkcLKwbByCN99oE+Vw+taQnxqi2wEazonMehISrqiGmF0u5miLDfHyOPZ1mY8nP+YfAC6h2ZgHPc9aPdX2f2nIIazIvYJ7EoieWcGQxegiHxjM85QVYRtSLYj1rnybD+uKxBSYGD42R9CaSXIA8fTIR1qe/3hMPU3LAy0ICl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/ET49xk; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/ET49xk"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69fe3cd5ee6so2742185a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 11:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785175752; cv=none;
        d=google.com; s=arc-20260327;
        b=hE4eTMVMaS3XbQZvPdTotz3dev0cGOEEAT4ZafV+rRJH5bNCp3Sn8zW4c4W2vsP3aV
         RszJu58xAxedPpvQQn9AsIKSKakNjjyYupWyj5qZr5z/gVqMGLmyHxuCcVQ0+iEsfYei
         RY/WRJobuZivmgTa9vVm3MX2k0qGLeEgfS+XghJWhncfjwhQez/jr6CM8/vPptSZg874
         fxqx0DQurs26xrzdTxKvBWP+n98o/or2oThUuxJvb/P+/Yl/Hi3PRVsvzJo9HRgOSkO8
         1+Lo8MfCaLXp4fiGUbvDq3jFktoIPH36fRQXtOppadPm71NXMF/M1lBBNEprJap5Mb1w
         8qQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t5fZcw/jjaYDA0tgytVhmZIkJqKe6LkqZRiKGv2M3U4=;
        fh=hFBBqdDiN4AjFDUroqmGEdBmf7N1QUlN65m0szp3IC4=;
        b=JwdQffcow1Swnx8IyLOYKietshVCaFRI2iQefJ4D7ylyBrtFnvF2q0mUGOPpO6O3/3
         yuWUYaHeSi21gBRdt7LUmz3wsgOZy4ldWPI/p70CGfIjRe6urPbBcsDzWJwkN5Q7Z38N
         Uk7fybrx+AuCKAKyrKoXvqOMVtUctH2yadYupYtBDlkBVn1LEqx6KIAey7eIHOerOgk3
         JTCnSi/z3QRzgi95b1imX+ltz/qWBk5mZpOIr+G9fbmGBwuqFdCL4GOTEqqIGRFu9ogq
         zZ9OfT3ghBLjzuhbREc1MWwKk30H7Nbo3ZeqF0yFLe/o3EnevHC0ZBwew6bA34zI6YvF
         ak3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785175752; x=1785780552; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5fZcw/jjaYDA0tgytVhmZIkJqKe6LkqZRiKGv2M3U4=;
        b=l/ET49xkmBBljRPplwXaDmPEFZexJ0nLZKBfqig2sUGEzJl+wnmi1+o4oFVxP3s+sz
         e6R3qQ60/jvc5ymtA7odm4Q8t8mmtoLwbCuCeALKEJ3fAPsKA7oT2SIoL5XAeafoqffl
         CTw8i/hVRBnd8/AKfsjFLxLNMlWAFUrjmm4tEaxVNKahQ/Di1RuvepKrskCUJWWmQGrh
         AODh/hWBBUQBXxaXweHbQpxb/Evvjxm4JsQxpx86sg+/wyZHc1d4NQZ1eWwTfRgoNd2B
         ZZ45m9atnwhJsDsQHOxF9rKv9kkrifcNfZ7CwdP/1p7ua211+I0LCc1yhdSp8qwN/Uee
         mXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785175752; x=1785780552;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t5fZcw/jjaYDA0tgytVhmZIkJqKe6LkqZRiKGv2M3U4=;
        b=YG+qQj0I3SZRw8ujOv/TB8bJ9NY1QCU/lRiPatB8fuKnXUAXLlrz8OPo/GX/tLcrOl
         vZ7Yx/PqTkKiDdelvazX6dWKXcBNtYuicWkGNig7y93XwTblFk59gTUXWNgUon6dpo9b
         MvTWVTtnXNBdgEOJ0sK9ti2f1cOd7igwdO/nU2a2BiKsp+LP5+8auudMgiXB8qt3IqUM
         IFVwN5bVGA9zQI6fs5J1qAS/TTKiEiE4TfWJFho+Zg4ZmeGoGwWKpwxPw+y//sR4ZHJ/
         g4FQ75HAgVze3F7d/81vBa+UJyj9XnFmXDLPERdrgrHzkR3C86G/TQr+HLLoJZy20Mi2
         pWqg==
X-Forwarded-Encrypted: i=1; AHgh+RrgwIKyXT3qcwxEk2c1ZKI6z9mnOGK9jSOas1uHDfaFwS9Qv4ovxPum/Bia8YcP8vf/tvc9llJyQ0//xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNLTFoTdxAcn5nMcurc0lTHZXPxYEEy4j2UugDB6SvwVVSmAH3
	93gUT8KRT/s9qCo7SkHwhAeZGz1I1fUQ7mBOK0KZ4PBcPbMoOIHANjb1RyrH6XIzuQ/j5lkrl02
	1jqv6quFIh+KVfIe1TwQ59k648utN5zfDSeqioZE=
X-Gm-Gg: AR+sD13tmg9Qbtxw+ZrXow6YjB3ZNPTOiT1dRl9/DFDmL3yzipucqkBzq2Y9N71PbtG
	OOYtreqxMw3sOCAKtbk+qKZqE479X0Wtgymdmy8clb/S6JUoYaaGOmwENmEGLjxx6Zepk1nB+0j
	LD7wI9FhznoMTxFUUmH9sMpx0JB+eTmCQnuZ2QCbh/YwAzA1IBDSE+FIRKXBnkdwn0fUEYQRGAL
	GHn/evsyTvx8AA0Uej76I/pV7DXBHQOlQjb5QLAm39g3YrPqnme/eAGkHmQ8xzMsRNiJBt140gL
	u4vihEMOEgJ2GKrKbXBVai3N9xr8jc398rf+yhD9
X-Received: by 2002:a17:907:9622:b0:c17:40e5:3d7f with SMTP id
 a640c23a62f3a-c1f1f4237dbmr429267866b.56.1785175752092; Mon, 27 Jul 2026
 11:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-4-21424d550c3d@gmail.com> <74eadbaa-0020-4628-bf82-29fca725fcb2@roeck-us.net>
In-Reply-To: <74eadbaa-0020-4628-bf82-29fca725fcb2@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 15:09:00 -0300
X-Gm-Features: AUfX_my-AsGs-tV9YHNgcOBx3F7sRvGrlzHty1vtBRfz7fM3MEC8daead9kFdR4
Message-ID: <CAJq09z5Etg_1LvEyN10ZmZMPJ602SDG3apdK+j8mDm1A8CoR=g@mail.gmail.com>
Subject: Re: [hwmon PATCH v3 4/6] hwmon: (adt7470) Fix swapped PWM3 and PWM4
 auto mode masks
To: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	"Mark M. Hoffman" <mhoffman@lightlink.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> On 7/26/26 20:34, Luiz Angelo Daros de Luca wrote:
> > The ADT7470_PWM3_AUTO_MASK and ADT7470_PWM4_AUTO_MASK macros are
> > currently defined with swapped bit values.
> >
> > According to Table 22 of the ADT7470 datasheet, the Fan Control Mode
> > Configuration for register 0x69 follows the exact same bit position
> > layout as register 0x68:
> > - 0x68 Bit[7] corresponds to BHVR1 (PWM1) -> 0x80
> > - 0x68 Bit[6] corresponds to BHVR2 (PWM2) -> 0x40
> > - 0x69 Bit[7] corresponds to BHVR3 (PWM3) -> 0x80
> > - 0x69 Bit[6] corresponds to BHVR4 (PWM4) -> 0x40
> >
> > Consequently, PWM3 should use mask 0x80 and PWM4 should use 0x40.
> >
> > This typo did not cause any functional bugs because these specific
> > macros are never referenced in the driver code. Instead, the driver
> > correctly applies the configuration by relying on the modulo parity of
> > the channel index (e.g., `channel % 2`) to selectively apply either
> > ADT7470_PWM1_AUTO_MASK (0x80) or ADT7470_PWM2_AUTO_MASK (0x40).
> > Since the bit layout is identical between the two configuration
> > registers, the hardware is currently configured correctly.
> >
> > Fix the macro definitions to reflect the datasheet accurately and
> > prevent future bugs or confusion during code review and refactoring.
> > As this is a purely cosmetic fix with no functional impact, a backport
> > to stable kernels is not necessary.

If you build with W=2, you indeed get tons of unused macros...

Initially, I intended to just drop them. However, just like the
incorrect macro led Sashiko (and other bots) to assume the masks were
swapped, keeping them correctly defined serves as useful context
directly in the code. If we drop them entirely, anyone (or any AI
agent/tool analyzing the driver) would need to fetch and parse the
datasheet to verify the register layout. While the datasheet is the
ultimate source of truth, reading PDF tables costs more than reading
well-defined driver constants, to the point that agents might simply
skip it.

We could certainly drop the unused macros and add a comment explaining
the layout, or even rename them to better reflect their shared usage
across channels (e.g., ADT7470_PWM_ODD_AUTO_MASK and
ADT7470_PWM_EVEN_AUTO_MASK). That said, simply fixing the unused
definition feels like the cleanest and least verbose option. What do
you think?

> If the masks are unused, how about just dropping the definitions instead
> (including the unused ADT7470_REG_PWM12_CFG and ADT7470_REG_PWM34_CFG) ?
> That could be done as first patch of the series.

I'm almost afraid of touching anything else here! Fixing bugs in this
driver feels like fighting a hydra: every time you address one, the
Sashiko bot sprouts two more. :-) I already have seven.

Regards,

Luiz
