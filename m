Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4E4963C8;
	Tue,  1 Sep 2026 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286736; cv=none; b=nKF4Xl6sgx2w2TxU6fNTpIoHnHiR+/G0bCPHB/9nsmr/kbjV1JN8u3Z5drf3baDXJU+wBllv/JjDZGEhlWRng06xG0l5xDqEsSfX1/wrt9RDLfgmzqUm1gliXRLloWh3pU5HN5AHscMNOG/ECb41UH4/JTeMY1jKRmpywh3rbiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286736; c=relaxed/simple;
	bh=zwO9XqbT0TZxY3t1rkN6NEAPNkiE7ic9fnQx1jSs8Gc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSBxM0Okeq0VD67eNJjyVfzg3Zcs+D/fQ7+H0w8my4/GpK3JNVh+u0RD0h7n4tW/4YRqRCToJ35rq+egCNm6xUZjjyNJtKI1fBMdAuGbOggYzmVN35VCYslu0a0jRy++KIVUiTWWq3NMmbr0iipxvB6mkkKnAnuqBXlx1eDeI3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CG+GBDcQ; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CG+GBDcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788286732; x=1788891532; i=w_armin@gmx.de;
	bh=eys8WrdxRmX5fSNisepTAlOO7qnzDb+uw/fLgOxnqqw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CG+GBDcQHGx80GE2ZS+SbYYpImfIG2yyatjRCQJ7Jcyn+QvU1/Bq1xDPhYGuLI0B
	 If1ISPgHg19NeVB8LrMJiXiiQ8vHdVJySgGejoXy+u0SuG47r98seIARegLkgbP/x
	 RW9mTII4NEMS79CcylwwfnDi+VII80bItDFDTuqbf2CY/1GlXLJKscsp6+e593EEP
	 IqXT90WGWwfF/WP8P05d6JF/lT0QvU61W2A1EC42CurwfZg7Pm87p6bCuJn867vU3
	 QMV5uCUpBrwZmPOgLsGh/QvGFivpeqosF+cPNEi1+B8bFSxMqLaLwNHjuPL8eboWI
	 JkHsy4jYJC1LSa72/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1xRh4H1DHN-00Ys5z; Tue, 01
 Sep 2026 20:18:52 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pp12313124124@gmail.com
Subject: [PATCH 2/2] hwmon: (dell-smm) Add Latitude 5420 to fan control whitelist
Date: Tue,  1 Sep 2026 20:18:49 +0200
Message-Id: <20260901181849.241776-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260901181849.241776-1-W_Armin@gmx.de>
References: <20260901181849.241776-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x1zOcJrZCsTXE1wd7w+FfoacSbhi+ASdCuvVIRyvZVCcECcaZII
 9f5kNidLxokoHO13E9CA8OaS2ok6aZrlKIW9TOzUYYT9pueOmN58+EtYDGj7MF8Avgpce7x
 5Q7+TeOG1KSSY3mK5dkGymUIMZ1wN3AlpyEjvYG0dttQxRY1Qowi+jnzS2jyvxetykHyV+x
 DYfuMmiaQTy7xNZGNLd8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+QmmVgZptoU=;iz3iSxMXP4kmeDad7op2iySaLFP
 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

A user reported that the Dell Latitude 5420 needs to be whitelisted
for the special SMM calls necessary for globally enabling/disabling
BIOS fan control.

Reported-by: pp12313124124@gmail.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221935
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index a3aa398a9f8f..7ed94a3db621 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1543,6 +1543,14 @@ static const struct dmi_system_id i8k_whitelist_fan=
_control[] __initconst =3D {
 		},
 		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
 	},
+	{
+		.ident =3D "Dell Latitude 5420",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5420"),
+		},
+		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident =3D "Dell Latitude 5480",
 		.matches =3D {
=2D-=20
2.39.5

