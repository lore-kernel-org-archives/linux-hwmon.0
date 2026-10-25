Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901833;
	b=oN96u5HrALD3QgnmSLTy2Au9RTa3zrpcHtbyShSc5ruGsz/Ar4HiLgu74iDOyXOtCDAo
	 wgaueigsLDWvTWJ1MiYVapKi6KPpupls6OsWtv3c5dXRNTsL3xz7C2VwuOBJu/HX1d+8U
	 WRmddtuxKVAzTstvCOeNWAA0KnaM14If8MyGdbEBU1qc1+DZD+ibyRzpoFTvG0PIKg3Bb
	 3x4xcAC4seQAHAf4sta14RDIugQHBqDpmmty6jv5cnSS0v7gwoBNSyEStKZVws0ekGa2G
	 +UHkmddmPo1JgyNayZFT8SOQb6QJ1WhK5mgnYRa0cJ0yyyUcvlwF9QUtWGFp3r1I49Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901833;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ET2JWTbcedszhhVpIYhjrJ8Lg4JvAYvH97gSd6m9RbA=;
	b=qsFp+MCOfLOL01mNDRVE62MUiuFYdElbvVuZPXT5w1vIuSdhi9SslKJJdiiW632Xq3Vb
	 DA4jVjSQAHupZYMzM9h9lhqP+hDKpsuN9cLXtQdKV1+0ZCf+PUo8BYpfJOcLxTUyJRqOo
	 bmTI4tP9p7lUI7wc0AMyl/nCqIaAtNeHNBFvWElk1/cLn5YdCbstK+baexAqnnfzgcX7h
	 MXfqY/PfHqUZUGoL7rAM2qc5g1RFFDvO9PFfClFGQp5BKDV3CjfyuUgEAaNdbBFZqPycY
	 2nLPN3yCaJqmEnHcGKE8MMOFe1Gu4Ocv7EWuVIipaPGX/OuLm+nNW2gQufU/vqWzKFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGZjy0Oz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949CC606A31B
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGZjy0Oz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4878C1F01825;
	Sun, 25 Oct 2026 04:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901833;
	bh=ET2JWTbcedszhhVpIYhjrJ8Lg4JvAYvH97gSd6m9RbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bGZjy0OzhTDvhRbqdjiKd0YmrJRCpTb3aM7hwr0L2fcu6hit0UKLMyw8mlbnj+ueC
	 mE9vAieBpir/LJzhX1HTGWanGnFHAycBNAPWoYW4uJy9MVNCctsjH7kMUdLrgp4F5s
	 B/8fo76oKV0LEVXIjGc9sWyZyv++WRd/hbVhcEMz/Mgf4JIcJaDP/tp5rDAyQQcw6r
	 LnlV7R8xUf/xMY8xGH/v7ZccuPCpxUCPm8jRZyIhfOOnWHBu54nPgBOt8aATmd+QOl
	 /TZavfhjI1i7NYlFeilADp2pmFhI680DxAGU8cDCRGPoq28G8UZ3op1k7DGf/e3G0L
	 ox5jinYawoxkA==
Message-ID: <sashiko-outbox-184042@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/31] hwmon: (lm93) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-2-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-2-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:12 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the expected command length and destination buffer directly to
> i2c_smbus_read_block_data() instead of using a static intermediate
> buffer and memcpy.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D2

