Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757325;
	b=0Kt2+sEVVLiD08sVfPaWilP+YqobQHYwzuJlxTcZ2NE6TGCaDFO0VC+hl2WMHFKO4vx+
	 b4ArbYnj6I6m7WougmjZDzbCojdaz8mutQm3UVVgpCmTPIqq7BrOtfPz/Qsbkmbzw+vdu
	 MRDmcbwCp+/1b4DFB32X8q0U+bWWJQCyPYSnGar3+Ah898l98ag+0RcEJetyUsdCaw4pt
	 379VrrQKaw+WwYo3qCzQLYZe3G1j6xjIHV0oEdj3sybWNr0XZBu+ZQumAFzWsPpbRguQj
	 yyporf8W+0BpDkh/gie97/+iyLXCp8Ey1ggUWMd7EaEwV62vniPfNWXpfngiX5BTHzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=opzL0+bRRsAW8Xh4G3H8xnm+Ixjopiv/vK7BY1qrbqQ=;
	b=EP0Oiu3n7/ZEjA7HnlCTvN6d8WLSBxCsEmgAp+it7fAUV92Uo/OF4MYI/ww3xNboS2Do
	 6tJXGFK0WSaEhhV6SeDCbbMxvwgGzr6MEGHPB4wh8Fp7tgJ+NVj2zKVvnBHmD/KrFB3qj
	 /Fpc39BJdx5e7DctHlrbQ9mtTOI5HF+KZEBBhfq1BHZFRI73IoKpwumVIB1yEn4+kg6iM
	 sFdc3QwHmclAUr0Asqf2RRcGXU+/TU0ydpfCgST7wn2MXKiF6pCbHXVgXAqHnEtuTx2y2
	 P6qrW1spuVqSnpbpNd/hpdjuqY0Vpak+OcsMTtlVbGLxDTTloXxZ43tN6Vxd1xfEepg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HHgO6koW;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85081606A332
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 05:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85081606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HHgO6koW
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso94731615e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 21:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757324; x=1796362124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opzL0+bRRsAW8Xh4G3H8xnm+Ixjopiv/vK7BY1qrbqQ=;
        b=HHgO6koWLqKZU69ZnIAuEI/7eGgwnrCAMSgfu/6jJ+veq6GJciQpLSgfidJ3MlEJg2
         hpthz16QBOsI0yUYdEidEymh2v36F34oL5DUPvGkd4DNjmSiWVwiYARl2UnJ9RIrj+VB
         lEutaUf2f9+UyO7Z1H9Sfw9a07jtvmhOGowPtTdTN59v+osNGvJNc/y2kxQVf4pBVp90
         ksv7PyCHZdjrFPHk8ayjRQnRdYoYY7CYS5ey8FtsdpvbQdrINLsaigHKzB+CLVnPlkG3
         audc9SuS2rxsxiGgP0w5lTWRAUcq7A61axhy31O6kgh0FZNe1VJbCxe5CChTnobzesyJ
         VNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757324; x=1796362124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=opzL0+bRRsAW8Xh4G3H8xnm+Ixjopiv/vK7BY1qrbqQ=;
        b=nWKj5my+yCVGnsv8gs7HXMaCCCHE2BzHjMVdUk0AFnp68dBtklCIlRM5QDJuiucS3z
         hABBWtxID2nS5/891QqbSKBYDr003VedAWT9vVcQkhfXO6nRTbU9rWyx+uq98A0vfNvm
         sgHAl6fd37TNJrx+e/nsnBYRsGpC5wlJO/7RtjnVRdEceYf1tYbXNfo4hokqkgmLolzb
         kPFS7KbCF6U7m/SjuL1/vrXnBxC4hg8uKy+mIeLdJ4Z031HnWPRmp/r38ipQ2dy0jzSx
         Dufkqs5KNu8zsMd/ecgYtEAzGsV/mTHd+kUw+hODHxIE6iSR+BmYskZYwLvlC9mTAL1A
         sqPQ==
X-Gm-Message-State: APuU4Z95zlEV498Dse868iFs65zWAMD1UwAwUnaX/u6LqskdlyL/M0VR
	bIQbCOcy3Jhou9j5/8Fvghd6m4MyPIrziaiPhaCuM2pPnXElPWOa+JZtNXMxwzYZiA4=
