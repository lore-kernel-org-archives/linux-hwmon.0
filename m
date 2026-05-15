Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189D63C9888
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 03:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778814213; cv=none; b=CWdrMzMNmfQz2Z5e5oTk/P2TYh8f1tLpNnhnQVWvoQ3PGtYcGdoRP69IVbq+O2x7mHqdmKPzV7PHt54Y39Z8u4dfyRntjFCLrFWX1a7yKyLcNF55jvEJZi7b5nbcfPCbWOcARtETynN/0Wlai2lsHJsaQd70sWiYwLXxjxBenlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778814213; c=relaxed/simple;
	bh=LE4iHKm4t9UfoFq/JD7py44dDWXkdwherx2HuxZ/YYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lq/1ATKh6tgmYo3D0t3u/k4EDg7enzRvcWY4u/6S0HNrEeRMuJV4bDr1KtAb8i0M52l2w/UbnVGLaQz1vBJNktDNuXXhbBCy1VWGII2JZe9ybxYuLNrBkpDoVgor0frAmpCVB6Jm063yKGcLEz5qmv0xRzrAlJHvwOAQBx4MM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ZXjIE5k5; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ZXjIE5k5"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1332772f6b3so7922027c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778814211; x=1779419011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sukG3LK43QSVOar4Qmd0GrtT53PCwKZDghqzgcwbn4w=;
        b=ZXjIE5k5n0agMDMRvIPITxpS2a7lzo4iCsib8uPY6EEfFWQEFEu2fjVgEHtMCEQ2dk
         JSb1JhWJ02Z9BGpE1XQxRSVKa+53WEbfXJRZtwWgJOHY0hml7PtmfKvHqHDv9j94s4kf
         vZK1TkA3/VYB+XgKCzzLIBkqDOaB8gYZjrsSC6mVmrhHdG14trGFCHqmMURqCUEN/Dkn
         xrX2W+2/HQMblrCBrrNOsk4oXOLvSCF20Q27hArnSrUdSFtez4g6eoSlEU26KeVM/DbP
         Z9qXi7W4f5NbLOI2aR6djCne6nx78CWgySHA7H6IejTUHokX4+lr8EL6Xjj1mTLO8Sb1
         BAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778814211; x=1779419011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sukG3LK43QSVOar4Qmd0GrtT53PCwKZDghqzgcwbn4w=;
        b=hCepQPntsTC4j0F+wf3C82gDHrvVEM/6U2g4Bnimb7Ou16NfjWZIXgqaHALIW3qDX3
         m8TiA7hud6/s1j+4qn6vOX8zf9J8TKB/1AS9ybLE4RnHb2olYogb6aJ8gSAU1CJKdUCz
         nE1eI+miO8FmaRRq1DuOpztr60fk514db92IGHLsJsKRJZ6aUlqI7EKTFn0Qz3dwWCBE
         vaV3X1v2W027tgtRCMDw5h1GwO66N3u5e7KBgRrpQBWiRxMJ9xyy9F44pIwNF4RyzFdv
         S6JYN7XvQpXcDC5x4qHtpQ7xrklbFmSSgJe3ib8/Gaw/OJEuEPSUc2gx/ahZGJwNrCf5
         2R3A==
X-Gm-Message-State: AOJu0YwEkzGl9V00Is3Bl1QYuR7CTRNTisabEsJnhyfXkUZBg8v8qNpV
	l+xCeW2vE+9mEqDzE2sWM+2Qou91WqmG/1RsxhsybEZaLY0Sru1fPnoX4CGpL2SkDls=
X-Gm-Gg: Acq92OHZo4dq/ATxbjq+w8JFWNnXzZZDkKVY3tsOqAY7FoFod90UUHaUacgJiF+hc6o
	dFyjflYYjoICByJLZNyTfNePbO4POzIsykVGXC06qWSeDbCSffNTwSC/Z8jw4OZ+G0xegdk50Yx
	PfjMKSn+/G9p0k0oxjT0pVWKbG7WA0CQe2XV6puagBcdeXWtdZbincv+YuARCplZAH93KzAe/SP
	MjnCTwYRCJARae1DKSSEdsJPlADdQyYMOUDhvAP7tPAYTBtcWWGj9ioq0f4z6YRngP8ggVVrBMM
	BERD7TQ4pOEDDdKXU9gBQ1sVNa54l2zMwLBzzlZpkjhb5SYlv7gKYcKHZOtCnrKmENmFg8OikNj
	cO8x4D73BPpGqLS8tXk8NNKBfho6lFZl4rqb8QtlTPZNqxkHNjE3MsmCkO32yytY4RD4v2OFyr1
	EbG8gwpFqrQXyjHMM7NVzeRklnpg==
X-Received: by 2002:a05:7301:608c:b0:2ed:e14:7f5f with SMTP id 5a478bee46e88-303986b4534mr1062366eec.35.1778814211151;
        Thu, 14 May 2026 20:03:31 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6f6sm6347011eec.17.2026.05.14.20.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 20:03:30 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 14 May 2026 20:03:25 -0700
Subject: [PATCH v4 1/2] dt-bindings: trivial-devices: Add Murata D1U74T PSU
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-d1u74t-v4-1-1f1ee7b002ec@nexthop.ai>
References: <20260514-d1u74t-v4-0-1f1ee7b002ec@nexthop.ai>
In-Reply-To: <20260514-d1u74t-v4-0-1f1ee7b002ec@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778814209; l=1648;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=LE4iHKm4t9UfoFq/JD7py44dDWXkdwherx2HuxZ/YYA=;
 b=/kCOYXl8ifIU2EnFxiX85D74yslO3ujA62IYMCclljKZkjlF8kisal3nsSXsDFuMMjCnbaVxC
 e+AZaPkft32BDikpqNhgtfb+pfX+iMQrzBsYQZnqdhXgpoiMCwTv8kd
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The Murata D1U74T-W series are hot-pluggable 1U AC/DC front-end
power supplies in the Intel CRPS-185 / OCP M-CRPS form factor.
Each variant delivers a 12 V main output plus a 12 V standby output
from a wide AC input (90-264 Vac) or HVDC supply, and includes an
internal variable-speed cooling fan and on-board voltage, current,
power, fan-speed, and temperature telemetry.

The host-side digital interface is a PMBus 1.2 port on I2C.  The
PSU's other electrical signals (status, alert, current-share) live
on the CRPS edge connector and are consumed by the chassis
controller rather than the host SoC, so there are no host-described
supplies, GPIOs, clocks, or interrupts.  Add the compatible to
trivial-devices.yaml rather than carrying a standalone binding file.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 23fd4513933a..19c8c7220858 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -352,6 +352,8 @@ properties:
           - mps,mp9941
             # Monolithic Power Systems Inc. digital step-down converter mp9945
           - mps,mp9945
+            # Murata D1U74T-W power supply unit
+          - murata,d1u74t
             # Temperature sensor with integrated fan control
           - national,lm63
             # Temperature sensor with integrated fan control

-- 
2.53.0

