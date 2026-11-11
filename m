Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368416;
	b=joiqKlqPJxejKvjvLfb5Z6B7c2+W77e5199puSfAFG148Rz1gsl8faVt2wjQv4bMyKQV
	 J/Frxc30X74QpBZuPdgS3Fy4AYEfsWXEmA48N0GpVB+37Y7K9VkIqDt2OOlhZ5mFXP+o9
	 OrxHYe6At4ZocAEqiAcO+wsvaEw/+HriFq1ZmsBXQ8ZyCIuKwDVONtlcvT0PV8MmZb4/h
	 PYYE5TQ40bUFLi5HnfJndaArN5G86g2cb1VQL5lIm7gAcwvRgz9IUHr66eja739Gr1fW/
	 pAX1dR1vKwAaydTXqLILY159N0eWjeFTrb8jXkQcVjWqxY1lbl94izwcvzdKojJHwfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368416;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=17BUmV146j+elXPIhWT0nj7UtzGoTrqCPwGxaZhwp2Y=;
	b=E+TNL62FGngQormyOTwcOxtTluiKEhBnmMK7DV+I9v/Etupwt0/Fvha93mXZvhFvEgjL
	 PPaj0nBJCqv9YMPo8jjeVB1WVXipg5HC9OQGHmumQqyYfxoWs/UM0r77kxTBVzwYAJxKq
	 Bz3qVti+pV6lFgJ68KMTiaDiJreEcI7vYPR3vSwtfqtBy7AwGc7F1ZWm2vpOIesOE190v
	 iMGpME5kWIJD4du6CphOssN8EfdzYqa+Jc+bXBEWHzslzGNkLis5s1GWXjpRoIVXd1vVl
	 ciASZKL7GlAa9ri3CUjD27ONdfkm1YaUtr3RhAvH4bUXRZbzhlV0F+koyrG6Rdwf+0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOFovFq3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632C1606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 03:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOFovFq3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9D71F0089F;
	Wed, 11 Nov 2026 03:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794368415;
	bh=17BUmV146j+elXPIhWT0nj7UtzGoTrqCPwGxaZhwp2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eOFovFq3K8PD/8/s2P1AHcguDXP4bRbr29N6DMFQUpa0L3n+E0qnXaQv5Aa+yO6TQ
	 27YA0CsCURKLw98yQOpJtA42BR2SMg4R/ucupVar7rX5G12jmG4YC3UfR1/mtZIt0k
	 iRrISpSoVPifp4wBYGukezxphMGHEcCIIvHAze0lD3x+NNF+HBHgMeKCbYBW2VpuVo
	 TnJY63fyaAFnx4IPVCzwdje6wAUhuci46vUh3yNVituTCCWTAWc/pxAhfbnT8lX1oQ
	 HOSKTxyaliEOMebg0XmEzP1zwLXRGhmePI7o5um16Fet6T1MstV078ahCDVpTHpZYA
	 XHgVW6Z4Tv1+A==
Message-ID: <sashiko-outbox-208214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Clamp voltage limits before narrowing
 and scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111033623.12046-1-zhujun2@cmss.chinamobile.com>
References: <20261111033623.12046-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:40:15 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> store_in_reg() parses an unsigned long, but in_to_reg() takes a u32 and
> multiplies it by 100 before clamping. Large limits can therefore wrap to
> a low register value. For example, 4294967296 mV becomes zero on a
> 64-bit system.
>=20
> Keep the input as an unsigned long and bound it to the register range
> before scaling.
>=20
> Fixes: 9de2e2e84e7d ("hwmon: Driver for Nuvoton NCT6775F, NCT6776F, and N=
CT6779D")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111033623.1204=
6-1-zhujun2@cmss.chinamobile.com?part=3D1

