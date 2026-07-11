Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F094E39280A
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 09:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762990; cv=none; b=sU/7L7XgFEZWZQ2UiDoJKT71fSVXKIpBMZWL3tzLP4/KXWiss0PkrxpOhNs0zbcjyHRE4CL5MSmgd6lFJp+4epp3q5xCP8BvirUTMro96eaqGflsFMKJhCXkEoT3uDJu8r3JLvkiWkaqfHmrA/AX0pYZxccJQdsj+DhgFZszncQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762990; c=relaxed/simple;
	bh=0CDnEZm2HbiZOwb6MRj97MRfAPBXxwikIyykKmS4T7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=POdaO6YaJQKbyQylb0pQ47PH5iGbzSCjCECfzoVWAk7IuD5Y3MniFuhWRpuMNH+fUPLWDKFug1CCu09ztK3iTNaV0BJ32o/fngTOkP5RwFU3ZIw7LTIP94Jm4hXdygFShKzey75Re8JG70CWjQOzEo99NcARRrr1Bc9sLLSKL5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/Q7aNpF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/Q7aNpF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C5B1F00A3D;
	Sat, 11 Jul 2026 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783762987;
	bh=0CDnEZm2HbiZOwb6MRj97MRfAPBXxwikIyykKmS4T7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c/Q7aNpFUMJGwE4X7DKVs4Vaamtnh1JOwwePxbnZZ90B0/kTBCs3sOFG0tLYEblgy
	 FfaYhdKTW7ZOpEWY3ajG1hXxNvv/V4O72E07xg0yCi35PpB1Xc3Q2+6AF9MCQLnMXD
	 p9+Zow449i6lSvzy8i307v3StlCh1MT8+CuIak5I2AKn7VXJusZQJOxoRSBtIHmtLO
	 U+afwjYKDdOGePLgyLOTK40MzlW5DWH29oh1fNV3g9FR1AUgnPxOt3/R/8PwIrf73n
	 BVLabvcULbpmOVoKUMtWmcYBqRNOobljji6SdX1HfTAK4G53UyarVYmzLdpAf9J0Ov
	 OUNI00VxHAhww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] hwmon: (applesmc) Fix lockless cache validation
 data race
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711093323.14529-3-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
 <20260711093323.14529-3-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 09:43:06 +0000
Message-Id: <20260711094307.22C5B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> In applesmc_get_entry_by_index(), the cache->valid flag is checked
> locklessly, but setting it to true lacks memory barriers. This can lead to
> a data race (TOCTOU) where another thread sees cache->valid as true
> before the actual cache contents (cache->key, cache->len, cache->type, et=
c.)
> are fully committed and visible to that CPU, potentially causing it to re=
ad
> uninitialized data and send incorrect keys to the Apple SMC hardware.
>=20
> Introduce memory barriers (smp_load_acquire and smp_store_release) with
> explanatory comments to ensure cache synchronization is thread-safe and
> fully visible across all CPUs.
>=20
> Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711093323.1452=
9-1-fourdollars@debian.org?part=3D2

