Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578282;
	b=Onsql5W60l1SzLuuxPEkid++ihDN+uguOKu4ZJaV+Y32NuDFEiFy6RulZ4axGtBYw2hI
	 uCZp7BMfiVVNOhq4LEJA5VRJjx2SE+goNZgbEzwn3IbDGMX3jSwJVq5uw27cuD1zaez+2
	 D8CzsWc3E9+EjWvNiUkcYRg+C/AdQyc/QSKCU7v2wAT2P0IPqDKh1fZt5ILhnMoVJBppm
	 41ij+uBkw1iemaUAJlkvg63LhdDqVfGFYeKPN2F5rGi6E+1Gkr+EnhXfy0TnlEXNIScOQ
	 UYQjP2lUmJ3L7IHB1SpWXEwDmNsNqPt4lkUiajxyX/7c5FCJl5ywW/Aj5DXnM7RS4kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578282;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Sq9nziOIpI60SWVQskUUtXjXQVzSkp10IxI/xn3NYvQ=;
	b=Nf2n1jqlOcq4HU2zwxS6ZQK2nnn1FKvaN337nJw4UatwFann/uj1w6AIDZnbf1kxsZjI
	 zvIB9X91+qKyDu2WtWhGWMdY2KTWEKJfQoOvrblGVWgAooAG/iNENytwB42TLWM7v30vi
	 YMtkohLHj7sCVlh+rq1brBgxI2F7nMmrOkFw5t0V8GcyLs0nVuFydt320rY8zPcJh8uMk
	 EtFjGkBGFULJ3fw5MtqQV89kCmyGlBxBs3YgbQ59yCoeIJh6V8CyeOymLtPo30a/Q7RUc
	 xt9daxmgasgU6a0UPV/ARTVySCtYAPRUnKaDHS7UOSkPM6ojlIm+8YW5Rze3exsWGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=L8Mj1Jyt;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801DE606A327
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 00:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 801DE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=L8Mj1Jyt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793578277; x=1793837477;
	bh=Sq9nziOIpI60SWVQskUUtXjXQVzSkp10IxI/xn3NYvQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=L8Mj1JyttzYU+wigxC5VzorvfYK2tcn8FKcCkVuFZY5sb+drSj+arrQs2FkErOIA5
	 h+C8gsc9sJ7SR6GoPuJIYlRMABW+kLA53kWTErENzSHqZpS06KRgvWLVUqOAnxn6AZ
	 8quEERAb8vXcMme+NLlQh+oITssP5I3oHvFKaiykaoUOvd73/jl8vJ1Up0xEO26K7g
	 1UCQPjNjf9jlg2ADhxCNGexqFsuV9eHULeni1IIda2lLRA/vybNwFD20TzkjAos1dp
	 qo+KxoWZerghFDKcoRwaGFtog5qtMCqJRTC8NrICD4LL3oU118pL8anvaP7xvXVneC
	 /TvPxLbyzk7oA==
Date: Mon, 02 Nov 2026 00:11:12 +0000
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
From: Ismael Ojeda Perez <iojedaperez@proton.me>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (it87) Add support for IT8607E
Message-ID: <179357826986.881874.2370184949108951928@proton.me>
Feedback-ID: 55883223:user:proton
X-Pm-Message-ID: b185a709d8000b884356272f6ce0d52cc88b22de
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
Changes in v2:
- Add .reg_pwm =3D IT87_REG_PWM and .num_temp_map =3D 4 to the it8607 entry=
,
  copied from it8603. v1 left them out, which would dereference a NULL
  reg_pwm on hwmon-next (reported by sashiko-bot, thank you).
- v1 had only been run-tested with the it87.c of 6.18. This version was
  built from hwmon-next and run on the NUC6i3SYB: all 87 sysfs attributes
  read without error, pwm2_enable and pwm2_auto_channels_temp written and
  restored, no oops.

v1: https://lore.kernel.org/all/179357707375.834227.595814448085536071@prot=
on.me/

Observation, no change needed: on this BIOS the registers 0x68-0x6d of
pwm2 read 81 4a 5c 59 06 02. With the newer-autopwm layout of it87
(base+0 fan off temperature, +1 start, +2 max, +3 start pwm, +4 slope,
+5 hysteresis) that is: fan off temperature -127 C (0x81, the lowest
value, so the fan is never switched off), start 74 C, max 92 C, start
pwm 89, slope 6, hysteresis 2. pwm2_auto_point1_temp therefore reads
-127000 and pwm2 reads 89, matching the registers.

Based on the hwmon-next branch of groeck/linux-staging.git (file contents
as of 2026-11-01). The Super I/O is found at 0x2e, chip ID 0x8607,
revision 2, hardware monitor at 0xa40; ACPI reserves that range, hence
ignore_resource_conflict=3D1. Is that acceptable, or would you prefer a DMI
quirk for the NUC6 boards?

 Documentation/hwmon/it87.rst | 16 +++++++++++++++-
 drivers/hwmon/Kconfig        |  4 ++--
 drivers/hwmon/it87.c         | 19 +++++++++++++++++--
 3 files changed, 34 insertions(+), 5 deletions(-)

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
index 2757d42..14800a5 100644
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
@@ -530,6 +532,16 @@ static const struct it87_devices it87_devices[] =3D {
 =09=09.num_temp_map =3D 6,
 =09=09.peci_mask =3D 0x07,
 =09},
+=09[it8607] =3D {
+=09=09.name =3D "it8607",
+=09=09.model =3D "IT8607E",
+=09=09.features =3D FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
+=09=09  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
+=09=09  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
+=09=09.reg_pwm =3D IT87_REG_PWM,
+=09=09.num_temp_map =3D 4,
+=09=09.peci_mask =3D 0x07,
+=09},
 =09[it8620] =3D {
 =09=09.name =3D "it8620",
 =09=09.model =3D "IT8620E",
@@ -2941,6 +2953,9 @@ static int __init it87_find(int sioaddr, unsigned sho=
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
@@ -3095,7 +3110,7 @@ static int __init it87_find(int sioaddr, unsigned sho=
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


