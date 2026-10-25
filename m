Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901936;
	b=AkqTTQ16UpL13qBoLlQQaJ3NilDsbruZvIe7zK4xgxrkgEnW8js/M+70qTG6SBJp/Vgq
	 yh/ia3o+3Ws1RdEwGSJOi3KolmSGcxWfYpcVA25pLaIkPiFnM9poWU3Gdex2qo+qM+Msd
	 HRs681ZS5uAMeKPGN3vrAYI6aP1Gq2VAnfXIoT0VK3f8jks6qoky0s8wAxQCGa3h+fXZz
	 HIKBIHlNzX//l0qtd6SHpx8BN9o2cWF32tTAv8e6D0cu1ZMfOgzVGJ6K/EJ4HtXoZrY8f
	 92+qVDNM3CxNEavXTaHrd4IK3myaZ2BUg1NnvRbWZyaS/IomLuHfI8+lVoGSm2KHFzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901936;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/T4kRWr5gWlU6f0DxPT9yBnHHXx446TVX3N8gdA8SUE=;
	b=NxW0t+ZoJDUPqgtKmq6MhXxjVpCN0AIszrLvATHQiW7T0qA9JWa8udkTuFN2y04ULjpL
	 qnOLvM+9cT6LCMsbiz02tgiQ9qUSqVRG76p6gifktEKx3bh0tkKi/lfy7loGkNQygdSzX
	 RbDXR3kSIIQHNu4LCLbMGPlu3fsw1z+n2y3UI8eDLspG4XdsqScPST5d9Mpasxz5imTzD
	 eYQhUsjeE2k0QKffRlObOT6vLIwwKtZ6JY/N+C/yWmgGgrHmO+7gf3Eeagn3dM/br0SR+
	 GvxyLJ0JbcttNWAJC+R+zm2o87NKMK5fHMuDsub4gymI/MBeNTniSHbxDxYvdhAunWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jbJ83Pb5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C849606A31B
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jbJ83Pb5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B833E1F01828;
	Sun, 25 Oct 2026 04:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901935;
	bh=/T4kRWr5gWlU6f0DxPT9yBnHHXx446TVX3N8gdA8SUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jbJ83Pb5jbc75rPDLVLgiEuP1o5hdkkqPJinHAaVXHpQEb6f5CLjNwWQlmx0F9vhC
	 hmfl41GYm/hErJGKcakA90u/uQYLryAeJ5cAtJidWuNMkAm+W/YhrXDdmSmhTCpDA7
	 98NLemxxXSVh1+i8FOtVTqgqBv8ocwA2ULyxb1DMCwyDBiOslUteAK4mZ5Mak5Pty/
	 i/Kcr73LPAe18mlE00jvkM5aSi/zcfCyzDLQH4N5y0c/J3syR9MwDaqHkBhwGgKyuP
	 otHoSYiCmp7oHaZgz6+xIkfYXBZKTElU6iLXO0nm0qDQn2CPsQ1NknHKQiIP5/O//g
	 iZAeefWTfjDqw==
Message-ID: <sashiko-outbox-184060@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/31] hwmon: (pmbus/acbel-fsg032) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-5-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-5-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:55 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the buffer size to i2c_smbus_read_block_data(), shrink the
> debugfs data buffer to I2C_SMBUS_BLOCK_MAX, and ensure the string
> buffer is NUL-terminated before comparison.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D5

