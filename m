Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F8240DFC1
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688062; cv=none; b=Zje770Z2UZEBDi6x7arfFRfcj9GWs6V63JIGO/22Y9nlWSxC+4cmaKIuGZgFmVFbp6xNCNnSx0VSPkNdyAgp+aUBJOa+5COW6SbNi2vn6N2reVcZwa+gH2jmbLQdkzIMTc+TZj8r8njReBhdsTTijRlNOP3XqxbaA6UZHoTuTn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688062; c=relaxed/simple;
	bh=6EcN/TZasrXpOc4QnFmZeOhBJDdssaJcwOfFFfx7hJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8J6qW83N9K2ziYfqHXHUZ1+IVJrcx8HZOwAIFCYEdfAsBt85URR3IPq3zehiiOJdZXKOKR+sdIlMgGMWczvIvIEfJioT/sYEsgyxYebKMHeQh0RbtLkjzv8Sa0qEpw1iIE9ittvJEnnHZsVAGdGSnsh7U0BJIppePMkP33fSME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=IxtdpbbR; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="IxtdpbbR"
Date: Fri, 10 Jul 2026 14:53:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1783688046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1nNPIOy+vk1eS1mBs5XE7gdt5FtCACODKoLi7FSYZw=;
	b=IxtdpbbR0TvI9QSjsenyMNxYxm8IVpkuwJX2RJCc4+KDOETBEKnKKGv2Ua3O/3EEz1vH1N
	GD1OVSXLCWQrpzyLxsKpytRN+jXiMdvevNphKXvXZ4V1r+0isppxKGxeLbodYHbdlBbAw4
	kzqsPu5z52rffmlakP6VAdwB+i7c7Ea59XG6xFZ8qLYG1mSSCUi6BgOSqJ4DHqmgD0B02W
	VGJVSblf+0pUnzColAtt0wwNPBZ8wcqhRvHSqWUoUBQRnIJu8gCwMhYsBM98i6QuBcaSiK
	JvxWn8riIAtsDpEMuQwaNUecED1EDYKU3o0nwOuvfh6uoNbrJCZ7Y+nyzUxYnA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 6/6] mux: add NXP MC33978/MC34978 AMUX driver
Message-ID: <alDqEXnZmejphvio@pqrs.dk>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-7-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710101358.2606941-7-o.rempel@pengutronix.de>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 10, 2026 at 12:13:55PM +0200, Oleksij Rempel wrote:
> Add a mux-control driver for the 24-to-1 analog multiplexer (AMUX)
> embedded in the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) devices.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

One small comment below.

[...]

> +static int mc33978_mux_set(struct mux_control *mux, int state)
> +{
> +	struct mux_chip *mux_chip = mux->chip;
> +	struct mc33978_mux_priv *priv = mux_chip_priv(mux_chip);
> +	int ret;
> +
> +	if (state < 0 || state >= MC33978_NUM_AMUX_CH)
> +		return -EINVAL;
> +
> +	ret = regmap_update_bits(priv->map, MC33978_REG_AMUX_CTRL,
> +				 MC33978_AMUX_CTRL_MASK, state);
> +	if (ret)
> +		dev_err(priv->dev, "failed to set AMUX channel %d: %d\n",
> +			state, ret);

Especially for iio, I can imagine a consumer might keep polling even if
the mux .set returns an error. So maybe ratelimit this print?

> +
> +	return ret;
> +}
> +
> +static const struct mux_control_ops mc33978_mux_ops = {
> +	.set = mc33978_mux_set,
> +};
