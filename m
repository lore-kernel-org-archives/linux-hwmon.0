Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB9629E116;
	Thu, 30 Jul 2026 01:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373859; cv=none; b=fFzaFKG27K2qJ6V+Bz9AuVA4A5FgrJNyHH2zJc0SQpkfHfn5vD0fheUWpYaA13VVB1mnJuhdRql88sFYTs+S6+kZXqowwehuFWklxkOrl209ceRM2z/3AlReLNvAPM6MXZ95a5Drxk2Mg46WVuS9UqAeXKI00d6ucdw0JQ8S+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373859; c=relaxed/simple;
	bh=QdhUFFP5tYNNAH84213gUzFeDyD78cpDiONVHr1K1CA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=segRXMWoKBOf8QS8P/ZWMz+7YrU7XTc4/rN9+qc+LPaHjZRtlHZZMoQ1/v4WS6Nm3OU9fcejVamHbMZiwFlsFwvvMl0IkPpbs4dufmQ+HwyY0NBgjQaYzbxc41lKCOoBKOoxj2OApVgRJOG0aS02SZfko5UZLccdGcl8fa7mjw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eL+VBlWW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eL+VBlWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8501F000E9;
	Thu, 30 Jul 2026 01:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785373857;
	bh=QdhUFFP5tYNNAH84213gUzFeDyD78cpDiONVHr1K1CA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eL+VBlWWynT0gPZc0qwpHh+QzGKtkLVr+C3vZk43xAAiEquj6wpJMROzTSBfYC/OE
	 /4Ujhpcc10amSt9HRMHFMHU1qbQuTN8V35nVXxoSMNfVoMMZOIwdb2NayXYzWztNbf
	 f0ecEnXZbjjnVDuXMXuvsoppmIWsxYf5eQlgYak5tOOypiqLjkeKHk7CL6CbdD2Tit
	 ULGjF/+cMJ792YvvcQg+KumWjbwbYEgvbQUoWco/m/kYPdgigq14GAWOtqaJaqSN4L
	 MGm31iLpyDv+tPVVwggHj9pCKmHvrHfBateryR8P1FU4cwJgVEGqr73V0U7TvkLJN8
	 dMfr7TRGqHh+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730-dev-max20830c-v5-1-a7553f84ee74@analog.com>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-1-a7553f84ee74@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 01:10:57 +0000
Message-Id: <20260730011057.9E8501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
> external voltage divider configuration for VOUT sensing. When the
> desired output voltage is higher than VREF, a resistor divider (RFB1
> and RFB2) is required to reach the intended value.
>=20
> The properties use a dependency constraint to ensure both resistors
> are specified together, or neither. This prevents misconfiguration
> where only one resistor value is provided.
>=20
> This patch also adds missing entries in the examples.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dev-max208=
30c-v5-0-a7553f84ee74@analog.com?part=3D1

