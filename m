Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F7715696E
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Nov 2024 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318685; cv=none; b=hM2LfLWlr2lzpMp8TOMdhwTcS6MCUeTcDNUaKMKAOgENPfNVTRJc0YMp3C4C0E6yBtur6KqIOua51V9NptP8+UzKumt5rc01RcT+oxC4rgGm24MtQ+j6RiS5jERqNZcxfDW2pguTfrWhC0S5ewml37sBN6ZNVVx2BJYgOU69cqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318685; c=relaxed/simple;
	bh=FAFR0+tSOv4I8gRENdRAuULdCjfZHDr1M0BGBxx8hmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rW13RpSpNyXqPyLVjq1res507iGF+UnY3GSbaaw/Y+ZlNeir3rtdXlweoP19TvwzH9tgdqWKKj/0p3U9jb5RAtrHZfeRpJE6IdHBN6p9S09deXiBmDHf7y4x1ql8KlYas7bIIw3oIierZ2vLr1qPqak8d16FFB9Pp0PPEtj9gdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=odeVkTyJ; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="odeVkTyJ"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e60d3adecbso2354213b6e.2
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Nov 2024 01:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731318683; x=1731923483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guSru76DQNk4jTAiYkWrlXoJU1Cr/ZCthqHp1IjuiWw=;
        b=odeVkTyJv1v2P0UX/0OcEwDEvehyj4DRJKNr8/0dAvf6PVUx3iCPfW5Xq99Jghuczv
         /A04CRdkwaHSKwWcc/5JC5+a+JBiU4KpCne5vKThi2gDfJRWHZw68x2W9MxccmjLqdUt
         t8uKL1BDdNUH3DoVkU/H4+kNIAK6+U/lKca0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318683; x=1731923483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guSru76DQNk4jTAiYkWrlXoJU1Cr/ZCthqHp1IjuiWw=;
        b=BAD/eXWJukG41wqcnFZhM2YOTX4JwvI9qVLzLFwPZcLGibg4gwRT1osc3kDP8yzrvB
         yMCe80Wp+DBRTy6VsDvqPCSqxfvAETRv2Go7uoYFGLaU8xFZjdIkazFosMc2DFrzhzRy
         G/LTkwsel9Fuj+uyYBRyNBfrQBDaM3gLptPFfcecCJmzsBy4HgUkxu6WaHh2I80uONj5
         SGn/GgNxONG0xxEpPpgwbH+DsCMGYo3jnOa9JwW9XCrmz3v5Aveqz9Q5y+uaM2gLDzSw
         duP4yetPj2t0/f8e4waYRDZqAgx1ffwCxGVWmJdjIJ/FzAqMkVgZanH/1cViakgkW/Ih
         YAQw==
X-Forwarded-Encrypted: i=1; AJvYcCU8vG3GozgGwU2ZIoXwZP7aR5BZnBhu5z+rA6ox/0rer/1tImyp9IDScOCb+fTxYumQ3YP0357zguATTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ2Do+1mNmSWvNW6P9U4juTisW66JjvW5kO1cDjZUD3t8H58gf
	8UDqaMWb2wuDwpIGnACf3+lJsjAQ9xTxsf3v1H66DH873mS7fDMM0Tmd84bA8w==
X-Google-Smtp-Source: AGHT+IG0E+pWn2Nhc1Tx7OrG49FBDcEDXCgNq4jPe83YpmSRM4g+0j589dM2a8bt6edqHtXly6EVuA==
X-Received: by 2002:a05:6808:1a01:b0:3e6:5908:1776 with SMTP id 5614622812f47-3e7946952camr11345320b6e.15.1731318682973;
        Mon, 11 Nov 2024 01:51:22 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:ec9f:d26:733c:7acf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5b48c6sm8075164a12.18.2024.11.11.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:51:22 -0800 (PST)
From: Sung-Chi <lschyi@chromium.org>
To: 
Cc: Sung-Chi <lschyi@chromium.org>,
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
Subject: [PATCH v2 2/2] dt-bindings: mfd: Add properties for thermal sensor cells
Date: Mon, 11 Nov 2024 17:50:31 +0800
Message-ID: <20241111095045.1218986-2-lschyi@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241111095045.1218986-1-lschyi@chromium.org>
References: <20241111074904.1059268-1-lschyi@chromium.org>
 <20241111095045.1218986-1-lschyi@chromium.org>
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

Change-Id: I95a22c0f1a69de547fede5f0f9c43cbd60820789
Signed-off-by: Sung-Chi <lschyi@chromium.org>
---
 Changes in v2:
   - Add changes for DTS binding.
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
2.47.0.277.g8800431eea-goog

