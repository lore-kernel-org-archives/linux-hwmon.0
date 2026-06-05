Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D9309EFA
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686528; cv=none; b=fEa+miooeCX5lDWcj2r/j7nwJT7/h/x2cCotJIV+O32lDibscx6BO5NkBxgZg82DyHexgWfjvLJjmMJrEhf/kO4J5cb76Tp6uhS7pHRAQWo/fQvd55e4xtoorAUJSmMLpggV3T1TDQKc0bNqZLFX2ddH3TYOnI7NCl6wFAwE99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686528; c=relaxed/simple;
	bh=ccaVNs/ENjVbMZDcWoZ78K/RG0AnqXAnvNRLg7M/7tk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kKGev8O98qlAuRG5SO2LWH3HcA9IHs2zO0qBSXITjQm2F8yn6jRY0ZHCcQqwLSt3d3jBW8QMiKV2ySIY/5jrLsw3fj0lWv8H0DFJrA8E0FfH4rLuIdvr0eXmitvQlZ9hFm+PDBuI2glsmZBfqsxPezEj9nEp1tnVL/wo3r8CJ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAFQEg3J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAFQEg3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806E71F00893;
	Fri,  5 Jun 2026 19:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780686526;
	bh=ccaVNs/ENjVbMZDcWoZ78K/RG0AnqXAnvNRLg7M/7tk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UAFQEg3JDWxexdJevxf8aloBNbYAq7sQKKw2viF18RJtmvJeP7kYXZun7wvbtGLdH
	 GEshiemqWKCIBIck9qF5krW1DgvrKu75+tqi6RDO4cCFr+vyPQO5SSscNQR3/9YwKI
	 2HgiKiI3aHW2+qpwJI2XUzPcIo83gV7E1rcBDDs3UD/Yec9Yjf7iOsif8BOIX8Bg8/
	 liQe32Snn0SROqzRcpnwwc8t08kPnpxqocXVBxwsRP1egkTzKi0oVQwvwJT66M7/Q0
	 pRONM7zoNlP8x9etULF1cnlNDq81yaGb+ygpv4Ru6X6Fd8Dh6fqQoNRRTi+NfLzZT0
	 vtKCz6HWjBeKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/9] platform/wmi: Make wmi_bus_class const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-8-W_Armin@gmx.de>
References: <20260605181433.188847-8-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:08:46 +0000
Message-Id: <20260605190846.806E71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The functions class_register()/_unregister() and device_create()
> both support taking a const pointer to the class struct. Use this
> to mark wmi_bus_class as const so that it can be placed into
> read-only memory for better security.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D7

