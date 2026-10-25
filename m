Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901834;
	b=izQiIh/o7rLN7rOVDQd4HHC0ZkuPSEK1crhzqlgp1qRYIe1srC9EAFsjPIV2dggoRuFi
	 fOgIk2OjMxsWRTJUiwfOoVhkEb9wYiH+NavIGMvNgiD8IQkAoXs6D9WqlSxMHB35xVBbM
	 D6Z/FhDlKdK23ZJ1dZy4R9eFqNWJkXnQYSekfGTYcQLUuKX1J49rgjkOyzNWbYGURaz16
	 IIN8FBSSxZgVU9ldQAJH4rMd5w6J6UbpXZBjex1gTRLQMErMDEW/wN5imr+SjGss1elRV
	 q+TsgGCByhWWM0VCJTLXw67ZvTr1k0N5CqmKZgRlObWrC9gniFGlL+n8WCi+8bZWUBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901834;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4mjMrvFunIG9KcHofj+k+eAjSVk6+aFLDYdQmXOP6GM=;
	b=SZAp2laEJgvfUCF0wRA8LhoZXYNgclKnrj+y3oHY52UxEHO1M8VegMKvQJtvOs2++29Q
	 +DpXTjyDnsbcLaMwQQJRQi5MvomkQuPnTY+tyXMgy81vUX7Ssrxcd1EMfjnNkqSNxk/o2
	 H3CPIWHTKrKyr0RZ+VOqJ3yknVthSu7AqeS/74RcTEM6Y8kBcT5GYdgYriAt23/nck/Tb
	 4BZ4diWJ7ORJ9XlBpbjEmQfYLFRoDbuS0viwjC9Uy7NdMa+1eavq7rNTz8CXl6/2/Dc1U
	 HWjqFqCsbOqHZHf8k5Dc9GPVqAK9Um3r4a/iQwO5flliKiUVn5ikkqD6ZX+QnsIPzRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgTLzGg9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8555D606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgTLzGg9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8ABA1F01828;
	Sun, 25 Oct 2026 04:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901834;
	bh=4mjMrvFunIG9KcHofj+k+eAjSVk6+aFLDYdQmXOP6GM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bgTLzGg94lfLrPcLNjo4Hp5dz4wII/CyOBKgbXeB3O19I92R3/VdjFxggR0au2NS8
	 rwuKLWcgHQl2SxLT5wal4cbjuMWJ4KOIj5yrKPceIE56S7zPjCZAFDcHLoVA0oUA+B
	 MquHG2IVyJkvTt3Rej1Sh9bFBZi4HgnlHG2AdM1n43MXoF3LhhqAqhuHiIrB/dt19K
	 x0QdJtX/HVG/lI+yjS1H9ZVAPDDokadA6/YFTuJWCsuaI9TBtThGnpcSJ2cbOkSkr6
	 rdUeG2IWAzx82M6B1PNrcKTqN35d4Aji0J9wC8z7O58Vw5ieUcnFsnQYYsjK6YY20N
	 2YY5BEMSsoLNA==
Message-ID: <sashiko-outbox-184043@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/31] hwmon: (pmbus/ibm-cffps) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-13-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-13-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:13 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the buffer capacity reserving space for a trailing NUL byte to
> i2c_smbus_read_block_data(), and shrink the manufacturer ID buffer
> to I2C_SMBUS_BLOCK_MAX + 1.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D13

