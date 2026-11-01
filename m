Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577084;
	b=ZUzegQu44VNYZwf2gvkzugRD0dkagibRp0fYnFqDa85NsG5wAVvYXVekj0WTWHa5GeeC
	 GFqGvWuKl8getSIPy5J5teidTPYvFH/CiiVgbIBN9BVRjNop5nrhye0s6mzYUZxkQkcBp
	 kSNbHLvfcxgLc1y/h1n+D8rZ3RN3aG9qkeEi3rQNyht6wyuHkCnAvaj6t6LL2kbv6hSz5
	 fAQSdi1Hm2YLOwgwt4yyEpkgYbxhSMlejh7pBHpWJH8wtKj6fVv4rsMPHglGooe1NnHyF
	 nQo3krClr4PToAuVEAfkF9eLQ31qG53o+HaWQuGtUY3Q4485kUALg7zqmZAhnX1YgXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577084;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EzaB0dFrqATFo/F9hMIFjRzg10fufdUElMcuGto4f/g=;
	b=az5VXDV2je8Kp7HCmUvNplrLcIHNSM3eUsU37FrtVoHsKvfpzUAiZu92YM3fBrtvMjDB
	 Z2sDTiSW2R887+8fyBj0kXp3LL5GN2JaQcTUj++mLqfJThaFbx6DO3XEhZzpWO9+HCwBP
	 mJWPwwoZWGUvrEyfsJY47YK0Ql0d1JicDz/+mGHuqOY+0cHVsJ8ZGhqU/05+I695+t/G5
	 ZkPCO4iXXvLh4mDw9R99goBzvhSPDu15ELA85hDvKeVRVJMmaDmACiDJTQDVUzAUBhpqQ
	 x2iroc1d6GZFZpYpF9BHPb8iQPlNfowuZQFcex0RpGv5VoYnXsc5Wk66JisajcXHMkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ZlQD0HLF;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB9A606A326;
	Sun,  1 Nov 2026 23:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB9A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ZlQD0HLF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793577079; x=1793836279;
	bh=EzaB0dFrqATFo/F9hMIFjRzg10fufdUElMcuGto4f/g=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ZlQD0HLF/IOtVcjNIj9YatHrxg3HKazXhbtNL7qoLz8L2HMJKM7T0c7RUqz8C9nxR
	 BG/wg2JNrIUU0+kgiE+zXfZ5jlGD19ufQ+ssmo4/Zt7dg4DV4EqgBKWPlS3j8K/eop
	 Hk5vPcenhJR+Z80J89IPsjfe4xiqR6pXm5ynYHNcQ9aKvVnUlFTrAbuqDXLCS3/24s
	 4+fseg1jQJ9L8mkD9Yg78CRkLnmGtQoxl2LNtkhRIJwGPxkVAX3AgGASZl/aqMKHDG
	 YyErqqG2Ic0VeDm9L7ZFQyNGTk7obaxDoDipU2KkwAkjZwH0LILPaN+VIYwDqTMit2
	 QBy9tpiR9mi7Q==
Date: Sun, 01 Nov 2026 23:51:16 +0000
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
From: Ismael Ojeda Perez <iojedaperez@proton.me>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (it87) Add support for IT8607E
Message-ID: <179357707375.834227.595814448085536071@proton.me>
Feedback-ID: 55883223:user:proton
X-Pm-Message-ID: 195c5c7a0034942337a697c596d10dd4e26769cc
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The IT8607E is the Super I/O of the Intel NUC6i3SYB and, according to
Intel's product specification, the NUC6i5SYB (BIOS SYSKLi35.86A). Its
environment controller is hidden from ACPI (HHMD._STA returns 0), so the
chip is only reachable through the LPC configuration ports, and the ACPI
resource check must be bypassed with ignore_resource_conflict=3D1.

