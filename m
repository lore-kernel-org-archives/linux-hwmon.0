Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571878;
	b=p5RHWFnE7Kps7C6qvu3eV7cKO+17HxfEvPBbo+fUfFNoDaB4R5Hp3atUECeBWets//Tm
	 iFRP2iOkSQK3jfRb19k7etLwnw0UHeuXLuG0PhP7nTmA1FXbd7KK4EvyhlG9K5pR+A3CR
	 Yvz2+49R60q7mcIIP2dcdXs24x27YqtbMNZv79zDzKcgm/lEGIAtxL7zk4MQmrE3CzJwD
	 SvFcWYwyf8Hml18iMSu9saz/zcTGRobGW42vExHgpSkdyBhdE8jFbtKu0CFDNDC2i7mtj
	 8e2eGvg0egiQEjIk2OTHyYDweo4iFRObV85M/EKK66BMnATaAaYgLPSRSQRS1lJNPcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571878;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tbm5H3DCzy6BrZq6mgqggrvq8SrLPGIVAkSHy26xf+8=;
	b=jMK2SawMa9FrAOB/LPbm31N+yaB9vnmYM5XU2Zb3TYuIzyMHaTIDow0KnhVZaSAmSO22
	 ZOUgYjMlyExFMu23Y8SpTjBGNW0JnjOZmqKbRW7nxm2cOdNElrm+us2eIX7fzteHC7kQN
	 DVFzL6wFV38Iy0UEL9bf/dXA0PE1mMc6KfU3x7qoa3vEAHh6kwQO0/DOt8Jp2pTgwWo+M
	 A98EdHaaJ00W+I9iS0GOERvrcOx3TnPsZhun/pEXcW1NrP3ebqIuHAf1HmZnQ1yvizfdu
	 2PenUdNN1YqzOmRltrDD+qkIUs/ed/XQrQHb+LrsCGO2P6G9btf2jirq9Ujd+KHEstA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k4Rg5IbE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8504606A6D1;
	Sun,  1 Nov 2026 22:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k4Rg5IbE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847901F00A21;
	Sun,  1 Nov 2026 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571877;
	bh=tbm5H3DCzy6BrZq6mgqggrvq8SrLPGIVAkSHy26xf+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k4Rg5IbEEoTuHGsMmvtUuBxafStzhNXBGq+84rPXZoewW1ggG7saIcOLbPyeSpUM/
	 nu2lvrdZfi4o066nSzIAxyJMlTEmk8x8HUKYyxIOXHn5i4679NGuUxCRnmDbIEFF7k
	 vEMnq40QhCzQyVEMU1awXFyAJto4YD7EfYitmWTzudjhYmfAyYd2keLz8URCDNLJ4G
	 qrYRXOyb5a9GqIgZ0XcQq0bCzj3m89fc0BsKpu2gJNUC5G8Bqdfn719CE7BKuvo1Ik
	 1Nnrj9yZwlo3Cl662T71hXU4pVZA92zVP2s1SrIehDD5pcnyuC2pCJiYedAZSON+iA
	 DJCcZcYEp2l0Q==
Message-ID: <sashiko-outbox-192710@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] ARM: dts: broadcom: Add BCM6846 PMB clocks and
 hardware monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-7-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-7-455fe9eed5ee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:24:37 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Describe the PMC complex and its PMB interface, including clock, reset
> and hwmon child nodes. Supply the PMB clock controller with
> its 50 MHz reference and connect PVTMON to its clock and reset
> resources. Add a SoC thermal zone referencing the sensor child with a
> one-second polling interval.
>=20
> Leave trip points and cooling maps unspecified because the available
> BCM6846 documentation does not establish suitable temperature limits.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-xg6846b-bc=
mbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org?part=3D7

