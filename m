Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95AA3EF67D
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055009; cv=none; b=EqUEkcJTpaIVfN0qVfsCnNWgr59bdU65rUHfjxsgWKbtCnwvlVDtyu7JgS8S1gIiWSvGhuLAg7d3vVY+fmzuIEV5OJCAAoSKLauHbVAjRgQ8kmC9obZRQBxdqfVzsufVyPrFMS5VH34mqlaakm2pvvgjKSPYmw0jazQGg/MP5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055009; c=relaxed/simple;
	bh=6TruxRAMRSowJ+VCaP0XzMGLfdDtgl0dD2tEpICc7BY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KMINQhXrn99KpMUko6srNQuRbJnfx40s9iKTVVs9+OwZQE9q2N0Ze5w/wuvGT8XGeYVmsz6gLbQsdpxXCW4oaJI7Dry2Z6GlAePngKOR5hBccH2zN/J0Hd8nZNTSwV/uSGdeZ5v0fogolZzdRExzGysRT3pcR2jqcDMC6iCQrRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iH3Aks7L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iH3Aks7L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230001F000C4;
	Thu, 15 Oct 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792055008;
	bh=6TruxRAMRSowJ+VCaP0XzMGLfdDtgl0dD2tEpICc7BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iH3Aks7LZADPQA//iEqp2o6c7HR2e2P2NTdtAE42z7TI87R5tzp4pqSzAa3CtARzu
	 Poh5viyEMEaHZU7YwSd1JwrYxxkAoE9QQktVYs9hvxd99ufEAHvDqClepP4L9EsbRd
	 H1errIWTisNP0QV6LWtaSPzGbFSImZNEHHoEad/qoWZc1nLQ4h7C/pIh9xYkbXxL4v
	 39CaKHV32GXVI4cuEWkGHMi4iGEU3NqH7sUuRl9e84VyL3TOqbVA15OseUvtnmG/ew
	 AXS9gI6NlpAh9fYoSOKZaM2BqU5SqKcLktUVPjg/UP2e0xD4w7RgGNO22ZE8dqUETE
	 2f2zZFFEP6GbA==
Message-ID: <sashiko-outbox-172537@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: embedded-controller: Add ASUS
 Zenbook A16 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261015-topic-asus_ec-v4-1-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-1-af6305ffcb10@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:03:27 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> least the Zenbook A14 and A16) expose a custom, somewhat
> Qualcomm reference-derived EC interface. It allows for fan speed
> reporting, keyboard backlight setting and receiving of a number of
> miscellaneous sideband events.
>=20
> Introduce a binding for that class of devices.
>=20
> Two separate compatibles are maintained since the two laptops' ECs seem
> to be generally alike, however assuming full compatibility with the
> limited available information does not spark confidence.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-topic-asus=
_ec-v4-0-af6305ffcb10@oss.qualcomm.com?part=3D1

