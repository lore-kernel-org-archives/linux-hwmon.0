Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901835;
	b=RKpeSwFOa8ZTBSORejV3TFet0z4XiyFzG3jnwoQI2h1Wn7ovgi4x9tFEiNiv0Gyg7xbW
	 LxhTjltEHPsVeucxZZIKuUrWHppY6+PfccZ+2I4bK+n4+VLn5miq/fBRLgAloAIledF7S
	 4qasbiA/PL5VQV7g/PRK800vBETg6ysuRlDBaCjVTZZmxVLq1PemSgqFroNN6/ycAWXNE
	 fzOV55D/R9ogmKtIn6yh8lhMxBVO4pkED+d/0DBYOQwDQcVHwXF6cVx8A4LKycN7RsZ54
	 I29IDSzpm/gp1lhxIYpCnQS71QLd4PfnJ8G8ubvQvgZQxoBi8sGd5Tfbo7fweZ0wopg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901835;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YV18JbaTne2ZFoiRnaYj+Ftb3Yc+6MjOnvgjph82hmY=;
	b=RqLL+Pm87bkflZ8pou8mtHM0T4xeNrRHGSw8IK94yT3B9TYvEulrD9wP7af9IDnxJaeT
	 u0tifGRdEaKSWy8bvMPYEPWNa3skBMnPVsSwyYpEbrdnTRANa1SMuYw3JnNFMsKATOs2x
	 KsZH8roj2XHF3Apmr352AA3VneXEGlfBdiGjIb/EITrwYQ6h5NsdrQc92KReOO+sMeBdT
	 95q2iITxyfPjt/KO2JozDqmuLRzjDK8hdceML3IGbwcdXrQubn53H55runtno77EkuhY8
	 SKqKT3dr7i+TqddOhdcLwZOuDgcfU/rk/Z50jtMYsujzYgvpe7pEPIdYzTdHkupEd5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K78FeY7H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8DF606A31E
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K78FeY7H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3F01F01825;
	Sun, 25 Oct 2026 04:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901834;
	bh=YV18JbaTne2ZFoiRnaYj+Ftb3Yc+6MjOnvgjph82hmY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K78FeY7Hp22CP9XYWmU8jzluG3Acztc+Kzk8n5wC5L11NRr8uwi2W/b0QKMt+ZO0o
	 HLflInNYFsqWcHu2Q5POI5+pukOXz8ngQh7/mAFFuI6c/aaoyiAKQzjpGxJwdsgvDI
	 m3Vbh6GwcMHOsLRiPD6HEZDQ3C86buJCfBwfwICwqqjIhnE79tf/TBrlKujGQbqIjc
	 7dAnR4e7O82oy/WW4XR+luvl3JCtIZevjv50cjsaIU6dGGD3Zetdi3PeH8IzaZZZ3n
	 N/+gxyPkFs4w5a3nQZZDAR69zSkc4IQ2fIrVj+hYBqLBowyHniBP01VBLh1a95zgro
	 E+tX1hf9nO6CQ==
Message-ID: <sashiko-outbox-184044@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/31] hwmon: (pmbus/aps-379) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-7-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-7-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:14 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in aps_379_probe()
> to account for the NUL terminator.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D7

