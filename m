Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901836;
	b=eCqoUA+YT/Vm+7Z9b4UHU49iPmtXMazdz6AUTRNIpGqhaQSAFx6uO3+SYNpx45AAMeDv
	 lEHqP6i7TW7+/mYx1+06ZKaozhKf5yYwWeO8d71xH9J92ZuBCoaeXVA96kEbmxpESHh7m
	 tKXWeJ5gR/fCOeZUzG4n6L2TYPdXnXcFghn7AzDDa4sFFRbNsU2aP7864KooI1GLG8UyD
	 sRXIdNOvXDZZGixakP4UOMcg7VmwLkqxZdvL8CTFJ9TOYWq1OHF/AHiTukxWCfoQcjJEN
	 wfE1xmA9au7fkSVrouYE4R7wR0KNT1AyCVz/XgDMwzJp5GFFcjStBxaz0sQBIEAOJsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901836;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8dzeD0Q5iDAJ1ziLSf9M6zMZfp0L5WU3onbjHDQJkaU=;
	b=OkrmKhbCPNCOFdpqw5IWrKsCFcCaOaSm+kN7BgJ2SNfwGtY35cVuZgp76wbPvSXf/RZO
	 njLKNDPE41NVUw/jYA1e/8biuNf9j0BhYnkBy5mU0RGR7iaefFeJZU/wVnf0tUbORhXPb
	 GQY9fk2fE5CZ8K/7RP7dB1ortWuZGAqVpklp9pGM/Df2FwnfkAVF7sm4WCIGttToqhBYN
	 Of0mDv7tA2wI5wy78f8H0DZpORU9Jf9qA2fMEPxNmgen497j265faerYWBcxcHFH3Z5O/
	 QsYdyAMmRC9WZH6AQUo3sBvJaXGAV7rIbGRPmIwhGEs+n2GTt9lb8hLaQbjsFioagAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdbHpIYd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67983606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdbHpIYd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D306D1F01825;
	Sun, 25 Oct 2026 04:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901836;
	bh=8dzeD0Q5iDAJ1ziLSf9M6zMZfp0L5WU3onbjHDQJkaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JdbHpIYdtgz+AExye+5njr0JGw4YXIqvY/ZLSYfe+Ovje0JXNrya5BsMks2bnlC+r
	 Q6nPNeHQkS2EJ1th3QABOHvVufY5sbGUvwKzEq1CAtEQ4PVBjxc9eqUFn2mrMqBSwm
	 ShqOUr41SRNIrSCPANOHacmPR0v1hiKNoSKLle/KKKi0lUGj0kU0dk48h16CjZKaZW
	 yg+/pFaZcQyc/h/nMacRjbGQXEDL8WXPE5UFYqD+5QdP0aGlYOHtbzoAEXfOIN0x2U
	 kz/rEKZPqI1LbgSus5jShVdeUB2ZmlKUopMuMiqQzvrWAQoJJ5KRV07ykHvbChkkpx
	 Q6G9QUO0+ukPg==
Message-ID: <sashiko-outbox-184046@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/31] hwmon: (pmbus/d1u74t) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-10-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-10-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:15 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() and shrink the
> temporary buffer to I2C_SMBUS_BLOCK_MAX + 1 since only a single NUL
> terminator byte is needed.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D10

