Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A52EC08C;
	Fri, 22 May 2026 06:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432473; cv=none; b=suR21l2leRKCa8mea+R8Dq4m3qm8JnqJJwo/03rEeykrXYr2GOPMRv6Hu32+ujq/h1aexdiYXcZy17AYbglMLJMm1+2wIlsrR0GfiZoZHVowZqDpr+dmv4ahmai92UBYRwkrM9C0hDYhMrO1VabpoGYZPVa5SBS+Llyai+pD42Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432473; c=relaxed/simple;
	bh=m7UOauPJ2V72k5KA66WV4GSuitUg2G8KkRPaMl+IPdw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m1v0UtlcAEm4yJ7IfbKk41JlcsKKzQxCSvF8e1E12gkisj8immMIyR/YpfnFPvg6bDx0TWWcy60V74zChx/IEZ9T0CaOSrUDVCxMXIo7yVxdWX6HQ/xc3cyBWWGeYRSbYdvN7GObrT3rtH+GcoclWviYWPUGByvjawBCF4EMEeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOaC7qxQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOaC7qxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FE11F000E9;
	Fri, 22 May 2026 06:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432471;
	bh=dM8fcdGWrFGaeHz3dUJlNu/LaM96WKoReFuLdtM5syw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OOaC7qxQRty0yjtHcdWnBonXONW+WgEJ47y9Yv8dIrQg0iZonTXtQKZKz6VhW93X/
	 KGNMCE7BB57wSucJAmTw7KxRCKDVe1OZd3S+u+sTDVkWVtKaNdTEpysYbkARIDnP/6
	 MCyO20crUawrmkG+bRml4eXgpLi3aIO7PZWBOm+RYHJNu8FravEfnXXdo7Frphfink
	 6QeLiW94gyFp3qHqYQmdRXr+HjkXVq8pGORIHiQA3yIp4rFkQEi3n9J2WpLxK8Z3G+
	 1S3Aoj8vWaBMHCrvbGx9DfhsbIICIW5b+3HpMlwcL9AIb0haygc97jDEDqp6FJ1Wfa
	 18105aT803BGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 5/6] hwmon: add NXP MC33978/MC34978 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260522044855.1772639-6-o.rempel@pengutronix.de>
References: <20260522044855.1772639-6-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 06:47:51 +0000
Message-Id: <20260522064751.B2FE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add hardware monitoring support for the NXP MC33978/MC34978 Multiple
> Switch Detection Interface (MSDI).
>=20
> The hardware utilizes a clear-on-read FAULT register, but physical
> faults remain asserted as long as the underlying condition exists. This
> asserts a global FAULT_STAT bit on the SPI bus. To handle this without
> trapping the CPU in an interrupt storm, this driver implements the
> following architecture:
> - Requests a rising-edge nested IRQ (IRQF_TRIGGER_RISING) from the MFD
>   core to catch the initial 0 -> 1 transition of the global fault state.
> - Caches hwmon-specific alarm bits and calculates state edges (XOR) to
>   isolate alarm transitions from system integrity faults.
> - Implements a 1Hz delayed workqueue that polls the hardware as long as
>   any alarm is active. This compensates for the edge-triggered IRQ by
>   discovering secondary faults that occur without a rising edge, and
>   detecting when the hardware clears.
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522044855.1772=
639-1-o.rempel@pengutronix.de?part=3D5

