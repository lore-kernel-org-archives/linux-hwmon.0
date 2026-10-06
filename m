Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21283388E62;
	Tue,  6 Oct 2026 23:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330385; cv=none; b=SBk904MbBCb/wLRDGe5eE6OeDxypjChelcEDZlgukKb7oWFwauL2Kp1z8ICePAdDUu5JkSEJlDt+CSbQTN9RgUDVKlZugrsmcweJXIYe6PB6E5h07jXjJzXVRQ8WJqZFk4RQY2i3Q4co1gHMB6YQenbCqvpS0ONtJhxsibQX2gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330385; c=relaxed/simple;
	bh=1OP0OgkWmKSX4BtFs9jVHdK0NtzarrL0f/p7aaxffrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uKtmIIVYLdXq/VeU5w02KFSlw/0JJmOBHhmYweJDFcwAVJzNT9M+FSpaAFGwgp+2KPYVKOhpRUYucY8en6lDRbzTeU1Bh2trR5cyTj2vjEpsgQMIBvqUSt8sF3Ni/jbz2nOTAi1gmPKyW4jG4PetJjEAG71uAu3+j7k+5fgLBsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dZHMqG58; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dZHMqG58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791330381; x=1791935181; i=w_armin@gmx.de;
	bh=pznSaLbPKP/qcsrCL1k2+sgeecwsCyanztX2F0vRPOA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dZHMqG58q/kAJa0B93kdzwT8ZBlhGM7oBHx0I4/sMjtvxK3R6Ccmeepf8PcahucW
	 8fml4U05e43YQH1umJrD5ZghH1LpugoDjUFD/Oobe1fzhxx0lMjNnAFdb33heXUzo
	 IfaFJtAf63cpJGyu4o4qiFJ4vEH54YeqD3BI5BWRiorg08cXQ6z1g4eje5VncFj+J
	 2M92wYwM/FAfZwLuJpGPKGVE0TgU2dSU3t2hqYhCkgrHJMe/ExYIkalXCjr4pgM7i
	 KlG5GLn7ZRAYUbMzhWmXhUQF86BqdhagcndaAENFyxk+JlT3Xm141LgsSedGI4HW0
	 byO5C5/442eqpCCAkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsjH-1wxWvB44UP-00J06I; Wed, 07
 Oct 2026 01:46:21 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: linux@roeck-us.net
Cc: github@firefishy.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (acpi_power_meter) Fix 18.45 TW bug
Date: Wed,  7 Oct 2026 01:45:34 +0200
Message-ID: <20261006234618.10943-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1LiTOeGPcS+/aIAjAMnPSQ5c2/qUo71/SqxPnly8xQmuGcTMOTE
 FkyN0k3VfXapoCK6i2qODWeW4jHcHY5I6rf6CrN8Xz7X+JAM6ZAhC4GFGXnxRbF+h91XOxo
 rgHSKOb0+E7Wyb4c9xGAM3avhLK2lJIdt6sr/zOh8TMvzvBvy98KLmMyUtP56PitPmtzNU1
 yIXjSxj17SRiVA6ftBPlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0KoN/O7zCy4=;wixFtgex3PlDcrvsKJ/Qm0DPX3/
 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
 k6SP

The ACPI specification says:

"If an error occurs while obtaining the meter reading or if the value
is not available then an Integer with all bits set is returned"

This integer can also be 64-bit wide on ACPI 2.0 and later systems,
so we have to check for that too.

Compile-tested only.

Reported-by: Grant Slater <github@firefishy.com>
Closes: https://github.com/lm-sensors/lm-sensors/issues/460
Fixes: 1fefca6c57fb ("hwmon: (acpi_power_meter) Fix 4.29 MW bug")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/acpi_power_meter.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_m=
eter.c
index d8e871509405..3891962f03db 100644
=2D-- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -10,6 +10,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/jiffies.h>
+#include <linux/limits.h>
 #include <linux/mutex.h>
 #include <linux/dmi.h>
 #include <linux/slab.h>
@@ -30,7 +31,12 @@
 #define POWER_METER_CAN_NOTIFY	(1 << 3)
 #define POWER_METER_IS_BATTERY	(1 << 8)
 #define UNKNOWN_HYSTERESIS	0xFFFFFFFF
-#define UNKNOWN_POWER		0xFFFFFFFF
+/*
+ * ACPI integers can either be 32-bit or 64-bit wide, so
+ * we have to check for both values.
+ */
+#define UNKNOWN_POWER_32	U32_MAX
+#define UNKNOWN_POWER_64	U64_MAX
=20
 #define METER_NOTIFY_CONFIG	0x80
 #define METER_NOTIFY_TRIP	0x81
@@ -452,7 +458,7 @@ static int power_meter_read(struct device *dev, enum h=
wmon_sensor_types type,
 		ret =3D update_meter(res);
 		if (ret)
 			return ret;
-		if (res->power =3D=3D UNKNOWN_POWER)
+		if (res->power =3D=3D UNKNOWN_POWER_32 || res->power =3D=3D UNKNOWN_POW=
ER_64)
 			return -ENODATA;
 		*val =3D res->power * 1000;
 		break;
=2D-=20
2.55.0

