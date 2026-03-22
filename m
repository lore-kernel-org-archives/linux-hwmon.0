Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C6F30F548
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774185561; cv=none; b=aXdseO8W4sUBHUqfutpK0MsLtZO/J9OmOaSoWT6yU3m7zObH+OmKr/rg70XNRZ/WD/p4crKvXhAqXn9oN0Gbc5Abw+f6qzi4312itsdZK8RI2kEy6ogKWHWeo1SYGjdqs7yHg886tWa4ePFNWA8IH2GaFKA0W+sRQbIkkXRPrVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774185561; c=relaxed/simple;
	bh=DpOIXdLaxt/pdSoj45SS+l87cS0BneML+IC0B/md/W0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X5pPOg+cwxLxkgO5MQMiVyBhFNuZbNO9bdz6wf0KMsvSCA0mp0fl5ieDPTyxqW2lKVU1t18JVRS28KW0iAjaz8uk86Pa8EykdlWwFKuUmNeo6mtmk5RsisS4rJcV9SnJroOi2W0XFupwH9wS9PKbaaHp5UjYx4Pzk6tQbpzHHJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrSXPkgz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrSXPkgz"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a10d130b37so2431572e87.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774185558; x=1774790358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3N+4GJn0GqMKL7kn5+y6bHTDfHofTr2+Ok7Zjn95L/I=;
        b=LrSXPkgzaNhdXc+GxhswbV6ENMN2QsINDGisnvUFJEIPhw1FLWLYDH9a4abQxaz/BF
         6v0S7SvPaJ+nAFRJseNYOlm1sl400T36fX7ETZkCJ+66JPnAdphlmv1ALBYVY36f8phS
         wBo7RJloS4tUYSFe+LTsQMXDodAbKRV74VXeP+JWbfwaxt/aRj7PA8CmSZlNkGq/5U52
         s3uBhHVDV83W2H+h2Xp2Woha3Y198RZfpJ6kHN4Ok3C6wdGrVVtpcOklpDSfgYnPIKWW
         QBPuAXiYc283RmI78zKLZfmE9bKjqeeBnV8yAHyNcqrEJt2rHfz43CTT04g/e9US2688
         uVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774185558; x=1774790358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N+4GJn0GqMKL7kn5+y6bHTDfHofTr2+Ok7Zjn95L/I=;
        b=RanCpzBVGgzDYC6O2cf9FOmHjW4QDiu7f5ksvE+FWZr6DWiNACwXgC10bLJYEyxgXJ
         tPxPFlwMFSsa9C0XNSmz2zOQhU+yUTjqkVC/KOY2C+EkQxb496sDrpOyLL7qttiH8D1Z
         bH4E3TVaSUQ+xBK6l6CAyThHlHqIvnQFESd2zhkjT9IypUw8o5ZMp0RKb5jUWiUeTNFp
         79Pqq6CXSSTIvRv1GJG7sVH7krDx2ZbqheJfs9HsHieztXT7lFvUupxbfAtmg0JvuwFf
         B4i4xvWWnbs3kUaSLnC1zzd+xt+4bjLiO1O0EqgYVL0G8sSaRWUxxuzPCq0Zzt7iE04V
         VVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHCfYNZwf7q2ZOlqTRQG/TCGgySlNmiQmb6GE45vXhp9RWOElBdwxsGIzWAPtCLw8KvA8zLygCWeWBSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgjLwU404O8UV5SeHBn0S77AAKPAkA9qSXIWSpwPZ7dzkTHqdb
	LqwYrrb8ZhXZfBaGH33Ebal6eA3e/YC97dtH3rRirbZU8ZaTV8eMLguD
