Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805F643D4E8
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133759; cv=none; b=trHlKIqTmTlp66uHgUcphEZjm4ElFdgWX2NcuLhozfpX6GmhYhsDGQHr3Z9iuGnuxvF49FJY6xPMS1P4gOrWOh6IoqZ/BdGd+hOYx6PVxRMuQbW/sS6lByqOd6ObWiiHhdpLJAv2Nl0cXGzRE7c1HQoNZguwOYjV8B+TfL2ESww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133759; c=relaxed/simple;
	bh=lmIVJg2dvi3jHArlXyjrxCfuPpgOkYqyLwhO40XECRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PadtlxaM08/9Tjidr4tD6A1ZwtHCYqc/fiWn0EClDLtpwC6CYKoMGjkpUXuiJpGEbN4k4wmCe3geXti9QUcSJqlz09oTgyTCPWENJ0T3BIkQQjAJ4SUqdXtgLPBAJlpC6U8JFV9M58XXEgfacLMyAzqVcqjD9wFZzniilqYv7xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+xKuF5f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+xKuF5f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD83C2BC86
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133759;
	bh=lmIVJg2dvi3jHArlXyjrxCfuPpgOkYqyLwhO40XECRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i+xKuF5fmZrLzHlG7Wvk6ofZ7I50JYAfBxe9oKT21LtBFAPEPHef4BfIbd3F4KWzL
	 EOJ11ivDYvUpUlpGILyNj8zqTSDP9J42BJ6tV9W46i0/iAzUmWQWJE0guS8Dr4LXFv
	 72W04g9Cvs4L4SnEQZfFjhQWg6nEKvC0QU7fxjQLSJmE5Wji/jHj/qbONXLviKk1YU
	 SCBDTbCj/0e/plN+oH/U//qeuXFfY2mK0LzsEeBfwgV+yAzd8OSkIgOn0fAq7hNIMh
	 Pis0xbdf2o4ts6939U162rPmEmVjyWt5CAOKpDSy60JXDokSoJGuLP69yl8yohb/XV
	 XMBcWUQUpAbYQ==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ae222d978so12272192d50.1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 02:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgaZ8BfNATd6Qtsb8cs06A2LVfYGT4GlMuw1Y2ifhgka+zx0L3RxIibH4g+k2IO7G4W1XCXVl8Zy7Dcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMM+LBDIRg00HcfFzWajieD/j2AedQiq0SYYAmt5lKfrVEA7M
	0nWYOk/NgPogaiJZyc0hVv9q8HpRyFX/Cut03kg93ClOiNUOF7K5WalL7yUvQS10OURO8v6sc9I
	thAjE8oDZl8ytSrBE9mLiNB1EUryRaxs=
X-Received: by 2002:a05:690e:68b:b0:64c:ae9e:1c43 with SMTP id
 956f58d0204a3-64d143bc02emr9879057d50.89.1773133758548; Tue, 10 Mar 2026
 02:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de> <20260309134920.1918294-6-o.rempel@pengutronix.de>
In-Reply-To: <20260309134920.1918294-6-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:09:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkHJbYR3niEqfXwQxT_V5-n-jCDwgevEJ5K18fhZQNP+g@mail.gmail.com>
X-Gm-Features: AaiRm52SylYAFE0cGtD-gPjeVJYdR_gqaNV7fzfvvtJi0fB-wkplKOM7GV35OT4
Message-ID: <CAD++jLkHJbYR3niEqfXwQxT_V5-n-jCDwgevEJ5K18fhZQNP+g@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] pinctrl: add NXP MC33978/MC34978 pinctrl driver
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, David Jander <david@protonic.nl>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksij,

I'm officially impressed!

On Mon, Mar 9, 2026 at 2:49=E2=80=AFPM Oleksij Rempel <o.rempel@pengutronix=
.de> wrote:

> From: David Jander <david@protonic.nl>
>
> Add pin control and GPIO driver for the NXP MC33978/MC34978 Multiple
> Switch Detection Interface (MSDI) devices.
>
> This driver exposes the 22 mechanical switch detection inputs (14
> Switch-to-Ground, 8 Programmable) as standard GPIOs.
>
> Key features implemented:
> - GPIO read/write: Translates physical switch states (open/closed)
>   to logical GPIO levels based on the configured switch topology
>   (Switch-to-Ground vs. Switch-to-Battery).
> - Emulated Output: Allows setting pins "high" or "low" by manipulating
>   the tri-state registers and hardware pull topologies.
> - Interrupt routing: Proxies GPIO interrupt requests to the irq_domain
>   managed by the parent MFD core driver.
>
> Signed-off-by: David Jander <david@protonic.nl>
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

v3 solves all issues I pointed out and makes excellent use of
the hierarchical IRQ facility, cut down the number of lines
of code and just overall elegant.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
