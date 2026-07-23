Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB4142AFB4
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823856; cv=none; b=dHoTnsKKmO8z6lVxYwtyt5I56ekDskd+mPVT6zIuzn9ISrv/nNW26jto9hJOJa1HhTI65+7p1h3pKAVmoLpN1k39+5riHk61Mch5eR8NrnDVPilBaPP4sKLjKJf2zKt8smPyl+qVe5YB1YzoXkJqXkfJROFtSmRny54TDG/iwgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823856; c=relaxed/simple;
	bh=aRbNtr5GOOj+1XW4RbJIFRChUMitfCzYkn4XuG7fiN8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C5wGiojVhDUxRd9K7W+lQ5R2VZPEC7TgmJ2WXvnPtWqltHgoq3tZXw5ZeyEdV3x1nOvGyLz2xV5YWRLGcgRQFObQywaRz0OQLGQjbI3gyuTKN+augUynnGOjqznd9hQXRw+FtBHLzX0tUgvCvTcPP96Q2sRFUA9ZHx7udC2sXwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=INLcYNEp; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="INLcYNEp"
Message-ID: <a79b2fd8d08d4594bbb472b005534d7c91d86e49.camel@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784823836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aRbNtr5GOOj+1XW4RbJIFRChUMitfCzYkn4XuG7fiN8=;
	b=INLcYNEpHB13hBX6kVFBjCQSLteRPRKhLYt98qDAKO4tkMkerXHrM92yYAig+nTSvpv160
	L5uQkNKrWobfYAkZJnhIGuwpBA5HQSCe4oBWM2dIBnAldhsqjYtw1D1KFnVhcIl4W0HsKi
	sPT5e/ge7U0JKKQbbtYCDRpRM+FpX5k=
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: adc: add maxim,max40080
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Siratul Islam <siratul.islam@linux.dev>
To: Stefan Popa <stefan.popa@analog.com>, linux-iio@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jic23@kernel.org, andy@kernel.org, 
	nuno.sa@analog.com, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, dlechner@baylibre.com,
 ciprian.hegbeli@analog.com, 	u.kleine-koenig@baylibre.com
Date: Thu, 23 Jul 2026 22:23:39 +0600
In-Reply-To: <20260723065036.2683075-2-stefan.popa@analog.com>
References: <20260723065036.2683075-1-stefan.popa@analog.com>
	 <20260723065036.2683075-2-stefan.popa@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT

On Thu, 2026-07-23 at 09:50 +0300, Stefan Popa wrote:
> Add device tree bindings for the Maxim MAX40080 bidirectional
> current-sense amplifier with a 12-bit ADC and an I2C/SMBus interface.
>=20
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
>=20
...
> +
> +title: Maxim MAX40080 bidirectional current-sense amplifier
> +
> +maintainers:
> +=C2=A0 - Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> +=C2=A0 - Stefan Popa <stefan.popa@analog.com>
> +
> +description: |
> +=C2=A0 The MAX40080 is a high-precision, bidirectional current-sense amp=
lifier with
> +=C2=A0 an integrated 12-bit ADC and an I2C/SMBus interface. It measures =
the voltage
> +=C2=A0 across an external shunt resistor and the input bus voltage, and =
stores the
> +=C2=A0 results in an internal FIFO.
> +
> +=C2=A0 Datasheet:
> +=C2=A0=C2=A0=C2=A0 https://www.analog.com/en/products/max40080.html
This URL links to a product page rather than a datasheet as the tag suggest=
s.
Would be difficult to fetch using CLI tools.
Were you supposed to use something like
"https://www.analog.com/media/en/technical-documentation/data-sheets/MAX400=
80.pdf"?

> +
>=20
...
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 i2c {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adc@20 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compa=
tible =3D "maxim,max40080";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0x20>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #io-c=
hannel-cells =3D <1>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shunt=
-resistor-micro-ohms =3D <100000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0 };

--
Best regards,
Sirat
