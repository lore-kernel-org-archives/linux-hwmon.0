Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646FD32862C
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146985; cv=none; b=oEyq52eOS65FkqDrN7uN2v7kzIspW4ClDoYn1nsPPGBrIFy8zoAEtI8vrsxac+7nv5dTP3b91VmxO81nbIgj/GY7LfRR3sJtmbFhGvC+NscVW1sgoNGxTGXW45UZqZhbbvR+L7NLesCIqV0qgfs32hz/kQgb0q8OcKnlPZDbZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146985; c=relaxed/simple;
	bh=juifvj4TPoDeapwISPtY4UqLPTbzAjLKpVQX30ShM4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zen3lX9ZRoge2Fjb9pDaD+HvxvZkC1+zDPNxBw/7mKBEPtkCj6rG/iDbmF1MDTnWbj2m8VCM2UQEtwHbHkSNtuseccLmnW22ZGJswDlVNnEhpEy7cJYPBciCmGSXo+nkZNfJuNABxrdTvHtn28Xb7V2OmAhrJsHHBt0kEvTMzyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okzGFR0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okzGFR0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01EC6C2BCB2
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772146985;
	bh=juifvj4TPoDeapwISPtY4UqLPTbzAjLKpVQX30ShM4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=okzGFR0xcitNDIaK+Sfd2x5eMMKsPj0bLBWXUPkFB2xlN38R5d7aLHGyFmVITrjgn
	 hwM51aJ41Sz0mKs8jWyp3U8LfrRY/QLA6DLJRLgj4GtMQPbyhwVLg/Fm9tp79ggMjL
	 eTi0dzVX/vKIpEutaGtnTwFgMKvMtUq3ce3Mj0CczJGTNSQHdLQ1mbt0vkoa9qv++d
	 0uKSRsfNT6Pkc/OR0MvLwPMk4oS2RA6epeu6FJSQJGNTKQ54zV87vsPyRxUkwFLJK3
	 LCqN/jbn+UEZeq9ub02j+gSV7Xdmo+r93rfd/PDfRCAAD8+FAm183QaJ92pZ//pkRY
	 wKz6PhCAbuWWA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79868eae536so14248177b3.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 15:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaCYhyFsIYZae57BuoYU7VphnaGmI9shONeWHnwzbgjcTX839K/+G46598CSg/jUxEPhEFBWC+PLCZHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5wtGWI7m9zxlvG+bWkOW7oKsOjZR+5QJPyHG1YujnJkcDlqoN
	xgAlnn/wOrIc0oesB07L83rsH7oXQwY94kzixs3lGhcvJ6dghJ3EEYgPYxHHFIwxgDbnBmamQeo
	7D3WaLgQWH0EdaSSW1qDzpywvmOT5E+k=
X-Received: by 2002:a05:690c:338c:b0:797:a75e:3676 with SMTP id
 00721157ae682-798850e67damr11323337b3.0.1772146984322; Thu, 26 Feb 2026
 15:03:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-4-o.rempel@pengutronix.de> <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
In-Reply-To: <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 00:02:53 +0100
X-Gmail-Original-Message-ID: <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com>
X-Gm-Features: AaiRm527bB0wtLGWuo0Xk8LO1jx9HQPkG4r12CRWYS1uUw0P8KGWnA1y3Zvx38o
Message-ID: <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] dt-bindings: pinctrl: add NXP MC33978/MC34978 pinctrl
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 12:00=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Wed, Feb 25, 2026 at 6:16=E2=80=AFPM Oleksij Rempel <o.rempel@pengutro=
nix.de> wrote:

> > +  - Pins 14-21: SP0-SP7 (Programmable inputs, can be SG or SB)
>
> What is SB now? Please explain :)

Oh I see in the driver that this is Switch-to-battery. So document that her=
e
in the bindings too.

Also it seems that something configured as switch-to-batter must be
flagged GPIO_ACTIVE_HIGH.

Yours,
Linus Walleij
