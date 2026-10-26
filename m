Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792977983;
	b=Cqd2sgfJAQDAhu2eCfeCzaD6Yjh7Wth/4tXx5aCYf9eBdvx1EXCZHnNo0BqUCZY2nqOv
	 6s/SP7cWqDrQ2J7mLoSlp5+vuAIELhwpDXBVn0MFXTz3uGr03Bd2rfhFl0RwodTQ8BhhV
	 3HXOYCPbuq/sy6EvKZ99KXHnW6TW039qZmQx4v6c++1lDqw5s6covB1mDOYarGiz+luxv
	 nPRQL/QBnyDmoIbio5o0/hbNunq0vstJOrXzPj8Wa7rTbTpoNd2mKF0sT5Yt9ZupzkVxM
	 HbyADGrXlY9t+KCxy9wuQ3NG2ctchEyruJ34wYe1pRwlw/09pIcmbu/mqZBsklOE7og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792977983;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7mzXgMhzkWxVpNYh+j6EcsSmRPEVe8uhkqUzw2m1rmM=;
	b=EaetKStB4W+3qc+hV3ACxO0e+0kkBp/+psmaz+SMSIWEPl2P/5lEAht9PJG4Jn8/Ppqo
	 sNpxImhNtlsBGPiB1eTlzx8qVF8L7rM9R+cXI3gDIbKPIba9vScAJZkbbB4UU6kFfnOos
	 ThrDCReG218NOnK3GEEd/xuPYwMbE23K+pHcLN5XC28iKJ7NcmCfdyVz+b9gWsyI+m+uZ
	 chkO8mOBZX4kGuU7ErUxaCKpv2j0+paSsTNWsNG2a5deUWZWv5VjP0jbHuxW8NhTSkzd3
	 QPoMkzzXJrCUGzSDqLD+AsAP/wj/+vV9i/pkaxnap5Fosyqe2m8op1/39F1o1yMFRzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0WTVaJJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3719A606A31A;
	Mon, 26 Oct 2026 01:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0WTVaJJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC521F01825;
	Mon, 26 Oct 2026 01:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792977982;
	bh=7mzXgMhzkWxVpNYh+j6EcsSmRPEVe8uhkqUzw2m1rmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g0WTVaJJwgD6R16JB4t3uji82lAjowv/fISqL/sfrAGkBb6OKicAFVsr9LKeRGx7S
	 7FGh+0rcHN4kr/JTWo6CL0NDvdruhXYC+9KjVJ1cm8pKW9A1/gWCBcoUsIDA6Eh5Pb
	 ix+cznCUbyBGOj/1ZLRr5EkPU7J8xxIa3CHf1QqEIwB2EUs/An2raFNC5mTKlw0QHR
	 x+JON7qIcnJhJpmLQyJzQXRqGnfb1DKWdsqMgTOWzyKSaU8IsEiRYfn7MTSMINnpWP
	 HZ2z98mWLBYoZjjIZs6KW0OlI92pNdRbnZpyCwSJ5GnFrtRVMa3H6+PE9QfYPcslSf
	 ZgGjS8VO4dnQg==
Message-ID: <sashiko-outbox-184573@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] regulator: sy7636a: bind to the I2C device directly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261026003918.155321-7-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
 <20261026003918.155321-7-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 01:26:22 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> With the temperature reported here, the regulator is all that is left
> behind simple-mfd-i2c. Bind to the chip directly, as the TPS65185 and
> FP9931 drivers do, and drop the MFD glue and header. It now probes before
> the GPIOs may be ready, so report the power good GPIO with
> dev_err_probe().
>=20
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026003918.1553=
21-1-pmazzini@gmail.com?part=3D6

