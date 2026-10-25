Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901924;
	b=w2S0K6nMyDLvipTX25REWB2K4e1gIcml8fgXK6g8jR6ribtAMa5htkk/2ZBRvrCCFFyh
	 AZvHWC6bRwt0WxZPZYoQcJccwPpiKABl6Q5XnnxKPiRa6oHZ2TEJFoi4TrJuFdVgj6bKU
	 wMFcbluT5x74hVey2YB4WcNIaoxHOM2VABGjDq6cjMFDYAx/lMD/T8QVkI9caznin0zgO
	 ZYTyrZTz62o0wLFFcwes5VDccpksB29j7oNwN+y1uIcy50zT9bagLtBJswTRXBORFQ10t
	 4/05ROLxsXlDMbofTd2EmxqtvwPXnAc/rPbqyo3oiFeKqa1rrgfsTN+UIaoU2boOwJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901924;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jwMJmVDiBRvJZSrcT1/IZ+yObqvqnKOoMgdogWK4lNE=;
	b=dvI6TMaDt3uOTX4w61Haeeknln7iMQdl+YVjrVG7uF+NZpheIF64EJM7+PBAXGhqHbeH
	 pqYE2/grYvdCBXbwqbknbmFuSKCEh28MUzPMkIEjCry4nsgECI0Q03m6ztwi0ZStXyEPK
	 FkzFCezI4STRFIw0HWfN5M7VbDi5IRNrYKthqziR59tv7q48P1/MBE7wRcVJMxYJy5C6Y
	 tuYSvId6kAobUcN9BV9jlPBGVjKojK604Wm1s3uv+Phe/LOpKr6H2wWZKQdQASz2bnKEi
	 CF7gUfktHh52fgXv0gUkc7wWwi8Sf0Kol3xBItYUQvXXrYdj62GLLY/n7/lT/1tdinA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOzSMCVr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CD0606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOzSMCVr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41CA1F01825;
	Sun, 25 Oct 2026 04:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901924;
	bh=jwMJmVDiBRvJZSrcT1/IZ+yObqvqnKOoMgdogWK4lNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WOzSMCVrUa/9Y0RsZNh3P72+Pw27olsmeKrggVAJcRhxdyEq4PmXQvQKdHnTHhz9d
	 ULB99kPQ+O48yFv0QJJZJzx1uVD4kIcmopQe/tKYYD1ZponsOFZRWqbl5tiC0SoE5T
	 Ye6xQaN1PixqRTkyWdqHo8rR0caxKXtSq4y5/8wAQAR7NbWC7pDWXSzlC4ErtRPH5B
	 kn9b3i2UW9+0357QpQX64KXjk0mnIGNxoBTqsh0wqvPZaLVOhc/larDOoI1TzuGBZT
	 Z7b+sox72l2SdcoeBq1jKhhKFAHt8sNkID49Ada00z6XHDeqCw1WQiTbq6mriAkxzJ
	 cvmg7En1HRA2Q==
Message-ID: <sashiko-outbox-184057@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/31] hwmon: (pmbus/pim4328) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-23-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-23-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:42 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(device_id) - 1 to i2c_smbus_read_block_data() in
> pim4328_probe() to leave room for the NUL terminator, and ensure the
> buffer is NUL-terminated before string comparisons.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D23

