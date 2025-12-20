Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92DD1EA7CC;
	Sat, 20 Dec 2025 17:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766251867; cv=none; b=m/9lqadky9yCzED4MTpj2bAM7Ijc84z4vqi5iAw/fC0FuesuA3nRJfAje6Ktn9qxLnBMA3E8ffBhEpfrt9u/7HiZSHEQwViLDxW2GS1jy8DFWtY/RJ2xt0t5NT+itbFEKUQ8fUShVDMaavjR84InlezyO9MAGhW6NhGIFOqIVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766251867; c=relaxed/simple;
	bh=3FuoFm5I1joEUtasiBG89v9BLsNGpZrdwlpu5D/oW8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DPNx/L88gp2DIVHPaRiOvaQo9uSzYvRdHQLyflA3TsgCAb2lrIVAyhSleh0lVTRuH7k6SUG2o0rocYVwfAnYnUyL9tJOgZ8j+B3aspmwSFrt+j6kbesa7Ur87VqIeA1hicz8vr39ojITIAJu56AoKZ6FMB6RXOe5t6yQdx+wWB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=szymonwilczek@gmx.com header.b=cx51/ni2; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=szymonwilczek@gmx.com header.b="cx51/ni2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1766251860; x=1766856660; i=szymonwilczek@gmx.com;
	bh=hOY6EQU4IqObDYewnUN60Zouw5X/M07tP7CbOvUC6JE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cx51/ni2mQAmD58B2lWs9K61zc65KLylERPhDXbtvElkyOWPdSfIA6OF/8NbWBxB
	 0OqCcdIhywL+VoaCcSq4nNBB1qFZgv1h70bhrNxnqkOpcvgZPiHvG4HMsozH1IkjA
	 URxGEiDMbHDKbXNxEcfavMgTEqCyevDKxni7GMgD0SwKQ6RTXlms9PIt4QcPPzIb4
	 /97V/Wtmsov9kfxJOM8L8uM52uKuO8YQI4xxnJDUrx/EKM7Y56VUcVdL2tqkxlAao
	 DhVrjS9r7feXtL7PDF54R9UlVqc/3kyx1yFOQSKwoEEKhFkrw+q78aZk5iSa2Z9z/
	 sIdkb+3A4HYiftBgCw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from prometheus ([85.11.110.37]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MDhhN-1veT3L1sYR-00HJxY; Sat, 20
 Dec 2025 18:31:00 +0100
From: Szymon Wilczek <szymonwilczek@gmx.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Szymon Wilczek <szymonwilczek@gmx.com>
Subject: [PATCH] hwmon: (acpi_power_meter) Replace deprecated strcpy() with strscpy()
Date: Sat, 20 Dec 2025 18:30:41 +0100
Message-ID: <20251220173041.377376-1-szymonwilczek@gmx.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1oZWkYNwfmxw/k2lq9USpcMkzu+T+/odRVGSegn1oPcmggChEuQ
 6GMjk/7u69N2TI2T8nLZ5ivVpdrRv4XdTx9KMGBzBG7JUjFjGhN4cg4c0DxP07tfisLmXZe
 ObVTwbenwMDgkGkYYuZ3FybRE7i/Lr1JdcSMj+RUc17VcepJo/0ELKoPY2jyLN/kOLki1up
 jLFppFXqVCuTRc6YsQgKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6R0mibB4c7c=;av8qNwZ3Pl1cJA3aQNXHPmJfOVv
 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

strcpy() performs no bounds checking on the destination buffer, which
could result in linear overflows beyond the end of the buffer. Although
the source strings here are compile-time constants that fit within the
destination buffers, using strscpy() is the preferred approach as it
provides bounds checking and aligns with the kernel's deprecated API
guidelines.

This change converts the remaining strcpy() calls to strscpy(), matching
the pattern already used throughout other ACPI drivers in
drivers/acpi/*.c.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcp=
y
Signed-off-by: Szymon Wilczek <szymonwilczek@gmx.com>
=2D--
 drivers/hwmon/acpi_power_meter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_m=
eter.c
index 29ccdc2fb7ff..cfb30c68bfc5 100644
=2D-- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -890,8 +890,8 @@ static int acpi_power_meter_add(struct acpi_device *de=
vice)
 	resource->sensors_valid =3D 0;
 	resource->acpi_dev =3D device;
 	mutex_init(&resource->lock);
-	strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
-	strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
+	strscpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
+	strscpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
 	device->driver_data =3D resource;
=20
 #if IS_REACHABLE(CONFIG_ACPI_IPMI)
=2D-=20
2.52.0