X-Gm-Gg: ATEYQzwE3BLrox3xP+oQ84ggymib0yyaauyYlcYzX0Zt35BZxyC0bln0N+yU0kQnbhd
	Rd1qojYV4OYBkqgCzehKckNipidGis/qmfaky+029s+GoV0ueVlfBoTRgxiqeeJYGZcIpLu59nt
	cmokOtgkInkc1wrIew6J71BctwW/Goav/t4riENsF0tb+ADU1kXy9DcyYZICrR4SlKUiYHYxhV+
	2waeEjATEOXC3f7PgMNYvE41+lzJiRJWaq8SzmSA/bTiA8GkczFRmN3Ru464hjWliEd428KL4MT
	VYDuVDm4MY/Mh4gGJ0AgjRHFdMn9Hm0KNjLsGUG9+451TBP6OfxxajIplh0C4tON5Eid6vxCnoH
	LL+uVEsaTCxKdXeOnsgGOfiypkL+qA5Q/eJSs7wPOqFEhQoFaW2U++4GuJR+livnBDbJV8vPiVP
	SOOk0CqQRN4DfxdojrvFasefy1fI+N3jXC0K+dDRo=
X-Received: by 2002:a05:6512:1150:b0:5a1:355d:674e with SMTP id 2adb3069b0e04-5a27ddeb59bmr3920456e87.9.1774185558142;
        Sun, 22 Mar 2026 06:19:18 -0700 (PDT)
Received: from asus-c101pa-bob ([178.137.23.204])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5a285207365sm1736325e87.42.2026.03.22.06.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 06:19:16 -0700 (PDT)
From: Denis Pauk <pauk.denis@gmail.com>
To: 
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ptscheepers@gmail.com,
	bugs@bzatek.net,
	pauk.denis@gmail.com
Subject: [PATCH] hwmon: (nct6775) Add ASUS X870/W480 to WMI monitoring list
Date: Sun, 22 Mar 2026 15:18:45 +0200
Message-ID: <20260322131848.6261-1-pauk.denis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Boards such as
* G15CE,
* PRIME X870-P WIFI,
* PRIME X870-P,
* Pro WS W480-ACE,
* ProArt X870E-CREATOR WIFI,
* ROG CROSSHAIR X870E APEX,
* ROG CROSSHAIR X870E DARK HERO,
* ROG CROSSHAIR X870E EXTREME,
* ROG CROSSHAIR X870E GLACIAL,
* ROG CROSSHAIR X870E HERO BTF,
* ROG CROSSHAIR X870E HERO,
* ROG STRIX X870-A GAMING WIFI,
* ROG STRIX X870-F GAMING WIFI,
* ROG STRIX X870-I GAMING WIFI,
* ROG STRIX X870E-E GAMING WIFI,
* ROG STRIX X870E-E GAMING WIFI7 R2,
* TUF GAMING X870-PLUS WIFI,
* TUF GAMING X870-PRO WIFI7 W NEO,
* TUF GAMING X870E-PLUS WIFI7,
* W480/SYS,
* X870 AYW GAMING WIFI W,
* X870 MAX GAMING WIFI7 W,
* X870 MAX GAMING WIFI7
have got a nct6775 chip, but by default there's no use of it because of
resource conflict with WMI method.

