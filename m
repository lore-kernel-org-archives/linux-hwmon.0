Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ms.trustica.cz ([82.208.32.68]:39924 "EHLO ms.trustica.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752656AbcL2OcJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Dec 2016 09:32:09 -0500
Received: from localhost (localhost [127.0.0.1])
        by ms.trustica.cz (Postfix) with ESMTP id 273D69A77F
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Dec 2016 15:25:36 +0100 (CET)
Received: from ms.trustica.cz ([127.0.0.1])
        by localhost (ms.trustica.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xW6XmxcdpqOx for <linux-hwmon@vger.kernel.org>;
        Thu, 29 Dec 2016 15:25:35 +0100 (CET)
Received: from [192.168.88.62] (56.32.broadband3.iol.cz [85.70.32.56])
        (Authenticated sender: r.marek@assembler.cz)
        by ms.trustica.cz (Postfix) with ESMTPSA id 943179A759
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Dec 2016 15:25:35 +0100 (CET)
To: linux-hwmon@vger.kernel.org
From: Rudolf Marek <r.marek@assembler.cz>
Subject: [PATCH] sensors-detect: Add Exar
Message-ID: <5a915597-c5d5-9e0e-b1f1-043e8ae48043@assembler.cz>
Date: Thu, 29 Dec 2016 15:25:34 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------433E93E5239EEF478C2F2410"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This is a multi-part message in MIME format.
--------------433E93E5239EEF478C2F2410
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hi,

I stumbled across a new SuperIOs from Exar. They do not contain any hw sensors,
but it could be useful to have them in sensors-detect

Funny is that those have configurable key sequence, which can clash with
existing devices. Perhaps this can be improved and check for vendor ID?

In the attached patch, I added just a default key sequence 0x67, 0x67

The datasheets can be found:

https://www.exar.com/products/interface/uarts/lpc-uarts
https://www.exar.com/product/interface/uarts/lpc-uarts/xr28v384
https://www.exar.com/product/interface/uarts/lpc-uarts/xr28v382

The patch is completely untested, please check the datasheet for relevant
information.

Thanks
Rudolf

--------------433E93E5239EEF478C2F2410
Content-Type: text/x-diff;
 name="exar.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="exar.patch"

diff --git a/prog/detect/sensors-detect b/prog/detect/sensors-detect
index 057cd96..b47595e 100755
--- a/prog/detect/sensors-detect
+++ b/prog/detect/sensors-detect
@@ -1582,7 +1582,7 @@ use vars qw(@i2c_adapter_names);
 #      * FEAT_FAN
 #      * FEAT_TEMP
 use vars qw(@superio_ids_natsemi @superio_ids_smsc @superio_ids_smsc_ns
-	    @superio_ids_winbond @superio_ids_ite @superio_ids);
+	    @superio_ids_winbond @superio_ids_exar @superio_ids_ite @superio_id=
s);
=20
 use constant FEAT_IN	=3D> (1 << 0);
 use constant FEAT_FAN	=3D> (1 << 1);
@@ -2022,6 +2022,18 @@ use constant FEAT_SMBUS	=3D> (1 << 7);
 	}
 );
=20
+@superio_ids_exar =3D (
+	{
+		name =3D> "Exar XR28V384",
+		driver =3D> "not-a-sensor",
+		devid =3D> 0x0384,
+	}, {
+		name =3D> "Exar XR28V382",
+		driver =3D> "not-a-sensor",
+		devid =3D> 0x0382,
+	}
+);
+
 @superio_ids_winbond =3D (
 	{
 		name =3D> "VIA VT1211 Super IO Sensors",
@@ -2483,6 +2495,14 @@ use constant FEAT_SMBUS	=3D> (1 << 7);
 		ns_detect =3D> \&smsc_ns_detect_superio,
 		ns_chips =3D> \@superio_ids_smsc_ns,
 	}, {
+		family =3D> "Exar",
+		enter =3D>
+		{
+			0x2e =3D> [0x67, 0x67], #The non-default key can be 0x87 0x87, 0x77 0=
x77 or 0xa0, 0xa0
+			0x4e =3D> [0x67, 0x67],
+		},
+		chips =3D> \@superio_ids_exar,
+	}, {
 		family =3D> "VIA/Winbond/Nuvoton/Fintek",
 		guess =3D> 0x290,
 		enter =3D>
@@ -4081,7 +4101,7 @@ sub exit_superio
 {
 	my ($addrreg, $datareg) =3D @_;
=20
-	# Some chips (SMSC, Winbond) want this
+	# Some chips (SMSC, Winbond, Exar) want this
 	outb($addrreg, 0xaa);
=20
 	# Return to "Wait For Key" state (PNP-ISA spec)

--------------433E93E5239EEF478C2F2410--
