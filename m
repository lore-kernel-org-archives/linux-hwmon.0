Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8AF346784
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 09:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429709; cv=none; b=OImKnuVBlp+uV6i1G3gTho6FaMID48qzo9Kjc0sIfWL3HgaLyk5VlWsQpL4gq0QNF3cbUPTKcCOU8g7fffatDM+3Dv+9Nsoav/n5eDZuxgguyJ/boqFZOUFPWv0EAqlUh3qJpHYwkEqQV7jMkeLzHFWJMG5owjo3oX2i//VUr0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429709; c=relaxed/simple;
	bh=E+dbXB6xz43NwBCyouCYRd6qQtOa2PkfyCfJxIDZV0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=AxRXn61b1ATZqQeI9cDSIuF/aq1lNvAqo0V/h6dM81SMT5d02KPYBfxoVFyyJqIDM1QA/Jg+OwirSMkGK8eDV6rfOybfL69PP+0uS83rdI46R6iPxzBK6IDQ+x98Rf6rbEtee7CEHJOtnrO1fx7agJd7KBqDUAI7NlN9i8baqUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htH/9kEq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htH/9kEq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82bae83318bso2511656b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429707; x=1775034507; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpCh7fwsnHP9oYgpatK1nkKb8PCIU2zv9cH/KH380ZE=;
        b=htH/9kEq1SKvdGsL2TFi1cdP50jsdUeCSGZkRFFmE7v7NYVSGbRn5L5DRrUGHrWmRI
         1Ke0oUUfIMsY7gg9ATUrkvr6a2UMMpEyhtxmUXjmY5PRQm7TV4UkQEftyqpRRBxVyVbg
         2AqUmkofGaKgKSo4isuxYBw2yK2KGTp/tFd4m+ed7LiHQJEWrrRQXQNCCpkkRUnH64ny
         RPZfBA3wTv0xAHXS4HzUCVVp8vxdcFmUEVFYWzVfnTKs52OITRLKvwG4PNTPvELPWn3B
         XDmCvuIcn7sh9F1QtKi2CIot8Nugvv60QCERFSNMbdDznA1VHSTiAp2v0V9ENXbyys7l
         0GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429707; x=1775034507;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpCh7fwsnHP9oYgpatK1nkKb8PCIU2zv9cH/KH380ZE=;
        b=OJEyNOz7KbhJkO0oSblb1xxIHAXmEq5kfVTlZqsx3hgXZNynpBonscezq2L1WKWHIa
         9JOjoe7HgMciovLU3j+eVcignxjSHsKciWapWcjMHCQGQgnO+5VZaGNsSkvl+hAfwWeQ
         Id++pFchJqt/005jnu1OsScWhqr/Ytc0z88woCsLFz1GoiGV7V9z1d8BhgmXXztAU6pR
         T0zDtdnmyftnu+W2Grs6Trz4sXzs4fTY304VjhfQWuVIGl+TBklGZ8cEoWA2dk6+ghM/
         zCg7LHCcCenhE9nUKphrnnuGPyqYFICgkDFOoWdL6EkuNAtjHReYxtqIuT0TX83O8K8l
         UT5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2iOHMZX2dzrWv02LI9Jo+61IJK8nVF6czBGEzQO2G3WuKq49Aipy1yJV15y0CO4AA0Zghq7DBprBNSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFPKK0hYlCGplxDV8GWci5/GREh9UjWbjc70T9yKp5UKMvm0qX
	BUvJkB5b91YijmEEtP6xapDmhO1LAFjzD9x/ThRhXoW9yU3+p9+WFA2z
X-Gm-Gg: ATEYQzwKrbYWh4dYW46lC8sEOkeVxIwMzkLR4q2s8TjuOPh6QzwjUFQCIv+DEfLlE6e
	ZfmL5RrwzH1V0ASGE/R/oUjNijQsDI8t92WLD0V8AdzgdOywwpe+qLnq+TukGXEcEIxGwg6iOKk
	zjeeJo5N25JaOelV8qKhkfldWSzhGOxi8/e63SOcXygqEw8PVNf4VUCfoV7vquhT64XcU7DMSdr
	p6gi7YWK6Kl3dg9WIGKvBS16doVX50QumcMUBGlT9BNGTVAwYu93WosEhSrLxSfBLLAfc38z2kV
	hGFx0fHJXXwj/iEZntj9wI2Ftss3uwGyWLKIE0+r3Y9CPd3I9MogK4ODPSQ7Ev9cXP/shVYcpbl
	NkXbAjz0PE5E96ogI9KebcG6D1u1uWXc0v3jwHvmkO6LZyU75tc7Z3F9PZ5i6c0y3MqgilBPhpN
	ZMAKVzIJWVy2spwrRv+TXmmNR6nKeCJti9uc3FLUR6QCBBX5YbVoZ/
X-Received: by 2002:a05:6a00:3389:b0:81f:4a06:6f5 with SMTP id d2e1a72fcca58-82c6de85fc0mr2872060b3a.4.1774429707276;
        Wed, 25 Mar 2026 02:08:27 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm17476982b3a.22.2026.03.25.02.08.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:08:26 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Wed, 25 Mar 2026 17:08:07 +0800
Message-Id: <1774429690-129139-2-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
The prefix was confirmed from the manufacturer's website:
https://www.gxcas.com/en/index.html

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..354836eb8e72 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -676,6 +676,8 @@ patternProperties:
     description: Gateworks Corporation
                  use "gateworks" vendor prefix
     deprecated: true
+  "^gxcas,.*":
+    description: Beijing Galaxy-CAS Technology Co., Ltd.
   "^hannstar,.*":
     description: HannStar Display Corporation
   "^haochuangyi,.*":
-- 
2.34.1

