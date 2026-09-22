Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CC21FC0
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097383; cv=none; b=c/Uys16m0eUnwwMyq3Q2FfpGkFjW22V41wW3g5ey8oAqp65dnGWPX9CFWc3yrUm7JG8UJuppeZyW1QHpuT1MowYpSNTBeqSWbxI/R8aOGHzI28ng5RsSzyjaQLJIX8ZOuRfLOkMDlF9TXqZX8x4ley1eIXgTYartGIWKR2Rm8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097383; c=relaxed/simple;
	bh=fUOxJQRg1fHiXsAod5AYZ2/X4FAwzkBrLYwHjynWgM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIP9GlU1MEafzPPawhvLIUAskdue323p53BR0b382kAmhIrrjLzX+6dIxYurH6NUsvniH19thr45x9gSAalhBn97fdx+H9WT5g9OUV8B+LnXkKPlsv2fEJE9i15o3+FvLGw1eM7wgR3mY1T3ddjicw4kh5brV0iRxe/uVSMCLeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyxZsAdt; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyxZsAdt"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso107335a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790097381; x=1790702181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIpfujCfE9HakCdM2BgRr8mBK7kf1cHfVwOrrBjiCuY=;
        b=NyxZsAdtffLW+2NGzlRwHj8F1CCS2wMnVgZ55RLIjF1oqoFzh26pXiytX5FfvyXYbj
         d1upQM6KzGNNazPq4kBtkQ4hcMROpqVZEaTg4x4zbRhH31RoxnftdFfLqWhBLW7Ozy5a
         eYWXbAaD6Ts83jTpUq6qQmv2qXL3Mr6xM4JRPkcSbNbZZ+BIXLGXqh13dXv+K00zj2w0
         tY3yzbSuuF5gKPPiQgCECqsGnjRhxUy8g5Uy7wv0K7y7bx4lIkbUXvLNx2OrtdbTLu7o
         vXCPBSXkhMEko835aSwz4TpPqVgkci7qF7125fS4yJDPsHSQGc7NJm+qPXWSiNI4WTFs
         pBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097381; x=1790702181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIpfujCfE9HakCdM2BgRr8mBK7kf1cHfVwOrrBjiCuY=;
        b=cWDOibOqheLyHmfKHlXuBCE4qVjUJjfB0vcDXattVfVt99sjV5Ut25HKLQa79LKQjw
         oeChgzWyKNO4ffmFWGYf2nvOnQMnALfGTwrelE1bXcmPUwNtzUiSu9uTemUPcPDWnack
         ET4lFFgh8EwnzMviV6Iw83ZcmNgSoQW24pj8avlSEcvxvNZxk1baYu5XInBMb5N1TWkg
         5rEivGZOdeLkWwCDCQvRfZk9wnUyP5WrwvGTD1gMK3iMNo9KaVGB4p86ZBGyvN4kVdFV
         GqqkOFXIpkNDiwiloeV4fUIrJLrMqmozfG5kyqG+D80tBUn/9ayEyZSS/D2yLM7DaI5z
         cVYg==
X-Gm-Message-State: AFuF++ny0z3y6IdAmNWR2x0vqDSjcAS/JgLBNkXY7Crdg+mtE8Gniuvy
	nElBodsdObX52BUaMNpetPqjEwOO4x/KBscn1JRAAhzOnz25WorT+QV8MK4/pD5a
X-Gm-Gg: AYBFou14JhfpiE1D8mDy0/fGVaos2gVZWfOIjeE/LM62+5OlNERM7DvGFl1SLiMUEpB
	wMvsy1mlFrT7r8fMDfILqEJWm8zL1lszIDfp7A9Aoj8ZGO7k6HMwCZROsvBHIIvOArFTxOZiG82
	vIZmt/I2quh6FTPoLatO7rtNUXskzuMTi2cSbnqKgBe/kkJaNrZLJvlhIUzLOlOFGOOhyxoACAr
	+JzfZFGscqKTQVqO0NrrvSUhKR5RoAgcTiM1ww7M2tYYs9z6NGp2++xmubBrjM2x3zH3lGq46jw
	44jxzOE2IcuHoBOv1+SxnuF3MuWDjM7tx3ZKTqx+MczooWkWYDCRCo9mcITFuWEFdMWAsM+veKt
	ZGNUQiw0HCBA6RibBwPLTkqu539yuk/cDCtCsHTSJOm1aGrgPEzBUpApJrTifFDtaOVT858RZ1h
	EHhhrPGX6NIkDo/DBL4Ec99Tf/5IKB7gLoGZPlkZ9hwe2R0ocGgdF1/Hc/2BUzteKWn88IiUTlm
	LbmV1LCBacu
X-Received: by 2002:a17:90b:5646:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-3a07e54a847mr123079a91.11.1790097381251;
        Tue, 22 Sep 2026 10:16:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4easm329359a91.6.2026.09.22.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:16:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nct6683) Add more MSI boards to list of tested boards
Date: Tue, 22 Sep 2026 10:16:18 -0700
Message-ID: <20260922171618.620877-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested with the following boards:
- MSI MAG B550M MORTAR MAX WIFI (MS-7C94)
- MSI MAG B650 TOMAHAWK WIFI (MS-7D75)
- MSI MAG B650M MORTAR WIFI (MS-7D76)

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/nct6683.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 9f415b740aec..c47b0709c5e7 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -67,6 +67,9 @@ ASRock X670E			NCT6686D EC firmware version 1.0 build 05/19/22
 ASRock B650 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 11/09/23
 ASRock Z590 Taichi		NCT6686D EC firmware version 1.0 build 01/25/21
 MSI B550			NCT6687D EC firmware version 1.0 build 05/07/20
+MSI B550M			NCT6687D EC firmware version 1.0 build 05/07/20
+MSI B650			NCT6687D EC firmware version 0.0 build 09/27/22
+MSI B650M			NCT6687D EC firmware version 0.0 build 09/27/22
 MSI B850M			NCT6687D EC firmware version 0.0 build 03/10/25
 MSI X670-P			NCT6687D EC firmware version 0.0 build 09/27/22
 MSI X870E			NCT6687D EC firmware version 0.0 build 11/13/24
-- 
2.45.2

