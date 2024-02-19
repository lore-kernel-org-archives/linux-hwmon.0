Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58BA249E3
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Feb 2024 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354084; cv=none; b=WOuQ1ltjlVD2dW46ZTfr9vuF+SRJSY42jwlC4Xe2GPFvsyPtjjtuPaeSdTs9axXcUzMwG4xGrTXFgTZs8jAq8BvwHTr2HWVHxccePx6PatVQGBG377q0GHz29styBfm8uoU9t0qeDkHrCxujU0U/tsH2ohV08FI/yFyoLVJMt9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354084; c=relaxed/simple;
	bh=OIuN3HQLijivS4PDgFO/nRtHjPM7fSKtKIF1/97nGuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eo0JHzk227XTggBt3p6dQY1gOB//r4Cbr/AgziL5NVCXJguVbEg3eufyP0XNJykPNiIvKditLA1egs6teqKnHKrZYuGbjB49E4QHwvYwufcL5leEBKwfjF+NL26hQBfD+pKdzw4Xc80j2kY1ovo5e3s5r+0vg1p+sYPtyoIp1Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4F/L7J5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4F/L7J5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3180DC433C7;
	Mon, 19 Feb 2024 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708354084;
	bh=OIuN3HQLijivS4PDgFO/nRtHjPM7fSKtKIF1/97nGuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4F/L7J5ueBUgkEf+YOkihm2zcOms1ubi3t0hds2+zGNR6wwW2EqgncRaEQzIUsOL
	 u8zBTBFdDrQh3h3kIajdlTMIicVHBUbD11aviQW/Hr6d9T8Jaev27zSyOOugVpzRih
	 aKE73A0k4c30o1FvOB74Gni7fhI79h71Lvl2nWgR1vGpXriRWvTMlYMs4wuxupuKGV
	 s1oJTiYQxB+TIpmoYoa7R2Vs+BoYA5eMr2GYaTKenhQEEV9HoPMvQZ+BryfokIMeTX
	 PmMfK1RqeyX9/mzY45i2h3d86pi3p1bQDw0/GHeuVhqKqvFVcSuFBxOYF9kefNcpnW
	 skMm2hV5ckvWg==
Date: Mon, 19 Feb 2024 14:48:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Zev Weiss <zev@bewilderbeest.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH 0/3] hwmon: (pmbus) Use PMBUS_REGULATOR_ONE to declare
 regulators with single output
Message-ID: <20240219-rigging-strive-fd54af33253c@spud>
References: <20240214194342.3678254-1-linux@roeck-us.net>
 <20240217-sliced-company-6c6fa2a40369@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e0VeFjhKMOVLzh+z"
Content-Disposition: inline
In-Reply-To: <20240217-sliced-company-6c6fa2a40369@spud>


--e0VeFjhKMOVLzh+z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 10:00:30PM +0000, Conor Dooley wrote:
> On Wed, Feb 14, 2024 at 11:43:39AM -0800, Guenter Roeck wrote:
> > If a chip only provides a single regulator, it should be named 'vout'
> > and not 'vout0'. Declare regulators for chips with a single ouput using
> > PMBUS_REGULATOR_ONE() to make that happen.
>=20
> If we're gonna do this, we should go ahead and document each of these
> regulators. If Naresh sends a v2 for the tda, I could do the others.

As it turns out, the infineon devices in question are not PMICs, but
regulators themselves. I think something like the following is what we
need. Perhaps Zev or the 9elements guys can comment.

Cheers,
Conor.

commit 9cf2671c0b98c0a0dd599fe9152985d1320bf320
Author: Conor Dooley <conor.dooley@microchip.com>
Date:   Mon Feb 19 14:24:48 2024 +0000

    dt-bindings: regulator: promote infineon buck converters to their own b=
inding
   =20
    These devices may need to make use of the common regulator properties,
    but these are not permitted while only documented in
    trivial-devices.yaml
   =20
    Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

diff --git a/Documentation/devicetree/bindings/regulator/infineon,ir38060.y=
aml b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
new file mode 100644
index 000000000000..bb0114f7e13f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon Buck Regulators with PMBUS interfaces
+
+maintainers:
+  - Not Me.
+
+allOf:
+  - $ref: regulator.yaml#
+
+properties:
+  compatible:
+    enum:
+      - infineon,ir38060
+      - infineon,ir38064
+      - infineon,ir38164
+      - infineon,ir38263
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      regulator@34 {
+        compatible =3D "infineon,ir38060";
+        reg =3D <0x34>;
+
+        regulator-min-microvolt =3D <437500>;
+        regulator-max-microvolt =3D <1387500>;
+      };
+    };
+
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Docum=
entation/devicetree/bindings/trivial-devices.yaml
index 9cdd5a534120..e07be7bf8395 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -130,14 +130,6 @@ properties:
           - infineon,dps310
             # Infineon IR36021 digital POL buck controller
           - infineon,ir36021
-            # Infineon IR38060 Voltage Regulator
-          - infineon,ir38060
-            # Infineon IR38064 Voltage Regulator
-          - infineon,ir38064
-            # Infineon IR38164 Voltage Regulator
-          - infineon,ir38164
-            # Infineon IR38263 Voltage Regulator
-          - infineon,ir38263
             # Infineon IRPS5401 Voltage Regulator (PMIC)
           - infineon,irps5401
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor

commit 597739840d2bc95ebb884d7f5fc4f3cc206d9af6
Author: Conor Dooley <conor.dooley@microchip.com>
Date:   Mon Feb 19 13:29:12 2024 +0000

    dt-bindings: hwmon/pmbus: ti,lm25066: document regulators
   =20
    All devices documented in the lm25066 binding are intended for use with
    a regulator, be that for purely monitoring purposes (lm25056) or, for
    the other devices, as the controller of that regulator. The binding does
    not currently allow regulator child nodes, so add one.
   =20
    Each of these devices interacts with only a single regulator and
    documentation refers to it as "Vout", hence the choice of child node
    name.
   =20
    Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml =
b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
index da8292bc32f5..4373e9c86e54 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
@@ -34,6 +34,18 @@ properties:
       Shunt (sense) resistor value in micro-Ohms
     default: 1000
=20
+  regulators:
+    type: object
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg


--e0VeFjhKMOVLzh+z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdNqIAAKCRB4tDGHoIJi
0sImAQChdhCGChsKq/OpVRcTYQ4L5t5UdPe/UBNgRL6lHQ6U8gEAx0lxqiSNNvTS
cOGiEwnBmoJ/CWW6TOOiyos4GOAcsQY=
=+t1I
-----END PGP SIGNATURE-----

--e0VeFjhKMOVLzh+z--
