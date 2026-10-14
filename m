Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959851C35A
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984319; cv=none; b=CWV8Lc+PgzvW7Rl6atrZcq1tvOSHQ6iFv7RuCd90JIekn5FtMDc3qUwg3YYfKcOapH6hFNmP24m7X+LkIOxEI8TNslA4g0Oh0VLs2rIinEwQ6+GtdHPMn79VdE5Rv5x2BToG5N0HR6e4mujTpZqv3IlaXu2zNKwlFFff6VpS5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984319; c=relaxed/simple;
	bh=Qo0cRC56gtHheRZc9j72DNXzZhzEqiXSNiChUcQU9yM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Fq6IHGhGDnSlhskXU9CxbIOswKZ2VY3A4Cl02lXybaCPrUrYZj+mwrsoeZJnLfQ4o0Vgwh6QAQJWd5YCvqVO6oPrLIPPQUqOtSDB/I9BMWNyadScnX76nynedeTVgriY3H1vUuCY5/p5pax9El59KPKKrk4xt0gfJ4JcWWRRyTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXx55OOc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXx55OOc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7737E1F000FF;
	Wed, 14 Oct 2026 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791984316;
	bh=Qo0cRC56gtHheRZc9j72DNXzZhzEqiXSNiChUcQU9yM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UXx55OOcQVTFCLCEIg8CD3/d0peRtZGfVcoasDNJpCbg8zlsDF7D0sSxQZsNZjFUL
	 D/nHaQnWYQc4FZrCoT1ElFkKfyf8aGvTbxSZvl2XRXYDOxon+kd3lfMQD6TLI4uEOA
	 EP4z2c1MtiO1QtKZ/QFXSNtLDdo/piGiWtz5hNfJ1lz5YUpH62tsj7iCsQHu1/Z1ni
	 SDdFtl2pSxxUZAXXpMk73mdg5gd18zGGVC4CxCS7tfSRtS2ugRx+o2uibQtNjDnuTr
	 rzOzWpc7MES+trUpSqDo0WKz8nk4A9pGDFXL9V1H4W6zD5tFU51dDvjy1bEHF2VqG2
	 NbeVcbbJz8WLg==
Message-ID: <sashiko-outbox-171349@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014132315.4659-4-okerixx@gmail.com>
References: <20261014132315.4659-1-okerixx@gmail.com>
 <20261014132315.4659-4-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:25:16 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014132315.4659=
-1-okerixx@gmail.com?part=3D3

