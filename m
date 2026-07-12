Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2367533F5B3
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783879136; cv=none; b=e+3G6L/1SuVYDvRaopY9giSsS8Mhg8WBPXCIClOfV8fgexEbr6V/Re0gv4qtqSvArhc22HqgFEEzM/mmqjZYlLPOzXMwk2P9DQwoDj8zgybKBpQSW2ucO/Olrtm+yHVM5a05kiGuhbogoQtI2Sdh3LxrCpQ+NZy8/O75x5FS68w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783879136; c=relaxed/simple;
	bh=d3Len1/hzmVCivSXsUecpVLuyFZdNzdSyi/ADABdV9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JTJEtql43aJBZEYqMfgD9DH2eVVGFEWBlOCJC10Gsy9b+pZXln4n3k9oLt0MnuXIy9bc6eaTt1uccEUCMnOcgLR41TjY9kxPkaTRiWSmINeB7k1Hujw4iey0oWrN7RAiya1XzYt4L1fUdZf38EQFSKeJYI28cSpgvx3mDnEcv1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEWSpUrS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEWSpUrS"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1271078f8f.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783879132; x=1784483932; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1pF1dkAZZuH2CHUV6uQaavmQER8d7vj5ENjyx4Cu5TY=;
        b=eEWSpUrS3duVlEB9I8KO7X50xOjgjK5/pn4oDrj5/xJaZcQM9YyhHR6H3VFxDt3mU3
         snAD0nMsWqzGwcWjD1ca2dUi7WDbDe+qnzuq2BoP2hFQE2ziSN512tn/nzLidRFHMw5p
         BUcpgOC1460j37HyCD+k2XmPXYbIAK3AlV/G2QZz0W3nV55nuxv3nAWb6W/Kse0BpTDO
         0PFUF2QFwb2T2+8hhocgT3lsVFbGZuqnYyL7JiysexKalpe8rn1D0kKq6/atU8M3kx23
         61RW+qUa6MU97t8JrxbA6bg+4iR5EXNF36zwk90JLKhmEULwI09IMS/sT+g9TJwjY3P+
         vBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783879132; x=1784483932;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1pF1dkAZZuH2CHUV6uQaavmQER8d7vj5ENjyx4Cu5TY=;
        b=Z9rmyx6FSCJ5QWb8moNWEWd3rtDdsxmm5yLs6UhDSosVRCE9B8rTPAEa63UbHG8tMo
         rxHJRqJP/Afxh249neBQf+GRD9fd9Z0uHh7mz8fqcNPJMS2/lBJgR8Z3nioDHZLJJEjP
         1fW1bPTljvHIf6XUfkF55s/hBB/bIi2a6G57wHGvv4VScH31/WYQczs2HtkoszqjNxJM
         DwWWIP6GIk6LrgyLtpXo7PjX+XK4aXZZWuF1y63AjwJxK4E3/dDGGYrHj6rgqK4Axf8O
         UFEyR0DrXxmw8XKylPNIlIcHsmRJ+y3DXIw2NmtYn+ZinYRqFggH11MAUcEJXXbaWfQY
         je1g==
X-Gm-Message-State: AOJu0YzRMuNffTDVAgkvDfSXhTMp80aPhKtoHBwo6i5byupW18asWEmR
	80OK0puImjqx1xt4MP6Z3AO519cI/BQd4KDx8k7lO7rG6nghNfZ3SBgH
