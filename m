Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7571FC7FB;
	Tue, 16 Jun 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592856; cv=none; b=RNNvUAgggEZhwTzgDrMYyxzSiYQeaq2yb5shVj4GW6WyG4Iss17A3hyUH7sacepZaOOKKlePvZuI02c9Ij3MEEsjWCnwk3Xaca6dTx75pZQPO/aKepICliHzM8ZKENtkFrFl9mGkk3RZ+gZL3sE9d/FdK0thbs9CI5sLz7wHaFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592856; c=relaxed/simple;
	bh=GUSJQRLUznf3n0MGikvDw8IJm+eWT3FkRJ1WZETZy6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q14BCNJdi/WrJLyMNeyPaRROuxXvK8knk4o1AVSggPVsUVHRjg++/4lqm35EHtzFyrrM3eI5zkFCqw8RP/bjMSRSeKrUeuwu4uvNZ2mSgZjPjAyVsjhMsUUwgXz8JP944J3FBd+X/6D3XCpJxozN/y+CCvZ6uDO0Vz/eZL62JD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpZqr/Bn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpZqr/Bn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2B01F00A3A;
	Tue, 16 Jun 2026 06:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781592854;
	bh=GUSJQRLUznf3n0MGikvDw8IJm+eWT3FkRJ1WZETZy6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PpZqr/BnujYooBHtqJZYjWNY0wWV5kvFRK8cwb6tFf2f4YeIWH6b7wINZUzePLSUJ
	 djlVzAtnbi7Nc0Z8w+FZcQXz9Un6lxEsO6AN+FzGnh8EBxyCmm0akqSH+No92MEdF4
	 ppLz2oL1lFacgleRseSaF5pmEoYQHW2cj8fKuMQWHPr1E7/LuPqAIqDI3oh+tgIBr0
	 /D1kpWhnpwKkItKGsW/jNnb0FQR4EOcaywOizf4c3sia0W74VDPHCYkekWP6qVa3Nk
	 j+3sQ+X5TO1lrbVtAxQuYrN7gD6zlam8ksQBxbbcazi1AOWkh73OxlKC0gB68129dj
	 /vbqwUQkuOYyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] hwmon: adm1275: Support ROHM BD12780
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <c92f1356fbf967dee3130f2eb0da08eb84800d47.1781591132.git.mazziesaccount@gmail.com>
References: <c92f1356fbf967dee3130f2eb0da08eb84800d47.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:54:14 +0000
Message-Id: <20260616065414.6E2B01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> ROHM BD12780 and BD12780A are hot-swap controllers. They are largely
> similar to Analog Devices ADM1278. Besides the ID registers and some
> added functionality, the BD12780 and BD12780A mark PMON_CONFIG bits
> [15:14] as reserved. Hence TSFILT setting must be omitted on these ICs.
>=20
> The BD12780 has 3 pins usable for configuring the I2C address. The
> BD12780A lists the ADDR3-pin as "not connect".
>=20
> Support ROHM BD12780 and BD12780A controllers.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D3

