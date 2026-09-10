Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE73AA50B
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 05:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789017009; cv=none; b=h36pCRA/Skt7hgoMAiRAj9rXfgTW5KZlJtp+OuFzpjJ3gFceupaz68FTk0o9SO0H07iImMM7zXlm1dipLyio+GxxNTyYOJaz1EZIkkO+UNc89QaNt8B0wsPo9q7Y1YWXgHmqjsce9iFwax1A2fYWTUfP35mcN70UmR999NtF06c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789017009; c=relaxed/simple;
	bh=Cu8n2z1wUReMGcmibmuUAROMQEApx3Pgm6MbyvhbZcM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D3+EHckB4VEN5rer6IFkcLDHF+DiTl/OcnfAesg7Lpxhd5UituuATSE5h+h4Jw3xPKnhO66vlayEuP4ykzfxXddIVAunG45z9DfOpljICu59WKQ+rbsknAGU4HSr0XS4g9t0Hoy5tdBkBbm6AAnsEYhOPQi1zi7q1DP0Y8xqsoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWfc6JbO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWfc6JbO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A601F000FF;
	Thu, 10 Sep 2026 05:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789017007;
	bh=Cu8n2z1wUReMGcmibmuUAROMQEApx3Pgm6MbyvhbZcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iWfc6JbO9iO8SC7kr2plC9GNCZVcprT9W1wKC7gnG9aO+dHBnqREsJnGD8OAkfwF+
	 mOmw78zZyztbjVVeN3dgy7TD8Uqnb/HkNshiXO/jO3OjidoEu704wTXCCOCjy5X1rp
	 c+YUQvSY1k0JxS4Pukmz8ErpzctOTiggCHnfKE+AlHTuWX9xDXyc2Y22HVRlFMbEAT
	 zS1gSvpmPpSmSqu+fveqkfPn4zABHxeiNdeKK5ZpSCBW8DqCSLRhIYxOpA1ho88h8k
	 bBuYpFgaRrlURm65sfFRMmvdHPs+m0tizeNagXe/w1PHil73GGc4SOcK0tUsSFFyWV
	 dgzLHxUflkITw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: arctic_fan_controller: default PWM cache to
 MCU 40%
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aureo Serrano de Souza" <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910050401.279868-2-aureo.serrano@arctic.de>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-2-aureo.serrano@arctic.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 05:10:06 +0000
Message-Id: <20260910051007.69A601F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The device has no GET_REPORT and every OUT report carries all 10
> channels, so the cache has to start at some value. Starting at 0
> means the first sysfs write to a single channel also sends 0% on
> the other nine.
>=20
> The MCU factory default is 40%. Initialize pwm_duty[] to 102 (40%
> on the 0-255 sysfs scale) at probe and on reset-resume. Any initial
> cache can be stale if the module is reloaded without a device
> reset. 40% matches the hardware after power-on or power-loss
> resume, and a first single-channel write leaves the fans running
> at a safe speed.
>=20
> PWM is still not taken from periodic IN reports: the device is
> manual-only and the host cache stays authoritative after the first
> successful write.
>=20
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910050401.2798=
68-1-aureo.serrano@arctic.de?part=3D1

