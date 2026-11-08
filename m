Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794159463;
	b=YQYBAiS3LSfhvnLTNDnH5LUfafR/V9JQOwIIUPB67vUoUJVhJGjtEXIRQoZSTWtFrTvG
	 fNdKUB1DNYe6y8HZs+xjgbjsWagLIsh3MzaP4N/ialHrgTlQzZBA3ldDiMFHP9IntMQsr
	 hTbzsWkj7bnrtssfPRzI2FLfsmdkCgTlWpl23/PoTO0XWhhpQGvlKQZo2EJkWj6ChuU/M
	 gnCTEyooDctzb+6BKevdmeID4f96d2QEHcy/ImhkA4YxlXPQ7B+4Yxwp9QElagilIQVmN
	 PcTa65tkOK3ndpE1YqGgnvgMLgBKAkCEp2mPHmaA1OfiDHh+RAp+YWBT6aWUJTW+0kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794159463;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AkQ/duxZpNIzNH8zVKhTpO3NW+MtGLkF8FGWZZmtUqE=;
	b=oiQa6UFT2wqr51/rKFx6B2hRVChYYh186vwLZOgdN06KGrnEQtg0KGl4rywLH8l0lxqW
	 7bqNHqgSNcKUGNeWVIo15GEb1JwUCPmeo8OojNgzV24QuFO/JGLh0oq2oYzT1A0e+HTFT
	 6/KQYfITgzUsM2xE5Iyf20VK+sS8v5OxzSLWkohSLTPG23oyW5CxPCu1qzg65Kd/JO86k
	 0wSJHYP3OXC1noyATvmCek9O0DiJMxx8BiWVadiyEKYPCmaL38OysBRyIV/BHHajCTJqg
	 2UEpYjPBTR+Nfnke8vXNjKScFz4/gz4EQ16UMo1jouZy+ONtPyT+dkVXaJP8R3xCcEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KPTcevEd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC9B606A31C
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 17:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KPTcevEd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF67B1F0089F;
	Sun,  8 Nov 2026 17:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794159462;
	bh=AkQ/duxZpNIzNH8zVKhTpO3NW+MtGLkF8FGWZZmtUqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KPTcevEdipZF60v92He9m0T0s+XFO/kEjy/Cs1/frQAN4o347aLaTWFSU3xiMxLa7
	 SWTzzzDWzdjMrd0O4w1iVUG9Y7n6NigWqiw1EtBWnlusWHVtwDlav73ovq6wQC9M9H
	 DTARxeNm7+LrX9RA9qzHbDrKrxIZgAHeXdx4hcnU6KIyMx2ClMgJN5j5I2R8F9pPXl
	 CBEaqNbCLSaYi/tSqkxyTvKuLlNDfk/ZcU/Og52JqIiUkvFACHK9hbvFzmg+8ZK+NO
	 d8cqkXiO+KxQkmjLfzNaM/2lLkVbgVRbed4NWAYcC5jkcmNmWNqOrxSAA1rsE99KUt
	 O7ViKh1UNhqnA==
Message-ID: <sashiko-outbox-203890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/core) Add a vout_command debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261108-for-upstream-pmbus-vout-command-debugfs-v1-v1-1-c7a063efb91c@free.fr>
References: <20261108-for-upstream-pmbus-vout-command-debugfs-v1-v1-1-c7a063efb91c@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 17:37:42 +0000
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
am-pmbus-vout-command-debugfs-v1-v1-1-c7a063efb91c@free.fr?part=3D1

