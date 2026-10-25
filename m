Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792902606;
	b=lBzqJDrrZaAYJCre77h64JKcbjEhn8gWP/hSS3tFORmAR45oS0Iv9vqg4NhAFd2Lu1Lh
	 BB6m1ltWWKjjW3x6RAHJrK+ac5HAWpDD07+1f7VL68YdYGk+i9LgfxT9EoJbsuP7jL9D0
	 xS4demrmGceE2+3YhE+C1tUlwFqhBamsJcmf7vNP3F3Ux9HZhKlEFBhM6/QcFN7A1c8vm
	 pq+Z9QrgqExH+kMgTr7UPjA1W/MxBVQ5yjcYTcqZOnbHwENcCyvQLYJdUoHJwjqn3ugeZ
	 25e2VaM4BCziXUueeNQ0EwmJm8A2SGXd+FtoLHJyqrQ2n6kan1pMqIlHstlxM2UArKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792902606;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ma6rDNQWn1d0A95rbz1kF3p1+PRicOGoTTNBVByxQNM=;
	b=brymn3xJR/JcYh4hAZ8NFyZkVelosD2zBtkMaszjXtHEkLA9TzEQJYKPogd/hO7/7Dh+
	 zhlHmH4xKi0SdRzCXWZcQzyieZtPeGHHVp/5WqY5YZC67S4S9n8ZPCoNYbpxTpQqVZ1UR
	 ToMC9AeQZ3Cv4/M2zlKrJiyJu+lw4buSbsbGuPQbx5YMFCM9wsp7opCeEGRqFSl7VCSOT
	 tLklKH4XA7/H1b3nhNoQoVAYccjI/1UrQS8cDckdUp9ulweWnz9fzDQ8GBISltczuSp2S
	 Mwwj/70vaMv8StbWVMrsMb7kLWIMOtEm4qCZtQHQ54dN0UK8If8xQJb1lIZEgAjXgIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hjjcAoq/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A56F606A31F
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hjjcAoq/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743651F01825;
	Sun, 25 Oct 2026 04:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792902605;
	bh=ma6rDNQWn1d0A95rbz1kF3p1+PRicOGoTTNBVByxQNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hjjcAoq/0gVf5xlUnE3ZZ6tlCuabfEhpa8CsVdnwlYS+49XYppifKgr1Ra+5WIsGi
	 7/kWSZEqTGRx4lzf8albDw/cqkfQpsS+GN0jCD/BtadZMq7mNnUpG65YjTD9UQS3ni
	 Z+RSbPW2NvnOfeonLN7ErifzrBwxV1j7/kSkIHUvpKzgzQh94eunG2zG1+HvVaPw99
	 rkLzRiWzpXae8ysZzstL7z09R2axjLJq5BVulhr/XqDBp6e+vZae52SAEtCbyt3bvO
	 ZFCkNkViguBeDlgjJPWlSwvjZ1vgtD4n4dkXSadMOrIIAbUBnT22eU84bGET1w9lXP
	 t/Pvy8T7EFteA==
Message-ID: <sashiko-outbox-184065@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 30/31] hwmon: (pmbus/ucd9200) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-30-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-30-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:30:04 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(block_buffer) - 1 to i2c_smbus_read_block_data() in
> ucd9200_probe() to leave space for the NUL terminator.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D30