Add the boards to the WMI monitoring list.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=204807
Signed-off-by: Denis Pauk <pauk.denis@gmail.com>
Tested-by: Tomáš Bžatek <bugs@bzatek.net>
Tested-by: Theunis Scheepers <ptscheepers@gmail.com>
---
 drivers/hwmon/nct6775-platform.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index 555029dfe713..1975399ac440 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1159,6 +1159,7 @@ static const char * const asus_wmi_boards[] = {
 	"Pro A520M-C",
 	"Pro A520M-C II",
 	"Pro B550M-C",
+	"Pro WS W480-ACE",
 	"Pro WS X570-ACE",
 	"ProArt B550-CREATOR",
 	"ProArt X570-CREATOR WIFI",
@@ -1258,6 +1259,7 @@ static const char * const asus_wmi_boards[] = {
 	"TUF Z390-PRO GAMING",
 	"TUF Z390M-PRO GAMING",
 	"TUF Z390M-PRO GAMING (WI-FI)",
+	"W480/SYS",
 	"WS Z390 PRO",
 	"Z490-GUNDAM (WI-FI)",
 };
@@ -1270,6 +1272,7 @@ static const char * const asus_msi_boards[] = {
 	"EX-B760M-V5 D4",
 	"EX-H510M-V3",
 	"EX-H610M-V3 D4",
+	"G15CE",
 	"G15CF",
 	"PRIME A620M-A",
 	"PRIME B560-PLUS",
@@ -1320,6 +1323,8 @@ static const char * const asus_msi_boards[] = {
 	"PRIME X670-P",
 	"PRIME X670-P WIFI",
 	"PRIME X670E-PRO WIFI",
+	"PRIME X870-P",
+	"PRIME X870-P WIFI",
 	"PRIME Z590-A",
 	"PRIME Z590-P",
 	"PRIME Z590-P WIFI",
@@ -1362,11 +1367,18 @@ static const char * const asus_msi_boards[] = {
 	"ProArt B660-CREATOR D4",
 	"ProArt B760-CREATOR D4",
 	"ProArt X670E-CREATOR WIFI",
+	"ProArt X870E-CREATOR WIFI",
 	"ProArt Z690-CREATOR WIFI",
 	"ProArt Z790-CREATOR WIFI",
 	"ROG CROSSHAIR X670E EXTREME",
 	"ROG CROSSHAIR X670E GENE",
 	"ROG CROSSHAIR X670E HERO",
+	"ROG CROSSHAIR X870E APEX",
+	"ROG CROSSHAIR X870E DARK HERO",
+	"ROG CROSSHAIR X870E EXTREME",
+	"ROG CROSSHAIR X870E GLACIAL",
+	"ROG CROSSHAIR X870E HERO",
+	"ROG CROSSHAIR X870E HERO BTF",
 	"ROG MAXIMUS XIII APEX",
 	"ROG MAXIMUS XIII EXTREME",
 	"ROG MAXIMUS XIII EXTREME GLACIAL",
@@ -1404,6 +1416,11 @@ static const char * const asus_msi_boards[] = {
 	"ROG STRIX X670E-E GAMING WIFI",
 	"ROG STRIX X670E-F GAMING WIFI",
 	"ROG STRIX X670E-I GAMING WIFI",
+	"ROG STRIX X870-A GAMING WIFI",
+	"ROG STRIX X870-F GAMING WIFI",
+	"ROG STRIX X870-I GAMING WIFI",
+	"ROG STRIX X870E-E GAMING WIFI",
+	"ROG STRIX X870E-E GAMING WIFI7 R2",
 	"ROG STRIX X870E-H GAMING WIFI7",
 	"ROG STRIX Z590-A GAMING WIFI",
 	"ROG STRIX Z590-A GAMING WIFI II",
@@ -1451,6 +1468,9 @@ static const char * const asus_msi_boards[] = {
 	"TUF GAMING H770-PRO WIFI",
 	"TUF GAMING X670E-PLUS",
 	"TUF GAMING X670E-PLUS WIFI",
+	"TUF GAMING X870-PLUS WIFI",
+	"TUF GAMING X870-PRO WIFI7 W NEO",
+	"TUF GAMING X870E-PLUS WIFI7",
 	"TUF GAMING Z590-PLUS",
 	"TUF GAMING Z590-PLUS WIFI",
 	"TUF GAMING Z690-PLUS",
@@ -1460,6 +1480,9 @@ static const char * const asus_msi_boards[] = {
 	"TUF GAMING Z790-PLUS D4",
 	"TUF GAMING Z790-PLUS WIFI",
 	"TUF GAMING Z790-PLUS WIFI D4",
+	"X870 AYW GAMING WIFI W",
+	"X870 MAX GAMING WIFI7",
+	"X870 MAX GAMING WIFI7 W",
 	"Z590 WIFI GUNDAM EDITION",
 };
 
-- 
2.53.0

