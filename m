Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59FD39CCE6;
	Thu,  3 Sep 2026 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424999; cv=none; b=fug8uGKJxO+cTFzyfIZfbq083SI0I0hfrgiXREcYAo2tQWZfx2B9qOdeUgiS8kIQKO+g0wiB4YBzWL98lBmUUikD/f7lOmC209B70FxU9NDjSvfBYaH8C1vMRFzyMyzmYUKPQLyflwPCTCU0JINYT2a7RD53P1W30DuyF92ZiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424999; c=relaxed/simple;
	bh=pgd0rDQ8q/VxaUZdx4CgPtG9c1lEqgFkN2o0cHA0EBE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rFD0TUiUo2Ci0CkjnQCrM846SW1uJtLEyHe8l4k3ibgpkT5PYHu51eV4GjBnpsa7ephCPTwmprIs+DH2lHR1RwsTYA0GSJyzw6+pWVUYwA5VUnmmBw0gHHTMZA6gjnH5KX/baJaYVW7Jwq7GF8Fk0ZkVtjlddLDI6yUbZ4uG6w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/tdJ76m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/tdJ76m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB331F000E9;
	Thu,  3 Sep 2026 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788424998;
	bh=pgd0rDQ8q/VxaUZdx4CgPtG9c1lEqgFkN2o0cHA0EBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E/tdJ76mu6O4rWlmU+Is+tZsXl+bXFOQZmuVzM/Bvq41WX+zefkzg1nr6Q+zlno80
	 66ZFIALDn4/TqaaWL2X4YjmgVPAhyKB7qoqVq8NZeQe495XNMgPzxMkjVLpZEokqc8
	 aEEx27Ge8TLtYN5L58fSCZmGSc6GVr79jcqT0O3Svae4kZm2lqFBl9mpKNFaSn/q0F
	 qL4R0ITstbkRiL2b6mFatqHdRaiUEXi6OY87x/tTPXTYEJvG+dnKzDMTqZWiPqujOY
	 d9U5DwcjCt2rh+kHW84x9L0/alvGPFvBlow8ugIz6wC0i0HVP0n/PbUzJLvYaaqX0G
	 +fVseNmPjtO3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903-axiado-ax3000-pwm-fan-v2-1-ef43df46163e@axiado.com>
References: <20260903-axiado-ax3000-pwm-fan-v2-0-ef43df46163e@axiado.com>
 <20260903-axiado-ax3000-pwm-fan-v2-1-ef43df46163e@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:43:17 +0000
Message-Id: <20260903084317.CEB331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
>=20
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
>=20
> Add a MAINTAINERS entry for the binding.
>=20
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-axiado-ax3=
000-pwm-fan-v2-0-ef43df46163e@axiado.com?part=3D1

