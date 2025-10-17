Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192932D9EFE
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706172; cv=none; b=aWOIQs4kIHv1op4cOWYRSJAX9I+tPAehhAzKxiqNvd/XETmNyXAihL8hi3NFlsMut1F6ssD47o9j/w+aXJnBY5TCc/fAG11xA0FDHvsUD7ExoX7OWNjGvHfdGR/xsl7mKoofhbcfkZojp7QpR3q2eVaaFc3c98NduUsLr9v/5B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706172; c=relaxed/simple;
	bh=+YLRnYA5cGc84NpkLnO+v8EIvLNKoQKW6g8ZDdF3Z34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRfDtvB5SyaSI3oxFN5eOdX+tRfArSNOPR+do0XtRkrYQmsE1TGnS706mAXvbgRzEqVlTWxFmfvT2wB/xLkOmiXtwNoBesT9Cc8D0i33dO74sX+VYFSn8Ocm2pYNGUYjm3Mci9x4OikQtFwpubUjqsom9pbwd+Zpddksq3WnJro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pd7CoqW9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pd7CoqW9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2907948c1d2so20630775ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706170; x=1761310970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZBMiFEZ1uWB58JlwGE9Th6lkX6RyfAWKWVR7GImk24=;
        b=Pd7CoqW9VXfqQ8tQXDER+QtY4vRQzhhobnMWTo1SvW7RgiwQfYSv9eHHc6ky056OkD
         qS5S53XiiXudXZQiOq2bZ62LNcnfsW3tPrrcb9iWoaMkmI7xCdJbDGCANu+m82jSrOBG
         99umVUiMliPPjE/SDPro87ZsKl7Nu73ZnKUUK7JEezvlzoqtMVtTsIH/srUXuujXdGRn
         sBk2JkKGjJ2+XL2FZ83qAyVNJmMsvykRL9JpFRrI1pdohjIWMcA9CIbVDQGgNfbmTcfh
         bagS1aHFf3SXoF/DggxGde+aXQKfaXUEG7On+Bdy1wIRle0ga4qhDoIPvZPY4SQPKvlb
         +Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706170; x=1761310970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZBMiFEZ1uWB58JlwGE9Th6lkX6RyfAWKWVR7GImk24=;
        b=jLzoGcs2TjiYAcZRETX8c+OfC9QZ9TRobH83aBVorAQSTiIRMyEOiJrjEiFoEosfU7
         AAiLYoucqCViLlpkxThVfX/xyWbvRam24L2nBUdS1ikYY9gO6FLHLNd3U3mIAg3byezt
         vS7aqjekBQYYB93v8p7CJUp+ACGotNEctdF7tzUntB+Zs7BaujDgbQqptUYudFsvM8Lg
         +fMcToq+Z6jzKP72igaiGfN3J3ttnFa/kzoV8so/jghEAjTRjKc9hpaLui1RWU5EwzXV
         TFzpdAlYLYaXJAUJpFdL47P78D526XuuNUQ4khwWhr0gV+GdoGJ2MKPIgilo11Apr36A
         IzvA==
X-Gm-Message-State: AOJu0YzK14AkStxojd3S1D5in3vv6gdAgkRioQSRUKcmePc65GFWdQXG
	M+oqICcQo77z7v6IwoRyBjIWy0/gJArzU02bBF1lhrlpooUQhyTgp/XuLJEflQ==
X-Gm-Gg: ASbGnculuT/eMz+TRMNeW6ul7EbK7t27EMruXHUe700S4mjUCArWCofog1NCXO+PFBt
	tdFj6iHsUQNvDYvDcd7IQCUmH7h0gglEJZvah2cKX/BGTeYDVhzWg0DxhxwwgySwceKUwriOwoT
	X8RHgj/VyoEx2J5qdYDw97Fde6a7MfHme7ee1WgudQcvwxdjeXZzfgLbALSz3lklPLhqQu/t1ei
	LpC0oIFc4KmjU7ZlPCIRo6eE2+khYfTUCzcUUuKuHXNetAhFJwlgO7zJf/zmO8iIjRQwS4Zgr89
	Gi24d7fPLHAXiOTCegiHdEOkAICY0IaCGm+/xvsTbnQAu4UPNiGI5CJYqP7lRZlAEJrWM1uG94T
	6+7UK9uW8WyjgJWhMKcfpi28ZsdawF6vGq5fSZnYmqs0bZsGUjO5Z+gx6fzjvzq6AXU9iP1lFlE
	NU2K/J1dFj/tw32nz7MWUiFCA=
X-Google-Smtp-Source: AGHT+IE/ubyuzp7gdFhOGtzHgty46UkpLGDB4FBbaWHbOzCAjXcx85MX84+Q6Jud7ORYtSRpuS+KXw==
X-Received: by 2002:a17:902:ce8d:b0:290:52aa:7291 with SMTP id d9443c01a7336-290cba41df2mr41032785ad.53.1760706170115;
        Fri, 17 Oct 2025 06:02:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2923d9dc3dcsm1629815ad.28.2025.10.17.06.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/29] hwmon: (mr75203) Drop unnecessary include file
Date: Fri, 17 Oct 2025 06:02:02 -0700
Message-ID: <20251017130221.1823453-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not perform any locking and thus does not need to
include mutex.h. Drop the unnecessary include file.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/mr75203.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
index 7848198f8996..32c1e42e1278 100644
--- a/drivers/hwmon/mr75203.c
+++ b/drivers/hwmon/mr75203.c
@@ -14,7 +14,6 @@
 #include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
-- 
2.45.2

