Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9C33D3001;
	Fri, 26 Jun 2026 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458514; cv=none; b=FLfW0trxEbBHII4Hm65NmH05QCT9LUnyiucqysfZA6b9o+YNZPBkahswY82K1LB0XVQFhGzdh5ZiHZBPb+rwFnHeRB+B1bEwW/kpeJYfiHSTTqs8aDTO87NTxEj/dT7FSpL/Mt+VZ5wVaESWNhu9PoRzi5qXNu1lWtfMRjTp/vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458514; c=relaxed/simple;
	bh=EQYIb66lCiqMvEyzWKQx2mPAUZeyHhOny82+9D83JuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEsZ+bZr8XE9jekjn5cClveUFjwflPtZhkrdL7er94feUmSVX2wrb9bV9HZb8Fv0rSqOd52fESRoy/DsQK93152G04jur9hZR42wHk+tMnukbbTOdSHursJ/yt7BgOcE7XljPnbeZCQGe79jS1wzzjjNv1G89bW2pws5Jm5FOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oqx+kPQX; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oqx+kPQX"
Date: Fri, 26 Jun 2026 10:21:42 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458510; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=8Z6mVyShbNMSdoQxxEPmVAC9BJPj6Pqr2yzH03uykxs=;
	b=oqx+kPQXdoeJHYBiYfmLfMlgeD2KxJeeZ/PO64HyffNi3+KG+yblPi+kmdEHESbkHXroGx
	HR7gF4/Wzj0K+OSQItRYzg87wYqfMWrnto7MRlo4lHHDJp2ogt5XBLBbVCPO65kX5QQfHb
	pJe73S0tGujIDTH0NGhav+BvdHiyQ04=
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
Subject: [PATCH v2 1/9] dt-bindings: adm1275: ROHM BD12780 hot-swap controller
Message-ID: <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QrL0O5AKWtyDBQP3"
Content-Disposition: inline
In-Reply-To: <cover.1782458224.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--QrL0O5AKWtyDBQP3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Support ROHM BD12780 and BD12780A hot-swap controllers, which are largely
compatible with the Analog Devices adm1278. Main difference between
the BD12780 and the BD12780A is, that the BD12780 has one I2C address
configuration pin more (ADDR3) than the BD12780A.

Introduce own compatibles for both variants but require the BD12780A to
always have the BD12780 as a fall-back.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v1 =3D> v2:
 - Drop extra -items from the compatible list as suggested by Krzysztof
---
 .../bindings/hwmon/adi,adm1275.yaml           | 38 +++++++++++++------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Doc=
umentation/devicetree/bindings/hwmon/adi,adm1275.yaml
index d6a7517f2a50..503e93756584 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
@@ -25,19 +25,34 @@ description: |
     https://www.silergy.com/
     download/downloadFile?id=3D5669&type=3Dproduct&ftype=3Dnote
=20
+  The BD12780 and BD12780A are hot-swap controllers from ROHM. They are
+  functionally compatible with the ADM1278. The main difference between
+  the BD12780A and the BD12780 is amount of configurable I2C addresses.
+
+  Datasheets:
+    https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_s=
witch/bd12780muv-lb-e.pdf
+    https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_s=
witch/bd12780amuv-lb-e.pdf
+
 properties:
   compatible:
-    enum:
-      - adi,adm1075
-      - adi,adm1272
-      - adi,adm1273
-      - adi,adm1275
-      - adi,adm1276
-      - adi,adm1278
-      - adi,adm1281
-      - adi,adm1293
-      - adi,adm1294
-      - silergy,mc09c
+    oneOf:
+      - enum:
+          - adi,adm1075
+          - adi,adm1272
+          - adi,adm1273
+          - adi,adm1275
+          - adi,adm1276
+          - adi,adm1278
+          - adi,adm1281
+          - adi,adm1293
+          - adi,adm1294
+          - rohm,bd12780
+          - silergy,mc09c
+
+      # Require BD12780 as a fall-back for BD12780A.
+      - items:
+          - const: rohm,bd12780a
+          - const: rohm,bd12780
=20
   reg:
     maxItems: 1
@@ -104,6 +119,7 @@ allOf:
               - adi,adm1281
               - adi,adm1293
               - adi,adm1294
+              - rohm,bd12780
               - silergy,mc09c
     then:
       properties:
--=20
2.54.0


--QrL0O5AKWtyDBQP3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KIYACgkQeFA3/03a
ocV4YQf+NGQwVCPJg4O5GD/pCyclNYS48+enH5dzqsZuL539P/tg5laIj9XsapN3
vXIUtA13+lEt5TO9Wn8YdemdZouTg/7kGYmW2/E17Lq8BHsdIm/qMPc8U2ploGmp
kxv3sVO07oG22q3Uf4XoI19tTuUN0x7ngyJpB/9EBV+YcVSq+tRkrLtzvp1/pQIF
HnS2l3/u1T+DyI+WXlRrSQJT+mp6SZdzlGuxqR+KHDN0t8l9tl0l5lDIDdQXsDY8
AQpXd2ZTxXtu1YPK7ncAoktm8bnys0Vfp8vOCu9ikNUZgxXzZLJWLut0VEh9anCM
kgdxjncq75nhtiakxcSYGlYwIHyCVQ==
=s4Rz
-----END PGP SIGNATURE-----

--QrL0O5AKWtyDBQP3--
