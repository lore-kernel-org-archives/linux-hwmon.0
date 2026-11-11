Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380389;
	b=Lp0xv5mkayPsWOEmiCach782y1fgBG7ZltvwEHVsKK5xF/dh0cOQGgQYmMNwa7stRURa
	 VeLAn4o95dEeVSNJT02to3Bgqq4ONr2wInrUPXPAiToPM+qIwM7JcHhUHtG/8T+M67sy3
	 LZM5geks7ytXWD1bQCQisVct8mYZtT1REj2L9KWB71pIKWv89DacaoNISa3OGv1bx5tOi
	 hbrc0KU1Q4JzrDMdIn4vbVcdQxBVGIiBt0nQLL7XbCH+cGUQO9Jy/9tLOXAX4epyz62nq
	 o//3yInk0o+ZCFLfL5PMHcX7rCabtUNIwo9SyJjr10owkfw4ME7hsrjDJfhXl7gpDDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380389;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5WDGSQD9SCUf1QfOEEwGHtqCCXx0Gb2X4WDOmpbOACA=;
	b=IsBw3VN87Hj54ZnlJzAQUHXFuiUDO0Abeq7F3/W2/5VsCHWPIY9Y4RAxnziAVDRNQAjl
	 0cT/AMU7VPyl0N0Sa/u0KiGdccYuzSCy/arsirgNqTau2qYmhvx1v2TavTCniLXrEv5dy
	 i6UBrQCqWPuiZ/ZcTHmtcCdHCg1z1PAd3PL4U3aw4hUKFBu9BNgUP4bGsWgCdXVerKJW3
	 fP8siPkdymwndU4HT+tFVpBbUJPoYVkHExEfkmvZguoE3uGrzcDMun3zh4AYQmxewjQJi
	 e/J7XLCRcEWTu4X+GN1M/pMX9dND2jao6Vs8vf8q8avjvzekingB8PC98TfqTZtUYJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfP2Ujz4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EC9606A9A3
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfP2Ujz4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6421F00A05;
	Wed, 11 Nov 2026 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380389;
	bh=5WDGSQD9SCUf1QfOEEwGHtqCCXx0Gb2X4WDOmpbOACA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KfP2Ujz4GJnwh1oykc+dHNmYgtPTYXS9ReehmH1QXQuWfLKH5GHOfmlHwjztz0gZl
	 NhtlZa2NAQJA9ur4RzShpEITZs2vNahIfVHS2FmsKJ24iTAmbYvWvgVMzkcyfhg1qc
	 pTjRsZ2UAT1itAbdGA3/PvpTE0J4cU+3WFLD/CdEcisQclIDTOCkGkfiTWHiodbyAu
	 B+9rJAncEMLilzPPuCbxxpnPC0NtMnlMoTdEdZBaKxDwwn036y/rRUeeLGMFqtvH/Y
	 QcN00auGgfox3JQp3JdWZjTipuVgNFibhcmWnLxMrHR8Yvd9tHLNmCVDkOBMQhufbG
	 2dmg143r8qvFQ==
Message-ID: <sashiko-outbox-208477@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lochnagar) Avoid oversized shifts for zero
 readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111064930.17408-1-zhujun2@cmss.chinamobile.com>
References: <20261111064930.17408-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:59:48 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A zero IEEE754 reading gives exp =3D -150 in float_to_long(). Both shifts
> in the rounding expression then exceed the width of u64. UBSAN reports a
> shift exponent of 149, and the conversion can return a nonzero reading.
>=20
> Return zero when the required right shift is at least 64 bits. With the
> supported precisions, the scaled mantissa is too small to round up in
> this case.
>=20
> Fixes: 4cdb56214746 ("hwmon: lochnagar: Add Lochnagar 2 hardware monitori=
ng driver")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111064930.1740=
8-1-zhujun2@cmss.chinamobile.com?part=3D1

