Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58574334692
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896625; cv=none; b=oS9YQWI8WwqS/cJtaZbuRke4wSQT7iZrVybiHPUFpTBW97JLvU8L3UnxVyXLw4JZIzOzNPaBqKEhj/NgrzwA/ZWqqc5TR052GreBjgByOPpiHQPXVmqLCaBk8UOjTl4N8JgMcCy8ccB95qf1sMvoTSfdUZBhJ8TW4qJB+i9ou/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896625; c=relaxed/simple;
	bh=O9M4YuxX5AmffV4O775qRsCoKZ/1Yqwh5PfK5MESVkc=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=b8FVpcJa6NneDu4ofpy0T5J8sWh/fwDza3NuK8wN6jtO/LX9BjuigeR1L8oBgzj3sncWntD3hU0ZPYFxcf734HIqsCNz+Sl8GLrTWCdrs38Ean/mvemMF5vC9Zy4Q6oZehOReYiJhlSoBdfKeNJ2TUuvTRHeLcEyHtsDtvowpjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZZW5s/5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZZW5s/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A7B1F000FF;
	Tue, 13 Oct 2026 13:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896624;
	bh=O9M4YuxX5AmffV4O775qRsCoKZ/1Yqwh5PfK5MESVkc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=bZZW5s/5BHOHkKaPtuiaJoZaw5eZDTDs3lEcMkurJZxhNdd0Q2YZUJUVFY2b/qZDi
	 PpBqJUSHmo5+Kc2zhm9n4gQVvS+d89lJS0AMiEs0PTrlCx7GVKu50f7nKXRsdk5wY7
	 /CBJ3hX6qUsCdy4R5po9L++BqlmcFIzpXb1DbrCQJQGIHmNpjvEcgAO2wAKRhIA8yO
	 ie5RRhOnxjJMxMixLh/ITNDu26GCZ6HnFCQHbMZGAAgEQB9Lpgky7l4pOcP5OKF+0f
	 YAog6LZJLYE2tpXAJFiqGG2zU2lzSNe14IQcOslbfoFOzzbBjvlm9DjLmIp4zx0eym
	 frjyNmO1MjAIA==
Message-ID: <sashiko-outbox-169770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: microchip: lan969x: add fan controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261013125735.1542349-6-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
 <20261013125735.1542349-6-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:03:43 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> LAN969x provides a PWM fan output and tachometer input in the DEVCPU_GCB
> target. Add the fan controller register region to the hardware-monitor
> node and use the combined LAN969x hwmon compatible. Declare two PWM cells
> for the period and standard polarity flags.
>=20
> Board-specific fan configuration and pin routing remain in the individual
> board device trees.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013125735.1542=
349-1-robert.marko@sartura.hr?part=3D6

