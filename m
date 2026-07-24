Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAEC46B5;
	Fri, 24 Jul 2026 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784851331; cv=none; b=dFxdKMSKdMVGFbEmSq4ej7YwCNqANnuCGeBTPI2N8GQUwBE5OmuoeY714BkSRuVuK5gI6BYEQtzVB0Uutu85bysOGH7F1sC/BJ5reSNWpuHP+OdSsztfVIhlxJbz1w3hgx534bDVQIG1kh4P2tppM188LyozTihPyPyVGQi+uno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784851331; c=relaxed/simple;
	bh=cQWwFrb/AbLHKzE9ZyvyVWn1yl2yP1FTUKlrhAiByRo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nMC08yP2eTQbuf5l+YuMcW+7T8oQ8pDuAhVU7/9lNANmbLz18LE6ul+lEZT2dPMsqZJzLKZte9InJ0sTzt8zGa64FkIbbDK+1aNChYWe0zry68n3enW0id4UUuu1cg5In0v9wWTTfCOzwS6IexUbb1pKAlOKrTeteOy0AAXn7HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hO4AkESQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hO4AkESQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71601F000E9;
	Fri, 24 Jul 2026 00:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784851329;
	bh=cQWwFrb/AbLHKzE9ZyvyVWn1yl2yP1FTUKlrhAiByRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hO4AkESQEUmk7bjiVe6hQSCS+4i12kqFaY+dyMrG7eJst1YLwjj+0hBR2RxBbTnAh
	 Qm0/lYZTLnu9a0RIWr6UItIjHFGPUF6m6/Ecj0H88x7ACA8rk+IoFTt6vE76tDSxcS
	 1Wcd1f2Fx4VW38izBT7Ujnq0jdgAr6Avr/pFd2MFYHmNDKCKXKnmsn07DWPHZEMLhz
	 bi8JQ2aEn8YeOu9LsHwoDwXeqe1I9vpPzOu+4E4xR8ZmTpfqcuDH2dFtckhMbQ45cT
	 zyWo2GybAULyjai26mRgR4SdFLcswijR6XHLDzibGRs5eQZEVH+69ndrxoRPFRvTOf
	 nLDMTJuiLRDCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-mpq8646_v0-v5-2-5915b5ae9aa2@free.fr>
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
 <20260724-mpq8646_v0-v5-2-5915b5ae9aa2@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 00:02:08 +0000
Message-Id: <20260724000208.E71601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Add a device-tree binding for the Monolithic Power Systems
> MPQ8646 step-down converter as a PMBus device.
>=20
> The schema is inspired from the mpq8785e:
> same mps,vout-fb-divider-ratio-permille property (maximum: 2047),
> and const: mps,mpq8646.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-mpq8646_v0=
-v5-0-5915b5ae9aa2@free.fr?part=3D2

