Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6753DB641
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003288; cv=none; b=lLtOpLRC6sFS+s8F23mS4airZHwCxJuq2HRGhwFx2SWfJ0AOIyaQR7m7r5yzwtVp4GxbD7IMjGORRHpfC2iEXYIYxXzvtBrCSGHvdk6ZngiLR9q5JWds4f+5/GniLKlMj2hp1zBbwxlg5Zp4N9x1Im8fSitTFLW1TkqWvbPCYTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003288; c=relaxed/simple;
	bh=murhDA9Vht6ipjFnW9r9lUBh3J8hJwDYEST9mlvXgIs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OJHhDPZDAeAEOzXp7+V6D672+jLLelZYf5tg0+vQb+IvGT5xr0xJl9hG/dxvUayZBIuN26M+8G9xY1cfzV5QGP/IFIC+xiDNWCRiOyfeZKcWPHQYvFNLPuMOmQ5D8kazRlkWY8LyGyu0urNKupAGN/YG4wRcPmRJDYNGUD4B5Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOlwRgiQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOlwRgiQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9741C1F000C4;
	Wed, 14 Oct 2026 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792003286;
	bh=D+oqobHZul7IGSMh1fi4ozXL1JhZlHn5k2srrtl2SlE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iOlwRgiQifrHCYH8gZLfmhD3TqmwtqwsGlRzhmEwdsRFUsu91TgJ4FByDdxpfZlJJ
	 h4sozoKv2jnShDx8xs3wXEuITS1V+C0PSl01ROwlISzwtBBvKaxy/nLl4mSsujT1BG
	 8P68jFA89vW3dBMcO/ENoI+2qYY5ytG55L6gQuDtlQyDdBi/w4rHYrDQSzbOsk2uME
	 /Z2qdBgTt/s1ncXEbMuIm2QIIQjr5ShIMPx/pU/vrrmIj+JEcP7MbcLQhCi6DmB1Zw
	 x6p0h4txnlsDh8wab2PO0tLF015yexS+iRsYqc4vjM6So0LK6OrqGDDEn72DgvOlS9
	 5UHKj6vXAW+tw==
Message-ID: <sashiko-outbox-171722@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/11] hwmon: chipcap2: synchronize ready IRQ state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-11-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-11-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:41:26 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] hwmon: chipcap2: spurious completion due to threaded IRQ schedul=
ing delay
- [Medium] hwmon: chipcap2: spurious alarm IRQs after regulator enable
--

commit 14087cc4e23152ff414e4188a7fe5a671a791a15
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

hwmon: chipcap2: synchronize ready IRQ state

The ready IRQ handler can race with reinit_completion() in the enable
path. In particular, a handler from an earlier operation can complete
the completion after it is reset for a new operation.

Use irq_lock to serialize access to the completion and process_irqs.
Disable IRQ processing and synchronize any running handler before resetting
the completion for a new operation.

> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
> index b3b725cc7224f..00f62a33d4637 100644
> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
> @@ -123,6 +123,16 @@ static int cc2_enable(struct cc2_data *data)
>  {
>  	int ret;
> =20
> +	if (data->irq_ready > 0) {
> +		scoped_guard(mutex, &data->irq_lock)
> +			data->process_irqs =3D false;
> +
> +		synchronize_irq(data->irq_ready);
> +
> +		scoped_guard(mutex, &data->irq_lock)
> +			reinit_completion(&data->complete);
> +	}
> +
>  	/* exclusive regulator, check in case a disable failed */
>  	if (data->regulator_enabled) {
>  		scoped_guard(mutex, &data->irq_lock)
> @@ -130,9 +140,6 @@ static int cc2_enable(struct cc2_data *data)
>  		return 0;
>  	}
> =20
> -	/* clear any pending completion */
> -	try_wait_for_completion(&data->complete);
> -
>  	ret =3D regulator_enable(data->regulator);
>  	if (ret < 0)
>  		return ret;

[Severity: Medium]
If a power-up glitch from regulator_enable() triggers an IRQ, could the
threaded IRQ handlers be delayed by scheduling and run after process_irqs is
set to true further down in this function?

Looking at the rest of cc2_enable():

	data->regulator_enabled =3D true;

	usleep_range(CC2_STARTUP_TIME_US, CC2_STARTUP_TIME_US + 125);

	scoped_guard(mutex, &data->irq_lock)
		data->process_irqs =3D true;

Since there is no primary hardirq handler, the IRQ subsystem immediately
queues the threaded handler. If it is delayed by more than ~1.25ms, wouldn't
it observe process_irqs as true and prematurely unblock the measurement wait
by calling complete(&cc2->complete) in cc2_ready_interrupt()?

[Severity: Medium]
Similarly, is it possible for the threaded alarm handlers (irq_low, irq_hig=
h)
triggered by regulator toggling to execute after process_irqs is set to true
here?

If they are delayed and observe process_irqs as true, wouldn't they
incorrectly fire an alarm by unconditionally calling hwmon_notify_event() in
cc2_low_interrupt() and cc2_high_interrupt()?

Should there be a synchronize_irq() for the alarm and ready IRQs before
enabling process_irqs?

[ ... ]

> @@ -510,8 +520,10 @@ static irqreturn_t cc2_ready_interrupt(int irq, void=
 *data)
>  {
>  	struct cc2_data *cc2 =3D data;
> =20
> -	if (cc2->process_irqs)
> -		complete(&cc2->complete);
> +	scoped_guard(mutex, &cc2->irq_lock) {
> +		if (cc2->process_irqs)
> +			complete(&cc2->complete);
> +	}
> =20
>  	return IRQ_HANDLED;
>  }

[Severity: Medium]
Since this check happens in thread context rather than hardirq context, cou=
ld
a delayed thread incorrectly observe the true state here and prematurely
unblock the measurement wait?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D11
