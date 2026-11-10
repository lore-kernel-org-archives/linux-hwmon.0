Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305028;
	b=aTk2tNaxEomFfYmzzmwNTsiTOvRPMzX0FGIFMLdUoN43xf5qhE0fT/wQMohzYpAhJahB
	 r9zW9m2W7nz9Bf1MOjd5K7tOOCAt1PZf7Ugzp9+CxEcPRMzaorWxQuu6/cnsuEX0bf+Hg
	 1jYvNKI0K00W5pcy/ZRdZcUXQA45pzCC/EKciLwolatxX8I34Sdy7/A/xV7px1NIPQoAM
	 gEUHpY4Sq02JBLfhGcfbw4Ez4RDkFPkAVNQsxZouu/2+T6pxovGtwKz5E+boFUDOdgVLU
	 gpuAVStLqCl6B6NTekKcwbJ2WYhmnqgmzPABu5obWIgGdPOYwueuKYG1dzJHmss/wCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305028;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+sscDeBztIzDm8URBVhpN2bkK08k2AqonyBKORGueBg=;
	b=GJ9xEUFvIyjUVTo56k1+iT5cdbxMLojhk8YDBVsNa8EfQMjXlUxrjSVvjkVNrTrTi2GL
	 VjtGPAdLyPQWBfPrBmyOY6vvGdeZFf1LbyJWimzZoEZw7AhXQiE/GG0g2MlqnNMKjt7c6
	 nFMtHQDARdxaUUo5vMjwC3FAfrqB44xdFpLwY0wTf/qdIJ3gv3VpfANzSIT/D6/9BdfuB
	 521ayDcqJuInSrzdPD/5L7HlZcAj7Id2ImW+RR+rWNu0oB8wfGQO5y2O6gsQT5XtBbtbC
	 aG5nGpWYK+EwV9Q+stwBUHqhpDB8kmZ9/6ygGpuJhFVqXnrk3PjkqK/jPWRxsnU4bgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntuMcB7O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0A4606A325
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntuMcB7O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C5E1F0089F;
	Tue, 10 Nov 2026 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305027;
	bh=+sscDeBztIzDm8URBVhpN2bkK08k2AqonyBKORGueBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ntuMcB7OHGnXgNAIutapDgb1Bb9YvRNMGEaxgc9tlDev0W2vX/pqK3NVF4vrEiDyS
	 oS2Tj+oKr77cvGqVvVtpE08reHNOxpkJlAY1R/MzZHnMI6cr9/ljsvFC1Agj8fxNro
	 wm1SBwRj1HfD7mJWIJJLN0lRMPg2xagvKXlgKXEu5RYj3fDLPVcOKRXLTrhmX3Xg+/
	 ce1Q2vBmjb7T0rbV+7WZgiqaRCwjMAlwL7Eich8lgcAA503HjkhRZTtqtkTlwXlmBx
	 atG0emWXWhkkB2Y6+ILwMM7+nZffKwS3vjl+2BsN/SLsfjIAJMOfleBGaS0Ot6eebH
	 lhdkLWf15AsHw==
Message-ID: <sashiko-outbox-206831@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: ltc2978: Add support for
 LT7175 and LT7176P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christopher de Guzman" <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:03:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Document the compatible strings for the LT7175 and LT7176P PMBus buck
> regulators supported by the ltc2978 driver.
>=20
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-upstream-l=
t7175-lt7176p-v2-0-dd60d28383bf@analog.com?part=3D1

