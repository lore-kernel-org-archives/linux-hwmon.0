Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0C63D34AB
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860763; cv=none; b=IXfqjWN2WcrvXPRMV0ANkwTiOlmWq7xxQecXc6gL5oko4uqD8cNCayD8kyi1hZ8B8oaVKu8Euh9S18LM+329kOd6u8mTpr0D/uawkvZrSCw8wJ57ZHmFlqdFqKYN/3wp5c2j8ZQmAuMiHB1jZnFnfgPr4ckqZjcjAkb/SkcOohw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860763; c=relaxed/simple;
	bh=OGjx/rpqLanYJw8wyMx1GZX57lDgWW7QcL/E9ij2zVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhUWFcXpvl8Ga5kE34fGQMgsgQdDGsJXBBRys6vLff1hSgF42Uo/gmiHyUk3Mdg+y2WhiGZUIryw4nw7ZOyaAtsaIBxzmlnARXQBKwQYmfhgYz0IoaA+kpCiCXbpyMRpyOdVlwXgip0FQw9XuxXnEKVcpz718oZTzl2FmtLyBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=eKWmp9fs; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="eKWmp9fs"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c795f096fa5so2156174a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776860761; x=1777465561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=eKWmp9fsws92fCdZBlrnpG0AZSn2VbtHLfy0LEoRoy2Vg9K0c+W3+3kZpe4U3o7Bp/
         b+TsVVOYh6U5U4PCOB065RddEpNNpWQ8Fxy2j1J+n9XNYhvApU4/ZIMxonMyBrNUdKeo
         3r28V7IWqPwjN1WW/go3OUYR/tzVKB7dqxmsE4/IWA3droPx4GI/KSJMrpxdrgHT75dB
         ua7H6/xu0l63v9LDuzZIQK0zrxwJEsEHGvVl7EsHT5BkE3S2MZUkJr5tskGgeWDkOcwN
         oKD4PITh6nRjhv/9G7U8JUzuhor7fwgLaZWMYpXSEU94QW5BkuGj5WKENGlb9V7/8oV1
         CJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860761; x=1777465561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=UXOi7qXkM9jATBloO+JVDE0SPLcFOEM6a3EBxx01DnGH2FQcYPvzD6clOwHmH+c9GT
         n+hB6qBELY8PK4n7OHLyaYwvs2bFHbum3he4hdYZnZlIJ5cub2cWYpFFPd/+bU8DHV/H
         7Ll/MF0fPuiSSwaVxvI0El3ulDT2tb6kogQ4Vgmgvsnmqwry56yyWKtrls/odJ97JsqH
         DBz/ljFPuhbCicGs745zMFy0JWHe4KuNBU/+LateGrkSsVhlzqSfl6xEuxZyeX36jYTz
         MfMqrFfbyouvJ0lqwCfakRtn5m35C2dUeBOermizOsYUqni9mefwEeNShgIw3wPM3c5q
         O4DA==
X-Forwarded-Encrypted: i=1; AFNElJ8XmvblOonvzTlZ8CwyGfE+/A4CG0ecoFrxwPGe//3aQSh+euRJQ+SIZT6ZVPW5Q1BxATivEKp8IgDGpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwprHe6aj157HWG7gkWTRHH/rotFM4EDK7WQi2fXSHbUTgr+rNk
	LLgH07bPgz64fCA/FT1bJNFJBPpma7Hvfx/u1LMqqETysepoENRdVeef0Pacsp3TYco=
X-Gm-Gg: AeBDietQ2B7+zxA7VwxQpmxFGTG+oQuVvOgCaYa27gUzeCf6tsfoj5VHTvBqrj3+1fO
	+E7NHhq3zxVFQ9pYEKpzPetZS5CykPiXbZ/FnLJp4U+RaylqR5cNNIg6P8e/vuT7NG7v8hIrrSJ
	UzLv7NZAfwBXUMkQa46ZZDyxJf2scNEKKXstCycTz5p+7gk5NekHvPq/TLq+kl079REszj4XamX
	p55IZmBQDetDfUjQYzmyC3JLshT/nfRJye/qms/tV4AJK0j9rfnmRIjf96wJGx8S9cmkH9vOyKe
	Wb5hxZ2i+lfiGP+xoaNxLz8rtosw4tLKAihwNkAGfL9pRFS3iJ0+NMZAcEwP7p48uw7gv795Vqx
	xSXehSVCO9W1koLXXq1O0oPJSF66lQreTB6eL9iJ+ZCBjRYAsaz7/lgwDD9BwuFXbZLMgythCiX
	2tT6wyzRxbjaO9YtcP0/fOmEZlI95bfFDYuhAtuQcLetZEd3OyjGdtCddmptvyFDoF82oOzND0H
	w==
X-Received: by 2002:a05:6a20:7f95:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3a08d732e29mr24158916637.18.1776860761549;
        Wed, 22 Apr 2026 05:26:01 -0700 (PDT)
Received: from [127.0.1.1] (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819fesm17218079b3a.4.2026.04.22.05.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:26:01 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Wed, 22 Apr 2026 12:25:49 +0000
Subject: [PATCH v5 1/2] dt-bindings: trivial: Add q50sn12072 and q54sn120a1
 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-1-b8fb87262868@inventec.com>
References: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com>
In-Reply-To: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776860756; l=1150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=371ndBFO++Ux/UDUOyIuv35ZzqLJAZsYGZPm32hIp6Q=;
 b=IzWae8Mww4Ny97twVr3hE+lT7MvxDV3KUxI3KzINJ4tIlpgo+6l2rXIPh04etPbzCBIxDnm5M
 /dha8QRwdLEBx4KAmCjcL7xlBihhyLsW9mgh6d1EeTIK6x6s8o0pZ51
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

