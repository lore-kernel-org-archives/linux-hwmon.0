Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57533C277E
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220688; cv=none; b=AUMy7M/oKyJnV3hNdyHslZKOthSHDn+ps/uPySWVFRO0p2lLYlZ0WsjmUMFk5ko2bhc1ljm2q4Wzm/Oh2jwMXZVUOepPPfyRyTVXBIWXu9cX77q7n9StXSmBhdE+MudZvyrRDo40nhA5G6ohQqtK9z2SusohXaLvT2gT+GvtPEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220688; c=relaxed/simple;
	bh=G/0Dlt/xYWU8Y0//hA5yl6tN9D1kjT3kvYNnEHcXos8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJ+t6fO4iZdnzeFbI+waY98c8BEXld++S8ghq+jt+XzV4ZlmoWV7CYVxhT26y7yfIN5vmH7W0FNJgfXNG2IepcwNbkvzFe3QvH12UpifF2xl/ZErZYq4tmmg1P8ti94h3j4Yqr8tdQ5RZa83LLiNEOsIedoUdTt23eV6Pr8CLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2cEFI/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2cEFI/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15689C4CEF7
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773220688;
	bh=G/0Dlt/xYWU8Y0//hA5yl6tN9D1kjT3kvYNnEHcXos8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=I2cEFI/cBZnHzlinISo0sPUXIKgO/4an6nuLPEzGOQlsPAJVLzm3nIV+aHK403VoY
	 GFs3pA2rsthB5kKjaR4nSg5sCMhd9QLCQ0J0jeqf5bqZ1ClHtC/uwYxGgsfMsStXQx
	 iB4kX1lr1vlJ7X09PiqrlkoL1L5XwBIRZSY2J+kztRjP9k4pNfBBCbTb+gUosqCifC
	 kxuT9zjwSNQ+/Sc0FbY5nKFY29+0QCU5aZ3xVKfxVMci3Sx1ahKsVdUTSPLdWKxmuV
	 X4WXZKw7njGIHzwUjCTE/bTxSNKUJwjl9ZdC699zshAhfCGXqFn2+YjHH30ShyK14G
	 I5pKyiPHR7bWA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a46657a9fso39551881fa.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 02:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhtE7564tKCDdVcPMxrgrIc39IU/QrrQMSDTWJrag2p/UlCA9TS+3D+IT0qlYumwBb0xiWjahK4RNGfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6JrRLVrluF5yCeZrQOQBf0bwDYkh+fX/CsyFiZQxI6zdzjHCJ
	myhqWDxN7P8XAruIFpyH4N6Qi+uRR59pD5Mfyr0eXvR2eZWVCU2Egwn88+UDVhyLCt4aUv3tK4n
	3LvHP1UnOdkAyNFqQXcP7n0GLDhH/ffc8FG+aw9z2tw==
X-Received: by 2002:a05:651c:50c:b0:38a:51c9:cc61 with SMTP id
 38308e7fff4ca-38a67dae2b6mr8124461fa.2.1773220686751; Wed, 11 Mar 2026
 02:18:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 02:18:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 02:18:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=Mdutv6TyU5SG2uzCgRuvYVmfFB0kwXgj45Qajet+TdBhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de> <CAD++jL=3GeHNirtN9diGc8R2rxczo4UUL9_ON28jOj_DPP2Sjg@mail.gmail.com>
 <CAMRc=Mdutv6TyU5SG2uzCgRuvYVmfFB0kwXgj45Qajet+TdBhw@mail.gmail.com>
Date: Wed, 11 Mar 2026 02:18:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me5Yb_H3oQ7XtWVs+KViL6pkr0b1Qyb7WW1wtxyGkGhAg@mail.gmail.com>
X-Gm-Features: AaiRm52uyXq0J8mbMMIR1bmOYOnyHsKW57kaTw--ELJ_lpg7IYl05ysHO3CsbvI
Message-ID: <CAMRc=Me5Yb_H3oQ7XtWVs+KViL6pkr0b1Qyb7WW1wtxyGkGhAg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Mar 2026 10:14:59 +0100, Bartosz Golaszewski <brgl@kernel.org> s=
aid:
> On Tue, Mar 10, 2026 at 10:05=E2=80=AFAM Linus Walleij <linusw@kernel.org=
> wrote:
>>
>> On Mon, Mar 9, 2026 at 2:49=E2=80=AFPM Oleksij Rempel <o.rempel@pengutro=
nix.de> wrote:
>>
>> > In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_info(=
)
>> > before irq_domain_alloc_irqs_parent() causes a NULL pointer dereferenc=
e
>> > for slow-bus (SPI/I2C) IRQ chips.
>> >
>> > irq_domain_set_info() locks the child descriptor, triggering .irq_bus_=
lock.
>> > If the child proxies this lock to the parent, it crashes because
>> > parent->chip is not yet allocated.
>> >
>> > Fix this by allocating the parent IRQs first, ensuring parent->chip is
>> > populated before the child's .irq_bus_lock is invoked.
>> >
>> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> > ---
>> > changes v3
>> > - new patch
>>
>> Bartosz, tglx: is this something we should apply for fixes?
>>
>> I think it needs to go into gpiolib for next at minimum, unless
>> there is some semantic problem with the patch.
>>
>
> Looks good to me. I can take it into v7.0-rc4 via the GPIO tree and
> tglx can pull the tag once it's out as a base for the rest of the
> series?
>
> Bart
>

Oleksij: it doesn't look like there are any dependencies for this patch, is
it ok if I queue it for the next RC?

Could you add the Fixes tag as well?

Bart
