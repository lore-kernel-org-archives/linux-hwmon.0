Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368630;
	b=DTQoDQNnsqOnkI/qWljl4bmeQWvuw3NXTWZBGKF60iFMe0Fu8AehT1+jA4PRHV+HhDCz
	 XsuEgZBoAqLViG7Bv0J3kn2vi6eIsuYi/vk8vX4WNs3BtJG0ol2knHJ6XgMs6ndPvC57p
	 IXrKHdeZRQItmCdqebV/d11D0SVahpB6TXX4BUHj4o35cYf+LnhxDTxo+K79KmEnsHm6r
	 mGYokxKZWfRewrcziZg2er5Hg7lVvWJKViu3nOA1xUNAxFGWn84Uiwo5ziythTO3LBnSI
	 SkqRrKxpzW6PvslOuoSEKUuFVfZE82lpsryPyHTi3Z2OvBN1SoIAMlyqXNnNUB4zZYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368630;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8qJs8Ryx1A+ru/vxL5GjjfiJdqX6he/QY4cBSmvNJCI=;
	b=hRnS1tLt6xn4ojHQ9oaqGMCi5goJw268nTC6XS/0z+di4fwXclER3R0FvM/YgKlPEUMS
	 d36AXF5BS3XI1mDFYNdMx0Pd7C09tDKg33rOFzh/eut5JgUp+dVKu+ndYfbOm6K22lxab
	 J8NTBBhEAv+fB/K53mxAbpcriO32Cw2Z5AJ+RQlSOYC+97Y1evEQdQicD2Yiti3LE/xMm
	 lOcBj5GbF3lTM9KHc0wWXYcMRnVqU2U6bHDwCyz13qoMNwuvzaDOOtP+BCwnnRt1e6V4d
	 Wrsf5o/JP2Fka2ISmj9Jycb0VHq9IoOVBW/Zcgahw+qI8H4d9C1kmCb7sCAzidmdukg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kmkT6XQ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0304D60A2603
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 03:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kmkT6XQ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C4C1F00A06;
	Wed, 11 Nov 2026 03:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794368629;
	bh=8qJs8Ryx1A+ru/vxL5GjjfiJdqX6he/QY4cBSmvNJCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kmkT6XQ8izOdR6Tq6tsShnU+C13YsITVn3qc1AumSFBca9sawvLhv08DyH2qNOkI8
	 l8trcPPPIJHpBnSoMEwi4djOU34I2w519lYiVGDrVLIldX9Ivsmj4mR6lFbqXZour/
	 X1bOj4BVHgHqzWrtMrLbiWBLxOUvXMcw/4wBzYHbScrHogxsB+PtkPivjTMQaaRE8E
	 2krEntKnAlZih9H5mi7xypZj5ZD61hKE8OZdTv4oqIdvmfVXFBLwABDoWLDqKTQvyV
	 2gcpqV6DfJJfjZ+0xUdasSmrUwmw6Ip8VxD+I6NGRdbDHxcKLaK/V93brnXDx9Lp5S
	 ONjxkkTbphevA==
Message-ID: <sashiko-outbox-208217@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Clamp fan control times before
 rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111033954.12468-1-zhujun2@cmss.chinamobile.com>
References: <20261111033954.12468-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:43:49 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> store_fan_time() accepts an unsigned long, but step_time_to_reg()
> narrows it to unsigned int and adds the rounding adjustment before
> clamping. For example, 4294967295 ms wraps and selects register 1
> instead of 255 in either mode.
>=20
> Preserve the input width and clamp to the maximum duration for the
> selected mode before rounding.
>=20
> Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan cont=
rol")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111033954.1246=
8-1-zhujun2@cmss.chinamobile.com?part=3D1

