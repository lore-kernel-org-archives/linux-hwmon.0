Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231873;
	b=bUtTBPQR34Pjw/I8BYksEwnJIerqAoFuaoLGbGkStqqf90tQVf0lLQmtx9U7uSfYetbv
	 DRrLwZd8XdMu2cmnzh2HVyl/aMaG7e62agtkzxIHnv8Ne6AORSlNvt/vcMgoAAhFd8SUp
	 xTPy2SVm+XVoPtvwuq+RlfRdwqU9C5rwDCnuHlRGa3nxxTI217bat9ZJMTjzYDbDyOEvd
	 qUoGf8efaBl2dm649DldahzruXN3bto3xsclbWGgvXYaOp1HtAPAq2OsfDOuj/l6TsVVL
	 oKPqXPL6IZzZMzFYJX3Y8uKfZK4YuMFjh2mV9NBkw+Z9LwvMa8hgl8uvVvGj/aSxHwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231873;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0Oi6k98HZq2oAEcNuH1zZT+hK5cXuZMXT7CqCUzVt94=;
	b=YCjUXXoKlZRmxuJ0UOojRMTRJeb+Yz3TYHXlA5Nx3dRyQFyqKyzDkc34cJc3vTbr++HH
	 10qK3WIPrjClEiVPSTANG2bfu7iLeVx9UfTf9bcg+/xoqx9lGd1b9+YhwuAWStkTvGUV6
	 JW9kP3HF9NuS9LTpN16sDlZNXuvGRweiS4V5eIqJDMTLMObukJMscKPOe3K/YEteUrcXX
	 N2aTFeoJp8X+AqP5MI4KJJr7VJqDOvO5Vzhfah3LEj863VxyM0w+C6rjcM8hyLzyhyUm3
	 jxu/6wbhScYCZu80dxvf33FUeeKkszhAVEfGXw/2mHJkhF6OoIutN9Ac0r3Zl1chYNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0ExqXuk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BE5606D82F
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0ExqXuk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3821F008A3;
	Mon,  9 Nov 2026 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794231873;
	bh=0Oi6k98HZq2oAEcNuH1zZT+hK5cXuZMXT7CqCUzVt94=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=d0ExqXukzdoQuNcyghimgUVR2Uzd0Tgt6c9IBT0SQ8SdOFDT/wjRugdNoGt36sgMS
	 Z8w9l78yH5dM5e/MKdYLCAvKvuaGThc/Wox2TeGHtoEKmO7g5DtoHooKxjwsjEeteR
	 VcHIioBBUiHfAD2SYcjO9IlkzOrkq+qWf4VSF9lVF99Oq6OlPT2op6jIA0l9T6Hz+p
	 j9Rr69agEU2NHncpa9U6QvDQlrvQNzdJc7A517ZdtUr7qVaWBK7M0dNHX6nuEQId8D
	 M9dAYt7DgjKDQVabzLkWNXyqzhiRH1Twt0P5JPk+mUqqtrY92DVtEQ+Ih+ti51sSAs
	 Bs/fTRj8KG7qg==
Message-ID: <sashiko-outbox-205026@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] hwmon: sparx5: add LAN969x PWM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261109133609.810876-4-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261109133609.810876-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:44:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The LAN969x fan controller provides an 8-bit PWM output with a
> programmable frequency and polarity.
>=20
> Expose pwm1 and pwm1_freq on the fan hwmon device. Parse the fan child
> node's standard PWM specifier and use its period and polarity flags to
> configure the hardware.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109133609.8108=
76-1-robert.marko@sartura.hr?part=3D4

