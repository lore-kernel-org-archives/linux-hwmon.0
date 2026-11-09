Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219701;
	b=zlquFwQZXpWfvQQku1KP9RmqL/pHwotCvhvkky/jMhDC9msxZfMikPxTi89q4YmoXYxE
	 zMt1LHvGb3+04QqFWL1py/96EDpviNauHJELulcgTvKAObjWXjhCg2EU4NiB9pq24Oul7
	 RteP1oS44C6Q3eFRpLeKAhuh42Oly/MXn6CSLr0UaTih6sNA4/iCCadX2GxEWXUAEDl2g
	 lJE5F73eiIM9axYN/WUzC1hXskY82Z4s6NakD65CWHV4AMqSj8RoWagvBSzKFopxZwS84
	 rumEPoCb4k17H0c2oeFQLvtgUjdDBqPx+RnzSyUd05SDJg84MgXmSCYnZebFfK0lLRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219701;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IMUuNKBeEweg993DfHWWIWwG75balhf0mEaVUinjZs0=;
	b=o4JSbh4VvCRFXMivmCtE08Q8co1HzZc/GBr4Syun6JRx6X/RwsZqCPPTWIdhvFo+HGgx
	 6OCqFD1aLQ4ELkSZUEQCxLiOMRezGLei/8L/r7FqDqLUrCLc1ZikaS6DHJEBm+tCxo2B4
	 cj7h7THP+VvcWKyWmJ0utEIoS2mjjZ2Ncw/gWIdrVy5+6rQjROmCpjkgO5YNi1lTSQCZW
	 ihrP2yZJPQSAWo/kQe3Xkb5Cuj+l6+D5gkmYMpSPJZvfgvzznPjr1wWEyoY5f1QXeYYUT
	 csIIykKNffqBku1Ap8kcPbjsod1XZBMs8lgO5Ccbm/mtL5/mNyOGwqPElqOw8r3eWWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJ3c5kzO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F606606A332
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJ3c5kzO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880EE1F008AB;
	Mon,  9 Nov 2026 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219700;
	bh=IMUuNKBeEweg993DfHWWIWwG75balhf0mEaVUinjZs0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LJ3c5kzOGaf9zyVJnxKC9+wKvudEAqdeVEV4qso/+etFl291YXCuAyo9K/AbGSxfg
	 5qNLarR15z+AhyMgYKfe1HW2TPGS2xOth3RGK0wRmUQUMghjRjtQfUkoz+MWGek016
	 8BIB+u5+Z2PbcOx/svOA34Sj5bf5vU8FlGps8zj6glOrftXJnhG0fnkr1vTkrtk4+u
	 woF9WN26fwcY1tXzhhfYCnJl6GlLplI/clLMZ2b5Ac6fvWS4qDpNhjRUv4z/DxDCgL
	 lL6xhDkfcaPnVjIukN/NOo4r+HEVKXYTEf5c8EfD3wTiNnMciWycswbxZRewb9dLLx
	 lCgQnpZ2Fr+hw==
Message-ID: <sashiko-outbox-204804@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83l786ng) Clamp voltage limits before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101916.17352-1-zhujun2@cmss.chinamobile.com>
References: <20261109101916.17352-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:21:40 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> IN_TO_REG() adds 4 to an unrestricted unsigned long. Inputs close to
> ULONG_MAX wrap, so an excessive voltage limit can select register zero
> instead of 255.
>=20
> Clamp to the 0..2040 mV register range before rounding to 8 mV units.
>=20
> Fixes: 85f03bccd6e0 ("hwmon: Add support for Winbond W83L786NG/NR")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101916.1735=
2-1-zhujun2@cmss.chinamobile.com?part=3D1

