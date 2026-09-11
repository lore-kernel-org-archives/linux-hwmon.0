Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D894BA1FD
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 21:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161725; cv=none; b=tPFBm7lz1o/5egA7qSs+TPSqSjyN3h42ZRSYadsDV/XUZxW6SPNn8mw9itE2OWf0wK9sJ6NAqpRNckqqyEhS6CIiI9/icpRJINFm/Hp+uU8/A5UucT3LC37QjY2OY0F5cZzd/JllGzrsGX32BxUtnLa1SX8g444dk0AhpOh0HwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161725; c=relaxed/simple;
	bh=K0lw4ErqlWk8pT3HZqs9JvHLb2V5qg+DxfgRyzqyWQk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ou1mdWC41NdYZLEhV9rNQ8mT2JGYxejEaLY5M5S4RVj9/W8UNLWCGr91jrhbwrGl2sRTtxbT2lNDG3qBMdxKuhRmquctCeH7ZDO+mWByFMCOxUx3t5IRlKiZ8Os5+FmZ0dh6NszGq3f5cAWv0WZswjPQIgRlj5N2qW0o5+PlwOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQrjMDYm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQrjMDYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376CD1F000FF;
	Fri, 11 Sep 2026 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789161723;
	bh=YqnqTljYrhL5Z6oEhFvVkiCnuDP6WJ52GKQjdZ+XD3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQrjMDYmIOFBGUpM1NDsSLeUZVrxtVfB0ratJgiN8oeklxsjY++FOVarseDAvwj3k
	 3C9hbI8uljGDtJcdoPAUDTVjDyVblQB2CNgePyMOs0j+6MXH9QtkBf6wRDPT0CzyOP
	 QkB/3pHxkPwSKAhXAiA9wJeHyfWCk4tT5Ja76G2bg4Xz3X39D/laT3vezbL17q/nMK
	 Cn2CgK4J+AW10FadLCuFDFMvhxjR9tvQBRiq692ChLyY9ozXoVE3Czhw4aGJeyZ1av
	 R/QupZNbTv0eOXOZSpIV2xToxKD8a6/yeoLMxPlwfNjHAvnlbucQR7yZMRaevCm4WZ
	 sSdFnPE6YcLbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] i3c: set i3c_xfer.actual_len in controller drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Meagan Lloyd" <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, linux-hwmon@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260911210935.1353126-3-meaganlloyd@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-3-meaganlloyd@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 21:22:02 +0000
Message-Id: <20260911212203.376CD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The Renesas I3C controller silently ignores all transfer errors an=
d timeouts, always returning success.
--

commit e28c1ae3a51db6eef5fcba16ca850acda1a087d2
Author: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: i3c: set i3c_xfer.actual_len in controller drivers

This commit updates various I3C controller drivers to set actual_len for
read transfers. It provides a consistent location for device drivers to know
the read response bytes without overriding the length field.

> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesa=
s-i3c.c
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -918,6 +918,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc =
*dev, struct i3c_xfer *i3c_
>  		time_left =3D renesas_i3c_wait_xfer(i3c, xfer);
>  		if (!time_left)
>  			xfer_failed =3D true;
> +
> +		if (i3c_xfers[i].rnw)
> +			i3c_xfers[i].actual_len =3D cmd->rx_count;
>  	}
> =20
>  	if (xfer_failed)
>  		renesas_i3c_irqs_mask_and_clear(i3c);
> =20
>  	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is a critical pre-existing
issue. Does renesas_i3c_i3c_xfers() silently ignore transfer errors?

If an I3C hardware error occurs during the transfer, the ISR populates
xfer->ret with a negative error code like -EIO, but the loop here never
checks xfer->ret. Furthermore, if a timeout occurs, xfer_failed is set,
but the loop does not break early, and the function unconditionally returns
0 at the end.

Since the controller ignores the error and returns success, callers will
proceed as if the data was successfully read or written. Could this lead
to I3C device drivers consuming uninitialized memory or encountering silent
state machine failures when a hardware NACK, CRC error, or timeout occurs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911210935.1353=
126-1-meaganlloyd@linux.microsoft.com?part=3D2
