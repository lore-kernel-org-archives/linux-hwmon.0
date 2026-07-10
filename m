Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53403B42D0;
	Fri, 10 Jul 2026 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678773; cv=none; b=p7TEsQX/f0vPi5ZvdrztK03NrOBG5jxPlO5BbL7sZmeqbbsrblgegTAF+UekFXaPJu/YPLZm59B+KtfdL6pPntEsnuGeXvNStn1WaM6L57hqvsRiRXDF5YcHmkqE08gC70TYBiWiNTlD1zGzQzKbhWf6E8N8QWQC84YAS2+3hSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678773; c=relaxed/simple;
	bh=BMEFcFqnARXX4uQ6P3W2DGl2rCPSwRLxyAZcgBRSgcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OaRKz4WnZcEwLtEIAF68Ij+H8ijG7srYU8+c/8sGxTjH8yJt7ttrzgrVv4XnfDO0w0hUv4FZfo7kHX1JI52K4QSZpHyHEviXL89FI75O0auuI/zcDINeWLDyyYvfl0NJt3FhcbIO5nM8gCjAjvPLMNuvuVPvLcl/nsP7PdUlYoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAvJ0toL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAvJ0toL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377571F000E9;
	Fri, 10 Jul 2026 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783678771;
	bh=VXvooDsa/oSKp3LXSUTLKZSLRWaUs4sZ7YykAHui5Zo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hAvJ0toLaudWCiJr+/A6TCM8PTskph+cOGgszTVQjbp9LDfyHyOLu8+B2ssBL0Tm4
	 syYpkX2P2LiU/7IlJ+EEGJeIOlbHle7/VpaLSGw8d0BaSrG3Q66xv/68J5UpJ1ixXn
	 t/V9f2Mo+zp0f7SzrdAjlANZdT2y/2SqcDb5ddQsPGRVQ50mme1mAlfB68y6knZbjR
	 W5z0IP+2BGOkS7lpWlVolI7FKDmBaS58vRSWCe/uYMf0qvEzYawtFyipeLL+GKBHCK
	 TIfyy/Qc5zPpy+qYbQihcQzaagnz7R4YvSDSy1JEgmLpo1de0/OYzm1XRk1A9yGVtZ
	 UnqfKJqTqHmfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/6] dt-bindings: pinctrl: add NXP MC33978/MC34978
 MSDI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260710101358.2606941-2-o.rempel@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-2-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 10:19:30 +0000
Message-Id: <20260710101931.377571F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710101358.2606=
941-1-o.rempel@pengutronix.de?part=3D1

