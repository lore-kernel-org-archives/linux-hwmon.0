Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C4E3DD537
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458758; cv=none; b=bjrqjgyfSfy0XeVagPWROxuWKc/BDv90CVYGanvAgg5W6YD/huie/bxX13txSjpay5Ucwwct8W55kZkFU8CQrLHJIewKlFV0I2WCVfDbEJt7ieDNO6sgYk7ZHQkHJ/U4nGZ8otqm5k1m71ZlA1eFt3JeCLBSX9fXgzKk85m3qmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458758; c=relaxed/simple;
	bh=5AftYOd1hAFp1fv9Uk+DIf7KHwpcn89Bnpspbjk3hDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKq7AFiy9GgVWWvGWOFJUQ/XQIn+poI5r3CO8B1FCjXVdrNW9wwEGzYfmm7RkwWBmE2g6j1KMZIsfcKto4ARaE+wCjynAF5wNhaWQRjnSlwiw/jqnA0Y0ivqE6xWd9UjkFzOBpYK72Gk+VZRp+y4chTe/qL/Obrfcv8zVxRbAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HR3XzbiM; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HR3XzbiM"
Date: Fri, 26 Jun 2026 10:25:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458754; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=kDfToPd2gbV1c6/JnEvk3DhLS/foUgCRUwun8/2sbfs=;
	b=HR3XzbiMB7fttu/qoZwr+Nqgo8BkV2NRr4U7hHfrheFtg1anNthXwXHMNerY2QLl5NeuiG
	bjLprcSoAEwbfIk7aArhFrLOf6G2XGsAOE1bYa+wBjzFxS97DX/4JsFnnEJqln9HqIIx9U
	f19mMtNM+PRBVfXJgzycnEaj5AhNbVA=
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
Subject: [PATCH v2 8/9] doc: adm1275: Add ROHM BD12790
Message-ID: <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YB/0o83t/5l+QX6F"
Content-Disposition: inline
In-Reply-To: <cover.1782458224.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--YB/0o83t/5l+QX6F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add the ROHM BD12790 to the list of the ICs supported by the adm1275
driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v1 =3D> :
 - No changes
---
 Documentation/hwmon/adm1275.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.=
rst
index 8a793dd2b412..d8495be313b8 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -83,6 +83,14 @@ Supported chips:
=20
     Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/po=
wer/power_switch/bd12780amuv-lb-e.pdf
=20
+  * ROHM Semiconductor BD12790
+
+    Prefix: 'bd12790'
+
+    Addresses scanned: -
+
+    Datasheet: -
+
   * Silergy SQ24905C
=20
     Prefix: 'mc09c'
--=20
2.54.0


--YB/0o83t/5l+QX6F
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KW0ACgkQeFA3/03a
ocV2YQf9E1ZEacFDegciy5HhKNKpnr6h2F+9rLjnT/04uHt1RMgupoeai2aJjo4U
cGFaCqdHodQUO/4piG+W4WKxcubwgp6amuB/lesBC7eX/Y/Am3l1s1C76CfjYKMj
6TVM+DG2ZG7HdCcsWy0+4lFlwMp14wRedhUZmlmcLWURHV+xN4i8REqLY/FmSCWe
/fy97BESktnc9Vw3eoYVdETdiDdFGtYcTFT73AZoOizrXsSj0BFlt/XZyje/NHny
4Hrnj9AxTOqdW+jheWcwIf4wAG4py+QC56dlSNfIvyhdQG+sl95MMQGF5Caq1RRI
hMr7no2zzGQCwYpLW2nqJvxXcL7UEQ==
=yVWd
-----END PGP SIGNATURE-----

--YB/0o83t/5l+QX6F--
