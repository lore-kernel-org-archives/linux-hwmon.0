Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2C2030A;
	Fri, 22 May 2026 04:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779425917; cv=none; b=sI/mBmoO6tTf07VNU9pmcCSrKP4oD3UgSmQx95CGccxjIWigNBcEP9/+Eq5JikTrZ4x7zE/g4JUbHeaxDM7yf65OaNjnoUI70nVb3ErhJiNVeC2nIteFIhTalxeB9PnuILyaryKVYneJ8vL00iJJHDPGlDbbe8t9dLr5y1azOBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779425917; c=relaxed/simple;
	bh=Vdq6HxNIIYOoAy0xIPkR2FS/hD3MeFYBG2bF0UDUDVs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MzKJSbNiiTPpozF/7m3T73MUeXh/QFuQfUqSdIKCLKvPmRqp2XGX3DHkB70ApNjn9ymdeFcgHB8DVapbvbW4PssttxJt7XH5/wt1bbo5vpInH4Fe+C0gfAEvFdrPadb02lXstCDotA3JqkQwUVYr2XSthxrOSIwTOH+aAMhTRxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ic0Fw+1G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ic0Fw+1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706CD1F000E9;
	Fri, 22 May 2026 04:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779425915;
	bh=EKJpuSzusa+V+sgDvtjQZPi8LVH236oqJ/RJL6yQTOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ic0Fw+1GQej7lTI0QLOU7LKxI0kChhSaGVv5gAUnzrMB5A97zaq3mWZfztUGsX1wK
	 /eFGI66xCVXwkFPRDmWHwCVfKx0WwcvDIcFgTZXOs0N89P/6x4OTi9RQtAHMSxFt7L
	 yxsb6LPJkktS0QKMQS+NPkysLo/kaTe1pIihQDCacl1iIILZpZrAcL9cOF0JUt35Ia
	 F8faEkg+XTvwmvm7LKqJeq9y8J3ZjhOWl0dYFvDTqXlfRQQewqdprHS3jMDj4/jVoe
	 EuFbkLDSHJychFPVEN489QDVVwIIkZIaLgAqvmX5KUIEy2YmA8l92xq81bx+M0x+Pl
	 Li350T8U5wz0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 1/6] dt-bindings: pinctrl: add NXP MC33978/MC34978
 MSDI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522044855.1772639-2-o.rempel@pengutronix.de>
References: <20260522044855.1772639-2-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 04:58:35 +0000
Message-Id: <20260522045835.706CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add device tree binding documentation for the NXP MC33978 and MC34978
> Multiple Switch Detection Interface (MSDI) devices.
>=20
> The MC33978 and MC34978 differ primarily in their operating temperature
> ranges. While not software-detectable, providing specific compatible
> strings allows the hwmon subsystem to correctly interpret thermal
> thresholds and hardware faults.
>=20
> These ICs monitor up to 22 mechanical switch contacts in automotive and
> industrial environments. They provide configurable wetting currents to
> break through contact oxidation and feature extensive hardware
> protection against thermal overload and voltage transients (load
> dumps/brown-outs).
>=20
> The device interfaces via SPI. While it provides multiple functions, its
> primary hardware purpose is pin/switch control. To accurately represent
> the hardware as a single physical integrated circuit without unnecessary
> DT overhead, all functions are flattened into a single pinctrl node:
> - pinctrl: Exposing the 22 switch inputs (SG/SP pins) as a GPIO controller
>   and managing their pin configurations.
> - hwmon: Exposing critical hardware faults (OT, OV, UV) and static
>   voltage/temperature thresholds.
> - mux: Controlling the 24-to-1 analog multiplexer to route pin voltages,
>   internal temperature, or battery voltage to an external SoC ADC.
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522044855.1772=
639-1-o.rempel@pengutronix.de?part=3D1

