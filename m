Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA52EC56D
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019476; cv=none; b=IJuFL0J7FD5SWsa+8NQAKshqFpG9CdXY+xDsVMmlJxN/xICNiF76xAeKfNx8XbHihXbdSm7rcVAWcT5CDnUk67hCkdddnh5ekPFzllkgdOgDgm48Kzk1svsjGz/B9n0Ifo9R33kVR2pQAMA/wsvzoBa/PXX1Om2raN08r0ktmXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019476; c=relaxed/simple;
	bh=x1Twx8+kWz2RQ5t7uN30kKAHHBIKwVW+KmQ9s9g7ifA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQnGvdpLsyw5aLn0h9pG6nZyfNjW6jAT6eGB+V3fYr8e8/T65S3G/qi9gAoEIxZQR7a3YVJdsqKqpRDi8NIayEp1zNeND0wT6RGcPPZ4yYgeBIyjG8Qs7p2XgPGPpa/1QgX6qWr6Nlo4fUxM1jmmZFtP79epddPzVBwpWeci1sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8hA41ks; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8hA41ks"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f47610542so2251667b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 00:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019474; x=1770624274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7CfwT2DDi0khc1d2LSmdYOWoBYAWsTA6FV7mdcofhc=;
        b=W8hA41ks+VPx08jsw4W3a3kVu6SkaGxiFCAoLW2E4DCsKIB3ZUR0/34RssUENLJ12g
         L5QCxzohepo8xRSl3IduI/aremVJwAcefIGUGG0kOoopIjKIemGuOgByvtfs7hjX/r0E
         xSF4kkMAfj5mF4NB94v9Zk8TaIP0Imt0/Vy5991D1MDz8S7mavXK7qXvu+IdTlXA1PZW
         P5eWBJB5sdNNrYSaxvyvFR0oPkVui39uq9OAkvgsm5uhWiELnuRM2v878/bVNhbdywqE
         8zrX4kocn92JErKPFWq/tYe4qaEPAQYhbp2CgnROK7PjqS00UfkCOeQXAAMAwugrGXt1
         MFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019474; x=1770624274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t7CfwT2DDi0khc1d2LSmdYOWoBYAWsTA6FV7mdcofhc=;
        b=T+hKzGPz6zufcunTuPgoxWlM2kLoTga4DsePq9TrCgPcZqVglNIIL+LTJS4b59aRJO
         pBpi9YUvzg7QSF4oc4fWNuX/LbUBMGacNoiWERvXnBUtL489C/ugKwoQFeNiRNCFCUWv
         MEbIaZG9PmNj8fCvJniqltqB7eQmub+jWvG0o3G8n+/GseR1ws2qFnaipVS49KcA+IlF
         QIW4AYZtjS9brgg9teoDGXTdehQHmYsBZd+jCkunjHVdq4X2eHxQU+BFlGyDXNy1YgE+
         PL0n9DnzOtdv8FOGKwGmb40jXZG8nRnMMQKs9OqIoX8aq/DA76YOSCd3lJi55i4kUIeW
         I26g==
X-Gm-Message-State: AOJu0YypYvw0zdmavq1DDmd1XCRHEvosxnfPnu4gw1xBvyeWaF1iUFXh
	dIZ1WQTwmkpxI2vt1IR3f9qamAmGcujw4FvVGHKxj356HAcZR1UvP7iB
X-Gm-Gg: AZuq6aLer2IkRLDK/JQovPmxcTW0DMNG7YsieafKax5l0mamnU9hWa/gMVRLPfRVhP+
	Yqyj3ZGz8AWEWoEAGBRwcS/V/l6jUmzRYh0NzPOeZqSzcg7AohwZbhLdGnEKR2Bl+Mtwk5HRHMG
	Td853MBZk5Uc4aVhxikSiLzoHUqy+EXGVMVS/3nj1Ir/YJ2Nl1J7BCeyflPBrRHT9XJsHti77cA
	ha5R/ZJZSW+Xw8kmUUw9EJ+vy8/i4CVLFjTMPaoEjTClZCFezY4wqfRQi4OdphYpJXjA8zSLPLO
	F6vaKqkSDgp4Tkq05TLVZtS8IFUbb77veVZ32/S18gTYibMSTzTYC4a/qq15C3yhMNuq8OpHkaF
	i+7g4jaGy6BTtzvOGXQ2MlswYLNJ7PrB0nc3s+yG936mX8/+1QlmK6W1icbpHWdaXAAGG13YbuV
	mF8pE8ZAgslYSw40ebX+iFy20eqGEP+xLCWA==
X-Received: by 2002:a05:6a20:2446:b0:38e:cac8:f968 with SMTP id adf61e73a8af0-392e004d994mr11112301637.17.1770019474475;
        Mon, 02 Feb 2026 00:04:34 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:61bf:a770:ed27:c783:3591:cfc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a3356b4sm13596938a12.17.2026.02.02.00.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:04:34 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add support for XDPE1A2G5B/7B
Date: Mon,  2 Feb 2026 13:33:54 +0530
Message-Id: <20260202080355.53061-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
References: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add Infineon Digital Multi-phase XDPE1A2G5B and XDPE1A2G7B
Controllers to trivial devices.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..c017af9e5e8c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -149,6 +149,9 @@ properties:
           - infineon,xdpe15284
             # Infineon Multi-phase Digital VR Controller xdpe152c4
           - infineon,xdpe152c4
+            # Infineon Multi-phase Digital VR Controller xdpe1a2g7b
+          - infineon,xdpe1a2g5b
+          - infineon,xdpe1a2g7b
             # Injoinic IP5108 2.0A Power Bank IC with I2C
           - injoinic,ip5108
             # Injoinic IP5109 2.1A Power Bank IC with I2C
-- 
2.39.5

