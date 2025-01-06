Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994FB360
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 19:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736192874; cv=none; b=QKFrxoYhpaLPNrsp9/cq+mknGXrNXclZ33od9L6V37LeqzmFs4S/NniGyn70kHMZGBcgYTjHzPvHr0dtk1VJenMIkHa9T+yctOe8CgnxL3F0UzkZE4/8lfljwCtcZeu2KRMWiFYvTHNozwbtXLCW9yrNR9ppTXhRyIvnrrWNkDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736192874; c=relaxed/simple;
	bh=4z/iOFKzRHscSlAXKXjTz2SInAHOgzrzAkUJUCYM1DY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hlp33rxtYgCGFOOApqjn4p+loTDZAeMpTYfL/PX/z3NZeErmnQbeA21R8cuyGCCW9yXp240/vl+E02B/NeaVKjUW7iyBhYdT1DmcI2VU7qlpthQ9AtSHPmBZZ3CbARDCricw7/iDuP5ImmVLBk4BZSw/Mmlbq9SK8AOYZKTq0jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=IlI7JjQo; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="IlI7JjQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1736192856; x=1736452056;
	bh=zqEWQEsI83Yu4hV+bHnL4Mo39Wd+dVxHzPGnknu101g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=IlI7JjQo7fFqtFXj31aEeT7lrN8G3CP0fokS6DlYvi+kYHOd7VtDxXQK8ZjEfwkTl
	 T0IXc9dDMuiIcJuNa8Ds99cD613SEBIkwlmpu9LFj3IPGHFwAlb7kEWatGCUZGSqHT
	 kNl2p88nbA8PJUGhXRgvElS4koFBFmF6vGKsMbf2Y3l4nFFgYB73FKBGPwpCgmJmTO
	 IsmBXo6ZYrW4vOKsaDrXS26HvrzApnfoe4j0Hq9QywzdnQmcpwh7Gi//0M8i6rVYjC
	 VvOla7VCT7T5/YGxwwzJiJI3ljQQrr/9B4QxlvZX/Jjvx5GsWItbjCpATpsx9HWksK
	 7BAx4wPvPc3/Q==
Date: Mon, 06 Jan 2025 19:47:30 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: John <therealgraysky@proton.me>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>
Subject: [PATCH v2] hwmon: (nct6683) Add another customer ID for MSI
Message-ID: <KY1Lwa2kjE7V78ZKOvQv0IavCNAQXJMIL4LYAALEUI52yxCxzzucAifFH8Y1wRFUm38ZZsBvCM0poaJL6bIqnjS1tL1o9K-h_h5-JJAe2rk=@proton.me>
In-Reply-To: <zw2UJN123_RVNb7oaPDKfZjROMOGtEoLGZN9xK1Ha-p7Nqi-f2a682LoKaHhj498dDGqbuApHa5VYNWoB8GLlUhI4cAdj213hU95zEmzxPk=@proton.me>
References: <RHgpMv2vm9aouIOCtyVI2mjH9atCSSL2Zo7fO9QqQwapyOv1ATQhPQGgITlRHcXcEGY_PcyxUPmbXmbPlqCGyFgaEjhuPeaCGvWY4UdB1uA=@proton.me> <d6d10360-a2a4-4910-b3c3-80bf9d67383a@roeck-us.net> <zw2UJN123_RVNb7oaPDKfZjROMOGtEoLGZN9xK1Ha-p7Nqi-f2a682LoKaHhj498dDGqbuApHa5VYNWoB8GLlUhI4cAdj213hU95zEmzxPk=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 8652ff0bccde34b063f78733af7bc4b31d200e07
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Monday, January 6th, 2025 at 11:55 AM, Guenter Roeck linux@roeck-us.ne=
t wrote:

> > Please resend. The patch itself is almost ok, except I'd suggest to rep=
lace
> > "The value" with "The new customer ID" or similar in the patch descript=
ion.
> > Also, please define the customer ID as "0x20d" (no leading 0) to be in =
line
> > with the other MSI customer IDs.

Incorporated this change as well as reworded the commit message.

From 0d95ea92928715b0de029b801b8604c1fdb4f78c Mon Sep 17 00:00:00 2001
From: John Audia <therealgraysky@proton.me>
Date: Wed, 1 Jan 2025 08:27:59 -0500
Subject: [PATCH] hwmon: (nct6683) Add another customer ID for MSI
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The new customer ID was found on a MPG X870E CARBON WIFI (MS-7E49) with
a NCT6687D chip.

For reference, sample output of sensors with this commit applied. Note-
the value of -40.0 for Thermistor 0 is to be expected as I do not have
a probe connected to that sensor.

nct6687-isa-0a20
Adapter: ISA adapter
VIN0:               1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN1:               1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN2:               1.30 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN3:             672.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)
VIN4:             704.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)
VIN5:               2.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN6:             448.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)
VIN7:               1.50 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VCC:                3.26 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VSB:                3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)
AVSB:               3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VTT:                2.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VBAT:               3.22 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VREF:               1.79 V  (min =3D  +0.00 V, max =3D  +0.00 V)
fan1:              635 RPM  (min =3D    0 RPM)
fan2:              647 RPM  (min =3D    0 RPM)
fan3:                0 RPM  (min =3D    0 RPM)
fan4:                0 RPM  (min =3D    0 RPM)
fan12:               0 RPM  (min =3D    0 RPM)
fan13:               0 RPM  (min =3D    0 RPM)
fan14:               0 RPM  (min =3D    0 RPM)
fan15:               0 RPM  (min =3D    0 RPM)
fan16:               0 RPM  (min =3D    0 RPM)
AMD TSI Addr 98h:  +45.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D AMD AMDSI
Diode 0 (curr):    +52.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermal dio=
de
Thermistor 15:     +47.5=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=
=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermistor
SMBus 0:           +53.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)
SMBus 1:           +52.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)
Thermistor 0:      -40.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermistor
Thermistor 15:     +47.5=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=
=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermistor
intrusion0:       ALARM
beep_enable:      disabled

Signed-off-by: John Audia <thereadgraysky@proton.me>
---
V1 -> V2: Leading 0 removed from customer ID, commit msg changed

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
index f71615e06a8f..288f497d364a 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -175,6 +175,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_MSI=09=090x201
 #define NCT6683_CUSTOMER_ID_MSI2=090x200
 #define NCT6683_CUSTOMER_ID_MSI3=090x207
+#define NCT6683_CUSTOMER_ID_MSI4=090x20d
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



