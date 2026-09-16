Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48484C9DE2
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577779; cv=none; b=R7lQf6tYbaOJmchpnC/y9rr2GBOkhbmPy7y8M/2wmhY69d5WzcsS9fksTFriihKiV6SOvnLbiz7OBjPCI5ZqbQxBQ64P5whzT2WNWdJGLvLza62qLGpu787hfr9+FWUdio0Q+tr63xZk4970YK6Y1IIQW9k+h8TWloA3sFsmqqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577779; c=relaxed/simple;
	bh=FsAF5t94/E+0eDbBJV3FrxLYtGfzl97iFt4l9Z2gsvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pf5H3qP9bZZqgngEZve4JmjR6bKJOeYd6+1vU99KWWN6EGETwH2TZgfbIJ4LCO5WsjMkSbWz+RSDigCipNGRIbYXAthFG6OujtUlapzet/I47mszu4iKc/UNbR8gitFy5e7elNzeQZU1p82f+eTBcnURp0ZzAIJnQ3hZPloUcZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwL5uJTv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwL5uJTv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7DA1F00A03
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577763;
	bh=FsAF5t94/E+0eDbBJV3FrxLYtGfzl97iFt4l9Z2gsvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LwL5uJTvk+caRQNwbSB5ATPRXw7brmRpqJk2QtEll9wNrHzM4LXKPhOBdmC+qqHOI
	 NaAfUFq4rzoGACFTTyQdLoVYuJm1jdHaHb3qn8txxe+xc8JINpsTykSozSnWxabH7h
	 op/idZS1YNtNoCVSPRb1QEGHzn2m7zw2LDIyCIF4UfpM40ioUVIK3/wHAx+xiSWMvN
	 /xVulE7ndQVQaOLAUcAleHr+kdN6ev6pJOs9oO4QLDkU1T8hSvaeyWKeIa8Kzkm0DD
	 ggUQq/Z5XbsvLX0fdmmQODqsVDJJlwrxRbedL+4Z4hrIX17PbxybKgpia9/d18jI5C
	 V90mrPeJbBvPw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16c81so1173908e87.2
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 09:56:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHTSyzNy5OrId/MIxbGEW2mVib1hogUly8DA1BtIDHjncis4R8xuiuBtCyFzg22trsRTEmxu3MAwrs+g==@vger.kernel.org
X-Gm-Message-State: AFuF++liPfD5sh4dJUxhobe+dssxJ+wIiZDXJMeMWKI4nWvKswoYlSea
	G5hfGwGtL/9K3cA3WReKrzpzvoUpjXfg9+f9qXxmlhGPIeOxLVMFo2IB1etJQfu+vwMP4RxhMLZ
	jrUEsjjpXpjhyLlDlVY+zdjYNqh2rJik=
X-Received: by 2002:a05:6512:3e1b:b0:5b6:1a7c:fd7f with SMTP id
 2adb3069b0e04-5b8b6652b42mr975442e87.37.1789577761635; Wed, 16 Sep 2026
 09:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-8-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-8-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:55:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLmJ4tbJuwuQtAx6UCxWU4XghXwp=saMqy5SRsASqe-=Hg@mail.gmail.com>
X-Gm-Features: AcwNN1X4XEEO3B_3JMl6a8g-CgUfyegbwNLsrb9Ef6iUWMuuaWJ5SqyyXzqaDA0
Message-ID: <CAD++jLmJ4tbJuwuQtAx6UCxWU4XghXwp=saMqy5SRsASqe-=Hg@mail.gmail.com>
Subject: Re: [PATCH 07/14] mfd: remove unused lp8788 driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This driver was apparently never used upstream, and without devicetree
> support cannot be used by external board support.
>
> The MAINTAINER entry was already removed in 2021 as the email address
> bounced.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
