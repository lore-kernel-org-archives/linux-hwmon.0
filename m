Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739373DEADB
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458482; cv=none; b=PaJb9MQZkJDify4u1HJmJ6APSf/XxNS271SdhE2BCfoWuBRY9t83vRIWsg7G2LtlpMTbWgv9eLdbgnbbrfsFNRhD1q32IpqQY5q8cyIw1nJSvvNYu3ddQNbGn2oh+w0yAcvEaK0bh5bcRJQqMDrrfMn+06PTLqEDeY97FaKXmus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458482; c=relaxed/simple;
	bh=0jFxQTotMk1w+kj1PVUy2tCr1HNlsx175r4rKIe94+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUamdnQYP0jcg5iBm1m0Svqw6mgaSWMVpuhEVkSYQQDNoOijqeASRuzNH4FQ5cDkqSOhseDX2Z4eo5a6F3RWcQKCTyjFPgzNg3Pg1DWlyk8wZ0gy/AwACWR3wNkpitjTTDgppCMqrA+aTEqu2O5AWypIYS0VrZeiMpttWp6LwU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=It/dvF2d; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="It/dvF2d"
Date: Fri, 26 Jun 2026 10:21:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458479; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type; bh=8zVgkyPuUdEvLBDAnCrryoRbyIBwhsi6Cw34qK0ddE0=;
	b=It/dvF2diRU7mJL/z1L5kjgZ0/rpTTOecB5lpxLGviDJJmHSvbXKLt/cZcQEEt0AMDC8FA
	qPVxfN5V6Dh4KmqiO5BEKrvyd1F3BhcnN/jwC/f2U2E3+5SoIZcOEMSi8ufjmQIWJXoDIh
	ZBZ0vRcRoCuurA/dmAyM2r/Wlm6bYuA=
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
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 0/9] Support ROHM BD127x0 hot-swap controllers
Message-ID: <cover.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IxzToCukKiFFyLnP"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT


--IxzToCukKiFFyLnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD12780(A) and BD12790

The BD12780 and BD12780A hot-swap controllers are very similar to Analog
Devices ADM1278. There are only some minor differences in the registers.

The BD12790 is largely similar to the ADM1272, with slightly different
coefficients and minor register changes.

This series adds basic support for these ROHM ICs.

Additionally, this series contains couple of fixes, which can be applied
independently from the bd127x0 support patches. Fixes are:

Patch 2/9: Prevent read from uninitialized stack (found by Sashiko)
Patch 3/9: Prevent coefficient overflow with larget shunt resistor (found
	   by Sashiko)
Patch 4/9: Support module auto-loading when DT is used.

Revision history:
 v1 =3D> v2:
  dt-bindings:
   - Fix compatible list as suggested by Krzysztof
  adm1275:
   - Add patches to fix issues pointed by Sashiko.
   - Add of_device_ids for all supported devices.
   - Add own switch 'case's for the new ICs instead of overloading
     existing ones
   - Drop i2c_device_id for bd12780a
   - Don't use IC-wildcard in macro name.

---

Matti Vaittinen (9):
  dt-bindings: adm1275: ROHM BD12780 hot-swap controller
  hwmon: adm1275: Prevent reading uninitialized stack
  hwmon: adm1275: Detect coefficient overflow
  hwmon: adm1275: Support module auto-loading
  doc: Add ROHM BD12780 and BD12780A
  hwmon: adm1275: Support ROHM BD12780
  dt-bindings: adm1275: ROHM BD12790 hot-swap controller
  doc: adm1275: Add ROHM BD12790
  hwmon: adm1275: Support ROHM BD12790

 .../bindings/hwmon/adi,adm1275.yaml           |  43 +++--
 Documentation/hwmon/adm1275.rst               |  24 +++
 drivers/hwmon/pmbus/Kconfig                   |   4 +-
 drivers/hwmon/pmbus/adm1275.c                 | 162 ++++++++++++++++--
 4 files changed, 208 insertions(+), 25 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
--=20
2.54.0


--IxzToCukKiFFyLnP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KF0ACgkQeFA3/03a
ocVquQf/RhWM4u/ko+DJKUFkMDLgZcVb+mIOnBAgWvVZj3H807QN+JLqhKCscX5Z
w5BWN2HmL608O9Y0qpmXU3WmFPYyClRpOR92EMCdIucpJgiA2ZZBWX/fdjXopc2e
WfrkiuTO0F8ST6RIRS6ZJE5at+J9ukfkdF4gvWCZf7V8KM2kkwLWMHYUYTfcsoMX
hU4iY0PKKfsKZUlEBJ9zyj98O5yyFAr9eoGwxJBlN0B6UXdPuwhlpRCNXXLuGqOe
anYcu/ObkAFZjY2oF10k26zkS8P41zJbL8/BCdR2wRQCiwShPY41d572j94AQoLa
yUEAYy6ygE+p5R7JZRFzjKJY6rEkcg==
=zD47
-----END PGP SIGNATURE-----

--IxzToCukKiFFyLnP--
