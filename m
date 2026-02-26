Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391E4244692
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146855; cv=none; b=Ikqf/q1hzpEX2bpBMSks1jiNDi5tSuqmCFe6CsuzSpQsyOvOrzfkhnda4U0kR4hnQympeGfcTB/8QHrIsTf4EtkLbldb8kgGoajeoHcYkb2U4JToLlrhpqTwFhm8yBJsvUZEvCRKqSTnu/iXXvObnyoVZHcJg0zSKZB0B0oe1NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146855; c=relaxed/simple;
	bh=8NfYHIs2u8PYfKkw4JpNbu7c/jRe8VpjpEv1ZVGuM/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HveCTtUXGmFKjlP6q2s7Oy9Hb5MvPF9F8QGPS7Cw0ishKnXVkpmFqX4zNp1jFSTnrPnAHgqk88VMMFVqavIo3enrdxWW59X8Hmyd5wcnJnIB+nDMSfm4M8yoGE2DDDcmHQxPJb2ro1JcKAh8sJqCu6Osq6440hfUreBUJAbOSh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/itnBvW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/itnBvW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F2FC2BC9E
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 23:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772146854;
	bh=8NfYHIs2u8PYfKkw4JpNbu7c/jRe8VpjpEv1ZVGuM/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B/itnBvW2Z5XflU3hz8kop32RTtw7zbafsmciu8bA00tJbl0nsKjMYOsLjr5z/3zz
	 DmAKG1bwZ5xYkF1hfMovC4qvMJ/wWhRlNy8Az2v0vpTQLBmg2vj6OVUU0Un17UF9tO
	 14mKCu7wfADzBDM4EUDKWYm7PbVzqiFmD07+6ArArulcJEjos+okD4bvid2eUi9fAp
	 kVaD8AF0cCzHTF+SEduiypJloXtcsuERmvfsP7Z1Z2gAFSxNA9jBXle7XJMx1kdNq9
	 zR8vKlvbJ1ZijGGfkB5Hp/p2LMdECgMJdTYwaqyQPo5I45jM9kJ0eJARZhsFi+7TAo
	 /gAgBUAmpCbaQ==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64aedd812baso1149751d50.3
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 15:00:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrjBLW304l/lF1DjxMQRmnBh+p80b6BwIQmK3RvNNRSHhPh6lhY4/sE61DaB/gGDmBXg68DvnWDc6MWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuGAA+I7iZW+9qxuJKbMa9FoQh3FkeyQpZleukPWGtx7W0/Ncg
	9IckqxsX7YXptfLrXLlCvxlBD6DfU4Tb4u+Rg4ksli3a8U2cPhblg32PyGuYI3EMZmvk7OsEn9h
	t948ZY1zHKxp74xMK4nf1evy9/LWu2Js=
X-Received: by 2002:a05:690c:3506:b0:798:71e8:3e3c with SMTP id
 00721157ae682-798855a43eamr9121307b3.40.1772146854204; Thu, 26 Feb 2026
 15:00:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225171545.1980385-1-o.rempel@pengutronix.de> <20260225171545.1980385-4-o.rempel@pengutronix.de>
In-Reply-To: <20260225171545.1980385-4-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 00:00:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
X-Gm-Features: AaiRm50m6oV6TlZxbQPsC6-EQt93_b_JUZykrqE8gN-rjOqdfnJE3otrxdt5BrE
Message-ID: <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] dt-bindings: pinctrl: add NXP MC33978/MC34978 pinctrl
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksij,

thanks for your patch for this very interesting hardware!

On Wed, Feb 25, 2026 at 6:16=E2=80=AFPM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Add device tree binding documentation for the pin control and GPIO block
> of the NXP MC33978/MC34978 Multiple Switch Detection Interface (MSDI).
>
> This block manages 22 switch detection inputs (14 Switch-to-Ground,
> 8 Programmable) and acts as a GPIO controller.
>
> Additionally, it supports pin configuration for hardware-specific feature=
s
> required for long-term contact maintenance in harsh environments, such as
> adjusting the continuous/pulsed wetting current to penetrate oxide layers
> on mechanical switches.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Are the hardware-specific pin configurations for oxide layer
penetration (!) and stuff excluded from these bindings? (It looks
like.)

> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MC33978/MC34978 Pinctrl/GPIO Driver
> +
> +maintainers:
> +  - David Jander <david@protonic.nl>
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description: |
> +  Pin control and GPIO driver for the MC33978/MC34978 MSDI device.
> +
> +  Pin numbering:
> +  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs)

I don't know what a switch-to-ground input is, but I talked to an AI
about it.

It appears to be directly incorrect to use such a line without
flagging it as GPIO_ACTIVE_LOW in the consumer so this should
be mentioned here, GPIO lines 0-13 *must* be flagged
GPIO_ACTIVE_LOW. (I don't know a good way to enforce it
in schema, sadly, maybe Conor has ideas.)

> +  - Pins 14-21: SP0-SP7 (Programmable inputs, can be SG or SB)

What is SB now? Please explain :)

Other than that it looks good to me!

Yours,
Linus Walleij
