Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7D8353A69
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508781; cv=none; b=JhutGcF4g9y1kdpjr0XCkh7VWi3XlAdBDoQEnUTwrCep99ausjHeUbKPlQaXqbHagBdmTQSw4SuLTmfyYsstPdteBkOwoVkoPs4qHI/dKls9PeRiAeiXmUiftqDZWdqAjOJyuO/h5GPNINXJlVvUj/nZjTsk62CQ5HQUIB39Z9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508781; c=relaxed/simple;
	bh=vPj7uuZOU6QPTRZJw0900n49PUUdAx9Nnu2q4bcaUkQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HaHsvZJ9m9EQny00G8X7f4vtr8UtzmcDlAd9N78pe/SG7nFoKauVAMwgwVyGU/hrYhVp9YvbZThyqlo3mll9dj+riI7GbFLvi+XRkmW2lRq7jq5nEG1TH6Rh8tPm5YvPCnP0itXzVnakBvH8jtF62IuLPmtL7id4fLSdXJT7x6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C73vY7e7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C73vY7e7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA12B1F000E9;
	Sun, 23 Aug 2026 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787508779;
	bh=vPj7uuZOU6QPTRZJw0900n49PUUdAx9Nnu2q4bcaUkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C73vY7e7oEvXtddYypQ1NJLxGMhJ2rAsTMrsMY+9+429+14JSLxTo+yvVTr4/EjgP
	 s95LdOXT7fDa7xDLs7/eoWcSmX1y7wolrr/PcTbjC7ehIAhp/NoL0LTYAhZ1AeKi5u
	 sVwV0iNwcv0SKBc/5Yv4k56se03NbxdERrMrH3LUHNyKMo8+JOuCG2qLtWzA8OBTE3
	 TA+ahuyKBDxKDl/r5aX2lwI444LhlIL/Ud6dzJmIT3XsQu1lhuM6JgbQEjeTCsi85m
	 CBxGdZSGBsrDjCx3xOTPm+Z+IrWjUttbJMrLToiIxdaUcN9Pl6X1zgLzRz6WCHemG4
	 xA+y1b9n/vdWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260823-chipcap2_locks-v2-2-6a26c8e9e2fc@gmail.com>
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-2-6a26c8e9e2fc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 18:12:59 +0000
Message-Id: <20260823181259.AA12B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Registering the hwmon device before requesting IRQs exposes the =
device to userspace before its resources are fully initialized, introducing=
 a probe race.

Pre-existing issues:
- [High] Incorrect endianness conversion on big-endian hosts for SMBus word=
 writes results in writing LSB first instead of MSB first.
- [High] Dereferencing a potentially unaligned byte array pointer using `be=
16_to_cpup()` can cause kernel panics on architectures with strict memory a=
lignment requirements.
--

--- Patch [2]: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering ---
Note: The standard review format has been altered and direct code quotes om=
itted to comply with recitation restrictions.

commit 28a819427451e0b54e63443c10cc5e1979c146bb
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
hwmon: chipcap2: fix IRQ teardown ordering

This commit separates IRQ discovery from IRQ registration in the chipcap2
driver. It ensures IRQs are requested after the hwmon device is registered =
to
fix devres teardown ordering issues.

[Severity: Medium]
In cc2_probe(), the hwmon device is now registered using
devm_hwmon_device_register_with_info() before cc2_request_irqs() is called.
Does exposing the sysfs attributes before the IRQs are requested create a p=
robe
race?

If userspace applications interact with the sysfs interface immediately aft=
er
registration, could the read fail with a -ETIMEDOUT error because the device
is waiting for an IRQ handler that has not yet been registered?

[Severity: High]
This is a pre-existing issue, but looking at cc2_write_reg(), the code calls
cpu_to_be16s() on the value before passing it to i2c_smbus_write_word_data(=
).
Since the SMBus API internally expects a host-endian value and always trans=
mits
the least significant byte first, does this logic cause big-endian hosts to
transmit the bytes backwards instead of most significant byte first?

[Severity: High]
This isn't a bug introduced by this patch, but in cc2_read_reg() and
cc2_data_fetch(), byte array pointers at odd offsets such as &buf[1] or sta=
ck
arrays are directly cast to __be16 * and passed to be16_to_cpup().=20

Can these unaligned dereferences trigger kernel panics on CPU architectures
with strict memory alignment requirements? Would it be safer to use
get_unaligned_be16() to read these values?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823-chipcap2_l=
ocks-v2-0-6a26c8e9e2fc@gmail.com?part=3D2
