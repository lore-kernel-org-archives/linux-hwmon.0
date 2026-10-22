Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693373;
	b=t4+WA91+c9oAPSKI+RAHUVo+6pQveC8Tb/FZsX0OiuTDOQW9bjdFU55v/u4ozCZu9V8W
	 MHl7fB1UFuLyycUZmoH+5jz8Byq25xcGT1reg11MREkyuObHZf/9a0A9UN/wXGGg4XH2C
	 F0ZPCevCbFpEeoScidqXwsUp9lWgL0HGCv3MOEG9f17K8lZaZX/2PD5qQCWIm+jBvG6ww
	 xK7dP/J1whirLVUecVG64LFChBoL1ZBZVrWrgWg7kvwrAFO/iFziJXi6rK5X8xb2o6hoP
	 x6fZ737zD2tHTVxTrLPClXQoZPqeLzzwPFT218hw8bM8QS0WHtVKkE28to4rxU2c3+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693373;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=ulw2gPyw6Qaj9kAHXfalQwx/FC5JjOEfdqDXS7HO8mQ=;
	b=kuRzwtlIcUVnTUDPfOwLYvBdGWrYoJicJTrPJ7y1DqAwPRhKlh243Q5parCMY4Meh0XV
	 CQNGIF7GNTDL1ciyrA9PVo9adaKtbeFJ6hvY6YHtSqHwqOn4Iga4++w8Uaop8UCinN5D6
	 nMamP/prBeiYmeMHpAgdfswS1abtnubthJJBRRnj0/GxgRB5yZVRmAmrK7DxhhgLro0wb
	 k6z5uyDiCRdNM69QDydP5mosdZ5JPefNiHs6kSf+lvcRvyH9RTEWvbzHyXrUdA2Ag9j/u
	 twCAzI5ySDgy2sgnpDsd+4vL+JhHqTlSKYtrShbtx50ts1H/Can/Db2PYi5Qrhpx3qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=gXWhNTk1;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4003606A319
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 18:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4003606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=gXWhNTk1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792693370; x=1793298170; i=w_armin@gmx.de;
	bh=ulw2gPyw6Qaj9kAHXfalQwx/FC5JjOEfdqDXS7HO8mQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gXWhNTk1Yz9gYpeJPBjb3DhAOu+F4rRPrCQ0QbZ0h0O8NtKGMYJ3zycPVj4H0Tl7
	 Z5kVSvWHZQP1VyW7b6pkAwioBrVzC+JoeIA2olQGktQ26FJsMyCuWGe9j0+ObLKkd
	 Kd28sUX2lff5uztDnZrUq8wSebzW8vR0yP7R6K0Xy1VTIyKdK64UHM76XeNS6n+u7
	 0QjMWN9DAqIiGjs/9F2dDZCQqcvIHzHZ8tcVdO2OZnK80cLjXmULrCTmFHEAFY9Kl
	 eglX8y2t7F3K3SPjg6GTzWnqxQgIqW8B5d404xS8/ngmlA7EaDSzqri1EFh6+Uv6R
	 Y3KoEBHwVf5pGwfXBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCbB-1x6yym37E9-00X4M6; Thu, 22
 Oct 2026 20:22:49 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	serjo32.dev@gmail.com
Subject: [PATCH] hwmon: (dell-smm) Add Dell Pro Micro Plus QBM1250 to fan control whitelist
Date: Thu, 22 Oct 2026 20:22:16 +0200
Message-ID: <20261022182247.46381-1-W_Armin@gmx.de>
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
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p0RqJ2EJGmyioOtFTaQmku0o7egaW3R6rBbSAJHaNybD5aIJN/e
 h3EIZOl51/VntuCDHTyMUSUrelhYtbz5+AZZHqthAM95bGedYuYyMob4yDPq2dnoRhFveOo
 LLZ2Oxqtzim/I0dcliQyZVB1numi+fpcLgitwJSGwUqm5A1PrHSKznlmr+UDlsUSfn4Vs4P
 mEA/E5Hh0mhtbaUmr3jEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NHKR3QSWlhI=;At6nHlc7voFlhY+LHj/pnrRjPHi
 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

A user reported that the Dell Pro Micro Plus QBM1250 needs to be
whitelisted for the special SMM calls necessary for globally
enabling/disabling BIOS fan control.

Closes: https://github.com/Wer-Wolf/i8kutils/issues/20
Co-developed-by: Sergei <serjo32.dev@gmail.com>
Signed-off-by: Sergei <serjo32.dev@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
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

