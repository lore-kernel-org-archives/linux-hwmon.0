Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EFF1773A
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Jan 2025 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735744565; cv=none; b=SG8irnrE9Z0VujioO/3hCXlHaFifKW9EoCs0Y1Tl5xdu/fCbAZgc8bRq3RN2nUTfC6xiOHF+Unu+j6nXz2yCSEiDzTDI+lrSrt+mGFaWKR697NTUEbHIUqFh+/jkHncPs2UeLu2hNI9LdcBw06apoCeRLDQAqzQnUlNYysz2DfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735744565; c=relaxed/simple;
	bh=72IojgcsGtU0CAUr5WHgi6Rq/E7op1UMqw3T7dLVnMo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=end/Fnips8xwsIx8BZNIiJX/P4k0yoL1KmON00nawUkr7svMYZvtJ9ySpuNzo1kWBqdIKwK9zEmWrWnfaU30UPF1KONRvC2ySzdF2WY3oWap/zruCkl7B54inwiuccdYJ6rS+RG133pK6MyJhnAWzpS8AWKPFOthT74KuY38os8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=O0nUl/Vx; arc=none smtp.client-ip=79.135.106.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="O0nUl/Vx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735744554; x=1736003754;
	bh=I1jC9dL2SEZoyQRuVu3XNEQMZRCtaaV1EXd4wZaGMow=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=O0nUl/VxVcPMamqZ1xgtbx+1unn6xoQ4qLGGAVSexKEdmyE/OnQD3TlbQF6xx91ff
	 hB6hbQX6SZCweMRdr7QDAZ9XUJG/lp6LqC68gUQSgowUCW5Ep+way92HWwUbdTCikT
	 eFVI0W4fCvkqun/KWvjjRLGlvoxiJE8Czt00MD5uezVT7lXG/sNGhqf+97Ahkk/GDQ
	 FJCxxbHIBik8OX0jFq+blCRt4fpCEBNDCz+fE3iivOTCb77/ZudC8/4+Gf7ByHHFu+
	 9XZSSIOiDD5gBTqQT8zpywkpPzgYg1w1DM7Qd2X7VjVdbaphjGr9omo4J60ie0CC2g
	 KTU/kJzxtRAAg==
Date: Wed, 01 Jan 2025 15:15:48 +0000
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From: John <therealgraysky@proton.me>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nct6683) Add another customer ID for MSI
Message-ID: <J6wtEBUs2mxxQ-ukKB5Ql6WHZfim5gKZZ6wxrLXYirJd7vTPBdeNRslkl3EXf4ufG8SHdfrDz_gkuWkllDo3oRHZMG5ohbzCSHnzPlGyH-E=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 2e10b938bf65dcd72101a9f702a29fe0a6a6e98c
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This value was found on an MSI MPG X870E CARBON WIFI (MS-7E49) with an NCT6=
687D chip.

I do not know why one of the sensors it reads gets reported at -40.0 howeve=
r. Calling sensors multiple times shows that -40.0 value seems to bounce ar=
ound from "Thermistor 0" and "Chipset B."

Feedback is appreciated.

For reference, I attached a sample output of sensors for the new chip with =
this patch applied:=20

nct6687-isa-0a20
Adapter: ISA adapter
VIN0:               1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN1:               1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN2:               1.30 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN3:             672.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)
VIN4:               1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN5:               2.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN6:             464.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)
VIN7:               1.52 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VCC:                3.28 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VSB:                3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)
AVSB:               3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VTT:                2.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VBAT:               3.18 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VREF:               1.79 V  (min =3D  +0.00 V, max =3D  +0.00 V)
fan1:              747 RPM  (min =3D    0 RPM)
fan2:              745 RPM  (min =3D    0 RPM)
fan3:                0 RPM  (min =3D    0 RPM)
fan4:                0 RPM  (min =3D    0 RPM)
fan12:               0 RPM  (min =3D    0 RPM)
fan13:               0 RPM  (min =3D    0 RPM)
fan14:               0 RPM  (min =3D    0 RPM)
fan15:               0 RPM  (min =3D    0 RPM)
fan16:               0 RPM  (min =3D    0 RPM)
AMD TSI Addr 98h:  +49.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D AMD AMDSI
Diode 0 (curr):    +56.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermal dio=
de
Thermistor 15:     +52.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=
=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermistor
SMBus 0:           +56.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)
SMBus 1:           +56.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)
Thermistor 0:      -40.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermistor
Thermistor 15:     +52.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=
=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermistor
intrusion0:       ALARM
beep_enable:      disabled

Signed-off-by: John Audia <therealgraysky@proton.me>
---
 Documentation/hwmon/nct6683.rst | 1 +
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.=
rst
index 2a7a78eb1b46..2302b1ac95b1 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -65,4 +65,5 @@ ASRock X570=09NCT6683D EC firmware version 1.0 build 06/2=
8/19
 ASRock X670E=09NCT6686D EC firmware version 1.0 build 05/19/22
 MSI B550=09NCT6687D EC firmware version 1.0 build 05/07/20
 MSI X670-P=09NCT6687D EC firmware version 0.0 build 09/27/22
+MSI X870E=09NCT6687D EC firmware version 0.0 build 11/13/24
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index f71615e06a8f..e1f2736ee3d2 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -175,6 +175,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_MSI=09=090x201
 #define NCT6683_CUSTOMER_ID_MSI2=090x200
 #define NCT6683_CUSTOMER_ID_MSI3=090x207
+#define NCT6683_CUSTOMER_ID_MSI4=090x020d
 #define NCT6683_CUSTOMER_ID_ASROCK=09=090xe2c
 #define NCT6683_CUSTOMER_ID_ASROCK2=090xe1b
 #define NCT6683_CUSTOMER_ID_ASROCK3=090x1631
@@ -1227,6 +1228,8 @@ static int nct6683_probe(struct platform_device *pdev=
)
 =09=09break;
 =09case NCT6683_CUSTOMER_ID_MSI3:
 =09=09break;
+=09case NCT6683_CUSTOMER_ID_MSI4:
+=09=09break;
 =09case NCT6683_CUSTOMER_ID_ASROCK:
 =09=09break;
 =09case NCT6683_CUSTOMER_ID_ASROCK2:
--=20
2.47.1