X-Gm-Gg: AfdE7ck3iei1mKJcRA7/dkX3xAtqK2TGw3pffmoBib/xCvRex87MKOF0d0CJ+FZd2jH
	CjSeUyAiAguYbpedEDmj7vD3Kxuiq0X1Wi0scZH3M7f12jFGAUDUvvRtPmCVGJs/KgAkiE7maeb
	Wx4d1mpgq27dXEYA2mi87mAnfnPAKB01A5ipduRszwSdlSOsVsTLMIWzO4TfcdlNJPZChkpkiMX
	q43XeoI/Ok5C42FLFMaoHcS/Q0k7Cu3ueO90i2QpL93OB07D/IMOi89U2tCdAqZXUaBDxJIsnFb
	cVuQl8QL1R7L2iEApGj0/+VWMKuFJw1rkI9s0rCPaiEYYdATeYRDjXBX0t17eMc78eGmh77fS8Y
	Th5qTXBhlmE2g16CdU9hLWDS+JRCRHcYmJ5o7hx6Y5sL7yYPP5vCQJkdSSr2pkKqpwzNWcP9GJT
	exav2GkiN6bJouJuoc99wLPo1lCr9LJFnZ5lFlVj6fe71dFqimxlD+Uz6vSpddEfdZnXskk7wWu
	gtVOfqDbABMlh9wH5eZ2//br2UR38253JuRTd00gv9hZxF0IDtQNZuRop+ckcPiQAzcr2afMBj9
	CPNfx1qHX3vyzfQoAB3yhZRVJ+3hZm1l3yxd3lBkxisMhF+WQC0Iuw==
X-Received: by 2002:a05:6000:470c:b0:47b:69a5:7243 with SMTP id ffacd0b85a97d-47f2dc8d6f7mr6928299f8f.12.1783879132272;
        Sun, 12 Jul 2026 10:58:52 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm81164776f8f.2.2026.07.12.10.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 10:58:52 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 12 Jul 2026 19:58:45 +0200
Subject: [PATCH] hwmon: (dme1737) Replace ternary operators with
 str_yes_no()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-add-string-choices-dme1737-v1-1-9c2b1f31db28@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqEMAwA0KtI1gb608JcZXBRmqhZWKURGRDvP
 sXl27wblKuwwqe7ofIlKntpsH0HeU1lYRRqBmfcaKJ1mIhQzyplwbzuklmRNrbRRxyCD2Hg2Xt
 D0IKj8iy/N/9Oz/MHx3nGuWwAAAA=
X-Change-ID: 20260712-add-string-choices-dme1737-543445ef330d
To: Juerg Haefliger <juergh@proton.me>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783879131; l=1858;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=d3Len1/hzmVCivSXsUecpVLuyFZdNzdSyi/ADABdV9I=;
 b=fqL7aGX4P446nVELZvHpJ0W727507zkFsuISzCS+Lb0XqTiKwHn54TlbYexnkPtEsUyMSWvW4
 1F9MNN9o1EIAbkxzWCDohTZnVx6VAUBnRFUHcFLT5Pr/L4fjFQ9FYLq
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Remove the ternary operators and use str_yes_no() from string_choices.h
instead.

No functional change.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/hwmon/dme1737.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index 7e839308e58f..f28a9cfced55 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -27,6 +27,7 @@
 #include <linux/mutex.h>
 #include <linux/acpi.h>
 #include <linux/io.h>
+#include <linux/string_choices.h>
 
 /* ISA device, if found */
 static struct platform_device *pdev;
@@ -2314,13 +2315,13 @@ static int dme1737_init_device(struct device *dev)
 
 	dev_info(dev,
 		 "Optional features: pwm3=%s, pwm5=%s, pwm6=%s, fan3=%s, fan4=%s, fan5=%s, fan6=%s.\n",
-		 (data->has_features & HAS_PWM(2)) ? "yes" : "no",
-		 (data->has_features & HAS_PWM(4)) ? "yes" : "no",
-		 (data->has_features & HAS_PWM(5)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(2)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(3)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(4)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(5)) ? "yes" : "no");
+		 str_yes_no(data->has_features & HAS_PWM(2)),
+		 str_yes_no(data->has_features & HAS_PWM(4)),
+		 str_yes_no(data->has_features & HAS_PWM(5)),
+		 str_yes_no(data->has_features & HAS_FAN(2)),
+		 str_yes_no(data->has_features & HAS_FAN(3)),
+		 str_yes_no(data->has_features & HAS_FAN(4)),
+		 str_yes_no(data->has_features & HAS_FAN(5)));
 
 	reg = dme1737_read(data, DME1737_REG_TACH_PWM);
 	/* Inform if fan-to-pwm mapping differs from the default */

---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260712-add-string-choices-dme1737-543445ef330d

Best regards,
-- 
Kind regards,
Joshua Crofts

