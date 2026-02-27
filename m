Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48D018C02E
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201185; cv=none; b=d/P2k/hlFcKRVB6cYRstndhZI2zGMtRuphGFhTk3Kr1I6fuIj85d99bwNt1U9ELzh6RhSVYrgkUARmMJQspeJUiS6Z/Og8U8N27ijOd4EuqWC+2wZueAFyayhf6zPZIe8DNzo+Aire6cr94Q5mnNt5Lib3a5FdOvUFO/GNVJHaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201185; c=relaxed/simple;
	bh=V78swCMBy0EDVp9Z1/BFEbZQ/NnZfBxBXJqwi1WkAhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmiQLTSCOctdoBFfH0WviFa8Tp+JZp8i1q26sMR5qHluvRw3on+0yuMYLlYQT6OTUcvhfeDHVsyFEo13noEVr0efgEoW0cCyD9RYU1P94pppcoTB0NCLwHM30u5ZiRvOs/297nhxPl6oCoX/yQcnWJGmlaPZsL5z0/fnOiJ7az0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V++Ip3OX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V++Ip3OX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CC1C2BCB2
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772201184;
	bh=V78swCMBy0EDVp9Z1/BFEbZQ/NnZfBxBXJqwi1WkAhM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V++Ip3OX2lWSVYl+UKTzyeUmdSrFatdp+k2+qy4eFUD7MzxT9mkVQqePLqTkUzSrf
	 fMntO/fdX4am5X7SNNlup9mAoxbJJx4eR6xIHZIKj836a7PlqR36HALSZ/ih86OhNk
	 s4x9aUMpjQ8Ig3rfAiBn7truj22aFW5ea1ABxulXos97kAY6qI1gcrQ84O6Gsnlfaw
	 6ZmVckbU8EMkSIG/bhuzpgsR6tq56ghcLpl3oqCu1uTsLmP7BjYcjs/FFRZ7A+7BbL
	 3tlSisqdhgjKUKu5f3rttMzBHpKwl7QcN6RE/hOkTVAPxY6fK+1BVjh2VfapZzEMVh
	 9EhoynmkBHMFg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7987531082aso20008507b3.3
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 06:06:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3qzHSB9oAAN0aBZ9ik12ZkkZzKyyK3TSWiNMRwdod4x5roOGPYKubRo+YMKxMn9JkwgoOtYr2rFk8WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+WaMqS5ECnZ3s+LkBfvsro9rhfqFktScR3/fUHNO76qMMve9A
	uB0+8T+IA/xSBTB0Cj9ff9rWN35RAqzWrisgMo/MXsW/wt8jZiGB+/Silm0SRFiETzGM44VUgyv
	BmxEnJomAm5oUsqEedXWZXG4n5dqdHx0=
X-Received: by 2002:a05:690c:385:b0:798:6c28:dd57 with SMTP id
 00721157ae682-7988554de07mr26608357b3.28.1772201184043; Fri, 27 Feb 2026
 06:06:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-4-o.rempel@pengutronix.de> <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
 <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com> <aaF0xNKzz74h0gBA@pengutronix.de>
In-Reply-To: <aaF0xNKzz74h0gBA@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 15:06:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkq2HCkJKwt4xwX8PwKzxSGVtLLnWw5i8U9vCga2a8uPQ@mail.gmail.com>
X-Gm-Features: AaiRm532RrAcBAWmH56RMS5aBEUtuVLfNf8FT583QGTAch2yS1YtJvupXbZzHlY
Message-ID: <CAD++jLkq2HCkJKwt4xwX8PwKzxSGVtLLnWw5i8U9vCga2a8uPQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] dt-bindings: pinctrl: add NXP MC33978/MC34978 pinctrl
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 11:41=E2=80=AFAM Oleksij Rempel <o.rempel@pengutron=
ix.de> wrote:
> On Fri, Feb 27, 2026 at 12:02:53AM +0100, Linus Walleij wrote:
> > On Fri, Feb 27, 2026 at 12:00=E2=80=AFAM Linus Walleij <linusw@kernel.o=
rg> wrote:
> > > On Wed, Feb 25, 2026 at 6:16=E2=80=AFPM Oleksij Rempel <o.rempel@peng=
utronix.de> wrote:
> >
> > > > +  - Pins 14-21: SP0-SP7 (Programmable inputs, can be SG or SB)
> > >
> > > What is SB now? Please explain :)
>
> > Oh I see in the driver that this is Switch-to-battery. So document that=
 here
> > in the bindings too.
> >
> > Also it seems that something configured as switch-to-batter must be
> > flagged GPIO_ACTIVE_HIGH.
>
> Actually, the active polarity depends entirely on the external circuit,
> especially since these pins can also be used as controllable current
> outputs.
>
> For example, we attach LEDs directly to the pins. If an LED is
> attached to an SG pin (or an SP pin operating in SG mode), the pin sinks
> current to ground to turn the LED on, making it GPIO_ACTIVE_HIGH from
> the LED consumer's perspective.

Aha OK I see.

My main input to the bindings and the driver design is a second pass
at polarity handling and how consumers in the device tree should
be flagged with GPIO_ACTIVE_LOW and/or GPIO_OPEN_DRAIN
and similar settings and how the Operating System (any operating
system) is supposed to react to that.

My main concern is the semantics with these flags.

Yours,
Linus Walleij
