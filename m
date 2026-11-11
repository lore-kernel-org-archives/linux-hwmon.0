Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385966;
	b=GdQKfpCaw0B/eP8s0GQOkaDcqGHGiomlPJEWqKnhZSPnfFgLwZkrEnVSx0kg+vkMq7Tv
	 UN+ZKhLPfgX7fcC2zke9XuPjGgiUjoCe1kFuGXZ8FpdYKTOdC2rhN7WKNf+tF5+ZK5nxr
	 ZAtPfuTN3iBheT6F1k0CHUBmYKN21VEqeAAEfSCK2hP4IV5gO0xpoa0CbgQhJxuXs28mt
	 QDZcWBxh/rVw+phcAilQyNf10upgF+5YJMiLvFOxMGkhthEBi1vb3nQhtReDkZzfXnGbM
	 KKorncILmj4IzJ9ML0rDHO6g2GCuLIio+VElm+Q8SG4xTHrMzgco28ZtzocW4rUNdBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385966;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=USEsdXlX1oFJn2c8dSMKEdmN/SI4AvTRNzLhCan8R/o=;
	b=eZj9ZIYqgJzzeOaoWrqyskUc05U/YwqSRjEYplPgZlRS9l065gWqdXmaGMoIaFEYH0fA
	 6f/g2RUoRelVy/9DP+mIUK3eTLqD41n/372nWBOt97Es/HuIPEcEmkXJJAKTaDXpbE2XZ
	 3Vbo84ElGCBvBryIMmchOKDEGpl+XGLKb9rHOH+t23rpcDDlMeUKxEe47AtWnxyCeJgCg
	 ehv10e52Bl5dnMw8Gu33ybHKVKFiYNlhtqgW/fSJ2m8XwjHOK+8h/fmcxeAukiz9IMkxc
	 SvzUhhRKaRY2dlJpvnnvEfMAmq4OoD/PeBL/OcodDpYhZYhZ6kqYB3DFd0nwQIkmZ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VmZJLHAd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC64606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VmZJLHAd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52001F00A07;
	Wed, 11 Nov 2026 08:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385966;
	bh=USEsdXlX1oFJn2c8dSMKEdmN/SI4AvTRNzLhCan8R/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VmZJLHAdEHsIModoeHwEuveJGmYmc9s54WZT93P2K6Gv6Tx2opW4k+6F5QQelg1Af
	 VIHAUCE0Tvvh/9CticcCeewl7WXS/O3+aJpDqRzoN9IHpCswfcHrW4JjOI0MvXMBa6
	 l9/lLslGCv5c8q7+UUxbsia2DegXbpbAydJIPG2q6KV0h1qgiVtVPXdtxSTXOr01y1
	 78Nfy0C1rG4u07jJtLfKfay8xzlXM7BWkSYzrAcAMcQVmNSKJoGhu29Dasmcn4Qvwq
	 NYTtV/H5vQ/8X3lgQE7Qebu8uUGmlKfuXeBkVDIK7qOhqP25WUmG0I70oM/ghepSJ5
	 ZnA750D32Uwrg==
Message-ID: <sashiko-outbox-208610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] hwmon: (nct6683) Name the fan headers of the
 ASRock B850 Steel Legend WiFi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111082838.1418051-7-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-7-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:32:45 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> With fan control available, users need to know which pwm channel drives
> which header. The driver has no fan labels.
>=20
> Add a fanN_label attribute, visible on boards with a name table, and name
> the channels of the ASRock B850 Steel Legend WiFi after the headers
> printed on the board: CPU_FAN1, CPU_FAN2, AIO_PUMP and CHA_FAN1 to
> CHA_FAN3. The order was inferred from the readings and the BIOS defaults.
>=20
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111082838.1418=
051-1-jdahlin@gmail.com?part=3D6

