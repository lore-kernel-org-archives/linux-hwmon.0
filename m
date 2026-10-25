Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792902152;
	b=OrnpP37r4CbQn7IAsHACbI26lwf+xrN0Y4SODTJ+QZPgwP5wFWk6/8vCEg9I87uq86Ma
	 eeQTHxuXPh8mTowMQ1ZaBjVvSMjuNl6sHFHDM8/+KesuAKdfldg+mx6bxkKTob7H44qEs
	 cqa84xtFDX32AKk4QJ/DlSNxYjU4kvgyA0KoylWrAkO/0qX0JCIEIrwIYnj8/oM4sTSjB
	 WNHdKQZ9s5nrRf8LCcQyrAruc3CyGc+SkS7TUYDKC6hPxyvapGRnnz8qc2PvKHjyo5s1D
	 Si1srQ/QSms2rSq3b72vXbksYZCkWNOtmzMggr152Lc8KdoktyKvGHTvyszOeg7Yevw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792902152;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f5qLXOS9jvrZ5Kum1iihkvxx2EqLLsaqZ0Y94TxRW9g=;
	b=JHeEyZ1oYmig+wQhkvZBzeNWnBO1SMDHp0pc6CCfRdpVyKwew7Yg7EGx1jkqrIEq6Pda
	 I6aIothSH3iTlrXHNOjvbxxTM8lt9psmnmZ5L74P9MuIX5j42lw1mEWiojshzlCCu3zmC
	 vRVi2ScH+CYB/FJZopKYw9sByNswUSJuXVSUBwGrvFk0JZbxinDjkSWJTn0ywPxaoDZHL
	 CWep0+Majsrn0eQ9ljzwoeH8weiu/u+wqHuf1DCCEwP7NfguOl7WElKZrEi/fjFr8KYRl
	 cJcwg+f0iCqBkyUk5FQJrzPLBFokUIeQN8SmnlHpkXBkF/mOPAwh+hAuKiafWNYNFlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ie+vs/E/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E09606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ie+vs/E/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901DC1F01825;
	Sun, 25 Oct 2026 04:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792902151;
	bh=f5qLXOS9jvrZ5Kum1iihkvxx2EqLLsaqZ0Y94TxRW9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ie+vs/E/7Uc7njJBtt0Fwliol02vW9nzZ6Hia/X03wrWWv9liaSlWKGy9fz88NoZU
	 UD2N4Ax7tJIRDgZCbgStabc9Ff3onWFiN+7CUifZp6IcubEqIVsH1w8K29ntlovWXw
	 QTnWQ2lIIK+N3tTiQMWqPn+8lRSuEUkVE7HfiwPmZvlitoVH5Ew7TusVGRvma5BSyr
	 cMFJsic1kfthCDVzZiy766SZavuAmVRYupG6fhC/4LC+hr7d3Bnhvh+SHRqcU8FdlK
	 Gn/fqxZ/mCjWCarPtgPzGLR2j2gSF72i8Yg7P6ZHBqVDaJT3/IW5TYaDEc7qHd2f7X
	 ijVtVq6Ob5hqQ==
Message-ID: <sashiko-outbox-184061@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 24/31] hwmon: (pmbus) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-24-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-24-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:22:31 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass I2C_SMBUS_BLOCK_MAX to i2c_smbus_read_block_data() in
> pmbus_read_smbus_i2c_block_data().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D24

