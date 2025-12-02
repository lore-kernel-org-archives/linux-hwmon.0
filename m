Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF142D877B
	for <linux-hwmon@vger.kernel.org>; Tue,  2 Dec 2025 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764698171; cv=none; b=Ncx3vE6A4s1hQ/zT/GkFsI5DnWdTioSH2t+S5Vm9+1dw1tXIoDP1BjsQ4remP1l2LBctMLHM4+4Akg8OX7PzS3PqkyJHF/iOT8xO5FwqSbpgadv4wJTQ/2aBJlOF0/gmw0OeVZbczZUwfp/hjg+rr1F6DbPGxTSf9nOUJo1AVJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764698171; c=relaxed/simple;
	bh=Sm1TJsLugjHHVTBU9eOX+J0ZzXKdlMhbFNRgtkZfXK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hu02E7dvaOnrlSJ+E1sBi+AkvaVjHX398mocsnoHvP0HagTKbLh+ZcvCtIEc4nfGGqof1twJ1cQFZSG4GSfvka26XqRpffVpj2BJ+mF/mILxyjv7qbuHWlggN1Jgxp/brXFvILnAk48+KgODFkg7e2RVOmOjrM1b/GMSMQYxKUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HplFKdsN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HplFKdsN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2956d816c10so59507095ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 02 Dec 2025 09:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764698169; x=1765302969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsBL4a1ShlWZYhLRPfFIvAo1My/w18YNcBjeFswWfCo=;
        b=HplFKdsN2uMxTbX/6vvtljMLf8ytTszkH2h1N67vGJWwsdkjjq3OdiEss8eBTyOtNF
         5uk9oYcIRPoyEqZLBdYEMHuB0s8pC8hwiRYAPhvarR7WwBa8R+uDDhnlpmBZOl5HQMPi
         PqJkoKT4EmWp7BknI8+rMWy5IOD8pWzvoyBaMmxC/TVNFN82EUr4ylOTSUxVuQsshDCD
         HGF0ijN11akFpY4AewLn3756PAqxuiNnKyQNLZqZhBhpLtmPvbayNZ1VaqTzIFgqQ3s4
         XU3CB+fy9RcshZQS376fV/ZZbWBOvd5IpP72zGkCg/Zk3YKFrODG+cMo6fqByKhd3qCM
         c/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764698169; x=1765302969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsBL4a1ShlWZYhLRPfFIvAo1My/w18YNcBjeFswWfCo=;
        b=SH9o9zRDH6msVxFUR5dakPOWA/eNiCFblo5aXiNsbQXCEkxqBj3CEckBohCdvDYaQQ
         K1X44XEDmSeF34nRvuqnmBUjHsodOj3VHMhQKhyhkXYHZLD9UGxi8GuC3mHuUZpV9AeO
         adFb4jq7c9JB1jPNNz6K/UZh8Ec0jJ73M0AmSE6pvt0Jj2Xr9Wt8HAuSGFPeuox3Z5+K
         4xle9KuMfJcPTJyZdk8hWi4T48C/fHCWOqZCrBkyDdLemC6egQcXONUVF+XatD6Crd1B
         hRtQLziFR1SUcNWGEL+ULUra55SKaBLkEZhafjF9JlJ1jaTLqrvhVt+6czva5yMYxpZU
         rStw==
X-Gm-Message-State: AOJu0YwCDJjnsxeaszEe8zktnD1k8l5RsJmk7Pnael7sE7cTJfg3n/II
	nQN2ks41e9N+aWw/8B6hbBeJIH/vUIbEnDFzcFxJEmwY0CYtjI1PiqVDHr3E2jWG
X-Gm-Gg: ASbGnctNjlyTNn79BUZLW6f6P6DSJffSYOV9rAae0YsUKbDKqlI/c3xb6JnQaHi3K96
	1Pz72wPNluccLs/yM7UZnHbiMh8raHHt3r2xDN2lNj09N2xZx9TSsOgUyMkkxEdDRNbYKdL2eJr
	NpKJsCx8KnmxiNJGPzvd1RUhKRFbu8tBvuLHrxXEyzZ2wn7PxYkxICi0vcpqhZFTSorb97lDcnr
	gNmhgzLEu1Y3SbOw5o5j6+VgTiOZMMsOk5H3gkX3wScOEAqDfoDhQxwDxGb0TdVg/ta9bRD9xGy
	/UVjSxqaeEoUz6KngRfOJZWpuqM2fuu6BimheJQpLXB1ZHzTaNiJur2c1zPWt4tViOOYapMV1aM
	Lq2uoeB5nis0GInPQTilo9uIpeJvsm9AFqlCXON5bxYryLRO5WqJX0sJl4DdYRGMr84PAmtNieh
	nCqoluXT35DRsWApP8sNM1p5eOoRTLK7rhNiUAmTqtFKTBZtclrM49wS91jFTz+CuT35/eVDj7T
	g6iTWHq34X1oXatNlYOcjVsD+jmTW3n8PMIxLW5ysw14eLGShWwgM32E1nn
X-Google-Smtp-Source: AGHT+IFwDDfVSopHbo6xulB0WM1KDJud7F9TNEtVOs+678Ns8drjaPWu6pYY6Ju3zwj7SzEVh91fXA==
X-Received: by 2002:a17:903:1aaf:b0:296:4d61:6cdb with SMTP id d9443c01a7336-29b6bee38f7mr520296995ad.27.1764698169114;
        Tue, 02 Dec 2025 09:56:09 -0800 (PST)
Received: from 2045D.localdomain (191.sub-75-229-198.myvzw.com. [75.229.198.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ab42sm159623585ad.5.2025.12.02.09.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 09:56:08 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] hwmon: submitting-patches: Explain race conditions caused by calculations in macros
Date: Wed,  3 Dec 2025 01:55:36 +0800
Message-ID: <20251202175536.12774-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current documentation advises against calculations in macros
primarily to avoid code obfuscation. It misses the risk of concurrency
issues.

Add a note explaining that macros evaluating arguments multiple times
can lead to race conditions when accessing shared data.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 Documentation/hwmon/submitting-patches.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/submitting-patches.rst b/Documentation/hwmon/submitting-patches.rst
index 6482c4f137dc..7f7095951750 100644
--- a/Documentation/hwmon/submitting-patches.rst
+++ b/Documentation/hwmon/submitting-patches.rst
@@ -82,7 +82,10 @@ increase the chances of your change being accepted.
 * Avoid calculations in macros and macro-generated functions. While such macros
   may save a line or so in the source, it obfuscates the code and makes code
   review more difficult. It may also result in code which is more complicated
-  than necessary. Use inline functions or just regular functions instead.
+  than necessary. Such macros may also evaluate their arguments multiple times.
+  This leads to Time-of-Check to Time-of-Use (TOCTOU) race conditions when
+  accessing shared data without locking, for example when calculating values in
+  sysfs show functions. Use inline functions or just regular functions instead.
 
 * Limit the number of kernel log messages. In general, your driver should not
   generate an error message just because a runtime operation failed. Report
-- 
2.43.0

