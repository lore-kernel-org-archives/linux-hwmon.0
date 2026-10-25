Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901936;
	b=HT2X4NiRv10dhxWv6ZxQP3QY40U1fUgtL9MyNbPeH3BhyTcltjUy/MRgwEhlRxKFPa5r
	 1PMufpGOm6n67BTtZFO1JDrvIV9bwgZ6jqa5etKDkrUu5xoXdWdTWamGgJ+wJsTv5ouxw
	 IAFU3c3f067pE0pFnwbN5mZ1rJMxMDErmvXSP0SmaJ6pBekqiUsTlUY9cqrMyIv2w5u2K
	 UDIwnOphSOCeN80K9MQNDmMIO2z6DAIlC4bN0FoeuOoOeclWIKU+8r03wxMYw89kMRTgQ
	 0GXlLtHA4pFIux+SFCfSx9BpYpTNgjblMuF7dOjY8ub648oGodbl/BNtIh1nQRm6r7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901936;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=srPA9e1bMXKNhNkrC7RBWZj0JfG6isgAhk2rwdSZj54=;
	b=gOWRTx21K2x/DRxpkMvJQQjRdSp7LgA/WTkk0nftiriWDZeXtjRF5yeGpv5aeZ9gZj+J
	 EfiBnYdcxYj5qY1vQENi4cLbvI5TsSSMltbPM235U1psy7Yn6nDfb2efu5sluzaf4EUDm
	 O3WfJTEB/80JS3AmH3gJdiCUndcxPbFUF+XAZ2RwXzDa93XYKAuQW7Ik/XD6CH05D5BRt
	 XJx9OZ78FOVLptdP3e8ezQU0+f0RyjJJsCtLb3CvTCUpYthn3SGHwO5fHui5B5KPf28oQ
	 4aXn7ac4J74rLdYyFQQX8C18lNdkLnGWrj8eQLdHk+G5R3S3nQJnrm7sk85Iono5Xgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj2x6pEa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E1B606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj2x6pEa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F65E1F01825;
	Sun, 25 Oct 2026 04:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901935;
	bh=srPA9e1bMXKNhNkrC7RBWZj0JfG6isgAhk2rwdSZj54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zj2x6pEaS/sidv0td152zx01MLh2JPRT31I5D+dHdVXNrltEGdwbJczRXHzD28cPP
	 N2fW3RcflLnS6rTYbRQb09xPnunr41lCCo9rg255XrJBc3Dw4scxglWpQIpfwXnUPy
	 y2kxD6XXBXqSw3gu15vLTm8ek5PWglXn8sSRvJPQzl530mpHAevnMIjYplP5oD0Tlc
	 EkrLjhvE8M/gNBmOwfTLPBDQYLkyMo35dFAfqfpn+OB9NG1eOJ50DX3ffkOGv9FFnK
	 J3Dx4IVp7gYN2yO6e+S5hDXqO+YIqj69kXkXDEYtRaO6bkQ/Gjr4MGD1dLklafrCwN
	 000Ix/ZTB36kQ==
Message-ID: <sashiko-outbox-184059@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 29/31] hwmon: (pmbus/ucd9000) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-29-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-29-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:54 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the buffer size to i2c_smbus_read_block_data() in
> ucd9000_get_mfr_status() and ucd9000_probe().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D29

