Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901822;
	b=juND79eu+uzrJEIuCIe8TtF6mJn58qoLi40NHvB9GvUsIEKAaeOMkotVYyGSJCMNs1qO
	 h0D2rDC1C4qQRPFSpvqNd3/hZwCWcMiU4q/m2efHml6YVKVzFrT7AT10CADWSmzNrbzAz
	 YCJzeHK17LVTL1y8oGOJBJwTZvQYCOWb8qopQmrcyZS7QaKa7X2/j2UtAc4vWGLbeTWZV
	 wmLT2bb5GwaHMSfCdkugkpUaOF2dhnCM1JVnms8hi9Ksf2qw1LhWhI9HWYsupa5ZAmXHE
	 hz1Y3I9Pf1z03l/C47Lh9+8zll/LWC7fkLfDCJEN5h3cIm8kpR77uc9RcKv4WNo0Npw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901822;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=15DS9TnG0QwFjrivOk21r+CvHqTOqjXd/qqa/0qfh+g=;
	b=bAzbc39AysVrWOOhnNdz+dCUqqVlJLsVCoSzdrXSPeFoRqNaf8H68ddcKd9IraM9NX3b
	 9llM2MHax5qS1zRyA/OyM3UJ3/SKzesmF5AULIhCOUOM7YbhTxdsXjteCJ+70Oqv/oSnk
	 2PY7KeEj+DtG/G9aDKvZIk0ZDLk8BPcM88t2RLxenc7AvuluYo7/tyCa/Ptw9V83Zap8L
	 q6JJtekTZFFsaC3c/WlBcFaCPJwhe7p7rDjXlntlH6g93ZkEu4mgcOL9ve6PUDkoMizm+
	 BsNxHYZvhi3HA0iQz8g5gVzn3fbC80jsiIMCRjp4suR4WX4H5ml8Qkrj05sNPLXT9SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAY5RPZF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7F606A31E
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAY5RPZF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D021F01825;
	Sun, 25 Oct 2026 04:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901821;
	bh=15DS9TnG0QwFjrivOk21r+CvHqTOqjXd/qqa/0qfh+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BAY5RPZFhW+wArKT9dUDudD6HFJtt0y+LxkYqTAqoUuxry6RRLaRGYzRwGYewBPja
	 fV2unuEECE7fqwDF/E+UFGKHv/zPu64E1WDVhgcbcVOKjv6MsKzynqIy8+Qw9DT/Zb
	 mcKoKVWinqssGemts7jpnBq5vBsaZalIRmD/nzyc0dUJotXV8/hHpaw8GXVOHCZ/7A
	 B14GKPWCRy2ZDT4UqNiis8aTGoUuNJWtSIomswSDFZnAdhh0dkWYS82r3NKoc8Yg8v
	 3CbcRmk9KCS4/LCgHVgJvsNjZlhk45nsbEZcugaxn3b50Kg94wZGADWeenH9NOG0X0
	 me6l8cxPwTQ5Q==
Message-ID: <sashiko-outbox-184040@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/31] hwmon: (pmbus/adm1266) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-6-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-6-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the buffer size to i2c_smbus_read_block_data() and shrink the
> GPIO read buffers to I2C_SMBUS_BLOCK_MAX since they contain raw binary
> status bytes and are not NUL-terminated.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D6

