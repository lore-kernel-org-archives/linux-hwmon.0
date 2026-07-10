Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8839C3F6614;
	Fri, 10 Jul 2026 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679051; cv=none; b=pJaz2DtRu5c1tC2hNRQlnvt/F/YRs4FleuaZklLFOc31u7xZ9NQf0GNDb2gjrcGGFgjicAGyglrYzkEwXgsMajBrVugYoYCHLJB3VVnnjQYg0wuMgl4T61qQlbTrZpS5kwOicgVDI9o/UDYOlYUByeBFi+gvfjs4ytwZprpGFxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679051; c=relaxed/simple;
	bh=bo21OBrlFjCmVNqzGA1qH7QgO0d74Et0nkeqAZsH4qc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ox6sJhxOqltt4AkG8YWtgChnvlOxuiGWAr9F4iPYr0bFbsTSrCQRicPZrZqbpZ6Y8hz9jwQ6zKuWMkHjcMnw5RsuWVaXOFwoHXjijXb91D/+ePnrzCj9F26Gy2gD2JivxsQ5Nlw+MgHtSkaf46PXUbHDdLP+3Cq8zflJYK8qhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXqFCqpe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXqFCqpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD25A1F000E9;
	Fri, 10 Jul 2026 10:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679050;
	bh=VTOxGEOCXXWj8EOtNzY6fQer5HlZlxQHAwL/IcKoS0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXqFCqpebzXsNLylUKmrSfjmAzLDT4olFxEdVQ6MnV6FCXNQqA/5VkwXsLADX3JQy
	 nH+dXd9Jn5iUDk+zcxeIKpqoAg+oP2MwpK7VwaAv+zycZLHJpLjImQMCjYGQ5w6une
	 LxNTUn8mCb/W7VRC9hsVFl0UwNykEB0HS0LIkVMmHZZfdg5yoZj9jUoAPXOq/TsfEf
	 wBR/3+BW81FTOuWz1mogif69aEvoC2T7YsjcdgRX6KqHMjIT3606I/ITS+g5uldiem
	 /vF+++7h6OkrJQz9/Ml8eg3EszUNpv33NDgwitgdnd+R8GRMJcCdShwuw/HlFtYth9
	 HWaUC52uGUPiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/6] platform: misc: add NXP MC33978/MC34978 core
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260710101358.2606941-3-o.rempel@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 10:24:09 +0000
Message-Id: <20260710102409.DD25A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant initialization of `irq_lock` mutex.
--

--- Patch [2]: [PATCH v15 2/6] platform: misc: add NXP MC33978/MC34978 core=
 driver ---
commit 7429a33c25a8a05d13819baad0143ee08fe7eb8c
Author: Oleksij Rempel <o.rempel@pengutronix.de>

platform: misc: add NXP MC33978/MC34978 core driver

This commit adds the core support module for the NXP MC33978 and MC34978
Multiple Switch Detection Interfaces. It handles SPI communications via a
custom regmap bus, interrupt demultiplexing, and event processing.

> --- /dev/null
> +++ b/drivers/platform/misc/mc33978-core.c

[ ... ]

> @@ -759,6 +759,8 @@ static int mc33978_irq_init(struct mc33978_core_data =
*cdata,
>  			    struct fwnode_handle *fwnode)
>  {
>  	struct device *dev =3D &cdata->spi->dev;
>  	int ret;
> =20
>  	mutex_init(&cdata->irq_lock);
> =20
>  	/*

[ ... ]

> @@ -1146,6 +1146,8 @@ int mc33978_core_init(struct device *dev, struct sp=
i_device *spi,
>  	cdata->spi =3D spi;
> =20
>  	mutex_init(&cdata->event_lock);
>  	mutex_init(&cdata->irq_lock);

[Severity: Low]
This isn't a bug, but is it intentional to initialize irq_lock twice?
It is initialized here in mc33978_core_init() and also inside
mc33978_irq_init() which is called a few lines later. Doing so creates
two different static lockdep keys for the same lock.

>  	spin_lock_init(&cdata->state_lock);
>  	raw_spin_lock_init(&cdata->irq_state_lock);
> =20
>  	INIT_WORK(&cdata->event_work, mc33978_event_work);
> =20
>  	mc33978_prepare_messages(cdata);
> =20
>  	ret =3D mc33978_irq_init(cdata, fwnode);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710101358.2606=
941-1-o.rempel@pengutronix.de?part=3D2
