Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B09E2494F5
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Jun 2025 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315932; cv=none; b=KzMRwQLb9U19XmI5+Lr+fsT7Bq6jC5uowjk59jZAfI7tgmAYY+fMD18WDKnADQ4yc6V0/DvOEfFp3fPWyYQEayTM0/QW9athM1ibxOF83cRmpyGI1tLJkwrkphTmacChHiQpn1+27hhndMZXwPHhYw+zJMbgmxswYBcEqu9fR1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315932; c=relaxed/simple;
	bh=vTkAa9ab8P3d7M5ZfBuJWat+nu9vNVeDtEHmtLB9ffM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JEbyV8vTmp0xwFlbkSDv3Mv0pCzrQ7/gpsQBf0x34fJ6aReF/n4LJ9vybEsOZB5jl/P5yXmcZRaC4QSgxOKN0pjUAthKppz1t1bNPW4xOVBAAJsTjJEb/vqzooE/u9g8FLaQz9D6R7MQySRHeXeN15oItihE3FiTcAM5o5lX5A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=JjOEky1Z; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="JjOEky1Z"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so492634a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Jun 2025 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1750315930; x=1750920730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyc/ZwsFTwGzAn7NCPctGLPawAwJLaWNe6XZPrsmHNM=;
        b=JjOEky1Z3TYZeP2EHWMmMi9dCKcMmS7uukhcIu3k/axJbpxMJiD+U6MCf6qgV+se+7
         Fug5nVujkKDA3roESccYUqbuGlE1ariZPxsgtwkC+PSZpagC9mGUPoXkgt5OuRLtbQoA
         mWe3LOXZGt5UHJSHE31e/F3Bhk2X26aleymzOxSJtbW0F54ra7W2gmNR5J7aKTej9jYv
         jNsZBbRu/LKmSYjpC0ChB5TiQsTfQcNxFYTBrw8lu7WUBsoKP4XjwhNsbb/SWeTwl8pG
         8k6JEAF0dLMfzPGLnF2ITRRzZphiyCot1NKxRlBZJFloZxL/W/VgSqCgvzwiuHipr8UV
         oQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315930; x=1750920730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyc/ZwsFTwGzAn7NCPctGLPawAwJLaWNe6XZPrsmHNM=;
        b=eV4q0VFqq9MI0madi2jJ1NbJlDGbB3/HqbP9A9fbRCeQkcyOhfCVsieDLvakKjJijj
         v5GWE73RHs9y9WnV8ufJpsRBt13h+LUWc4P1Ghqirf5Gqe0ytBkk+xE1yApBdCO7lPx3
         FTPTKBPPG0c5IGBOjNupjTwUsNKqZzEdst1zUz578G6xGkJHUEhR5Z24GJYM2It4PNkF
         64GbbKUhR3BAZ6ENuVifTYPBowEQqvNa77thbfJ3wP+pdssQ6FJCSg0na1xZFXxX54H/
         OPrtKxB80/StVcHHyeTZb7jmEGozP+07t/Lh7KVIYql7L3jr/XP8GE9p8qZmYh4hVuWm
         v33w==
X-Gm-Message-State: AOJu0YzZVjaJREX14GWzwA7EJelNPwDWYqrLCr5F9VHu9srSToktx+Wy
	7ImUMflbQ2JG4j357xS4gXi3OGuosGsCqkc6M9/jblgQCLkG2kIICJsdjC7yHLxTEVY=
X-Gm-Gg: ASbGncvnQbUwU6RTbVAjK2dwU5dvUpUyIbQgrLuyL00CJwZfVkTCh/MIl+s1CQpS5P1
	DEQVQ+mkReJmgda/Ewzf3/D/5ji3hvuNSMiB1CdbXcMoYd0EJpll1I2YwUh/vYdZk2ug1TVn+W9
	jrrbD9M+8MkPO8czYzgO+FqR1L10m+idISh9gxEnSbYu/uE1AT8AbJ0a4vAOb8YU2LP3uK6MiYG
	YNoMzqDC7pBIYhglwbzDawtS1LWOjk5PDlrwFiLdiH3I+LELlUUeanVoCwUQhrYgX73ddgxvEz2
	E/xOTEYMWQW2dQu4WQF1KK14jDcIttZZYT2/odofI/ah7aZgvYq6FBjhrN3kEJXOHIdF7D6jIUN
	cveKhJKMEgD3ahjztyh/+Ra2WK3yuQQnVVGXys7QO7P4=
X-Google-Smtp-Source: AGHT+IHFllvzeC+jkwZRci77Xq9jPnNMVSwy/rv0obWLKmjC4A3qh3npkrSM+CceheH60WMDv9owuw==
X-Received: by 2002:a17:90b:1801:b0:313:db0b:75db with SMTP id 98e67ed59e1d1-313f1d8008amr34611806a91.33.1750315929599;
        Wed, 18 Jun 2025 23:52:09 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfdb9a0sm113108155ad.239.2025.06.18.23.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:52:09 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v10 1/2] dt-bindings: trivial: Add tps53685 support
Date: Thu, 19 Jun 2025 14:42:22 +0800
Message-Id: <20250619064223.3165523-2-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619064223.3165523-1-chiang.brian@inventec.com>
References: <20250619064223.3165523-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device type support for tps53685

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v9 -> v10:
- No code changed
- Link to v9: https://lore.kernel.org/all/20250610102556.236300-2-chiang.brian@inventec.com/

v8 -> v9:
- No code changed, correct the order of Acked-by tag
- Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/

v3 -> v8:
- No code changed, included Acked-by tag from v2 review
- Patch kept in sync with series version
- Link to v3: https://lore.kernel.org/all/20250515081449.1433772-2-chiang.brian@inventec.com/

v2 -> v3:
- Fix the order of patches
- Link to v2: https://lore.kernel.org/all/20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com/

v1 -> v2:
- Correct the subject and commit message
- Link to v1: https://lore.kernel.org/all/20250314032802.3187097-1-chiang.brian@inventec.com/


 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd5..a613b9c3f6ea 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -396,6 +396,8 @@ properties:
           - ti,tps53679
             # TI Dual channel DCAP+ multiphase controller TPS53681
           - ti,tps53681
+            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
+          - ti,tps53685
             # TI Dual channel DCAP+ multiphase controller TPS53688
           - ti,tps53688
             # TI DC-DC converters on PMBus
-- 
2.43.0

