Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D353988E4
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760672; cv=none; b=YuEibsfi6CSXbeEEaX50bSft9k4wnwH+as4Lxi3j+lDgPr5Zbb60QGVsrseRLyKYue9VYykf9IDam9sjKgH3xhVqu0NOczgmqsf14a7ujzP3gv+OVhL4+TlPmVEgv+F+4QiwofvCjKaVdsm1tscijd+8b4WjmnKAlazf0GOhZEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760672; c=relaxed/simple;
	bh=H9Yf0rpxOss9GEDXnQS1IsLWNiy7/6juGCx5lgn6vOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZUqS/oWwAOtQaZI3d2KYFJUApN98L3vuhaK3d4btFgmsH13Spc+1JfIZQyFKI6yFU/4hIZpzOggpZB+sE1a7J1BYONDR67CQPQV6ctRMCc51UaqKQaMNSRUljsPDgT7xuvSnBwlLcbg5y2oizjArHtdt1r/x6OuwvrUkdxdxss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJAbAIQw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJAbAIQw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso20035445e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782760670; x=1783365470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QmMGduLBhwx3EIs5/1KFAw2vkZx4L+Ta6YhxTBavtE=;
        b=bJAbAIQwbpdFZn6LizoDvXzgXVVoeFc8D4Yf9p+jPx3RHg2LuPRoHSIc/bx3ztAEXS
         BztXMB7dXhYnbTRQHon8jhppSbEVmL/zUnHNozv0Y0CJhNkP7YbyOveWcnPvM3zOlvuK
         uT3oqE9PrszRHVOO8GwBZsxvXM/TJeeCjTvoDtUxCvrj3RFHmCHfsFsTFdNkWZ+1SM9B
         XFqiEw+TPN1eN6JJU7J2JZvrTR8ntS6pJ8QU1HdGx0gXUV0/HYWMZHlXyfNQQrw5lVTo
         zus+omBLNs3yJvLUGugQdjjeQxiTukzCw+Bve9udQfQ91prMMyAtz4Wf1YwJipFgnJxL
         f5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760670; x=1783365470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0QmMGduLBhwx3EIs5/1KFAw2vkZx4L+Ta6YhxTBavtE=;
        b=O3AaMOjeQd+p45jA9ko/lwP9ZPKl2xLVM6hOave7D9mMGP9Jbe2wNzbsFGqimj7ph7
         QRSMdO0amM/Ki8V0l1L1TqDWuOkHI2xDnaFKvsTR0fsESvmJc0ZSDAPXgCsWKQswDIZD
         2UbFPpCXR2AB8IHTOuG+DHk4caiJIZPSQMlA+VitZa5I2/srea4PMWl6n5JMEf/GdB04
         D5nQeJ34aqVAvWioiSGdFQ0RuarLgPcoxkCJlN25tlaqM5jWkoCCOkx3gRlzYc8o66z5
         p78T/+4sTrVrzCOmn4lvAUbpwPL+d0jHAwSs2xqHLk8Iv5mAx/ZdEa5h81w6w0bm4fzx
         4XbQ==
X-Gm-Message-State: AOJu0YytDdVlhs5WHv/jfPgdkdb959gLyvBHqYn+oT11R0Ry/5mGzidc
	0wfv1RKd2qHnU+n7Vc7G8JVccRY56dDcUQZQfpkditF6vJhpF4nh44ff69U7pw==
X-Gm-Gg: AfdE7cmrd1uyvw4PboMGsPoDIauVba6h+uj+RKNLkWed7hDiuWO0d3bKqv8EiClal9D
	zP1Rz6L1KcHw2brtNNbGz9IWT6zI0qv+x5QP6mW7B+ocmpj1WZX6dlkRTSzrfF1t4uDGSkjZt5w
	6pSQ3pp4TqPCaMUcVSA0DbdHPEFbyF4FmPk0O9BC/L49QtCUbXwtyp3x/S40cNBlU4xmWzdkcG0
	LiWiAffjm4Ks5STrgFpVDv1r7HXks84IpHNPn+s072g4GHxILHEN2U6+EiOaFf0HlBskXxGxAWl
	9XYBA6GQTGDfYeWpTMUC0jvf7c9AtyUyOBGeQPxAQPZxkmOrKqGxGKsAUjeeIXWLUcQz+9epUbw
	f03ckaSu7A/Z/+Mm52K4sin3RgafGp9qq/hvHelzjNeDpMNaj4a9E304nb2eXjFAQEebSr1OrrG
	Qj9kAHyK1183YBRFAnRyIaWGR26sHGTnB2vDZKIdrv2kaKZl458NcIFUYRySWq2asUy8DL/ZBfW
	ughjb6BIkw5Wenhui9VziynfVmmyIB3U1xBPRpApgPHcQ7r0OPa5kEaptg9fMHgvFn5Y7/wqdVX
	QDxQyjTHuw==
X-Received: by 2002:a05:600c:4f90:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493b82b625dmr13006095e9.29.1782760669762;
        Mon, 29 Jun 2026 12:17:49 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cdccsm259568f8f.24.2026.06.29.12.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:17:49 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 29 Jun 2026 21:17:41 +0200
Subject: [PATCH 3/3] hwmon: (max6679) add missing 'select REGMAP_I2C' to
 Kconfig
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-add-kconfig-deps-v1-3-8104df929b1a@gmail.com>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
In-Reply-To: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782760667; l=878;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=H9Yf0rpxOss9GEDXnQS1IsLWNiy7/6juGCx5lgn6vOk=;
 b=rtWWt61KymUgI++eyD6Y9xP7ud5TnIIu29BBNUkGUt2COItx2zEpPMHANzOs0u30bMaLI5h0j
 1Bblx/Cj9FoDprsY/1CCyIw59Ld9K80zYCgo+cEYiLB/hcEuKsutQc9
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The Kconfig entry for the MAX6679 sensor doesn't contain a
`select REGMAP_I2C` parameter, causing build failures if regmap
isn't selected previously during the build process.

Fixes: 3a2a8cc3fe24 ("hwmon: (max6697) Convert to use regmap")
Cc: stable@vger.kernel.org
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index cc593fbfa4cc..2bfbcc033d59 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1368,6 +1368,7 @@ config SENSORS_MAX6650
 config SENSORS_MAX6697
 	tristate "Maxim MAX6697 and compatibles"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for MAX6581, MAX6602, MAX6622,
 	  MAX6636, MAX6689, MAX6693, MAX6694, MAX6697, MAX6698, and MAX6699

-- 
2.54.0

