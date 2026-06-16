Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7A1FC7FB;
	Tue, 16 Jun 2026 06:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592891; cv=none; b=Z27zM33/oGdbFpwJA7WSWlCZ3kMJsu3I8+4fYe4lpysV9Vk1kPIgcCiIVCsCDApgrz0uYAzIBfw3voDTfPx48SlXbmFclquVaud/i9usjHcnVeCoFsnRH0bVs1pn/C1fzBtGYkF7f6cZ1DxSJQX0R4dkNff1BKT5I0O0U66kOxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592891; c=relaxed/simple;
	bh=VpXUmHWrZIDp2H+dYkGv5mQ3jFYyEXc5DPh2SF8WQaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=smlgP5Hp5ZSs0nitaU+G2WiEUdNrxI87nYjTcxJZXU5+ppNoziVrt9ONkmKdfyMNAo7EXFlH/M0nB5RLBETqI9Tt6MunGWjtXzJlPndzX8Ysbxj6d89LxPoxyPmAPb31EqU4Aj1DQLXWYYq+IILzS5PNHwIvzDHD/jkTAw6f9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMjlT8LN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMjlT8LN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479F11F000E9;
	Tue, 16 Jun 2026 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781592890;
	bh=VpXUmHWrZIDp2H+dYkGv5mQ3jFYyEXc5DPh2SF8WQaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMjlT8LNpvcaBI4phQg7SLWKbT3+Y8U5mvkjVz76tfkCgG0XKGYYpDgUi1TT5AYM3
	 XVUeFssfHRvS3L0xRd+j56MldLmyneBvc4DiDeK5PMYOp53VoLYuLLrmeV0yead1N6
	 kPWauAr9TcBfToux1NRyQ4rrwJx85YEXv8Uiz56UWsM2JbqTswmPVc6RlMMzn+KPeI
	 K2x2ba4Rf5KRAdioVWzfFBzlwX0v2dEjn8U8aeYX4ZSY8DDE2xrFOPvNTmyKSykrsb
	 RkYNQv+uuprlM6uB2Y5Q9LVvYiItCOD77x4mWQiv72rP976l4nPzjQgWbl60hSc52z
	 JOf9b47xqtwng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] doc: adm1275: Add ROHM BD12790
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <7bfa22c245b81c8027736019aff717cc1f5039c8.1781591132.git.mazziesaccount@gmail.com>
References: <7bfa22c245b81c8027736019aff717cc1f5039c8.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:54:49 +0000
Message-Id: <20260616065450.479F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Add the ROHM BD12790 to the list of the ICs supported by the adm1275
> driver.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D5

