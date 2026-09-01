Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4629443F8BF;
	Tue,  1 Sep 2026 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279298; cv=none; b=JYLSrw+pdJ/+zOCTJ1+VqQfKOk5ynbDlftT160+LZ18ULQc95HcIk6mEvyN/DGv+pGcslfi8KHRcitve4ymoc/xdg86/6Z1rIAelWiUNDXPZQnxjt5hFMKXM+qnnPhXvhOMHFuX4eek1WKNNTxWH6aVzP0gxmRFZR2xgQ5wbr7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279298; c=relaxed/simple;
	bh=0arXUtkgPaB+gV44PaKH6fw7OFxVjBbADleRYExq7GE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qaIGDPxfXVDQhVxOfyQKzDZ9QlL9EinbfX+7o59iIv+TH0EuXxDV8xkdR2GJ6EdDnoDDkiLTejEAmsAvaJnayP/F4OcYFdu1whqrFTnO3JWcSc4iofdD53mclXLJ+bauYzKt6mjXnjs+A41a9Am9B8mKskPY4e5NggQwIdscmVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hk83YW1g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hk83YW1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1A11F000E9;
	Tue,  1 Sep 2026 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279296;
	bh=0arXUtkgPaB+gV44PaKH6fw7OFxVjBbADleRYExq7GE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hk83YW1gfjL2R8MsZtalmWWs9llWEfFhatNQXmiazWIh2DayudinRERfUv2FgW+28
	 xJyoSw1YAOvYChcNLccyMllwukGgMVLuZVfVZQ+1DBVtTpP6xbZS4t9uQG410qg5aM
	 Pd1YlsI1BkxXo4eSfAXwifG/ymmO8JnS+ZcbXG5yGbooY289PrU0QwEcvWOpYUF50+
	 YhZP96AhCCF9wx0C8ojXmE2hA+A/ZZzCPXmg6u4x/XreQyf3CMMVxmzP4XbDLqXbhe
	 i+Ppsl52cfX8qpwJX3BlP9VUwckOk/E+QZm6ysxtRPXA0XOJhBo0KGeOdoQpggO322
	 Bw6uFKGRp4tSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: tmp102: Document TMP113
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901161008.46948-1-marex@nabladev.com>
References: <20260901161008.46948-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 16:14:56 +0000
Message-Id: <20260901161456.7B1A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The TMP113 temperature sensor part is register compatible with TMP102,
> document it using a fallback compatible. Unlike TMP102 and TMP110, the
> TMP113 does have additional unique ID registers, it is up to the driver
> to handle those.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901161008.4694=
8-1-marex@nabladev.com?part=3D1

