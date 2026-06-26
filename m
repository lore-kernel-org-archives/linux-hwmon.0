Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395633DC852
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458689; cv=none; b=H2BGt9yTqazNT8U55mQweFrgPBVfOWLQ8vXmdQOA1EdlEuYwb6MNBAGFB4yGeJlhJEdQZ0SrXO09WWp5bOMa7mw1Wc8wY27ab1iG5yscu6OQHwpoemgGPIEg+jRi8sKC18kMGuAF7Mf1Q3RShbyXsd5BtG/EoJNBkRO8ZmJP0G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458689; c=relaxed/simple;
	bh=MvuET2XXAl+eOXJKtCIp+lmZAUbJiT/bjpH1QHCxm1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKVkwVCVDbjZ7Gf22ZfqZyixyPsE8DQhElGe2VNty2BgHZEhdPjVoM6tYmeLOGySl77OoCW/KD5ht1RYo9u7iG40vqk/r9nKnCqCom4ZpLQUrtX5Xba+dejhqTonx464lc5xg22BS92HxFVZSGosHN6P7SuxcwXtz1HeNmgaLOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VKIGi7bq; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VKIGi7bq"
Date: Fri, 26 Jun 2026 10:24:38 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458686; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=V3607OEtfI/yqB7N4neQ+xPVjgzatjXutskNE4sP+CE=;
	b=VKIGi7bqlc9n9/DCWKsMTuhHUK5+mXEtjkXtwcM76R048WnuvVBGyNVtQxuS2259zatSkw
	MdG1EcYiLWCnUIPZlunEblBdcxE7nQDDH2gQQk6aPf4NnmnN8XQ4JMChfUgSaeYFimvHf/
	wEq7V25yxBD+VZL2XkWZWhtLYgsGDu4=
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
Subject: [PATCH v2 5/9] doc: Add ROHM BD12780 and BD12780A
Message-ID: <5ff4a4a7a939cd642522fde407b5c9fa123a7089.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d/mu3XsIhDyVXu0K"
Content-Disposition: inline
In-Reply-To: <cover.1782458224.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--d/mu3XsIhDyVXu0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add the ROHM BD12780 and the BD12780A to the list of the ICs supported by
the adm1275 driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---

Revision history:
v1 =3D> :
 - No changes
---
 Documentation/hwmon/adm1275.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.=
rst
index cf923f20fa52..8a793dd2b412 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -67,6 +67,22 @@ Supported chips:
=20
     Datasheet: https://www.analog.com/media/en/technical-documentation/dat=
a-sheets/ADM1293_1294.pdf
=20
+  * ROHM Semiconductor BD12780
+
+    Prefix: 'bd12780'
+
+    Addresses scanned: -
+
+    Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/po=
wer/power_switch/bd12780muv-lb-e.pdf
+
+  * ROHM Semiconductor BD12780A
+
+    Prefix: 'bd12780'
+
+    Addresses scanned: -
+
+    Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/po=
wer/power_switch/bd12780amuv-lb-e.pdf
+
   * Silergy SQ24905C
=20
     Prefix: 'mc09c'
--=20
2.54.0


--d/mu3XsIhDyVXu0K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KTYACgkQeFA3/03a
ocWpSAf+LR3L0conBhlvt9AQRGZAimHQibC9cjmGOsePvtcHwtPxz6yup6bg5dhX
BIYItDXqvZhvotb1xhZCaY52UWgHnwCahdRhbpJDD8xf4Zza66as7/wlYI4gDJ7R
gsD6L4AWu24CuoYD3ZMrnTNbGNZfKmpdDPrnz+rjqU54WsclIwzniz1/PmYzq2R9
miMoxCzCtYBOmfwts9C5rgV0r7eBBb9hki86RRs5nPSU5xfYdccFMoiwYauLSbTW
hSFQTI2hwluV3r9Vl7XJXND+DK1prcbzqai8k1EoFbrKfDxp7FmEeGp1Kg/Wnclr
weFPmms4MsHDDQw2DJ4YC1/TjsE8Xg==
=lyt3
-----END PGP SIGNATURE-----

--d/mu3XsIhDyVXu0K--
