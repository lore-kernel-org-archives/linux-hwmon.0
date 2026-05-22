Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6747116DC28;
	Fri, 22 May 2026 06:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430946; cv=none; b=WTU5NQvcJ9qh8rdISjTHOx9UB/yOVgZE2kwtm9/88NNUrWSxm1XtUw6J/kamlvvhexkhXjADpY1TFxkMl9q2fU6FodT5OMeu7nD+ShjMrjt3HdcL4rZKNa23Q8MUoEyNUN0fzi2W0VcC2aOfVCtNvwNO0SDM/NVgqq5rW+2FDvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430946; c=relaxed/simple;
	bh=gx2VIiRFwzJJCuumR5YqqQfTK9bf/9xTYaFGIfJJqRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nDUpgMKTC7vcZjvBWi0v1LUkkCwyDXjEtURQ5Ty+WiIKq7vyZRS4q9C5D0mXYZ+luaq3Zbqz7ePLf5DgCN+AlJdaZTP9AjpNwSk6Y0FohiJxfCzg79GiqiNEtcy5V9xsdAUOgSGMcF07/uRLSoTKMgMASEGcP0d4O4bHAi/foHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYsn3YM9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYsn3YM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F001F000E9;
	Fri, 22 May 2026 06:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779430945;
	bh=AaOqdFmUttSt/9AtYkxYeRkzWkqtgz8jHm2AKkIlT5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BYsn3YM9P5GExLdHreHbIthI6MQAd3j3EpcA2aPpJvt4bUNVUTuOiCE+cjZty0vQk
	 bmWGtpxfMU6lT16s6JG+p6kweSOJXLnCk5mapvtk12CZ2wRDPwohboUOWkLHx+R/j+
	 w+9wpsR3tQTnSkMBBiADJMZHw1nImMi0JzRv+yt7uBcxrjmMjC/FP20RFMXClPZ3ri
	 jeqBeBi674jZvyOrsQpcsS2XPhyn6BDmA9p0D+s5p4qj9annvyA+VopJ+KPRnqXJLI
	 j2HLYmZ4B2NUYdF9ARkkE6/fb/5iFsA1/pRhOz0cHS/tC91j7f2/zXO27Bmx7lDOJV
	 RQCgrdmB/xpnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522044855.1772639-5-o.rempel@pengutronix.de>
References: <20260522044855.1772639-5-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 06:22:24 +0000
Message-Id: <20260522062224.D2F001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: David Jander <david@protonic.nl>
>=20
> Add pin control and GPIO driver for the NXP MC33978/MC34978 Multiple
> Switch Detection Interface (MSDI) devices.
>=20
> This driver exposes the 22 mechanical switch detection inputs (14
> Switch-to-Ground, 8 Programmable) as standard GPIOs.
>=20
> Key features implemented:
> - GPIO read/write: Translates physical switch states (open/closed)
>   to logical GPIO levels based on the configured switch topology
>   (Switch-to-Ground vs. Switch-to-Battery).
> - Emulated Output: Allows setting pins "high" or "low" by manipulating
>   the tri-state registers and hardware pull topologies.
> - Interrupt routing: Proxies GPIO interrupt requests to the irq_domain
>   managed by the parent MFD core driver via a hierarchical irq_chip.
>=20
> Signed-off-by: David Jander <david@protonic.nl>
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522044855.1772=
639-1-o.rempel@pengutronix.de?part=3D4

