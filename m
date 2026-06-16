Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5649C3E3D80
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 06:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591653; cv=none; b=srU0HzXkZaM8jfFfVMxAin9xVftwYds+A5jLAORjeRav73jHDP/arXo+Qxg4prbxihd6C/OysOGGm5Z/S7gSmB2FoYbt/1QKoA/w8yuTom7rFRFuaHotRK9YNAwRkSuRz+B556hGrADUzwdmNAjebdOwDH1hSruLZuB+77K2wNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591653; c=relaxed/simple;
	bh=ysVvBiSaopczdNgLQoldwyKycYI8tqWi/AsNhv3vVg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5ZdC/EbyQApIWJzwg0V2hn54WhGX/Agp6DkbtR2pS1XoOZpgQIoqWcZSNJwt/dRPQ/mm8CJCMq+6SGyKu0Uvk85UnZAe/Qsj4ZrCzZdHOaii6Vrv7j5bEbjUHva1JV08TJWy35Vw+9q8jtldes5C85MmROiZGZsMT/0S+9dYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Bv4KbIH4; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Bv4KbIH4"
Date: Tue, 16 Jun 2026 09:33:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781591638; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type; bh=h02atVxNKQS5E770BY8ov1Q7Xq5u6U7gLCk/iytMhY4=;
	b=Bv4KbIH47QfYAhbIF8yy0Az6JxBxIIGRyOF5okqkf1CS1SL4t4FgN05C7jF4Xf/7t87uvQ
	/Fuiy/tcTCCoUh5rCqPXsG74wkBE6t2MQzWih0PSJvAuGiyeIdvV6UThx9GVJrAe/ia6yG
	8O6brDWwyf74vU59ZLC+IJUpwivKJDo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	Charles Hsu <hsu.yungteng@gmail.com>,
	ChiShih Tsai <tomtsai764@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/7] Support ROHM BD127x0 hot-swap controllers
Message-ID: <cover.1781591132.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqrLNF4IA2prbg7U"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT


--AqrLNF4IA2prbg7U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD12780(A) and BD12790

The BD12780 and BD12780A hot-swap controllers are very similar to Analog
Devices ADM1278. There are only some minor differences in the registers.

The BD12790 is largely similar to the ADM1272, with slightly different
coefficients and minor register changes.

This series adds basic support for these ROHM ICs.

The last patch adds of_device_id table with entries for the newly added
controllers. This fixes the module auto-load on the test board with old
Debian user-space.

I have no idea if adding the of_device_id -entries for other ICs could
cause problems in some existing systems. Hence only new ICs were added
to the of_device_id tables.

---

Matti Vaittinen (7):
  dt-bindings: adm1275: ROHM BD12780 hot-swap controller
  doc: Add ROHM BD12780 and BD12780A
  hwmon: adm1275: Support ROHM BD12780
  dt-bindings: adm1275: ROHM BD12790 hot-swap controller
  doc: adm1275: Add ROHM BD12790
  hwmon: adm1275: Support ROHM BD12790
  hwmon: adm1275: Support module auto-loading

 .../bindings/hwmon/adi,adm1275.yaml           | 44 ++++++---
 Documentation/hwmon/adm1275.rst               | 24 +++++
 drivers/hwmon/pmbus/Kconfig                   |  4 +-
 drivers/hwmon/pmbus/adm1275.c                 | 91 +++++++++++++++++--
 4 files changed, 142 insertions(+), 21 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
--=20
2.54.0


--AqrLNF4IA2prbg7U
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmow7kMACgkQeFA3/03a
ocUurQf/Y6ToL3puFTfQ5XFWY8r+8z6LuUkwhZ5WsnEquFI0aC1GSR7zXZCfuEfJ
GbXwLmpQqWZD1e0Xceq15i7sJXz3SkwZmq2/e3yRyO0ZxnxqvMA7Q5xi9cNBz0Sj
ZBkb4hZzQj4DobBricsfk0lFsSw2VuSeZvPBjJodjeTuq6u/LvxdV1qlkPmZmpXh
1TCm1csL8DH+uXgcrP8onoLEcnlbROzJmrYs4SFMiufY11htxzhES9ygJz9nAeJW
VNiCOOd7xWqmYMwMHVlt5UkOuvxoOjEZFiZ/bMJYS2RBpXTn82nDl/q7y5uh8LyA
30LQgggpDcV3GCrOSR+2o+j4b9WtkQ==
=0MCT
-----END PGP SIGNATURE-----

--AqrLNF4IA2prbg7U--
