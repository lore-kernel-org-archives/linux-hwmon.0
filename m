Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21049B1E5;
	Tue,  1 Sep 2026 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286739; cv=none; b=L9I2b3oEIUmnODiejC6a/+64lQ4961HJJCr4khy+/F93O2/5qpEFG3PyyDOZECt204bIylf4kYYUrmySsk74DTeeTK4zFhLCxpsFHlpe3svh7T0R8oCEXl5zHWxdkyvthWvJwl0SJ3FhrXm4Ket0O+utSrAhQ38BctA7wmmhkPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286739; c=relaxed/simple;
	bh=DNco2ICg4NV9rZWd2PDYkM0AQiFnURbY4FNvV4VpiGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QlIpQZqBtrGj4F+ekK65gtHOKL4QfCpNisbPgO5sqOHVRHV9ZCZUqMexlDIMH852+iC62wt3ZiqFdBRogV+tSsp2RpkAob28LFLCh2rXWIbcqol/EVXHTc2YlEbGlJbULq+Fg8nGZN4Z7c3bcRjQxYAqnFq9/hkXYqMxV0bK91c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CT3F387P; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CT3F387P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788286731; x=1788891531; i=w_armin@gmx.de;
	bh=D49GBNUQwLG5MAdBApq4IGtOa/L7iVeDgdf6lK39i3s=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CT3F387P9ittrJ7io5+c4d/wohgFf36ptxuQmaJu0sNY+Loiqih/2BlAfr/av+9l
	 ICV22Dv4H809EfUYWGrBCnDvLOijDNfn7j6+pOC2H+XkDdum1RqEqGGP0xaE5XzGI
	 JdxIpEyK608jmYCbQ2lVZzAOB2oUFK10N34iD1W7RK5VqyYnbHlhfkOTqUo6+WDTA
	 YEhP0StMkfsVvdMXmtTpRFq5W7xMBLK5YpCq/gK6BH7dyF+4+zLEDpv9vcv73A4bi
	 btuVHuar6KR+6D2p68eNYboqPAgz2ZqoR8MFv+ujwYXNMyZ1p67FWTI/iiNT3v/JR
	 mnCG/JZM2xS+fpbDQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsJ5-1wi8y42eoR-00xWTd; Tue, 01
 Sep 2026 20:18:51 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pp12313124124@gmail.com
Subject: [PATCH 1/2] hwmon: (dell-smm) Add Dell OptiPlex 7090 to fan control whitelist
Date: Tue,  1 Sep 2026 20:18:48 +0200
Message-Id: <20260901181849.241776-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yzGVP54ECpodXRpS1u1rBZFBFUjk3Ya+x9jkmWSLy7MUDEw+ybT
 +W2rCIj1jb4WkcsV8Xyf+wo9xzEdFE2zZ2L88j3qIfKm8BKOyWQSbgztmhpKlDoZf+Q+fkY
 qnfnh0f2d31D0C6lviwlgTBcLyfNJplzOWYvItfJyngWPdsOL/mv9zaILQN5Qm2mHHe03Lh
 x+QIW1GUWWxzhpDzRrY3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TPgwxdgvM5c=;6pxBUSlqXG7db//8dppa6epHbrG
 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

A user reported that the Dell OptiPlex 7090 needs to be whitelisted
for the special SMM calls necessary for globally enabling/disabling
BIOS fan control.

Closes: https://github.com/Wer-Wolf/i8kutils/issues/18
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 20920d4bd81e..a3aa398a9f8f 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1631,6 +1631,14 @@ static const struct dmi_system_id i8k_whitelist_fan=
_control[] __initconst =3D {
 		},
 		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
 	},
+	{
+		.ident =3D "Dell Optiplex 7090",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7090"),
+		},
+		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident =3D "Dell XPS 9315",
 		.matches =3D {
=2D-=20
2.39.5