X-Gm-Gg: AZFdTZfOx/H7sPlWInev1ZmXYslDXUefZewnFmK3e5KqptLSEVwpNjyQHJvZsnmmgRC
	uSbxD0Nm6udvY6Ey7VJ6hwSiE+GowB8TAkMfpi1Ems4FFZoYzeYvgakot3nfDOmSfHCH1wXyyCb
	3d1VWAwwzvo01Iy25ILs3YZ0FqcHdAhun80Bf5e2XI0iMcQG4UWEpvZDVG7Yn+md26wgaQMQGb9
	NXK/mBoiMKqPcr/J9vCnrsZ580Cmh+yiAcz6r5ANe45z54mYynh2XGhysWWWCpcaayW5YQ3kxYW
	tdMUIF3VspJZJuJzFSX/ar2WjWXw4qMKBfs2l/StLtUtc6zLuKDQXe8obXZz+3LJeT/q3AZnJ3i
	/a8npB811l6GSkD7BV0/2xIHaV0s8Ghyc9Y2yILg+kuQlEAGvXFV9nqD/E36xF61lg2FqYnVePH
	NygvNOnfMO4RA/vJpYTfklny895CZaICTZlBuqOz9cy8rqSWuVeoJTisFRZXkZRuO/nbNTwhQoW
	hml2mrDIcMbF1xwHnnv7w7T8m9b1rieM3fY0M20QE4eCvTI6dj4MjPJi54DF7rpnSHxY6RAl+r0
	HAGvJFzI7m+TJKcg9YDPKlvjSGqi26h+XcLP9qP0arfgHqlNI9bEMgL5Rs5p6sx6x+YUtHbUYN5
	zT5jtHvV4/ww4NCrRYSQ5f3WV7anXY76y/V3rYBuc4b7lnw67wcZh36e+EM/VC2fMJ+wdjy7vCJ
	IITAEJGkJPc+JFo6AzDB8Z+F2YTBK/PsaVVD6xpOwsWjb/uNKrJTmCg83R6fb/tJ8=
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr472596405e9.25.1795757323826;
        Thu, 26 Nov 2026 21:28:43 -0800 (PST)
Received: from sergio-82n7.homenet.telecomitalia.it ([95.236.10.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm649073745e9.1.2026.11.26.21.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:28:43 -0800 (PST)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (yogafan) Support more than two fans and add 3rd fan for Legion Pro 7 16AFR10H
Date: Fri, 27 Nov 2026 06:28:40 +0100
Message-ID: <20261127052841.492895-2-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127052841.492895-1-sergiomelas@gmail.com>
References: <20261127052841.492895-1-sergiomelas@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand struct yogafan_config.paths from 2 entries to MAX_FANS (8) so
laptops with more than two fans can be configured, matching struct
yoga_fan_data.

Update the Lenovo Legion Pro 7 16AFR10H (83RU) configuration to include
its third 8-bit tachometer field (\_SB.PCI0.LPC0.EC0.FASF, EC offset 0x04)
and update Documentation/hwmon/yogafan.rst accordingly.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
 Documentation/hwmon/yogafan.rst |  2 ++
 drivers/hwmon/yogafan.c         | 12 ++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 239c7b576..c30cd9c81 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -107,6 +107,7 @@ immediately to ensure the user knows the fan has stopped.
  83RU           | Legion Pro 7 16     | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
  83KF           | Yoga Pro 7 14IAH    | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
  83BS           | Yoga 7 16ARP8       | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 83RU           | Legion Pro 7 16     | 0x04      | \_SB.PCI0.LPC0.EC0.FASF (Fan3) |  8-bit | 100
  *Legacy*       | Pre-2020 Models     | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
  -------------------------------------------------------------------------------------------------------
 
@@ -165,3 +166,4 @@ Contributors & DSDT Providers:
 - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
 - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
 - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
+- **GabboRocchia** (Legion Pro 7 16AFR10H - 83RU 3rd fan)
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 6d1284c09..172fdc198 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -41,7 +41,7 @@
 struct yogafan_config {
 	int multiplier;
 	int fan_count;
-	const char *paths[2];
+	const char *paths[MAX_FANS];
 };
 
 struct yoga_fan_data {
@@ -106,6 +106,14 @@ static const struct yogafan_config yoga_pro_83dn_cfg = {
 		   "\\_SB.PC00.LPCB.EC0.FA2S" }
 };
 
+static const struct yogafan_config legion_8bit_triple_cfg = {
+	.multiplier = 100,
+	.fan_count = 3,
+	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS",
+		   "\\_SB.PCI0.LPC0.EC0.FA2S",
+		   "\\_SB.PCI0.LPC0.EC0.FASF" }
+};
+
 static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
 {
 	ktime_t now = ktime_get_boottime();
@@ -259,7 +267,7 @@ static const struct dmi_system_id yogafan_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion Pro 7 16AFR10H"),
 		},
-		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+		.driver_data = (void *)&legion_8bit_triple_cfg,
 	},
 	{
 		.ident = "Lenovo Yoga Pro 7 14IAH10",
-- 
2.55.0

