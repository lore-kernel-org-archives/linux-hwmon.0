Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BE641B342
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201327; cv=none; b=jltsvZc5pMiJF+chub3N5baj9gMmXCLgEI0gNGvBf77xZdFxtl36qo0/CrkXp3aThi+0VNOY3ehT5cwtJBTa1XODhwe+7nqn8cS5L0RzVoak0dEADuEOx02RO5BI8c/g9hXBYQsW1psqPDpIaIOVf689rlj+IAnZv6EMNrGt5dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201327; c=relaxed/simple;
	bh=y+3rbUMsFH6STnRgyWIB91wX0pLNRrq2pIp4p+Xt2Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUdAOqUzH5mWJJhxBKLb4HJPc3Xad91xiwf5VIGZlYpVBkW6JPt13vDI2iMvSy/IcynG6ytkwwZ49Z/a7kDKljPjbwezZxu+3jrDk4Mu553niA1uvp/XbUHSP7OaPN+8F+adFsmlHsC5KdXekcZ0Ul3EPZ1Dkk5xXh+KG5zosJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEld6riC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEld6riC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAC4C2BC86
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 14:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772201326;
	bh=y+3rbUMsFH6STnRgyWIB91wX0pLNRrq2pIp4p+Xt2Gs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gEld6riCZd2kvzj5ofkF6tZ1YSoP9vlkRWI+SgbVLCwvGPEJFvuQtsIyv7lI3DLCf
	 KOmEk3aXUmU+7JT85z8Xu8//nT4F5xWo2KnnUGgem/stnoe6uYDi7/tTOeRGJRI7b/
	 P/1sZ0r8P7gVekWaUqhX2QxOmu8pwNCMzw8jnNFoZqGBi4tjj40qdiE5ioEGW4In/K
	 huaE4jjYAbsYG3/QReyOAj9QtE0YfS1byAoAnRpglmGVKKezt4KoKJcgXvCkAKwFWU
	 qFSrEJQuTkA50szl/7zTLVuovCNpzOK2cU1L1NfwAyKqxT+83l0Eb3rS9u2aVJGrHD
	 PZaA9vLKNgI8Q==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-798374d0f44so44445907b3.0
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 06:08:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIqBV4pa/VyNt+LkOomImHVkIuCpEqCoBfegCEx0PzcOxHNshvF2rIUi8oyA58rGLOud5ZRsy1Si2Hfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgr0e5/rGxP5R7SGd5wmginrtd32PomSlcnj8uQ6kAM5jsAFKp
	X7WyhaTsNQcwAXCPjFvWOfMkbnQKk6ALKcbJVC0ktTM190rXpI6FJvRGmLxp+kbqO1Rn9FwtPz7
	QGSslssDfqJCBoMGfuy7YAKoL6++ZFmQ=
X-Received: by 2002:a05:690c:4802:b0:798:534e:4a0b with SMTP id
 00721157ae682-79874bf3391mr56667937b3.15.1772201326242; Fri, 27 Feb 2026
 06:08:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-5-o.rempel@pengutronix.de> <CAD++jLnrXHi3dEGWDK1ymnKUvbtSr+BjFzxMXzH+gAS8RToj-A@mail.gmail.com>
 <aaF4zKMK1XOT7L40@pengutronix.de>
In-Reply-To: <aaF4zKMK1XOT7L40@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 15:08:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLnX+vSh8+Sxu4YtwbmCf1a+m8yGT0aB9yNzC=CSx54YPA@mail.gmail.com>
X-Gm-Features: AaiRm52zSRwDnOFexQxpGMC2RtMNpIQU19Z0k6kTABARIgBcABSrhEmUVLwGRYU
Message-ID: <CAD++jLnX+vSh8+Sxu4YtwbmCf1a+m8yGT0aB9yNzC=CSx54YPA@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] pinctrl: add NXP MC33978/MC34978 pinctrl driver
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, David Jander <david@protonic.nl>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 11:58=E2=80=AFAM Oleksij Rempel <o.rempel@pengutron=
ix.de> wrote:

> > The driver needs to report the *physical* level on the line. Then the
> > lines need to be flagged with GPIO_ACTIVE_LOW or GPIO_ACTIVE_HIGH
> > on the consumers in the device tree.
>
> Returning the physical level is actually exactly what this code is
> trying to do. I need to rewrite the comment :)

Aha OK I'm not very smart at times...

> The issue is that the MC33978 hardware does not report the physical
> voltage level on the pin. As per section 9.10.27 (Read switch status) of
> the datasheet: "A Logic [1] means the switch is closed while a Logic [0]
> is an open switch."
>
> Because it only reports this abstract "contact status", I have to
> translate it back to the actual physical voltage level (1 =3D High, 0 =3D
> Low) based on the pin's current configuration:
>
> In Switch-to-Ground (SG) mode: the status bit stays 0 when the physical
> voltage on the line is High (open), and reports 1 when the physical
> voltage is Low (shorted to ground).
> In Switch-to-Battery (SB) mode: the exact opposite happens.

Fair enough, as long as we have a (possibly verbose...) explanation
about what is going on in the binding document I think the
proper driver behaviour will come out as obvious in the end.

Yours,
Linus Walleij
