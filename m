Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D523EDE62
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 06:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591756; cv=none; b=hWJjWi2ua3M4WlpiIiZtZ80DU3u5ZTZVbIP7kHNBva9fTA64Qlepk/rvEJsDzrGwQtoKwVEBFs6tU94q9qs/xD0obzSWKZsxwQap6zoqe0Nzpvv4fLbb+kFOu2BJOv3lC0EZm40Nu3RNOWN+XPkpE/8+uCe8FhvmK09iEZEDf0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591756; c=relaxed/simple;
	bh=iTDlvuPuO62bXqBkucrDcpHgBwBky5/Pk/9XnO/+EHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nju8u6fDCuZCdkof8m4IiRH35G02VG7uKM9bXZgmSOnoK48gx3GryEx4BM2wJt8Zg/2C+FPFYQw7g/8U5p8focQCIsHT8vhRb2HzVe/5eapu2ldMv7TaWjGqKcJ+RO05skUZY/vD9qqaraQgc93rWYFc3f9tNrW76D2qtlApoR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YuNgXLGD; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YuNgXLGD"
Date: Tue, 16 Jun 2026 09:35:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781591750; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=yPb7nDFYcwu8D2P8ij1I9RJYfex6+EKQU49JXmE0QOE=;
	b=YuNgXLGDnG4wPonUY/l+ztRwMY8/70GkDE2rkNVX0nX/5u/DPewAAVVodbepCgZvqRTvcr
	U5xBhlYh/5pio9zcjoZ/b2x7oO7W9fP0bTu86qUWqutpW8IYiJXPdEusMf5hOl1mRrYrPz
	A+I2kswFam88UxFGb2L/YVnRVwGW7po=
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
Subject: [PATCH 1/7] dt-bindings: adm1275: ROHM BD12780 hot-swap controller
Message-ID: <d63c4df5e9df845bc4f94b4abdcd068a23929974.1781591132.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3y9HSZEj1nxJ6XaE"
Content-Disposition: inline
In-Reply-To: <cover.1781591132.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--3y9HSZEj1nxJ6XaE
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
 .../bindings/hwmon/adi,adm1275.yaml           | 39 +++++++++++++------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Doc=
umentation/devicetree/bindings/hwmon/adi,adm1275.yaml
index d6a7517f2a50..bc67510ef3ab 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
@@ -25,19 +25,35 @@ description: |
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
+      - items:
+          enum:
+            - adi,adm1075
+            - adi,adm1272
+            - adi,adm1273
+            - adi,adm1275
+            - adi,adm1276
+            - adi,adm1278
+            - adi,adm1281
+            - adi,adm1293
+            - adi,adm1294
+            - rohm,bd12780
+            - silergy,mc09c
+
+# Require BD12780 as a fall-back for BD12780A.
+      - items:
+          - const: rohm,bd12780a
+          - const: rohm,bd12780
=20
   reg:
     maxItems: 1
@@ -104,6 +120,7 @@ allOf:
               - adi,adm1281
               - adi,adm1293
               - adi,adm1294
+              - rohm,bd12780
               - silergy,mc09c
     then:
       properties:
--=20
2.54.0


--3y9HSZEj1nxJ6XaE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmow7rcACgkQeFA3/03a
ocUFKwgAlvf8Cglc4RUnVY67rERAPTTcYvHyy8OJFqH9q3Msxy0xxvlrb6tT1WIo
gXRJAWqp/PMxsxbsditrW7kpDuoyaB/iqbhRe2xE7BZtDCD1NQK5eStpRxxFdYbf
aDHYEmAfZiBKbSONLLW07ny7c7JPSOvyOVyjDX88ihB0z9EDxWIo8f34faMsZfMg
4k2yYQ8HLtS9XRcxU37/RICu0Ag7wbg+C32GuUzhY6dqRYvgHHxotoWM67o5bQdy
igs3Qe1zAtWLbf6z9MsVgyNs0kzp60e63BFqHI0hiv5+mcEDmbLpQgyQytpaf8mX
+OYfq5pdp+XOrjRDFbIOPs3u5DUCyQ==
=pI1+
-----END PGP SIGNATURE-----

--3y9HSZEj1nxJ6XaE--
