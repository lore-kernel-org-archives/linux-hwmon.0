Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901885;
	b=S5R3TnC/PWvRngh7v51LpIBqKXYaXkOqE2U6twbRQM/iYRh1x00Ou0SFNAABAZ4HfSUV
	 hOv3Ptg4NM0PUZO8IsWkIFhWAV9M131qtETFIq24y9NI9ITNAbkpPs+Bzdtdmqlmiy977
	 96j8feDeqF78tsyNQ71kAzdxoAI08gcmh3/fzr4QkaLlDgKq4+i7KPS4YEbGaRnDqiIDf
	 cwFiDYssyUiYLBKxAu+MqLboCpLwKAa71EaSYc7x5q3zryowwyEBDcOEymQQeq/BxIhK9
	 8lxpwh6os24tyDgH7glxNtQwKWJTdR7Oaxc4Y4GLWlzz0JkJhMEqdREYEWp3F0cp+OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901885;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zaSfOqphmBAlBY33IASuscSV9h6Yrp/aBHiYNkZehhY=;
	b=qQrsX7YRsr2XrXkr2dXEVqegjEv40HKxfg5dET9GsFOd/+L5bO6qf8ZOWhB8JhDp+kuV
	 eZtLqnubrFf+M3PF+5lm5EhxFe4JDgJ/eam7R9SfcOyqNHaHs+3aLsBNbon+GzgBXfgV8
	 UvTM0AVvwzddaqMR6rvLtX6kwXNwwHSQPOjVNpEmFeNFCj/tyhN2cVwn+1XfMRDJWiqkC
	 ZVklBvvnXv214Uy9+n0vAdN5/AmG6k3qH1pN5KY8ePW0DZLa+TJJoq4e1B9BuyOtpicZJ
	 xu2A+3vcOTZ93oVvEo4KM+u6Y55wpbO+DqziQ8zenQ2KHcnEU5LKvyVczNBuzInuUZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QiyZyv/F";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B158E606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QiyZyv/F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3681B1F01825;
	Sun, 25 Oct 2026 04:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901884;
	bh=zaSfOqphmBAlBY33IASuscSV9h6Yrp/aBHiYNkZehhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QiyZyv/F6/0l8cPSWrkh9iSU4vv7C9M5QSDuragTI95MEiRmFziMKDFbfacxbecG7
	 jc8VHIDgI0vnbeX6h9CVc7q/14w6iOAgo5aPr3/HFQXh+OSzRGmAWGDO+KcVN90u4H
	 d+pZT60zTVcOv6l7ZcpV6/Yo8lM0Doi2sd4/cv+MssLmDj/mjyTYrM/1TD08xGvh1u
	 QLwyYdkvDj05ApWP0thy/vBtqQnNVPbH6B+XrFhD/2J7ILo1X5Zrap2/CAvZ0eTH/W
	 HLHB4EIlngtAL1QBZ1CLMhHWfdOsHxfLhJRINqjDKEVsDOk4MF7Nqdn2W+BGRkXbLN
	 4v1TDXwab8Jsg==
Message-ID: <sashiko-outbox-184051@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/31] hwmon: (pmbus/max20730) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-21-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-21-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:03 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in max20730_probe()
> to leave space for the NUL terminator.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D21

