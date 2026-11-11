Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380369;
	b=HCA0gvBQiSY8HMroNv6JrrKfAVawjZDWKNKFP0sH9Thz510cdRRQ9ahd+fRQ440DhGpV
	 dLLiPflXrHQuh/Lj1cYXuxgXumuntXrHo+EG9AvPlXyqYwU/oV378VNpZchVj9Bxl1MvE
	 wdOZhM9a8qOMGrM3YTiuXvxmTm3YcIle1cWFImZBU/tPG3KikGD+LC0yI2fGHPper+X6i
	 e0VGfhlKm/atvKP1yGLGG1Gqq7JNIWxAotjesu37weRVMeT49RQ2yrTPLclsjw2tzEjSM
	 dUE8kODPRPXCBZjT4CyCTc8AdRaMvdqOrzpzCipQaP36ga08CXe9Jq3/otzD2w0QfEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CD2eA2OG01j1Gsa9ZDGJOxoHRF6A+MP382kwxTV+j6A=;
	b=JSpMSVqHdETDvFe1+VPeY2yJJ56pv/ukT89bFBsn2S3NbJFjoQj0IfGWQQ8gHeBUU4Hh
	 jCziy2rnlCcorhNCQ8Cwapex2y31wDDn0ojJwGOYmMkds8dpklieIuHU1jgyb78sXx70s
	 +4S3S2zG+dEP0oqDp8FkS8r7Ea3e7sgdKUpvZGbvACjfJgzUBWEbp25fWz7Ej7fk4fDsG
	 FWWlytWdF4bZdi70LiTPoiv+2o063QPar/n/WoJZpIT47GJUi87EsIok17NelgzNN+eNL
	 HgiySfNE8akBq3gCX6v9jMuc7DcomaJklHYKJw8vH0jCUsMcu11f3hLMSUY6yBuhDfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eowBWvwE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E480A606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 06:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eowBWvwE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A30A1F00A07;
	Wed, 11 Nov 2026 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380368;
	bh=CD2eA2OG01j1Gsa9ZDGJOxoHRF6A+MP382kwxTV+j6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eowBWvwEByzzZAkRvFnBf4lQfSNR3sSHiIomo216ZVO9CfaWu1yE3kk1/5idl/sDK
	 E/WoyPxR+3j/QavMdN81yUT6iP2cEFF8aqlzxJEGwkHsz7AHfl0gO6IxqaPKXHjAPE
	 RJn6y0ZjP98mskVvQpwflyDeM55lRcSI1pqUODQyAvMTx3Rjc5358fOMDfIJ/H6HJ7
	 d/4Eh/s3hB0LXrMxB+vG82t02xJPqVgsEPhicupl6ZsluKtrbMc+E8S2XlTc13NSXm
	 56wvTsmbvqejMymYxwYNmFJ6LJOL2fJAF2XuNjUVa57jGbsfwfhNgClztleqAWuYW4
	 3CG09qUZcX76w==
Message-ID: <sashiko-outbox-208476@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83795) Clamp fan control times before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065123.17512-1-zhujun2@cmss.chinamobile.com>
References: <20261111065123.17512-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:59:28 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> time_to_reg() adds 50 before clamping the result. An unsigned long close
> to ULONG_MAX wraps, so an excessive stop time can select zero rather
> than the maximum. The same conversion is used for fan speed transition
> times.
>=20
> Clamp to the maximum representable duration before adding the rounding
> adjustment.
>=20
> Fixes: 792d376b4f3f ("hwmon: New driver for the W83795G/ADG monitoring ch=
ips")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065123.1751=
2-1-zhujun2@cmss.chinamobile.com?part=3D1

