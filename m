Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3C53CA487
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 23:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320856; cv=none; b=hT4c/36BYYMIiYpD8cvyhRspgc6G2lMVeZFhlC3zPxYY9AQqSh93WacfEZ1vIl3eNY35dD35TqX4Fy+E67LKywc55sC+SCHaY/DBEepfhw19dLUr9GBqf5EKhcdR0zstKZgWRahVdikDbWe+wY4bYjFzQVu0SHEaxqVjqgZznPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320856; c=relaxed/simple;
	bh=t7RrJvAGpFjhIwod5xcRK7b+zXi7ZTH/23UyNGIxM1c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZVONMOHuO0nk8oK1Crlou8TBa2tswtylEIyBFIwYN9a2YENS4BsoWzIjN33m3/S5Di5eIorcP2zef5n/C6kvk5DilbqAV+TE18HrOMPimfttOSN5I+XokfGpNIouJXdIpsyKR+JqJiH0Sm+aUnUVtJW0ZU496eoFexqfvI+mtFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3r0mMXK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3r0mMXK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92B41F000E9;
	Wed, 20 May 2026 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320850;
	bh=t7RrJvAGpFjhIwod5xcRK7b+zXi7ZTH/23UyNGIxM1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l3r0mMXKrLmio5wtpUA3njH4pscx7m/mSMPM9kRWyW5t152c2s5+x2CbZpfGmyVPG
	 EN2J4sU0hpyu/rFSE+8B6h3uZUpwCBmypGk8eCjeiPgJngASoBVk++oadr1RJ4T9Oe
	 CP7mgpAtOxFMXYOLk1NTejJhBTV779a4SP/3hDeLs4dO1hfUpmiLiXx2XynFUoJg1+
	 nUCo3bEDa1Uh99qDkiBGYcANPM95wdPFole7rKJmmsYKTk5dHiZq/QVFM5bjR1T4sE
	 61yfwvyLgJYnW20RllbifbXqDJarIjC/dvZpVfo30/Xo6TPRLc2pIz8xZ9fJojSFWh
	 MOzKXu7bxhEcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260520-adm1266-v5-1-c72ef1fac1ea@nexthop.ai>
References: <20260520-adm1266-v5-1-c72ef1fac1ea@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:47:29 +0000
Message-Id: <20260520234729.B92B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ADM1266 blackbox can be configured in two recording modes via
> BLACKBOX_CONFIG[0]: cyclic, where the device overwrites the oldest
> record once the 32-record buffer fills, and single, where it stops
> recording until the buffer is cleared. Deployments that need to
> preserve the full record history across multiple fault episodes
> typically run in single mode and need a way to clear the buffer
> after the records have been collected.
>=20
> Expose a write-only debugfs file alongside sequencer_state. Writing
> any data to it issues the documented clear-blackbox sub-command:
> a 2-byte block-write to READ_BLACKBOX (0xDE) with payload
> {0xFE, 0x00} (datasheet Rev. D).
>=20
> The clear is taken under pmbus_lock because READ_BLACKBOX is also
> used by adm1266_nvmem_read_blackbox() to walk records one at a
> time; both paths run under pmbus_lock so the clear cannot
> interleave mid-iteration and corrupt the read sequence.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-adm1266-v5=
-0-c72ef1fac1ea@nexthop.ai?part=3D1

