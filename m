Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5076FC5
	for <linux-hwmon@vger.kernel.org>; Mon,  4 Nov 2024 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712158; cv=none; b=Tv+RUfYJ60qcc3WG0TEzptc84n286qSEgzhIcyCcl5NTl/IpNK0vToOSw2OCVRnzjLFMKeXVtiIt2I28eAwCdBvO44JSF/oi3spolmR0YyKeEpvKux6Js9ViCpk6viZNO8VBix8vzbkyMooBOgUk/TkztNgq79FRyDsfIPBZrSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712158; c=relaxed/simple;
	bh=DBgTrbstgIrfs2aAOPjrRLfqOaoR8mlLG5lDgCgfVN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kzLTup2yQGyd/aUjW2g7lTsulOoIFQb////6eJ4iuniGL2KAIBbHhHAUyLmYYFSpNKqu/96ro46rXoZWw1RldIb9ufcjNC8/UrEcPRYTsdKfWq0xMrCwxSIHZan37twmh2cZfwpchjRsvMSpBYW8lQoJ0ztiyBhB/FuhBkMwyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=U/h+IwVC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="U/h+IwVC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so2460477f8f.3
        for <linux-hwmon@vger.kernel.org>; Mon, 04 Nov 2024 01:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1730712154; x=1731316954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0x8YfzKgLTDDx7pLL9ZIfdpCd48D9g1TybgGh/+DyxA=;
        b=U/h+IwVCaI9Z4IwpRdEH93qrEzOoWABRz9zET4XduXUPiqvOh9a7l+epkUeXAn/z9E
         oTehqEFINP7ncoPGTGj4fjBrPE06W9bukPRcVS71mFOZxMfLDfgeWCLrv+O7kdDQaygI
         K9ge5pIDcSmKSDb76pLLFOBxFltZFknm8xhwkYiQCRz0NDirpbOMWdREbgE1bi9QuZXg
         pAFdkIwzMaCkqTMzlS3FwGNkC255hJx9CCUE2XPHREVHtQr+Ps5Fmw3lwxmJ8IKfxHkf
         Hwr6RdMi+Ua/QHfGlXgp9MRIjZar/omkujqNYE1Arezo08vxvTQhXtIiaewDn/G0NVwB
         n7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712154; x=1731316954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x8YfzKgLTDDx7pLL9ZIfdpCd48D9g1TybgGh/+DyxA=;
        b=R9zE41AVQkw8yfGA0TGOAHFIIEc32CP+kisCruo5IS1IyxHYPRRjwV84NEQKiCpVKe
         JuV5csEF4teoWofe6AOvUFqSXJLgajo7Of2gwLUSZUP/I2p/dizVggRF/jxQKVvv50e9
         mfyGfe+0cDIPjmgv7qhXAQoNhzusCAahGtDZARayD176psIJsZTg8O0KKCIP/dNQRRc1
         woE9pcxlguJ963cuX44qPf3tUbj19mb8zeKlXXiH5iQ66lKy0CX1qbuw2/6x/moRx8mK
         IUHzMuQZOBlW5UiPFy7ZabhHOlSzq1mJXUBcCGUQNSOIgtssE+vQCASfxgjLJadRXp3Y
         tJJA==
X-Forwarded-Encrypted: i=1; AJvYcCX6gIA2FqukifiH26TCXYZZrxcGjBOts2/yg0zFS8FtVe19CEhYb4SKyGq/eYI/buOmeCDFi5SPalr8Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPievbcU/6g8usHAcYMnc0dj61/poFwMwvkh62GDDeSxAcwTH
	G78jI7QP4NIKFYafRn1s60GhX2T6nfK4rJKXMBXsgPIT3t6er/Dj8jrBuatUVh0=
X-Google-Smtp-Source: AGHT+IEP9RuCeHmDYOOToxOTcWwGxpvwDvs0FtYDNiDwDu9dBrotM0xovdSu4CmO4Yn3WMu3dC2yrw==
X-Received: by 2002:a05:6000:18a7:b0:37d:45ab:422b with SMTP id ffacd0b85a97d-381b708b694mr15447460f8f.31.1730712154262;
        Mon, 04 Nov 2024 01:22:34 -0800 (PST)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116a781sm12744872f8f.96.2024.11.04.01.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 01:22:33 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	sylv@sylv.io,
	linux-hwmon@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Naresh Solanki <naresh.solanki@9elements.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Date: Mon,  4 Nov 2024 14:52:14 +0530
Message-ID: <20241104092220.2268805-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on IBM SBP1.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in V4:
- Retain Acked-by from v2.
- Fix alphabetic order
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab08fa..c79c74ab3d78 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - ibm,everest-bmc
               - ibm,fuji-bmc
               - ibm,rainier-bmc
+              - ibm,sbp1-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
               - inventec,starscream-bmc

base-commit: 30a984c0c9d8c631cc135280f83c441d50096b6d
-- 
2.42.0

