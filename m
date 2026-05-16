Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853C3E5EEC
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778949642; cv=none; b=YbUPx4WR+XZrMJjeK9r1PKeJxU9BnlVLIBcbWIvvqkRufsno2dg3YkuBQVHDG73199rmIEgaWiqMPrLdLMMGocq0aUSvO7CfmpiD+igRe++loB7fNr76s7BGvn22aAE1UkVAFrs7aI3LWJGXnAMram3md/40ujmqWaJJgaTxQgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778949642; c=relaxed/simple;
	bh=NK7YqHRs4nyjGwzGqAJDFJyW08ZuhszEYyz6iuH4Xfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1+KGk/bgfQ8axfxISUBRZ60Udek/8kx5Fjaz9qczE1PRiEIO9SQ0L2q2RuLBdhQMghK/KDoK464jhetaNQL8TwDIh9pxc+8c4TGzfXDoQmLNsirLqBGUP4xcasEZX0kibEX1sAyht3JfwBYVak0YcoeVOF3q5KRa3lDrSD96KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnAsEdoN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnAsEdoN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-83d31ac4017so367833b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 09:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778949640; x=1779554440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBIdaWnYuc/Npeb6Oh6KMBYaEw3GCxevwGqd6QfClhg=;
        b=hnAsEdoN79VrRJdy8CIrqSiqiGe9eSk/kqUK7711HdP48nEE0pRUqWUlhQ7Zy2x/N/
         cavsCThiwnqQ578QunZxHrPyoOeiqKighjIMtU7aFq3JaH6ENBvk6dWfXUEgnT/jRkcJ
         dLUUBuqH2p6gKLj5INuI116rLawJPwgeOdN/lOPoY97ykcRHZzK2e/751sYaxJe73BiD
         yQx2J1BpfS+yJ4XPQRKK54Q0Js8XRig6RSpX/FXkDHLUcoM4uzCxK5WFs46xtCGV5JGN
         ijWTj8NVSqCt6Vw5ybgKCjcB+ByxEKZPSZ3813FJPolndS7j+mFfQ2bgXRq1HQSRA1EN
         kHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778949640; x=1779554440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eBIdaWnYuc/Npeb6Oh6KMBYaEw3GCxevwGqd6QfClhg=;
        b=AJI9gfmQrFhhGGJcFcBqkQbJFtC8iq5cVMkLuJhFRHrB+ErUEwBSJRVz5p5ZFiZ+U+
         17TFVtWaW5oSRW+brMHXFwn0FHK6T0ppNnPPjz9EbVDlkjTG90NPvFQrwCJDdsLiyA1J
         kFm4XM81A6Hrf3Jnw/L8sjPzWZPf4cNc0rGiBGCuf/pn9HqJKReHLdD5Hw6071inI6E9
         m9X5gHJPKWuGQrxy+iGd6BNHBIM/s1BxsCc5yyIjsd5oiztDWS4IoT7SKosihIs8EC+m
         zb7GLKLn6I9B128VKBQ/pCms6FY1GscfGXz751wvVNejXUd7wshc8fi9Jo81urraXMCR
         qD/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/oKPoi5ZBMcQhlUHi3Pz1Fs6pciDzrCZ263J9ZKtkKPYTXkxVDAYMt/MBoKiR8i68+Rhz62UOmQZfm5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBqdeAVUOYxAr3yoOmTD/XnVtkapfyUOacGvR09WIDCTLhxWi
	1Pi9EzECy2vKBIGYcP6Rwx4DEfn/ud/hOuo10/ELYzHrzTYRdbFQSIYoX6pTtFHNA2U=
X-Gm-Gg: Acq92OFHKODXduj9UupfJB6lcWz61apZYVaDqJNG8UCSVuQSKBxN7xII+tWbo7hKpdp
	8jrabjuKKhttZMZO2Kc9ugQye7uxEpivndHWNmj6AD4QtD0qxSq5aHzgS0g78a5MHjBVVjyH7WC
	hDdcbrdYSbYgrrdX9rscWJK0hjvXxU7r+D8qRPyjOJ1gvGYH97KhUd+bkVE1bJy25p8FZUFRRNX
	++bwNnAdrcPwdTT8rYHsBA6dGGExSyMjq3s71kWU6cuGVub/VPowP0JjvG3/EeBFvzX4PTZUGkD
	EarVj4aj2zEYDx42lVhC1lc1ptkOQu5urBS1+tgHYT0tz724SdWjKgBtFPsKoLtKJMS6FMiaQWn
	qovGvmHCAbGMdtiMBVXI3nF3ENHCCd7QnMjcDm21DMuRkDb2QmKuj+4P9DuzxRfN0YarFK1naCV
	Zww9AYrGQLcRkR4theMKhfsTToIXwlbb6ck36sPD/t5kXzxRm942QS7KmzSTevufu0Vjy4dYSBg
	b81ie1Ckmoh/E0Ydzn6gighM0eTzlB3uVvUvAB/sl8CxBs+ly6/gCLWN8g0k/o=
X-Received: by 2002:a05:6a00:18a9:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-83f33d227c0mr8861050b3a.21.1778949639761;
        Sat, 16 May 2026 09:40:39 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-184-71.dynamic-ip.hinet.net. [1.170.184.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm9105162b3a.43.2026.05.16.09.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:40:38 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH v2] Documentation: hwmon: lm75: document sysfs interface
Date: Sun, 17 May 2026 00:40:19 +0800
Message-ID: <20260516164022.1792-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516160823.1461-1-eric039eric@gmail.com>
References: <20260516160823.1461-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the sysfs attributes supported by the lm75 driver.

The driver exposes temp1_input, temp1_max, temp1_max_hyst, and the
standard update_interval attribute. Some chips also expose temp1_alarm,
and temp1_label is available if a label is provided for the device.

Add a sysfs-Interface section to Documentation/hwmon/lm75.rst to
describe the supported attributes and clarify that temp1_alarm,
temp1_label, and the write permissions of update_interval depend on the
chip.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/lm75.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 4269da04508e..fa8ddcaa0c2b 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -181,3 +181,28 @@ is supported by this driver, other specific enhancements are not.
 
 The LM77 is not supported, contrary to what we pretended for a long time.
 Both chips are simply not compatible, value encoding differs.
+
+sysfs-Interface
+---------------
+
+================ ============================================
+temp1_input      temperature input
+temp1_max        maximum temperature
+temp1_max_hyst   maximum temperature hysteresis
+================ ============================================
+
+If a label is provided for the device, the following attribute is also
+available:
+
+================ ============================================
+temp1_label      temperature channel label
+================ ============================================
+
+If supported by the chip, the following attribute is also available:
+
+================ ============================================
+temp1_alarm      temperature alarm
+================ ============================================
+
+The standard update_interval attribute is also supported. Its write
+permissions depend on the chip.
-- 
2.53.0

