Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A837AA7A
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272149; cv=none; b=iiSGxJo7PoF/H02xxcD/EAikzNYlzfl8tN7nSnb/OaMiCrqIg3DxIHgZnK1O3j+UXuixmPkxYWRAZ0DXJTwNKSQl3vkd34TdEeFTi8rknXcFBJXxnU3OtZ9Wg8ENQFGTQ+sLz8L7aWiYIYTlIERwyle3LFrvMfYcKpSVie/Onzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272149; c=relaxed/simple;
	bh=OGjx/rpqLanYJw8wyMx1GZX57lDgWW7QcL/E9ij2zVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5/DSLclA/tyaXsBzaibyXK+b4YSjrJQ6aCK2I90KVH9uc9v254zsp+PoKsqMM2r6NShkcYPD5clEkFSM34R/i/B4Y592vei5wGBpPcWgAFU/IEZPDmZajaNQXp21u2WXB3mm70ufCYgin6X8wU8gHcizFXsyOiAgvTE/Me5t7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=S3a3YhOg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="S3a3YhOg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82d0b68837aso5911419b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Apr 2026 23:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777272147; x=1777876947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=S3a3YhOg4fgpwmPhxRA4m6DwTMIHYmntrsRnalAbPOpCDyjeI1ttxlMZ9wILKuYlag
         Px1dqfZPI9deEnpzo461dFRV5rzzegiz/1vhyG+utWZttxQIWxl3TB4pP2XmsJFAXnRy
         Swwi9O0MWaEuH+agwNIrY0a6pVOFD2DSCcYwQA4aS9h+JF7xgmeYzXLUWXWGGW1P2vt8
         no0JLWa5AEDgmZt0Ae+v0lvj3+K+3Ielt+t076vOV6h7+3q4PhkelUj88ESTPx+WeEJh
         hadi6gQ4hFYwPtLQ7ZpYefjX6ALA6GQ7b5W1v+3AZTmIE5djqKiLW1eJ/RPcPxl4r5i+
         DaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777272147; x=1777876947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=n+q7S6XE7R0XRKPZVg1pefAuUn4z4oTu3ByqjtTyV4IlJZ6+X6u8wo0weYcgP4LJIe
         RPmzCMYzwp9NG5TiMnXc16YFGyOe9QR3ZTB2rzgFD537Zd0wytWyVp4ieYTs3ekk9O0f
         mUe4UdJgb1oAFb/iVYqNcs+YUdl8QmO6JFH2nI8k5KaC6iXHH5J32WIq9Z6la2Fcl1Nl
         HPqAnxKF82CTJDdWWBLDsI5ERs+6KxTSwaSKdlU8qVFRmJrxrkDiM9Z4nEOujSt33n7K
         /Ghpu/b/dC4NlD15/gO9WnfGIxe376lezE0IOXNqIlExKATE3OqzSqvKpE32gmjpUUTe
         2BVg==
X-Forwarded-Encrypted: i=1; AFNElJ954qitrs98iZwGJKIXm85n+pw1TwaJOTAFrcEVn+hFB1bZ72gqXD3038gRHkXLr9rJwRI9tUjx8oX21A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxww6ajmd78kb0D3+KSroeb22QpHOdlKbuFN+bLyIGAcIMIdwK
	EZrKxWMHYxAoEE4XBTBZ/SS8SmXYs7zz/6cPr32VPvSWfjdgKcbimpv0g4/VciaoaWU=
X-Gm-Gg: AeBDievlAdBvGQB3kGm20jE7waK9YB6wPbtPR3LnVS5eYKFm6Woom060q0OjjgoDTR9
	HL5EYBpJEAmnJeO1ypWDtFSq0hQuEhvWyvuQByk7G9N6UQlKJBqwvKGT4+OfiKKRYcm/3jfWtRm
	txBw8x9st/SYd5JzdzoYGI8F0FzgBSKEu7cEI2E+rkO8LamMh/xo+MKg4jnuHzspJZo0wKPfK9p
	m9gH+SsR/ZzHrl4/Wyi5eQwxKPJYgD8H8WxpCrdQGTH3G7ZPp0VRm5uxqvjroqsS8eEJLoyAWgM
	bg7VB49UHnwDU4hEBpEQETkcMqEP2KkAHr3wv2RATXC4MulDUJMiccAU7vED/qQKDgdKKI5WqmM
	jTdzn1aAWEM6IdRWanaDchM/tr22+5BuQk1/DxQFs4ky6NBumVrJK/zKqe15q2cRBZlgo3KArAu
	+SeG1Bd5H7wAufv/BZ+U5V25Wjh+KXTHIhonW0Vc8ZTyk7GUzGgJxSGwuzdAZP7vns4poe3/pvc
	19P
X-Received: by 2002:a05:6a00:1c96:b0:82f:1aeb:fd60 with SMTP id d2e1a72fcca58-82f8c838f93mr41143126b3a.16.1777272146651;
        Sun, 26 Apr 2026 23:42:26 -0700 (PDT)
Received: from [127.0.1.1] (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm32209315b3a.56.2026.04.26.23.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:42:26 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Mon, 27 Apr 2026 06:42:18 +0000
Subject: [PATCH v6 1/2] dt-bindings: trivial: Add q50sn12072 and q54sn120a1
 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-1-ffa77bfa65e7@inventec.com>
References: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-0-ffa77bfa65e7@inventec.com>
In-Reply-To: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-0-ffa77bfa65e7@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777272141; l=1150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=371ndBFO++Ux/UDUOyIuv35ZzqLJAZsYGZPm32hIp6Q=;
 b=ibT1eMLWzWgUxQeXo74bGaCtKLb1EeY56CjGi47FvPmxG5mdP/PltdLSVegRag5o0bjedqqZI
 MtEzxn83IxhC5kigq5Y7DOJiQlQohIxboIqqxCg3Bbeq3vQs4gxn+gA
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

From: Jack Cheng <cheng.jackhy@inventec.com>

Add support for the Delta Electronics q50sn12072 and q54sn120a1
1/4 Brick DC/DC Regulated Power Modules.

Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..d4b78154df82 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -96,7 +96,11 @@ properties:
             # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q50sn12072
+            # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
+            # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sn120a1
             # Devantech SRF02 ultrasonic ranger in I2C mode
           - devantech,srf02
             # Devantech SRF08 ultrasonic ranger

-- 
2.43.0

