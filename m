Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D332B1509B6
	for <linux-hwmon@vger.kernel.org>; Wed, 13 Nov 2024 02:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731465637; cv=none; b=pgNPbbt+ZHyAnTwC+i3Z3RcnKFVRgpS8Hi8o07CmKSX3vYantvqucDshpzsN168eIKEsdJfVkNPhcoKQ7iVh2Dw8NHQNqYyvVcokVS8dSno4Y6SQyjPkIeg5fCKJQNpU9VgEfY+VP2tWHDhy2Y+JrDSbnkn4SFF1HbGUI7XnMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731465637; c=relaxed/simple;
	bh=8lt7eykDFZw7fIigqij0E5lpK1ubBDThz9WowdmROho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jl8ubSFDzCQ4OEPrUFlN+RGEaK27E0870sEz7ZJcMW0vYyTDlSArpeunvsEHFKToCyPAXuh6TKzsNYbNTFLYmCdWuUKqSXuVgfDkq7JLGIY2DXGGSO27MeHvZT9bGyQRJw2C7RpI8bx93u4zpbrXjB2KZ3BxU6MVtp7ANcgvg8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gE7I88bB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gE7I88bB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20cf6eea3c0so61055875ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Nov 2024 18:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731465635; x=1732070435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjvrd2avQzhgqp6lHzhNNlW4+aoD1gw3mVGy/cwxKNk=;
        b=gE7I88bBD0HdWSXQlYMBNj/ZD7ByCp6yeH/JxP8Ln1zfoJL/eypAhjCrZFiO54328r
         4vH1nXWQ4THu7TS0L4dRRWqukzyIbyQU0ec1sO3NwOWjZ3tN0/DjB+qTFcd5zfMZLr2p
         L8jenlp0k50FBeqqfWRzsxGWAn3Da5F5yU6Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731465635; x=1732070435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vjvrd2avQzhgqp6lHzhNNlW4+aoD1gw3mVGy/cwxKNk=;
        b=MzIBcgPa9It9SqZDZ55qjAESR6VfgPMZK9VwAIRnMicoQvc5CD9kr3KVCF8EAWnO01
         AM1oANFbtd9gvUtNpT/yiJ6gKqGm70oXYM1KUAn3yrXRcIueeEMmrge5YGbt5aRXC4k+
         FzeUGb2GPyF7D9QTtuKYX+NG3JrdSenMt9DlOcGM2UDU332mntvZ1YIxhBLmaqa1K25V
         IXXBCtXs0kt+J5vYD3d3ymA+YWd6o23NWQdBMixqmjB7wybRVhW0visqjuZ/ySKy86nW
         H1IfiMG+bpz6RjYjedcjbPOWu6lhrmr/rKBwyfqajHQmZRcEhj+68bWRsP0IJ5/9Ei0e
         3uew==
X-Forwarded-Encrypted: i=1; AJvYcCWeyGdogvvPO4FTZvLld2J4EQMCMINkqRKkW4gSc0flEgsUEVbXTt4IWHlR7/PoIC+szmuK6fjFtXkgHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz98xz+TXiKhQ3e36mWoiH6mkurCkZwjdq4fDjEQ7z0aBr6Q+Cj
	SWTfoTDn0alNbu51I/zDJnX9UCyw8lyp9Dxlx+rRgXeQw58vF3kPIaTi4T4gGQ==
X-Google-Smtp-Source: AGHT+IHe721yXQHCRZeRjkW+n+uLrfYbkZjFfwy3XKSXli/Bjhg1eEXBQdFZlkHS9zXTLG7hxYMmCQ==
X-Received: by 2002:a17:903:1cb:b0:20c:bffe:e1e5 with SMTP id d9443c01a7336-21183521d84mr274072955ad.19.1731465635278;
        Tue, 12 Nov 2024 18:40:35 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:3dd4:86fa:9696:4236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e418d6sm101831325ad.142.2024.11.12.18.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 18:40:34 -0800 (PST)
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: 
Cc: "Sung-Chi, Li" <lschyi@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: mfd: Add properties for thermal sensor cells
Date: Wed, 13 Nov 2024 10:39:52 +0800
Message-ID: <20241113024000.3327161-2-lschyi@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241113024000.3327161-1-lschyi@chromium.org>
References: <20241111074904.1059268-1-lschyi@chromium.org>
 <20241113024000.3327161-1-lschyi@chromium.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cros_ec supports reading thermal values from thermal sensors
connect to it. Add the property '#thermal-sensor-cells' bindings, such
that thermal framework can recognize cros_ec as a valid thermal device.

Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Changes in v2:
   - Add changes for DTS binding.
 Changes in v3:
   - Remove unneeded Change-Id tag in commit message.
---
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index aac8819bd00b..c7d63e3aacd2 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -96,6 +96,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  '#thermal-sensor-cells':
+    const: 1
+
   gpio-controller: true
 
   typec:
-- 
2.47.0.338.g60cca15819-goog

