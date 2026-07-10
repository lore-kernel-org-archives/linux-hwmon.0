Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1EA4071CD;
	Fri, 10 Jul 2026 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679040; cv=none; b=MPMI133mq8Y51Rw5UnJXzou5I2ktJ4WERLv7SLx5cLRfAxDFadWHCFkAPHeVbasd5HjDog9F4Ni+Yo2xrN92hVCyxZLtqDP1qt71m/WW+g/yPf7OnA/AqUxAoKWDqgZRt8V2DXTwl2kHIYuwDrOXbD2FzDX4FKrOPAVB7kjAAqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679040; c=relaxed/simple;
	bh=YWdwOv/FECcuwbuvCl/6H70RS+kLkiN4S24Y4v3LDQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jfDjHohQHZhu/tEEEsdCaHN7AJxzEC1TcBY9C4NPU5Nlj9U4Ru4mXHfOHf8dlfQwAfqCK/PBKFxeWOQvu6SCkoGwAjv1BgB+HDxCshGAOqrIpLVGvK2dHMaqY9CiI2uo4PsjGa2+zn9+d2QzcPoCzwa9vc3gi1s0ur3DC4Tb53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYHONvDB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYHONvDB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7F21F000E9;
	Fri, 10 Jul 2026 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679038;
	bh=VG0DEz5PkOQ3kpIr0Daidr5wsf5H5nodEeYA3iGfdOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dYHONvDBnoonc8pmbHYgkIledSlv5QOTZAiIml2mKtPI4vH6p5kdhx/rr3SCr17pe
	 5uB9Bh0H/YzG3sHEYRZ1RWxZhN1We7PwTOOAxnuNu7uLHUctF4RJssjHUpVHUhqd+S
	 DmxRjIIKaq9vB4PU2IjZ57CjxyUimme8seRiP4GW5iHtrfBRY3YeS27kZABcPLbz9y
	 l/FRgBmnfmyK2v3Gm8qJgx6TvnboR6vC5TrAdfY/nD/NhBN8ga8jDxjkW4u0r2v+OA
	 2rPZeGVM4nckKFvepm8PmV0o+gJuDGiIp5pR87eSAg4U/v1xCpPdd+LgJyb7hkj38Y
	 xOl5KRYRliTHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710101358.2606941-6-o.rempel@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-6-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 10:23:57 +0000
Message-Id: <20260710102358.0D7F21F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710101358.2606=
941-1-o.rempel@pengutronix.de?part=3D5

