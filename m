Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268332;
	b=dUXEw2cIjPCFrf4Aejr6AVwgir4yCqEMrvkXA7Lrpi5rSUPXTzqOvfsJchGGUbPpKs/g
	 X7G6npQvqpWk1h2t0vRzl7Fs/4GlnYaP3qulxAc/r8AGqymtJcWIyyOBCY0hxzoYaq+fM
	 Xn6Pei7BHxpVXhHcdon8sizincHRJwLv52yZaAobABJT9SrgAxdLbCIxzf75rFoA4Y0wa
	 yNEW6aj4bfHz082AwhH/OE3AXOJ6QR5MD3eC/+X5ySU+ht4OtU0rer+8jWyuHENDw4fmF
	 zpj6V7nQmOocqDdRSuQSsM7xnmjdbSRo1NaUeSnmeBmrA2lNJFikskVE//TAD4gV4DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268332;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tV88nyucDEygFSAkVPxDgUNdXcidqL1oGKpAV3KEEz0=;
	b=jvXIF52o3kKmNyOlTUq6H10eXxBYezZVutJs8l7/J3EM1z8YOxcqTXfeqKVwuhoQN9fd
	 N7UftASAtw6o9LNuf0OdBclmSQCEVHGC3ai60ez4ub0/vLYjWLFOQ7rp+hiqkev8AEu1x
	 Ai8pF9fh8OftPecP6iQ2rZ6I2+od0u+VWASvS4JUemOiMJHHAgfSWc4HqQA0pY/HDad1C
	 OJg02B2teyiKXgc6tFLV5HBDxwkf4tmr68e/Zhp8/bAHLjLJgkG+zfJuul2+5WE4o318Z
	 eijisvO3imD9Y8bhOIA051SH/wl25oBXbkaMwcJxoYBcGiYaSx2IS9/ZSHMlaeTmUhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MZNSzPwY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F70606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 23:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MZNSzPwY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7E41F0089F;
	Mon,  9 Nov 2026 23:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794268331;
	bh=tV88nyucDEygFSAkVPxDgUNdXcidqL1oGKpAV3KEEz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZNSzPwY6T9jJqvP6ft22tUYBO/9zh/qQ23sTCS5foDOGL4nMjrZhL531LONKMAUO
	 zM0MfbEkfrA8LD6KnmLJHySO/by+Pn3gXHR+O15HUHXfox7iRRFtiAXTp/Vyz1hhnY
	 VU8G6PZveU4APDWg6k/be+9yMXy0NsWFj5GmWHhJ2PW8adE1aT8GK2lMwc2OFWMnr0
	 hfXPHydQB6fQ7mGFQpfWaaj0Zeye7sz7L0hdRybMF1IAbrtAtXqXr3uQs5OvW2wChl
	 gNsQla181L0wx4UnKatkj0GiPhUhNcyaJ1cIJZjNpm00GosGb3xJ8PL2yKOjP3qbRv
	 JCphaEu2t/b4w==
Message-ID: <sashiko-outbox-205799@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (pmbus/core) Add a vout_command debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261110-for-upstream-pmbus-vout-command-debugfs-v1-v3-1-e3a261fe4342@free.fr>
References: <20261110-for-upstream-pmbus-vout-command-debugfs-v1-v3-1-e3a261fe4342@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 23:52:11 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-for-upstre=
am-pmbus-vout-command-debugfs-v1-v3-1-e3a261fe4342@free.fr?part=3D1

