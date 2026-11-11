Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380400;
	b=d22iiE1dL+CZ4i6WPDfyOkWED2LeVyTpD8dUZXhV9XZ4MNexRHaRcJl/YHS2mQDUrAHO
	 GsSQ6WAaJzwdsZkr5s8AzciLovt3E7/yEQGbfgKVcwP0xS/Ir/41DIBpRQ6o6OeujyOh9
	 qofoI+UumTtmn0G+q7z7W+LqSrR1oYh0MfcQG1/sVh27Uy8uApyn/bsVTxJ2Ei1MaPmyB
	 MNHYytYehH28WEFovXMu3x8h19DHBTnKmMAMIszECg7/W+tR8LsZ3PUPe1I+bwEwpxkmt
	 Xm/qIizDc/5XV0tjadhYO4dnuUteoaQWBE4/b+2Tze7GVfZDqfbJp2Gn2rpW5eZbljQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380400;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SYCuPhGD5Dass6uDVSOsd+Iw5WB8TZnb4Lmq/qPlPlE=;
	b=tYB0m+94AMWRNJegzr15tsoNDJhzyjkBXhlGalAruLzupB3dEQOFSoTwTqL5HDFQ+g22
	 K0O7BCaHUzMtSbvnkQHHytBec8PzA0U2oLrsd/N4b9b0lHQOg+x88XInWHkyHivuFYiT9
	 bzDprTult2LGWnYxFlloXS/hV0qbm2kPgHkXKq2kl9YxW9oBoTYebDuVQYFZV1ykmYsDL
	 mitQuALECNQui2DVC0+4pk60o782sdw9RpbvRpg1ZUk0PI8a1z3wkoEamGRFjvPP/UTsh
	 DTF9i/wuP2hW0cMT91YkaF7/fcXbfgc3o1AhAWSuAj+lrBMskt169PgE4hE62sGTlPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wiv1YYoI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589DA606A9BA
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wiv1YYoI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0981F00A05;
	Wed, 11 Nov 2026 06:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380400;
	bh=SYCuPhGD5Dass6uDVSOsd+Iw5WB8TZnb4Lmq/qPlPlE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wiv1YYoIa4HQZDYOh8KjkudTao9+vsjovlOckgJ461mMFn5+PT9bcDDDdR9B1uR8i
	 Sr4ymvo6BEKQRJYFge2jpLBMLwRIvA7zFXRGw8JJD8/GzTURtXmcJHzxPdla+DTH03
	 T9O6kqwovVdNQocxqDhpvoZHsBUMmhMo4L/Bkm7ct937iBmrxZFAPV6IxdbrdoUCT/
	 bc7n9jmpO4xkHd41VxkA8AFRkmRljgzgKBK1FeWGkvuf2qNqHX3CP7HLERCJ2QrjNe
	 /dLFttfl8hnK/msM0KOzjogu/9aqwFO8l+DXjP2IL5g3fYzEzDLBXCyGwg55lkDegh
	 xeM3m7st5LmLw==
Message-ID: <sashiko-outbox-208478@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83793) Prevent underflow when removing voltage
 offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111064918.17360-1-zhujun2@cmss.chinamobile.com>
References: <20261111064918.17360-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:59:59 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The 5VDD and 5VSB limit conversion subtracts the voltage offset from an
> unsigned value. A requested limit below the offset wraps and is clamped
> to 255. For example, writing zero to in7_min selects the highest limit
> instead of the lowest.
>=20
> Limit the subtraction to the converted input so that values below the
> offset select register zero.
>=20
> Fixes: ddca933bd554 ("hwmon/w83793: Remove the description of AMDSI and u=
pdate the voltage formula")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111064918.1736=
0-1-zhujun2@cmss.chinamobile.com?part=3D1

