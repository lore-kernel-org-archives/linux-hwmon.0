Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792814277;
	b=a9UTXzupUwI9ElLW+Jmtccdx4RwF23IWS7pjH95GLAjwB3qn9cVrAIddjomQ5zExBlhS
	 RHwQgNxXxDDM9yFamE+GFRH+eWJjKeJn4pDl9hQ6wAZ77n/SqkAJSl6+Go07ESdzz4n/h
	 hqHJu6tox3WRk5r58yfFjDSzhfS+Wn4rPE2osD/LpkwlbmrGVPuUDjgneqTdrKsd+Wdb6
	 vuGe1C3C6YPPmASVL1NXLPjQrttCRMpMBXPglSymEPAArCqxKY4IFn1wfnVnZLCV10pMy
	 ve4P18ATLe9fylgN/sxWU9Xeok4xr0CuJ7GCOb5435wiCIT5UO8JwPj+B4DskSfXbeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792814277;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=SAcMbACoc6N0hOX1PzD4I4M13f5vgvVcfNRU4wFjLS8=;
	b=KvGooUWf5xTM4lg07/TrFZqXzx/ecVc6JVvjGLKJGpE1Hci8PFVflO3c+HDwmCg35Qap
	 93uPnVsZ7vEnGvi6L3aZttqTG2ZFJgRIZoGu73+ODA+69TqsAhDqPwoovgCQXV/EQSojC
	 UoGhWD95lIOdaOIP0GWIwwve2Vje7595DayxlLRzqk7+jDnZrHC1CX+oobgyEatyJBCut
	 wqpdoPtBp0c2VtSdnv/j4vKP/4JWyMNtpF0DtSnG2XZA9ANyXikvJTsxP7MHRAWf7n8Cp
	 jGtx/taABKHb4b4ArxVwyaJNrhyqAK7D/dsnUSGnjg/P1VPyxwGwF3qoG6+FU48sFeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=lKskCqr6;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6A606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 03:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E6A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=lKskCqr6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792814258; x=1793419058; i=w_armin@gmx.de;
	bh=SAcMbACoc6N0hOX1PzD4I4M13f5vgvVcfNRU4wFjLS8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lKskCqr6AIRJIoqbd4xkBZ+hidpEpq57VyIJOA0qwcaZQul6fE/kb4N10HMSAW2Y
	 WqdO3FAYtf9JAvMe9MKY4zciY0+X1J/d4J9sTaMGuqY3lUw0wYNNuup2qDnavrcsp
	 mrHgnDu+5CRHPISrlYTVrpovpUXfLIaegOV93S4EMMcaKjEl3q/b8yJVJxaPf8Gu0
	 wNh61UvMVJhoAmuNXS3ozpK7Aj0iXFb7pI4GeorWJyqbDKbrX5oRIXI43vTkWODUZ
	 KaQ+c6McSLMcUjX6pMtcVbo0oGhX44xX82rusU4Ya7gtSuFD/i0XEaXwb08ydQ+21
	 7Apuwad1ZyvUW/wLAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1xByZn09Pl-00QAnM; Sat, 24
 Oct 2026 05:57:38 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	serjo32.games@gmail.com
Subject: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Micro Plus QBM1250 to fan control whitelist
Date: Sat, 24 Oct 2026 05:56:45 +0200
Message-ID: <20261024035735.6810-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MiFwZGaoPk4rDNlWPANzJATzwMYDjimEho/MzLKPeL0/3y6QX4T
 LGFINh7O5s+1vQJGF2iL1pe/ue+rFzntu1Ugpk2as0NAHZcMKTWH+gjr4YtblXBrYUE89rj
 cNah7tv0dMAFZ53S7J6YX11n7ir1ew8cseM6MgGttES5KZ7mF5oG/iL9lIA9ideQ6NWZ5vB
 J0kgmT0ZuIIy1HAzBRfWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EoWXjV7UTxU=;esMOU2UCxCBzOcvHA3knJNLsK7J
 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

A user reported that the Dell Pro Micro Plus QBM1250 needs to be
whitelisted for the special SMM calls necessary for globally
enabling/disabling BIOS fan control.

Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
Closes: https://github.com/Wer-Wolf/i8kutils/issues/20
Co-developed-by: Sergei <serjo32.games@gmail.com>
Signed-off-by: Sergei <serjo32.games@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v1:
- correct email address
- add Acked-by tag
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 88837f028405..43587f98201f 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1615,6 +1615,14 @@ static const struct dmi_system_id i8k_whitelist_fan=
_control[] __initconst =3D {
 		},
 		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
 	},
+	{
+		.ident =3D "Dell Pro Micro Plus QBM1250",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Micro Plus QBM1250"),
+		},
+		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident =3D "Dell XPS 13 7390",
 		.matches =3D {
=2D-=20
2.56.0

