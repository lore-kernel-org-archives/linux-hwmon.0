Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698742;
	b=oPYCXV71DAtLf8D7fr9B8CVuuzsdOjiZwfyF9AVfA1NIo/GzELeyHPJhjYQR2s1AbN4k
	 tdtZObhG5PBVpJ1D0nxx160R31/zSoyTAAvck5DKjLBaM1FYYYfwxhqwAV1CAIytD7OIY
	 65lOdPYy8b7FAhGdfoZTBuF9cTMsMt3iMshlfLAMQOOVnsAacYwK+aPxiu+ugCTDFagCB
	 ZQK/G2yAYSLc/Zgmw+uv1UZ1B33EQ2QaWX+zdvbAi/wwhxea41YWbMfB4MlomoV91+Gx7
	 tQ12ZB4qP6Uk/GE05HJb2Fr2NIP+LXLd6nzl8weRT4/m/QTm05ulIqeUKNVkuWKmSmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698742;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oJU5QBJ1mWvrqulha3gXsDilcwBaRbWfJk4LmIozynQ=;
	b=wiSgVnRNw6iyL10z1drWNRFq/RO8QXrv83wPXoN1Vtbxi5EVhTeAxw/i7HKNR98/oirq
	 NFB5VEZtQXrC3f0FN216xK/jBZ17OnmKtc9CmBaxCjfnv5dtwBYp6yUmrXPHxrxNMYTE4
	 k7KCzIegeGn1k9em+vjQD3m20a5PlbKT5b1jcv1Fyu5P0KM62WGKFzFc5qWPrLevfrCsV
	 87zWUkQyqE88JCjGLr12+OEOC19XFJoCZQ/hhJd4VXtItGGZpIsQJeDs3c7i2fxOr9CW/
	 al7BVWKknNP1Bw/nuOv5cluwzxeF0Esp6kd6tx25Y6cd75/d4NHz6fPmVqpU0rcy5mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGjK4gF3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653F606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGjK4gF3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166951F000C6;
	Thu, 26 Nov 2026 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698742;
	bh=oJU5QBJ1mWvrqulha3gXsDilcwBaRbWfJk4LmIozynQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VGjK4gF3XV8clJ4/Xqh1hKpASgBZObSbu5XU1BMunMU0jbAmzYZutBe3exdKeoQSr
	 25iEWNdg9s05wIeWkPLDApUZqf75Pg2DOt+GqKwMOCSv2nAk05SVMvFpWuFE4t52yt
	 2ZuRso1EX+PYL+fuWTEybQD0XrB2XUKKSLbOgKohTHfAYAP6wGfdi24i/LVrRGNBNr
	 p6gWaU1V3n5Qd99igEtcLSND5CW1+K72kXqoP+P/vAB0FHAa7YdyuyzXrJqErJ63Lw
	 YP6MQLFEbILnMAAxp07zAp3BX3E0dJnlA64upZ7Kze9XzOyy8MI07/HDtz/6xAbx4B
	 QgRSikvcGUOKg==
Message-ID: <sashiko-outbox-235576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 0/3] hwmon: add Raspberry Pi 5 PMIC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sander Speetjens" <sander.speetjens@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
References: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:12:21 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-hwmon-da90=
91-v5-0-0c3570ba9133@gmail.com
