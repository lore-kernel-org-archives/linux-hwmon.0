Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BF128C005
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Jul 2025 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748613; cv=none; b=rzTwTPU7WbRGL1ZeHVeW2HjN5UVerD87TuO1Pp4W2udAoUGICllDUDhlsweOXHUcEPxkQtciQxOn26cYut52qh0bNbxSdzlnWR4rQYEVYvfHH/Qrv/w7vcBljMPVuKyiIfX7VOBZBNX4+nJ1v1weth/50ufGvB5yey3CVTjDn2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748613; c=relaxed/simple;
	bh=DsMQWAS8PxXqK4a9JuCsra4GDSIVQEA8+K5Hj31kEQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TOEQNdR0ZO6irjXR72wX4soH7jzOwht9QzWBKWuTlX/49YOX5DNS5PbwxqG5wE/RoZeyG5G7TaruwcHHo/clgYcNP/EytQRzYjg4bcq+e057GOjtWq5IZ9JZWT7bmVQETYhs0Het7ERsJhroJDdsjUu3bDf5sFsRiWvqzxoeltI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkZPDs5o; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkZPDs5o"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-55628eaec6cso726928e87.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jul 2025 03:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748610; x=1753353410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObXSSq+fxnOlA4Osf6a7oPbXw+WxZOh3yT+SRdiIOyQ=;
        b=hkZPDs5o3Bl/zgfJKkRPRB7uzUWTkbfkS2Xy8kh4Qnh34/rm6OXtzeph1KI5/Z4SXc
         Xgds71RBtCIemfWKa7x4u33sf8BBEcxL2QRdphrEUItzoxnC6UZm8I5kaph/k2k/ezlg
         W4NlFQ/YGvgMFtPSnZyB7BU2RWHwPr21XrG0xg9JUHFJU2S0MuUWyPxC9okZKYf37rlR
         4IW4X5T1oRqQr7F9QdXW7xzOchbwZvLWAQISbZQevMmVeSWJp6r7EfSMk1lDJTDIJjSn
         eOozJoQ62dhyaZp8xMkugOSx55nozT5ZHTKYReTHeEMgjQmb5slBieAo/AHyeDTb+p8D
         RieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748610; x=1753353410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObXSSq+fxnOlA4Osf6a7oPbXw+WxZOh3yT+SRdiIOyQ=;
        b=vPIlFRA40ud0Y2hhhFa7gDQmnMREZLDfbK8fSKnaOnMM2d2vfuZ81hgKj+LPwrSIFZ
         nCOUceRKjuwFXGsWaN67HI99MjsAzjGROFtuTziCapjGMaGpCXfaGGokByIqDcxtziGO
         qOWuG1A6inRDrlOEEtyNe9h0LMUs/j3dvE7uIRun8EuZIZ2q/r9bFrsKc5GdYcUMDZsg
         PUUa4Hx7rCgZNLrqzJHESV5jCFgnQ7jwGb7rXxqQ94YlF/WIalAK5sFtsdR3x4fNB0nO
         Y/yxy/FNMCQGEL2YRfOHy+OCfTF4AaPjDgalrvwX7R33KE4ZzpADgfiYF3L5k9h5TyCx
         gIiw==
X-Gm-Message-State: AOJu0Yyr9CoXwYRB+17ImhXHY8TdOGbodg6SaLlNvcM8OaP9/yXYDL8A
	ktAU9HMHpOEKXbOyvAfa+MrDbVDHvTpoAO7LVzuTgeY52sY7W8DuO1wEKIQ3SoQJ
X-Gm-Gg: ASbGnctQP6ETfa+NWuqQULa7D8MfMpOXS+wB8I34FY8rR65lBGYE5D1Cx4N3VX9BlRJ
	o/eUvwOu0htHs38EQ68kHiWVWi8J8J/2Bm+plzmopXk/NMI3GFSgjN9xnL0n2cNbQMhXeKRzNmv
	vkE7zwZdkHH0DrELKwGSwfg1sI9KiPG1Sq20iC+RzQ6ShqoROzwadmlSz9mOn9YbZ/NujlfLSHN
	0piLWwNP6kjJCBOLA2TyPWV3hr/oB5m4O81Yd6g9PlutxGHV3b9NCWSUUfTD8J8n+hliT0uGTAN
	pIjswjRCXzfQYKqSWWAHcQ6dFwpx0f1vG0QLM+PVXnLHe1EZkD8rjRIx78KdZFxmXnJ6q4F42X/
	WEXhntpWyWxKp9zau
X-Google-Smtp-Source: AGHT+IGNSRWYUf5Ed96h1/qKRth0o29/Foim3LuALYwgVrUbJpgreM/03D1fvYlLqwI0DOXRmlBVOw==
X-Received: by 2002:a05:6512:2242:b0:554:e7f2:d762 with SMTP id 2adb3069b0e04-55a233f294emr2038757e87.52.1752748609625;
        Thu, 17 Jul 2025 03:36:49 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b78ccdsm2995747e87.221.2025.07.17.03.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:36:49 -0700 (PDT)
From: Torben Nielsen <t8927095@gmail.com>
X-Google-Original-From: Torben Nielsen <torben.nielsen@prevas.dk>
To: linux-hwmon@vger.kernel.org
Cc: Torben Nielsen <torben.nielsen@prevas.dk>
Subject: [PATCH 1/1] hwmon:pmbus:ucd9000: Fix error in ucd9000_gpio_set
Date: Thu, 17 Jul 2025 12:36:46 +0200
Message-ID: <20250717103646.4127833-1-torben.nielsen@prevas.dk>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO output functionality does not work as intended.

The ucd9000_gpio_set function should set UCD9000_GPIO_CONFIG_OUT_VALUE
(bit 2) in order to change the output value of the selected GPIO.
Instead UCD9000_GPIO_CONFIG_STATUS (bit 3) is set, but this is a
read-only value. This patch fixes the mistake and provides the intended
functionality of the GPIOs.

See UCD90xxx Sequencer and System Health Controller PMBus Command SLVU352C
section 10.43 for reference:

https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/184/slvu352c_5B00_1_5D00_.pdf

Signed-off-by: Torben Nielsen <torben.nielsen@prevas.dk>
---
 drivers/hwmon/pmbus/ucd9000.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 2bc8cccb01fd..52d4000902d5 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -226,15 +226,15 @@ static int ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	}
 
 	if (value) {
-		if (ret & UCD9000_GPIO_CONFIG_STATUS)
+		if (ret & UCD9000_GPIO_CONFIG_OUT_VALUE)
 			return 0;
 
-		ret |= UCD9000_GPIO_CONFIG_STATUS;
+		ret |= UCD9000_GPIO_CONFIG_OUT_VALUE;
 	} else {
-		if (!(ret & UCD9000_GPIO_CONFIG_STATUS))
+		if (!(ret & UCD9000_GPIO_CONFIG_OUT_VALUE))
 			return 0;
 
-		ret &= ~UCD9000_GPIO_CONFIG_STATUS;
+		ret &= ~UCD9000_GPIO_CONFIG_OUT_VALUE;
 	}
 
 	ret |= UCD9000_GPIO_CONFIG_ENABLE;
-- 
2.43.0

