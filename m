Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901797;
	b=tIxQbGwZJmzJt/oZbvE5zpLCZCi+v/0nkgpuYKSRpbA1RQQruyOJVQY+SDo+KlC4eGGT
	 6FUpo6QhjQawI2a1/4aPR5dGY0wUJSHsXf9GJLCYV/J1hASOWpZFwsSxHiEbVKxG2ed3R
	 rfms077shAg/w31X7t9ZPt/4ZgTcINbJkrIC0rIu3kMx9lOAc7blAcITabeJQYS2Mfamr
	 US/FlAffmUO67228g8cqPG6In+aJWFU0cVDqIl8k16hc0WjXYxLPF5v470TBahdgYwXE8
	 YUCpzlWcBZ+f8yyRMsEMSkZuFdu34VUZtRrPY5yH/HLArTRPXLV/ezXgu/n7fdbIrpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901797;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j2pAYzSlcPOURpK5UQ8UNBq2+8aVn3/MttTOHq4L0Dk=;
	b=bUx4Yd1y1efD2UO3xyUhocYtCvsfVm4ut86bj3heKJh3H/nceudoeRO+SJXJP5eLLEhm
	 qWb1x9tfXuQnyTbU0nJB1ALHJnK2nmr7cAxQIThtTkHrLppcH/H4LN2LsJXUAGtrRyh2s
	 WAHnwIAVXfjaX79Km3lowf/BaCknxTEAUor7XM55gClRMUYawMJ7IP1fzbIsHJ/zWX+GF
	 bJNSUcn1t17lr/6iAnv/Z8juuIEejDIAJE2WztqEuDrSdvLUVjavStW1HuTUwAQ0KPY3j
	 ozTLzEfS5Mcjlg1Sr0UZInFTFX6BGAaj0mlAeO6D+CSvhm8rI12+j4fqGmTmbXTnVcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OMTLUJc0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D43A606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OMTLUJc0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F8B1F01825;
	Sun, 25 Oct 2026 04:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901796;
	bh=j2pAYzSlcPOURpK5UQ8UNBq2+8aVn3/MttTOHq4L0Dk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OMTLUJc0TL+zi33iBcyQArK2xzMZLsOxAX8epB8R8fUcJBORIR6+NxLP6+KVGAGGf
	 L/ZslMmj+/d0ELqnrIyDI74O7yEZNgZiTKlizmSQnaCI+Ix/sE5kALNUxOMoMGGSYa
	 jEWOWM+cHCyTK5OVw3gR/J19BITdqxh92S6XIdg2vsXShPDqy3JA9LC6P4Nm4ySK/L
	 Az4z2N2lnpLi+wMiECWftJI/pHqAvJGDwHmgedbF+cbyZ70LpZ1lTs4HscS3qT79SZ
	 tZLzhmGX+zN47DeiMU2wv6XkxrkJi6CTbATwsUNj3ElYkpNEZYnQCjVH6aarvY7CPt
	 SxRnrBQT/5srA==
Message-ID: <sashiko-outbox-184033@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/31] hwmon: (pt5161l) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-3-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-3-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:16:36 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the chunk length and destination buffer directly to
> i2c_smbus_read_block_data() instead of copying through an intermediate
> buffer.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D3

