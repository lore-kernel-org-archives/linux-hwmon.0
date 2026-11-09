Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226475;
	b=UKhPQW+NJaaOlnpZX8EX4E7mI76z4+x54VwNFkJg+O3R3vC+RuaaUhm8hoyxHbeUH4md
	 AGx3bdMiSsknoWrrA92aC7aOVfRpUF/HHAKe+idtdDGTjtUknuof2bILLZwUf6MNdhjWL
	 Qb3Pu9l+Bq2JKfF9wyZ5eMq1vpUE+N4iknF/292ncopspaMv8nkJVVyj0PvmXndjSnEys
	 ZhvvOQvBkUR0N9vx5ycMMydCT4UYatX75uUSrp4NETp7tpYOtVtS245HPcJXozsAniYBV
	 YvH43Of/1FfbrJNVX1yrh+N/GvWsTK1FHlaOJ9ckBQ/ehNLPkXKyKfJH5YZCeGTKYEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226475;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W7YHJnRniney7FpNX0RPPWWJ7TgfNKB8wIHtYU68508=;
	b=EFDZHWUST5HKkvuwRiLZxF3WvaQ187m0QHnWA6WCE+jEGnvlf2BoDCMrV+trgA6qtlEC
	 IoPbX5Eg8TZq1KfwM2dfHwNVp70BU1CZlD6FBKWcKgz/7krVk/c6wLaT22uJ+mSB9E1r6
	 TM5U7Ho/Kq1QgM63zxl2g/eiAP0F+6Y2R5REoCqIfCaOG7CDmqSFLV8Nldu3uulu3AA6R
	 Gl9sFXeAGdZZuhqjjsHMWbqH3rGrghyYZbUDi0DMX+Krg7k66u6x8e3Vt6e6M2/hhbElU
	 Fljlm38zwc3r4Kf0lJA0zeZM1WIXi0RE/V7e8qGZ2NFes0O80thdo6Ue1eZW9cI8xgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPfaZtKM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C6D606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPfaZtKM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B73B1F008A1;
	Mon,  9 Nov 2026 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794226474;
	bh=W7YHJnRniney7FpNX0RPPWWJ7TgfNKB8wIHtYU68508=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPfaZtKMdxv7XyIrMnonqL4pq/PZevM3H4ltS7H4d1e0z5ZkQbS0eQ+A9+frQDqH/
	 7SfMOuRG6KYlGdId5T9ElvMQzmPTzfv4KbNxDa22t5JcgBu9bx6gVGetLpBqG4M2eB
	 1Ex49UAK6ZVdX94LeP1J4amm6/IVSkrCJdD8i1H6/YeCpMWpJcIHqNcwt7BROVNieW
	 ttC97HGPtnhZtm2W6OyS61+D6FJQJyIXegvXlEB2STCNpGkj4xslsgjcu+HlC3Fa+6
	 Xf0d+XQ4zrDZHaHmoeoIrMRXr4We9TUNBDzLooNRpaCetzChtuelhZJaww/GJwc5G8
	 XdW0yY9kNWo+Q==
Message-ID: <sashiko-outbox-204920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (dme1737) Use str_yes_no() helper in
 dme1737_init_device()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Archit More" <architmore303@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109121127.10937-1-architmore303@gmail.com>
References: <20261109121127.10937-1-architmore303@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 12:14:34 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Replace open-coded ternary string choices ("yes" / "no") with the
> standard str_yes_no() helper from <linux/string_choices.h>.
>=20
> Signed-off-by: Archit More <architmore303@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109121127.1093=
7-1-architmore303@gmail.com?part=3D1

