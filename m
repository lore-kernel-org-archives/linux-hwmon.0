Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901803;
	b=oRCqXSO9ZOaJu2uKq3rUrLMc6U0SLQKTD4sBnUGs+a4PTN0pUwIZRalnbL2lyIgXg9rU
	 c29Qn8ks11Kt1JrX0aiORtZgwofUH/XJMWCcnFp48slSYw+KrSr4xDf6ulYJ+B5VwwMsT
	 tCaWexisGj57N4Dgg18QCIA5MYXdbDuw3Ib52phC4azZ3auH2HFUGTkGbcB2ROcZJg9g7
	 Fa4eR9YI/xP2aB246NzqZnmW6NOZHIG7/jFXdrBaIeFDHFdfsSGuKYQo/HNuL3WmNoJPY
	 uEbMDgQXpr/PJQ3hEdhyOI5whb/m+zkey+CcLT0vJnRlcGfvfoQUdWMSCm/ruLdlIuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901803;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a+7NymmP8clAtovmJ2BkR4GN7fal2itMtqsw269nU8k=;
	b=PVXmoIvdW7PkjBU1LZtU/rhTwtos857b6X28LKp5YT5WRjFT/Loz9+y286BBrtWeNyXh
	 jfVm3hIHCrk0/ck6Vj+HExy23JbjmYMCsBDwv2hMgTFUCuDpmqMCSoKc/1rlGJZLEk72+
	 69v4sVbk7KjLH1RKae4C+c84wQdKAr6yBnpOLleDtkHKTcZTjsNnk/vXsNk4h7WjDBngd
	 I3UthvAAnh3Jnr1cW3ZqR+eWWl777uHVP5FPDTDipRPX8FNkWP5OdxTKzU0HAGW1p61kE
	 rpdNBTSovaR3x6OisMss3ADNRrHBpdcgchqCJLAsLlm+IINFV/mxi+qfhzn5Q+I6dGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=heHkObnx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F781606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=heHkObnx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C3E1F01825;
	Sun, 25 Oct 2026 04:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901802;
	bh=a+7NymmP8clAtovmJ2BkR4GN7fal2itMtqsw269nU8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=heHkObnxvrAjy8yq9eaKwcjMZt60ZNkI9vVuA/sipJUjFFLIjLdXDiKKu82PVFYHL
	 q0hiTJvE1bjMsVN4ijZBWgl39b9FfkMguS5Bca2XVqkskbMSdZsPlrC/dw0LPizzaV
	 wDrFycMpVBODGR6c3bchfmQocecp/morHDm+TAXUcoT4HMX1c7VMJlMCVpNaOKlUPO
	 TQK8Bg2QCjL3Nto7+lRSrw3WFo1lc9CNp+U3sfNSH8aQMUdano36pzPh7uQlugyQ5M
	 iTIKktMnIo01BaEG6mnlEcdtW89GHECOKW3tYP7oPiEzwSK42Mn+aBVTApzPrtxbOf
	 U8NmVzdWBD5lA==
Message-ID: <sashiko-outbox-184034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/31] hwmon: (kb9002) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-4-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-4-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:16:42 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the size of the receive buffer to i2c_smbus_read_block_data() in
> kb9002_fw_read() and kb9002_smbus_hw_read().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D4

