Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3478A3DD537;
	Fri, 26 Jun 2026 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458737; cv=none; b=GlNEk7iyx8d2bYoINabTBe+go2MsEAakPdF32tuZS5KhOuuErYJQEKjgLKuJpez4VdnGL6arPPAn3sQox0cXi+3hRMhphJnjm6QjICmvR9Rr9JuUGfD5aG+wF2GVUedTFFTFPBoJP7wh+ChI2SWLkpukde4bXaji2z/W3RnnS5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458737; c=relaxed/simple;
	bh=mugohBXKCp4ny2CJ/6fwVEUi7d1lQAIkE7RrnjR6h98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpJyiIKkEYf5P9T/o6BTJd4q8F1izneRUo3FW7gJQ6AODHvAJ1zdCm8Kh9fO0bn7BaOnYCpkndCIq0P79hq3MaA7Wed2DH89KVEFi4G8wAulKskZk/XGAS+Z2mPC7qAVfMnUnQHJrtwHyhfmUQ5Zi/tt6BoyiBIMdU1Ou0gWgeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lVc6PmPb; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lVc6PmPb"
Date: Fri, 26 Jun 2026 10:25:13 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458724; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=oYhqosOvuzeSH9Sgze5f43qjBtJ9XoZ22gsk+xZNo9U=;
	b=lVc6PmPbJLo8pIRPXukXOVhw1iI+AE5y6GsFAmT+gDI5IiCfAbwZWWjE0ow5Fdk4ppfM5+
	B9v+Ty1LghIEm2dUwl7iN4InsZY3gzRYFEVGqfUJzuJ9Zz+ZRg24p4NEcctUUrJbY6JgnI
	3/mYkzAWn3v2yZKlb3fKhiw72fXDQ3o=
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
Subject: [PATCH v2 7/9] dt-bindings: adm1275: ROHM BD12790 hot-swap controller
Message-ID: <753a6ded3e1aff1aaba7d932f0a883f789d9dfaa.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZRtQDs22F4Wdh1ZQ"
Content-Disposition: inline
In-Reply-To: <cover.1782458224.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--ZRtQDs22F4Wdh1ZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Support ROHM BD12790 hot-swap controller which is largely compatible
with the Analog Devices adm1272.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Revision history:
v1 =3D> :
 - Fixed double space from description
---
 Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Doc=
umentation/devicetree/bindings/hwmon/adi,adm1275.yaml
index 503e93756584..283cd1662689 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
@@ -33,6 +33,9 @@ description: |
     https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_s=
witch/bd12780muv-lb-e.pdf
     https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_s=
witch/bd12780amuv-lb-e.pdf
=20
+  The BD12790 is a ROHM hot-swap controller, functionally similar to the
+  ADM1272.
+
 properties:
   compatible:
     oneOf:
@@ -47,6 +50,7 @@ properties:
           - adi,adm1293
           - adi,adm1294
           - rohm,bd12780
+          - rohm,bd12790
           - silergy,mc09c
=20
       # Require BD12780 as a fall-back for BD12780A.
@@ -103,6 +107,7 @@ allOf:
             enum:
               - adi,adm1272
               - adi,adm1273
+              - rohm,bd12790
     then:
       properties:
         adi,volt-curr-sample-average:
--=20
2.54.0


--ZRtQDs22F4Wdh1ZQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KVkACgkQeFA3/03a
ocW9eQgAppMLa3Il+P+Can0/Qy4TQVI9S6070ovT6lE39gReIB0nnm/kX/e+UTee
V4Y9lXMEnO0WcfzPAxQiz65HMy3YcU0029f/C4A1GKLYxHsQOiCudcka6/DkJRwo
Z+BpKSDMGmlqrM49V3hi1SEHDMAOqssZU3xllyaFwMhvqcmMryOE7tMIL/vfCAyi
n/GBT6RFnlu688Mi+G2JX17Ddat4A36ow3+DGnULz4miJY+X0owyzhAmzNDfeHTz
pJyoNVXDEG5pF5qzKO4Qo9y/uAMJ+Nr+d4JUk2z4WN2GLltylZwg2juK9HXVVsNH
FNRUGnliAKDhPc4UGf5ASJzK/SOqlg==
=BxIB
-----END PGP SIGNATURE-----

--ZRtQDs22F4Wdh1ZQ--
