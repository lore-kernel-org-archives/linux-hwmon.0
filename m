Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F923E3156
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 06:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591857; cv=none; b=pkdlho2CnfIa4pLjraFA9atesd0fowVb68u5PazSTDzjcz+fXBb5qZWH+KqAwLsV04I5yyZwSlGGsgTiPIXHIZCtMxzu1qME7fjQ9gZzUSMEh6zQn5UxqEiYwbcllasPsKRCKdeZCCy0A/gkj7zXYkytEjeu+VDSmXDKeOBGiUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591857; c=relaxed/simple;
	bh=ZZ/R/A/r8hjuKD/lF6qWc8k5JzENdrgQfqOKY43qtU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CagmLz509FqZNwLo+iWXTpxt0P/HG/rlmq6jKZMrOMUHgD+bycMIvwWB6UxDFQ6GlrFQSpZtACadRQsh1W9YseNiGI+lTbc0zvBjOQFFWWJliydtjQZOUSmrGHL/whXECyjVRJtYkrsBwB+h8Jkh/sVTuUSDlOXKaAH6bzmIaZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hajtCMaf; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hajtCMaf"
Date: Tue, 16 Jun 2026 09:37:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781591854; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=SFgSXTlpGxV9yNXoNm4IshXYjYV7Pfg/QyxOYfqFAOo=;
	b=hajtCMafAtkuhdhjIb3MDUevNv3J3WQqK8gLhTQUzkMpvuwAS190eMDNl0eoGSaZlfB3RX
	WHom0YsWl7fqkC/hoc2EDx/49WdOQ16UjU/do6pHQ1hSQyJ6CkqcrgE/nZLLfZR36TxZZs
	WFftNU5OJ+9at12JViZ6+gW1OvAoYY4=
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
Subject: [PATCH 4/7] dt-bindings: adm1275: ROHM BD12790 hot-swap controller
Message-ID: <ae80a037fa3b03ef5cfb446bf3e9c44efd4f04ec.1781591132.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NoS9xg8AAC5J5qa9"
Content-Disposition: inline
In-Reply-To: <cover.1781591132.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--NoS9xg8AAC5J5qa9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Support ROHM BD12790 hot-swap controller which is largely compatible
with the Analog Devices adm1272.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Doc=
umentation/devicetree/bindings/hwmon/adi,adm1275.yaml
index bc67510ef3ab..e231964a6706 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
@@ -33,6 +33,9 @@ description: |
     https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_s=
witch/bd12780muv-lb-e.pdf
     https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_s=
witch/bd12780amuv-lb-e.pdf
=20
+  The BD12790 is a ROHM hot-swap controller,  functionally similar to the
+  ADM1272.
+
 properties:
   compatible:
     oneOf:
@@ -48,6 +51,7 @@ properties:
             - adi,adm1293
             - adi,adm1294
             - rohm,bd12780
+            - rohm,bd12790
             - silergy,mc09c
=20
 # Require BD12780 as a fall-back for BD12780A.
@@ -104,6 +108,7 @@ allOf:
             enum:
               - adi,adm1272
               - adi,adm1273
+              - rohm,bd12790
     then:
       properties:
         adi,volt-curr-sample-average:
--=20
2.54.0


--NoS9xg8AAC5J5qa9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmow7yEACgkQeFA3/03a
ocUFdwf/QIZet9K/zhK0LYNDyJ59hj3bAmmZJVCRw+Q6frDw9QxIYg2s1CaNM2hr
Db9zJCMbFOjBPlF/lVXcLbQXbVZqOKLaAG/c1M7Lv1XdLVMvrBsEvZjRK0HJRBKf
qjcZlUHqmkYVr/D8YN37vIyoGvTxde8SsVDqFZA/W2HPuwxyo5IfSG15vP3BsUvq
fnNk5dlZv2zr6ZdK+m3pm8/B/Q7B7KUvL/BGJIIA3FBf4HFGq2wU2mSk+qVnDd/o
vNQd+F5+4+n6L7BxEx41U/hBfq1WfmDY54zteoHNX/rFdvEDDgdS8DHLVDwBWQ90
/QzSI6aRb2bt0WBxv3BfOId6TXhl3w==
=vn6h
-----END PGP SIGNATURE-----

--NoS9xg8AAC5J5qa9--
