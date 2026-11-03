Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716879;
	b=pV8P6Nag2ohVA3aG0isNtF/bZo5y7n04v8AfFAjuKLQBXPxxZ0CAxTvQom0kUP+dl8Go
	 9lYfb/6pSLNSV14RTnj3NXvEV57uaK7gnCEHeHHZzfcMi5F5Y06/U29UhTR66UvzIvXei
	 zAiI/CfXsht1+gg3p/S7lDGL8ZGfIo7WuE4EC/xpmzJpO1i5u6TK1CNGuZ0bznk4/TELR
	 w+b08fwr+L3tjehGzmVksf9GZDeolSV8majJgE6Ixej+jC3t4f3nranpU1kP6CIGRklRm
	 7QgI5PqXJeB5vC3YcN25zQTEmsp9ECmOgkbqZwq9g6XQxAvJ88QWwdOw49PV8oK1Vsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716879;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QsiOepcaDVVUy9bIEt4a2RAq0nDaMMhQxRROl0MF2zM=;
	b=fCzCGu4xNzgnK9jFuojZiHLbvHiUurSRX7CuSj6ko/17TgQFwOVLZnaEHr1Fj6vxEqdE
	 TNKI05wrEcAbNrhjbV8+RMtLhBll8sb2q5pNMFjaSCGMtDlNVuBZ1ouRHgSAFKDIPw5pU
	 LiSNyH2I3lhQkJStKPCLdEjUyoU+libXZ7hnI33vzg3pM1MuwTp0wAn3DHA2IVTx1ICBR
	 PTPhQNKz8UOMUHa75hLUh8mgd6nl9+CnAtzDcnNBo8BzcTobnBfyWAyi0T2Fnh7dBeJ/6
	 PC4wcInZzorJMbgl6dnvOEU7uIzjLyeG9k884Ho1Jc2PKmeywrI4hPGFKSvpiYIHmRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9OJYNDE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E2606A33B
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9OJYNDE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164FE1F000C1;
	Tue,  3 Nov 2026 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716879;
	bh=QsiOepcaDVVUy9bIEt4a2RAq0nDaMMhQxRROl0MF2zM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L9OJYNDElQ1VTa+/dFZiyDPfVdWQkJbn6twubU51LpFaUuyeP/Ypjor5EsJuGQJiL
	 mEEJB8HYFFXdHumo5W3SFCtrWSa1OuY9t5aSjRaesyJ4zhZ23m2LFCFtETEoZvewRl
	 hLEN1iog3SSaaa+vXwCuvYP1+aYBoryzcK7i6x1soyOjy6iWIWfXAYso44Z1d0vykC
	 tSs37XW71A37+BcHzn6qqu07Z9RIo5+1a87x9gIZhtl48JZF4B6JD7QZ7gBqLxV1uj
	 p0zxMczX743E8S/UmzPKtyxij+Fqwz8ruabF+V7wOOKAGtHyIIRxGUJnS/75hw2+ZE
	 /KRyZoh3dlfDg==
Message-ID: <sashiko-outbox-195466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] iio: core: add IIO_CHARGE channel type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261103-pac1711-v5-2-71c20101a52e@microchip.com>
References: <20261103-pac1711-v5-0-71c20101a52e@microchip.com>
 <20261103-pac1711-v5-2-71c20101a52e@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:41:18 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a new channel type for Coulomb counters, which accumulate current
> measurements over time. The sysfs attribute is in_chargeY_raw and after
> applying in_chargeY_scale, the value exposed is in milliCoulombs,
> following the SI convention used by the IIO subsystem.
>=20
> This new channel type will first be used by the pac1711 driver to report
> Coulomb counter measurements.
>=20
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-pac1711-v5=
-0-71c20101a52e@microchip.com?part=3D2

