Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168255;
	b=Qe+Kx9ir6n8+8cQZqYO5bYEK2Pgg8a3ranaqZFId8oluy9UoE35N2DYL8FWdMNMRTirS
	 7ebvN+eoSvK4GX0DCGgUzvbBGrhqdCU1v+sGEtOT5AuQptFxTvlcm3qpYa8tgffQs453J
	 Xc8CPxjkb1qIyZUIW4TDsqy22ALKIevluCrJqI0mRPuZ509aeBiKnJ4yM+qaTRC5qgeFj
	 Tvnzp96UkBQ8+Ajx6XtDOu6pXoVy8x0On5plaRsmOxWE9MZ6JO7GvMpYPwHQIFYCXuR+G
	 LeFHcKV9ddcL7xhOYz6k8EhlPEgHWfQmOUJ4AkDk4QLzD7QKaZhpGIuLng1DsHppDNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168255;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2DXKSWy581ksM3KeLSgBw66+Dh8xlc6TYmqr+IKoseY=;
	b=iYR92dnYSZ2d/iz9pAbMRo+YQ6JXbciYjJNCmL827z45M2gp+cAj2pXpaOWLwPny3sCY
	 cuv1YMztH2HX634oumFMvvGiC+2m/p+KTG6Hy11HJ+f5nOjpuTq2vJRLoEOw5jIXfvttR
	 H4iG30tpYfGLikrkOwI3Rp6L9G1YGGpQvIx4WnCH5S7Se/j77ypK3jJefd+ojthH58dlH
	 eWprC1WFr7kkOAjrUuf95Pv6kvZmuhjyYHZDD6A6YnFeGxZPVQO5Dq/Ffxf25PUQt09ok
	 yQpITb1LfvuVqYPQ4VOZftlo6cGB7bRzFOkbHKjs+ZpEPAmMOB7y3Fv7QzejbK2v2Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b/YlwCYp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F47606A31C
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 20:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b/YlwCYp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1E31F0089F;
	Sun,  8 Nov 2026 20:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794168254;
	bh=2DXKSWy581ksM3KeLSgBw66+Dh8xlc6TYmqr+IKoseY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b/YlwCYp2XE+XNNieFau3VU8ATPPMhAJh/WDVU1RYDTaSJWynMhEthQUf0wRep363
	 txGtwtljPstYu5sjI0Y2BW0fJjGjqB9ah7XX2vEXv+AsVqlGqP0OK9EVbf7cH3Jarh
	 EPUW7d0A6cR4w9pbOeDTDnVwvQnAn5+zAG4zhC1nKR1Y0B0V2Gxe5ZFMDk6QMI23al
	 GrL1+v7AAdK/jEz7wzD7sXwJyEBIGhE02k2CBqVG0ZUAgKkxtbM+FbNUmO6zGyFDSk
	 abEyPZeG0e3JA4ETsBBhoo+LcRruhBGy5+A/AsOIBb7ml6xQQk1ks5aSHo2aHtJ3Us
	 ZWJ6MhpNemy8g==
Message-ID: <sashiko-outbox-204002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus/core) Add a vout_command debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261108-for-upstream-pmbus-vout-command-debugfs-v1-v2-1-b19d6cd18aae@free.fr>
References: <20261108-for-upstream-pmbus-vout-command-debugfs-v1-v2-1-b19d6cd18aae@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 20:04:13 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Vincent Jardin <vjardin@free.fr>
>=20
> The vout hwmon attributes and the regulator get_voltage() callback
> both report READ_VOUT.
>=20
> On a regulator whose configuration applies a load line (droop),
> READ_VOUT sits below the setpoint under load by design, so user space
> cannot see what the regulator was actually set to.
>=20
> max20730 already exposes a driver-specific vout_command entry. Add
> vout<page>_command to the PMBus core debugfs, for every page with VOUT
> and a readable VOUT_COMMAND, in millivolts like the in*_input attributes.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-for-upstre=
am-pmbus-vout-command-debugfs-v1-v2-1-b19d6cd18aae@free.fr?part=3D1