No datasheet is available. The register layout was compared against the
IT8603E, and the BIOS fan setup (IT8607PeiInit and FanPei PEI modules of
SYSKLi35.86A.0071) was disassembled to confirm it programs the same
"newer autopwm" registers (0x68-0x6d for pwm2). Features are therefore
copied from the IT8603E.

Tested on a NUC6i3SYB (BIOS SYSKLi35.86A.0042, chip ID 0x8607, rev 2):
temperatures agree with coretemp, +3.3V reads 3.31 V, the 3VSB and VBAT
inputs read plausible values, fan2 tach and pwm2 respond to the
automatic-curve registers (start 74 C, full speed 92 C, as programmed by
the BIOS) and to manual mode, and the original values are restored.

The tachometer was not compared with an external tachometer and the
voltage scaling was not compared with a multimeter; the values above are
only cross-checked against coretemp and the expected rail voltages.

Signed-off-by: Ismael Ojeda Perez <iojedaperez@proton.me>
---
Notes (not part of the commit message):

Based on the hwmon-next branch of groeck/linux-staging.git (file contents
as of 2026-11-01). Also compiled as a module against 6.18.58.

Sample output on the NUC6i3SYB with it87 loaded with
ignore_resource_conflict=3D1 (raw sysfs, hwmon5 =3D it8607):

  in0_input=3D828  in1_input=3D1212  in2_input=3D2004  in3_input=3D2004
  in4_input=3D2016  in7_input=3D3312 (3VSB)  in8_input=3D2808 (Vbat)
  in9_input=3D3312 (+3.3V)
  temp1_input=3D72000  temp2_input=3D67000  temp3_input=3D74000
  fan1_input=3D0  fan2_input=3D4623
  pwm2=3D89  pwm2_enable=3D2

The Super I/O is found at 0x2e, chip ID 0x8607, revision 2, and the
hardware monitor at 0xa40; ACPI reserves that range, hence the module
parameter. Is that acceptable, or would you prefer a DMI quirk for the
NUC6 boards?

 Documentation/hwmon/it87.rst | 16 +++++++++++++++-
 drivers/hwmon/Kconfig        |  4 ++--
 drivers/hwmon/it87.c         | 17 +++++++++++++++--
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
index c33ba8a..17bfffb 100644
--- a/Documentation/hwmon/it87.rst
+++ b/Documentation/hwmon/it87.rst
@@ -19,6 +19,14 @@ Supported chips:
=20
     Datasheet: Not publicly available
=20
+  * IT8607E
+
+    Prefix: 'it8607'
+
+    Addresses scanned: from Super I/O config space (8 I/O ports)
+
+    Datasheet: Not publicly available
+
   * IT8620E
=20
     Prefix: 'it8620'
@@ -243,7 +251,7 @@ motherboard models.
 Description
 -----------
=20
-This driver implements support for the IT8603E, IT8620E, IT8623E, IT8628E,
+This driver implements support for the IT8603E, IT8607E, IT8620E, IT8623E,=
 IT8628E,
 IT8689E, IT8705F, IT8712F, IT8716F, IT8718F, IT8720F, IT8721F, IT8726F,
 IT8728F, IT8732F, IT8758E, IT8771E, IT8772E, IT8781F, IT8782F, IT8783E/F,
 IT8786E, IT8790E, IT8792E/IT8795E, IT87952E and SiS950 chips.
@@ -287,6 +295,12 @@ The IT8603E/IT8623E is a custom design, hardware monit=
oring part is similar to
 IT8728F. It only supports 3 fans, 16-bit fan mode, and the full speed mode
 of the fan is not supported (value 0 of pwmX_enable).
=20
+The IT8607E is found on the Intel NUC6i3SYB and NUC6i5SYB boards. The hard=
ware
+monitoring part is treated as compatible with the IT8603E (16-bit fans, ne=
wer
+autopwm registers) because no datasheet is available. The BIOS keeps the
+environment controller hidden from ACPI, so the driver can only be loaded
+with ``ignore_resource_conflict=3D1``.
+
 The IT8620E and IT8628E are custom designs, hardware monitoring part is si=
