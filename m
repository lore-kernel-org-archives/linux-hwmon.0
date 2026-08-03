Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E782BE639
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 23:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785800414; cv=none; b=FyLr2OZVHy9vegXHJsCB5Qc4wOSlvwuGQk23r52jsJY68sfNln2ca/V54YO9rSXS4owO+tuMCACGWz3a5m8m04oAIblE5t4A6RlFu8jgp6ofksdvPo+jyykWuFMeAQ/RVMfROytbu1rShC4xLPk3Nw4CgErGga3RKy6RWx/2Ypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785800414; c=relaxed/simple;
	bh=sZ4kLcYgtxEvyang3lA6FzzrrlX+5yUnKWz1eslU3Ww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HLbKpRLtRWLRTg+A0dZ6z9fega55eis+T2KNCibCG1KgG6YsLtq+1M17rqBwYKL5soPKz8zsFh50bO/OSuhUGkUNGKxOH48Vm3qUJYN2fH2moOpcrrv06mHhjTpN0+HFiMfV84a4tdoNHWs8ioxP0oDcUNgHI5vmCFJm2OCFFCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4PTvsFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4PTvsFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190861F000E9;
	Mon,  3 Aug 2026 23:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785800413;
	bh=sZ4kLcYgtxEvyang3lA6FzzrrlX+5yUnKWz1eslU3Ww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n4PTvsFsS8YCvnUrKIAVgEWPsHyJLeefeZAtv4aH1lv9TxU6/G2WBqzDmdMQkFJnw
	 4i5YbKaKX/KUNeJSa/6kT9TA3ohXgVa64TuP87AH/mX70cAEY8RNWa3a0edjRJcU9u
	 o4/BLJdvPvz5e6BhSXFTtvtfecFpqiHwc+OCZ0k0IvA8MONEsJx/O+4C92HAwvKxkv
	 00WJ9VROFuJYYWuaTtg0aiLweKVhBWDhABYyN/qhjRSECqJPFF82EG26YRQ4SlxRIg
	 jgKMhu8df4vnZHiCY2xmmjaOthJefl8Vv2LBURk42PoST5sclGgjMaD1+ltqcAXZfz
	 bQLeYmXK2lVLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) Fix linear11 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803232005.2339611-1-linux@roeck-us.net>
References: <20260803232005.2339611-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 23:40:12 +0000
Message-Id: <20260803234013.190861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing null termination in USB string attributes leads to a kerne=
l memory disclosure.
- [High] Concurrent sysfs and debugfs reads cause a data race on the shared=
 USB command buffer and wait completion.
--

--- Patch [1]: [PATCH] hwmon: (corsair-psu) Fix linear11 calculation ---
Note: The format of this report has been altered to use a free-form summary=
=20
rather than inline diff quotes due to recitation restrictions.

commit 00dd75e6c6959cf10ed39455a52e60c23722db89
Author: Guenter Roeck <linux@roeck-us.net>
Subject: hwmon: (corsair-psu) Fix linear11 calculation

This commit fixes the linear11 to integer calculation by correctly casting=
=20
the shifted values to s16 and using 64-bit temporary variables. It prevents=
=20
sign-extension issues with negative temperatures and clamps the final resul=
t=20
to avoid overflow.

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the USB
string attributes to lack null termination, leading to a kernel memory
disclosure?

Looking at corsairpsu_usb_cmd() in drivers/hwmon/corsair-psu.c, it
unconditionally copies REPLY_SIZE bytes from the USB response into the
string buffers like priv->vendor using memcpy(). If a USB device returns
exactly 24 bytes of non-null characters, no null terminator is appended.

Later, when a user reads the corresponding world-readable debugfs file,
vendor_show() uses seq_printf() with "%s" to read priv->vendor. Could this
result in an out-of-bounds read that leaks adjacent kernel memory fields?

[Severity: High]
This is a pre-existing issue, but does this code have a data race when
handling concurrent sysfs and debugfs reads?

In drivers/hwmon/corsair-psu.c, the shared USB command buffer
(priv->cmd_buffer) and wait_completion state are mutated in
corsairpsu_usb_cmd() without thread synchronization. While sysfs accesses
are protected by the hwmon core lock, debugfs callbacks like print_uptime()
funnel through to the USB request path without acquiring any locks.

If a user issues concurrent reads to hwmon sysfs attributes and debugfs
attributes, could this mutate the shared priv->cmd_buffer and
priv->wait_completion simultaneously, potentially leading to data corruption
or deadlocks via corrupted wait_completion state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803232005.2339=
611-1-linux@roeck-us.net?part=3D1
