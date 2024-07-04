Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A913A260
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jul 2024 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129047; cv=none; b=JEKWcnRH8Xa5gFoFNZXZFJQhwckb7KL9mlVZLl7za1Tslns/JFWHni3wiEGCLRQBWA8LyfGdJeGLURTnux58oD2nOPgXqt0Tq4Dutk1Zbj6KcnAgbOAbKlUeAbmj6DcpHio37luH1tkvD/ZBhcFpBO491MVHQLTRBqnWRW6Nm1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129047; c=relaxed/simple;
	bh=H1S3doi9gWB27jtoAzqBjVERy8ev1ffSYGerIRU0hpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJaBnpz4MI7GQRl1BGRIIBPif1ZHF4x78tSDKkrKRJJrIPkzg9PQVcmTdhK3R92WdhrvJBY8lHJBGVtlb/EGoTJNYeNremjwBc6bNuwiiby7TFnd+eGjUisf2DKUZgLQmnamQbK6K2pve0lexN4bFso7OwaJHXGDKFMbOzMwciE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGM2cxoN; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGM2cxoN"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5c46c8b0defso526213eaf.1
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Jul 2024 14:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720129044; x=1720733844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrRefz4Ffas4iljHEqtXLusZyTaOKGs5s4BFiqr3zuM=;
        b=FGM2cxoNSSFgBtGrueO/pNdMi9hm1weP1nRfupB0oq3BSjiA9IehfybicqTRYQS10s
         RHPn/D+20hPt7oczFoUv7vPwil4C43EU3wwWEL7CBWr8UGsexi71d6ahZfMu6HtCcw8m
         Yy9uXmFt0CV188T2oS5yZruaJRRg3KTf2z+ab1PIu904OMGb6hMRWFz2/yn1ah41Kbik
         oGo+TDlbql/6H8it+jqZriJqCJXV8F7KD7MCF5z+NpjgifvlC7RmRVVsiNHwdcxgxDkh
         i7QgjBZM0SBnF8EYdLFRIoDUZ2nG/K1jI6exOZ00Vi6rDYuhxt9Ir71RMP3XrUmMR7Vl
         JGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720129044; x=1720733844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XrRefz4Ffas4iljHEqtXLusZyTaOKGs5s4BFiqr3zuM=;
        b=baZLkVF+TfoLwBJzmi6fCRUKZVWk0Z65O6b5czc7+QsIWJfPkJtgY6O8BBBSWp1qH1
         cGIL7hcZsQXbCDNkXjNUEPSzIfs3njAXKdr11HH140MZY0DyJ3gfK2M6Sdi2ranbP9JV
         +r6CXQg2CYK+2f/mqdGzMyGGHu8FSHtzLTGLwDB6d/VDLn4CH8phikddsgDNBJ2FY6yA
         7GR6xIgR9BkCn9dA3FOfEVW6IumVJ3eNBE8VCnQ9nc/QfrixvA2WGjAw/l7xB1+WwrsF
         VFKJ78XleKGUm9c3CMFlmwhz2YJ7Kq+jd1fv3qKB0QWoXR/y44q4vnCKiA4wry5K8aNb
         /6Ew==
X-Gm-Message-State: AOJu0YznUxzf/j4ql0mBvVdf1HHyeCxyMFi3YHIOLKhG5SzZlkTdQsg8
	dzWxVHi/WPTqXOtCPo1CE1MotTb+AXVXP4p1UluIXXpRW+gyLBX4hFPH7g==
X-Google-Smtp-Source: AGHT+IE5mcrX/bwRJuXBGdPKyt9EF7pvBtgoQ6md6ZJqOf701HqnR5pqzSci38LpEze7QIitVsGymQ==
X-Received: by 2002:a05:6218:2601:b0:1a5:28a5:f2b9 with SMTP id e5c5f4694b2df-1aa98b1c61dmr257889555d.2.1720129043695;
        Thu, 04 Jul 2024 14:37:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a9cd133sm2004799a91.38.2024.07.04.14.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 14:37:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/7] hwmon: (g762) Reorder include files to be in alphabetic order
Date: Thu,  4 Jul 2024 14:37:08 -0700
Message-Id: <20240704213712.2699553-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704213712.2699553-1-linux@roeck-us.net>
References: <20240704213712.2699553-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alphabetic order for include files help deciding where to add new include
files when needed.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/g762.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 8573865a8989..37d8a45610a3 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -27,17 +27,17 @@
  *       http://www.gmt.com.tw/product/datasheet/EDS-762_3.pdf
  */
 
+#include <linux/clk.h>
 #include <linux/device.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/jiffies.h>
+#include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/init.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/err.h>
-#include <linux/mutex.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
-#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 
 #define DRVNAME "g762"
-- 
2.39.2

