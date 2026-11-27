Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770796;
	b=hdKfW0jv+MoHoCG6ANcjFxlD18cqUBxpzn/5ku0w0CwHwpyV01ZVK7P3TZY8HIJu0hm3
	 qhaxuebN0xBMKQ5Qu/kIFp78o+tRGjK5Zq2nQEFElQvLtwQ7DEjvCsez7xBkH3RDEGAar
	 FHrGOHODyLBK1s9zikl2LsALePon6GCVwYOGYwbdbsw6rItFi/a4RK5kSn9QsR2EyzMCc
	 HbF8rGbJlliPgYRCqytKUv1XGTt6RqUbhnYSE8A24usz9iI/H2MStPzk7G/To8QN/Msql
	 c4GPh9x8cbtQRErtq3pTXB1zdqdW2maeV4JclAt1m+hfsKd5Dcc0brsSa0Dwk/0zcbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770796;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w/qmFIAHVY/W+bAOGjeN/vEpV82tbedGTTjzJLxbryY=;
	b=YhORQzOG4dNW2RjntRHTqY+p0LiFcDO5vKF/RCJKN90skig2dIitQVqPw/VlZsTsawFp
	 4TZbxZGPoJO1XIRPOsGH8V9P9i/HH6bGgLqj7nllShmVIH+HA4tDjSHwOoQ46uATNPQ+n
	 Io10027R0NwEHfpfiYzdIOEgGNNPBqy7tDhIdlfc9PbKgSpue7gHJ2QCm3hzW2l732V81
	 1yfWzFrXCcrQa3jJwVzfcq+xsmuWeIDIJJ8wLH114d8IRF3fUha0VNTxR8zrBb6+d/321
	 hBc5AFrzmNKQgl7DSMP4UYkq8fS7sJA+S8zMWbzJpccyfxWmTm6kr9Vf/Tr6HI7P9xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNimtcr6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2672A606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNimtcr6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923D31F000C1;
	Fri, 27 Nov 2026 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770795;
	bh=w/qmFIAHVY/W+bAOGjeN/vEpV82tbedGTTjzJLxbryY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dNimtcr6SsDU94FI3wKlVssMqvfdszHHBgwP3eaiv7rUTd9oot4LHMgqpYa60wOxy
	 vOHsy/0XInW4kySVM/EsOH6YvnJQREyJ7dp93U0QDrGzjEDzzxq/axUcgaFMoQUHn0
	 sYNuLZHDTVOpb4AKEWHMwPFKG4tlWm7/hnHh6fRwgeqBFacQ1N+n7NqG4xZR78IanM
	 5ZkxPmGBn2ToSepugAiMu4pr09moGsX1A9Jo5nZuI5TbW67xpFcYUgg7VVdf0l2L6G
	 91wPhBBZIEzuqNB03Sb0NYY63OuPqq2J4iw3sOpmD/Ap0s/B8bEluxzhEAjzmykHe0
	 KKywEo4ePr0Ww==
Message-ID: <sashiko-outbox-236952@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (occ) Check sensor_length against the sensor
 struct size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maoyi Xie" <maoyixie.tju@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261127090837.164246-1-maoyixie.tju@gmail.com>
References: <20261127090837.164246-1-maoyixie.tju@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:13:15 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> occ_parse_poll_response() bounds each sensor block by
> num_sensors * sensor_length. The show functions index the block with
> fixed structs, such as the 68-byte struct power_sensor_a0. A smaller
> sensor_length passes this check. The reads then run up to 17340 bytes
> past the block.
>=20
> Ignore a block whose sensor_length is smaller than the entry read by the
> show functions, like a block of unknown type. A larger sensor_length is
> still accepted, because the reads stay inside the block.
>=20
> Found with a CodeQL-based static analysis tool that we are developing.
> Reproduced in a userspace harness under AddressSanitizer. Not tested
> on hardware.
>=20
> Fixes: c10e753d43eb ("hwmon (occ): Add sensor types and versions")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260617201822.3B46E1F000E9@smtp.kern=
el.org/
> Reported-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> Link: https://lore.kernel.org/all/20260619023019.1064970-1-runyu.xiao@seu=
.edu.cn/
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127090837.1642=
46-1-maoyixie.tju@gmail.com?part=3D1
