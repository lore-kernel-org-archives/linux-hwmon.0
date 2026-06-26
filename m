Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020BB36EA84;
	Fri, 26 Jun 2026 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459159; cv=none; b=A0pZlzQHcgIbNuwvYIf/G8cs9mHIPehirw9WbjHee4ctuRDwS8nNxFNRuKjk+I4f9aFmhJGRTDN2inT96cgzsIq0789QQVA1Kir2jT2TdmJgkXg4T2V+Qxot1pWJShq7uNUe5RbE3NhGq1HMuN1xOfXRd1DAFT+oXue9/CLqjP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459159; c=relaxed/simple;
	bh=qoMRFuiDo/i+3LmBW2Ygu4dCZt+D4S1oUh7o+estECA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D7fRH/EUOR8afMZB2TNHGunvTHFkSzUNwAa01qb2G1FfUA3/OjDvSxH1wWEiJ1gWTgrZBemTmFZrWpyQDmvrZQukm22HM4sQxrIWUztdgngzf18CjGlIWzM/9Lhtty/qbgJeeMbBk/coMLGe7Q7TMO9O73hs9MgZQHT1B1Wm8Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAXlB+6u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAXlB+6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550551F000E9;
	Fri, 26 Jun 2026 07:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459158;
	bh=qoMRFuiDo/i+3LmBW2Ygu4dCZt+D4S1oUh7o+estECA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fAXlB+6uZ8jairGGt1DnJZ6klPq0ddPck5uNDAEWIkTz8e+2TtELAboxAw03M+Wnf
	 T92oTPzNCp190Vw2O2LvLuse81PAfWRxGWY7OnjvsY1yl5SiZQWHb0rrobVeH7OUYB
	 OYLSRxHB6klCSK0HjlwlSNa50AXfoVtN44CXtX0SL4vo+4meXh+VwNrWhhAAl+0GjY
	 bi1zGNL1QTs2uxJQZgp/00OjDqoU1H9UpeQJ09rPOcDvVgIo9ZC+NjgPhhfJyS+6+1
	 UHU7XBI1+rykYX3dZ+LXZswY8TyZWy6/hfSo8VyIkucs3kvllb3xc+1hgbYmlabzkJ
	 pk0c7fdaYlqrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/9] hwmon: adm1275: Support ROHM BD12780
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <e1e6e6218c08b562311356ef9c57378d32c26b08.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <e1e6e6218c08b562311356ef9c57378d32c26b08.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:32:37 +0000
Message-Id: <20260626073238.550551F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D6

