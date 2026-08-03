Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0A3191D0
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795383; cv=none; b=SpmlaKjssOVKaiDTIHSRfbypmg5NxerC0wjTP0AeT/XBtgV/nfLgmwT4oJgFRgKJEsXqOkEwpsi57VbcDalbD1AOaFDnFD2R3U1Zu+WQrKqAOtwYKL86QAqg3SyIZqm/kZLzTuy/Hcwx9cidVl/osMOWqH+PVXQi+2sLOVPlBsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795383; c=relaxed/simple;
	bh=HDD3BCKdaHCS43NkUBSwVd1u/RrPToWuCQHOzDVsYZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADBlA600/uuusErXrttApy2/InTK3GxCr5g8m2aLVOnDjlAK4Y9iQK/THst/OaYeFUuhtE8fZ8WQx1N0F9vtlFr93k5Qyw8ZJnOe9rix97AF9ILUHzN8R5TiADeX+hx6ILp+WdQ0ocas3uB/0XCYms5uqJE6ChPyYmTSD49ITF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFcZbazF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFcZbazF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceaf8a1265so45969865ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 15:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795381; x=1786400181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHofJjuC+8WuxnJ+ZeRv8pXBm7Br8DGbmZDVzBhVs0c=;
        b=IFcZbazFn+Fmk/LZgH61+d1mZMsZekarVk4MbEJ5rz1Ilz2VEJmnLqep86XPaLu0vX
         ONQg07jdk0M6sLfsjUGzZtVsqNjOC0/ULpHQD+r9UnZ68GUPQm2R/rPgbm8Q6AsH8i11
         6t2Dk4CjPylYQcwX4U7J0gQxafSaFklj1Sq+GTYW6HVjlMSuepE8W2BCmPgMeOig6E0W
         UVKDRa5KAUMNQyc3qjaAuZSNP0QhQxJtTkNZbpH38DUkpF4/F17ovL3MEjFivetDNVEv
         6J0V9PNCFSFFlY/rDXh2q0WA7Qau/asEpzFa+T2+24EQi76cE+tpJhW421BC7HoKS40V
         m4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795381; x=1786400181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHofJjuC+8WuxnJ+ZeRv8pXBm7Br8DGbmZDVzBhVs0c=;
        b=jZMSSodvntQNJ/TmhvvBxba3fFzQDwmnqNUc7UIkANPa757t40f/7s2nAJ7Jw/TV2z
         TOU8J3+rxf30W3h4SNsol7ZzKDpJMLk5mNazUfTYPqcT6r1FVyJDJocOQA6Z2qBd7lEv
         NrRW2EBOcbi4+VXKRAg/T//RGNH/XHiL9XREt4eA5XoXBSNMgpw82yR3+gNp0Xakb+X+
         AKZ+mOtguu4V+xzbQuJbl5RH8XM+NNHLhDZ2abhUSw03gFvFf8jVJtP/urUBYaOelWbY
         WqOWuRd+qqCxHfWo0CVl2coEeTxWnSwqSOIbGye0Vsbbqu1Av1wJgND4AUqTcmffvvAB
         npiA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2qEqZI8RgDSkY+N9toGekYgjMm7Yz0gBxl8mAN2IQCh8q8xr1JDp+b+eaC7nsxmbPxdwjDNAEyHbcag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb7afivkGkVa5EjuY6dDBKigVEQlxQXYT/EEkGxlVCMzbgTcF7
	hNXUfGLVkglmYU7yGCde1XC9BkSvzKdqOmXaKK4fkBQsG8X4DMlov77h
X-Gm-Gg: AR+sD12wyPZsocom6wRQTI1mbMV6n6N7fFFTd/pl/a7e1v5AxPRBf9m3lHUjvzppc/L
	+ki8c63R2mIxRdJ1j1aPWCTpApuvuABUIVztEbS8wHtRBphruQYhdCnfbfJHf+7hwhPP3Mb+iLD
	DdgpmoSTG+7IYJBGGmCG4CzHGmUi3gwVoeGcjNZOCGp1KAehcIRAyHpx36qtJDw6+BFInMxU851
	Us/qDIwRSpTNxPG1Abfd5ru7rOAh8SR+ZuLpKd6J0EOOzzoxtP/MdEMaK6MFGTbK7IvkWrIzJRN
	80oqr4SVioecHwPCZf5n0zchssFv84+OYDzWp1AXofoMWtsBwiOMTe5ibP38F/Jj187SVf6ZsPd
	KJHZUCk4Xb4OL6LTqYbm2xqfmbM2ApB9JELsYHLXxWevioR20+ZtzreUujonSX+KB+w3FJSBck9
	iIOBykz1LwmDwAGTWaamCLtN+60P07dK3rMs+oYxKSKFzQ/fBeDv2djst0Ojk3dO4HCSViDBTU/
	1ORNiEFBojKLucOnBWXSX00m0JB74zseMaOoyfsBQ==
X-Received: by 2002:a05:6a21:a91:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c92a529fa5mr12008651637.24.1785795381179;
        Mon, 03 Aug 2026 15:16:21 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:20 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of switch in platform_write()
Date: Mon,  3 Aug 2026 15:16:09 -0700
Message-ID: <20260803221614.59324-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ML patch set uses a guard within a switch case that violates cleanup
rules. Move the guard outside the switch so all return paths are covered.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index dfb65ac8fbf6..33acd448f674 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct device *dev, enum hwmon_sensor_types ty
 	u8 buffer[32] = { };
 	int ret;
 
+	guard(mutex)(&data->wmi_lock);
 	switch (type) {
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_enable:
-			guard(mutex)(&data->wmi_lock);
 
 			buffer[0] = MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE;
 			ret = msi_wmi_platform_query_unlocked(
-- 
2.55.0

