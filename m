Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901854;
	b=AI3DhqzavBUQqJ+0EpNN+8HovhTFn46+xsvKsfRmWxL7aSy8G1V0zBcPw7t8DNGzlmMT
	 n+bPaEuDPJCwHdcLj9SB5GQsWZNAuZbA/I6kdj3fPi1xPUNDiegsOaKKRUsjGlTTm+42n
	 fdkvTyLGq6uTPzfBJIripYapnfPzb0Su7AhE4lS7Qcd1YNHPzm6GG8P+qxkBaZ3Z27/wf
	 geYfNW0YxHzqsTAi0spI98p4P1KWoHS/vWPKLSteF91g1WPbyJu5jS86ORFvDKsem9SwM
	 YYFKmXTetvikE8cu7EtXU2mU+2tp1YwFDbM4JM8PtMh47T+XrqtFeL98SKnTFXQpDAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901854;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JHXeFbiB7MZRQ+Ptwnmqulfi+No+6WFyFYZdBhM0tiU=;
	b=1TkaX7Kr9N7qiQ/Mj1b+kIx1Poeqb20OWOLfmhTwvNR+UKkwX9u+sramPN642mlSAsne
	 Zslv8Rtb8rTkUCmQ6xB+/pDMz5QUpAwh61OHSsv6IeLIb4sPuOuQ7xW+1sHwwZvdWNN6G
	 Pnh7kPjf2ErMrvu9s99nE+D5FI9bRo9xJ/Cav9uT6/nRzlWycSGBHADFhO5AR7rbJHzuE
	 ZSLeAi2l3PuepEjyarLYoc4/VIN5RTSC3KamWRsnU2eug0Vdpp09mK4zElZTHgUkw2A7C
	 R81Ln4Eol0Q4G76fvB0PyjkDaj9G1qs9G/P3AnM5llmCLB96bISrNjiKicRY2xLEGDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KoLl4Xhz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115C6606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KoLl4Xhz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826A81F01825;
	Sun, 25 Oct 2026 04:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901853;
	bh=JHXeFbiB7MZRQ+Ptwnmqulfi+No+6WFyFYZdBhM0tiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KoLl4XhzXNKc9KaRXaymOeapmmy3QWFwJ0CdRO9ZFTMJvlDFQRCY3lfqeFdY+33O1
	 jotYMIDp8cSwMECp7DXoKC1G799g91I0PQg3j6r2REI2VISzmK7TBe0LHAUU9LhB/L
	 /2QPWaZjR+KtKhb+Sj1PJ+kp/6WiWDE122O1Z/uxYkTFPHLemdyfIz9JjaeAFLvJue
	 6tiZkfmVmWO3bw8sD8aiZWYx7b6qlXFy/K8wCSwqLz3YtJyBhOBz4wA+uDAvXyDxmc
	 oEyZwdVAHClCkJ3DYnd4DpwHq94p5QaxPGdpk3Y3/th+/D1dIcRha5XawXTN21I+n9
	 xBtodhzaPN2Qw==
Message-ID: <sashiko-outbox-184050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/31] hwmon: (pmbus/bpa-rs600) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-8-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-8-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:33 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the buffer capacity reserving space for a trailing NUL byte to
> i2c_smbus_read_block_data(), and ensure the buffer is NUL-terminated
> before model name comparison.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D8

