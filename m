Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884889;
	b=CoQw1gDzJhue4QH2rTtZypm0Z7acmbaplTzQk/+GSlSrtMxVo+R/YiELmvlgPCNvAU9h
	 X1fKonxINd/DwLXTvO98WqAwXBRwDrjd/SoFLvrzmZaSHlD5eQWHUNE7a9eP1ws+tPzqp
	 MU5ZgO4WMH1uqXxJEJ0zJaWUSJ795R8K6zl62Ej1baHJlIoOBjay2BA3w2KF9+ccb5k18
	 w05rxRFttEGlLLdowPzyoOiVFa9V3Mjxj8hJN85WrdWSpPYiUu9mhxhtN9y0N1N3YTGe4
	 TH+T6D+reLxvcWa+gRGAq6gM3ALTTT2oioEtJxEcKDaojMcCI8i4Mrgghk4MYtIfriw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884889;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qKvpSKm/cNQvRO+/DOvcdk5guVjwefmtFt4j8GQFvJs=;
	b=DtVr9ZrGZWkriUYFm5/OcvKDCEOiFHREJbAJ1+VnWoZos1RIYvNzdsvHgSMt3xCEV3zX
	 778NCjdnh6Ye90UqMcE+sTnf/zfhiKBwK80ZRieremovWP9nyOw3MkxrkSHuQTH2cXqP7
	 jp5RzqISV4bJ2qoAiD8zNw4u3YLiTDB5AJPkZ+5d2BKbz+UVOhwJ5ol5AXuGZoXgodcoO
	 S394sZfBtbqBCuMZqr5bIwNH5FIrKqQo7WQI17yJwz79ADfPbA1WRhsHgaD7WgOjqJIR6
	 qJbU9nBbnPquIE/3WdM7wrQcKZyycwF8Np3tQbGk5aaoUX+NrnLrQ4qQy8xCBYQ8Png==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jXvpH46c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF9606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jXvpH46c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900741F000C4;
	Tue, 17 Nov 2026 03:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884889;
	bh=qKvpSKm/cNQvRO+/DOvcdk5guVjwefmtFt4j8GQFvJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jXvpH46cqBQTpaqlLHTK7HSDumfgsZ944IwJENEl1TxmR9G3xNjbzdm5lj3af3Kki
	 Dlp56lzDHlMHgVhWDLc6O2/ctFZETC+q/HwcPDAhkdUEFQmDQRqUS/YfMo2rCuqB7C
	 Gf8f2SowU3pK3LBKNELbduZTYgctB/YZ+bdCa3/Kbyhrt4sd7zcRgnEN2aYMDHUdTb
	 rrjRrw3D8U44f9sU6KTF7FJTZUK5HzCfe3zcjzAlLVsYjBuXNbHkYGik85u4Fed2S0
	 JKeZhkoOtv/j9uiZE9xazSIDVcdYD/8VoAbJCWRmMxwk3FAMeozQrjaUqq9cotAdoa
	 bZN/kh7RXcV1w==
Message-ID: <sashiko-outbox-218125@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] alpha: marvel: refresh environmental readings
 through the console
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116-marvel-env-v2-3-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-3-ef614eb2e7f1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:08:09 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] alpha: marvel: undeclared srmcons_callback_lock when
  CONFIG_TTY=3Dn
--

commit ce2f678797ff92f9dca251780105ce8fac08a93f
Author: Matt Turner <mattst88@gmail.com>

alpha: marvel: refresh environmental readings through the console

This commit adds the CCB_CFGTREE SRM console callback and
marvel_cfgtree_partial_update() to refresh GCT environmental sensor
readings on the boot CPU while holding srmcons_callback_lock.

> diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_mar=
vel.c
> index 92e3312e786ed..7525f3ed6b626 100644
> --- a/arch/alpha/kernel/core_marvel.c
> +++ b/arch/alpha/kernel/core_marvel.c
[ ... ]
> @@ -1094,3 +1097,45 @@ marvel_agp_info(void)
> =20
>  	return agp;
>  }
> +
> +/*
> + * The console refreshes the environmental packets of a GCT node through
> + * config tree callback function 0x1f, returning -26 while it is busy. T=
he
> + * callback runs for up to 300 ms with interrupts disabled. Hold the con=
sole
> + * callback lock: a concurrent callback from another CPU, such as SRM co=
nsole
> + * output, kills that CPU. Make the call on the boot CPU, as Tru64 UNIX =
does
> + * for its config tree callbacks; the PAL TOY calls also work only there.
> + */
> +#define CFGTREE_PARTIAL_UPDATE	0x1f
> +#define CFGTREE_BUSY		(-26)
> +
> +static long marvel_cfgtree_partial_update_local(void *arg)
> +{
> +	unsigned long flags;
> +	long status;
> +
> +	spin_lock_irqsave(&srmcons_callback_lock, flags);
> +	status =3D callback_cfgtree(CFGTREE_PARTIAL_UPDATE, (unsigned long)arg,
> +				  0, 0, 0);
> +	spin_unlock_irqrestore(&srmcons_callback_lock, flags);
> +
> +	return status;
> +}
[ ... ]
> diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
> index c418333d0b89d..b54f4fd69a0fb 100644
> --- a/arch/alpha/kernel/proto.h
> +++ b/arch/alpha/kernel/proto.h
> @@ -112,6 +112,7 @@ extern struct screen_info vgacon_screen_info;
> =20
>  /* srmcons.c */
>  #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
> +extern spinlock_t srmcons_callback_lock;
>  extern void register_srm_console(void);
>  extern void unregister_srm_console(void);
>  #else

[Severity: Medium]
Does this break the build when CONFIG_ALPHA_MARVEL=3Dy and CONFIG_TTY=3Dn?

In arch/alpha/Kconfig, ALPHA_SRM and ALPHA_GENERIC both depend on TTY,
whereas ALPHA_MARVEL does not.  When CONFIG_TTY is disabled,
CONFIG_ALPHA_SRM is not enabled, so srmcons.o is not built and
srmcons_callback_lock is neither declared in proto.h nor defined, causing
marvel_cfgtree_partial_update_local() to fail to compile with an
undeclared identifier error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-marvel-env=
-v2-0-ef614eb2e7f1@gmail.com?part=3D3
