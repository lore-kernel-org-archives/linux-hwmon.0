Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831536;
	b=yBgeETi/jMyctjyktRmdaCMeKvr2ew0PW1xEzD8ssdcHCInK1XUbZ9PRmmXEiUSa3aHi
	 zeRNl1SfQMWrpN5kN4bHddRzYHZPYr+V21sGmllp1grc5GT7G32Lu99l1TyEH0x7P6Ajq
	 sHCVHBgA8NGDQeyJJH+8MJ06TIZ/UZkRlamXtWqRWXTLjkWEg0jMvalvnU+e5NDBTzI5V
	 awEATn05fvhqS3SRcMcGO5BCo3jN51uIFvobDbv1W944RzIULNY+Zf5TaLikSoq7TKXRy
	 l8QQq6lID0SzRDOf9Xl284Be5zxm/+4jhkbrgc5HMo1moPHP39QN5bEasihxo03akqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KIadWtWnl3fUyMYBl6K8AFQjfsAUVOtqof9H7aInxd8=;
	b=R75ls8SYeRb7mWTv9/F6mVCvlsTKEe0aupuY/WkRg7HoaQa1zSGtAPsOROFDDcUd+hjt
	 Ok35zqvwLuCsOoYqK9qEMPbanhmmY3/8rF8dcT7lKqo7uKO/QmNb1f3sHHpoRarUdmeXd
	 E7R2pCrXJs7yoOgf/HspLSmFL7GYbS8ioP8DUeFUki4n1au7l83kKSrm7NU5MeyRapp4W
	 wPp+3udipVGGwOMdhK0IKTk7tcW+inrR0XUG0b1rF0S6hzGDYNiVGwFjBykRJygjVsh3q
	 W1yQDgms5afgHZeHdQDcGPCHB/t3ZQlUiosjaV9DSX6+OUpPjF+8S3a6yNfkv0ETgWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfQIPI8j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E18C606A31C
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfQIPI8j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898AA1F000CB;
	Mon, 16 Nov 2026 12:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831536;
	bh=KIadWtWnl3fUyMYBl6K8AFQjfsAUVOtqof9H7aInxd8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=YfQIPI8jY6ZSYSpxsNB48O7K7mQZdfj7/1QyjU6ih82yS0zZV734U0ci6m9SQW0DC
	 MisHWmLQnIEHrorD8yndbUKfY2ouLNcWgLHM0Kecl/jES75mGVkZvDtT55Qc14rp9F
	 L2tBYAI2R2q11rVQgZj311hYed1esUeSbX5qEjYCLMQOwP4tE8Hr2JyfeiFV3k2BTn
	 nBiIp68nbO9uvn3e5FIwrs98yENA5083FFjP4+8c/ahW4UFvDgvX/Pc7JDsXqAQxOw
	 wc1CGbdMEYk9PoCrBVJ7lJ3AhPq0t/zDW0xYmDkNd6VLZ80FWE52ig3/fnLrnDbpiC
	 u0hGKIN/zUjcA==
Message-ID: <sashiko-outbox-217002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: Add driver for the NCT6801D EC sensor
 window
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiqi Li" <lijq9@lenovo.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261116120411.994284-2-lijq9@lenovo.com>
References: <20261116120411.994284-1-lijq9@lenovo.com>
 <20261116120411.994284-2-lijq9@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:18:55 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The Nuvoton NCT6801D embedded controller does not expose a hardware
> monitor logical device in its Super-I/O configuration space: LDN 0Bh is
> the ATXPGD/BEEP/DDR4 block, so the eSIO-style register window that
> nct6683 relies on does not exist on this part.
>=20
> Fan and temperature values are instead published by the EC firmware in
> one of the shared-memory windows of the SHM logical device (LDN 0Fh),
> which the platform firmware maps as
>=20
> 	OperationRegion (SHWM, SystemMemory, <base>, 0xFF)
>=20
> The window base is not hardcoded: it is read back from the SHAW1..SHAW5
> configuration registers (indices F7h-F4h, FBh-F8h, E3h-E0h, E7h-E4h and
> EBh-E8h of LDN 0Fh), as documented in the Datasheet. Several windows are
> normally enabled, so each candidate is checked for plausible sensor data
> [ ... ]
> ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C, x86_pkg_temp 100.00 C and
> coretemp 101.0 C, i.e. four independent sources agree within 1 C.
> Readings return to idle values when the load is removed.
>=20
> Signed-off-by: Jiqi Li <lijq9@lenovo.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116120411.9942=
84-2-lijq9@lenovo.com?part=3D1

