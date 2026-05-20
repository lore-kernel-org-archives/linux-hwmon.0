Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BB8368968
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 18:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301115; cv=none; b=apE4cC9LFatCVQJCUkiHlW0hkY/LniVO15n+Ab8o0fEDT1jPRFSios+F19q2cFJfLvYHMYCJG/v8onUrsp/60+7/CVfg/00usj8TG1ZquhSbWn7D+oEwUWBDDYqU43jFjlVZmHTZcpw5bQMgsdrxwhq1ZqHL/ACvhHbkT8vE+NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301115; c=relaxed/simple;
	bh=EPKGMVgeP0QmgxAZFTHH1/2wAAnTB2qVLSYrZUlctkQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eOM9TSwkIqn6cFpe6NDOVROx8TtyhL2nHMgTSCKFGWvHWdNhYFyrrI+R984Ydcn9FaD1fTNeNbgYn6wDgslPoNoq8oPU29NzGlgT3+kg3hDcnFOaQbhFxY9Z9zYrp8PDQfFCvNqlbBmy5Gi4ZKRdBDUdHDql3q0jWzZU2bmdgJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHtyQFmO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHtyQFmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D15F1F00893;
	Wed, 20 May 2026 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779301113;
	bh=KXGZzlgBJ3phGJ9C4/QHHIhdXtoExUuN+0ok01EZKNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LHtyQFmOMXEdX5dnzn+T5B+4cocZd+uefVPTKqehsb+Aa8QPUi2e4MxVkgol3gvNs
	 Pr70I4q5VNdppWlgdJ6dz6rZH/NpkRSLywcKkuZ0pGQQ/DVjsbbB02aU1pavaO23Ej
	 XlqcxJfp4/XF02lYhJJUtVhNRF/6Rb/E89L2TtjhgkM1O7vMdZ6D/qnjk58nNAYQI6
	 Ibz+yle6ZMmiaLcDVL9GNjxc6kVW32mOAzUcl30Lbr9KQ6ey3dfbSK+0CXYnQEDndT
	 9mFt+cEbDpw8n0V4pe3kcUUXVmt3O0qWuVtY7JtI+M51xr4Sb6ufeNM0JYh38+BbTI
	 1pXGyUlnDRFPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/adm1266) serialize firmware_revision
 debugfs read with pmbus_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260520-adm1266-fwrev-fix-v1-1-8a78c94a53ef@nexthop.ai>
References: <20260520-adm1266-fwrev-fix-v1-1-8a78c94a53ef@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 18:18:33 +0000
Message-Id: <20260520181833.9D15F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Out-of-bounds memory read/write and logic bug in `adm1266_gpio=
_get_multiple()`.
- [High] Direct device accessors lack the `pmbus_lock` required for seriali=
zation, contradicting the commit message.
- [High] GPIO and NVMEM devices are exposed to userspace before PMBus probe=
 is complete, creating a race condition.
--

commit 93431d6d47217063e4487061d81fc6df727bcdb0
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) serialize firmware_revision debugfs read with pmbus_=
lock

adm1266_firmware_revision_read() backs the firmware_revision debugfs
entry and issues an i2c_smbus_read_block_data() without taking pmbus_lock.
This patch adds guard(pmbus_lock)(client) to serialize the read.

>     Take pmbus_lock at the top of adm1266_firmware_revision_read()
>     via the scope-based guard(), matching the pattern just applied to
>     adm1266_state_read() and the GPIO/NVMEM accessors.

[Severity: High]
This isn't a bug introduced by this patch, but the commit message asserts t=
hat
the guard(pmbus_lock) pattern was "just applied to adm1266_state_read() and=
 the
GPIO/NVMEM accessors."

Does the current code actually do this? Looking at adm1266_state_read(),
adm1266_gpio_get(), adm1266_gpio_get_multiple(), and
adm1266_nvmem_read_blackbox(), they do not appear to use pmbus_lock. This
omission leaves direct I2C accesses unprotected and vulnerable to interleav=
ing
with pmbus_core's multi-transaction sequences, which can corrupt hardware s=
tate
or interrupt PMBus transactions.

[Severity: High]
This is a pre-existing issue, but are GPIO and NVMEM devices exposed to
userspace before PMBus probe is complete?

In adm1266_probe(), adm1266_config_gpio() and adm1266_config_nvmem() are ca=
lled
before pmbus_do_probe(). These functions register their respective devices,
immediately exposing them to userspace.

If userspace accesses these interfaces early, do the accessors run before P=
MBus
core structures are fully initialized? If the missing pmbus_lock were added=
 to
these accessors (as the commit message assumes it was), wouldn't it retriev=
e a
NULL pointer from i2c_get_clientdata() and dereference it during pmbus_lock=
(),
causing a kernel crash?

[Severity: Critical]
This is a pre-existing issue, but is there an out-of-bounds memory read/wri=
te
and logic bug in adm1266_gpio_get_multiple()?

In adm1266_gpio_get_multiple(), the second bit-iteration loop incorrectly u=
ses
the PMBus command byte ADM1266_PDIO_STATUS (0xE9 =3D 233) instead of the co=
rrect
pin count macro ADM1266_PDIO_NR (16) as the loop's upper limit.

Does this cause for_each_set_bit_from() to iterate up to bit 242? Since the
mask and bits variables from the GPIO subsystem are sized only for ngpio (25
bits, which fits in 1 unsigned long), does this result in out-of-bounds rea=
ds
on mask and out-of-bounds writes on bits via set_bit(), leading to severe
memory corruption?

Furthermore, doesn't executing *bits =3D 0; immediately before the second l=
oop
inadvertently wipe out all the valid pin states gathered during the first l=
oop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-adm1266-fw=
rev-fix-v1-1-8a78c94a53ef@nexthop.ai?part=3D1
