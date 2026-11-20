Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216056;
	b=qAVOAA/nxMzFV11O876309hkyU6tgPo0I8kwgqgwVrEidTJ+hgGncIfSctWUtCfxEEV3
	 8ew8+qvoHleivj9gYHOVGznI483KBOk/w6kFNbQe7OiEgCyMkfT0uO4jNHEuS4qSn7wrp
	 q5etuRzxmnM3rrlFiLFHt+Yq4RRQzbzIX8UVB7MmuTKkqlGndOp3Btclv74DZz+Ho6tCw
	 DW8tHy8JeSi+zzEluhqIRK0flYROXqaQ6RKwjinJkDC4KGG3gIxvlAwSjUIZ6q9Vk0N2b
	 eDJptbmTu76Ykf9cd8mblDFshvYphQ2/i98S2+LULuKP2am0RF1orV8Y9wmE6oJWehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8mFrmxfd2HUUei8JQuXwdgtl/N7wtXdWmc2fm+Okaow=;
	b=DNdZG5+f/Jnl/Sok4rVONRNARtDazFE5vBD1sRWRPlm32VzTAsjD61gSOFK0VSxKPN0V
	 nXfMCZncDBAgPVfB1qoqTdrIRd04671jQIouFStk5puuKmu7P40N2IAqpJDAzfVR421nh
	 T4sWpM0aQufLv27WZOV2uv4VdxO7GgCZe53tKLvsVTS5u4Vat37GC2FMcohhaQEJ97u+g
	 3J7xDL2J6Bb1EBdmX+GX4Oz02w0z9UJTQ2VrMJ1qYLfDczGP/FNt5/xpc90jKQQdr7Lfs
	 W4Q9F/La4l3lO0SrZH/r6CqAs171WGMoEBcp/UiRIU46jR6xIvuEB7U/IzLuXaV1OCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbE2EB5K;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF59606A330
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 23:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF59606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbE2EB5K
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2effa00323fso4839165ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 15:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795216048; x=1795820848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8mFrmxfd2HUUei8JQuXwdgtl/N7wtXdWmc2fm+Okaow=;
        b=EbE2EB5Kd1pAtXVhyHML67c6p4ch7Y4/nKiGRlLnYC0PN4KcXnoSOUw9JO5XJ4DRCv
         ZAJgUb2Bhh6veyw1iie0AJqRbFU4n1Er6+6P6fTeqEzQfiKtDMTXO9aTd7DPKXYGuCR1
         CpPIf/BoPd0ZWSPneEwkkbIYPWOGrmDkUlovOLdblgAFTNeUWjmFzIMKxpvvXiMbphyT
         a4zHTfXF1v7WUJ/20O4pHaR2XIq4vEaUsp0p3SjS9YFqLSwrQwhxhIYDRsebPjKLaMZ+
         xjQ9hwPgpmlskFKO4K53E39+REcfvMCNAvxtxo+oQ0CgGpr7i2OmCT3s9SIbcmFSJCDV
         TBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216048; x=1795820848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mFrmxfd2HUUei8JQuXwdgtl/N7wtXdWmc2fm+Okaow=;
        b=sUoHfhyYCij0rgMEzk/OBQIS3IkVWDDAJuW5vwvx3zrhvRGHpimcDoCPY2wUoOYNcm
         6F6typ8p0Z0mJi0v6TjE2Kr8zfKinHUE7GiwSIzzNInH0WgtIIuIXaQLp7GOErUlOOp/
         GpFrUjvciaSYIB04pdwxqyrGW1SZxkWv8NuIqIJXfPGRn8CALMchwN4DCLGEaO4Ril6h
         c4GqfaXpjpOg+CvInKhgngtWx4ERqT9zj2qFo9MMuR3VerU5KI9pTL8L1LaEg6v2YdW2
         65Gu+Bjgv6i3tgkDPpsEivDY2tR0QHxVp8gV1viX6R4b4zkf7ivom5YKZV1ZcShMa9Dq
         SECA==
X-Forwarded-Encrypted: i=1; AL+hErH5Y2pgn5mrvIWQowKFlCQSezDWB0kNtf4YjwKUMiKJB809Dyx9lM5YGKDuFcEm+5ReZgHxO/4Exd1DXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8gSQyTLq9kVjPBjKJj3cYca0CcfMyFFWESp8JkNYNtCSya/HDK
	+Uh46nx9ICXrtmdLgPgfHK07bStb9O5M5nPf7pdv5BNHBmX5clklxqyEL1mMQX/sAJYfuA==