milar
 to IT8728F. It only supports 16-bit fan mode. Both chips support up to 6 f=
ans.
=20
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e..bc6ddff 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -952,8 +952,8 @@ config SENSORS_IT87
 =09  If you say yes here you get support for ITE IT8705F, IT8712F, IT8716F=
,
 =09  IT8718F, IT8720F, IT8721F, IT8726F, IT8728F, IT8732F, IT8758E,
 =09  IT8771E, IT8772E, IT8781F, IT8782F, IT8783E/F, IT8786E, IT8790E,
-=09  IT8603E, IT8620E, IT8623E, IT8628E, and IT8689E sensor chips, and
-=09  the SiS950 clone.
+=09  IT8603E, IT8607E, IT8620E, IT8623E, IT8628E, and IT8689E sensor chips=
,
+=09  and the SiS950 clone.
=20
 =09  This driver can also be built as a module. If so, the module
 =09  will be called it87.
diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 2757d42..bdef0b7 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -12,6 +12,7 @@
  *  similar parts.  The other devices are supported by different drivers.
  *
  *  Supports: IT8603E  Super I/O chip w/LPC interface
+ *            IT8607E  Super I/O chip w/LPC interface
  *            IT8620E  Super I/O chip w/LPC interface
  *            IT8622E  Super I/O chip w/LPC interface
  *            IT8623E  Super I/O chip w/LPC interface
@@ -66,7 +67,7 @@
=20
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 =09     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-=09     it8792, it8603, it8613, it8620, it8622, it8628, it8689, it87952 };
+=09     it8792, it8603, it8607, it8613, it8620, it8622, it8628, it8689, it=
87952 };
=20
 static struct platform_device *it87_pdev[2];
=20
@@ -160,6 +161,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8786E_DEVID 0x8786
 #define IT8790E_DEVID 0x8790
 #define IT8603E_DEVID 0x8603
+#define IT8607E_DEVID 0x8607
 #define IT8613E_DEVID 0x8613
 #define IT8620E_DEVID 0x8620
 #define IT8622E_DEVID 0x8622
@@ -530,6 +532,14 @@ static const struct it87_devices it87_devices[] =3D {
 =09=09.num_temp_map =3D 6,
 =09=09.peci_mask =3D 0x07,
 =09},
+=09[it8607] =3D {
+=09=09.name =3D "it8607",
+=09=09.model =3D "IT8607E",
+=09=09.features =3D FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
+=09=09  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
+=09=09  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
+=09=09.peci_mask =3D 0x07,
+=09},
 =09[it8620] =3D {
 =09=09.name =3D "it8620",
 =09=09.model =3D "IT8620E",
@@ -2941,6 +2951,9 @@ static int __init it87_find(int sioaddr, unsigned sho=
rt *address,
 =09case IT8613E_DEVID:
 =09=09sio_data->type =3D it8613;
 =09=09break;
+=09case IT8607E_DEVID:
+=09=09sio_data->type =3D it8607;
+=09=09break;
 =09case IT8620E_DEVID:
 =09=09sio_data->type =3D it8620;
 =09=09break;
@@ -3095,7 +3108,7 @@ static int __init it87_find(int sioaddr, unsigned sho=
rt *address,
=20
 =09=09sio_data->beep_pin =3D superio_inb(sioaddr,
 =09=09=09=09=09=09 IT87_SIO_BEEP_PIN_REG) & 0x3f;
-=09} else if (sio_data->type =3D=3D it8603) {
+=09} else if (sio_data->type =3D=3D it8603 || sio_data->type =3D=3D it8607=
) {
 =09=09int reg27, reg29;
=20
 =09=09superio_select(sioaddr, GPIO);
--=20
2.56.0


