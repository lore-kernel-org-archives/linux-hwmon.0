Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872623;
	b=0TGm0jzErUpAteagsNQguz8RYtvp0z/Pt00HXFRI8L4ggnx+0VYVHurWpbp8SES2pC/E
	 6Mm3y4LRTqKhPImPvXMAwf7Nus1KCmnfO5uiTZMPeLs1nGpcSGj/QSS06VmvRnh3c7U+X
	 AuMv75R5G6TSJyaUr9ExpbOo0sWYMw+UA7OJzFbiB8gDJUaTiREutYEBVdVpqRTrVLtC3
	 mexKN5V0UynlUSQsG6/0Et5/XzkePAMbYwCfQzUriroHcBBzIVU5+6wK7GhLUS3FS92Y1
	 qllqrqIpyQGgxOmSAQPVLiuTk1URErVC2DoEqJBJc1NEEoo/bp04geGbEKBnf0jXBgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872623;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tE566DE9NL2ilRzS1obPqo6X//TjT5jTgHN8mNvDPfI=;
	b=KAm7jKxsPoLiUAtozCRU94NgcXp97WrYIIoquZVsDqoM8zJnIJAbCk48JCghL3AQrPls
	 IdczTjFavYCTWz5zIvCrT+JKiMZX/Syz/XMFpuDK+T+2Hd6ZsTZPPGQ0uD147mQ251lMZ
	 53OT81VhR2m3W8M/Q79wNglz0ZRrLukuxFcdEqKr9ErFF993GtA03G5OtJT3oQk7645Uz
	 fnUKI9EogE5tq/Wby8ECYUyX791lkt5UWrSuzy9QfTuxG83adthVXbZC6fBhhe5yqR8Ht
	 xokeIw0EiVxONG0T+SYb+ZVOOv1/qS3nuBg1uvv+QKcuGzHTmysMI1JfceXVoam3UbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqrb+u8R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA959606A331
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 23:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqrb+u8R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9691F000CA
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 23:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794872623;
	bh=tE566DE9NL2ilRzS1obPqo6X//TjT5jTgHN8mNvDPfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eqrb+u8R2mS56LFGL+Cm5IYMMCqz4vxyGTiDfq5C+hwS4Ji93k/va2STXI8l5AY/d
	 IcGT8FaIj9mV8mPdZAdP9a5re9B2DkM54Ot7+mVdC3m5xGt53/m0olioKd2LIIPdDS
	 SEC/gh/8COtAbm/2iEikhVadaOuGod/abpf6WvYaHe0REL0UaDnUEhuB8kJBqeSn86
	 b4U+Ohj0exE8NGGaI9FTe5RcVCsV0oOuusb4wrObn9vycHVZ31OMh2IDBuMal9dBpl
	 mko3DcG3vVVtO+lyjNLaFG4Ve3UIjv8zIx5G3GQt3xM2g/ya/dvZFu181rVwl32+3E
	 RbvI+4z4NcCvw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c1479be604so150860e87.1
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 15:43:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHeN2WlI2Jag6p5LnNgqiOLcvagnzML+LXeac4N0FQbG0kuhlBbLGzj4d7AOvoSIiAJn2qgmiq6oqTSbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0g3/EvkOHWbBhV7EJv857RpdaK16FwTlgBJXwUALZ1NFrbhes
	u8Lr/A0hv7I0Y2q+F35ee2Qj71OLsbftBp6e161lF+m5JPk6zR7C2Bgi2ZcAK8sONWzbmPWyADc
	uvu/5klOYTi9px0mZqCiu9ccBaT6kRak=
X-Received: by 2002:a05:6512:2385:b0:5c1:4a64:ca0f with SMTP id
 2adb3069b0e04-5c170795cc7mr4062399e87.31.1794872621897; Mon, 16 Nov 2026
 15:43:41 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org> <CAPx+jO9GW7e0ai2o4Ycc4BKBywTaP=7NiWk68=c2kqcD_VrgRQ@mail.gmail.com>
In-Reply-To: <CAPx+jO9GW7e0ai2o4Ycc4BKBywTaP=7NiWk68=c2kqcD_VrgRQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 00:43:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL=rqD1G5vR1onTRXJ64n6O2CoiQWFO7Y6Qpctzd8wjrFg@mail.gmail.com>
X-Gm-Features: Aa3M54ruCJqK0lxxieASqF1PArkor0hKv2Ilo3qPfjVfiTQ9FllSEn7zR_xIKUE
Message-ID: <CAD++jL=rqD1G5vR1onTRXJ64n6O2CoiQWFO7Y6Qpctzd8wjrFg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] BCMBCA PMB power, clock, reset and hardware
 monitoring support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Ulf Hansson <ulfh@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 12:25=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:

> > Through an MFD immutable branch once everyone ACKs the subdrivers,
> > it will take time I guess. Queue the bindings and drivers in MFD.
>
>  I assume you are referring to patch1, 2 and 3?

tt will be 1 and 2 in the next iteration after feedback from Rob H
but yes.

> In regards to the power domain driver (patch4) at quick review it
> looks good to me.

Can I record this as Acked-by?

> If Lee decides to host an immutable branch, just let me know so I call
> pull it in to apply patch4.

I think the usual way is to apply the lot to MFD on a branch and then
you can pull in that to get all of the changes lock stock and barrel.

But I'm open to Lee just queueing the MFD core and bindings
(patches 1+2) and then offer that as pull request to other subsystems
so they pull that in and apply each one patch on top, it's a bit
elegant like that.

Lee, what works best for you?

Yours,
Linus Walleij
