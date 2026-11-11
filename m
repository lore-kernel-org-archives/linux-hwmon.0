Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395365;
	b=XNE4C/qGUBbdqWckA9wqgGOfP/MsI4+UhUOfbVEfcfMsZFrGDzFicPJi9TNj7E9IhfLZ
	 7yRgR/QL92fm/TKHf54eXcJ9j1RBNF9hm9HLLQyqfpmrP6ooZz+/ZPyryP7MNDBcDR/bs
	 cACknE8YvSAeqjYjJYbDaaSWU3TjEPW5JMj3MclPKj8NhFxHAxmG4T51xnnN9+WFVKSjT
	 s5OCcdOO1sO1SLpTh00Zx5CS6EvWuTe3Kp2bNtBIvXkkgPZo/YDQUlQGfVJjcvQzzhqol
	 JC7nlU3lllxrkG+ftrgsPXNvjYn8SD9xkNujEt99ynUWxU0FCAw0zatN2c7+0Zq7guw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395365;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wCiNlJriqKGWPVtoSfVHG4frpZgQQRKfPxhCCEeT7ak=;
	b=FhuMQWK7PIjqXbYYzxaYc3stjzq0FEZug76uH80YGhUm/PHgxjpPIIi/HempKCqJe49H
	 PkMkezvLpm4uXF4N3+CReaJeYHW00fkBmuZ0LFHj76DnRXrf9Q0Gcs15xCU8oxGg7oDH1
	 RYFbIstte5MXq7oH1V94a9LCY4HMUcUpsFDAUAV0qLmQ8+MGR3S79CoH8SFXIqXYNnjRq
	 pkIDtnwyL8wok7+vGY03Utd0qEx8sLe4k9KbQ+2I2zCbvT04+WrT9CKQwYcQptuLs5wK8
	 0SVNnWg5d8y0rWAWvKHBxzf43pvCPSLrK+jM1KsCltgqRjYcx7UhYAve+FSjzEMfpVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OY5qobBR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33823606A321;
	Wed, 11 Nov 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OY5qobBR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F571F00A05;
	Wed, 11 Nov 2026 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395365;
	bh=wCiNlJriqKGWPVtoSfVHG4frpZgQQRKfPxhCCEeT7ak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OY5qobBRm2V8B3QnMsAxfsOCW1b5VmPtuVW7fWo2ZV91OEVg8ykfK8zUKm1ZmVLl0
	 CL1MgzZx+oHsr0oU1tA5TWH2nklL1fPobFMxkrIEqPWHvHdEPY7e+c47VcGT6XatNG
	 us2OPfKvW9WoQrzBoVgDHg/S8DHft2yxMw3CxPYIrrgKYqcx/lNDoAj76BZAfx34f8
	 7YZMqjhFWvv4CkOzpVqMrUP8R7448m2s3RIqhsS4sPzkHmrqRKDs02Pm5vzQ/1ZCnt
	 XbpILDyix+Z8z4Baq8Q7kbWR/aOzNs+gcKHJ+gBc8UL04Jfd/wXJqXDNviW6VtE64x
	 2CXZ6eny7ID9w==
Message-ID: <sashiko-outbox-208852@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] mfd: bcmbca-pmb: Add a shared BCMBCA PMC3 PMB
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-3-17035a5e8ad2@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-3-17035a5e8ad2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:09:24 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add an MFD driver for shared access to the Power Management Bus (PMB)
> of the third generation Power Management Controller (PMC3), initially
> for BCM6846.
>=20
> Expose an uncached regmap to all children, encoding the bus, device and
> word offset in each register address. Keep keyhole semaphore acquisition
> and transaction recovery inside the MFD driver.
>=20
> A software timeout does not abort a transaction. If the keyhole is still
> busy, retain its hardware lock and reject new callers until delayed work
> observes completion and releases it.
>=20
> The keyhole register layout differs from older Broadcom PMB controllers.
> Match only BCM6846 for now.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-xg6846b-bc=
mbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org?part=3D3

