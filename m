Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882767;
	b=X+fDlXZUwnxAKeFaihClgwntMP9Qb81qeFVB4xirweepn3fSb0dPW6pfs2DECJSgYsTM
	 hz8WUtiKEs9yu/SU3poWpNeOU4bTHf+OTAXk4GwEj/mqUZOHKb09GSIC5juWdYvZ3rL4c
	 RPEo2ixCyb4FjO8uXIV+XdVrHf3qMfkOB1lf39ru9UhTcHiGoOVPzCk+bUJm4ogZD5WVU
	 BbiV+fA/OY+RgySutOAimgWabYbaI803L7SVC5HMlbQkSp5ml5reH+7w+dlhh9BEKm3tY
	 3NppsgwxqxiysyaU601VEiD9hHi6aQt0teH8PU3itxVSUqu7xBCb1yTTIbOHjiwEQTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882767;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RkE03sSLrfGSgdT6YN8wVVmn6uwjG3NCSbwj8i5+ptg=;
	b=k7z28/VGDI/pk2rhaVPCvXC5V4yzY4F5LnWe+rOZXTn8PVVlR3LB0YZC2M06puyBhl0G
	 OhsCg1BlXq5PljS5PPSzTJffHz5u2yhlQd0qAGiGp/JJoHApbdZBt3BFOD2O5r41t/Rw4
	 U9kKZOUncfgSY+bGfmwMupsVu6FohYnib0DuqvIbiW0B+DInnUa33RAez0/FmIz9IL3Xe
	 uMn92/jZE454ESfZFwCylVRLlr2g3hJV/p3p3nK7DcCDrGgWbQ05GV16BVe8fjYBZAks0
	 65Y8fWaAgZdvsvvU0L4zGvLZwUjnLpRmcn2X4i5ZO9SzyuRPBgaJEcDmiev1rtj/bPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMTjbkn9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0505606D828
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMTjbkn9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C891F000C1;
	Thu,  5 Nov 2026 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793882766;
	bh=RkE03sSLrfGSgdT6YN8wVVmn6uwjG3NCSbwj8i5+ptg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMTjbkn9oWs4J7SAtWUOclj1+rcvXn4c95nk813kAqrr9Vg/2fyu5g6kBzfpMY4PL
	 ki+wTUyDQ32/2pN7RV61woRADFfUIqq2SW3zmczpNfZWDRocfR+3BAf0daCI34045u
	 f+hP3aS7b/iG9fguDdJWK0EAhlHDAIWD6R7+f9Fbj67WYj1a4vHCUcQ39UhmGLotoK
	 hH+gf7D7b46Y0bSFOpUnNeXgV03K5sjavjKvHsS6+IOF845WmSXkdghpKPWetS6BC8
	 OC4tsmcsrdMtRPdd1clsWf/mRfG9vqmUjjnysqj2MQpOfOsF46+qXXIgHqYgJ8wLCC
	 TZPd6jbsoqcrA==
Message-ID: <sashiko-outbox-199054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261105-topic-sm8x50-iio-max34417-adc-v6-1-63b4e8279633@linaro.org>
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
 <20261105-topic-sm8x50-iio-max34417-adc-v6-1-63b4e8279633@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:46:06 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Document the Analog Devices MAX34417 Four-Channel High Dynamic Range Power
> Accumulator used to monitor power consumption of portable systems.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-topic-sm8x=
50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org?part=3D1