X-Gm-Gg: AZFdTZeG5dWKfETlAmejdgA6F/HBNgje/BWkD9jgRo1cjQSohSFMz4chcWCQo9sG8Kr
	0y/YZ1l+sW2X4gLleCeXCRWPQouEqImFEfCnRbmBRHqQ9Tuf5JGOlvs/YUxC7SjhGjvTtxf2bck
	jP6wex6gDfOW1qWwA2JEHfxI3/oQNmRmqRsTN866DmKICj7whqcd2005VvQYDDonMYWMjiEDO+4
	zTsfIABbiXYv8WZXUbFRQOyyDfXvS5cUlIElAtLVnuefwcMPwhW0nUnQEeiSXf+p/PIlW3hokXv
	4CHRN3Ebwv/awCs+YypT2DSxR7fAfWRHefgO5yXz4WBrG57+QPxvm+5uAyHXfoWcnlw+fcbwOfz
	ZNVwOIrsLQ2ZMsERWZuIrX7pX9/s5syKgbRGJNf/MyLn0SQzfscXpSq54jv+EC06pqq7zuLGEtj
	O3F9DM1zz1+L+soQZPlpymmvk9nm8kVex+f/Sm27x60CThFYDjkqI9kqBKlOdN3HFqymqcARz5t
	yoWZD3m+/Q7WcllzC3OLTxKdy+ZqxAbvVMHo+cF1TW1u49uFtZwwgBhgOK/DuhRt4cFdbrGkxUp
	wY2bOZTjdllir7dOt+OqYaZmROOT0bGATzLNQLk/qE4BSbO18NO/fFbW97/WioslqWN1Wbsg5qc
	hyYnUH9cI3AzncEIgBj9pakPygyIoCFNPieYeWqm3Bph7Qe8Zf7uccHdo/Ncbc4cahNFuz46nH3
	0yGNm3dmAL3VW3W8cyTAGtJczVWi6FC5UNwJNKQdbDxFNF85wku/t1pBiSXPOA
X-Received: by 2002:a17:902:db04:b0:2f0:436d:bdd4 with SMTP id d9443c01a7336-2f0436dc4f5mr36873435ad.32.1795216047536;
        Fri, 20 Nov 2026 15:07:27 -0800 (PST)
Received: from KuwaLee-Laptop.lan (2001-b011-e60b-7ec5-5d37-150e-4756-b254.dynamic-ip6.hinet.net. [2001:b011:e60b:7ec5:5d37:150e:4756:b254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee844acsm20310345ad.2.2026.11.20.15.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:07:26 -0800 (PST)
From: KuwaLee <kuwaleecross@gmail.com>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	LI-JIA-EN <kuwaleecross@gmail.com>
Subject: [PATCH] hwmon: (yogafan) Add support for Lenovo Yoga 9 2-in-1 14ILL10
Date: Sat, 21 Nov 2026 07:07:44 +0800
Message-ID: <20261120230744.34942-1-kuwaleecross@gmail.com>
X-Mailer: git-send-email 2.56.1
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

From: LI-JIA-EN <kuwaleecross@gmail.com>

The Lenovo Yoga 9 2-in-1 14ILL10 (DMI product name 83LC) currently
matches the generic "Yoga" quirk, which looks up
\_SB.PCI0.LPC0.EC0.FANS. That object does not exist on this Intel
Lunar Lake platform, so probe fails with -ENODEV and no hwmon device
is registered.

The DSDT exposes two 8-bit fan tachometer fields in the EC0 namespace,
used by the vendor WMI fan speed queries (feature IDs 0x04030001 and
0x04030002) with a multiplier of 100:

  \_SB.PC00.LPCB.EC0.FANS  (fan 1, EC offset 0x06)
  \_SB.PC00.LPCB.EC0.FA2S  (fan 2, EC offset 0x03)

This is the same layout as the Yoga Pro 9 16IMH9 (83DN), so reuse
yoga_pro_83dn_cfg and add a DMI entry matching product name 83LC
ahead of the generic Yoga entry. Document the model in the reference
table.

Tested on a Yoga 9 2-in-1 14ILL10 (BIOS Q9CN31WW): both fans read 0 RPM
when idle and rise to a few thousand RPM under CPU load.

Signed-off-by: LI-JIA-EN <kuwaleecross@gmail.com>
---
 Documentation/hwmon/yogafan.rst | 1 +
 drivers/hwmon/yogafan.c         | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 239c7b5..ff272c5 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -93,6 +93,7 @@ immediately to ensure the user knows the fan has stopped.
  80V2 / 81C3    | Yoga 710/720        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
  83E2           | Yoga Pro 7          | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
  83DN           | Yoga Pro 9 16IMH9   | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S   |  8-bit | 100
+ 83LC           | Yoga 9 2in1 14ILL10 | 0x06/0x03 | \_SB.PC00.LPCB.EC0.FANS/FA2S   |  8-bit | 100
  82A2 / 82A3    | Yoga Slim 7         | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
  81YM / 82FG    | IdeaPad 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
  82JW / 82JU    | Legion 5 (AMD)      | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 6d1284c..7772e83 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -285,6 +285,14 @@ static const struct dmi_system_id yogafan_quirks[] = {
 		},
 		.driver_data = (void *)&yoga_pro_83dn_cfg,
 	},
+	{
+		.ident = "Lenovo Yoga 9 2-in-1 14ILL10 (83LC)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83LC"),
+		},
+		.driver_data = (void *)&yoga_pro_83dn_cfg,
+	},
 	{
 		.ident = "Lenovo Yoga",
 		.matches = {
-- 
2.56.1

