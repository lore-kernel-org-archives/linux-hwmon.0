Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004135;
	b=tAlyXdoOVkyHi7mkwiY+ULvfjeON0Da60mHYjZpQZrIQTQLt0Uz3K8mpCma7qa9D5M3R
	 8IOTJTL4jom/h/+k0zwZePnyX16Z6V0RUifLzMAx6CTUx3AZPCaSL1lg3KmryrMBHbSKk
	 PK6ePC56aXn2+wJNlC/36hbwZBffNTZw5ARiY2WHh2x4nyOxc3MyLsl7N55QWHl7idy1U
	 ptmzd9upUfytWf/lWB+uxz+V5qYoAMBi5Suy6Z0PrYW1RkAqLaQ2BZk+CX5dsPiTpGXXL
	 wa/b5A2c2XTJ5bITPF9GwxWk4LNSXr6vBcevEb4wikiloTumMQaVRs9OjplIWvQoYxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004135;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0zj1XD0Ryut6A8MOIvqJTirhV6XFNyu6qbDXF72aYUk=;
	b=cA858vcYYvMU7WDMr5Dh5l2m+qTAwz1lq+a1FDJbV5hak7VzUJi4/fVR7qUragJmfO2p
	 tBlUCJ7dd5iouZpiwhIw3HdByXjGZNA2E4N9wnfXmllbpMm9URLMIXOIqIBkNnkpEbxu2
	 wv6wNtI5Ak0iaE7khi8qRwF6AHs0OxZOJ+pRIMf93ADf0o81QsYdXS2PjIbO6+brSwMJL
	 orWrFXnCwNmr7Q8ukxKO0qdXXcw0OpI1j5Io9hSkjT+7RDRGa1jTZvGrpCW3jwWDmMTgQ
	 imtYdX3FoEEU8n+65JbG+ClKt2NoYYZQWbw7f8Nl/Fmba5H+82i42uQP5icKtfYEHag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=4dkduU9N;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C317606A31B;
	Mon, 26 Oct 2026 08:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C317606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=4dkduU9N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=0zj1XD0Ryut6A8MOIvqJTirhV6XFNyu6qbDXF72aYUk=; t=1793004134; x=1794213734; 
	b=4dkduU9Nv1GiveESi7k2Mtd8JCD8jd2HsvID+EE0Z0B2cVMEt5jmxJM6vaQNThGzI0cSPomcNv+
	7x3ctJHtTTWG99jHdfU+5zLrnygXkXBtM5+sVVCfkaPgGQlPuOquegHcQq5XUXmtgSsWvBJqw9z5X
	PhJ7APopgmHAOjfG1thDAHjS/dTQmdMsf0b0nr1N4o6BPRSxvQ07xi9ZZF8Gvn62TdgJePl1RmF7K
	kZlTYYCN+/cOE39ln4781KJbFsjFMwWZeuCY3kxXoIfhS5pyeFyA0CtmSN5Z5+6nacuO8lg2SiQzN
	ONa5XURvZTQRo7qYFc0Pr8UvxHFdFGOSH3cw==;
Date: Mon, 26 Oct 2026 09:42:06 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <20261026094206.2d1e45e3@kemnade.info>
In-Reply-To: <20261026003918.155321-6-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-6-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 00:39:16 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> The separate hwmon cell enables VCOM at probe. Report the temperature
> from here, as the TPS65185 and FP9931 drivers do, and under the chip
> name as they do: read it while the rails are on and return -ENODATA
> otherwise. Boards that need the rails on mark VCOM always-on. Drop the
> hwmon driver.

This might deserve a Fixes: tag as it fixes a race condition in probe.
But then it depends on the 4/7 patch, so it would be quite massive.

[...]
> -
> -static int sy7636a_sensor_probe(struct platform_device *pdev)
> -{
> -	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
> -	struct device *hwmon_dev;
> -	int err;
> -
> -	if (!regmap)
> -		return -EPROBE_DEFER;
> -
> -	err = devm_regulator_get_enable(&pdev->dev, "vcom");
> -	if (err)
> -		return err;
> -
and has depended on the regulator being registered first, otherwise
a dummy regulator would be provided.

Regards,
Andreas
