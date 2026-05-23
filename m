Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2CF3845BC
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779528024; cv=none; b=pCcqKQbANzj0icAT/AMVokI/46L8JGXn5TLE8b+tFYjW4pGy0ATkBjmxR7ZzvZ67+j2nJS5+H6kjxvimny5d5elcHyPL9cfHeScku843V2pMY+sHA0E7TzYe7sgRm1fJN+XFc3e4tb9M0kXWZJkIyoHRjIbPx96VegJ3c1ny2Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779528024; c=relaxed/simple;
	bh=t+aytgWJYWMrIeGAWf/uE60NzkgJIffFPhmKzk31inM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdUnGz64nWEea6z5cMxszWzaPzvc5I2zwTJVGpJwIERO05R5wxOw5bfcBosWpw68x4q2jVQGUoqmz4CTVClZYz7a7S/SvvTvXWnQJAAOtWfBBya4RJDQOKH3JkbNsEx4GmMm3NS2VZuFZLfn+gSvh4NWFOJT/jhRK0dgANTjkNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfxBsi7J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfxBsi7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD611F0155C
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779528022;
	bh=t+aytgWJYWMrIeGAWf/uE60NzkgJIffFPhmKzk31inM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cfxBsi7J9fsxEfsgvFmd2NVs986Q+ome4emmk8XKBW0g0Vb4bFRCXh3k/gEInSN8Q
	 wEXuaXm6WH4wWD/NmykWGGJpFREKgCOdeQKCh67hcMtBLIaQX8g4xf6Fj0YJaJrb6E
	 0KkeYumHzBE0gW2aIVVaoAPL6MsNZAVaieL5jDJ98UnLoSi/slwePbTpTNRRuCtkdo
	 oilPK8HHNaAyy21qLXJqkYqQiaNjU/7QbTVFL/kKpraNgzZP4FeFSD6emYDCnGFOJs
	 r6bIrTI6lLYD5KEOFKQaAN034CwriA+B+X8bZ8PfjNeuBeHNwWRDanNTFWv/061nE7
	 oe3vN4O5udvEQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393a49d2e5eso72294151fa.2
        for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 02:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ89humUmNgJ+/jlCv5MqHerjkQ6i2hAYrel768f0y6CHwJIJWBVUZPtkzBC3DOUTqVMfh4mpDqKZh1jBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWfTrQl79aLPdwWb14VeqhSOkNyHaH+WIASbwZELVIPILEfSAN
	9MH4HJYAbhMVv8aVZxuE48y+W3DpdjFAL13GEozpyrLxHyfp7QdSjfpxoBqEQUf6LHS09+WULgz
	l3YMphWhpkyIjuZslDiFHk48agcReXsw=
X-Received: by 2002:a05:6512:61a:b0:5a8:ee42:c131 with SMTP id
 2adb3069b0e04-5aa323cbd13mr1605975e87.34.1779528021498; Sat, 23 May 2026
 02:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com> <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
In-Reply-To: <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:20:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkCiZVOWYcN3yqLu6fOqjQhSkM0aZAbzVuoL-5hj+Lnzw@mail.gmail.com>
X-Gm-Features: AVHnY4IWSrFsqHQpeusKv0ApoYMxulT_ZRdAj0wPbeYFZEu1mlSyB-OxmXrnTAU
Message-ID: <CAD++jLkCiZVOWYcN3yqLu6fOqjQhSkM0aZAbzVuoL-5hj+Lnzw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: pinctrl-scmi: Log number of pins, groups, functions
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 11:18=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Wed, May 13, 2026 at 6:44=E2=80=AFPM Alex Tran <alex.tran@oss.qualcomm=
.com> wrote:
>
> > The SCMI pinctrl driver does not currently log the number of pins,
> > groups, and functions discovered from firmware. This information is
> > useful for confirming the firmware exposed pinctrl resources during
> > debugging.
> >
> > Log these counts after a successful probe to align with the existing
> > SCMI client driver logging pattern.
> >
> > Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
>
> Other kernel maintainers want a minimalist dmesg, but not me,
> so I just applied this.
>
> If someone is upset about the noise they can send a patch
> changing it to dev_dbg().

Ah scratch that, Andy made a fair point that it is available
in debugfs anyway so I dropped the patch.

Yours,
Linus Walleij
