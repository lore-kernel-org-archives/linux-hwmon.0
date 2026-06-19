Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD5B382394
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872074; cv=none; b=GX4j/QL+yEW65BBOeIMdjqy1Lbs6RNG7X8OQxE9qL7bDJM92IX8R9g/oz5CccElHrUX6gtrXxomEt1lbaeX8uRF4eyzjncjf5wNucoC/pRIlZPtUu2yiVt7KvbsxQDHwZA2Tf/v7RGY+ZbqTzIlllwioVcEnOakoKwaOdk1Sx6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872074; c=relaxed/simple;
	bh=wZ0BVCkZ6ce5isOe/jcnLSQv1d54qdYvKIo0gvE3qfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpcnGBX/sngTodpeXzJ44Gb0iJiPh/K+RmEwS6s5nrHTGsJtlSyqVD2ztDwJNn25NlrkgBiWhLQTzsAM6dxbdcIByZXbYPEfI+pJ4Lo2v9XiQvJW9i22LNdC+Ib5uVa/DIYyL4Y0+fRhSeghte+u/JUuGQhnQTk2kUTllMFCOlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmlIvT/p; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmlIvT/p"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c68190ade4so23176425ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781872072; x=1782476872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6I4kwZd7kXRIlQDpaVicdpgo0wsKxK42taTZCo6USLU=;
        b=mmlIvT/pIEwkANSROEN7tGxYcuND2XIyKJWY4NUw+x64aCO48kRKIBcF5Whx6PMMij
         tkw+4anyhSvh4Y+KQS0eFzG0p4eoLdWa5Z0AMeg0EuJSK9vL8/O02SYDU/WTvXvqwXcy
         2p4wdT6rSgVB+fb1e87ARhOoBRCQ3pI7ETi0MKEIyy9fAZO6FxDgs7jj6lMcTkZI4BLx
         8TGHjKCMTB65z3bfasiZK02dvCqD/fFAY4GRJ5mY7q+omjDdnW5biDV/ipmBIJlecZpp
         DMkELJIYyrHEXAcMxNAQ+4kJOkgnb3XLIWR9inIm99rVg0ca+cVYhQVNmFOAZg/mSJiy
         H2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872072; x=1782476872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I4kwZd7kXRIlQDpaVicdpgo0wsKxK42taTZCo6USLU=;
        b=Lj1y7ZE5b0OlU3Q347Efm1/RKlinOkTzhl4LjdVPn6IF8aQohU4DpW+viJvyYVyBda
         FHhOINvmRuETOqDO7qF+MpqRdgihi2XyUgOa/u4yYscnJ3Zp2MDgeAO6PZaI6FXK6F81
         qruXiQ1tURAd8Z3ceC8QZUvvS9j638sOvo9blHXfa1mfyN0qopjNbVwz3aii58hY3OH8
         2CsnaZ/JCZL6VBKKM8UW7EY1+Acm1wLEGfykTw2StkURhkPRSK4aQTPB0I5LIgC9GtM0
         UaWTOaUpKklaUvIlP7cusF8JfRSF+4AXFPbM5m60DMZrY+U6a3oBxVkSbfke5f1IjbOB
         V85A==
X-Forwarded-Encrypted: i=1; AFNElJ8naB3+bJkZbaKSD+XTgUPum93vajhbz9Ulwy/FeRddAoPMpTc5mzdjTP6y2oWRQSzxjE8b6MoLiRpDyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG+gSuHCFWViu0MlUcuHmvk/Lv9cz6+UjDYr5oS0cGGmfT77AY
	j4LQdGesutOB0SoiOQEUMiQz59T3m00It/ln0CRreDXIGFXP7kyZakKb
X-Gm-Gg: AfdE7cmnm9DzMuLLz0J+jv5HiKxOyGeS8WenJcH4ISDr0MXRFlpbHtwsMi6Va5ihvu6
	b86M3k25S3QEN4MR66M+VCStgT0etKgbqWCx/5yBcC+YriRbvZAE5CeK+lO9nR/4038wGIFm1VY
	531PcsaCCShqy/jhoZY+XhpNaVVFepKu8vs9KIp/NKCyjGJP6obiXMIFtljrbixP1fjoBzrhovz
	D52mSay7iSKQiwV/reW0OM0fYsiBietkQ9BrckwdICQ56wVb++LTy8P3od/O422+5825qAlmYNP
	V7QPn4vdXaMQeMLlRJZd5OVps1yq2nyfmheWVaOeOpO7PQdv4A1PQnd2xzpt3a4dHS6JAsbfm3m
	t9M9QXZ577pSvVr94Z3cVK/Nm20BjgHcxSPEJPYeMGxCGagxP3zbmlMemyTsoH3rKklJ2K49992
	6BzsqYXt+lZ3rlKYDsSs0ZqtngCqYUJmM5VV4SdfM5dhrJ9aD0KLt1gl4qYu+K8F47LJZgSwVW9
	wpoTQ1XLNGpEMfD
X-Received: by 2002:a17:902:d50b:b0:2bd:3c21:a053 with SMTP id d9443c01a7336-2c71961f2b7mr26944005ad.24.1781872072091;
        Fri, 19 Jun 2026 05:27:52 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209bc296sm24046885ad.49.2026.06.19.05.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 05:27:51 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Luca Tettamanti <kronos.it@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (asus_atk0110) Check package count before accessing element
Date: Fri, 19 Jun 2026 21:27:46 +0900
Message-ID: <20260619122746.721981-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atk_ec_present() walks the management group package returned by the GGRP
ACPI method and, for each sub-package, reads its first element:

	id = &obj->package.elements[0];
	if (id->type != ACPI_TYPE_INTEGER)

without checking that the sub-package is non-empty.  ACPICA allocates the
element array with exactly package.count entries, so for a sub-package
with a zero count this reads past the allocation.

The sibling function atk_debugfs_ggrp_open() performs the same access but
skips empty packages with a package.count check first.  Add the same
check to atk_ec_present() so a malformed firmware package cannot trigger
an out-of-bounds read.

Fixes: 9e6eba610c2e ("hwmon: (asus_atk0110) Enable the EC")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/hwmon/asus_atk0110.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index 109318b0434d..92afb64c09df 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -1037,6 +1037,9 @@ static int atk_ec_present(struct atk_data *data)
 		if (obj->type != ACPI_TYPE_PACKAGE)
 			continue;
 
+		if (!obj->package.count)
+			continue;
+
 		id = &obj->package.elements[0];
 		if (id->type != ACPI_TYPE_INTEGER)
 			continue;
-- 
2.43.0

