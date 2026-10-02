Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6244718E2;
	Fri,  2 Oct 2026 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932433; cv=none; b=XYczZEGsb0FnlCaJC5CHVOKybPHyTfXDUwPh2ZhN0XBGCcLyZTuO6zm4cD3aV0Lbth1uydENfaMI08ZMMuMS9Y+LnwWZChantceD7QGopcrf5yRO3sRBROUAWAgBvye5JIL0BVhPytAMmoLvLmp/LR8X015fZS5gSj5KQcf+YMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932433; c=relaxed/simple;
	bh=9pMfMOhNcJPfgCs14RIEmw20xBM22SCr4B+5vQrC2Vk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eCFrGJg3WG+06PABMNaWDqHIEHJmWAmRj6pX0RflyvtuiNXtGBS1J01ks6dDFpCigzNtXF8JG6Q9JcRXd/XXLXwXoHOeNiKx6CnR6SrvtvbtJC/2AcnkhUjq0Q83xPvPkLL5I+/pVoqq4fJD5RvSrNXY+Ko4OwPhJViEYoPXc0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n23laLe/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n23laLe/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730DE1F000FF;
	Fri,  2 Oct 2026 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932431;
	bh=9pMfMOhNcJPfgCs14RIEmw20xBM22SCr4B+5vQrC2Vk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n23laLe/fYznohH6vw/8QRrdMjRqLkQ2OmOT3jObpoq5GSF6rnsCxJVYLbzpPLmDU
	 w3bYZRXUSpoR3bMQqMlwBHVB0I5S5PK87gIk1AOu49uxHJagtAJDY7W1G48bStnk3p
	 Qb2f2bfQTZbB+5VOgb+6EqKTPMcAKm/JBjQGV8gNB3IH30ChVKtHAMzxXG2FSdSU6O
	 AiYuzuQtJl9mtkFXpW39vQLLoA3OQV/pUJ/9juPzwpxJk7gkMeOQBOK4DKcUfZIttA
	 BpndtNw5QjasJauxRhZHweAQMBCZAk6AvgyrYTeYIyahronUSt5i83cmnm0Vb4FZVH
	 KH/aB2Z+dXYvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:51 +0000
Message-Id: <20261002091351.730DE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Each device of this binding has a single temperature sensor: the
> internal sensor of its die, which the device also uses for its
> over-temperature protection. It is read over PMBus with
> READ_TEMPERATURE_1 (8Dh). The sensor is internal, not an input:
> none of these devices has a pin for an external temperature sensor.
>=20
> Allow a thermal zone to use the device as its sensor, to monitor the
> regulator's temperature. With a single sensor per device, no cell is
> needed.
>=20
> The MPM82504 has four channels, each with its own PMBus address set by
> its own ADDR pin, so each channel is described by its own node.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-for-upstre=
am-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr?part=3D2

