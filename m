Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30933314BC
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706200; cv=none; b=WjoZlMh9FAMadQ+FWxTAxA/zCjf3vdRBdH/MVmoXTGmhgzwUMtkDkkip6BXasNPM3g53vKI42h8J4PbXov8qQ3poNFvTb/BPHDgrWDW1uRCNc/C9w0w52RzGtDWWIpZT53ekX1V3J7Ttf6qAFu8XSixmpPOUKfXjTb8XV2xIV/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706200; c=relaxed/simple;
	bh=JpUx2iMqf3/BnTjSBldKvlhGQ3B23iEML+f8Bj8KYnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HEE93HiIKO/U0PQO/VPuJ58Klyz4ncn0/8b0rrJDqyDS+brHC4M6Haw36oWx2Kja9cDTWk3h4g/t6wHt7I3Cgs5hw/HKWeNfqQLl7DVFr3PTZJkMfhgoZZJZUgrMmkAKPy6JrVn+PWyZ/xAbdBFBXMo8ElfuezLO9xfgw80CoGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdz5JJd3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdz5JJd3"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3352018e051so2230855a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706198; x=1761310998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+aa1dU88f8x6bC018i1w1zlpa01p15Bul89e90s3yA=;
        b=bdz5JJd34CuetSVfdZG/VFJw+ojefT/3j+zr1iBNQMWAzd4Dy9TGqvD0hLoSR1TkJu
         Lh5SwS4P7K0IX8IrJ+kcShi6Ef0umDLc+YWWtU8QcDKMSqyfKoNOzO49LA5B6qhk9tmf
         nGwnyINjpK5FeEi7u+VH6nh6Yh+hroe3BamtXcc4cWhz24S/cAsrWWExCL2nBXYqgXQN
         sUKzhO/yEliG04gTbfH0KuvdWyGr4v3NBCM5w8K3R/bPMUySWuR9sXbu0xvitk7TC36n
         zaIcPbvuBcY9DD4ohmEHCoE7xKrAHUAuQ9wd4TAiq+SsGyIdwZFL+9WwNJyHqEgAVuN1
         xzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706198; x=1761310998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8+aa1dU88f8x6bC018i1w1zlpa01p15Bul89e90s3yA=;
        b=iUo0ysnOmNoXZWsWxR9SV2c2qv7Vq6LwRJhq0az/DuCrRhifkzSJUWz/+l6nkogqo7
         SeC5JyQSgCCUjuHtdjl3pSwrfO0CNQU3xvOsCaAD+p8YtGLy7q36lCn5QqIKqPXoUh/D
         9KBQuM3LEzm0ge439TctVdyv+cA0/hW/dOvP687HlS6YPmed4Wm5mik6YxYC7SEsuNDO
         Oy6lfHbtMJEVPASrpT/2U2kZ2wxXXbKSqhxCklb3ZFLkExv8rBqKNZHU4vMEZhS2hgeh
         RcVizZCaUuovEt48JCqAsLrndp/Q0jToC9Hmwk1MjcHeo3jA+ntKRpiR7o8Xu2q7g8ny
         UJLw==
X-Gm-Message-State: AOJu0Ywmo5gXaMB8MSMyWoUTFYqJARGrkm4dSaYN0aGcA/G7HvdKrEvP
	Cxiw4c7teydRQWT5pSbE8MPn4K+gfIDlEj1iYeWG/rzzXGcvGahFQzyNPklBzA==
X-Gm-Gg: ASbGncuwlDb2eInwcBn3P0RIk9G2YvCwe1mocupcoT0TQqjmC6Y9AjaP7tsMEtq/vVm
	OeSv6/Ya6KXdBkFIqgGFkUQwUk1Vh7zR83DImSPxxnCI2rgxZBY+EKx5sDd1YnTbpbH0vhB+/gF
	V3q4TJfd+dobE/8S/d+b+tWroE3uF9lohbifo4Nym/sbpLTDXzxGbpBwnEbv0NiaydHE7ZBNeTB
	O37yO4rCv5z5Kt8FqPQklJTVfjPYXIfb3ANh9ZUeifnubCbHcst+UGyzDmrtMtLbR5jFk4pYJkQ
	/cV0BSQp4jjdKnq+jjgLd4TXKEGAHvA1ia6pFAG8XbRH9HfPOH1ggPzM6cECvUyGbTnvSE8cZAR
	i3HVAc4MzV5AdWT7MUvv/KH6fmDLL4ZLiq/dfN/rqpoatBn/F5pM4k/0VUUdLczHo/OaBjOgKiY
	4vgMSDhCW4ETLvr1ZXhlb/HYQ=
X-Google-Smtp-Source: AGHT+IHg0z/djUV2ion6/Hz0J7JmQK9HCTXQ/Id0v9Xe284oz1D7EbodZmnkolv7kPo/7Lix4njGSg==
X-Received: by 2002:a17:90a:d60f:b0:338:3156:fc44 with SMTP id 98e67ed59e1d1-33bcf8e387emr3804060a91.18.1760706197622;
        Fri, 17 Oct 2025 06:03:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb66a2085sm5520680a91.11.2025.10.17.06.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 25/29] hwmon: (i5500_temp) Drop unnecessary include files
Date: Fri, 17 Oct 2025 06:02:17 -0700
Message-ID: <20251017130221.1823453-26-linux@roeck-us.net>
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

The driver does not perform any locking, does not execute or use any sleep
related functionality, and does not allocate memory. Drop the unnecessary
include files.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/i5500_temp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hwmon/i5500_temp.c b/drivers/hwmon/i5500_temp.c
index 2a530da21949..bf006cb272b1 100644
--- a/drivers/hwmon/i5500_temp.c
+++ b/drivers/hwmon/i5500_temp.c
@@ -8,13 +8,10 @@
 #include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/jiffies.h>
 #include <linux/device.h>
 #include <linux/pci.h>
 #include <linux/hwmon.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 
 /* Register definitions from datasheet */
 #define REG_TSTHRCATA	0xE2
-- 
2.45.2

