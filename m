Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C01223DFF;
	Sat,  3 Oct 2026 20:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791059148; cv=none; b=ZSzYHeTXcY+dqQermE+Vhd6+1D0ELGyZiAXoveviIAZ2dj1BlnFSS8fUjZ3Z71tMYFQBwNA0OHBpZ3SfQxKhg8oIgPXeCM19sYQ2C82s9I2TYHX6iH+MXcY4Qg3jwJzWICRaSIWBPYbx0rMGMOe5aSBQFj9exa1uZ7zf8U/oU9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791059148; c=relaxed/simple;
	bh=9nYeaYPrmwg2Tr/29z+6zt72Muz6DM+SfzA3ZOFL8as=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ABL070pAvwy9JtZPL7b5f1PFS+wLG3MQAXYamTaIrm34g2KLi1CzfInexxQbjlcOGhLatBHuRIkscY7xfJ+uwrxG5BNVLyDEwRKzEmVesvOYXnWPuwlyCKtCU22N4mou6MsCunoUNvMauRTFXREmOMgHZiMZkTrE1ALIiH9k1N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYnvGDCU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYnvGDCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E931F0089B;
	Sat,  3 Oct 2026 20:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791059146;
	bh=9nYeaYPrmwg2Tr/29z+6zt72Muz6DM+SfzA3ZOFL8as=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZYnvGDCUTdkDVmWTWsPzAdw43Anhlw/Vwdd8A2//cfljH+9VmI3kjss5mRm1mLvni
	 qYzOYV6JXZyPdPZSPul5jJJ5WgkPZ9ZbZj7v0App4IUNgC999wUTOY/j77Xv8peILr
	 VLMKzZ9zXUrj7FZQs2gkPf9mx3mAKa1OTsqR+YZyti9tThFEFGYA/H9myF/5g9BZUm
	 KWT5jOG5w+Onm5U66fi0cgCYbkJFfrV4JqKwxHQFj/ggbocf5rjZe5ZDrQZYoistab
	 nfQvKv4eC1rtc8PGUHg9sRpT/EUTZTTjsHtWpoP0yoagxe9k3ecQLK8Mvr5NflckmA
	 zlVOAKlpgeuVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261003202143.4697-4-okerixx@gmail.com>
References: <20261003202143.4697-1-okerixx@gmail.com>
 <20261003202143.4697-4-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 20:25:46 +0000
Message-Id: <20261003202546.91E931F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors and the CPU fan speed, and drives the
> keyboard backlight. Its interrupt line is TLMM gpio66, falling edge, for
> which the file already carries a pin state.
>=20
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
>=20
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003202143.4697=
-1-okerixx@gmail.com?part=3D3

