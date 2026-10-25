Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901808;
	b=fQd/Kz5OSM24+zoEiiBnuUh7O8cVMfY3YeN2Eog4OL5HkN1COxmeFcAel4OGdc/reVuv
	 0TcxIJwE3sg0Fn+Q5gqv16EQ8ouRhDo4gX6YsT0QlLQgciPxNkM07j0mweBy5iRY9SBtO
	 aX71QGQmjCWFYd9UgODVR7LHTcYHJVN+QXsY/h7YL8ELGsHs3QgJx7jvV6m9EuRXFnqvz
	 Co5L+It2mWH7AysHfUcbt3y3U87VAPq2T32tsXKXb9uOwY/w/WLg3C3zlhgBCNEiVhnGY
	 PhCZJpzLZVFQcRbVZFEiItXg/y1CvfnKt9zalUAO9PZAarahL/3mwVQ1wHxSkZH1KnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901808;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vZatRnJZEpxY2eClftQhkaMULpcsPzI50Mk2DAM0vUM=;
	b=oTkj/3KCrNXgw0pq1ELfo3Pz97etKhiTzcZQlf4pXMfV6ra/ka2kZOoZebQfp1/uBXuJ
	 ktD3nfslSKGaEwDgMrdB3Oof+B1tSVtT0GBjrQZkJ4xyRVEawp+/xWY2a3RvZJlDxrWWT
	 QuXw3lRyFd12UMk+LDbrt2nPIHix+Pe3YmBGjF9Acu6g1aUwVGfbyeCfeegC+m0SdoF9r
	 j/Q0cLh7vb30k/0JFjNYYX+xUXkg9dFf94nPu6EWqEHkeBOL98Ja7iZ1oJcihQ0nfU9Dg
	 ABpMiNh9ubhZXXWSVuSNCWIzm+OTWB8S08vI1OFhh6VF7YemPK9EeiHa5Yo0J1En3Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkMXarkT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C6606A327
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkMXarkT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9DC1F01825;
	Sun, 25 Oct 2026 04:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901808;
	bh=vZatRnJZEpxY2eClftQhkaMULpcsPzI50Mk2DAM0vUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nkMXarkT5svHpu0wrQBNQL1hQVYYQB7KXZjWSWCzHJFg9BNIyoaQ5F5BeF91MBZ7N
	 aYlvcIhdyRgqdi3N1qLV+ou/i2Ky1jBkH2h09LAduxsXtH9C8oso3eSjwUoYpUiWWW
	 PSwx5bAqwS8ULw+g/zsggaQW8/y3EnIcM5b2AIg1T7pntTGLl+pIWk/JIiVdc5Yiue
	 C5LW6Keh/qPfP5nz8Fz+rUE9zT2tiwbo2WirdQ12z2QdpHFbhuLyQWPOaF9Dipkcrs
	 fPWYUlGhYwNf90p8hVOZkkTPqcOwWERvjdfvoJk7CthrPYP+cLRrP8K0vJr4qjDI98
	 YC0xFO4Q/sGcw==
Message-ID: <sashiko-outbox-184035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/31] hwmon: (pmbus/dps920ab) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-11-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-11-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:16:47 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in dps920ab_probe()
> to leave space for the NUL terminator.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D11

