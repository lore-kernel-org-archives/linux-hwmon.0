Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBFC330B11
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529039; cv=none; b=qEn+1qhNO5bhml2pgj6t6nXuEad22lXAkYVwIabIgEqydR839Iy3KFROvI/yOTyvSpXE4R7YX+Jfd6H4zgrSasM8So5AM3xAUjDAZXS7WCY5IEzLGuKNPl4S2UnPbBnvGWzEA0xQ6ofHU7msWayp5INqqDI1uQjRR6hP/hrmm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529039; c=relaxed/simple;
	bh=11e6tmUF+BcQmt36bxrCztET5YUxkRxYcIMrH1p1AxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FljcslQnpFdlaRpXpjOeT3tWT3TVh46VK70QG4QfdsHadcG6pCYlcVJzJnsfd7yGndTK0/FhQu2JDMnKXsBjuAXr80zUNVzRhbV6XMcT5gy2Kl+d1acc9gS5spRtZB+Ywoe07SelQnAkg8jSETzjdHkXj1ZHeupkbZfqUIsvP+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqWQgYrf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqWQgYrf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A861F00A3A
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779529037;
	bh=11e6tmUF+BcQmt36bxrCztET5YUxkRxYcIMrH1p1AxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RqWQgYrfdGQEWSkw6614n5xbO9htsJcfX17wLts7sxwK3ZVBWek7fJz2fcnShBVP8
	 8r4nH2cBVYUnZFOw3Sx4gPF5AgTcPwJ7EEDBSipEmYUoTme4tx6kqlenRY5VI+eW4j
	 5ebVkNspes1QDCvsSFT+oz+S4RI9PzvgImbL9WfuklcsKMZVt8cN5ijliNAdRPauY4
	 N7jKFOq144jc+sTZn7ETXzE/Lf/GzJlv2UGe9+aA9p0r74S8hbU5umvGFnKrtYo3SR
	 2YLasifsnjciz/2LCejnzE//aUrf/R7pZ6tCpBHyKlMX2kN6T46LOhtkpZik2NepEL
	 295BEiHLB9fSg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a746f9c092so11731406e87.1
        for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 02:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8d67LZfS3PyGHAa1ozriYqRED76Br2qGjBSpPqGAJ7yq3NvG8nI+fYCUf4dguRTUAsDk+Gu7rko5uhog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoSxV0up3x1mhXjehS2dtyJSFibFk9TqAuE5yrmU6dVFsXCvFS
	uwvaNMnvG53F/NUAz1CehhCo+z3wApq1PXPCRqEFwfnnClMXAv2Q7dvP61/l+3NW2iw1VJTLAur
	5k4YtinZnHYyUUABQhPq98YBnK8GZKmg=
X-Received: by 2002:a05:6512:114e:b0:5a8:7eda:7d8f with SMTP id
 2adb3069b0e04-5aa2ba85a0cmr3647436e87.12.1779529036009; Sat, 23 May 2026
 02:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515160537.115808-1-o.rempel@pengutronix.de> <20260515160537.115808-4-o.rempel@pengutronix.de>
In-Reply-To: <20260515160537.115808-4-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:37:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLntC2_v68z6dcCCzvdLPQNo8ZYEru8=vO7hxQA9AvV6zA@mail.gmail.com>
X-Gm-Features: AVHnY4Kz-M5FI-BNqQ24DfcoYzQbAVYXn57oRkLed4jVFTFJSmUTkuoY7Iv6os0
Message-ID: <CAD++jLntC2_v68z6dcCCzvdLPQNo8ZYEru8=vO7hxQA9AvV6zA@mail.gmail.com>
Subject: Re: [PATCH v12 3/6] pinctrl: core: Make pin group callbacks optional
 for pin-only drivers
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 6:05=E2=80=AFPM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Currently, the pinctrl core strictly requires all drivers to implement
> .get_groups_count and .get_group_name callbacks in their pinctrl_ops.
>
> However, for simple pinctrl drivers that act purely as GPIO controllers
> and pin-specific configuration proxies, without any concept of muxing or
> pin groups, this strict requirement forces the implementation of dummy
> callbacks just to satisfy pinctrl_check_ops().
>
> Relax this requirement for pin-only drivers by making the group callbacks
> optional when no muxing or group pin configuration support is provided.
> Update the core and debugfs helpers to check for the existence of these
> callbacks before invoking them.
>
> Drivers that provide muxing or group pin configuration operations still
> must implement group enumeration and naming callbacks, and are rejected
> at registration time if they do not.
>
> Suggested-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Since it's unlikely that the rest of the series will be merged for v7.2
I just applied this one patch to the pinctrl tree, because why not.

I stripped off the controversial Sashiko review tag until we know
what to do with these.

Yours,
Linus Walleij
