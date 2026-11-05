Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882840;
	b=ytTzPd9p+4X89mTovVvhhC0Yf5u7XnifKuxrlrWCya5Og/KAZ/nxVgP2MVm44NRfruGL
	 BfLuDJLnOyDBWLZryO7F7uzIeZZVScl/q6xo+Cx6Uav5KKu5Un4giLUR6FXnxxCVjTYCN
	 6zUbuo7ieEihVbDNxjrALSBjOxVqDNCHqY3wt/58p8jHJXWQwxeN83zfNzcHA0sWx+Be/
	 1OEInolImTPcECfhBNmmYLHBWGPhviBUVF7f8z7PKBhW8iroafEHPzvGSFfuQxh5WvBKi
	 XYf07+tclgtLWG503B5GS6Yy+rX6Mi8HjFVUDThq0pQXeidfdFjiAQmp1XGqoVuz4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=klwLK7XcQzXRmzC5cNt8XC/sSv5QcgCiNbtTmSrA3XE=;
	b=Vzo3WJJ/0xgKq1kthA23xLJxrUR0T7gB7Tg6+70qx0Hweyo6oExEGqXGr5hAZsZPZBNI
	 hBS64xStUJdMlu8JmsXqwxtI2jm99sqLLXWs6uXknESIa/xdOtgOkQZ2DLhez0m/umS1m
	 mHDJieeq6rJP0tzRY0CEGxkEFtbsZxpReNtIeGHYcpDss+EwfJLKSbIJMluPAxVkbUEmz
	 Pl7ixG5sBIbSMtIslwWHinPOL/Auc3jZhjNtqrm8HdIU6GMbybC/r2NlXYrpWEreYpV9Q
	 zZllCwE5L8fB/Kg2EYnHe55zaN6lguc7z94cVSayzbL9feuWZ9yOPS/i2qvi45h0T3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blSngy+n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B3606A328
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blSngy+n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB021F000C1;
	Thu,  5 Nov 2026 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793882839;
	bh=klwLK7XcQzXRmzC5cNt8XC/sSv5QcgCiNbtTmSrA3XE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=blSngy+nPJq/htquQIq8WLVpKBX1h47ogdpzyUFwLIJlazlzShs6oAsJG5Ley1aHf
	 WtOmPltWlPVJFlXr1qEcMBQ5OXbjGmH4dO0UBTw05/aguXKHDBQXd3h4/tXhBu6ktg
	 +lj4/hb2FGvCqWyPitbL3GtiIes7lMsnj8mIypJODykX39aNlT3PjW5izKrWClkxbX
	 F8ZIAIfBD8lk4dA9KidJWsU5iiUgT2Vawtq0IYQCd7v/nHOfdGi7H4LNy87R9YHjig
	 GkT14hic+hw8/83PlN4glq/XpWgBVcS7w1E/1OOMJucgF4BgDylzk4glCZEF9DgI2h
	 J5D5zLlgBsI7A==
Message-ID: <sashiko-outbox-199058@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] unaligned: introduce be56 unaligned accessors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261105-topic-sm8x50-iio-max34417-adc-v6-2-63b4e8279633@linaro.org>
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
 <20261105-topic-sm8x50-iio-max34417-adc-v6-2-63b4e8279633@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:47:18 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Marius Cristea <marius.cristea@microchip.com>
>=20
> The MAX34417, IIO driver, is using some unaligned 56-bit registers.
> Provide some helper accessors in preparation for the new driver.
>=20
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> [narmstrong: update commit message and move to include/linux/unaligned.h]
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-topic-sm8x=
50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org?part=3D2

