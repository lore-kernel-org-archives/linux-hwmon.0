Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2603EEAEB
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649959; cv=none; b=ZmRsVVOxan+D1e5pOutJGyNrGYDjeqZHQbKtfinHz3REvdLb/yNUeZdPYkyrbcm2lavKhy3v2sWRht1Wr2d6tNQYcsUrLOpyk1CkGEPJFYSDSgSwlbAT8H/ViynwxHux+nyziK1dH2DPS7Gqu4joFQlzXmsIrXZXx41FsQSgIgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649959; c=relaxed/simple;
	bh=x4b3FnrRl4mnIm2nuuyD1wW2HRcp1yeP21KvEk36LJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCJ1V2G1uXDnQ/yHKe18+9BePo8sGDG7l6gshsaMztbKNGE57gLpCSAProZw+6Dvstbk1aPpI/t5xoEQXRJPw099HThIj1BgZ3qL8Tb88m2+jOvpcnBZMd8+ito0+mYLUgMb1R/Hu+qkgTazmGR2CP+Cx4LTihD+lww25+S7FT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdzzcmHt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdzzcmHt"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c169ae1cb26so116889866b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649956; x=1788254756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srb6xdaTGZYwN0OspPy3DAgDlETn/SdGMB9cf3v5QI0=;
        b=rdzzcmHtBHS513CtPHCRgYtX/mt6nKJ7wKzq+krwAXqLlZ+ImtHblNsc3r8GzRFlyh
         dalT45tlpmYrOclAAwlZEBd2hftkyT/CxR4rNx5gbnYNfE5LlhM1RBLwE6asCU6SqPGN
         3nicjM+tn0WpPCHhEUbMQLc8t4/HRAEbWAgQ6bmgK0YQwspEd7Pw6p96IM/946KvcMfH
         jcW0iVD7IFmpI52iY6lCq3uq5bgvl+fgMwPRhO6EjMPKHUj7ovyyixDIktRJHfFCs9FZ
         Pa0dycWjKaa9aYHV9fDukhOf8QQE+Wd8eX1CLSDIsxuvq6F67xixHu9q/LVDKBqi7HoE
         aEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649956; x=1788254756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=srb6xdaTGZYwN0OspPy3DAgDlETn/SdGMB9cf3v5QI0=;
        b=rbV6bZRVAh4Lu3rucz0oSqm31sQ+MrdlxmN4VTTz7nEGP8nDLwEujyEnDQ8c8LaVTI
         yZe5eltT+A+9sJyc7F2ip7Zg1rlN04YswbnZwOIfGPE+q+m3yuBMRWCsmKIlqkmXlkeT
         LqZ0x8yFwleUJOyUm6n8jgSGlK0hZPgtONzh11wXknc/ptPPg9vmHjEKxQ7dDvclRqRA
         JkZtzg+v97zJynt/2lf0nH3VuaszM87vu9XO9IcMtnVT2/UW1FHba1w0nxNUPz6FD2VD
         /HXn4VIrI458s5T+9A85MAmXdveUHgaVZQSYUtiYkVaDReVsYGG1p1vU9f0Wc8Txd6NW
         S/GA==
X-Gm-Message-State: AFuF++nf1LX81TEsahSI0YP8GZijZj0YBv3G9bt8D0L2FIAIWNnhKPie
	LpIcoJ/eNfA786n9ZYpdlzQ1hDRAzUgtodTgfDGRRDWPmOrJaKEdGXcc
X-Gm-Gg: AR+sD11yovGayZNxU0TkDsDVeMQDtj42i/AUNLE3G4bFAqsFR45/gE/PEzTpkjJEucI
	kiwxyJOqdAkT8pd2HvZzp4RdEmF8CLFFtNfobahIsfMtlBORWVImvciv5U4Lc/eKk5tzvymtKSw
	LmQSw9qdjct4OR/JYIYV+Z/hOXTbldbfFd3fIK0UsSzaDL0BKA5Q46L2w1VgsDmEC75JD0PICku
	8L29hq6StV+nYfNaHyU2Rb2/Z9D98u7iiaSyPbmvYHcSmMKtCgKwvSWY9cDi6i6ekmXPv16eMcl
	sfUEy7rsSCNiEe6Kvhm2vwwLwzYaKcYGl+IQBQBWySNIb2BnAuN3DcCmVmuOODXEHMJUmmqVyzn
	V3KsniDRI9ZFh5jFKdBFDAUDxLTT+rrVuoxxkemAjINwv35R0E6+kzL2kedfENOnz2M7tBX6O9L
	IOEzHBbDsC+I/ghAY5NUAac1PSAQPSoUDN+4evRlI25DbJbVlfEDq0S75HOHd0+CBEFaPBuipY+
	kf2iF79kokl6cqgW0jYhitwXqA0URpytGhMzllgYel+dyOqgsHdYS9n/ljjz/yYBZ71IO0zAax2
	uvD8OvYejx0EZugK5c4gb/o=
X-Received: by 2002:a17:907:d40f:b0:c20:ec9c:441a with SMTP id a640c23a62f3a-c24e2df8d14mr579497966b.12.1787649956393;
        Tue, 25 Aug 2026 02:25:56 -0700 (PDT)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606bd05sm1612570866b.2.2026.08.25.02.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:25:56 -0700 (PDT)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH 2/5] hwmon: (nct6683) Add customer ID for ASRock B850 Steel Legend WiFi
Date: Tue, 25 Aug 2026 11:25:43 +0200
Message-ID: <20260825092546.669450-3-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825092546.669450-1-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASRock B850 Steel Legend WiFi uses an NCT6686D chip reporting customer
ID 0x164a. Without this ID the driver refuses to probe unless the force
module parameter is set, leaving the board without hardware monitoring.

Add NCT6683_CUSTOMER_ID_ASROCK8 and handle it in the probe function.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst | 1 +
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 45eec9dd349a..908c0b10c642 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -66,6 +66,7 @@ ASRock X570			NCT6683D EC firmware version 1.0 build 06/28/19
 ASRock X670E			NCT6686D EC firmware version 1.0 build 05/19/22
 ASRock B650 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 11/09/23
 ASRock Z590 Taichi		NCT6686D EC firmware version 1.0 build 01/25/21
+ASRock B850 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 10/29/24
 MSI B550			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI X670-P			NCT6687D EC firmware version 0.0 build 09/27/22
 MSI X870E			NCT6687D EC firmware version 0.0 build 11/13/24
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index b524a45b1471..b43e915f9d0f 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -184,6 +184,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_ASROCK5	0x1621
 #define NCT6683_CUSTOMER_ID_ASROCK6	0x1633
 #define NCT6683_CUSTOMER_ID_ASROCK7	0x163d
+#define NCT6683_CUSTOMER_ID_ASROCK8	0x164a
 
 #define NCT6683_REG_BUILD_YEAR		0x604
 #define NCT6683_REG_BUILD_MONTH		0x605
@@ -1262,6 +1263,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK7:
 		break;
+	case NCT6683_CUSTOMER_ID_ASROCK8:
+		break;
 	default:
 		if (!force)
 			return -ENODEV;
-- 
2.53.0

