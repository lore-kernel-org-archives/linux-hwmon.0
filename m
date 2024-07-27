Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C094717E90A
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722091111; cv=none; b=rtGxv3RlRRobiJAXsCFUeM9W1hp3dFuK30WhhQG/oKy3ghaD3i8aLRZlTxuGPjhIs4FZlSuhY6O103Xaw4dZ3slpVBrO7K0kbP+dGm0LoXAaJvn2glArpX7FbQWM83JHFE8OJAsQMZUeN49rQGyDE2TVn5dGs/xhRJGSpjgb3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722091111; c=relaxed/simple;
	bh=Mm2GoKyBQDGqsY/Q1kmZEvCefXYvb6EdKF8s5hgCBRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CyeqvdZwyPT5qvUEv1PJRuLs5vVOQNNftLBpK1G7uFAhzR8QuhbfW/rh/n+IeT0TzpCtHUDq9VuzBXsDkA68GTL49nQamGO+7GaYyairH4Chnf9IGI692oAA3oDpG5JJQ2a6jqd+ndQ1dsm3XrX6ncFOxcMDo9FXWzCoJV48bVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3LuWdlP; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3LuWdlP"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-70942ebcc29so352947a34.0
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722091108; x=1722695908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyb/h9fq2J1X3JG/8j30Z/QFEsnqq4g5IsDaX+MAsBc=;
        b=e3LuWdlPx/HWbVnkZO2F6vr2r/mK38vwcBvxUlejbU/GoFqMcfDJgm2rSAFeqwe4xB
         uiYEPMVCaUVQSbigpOe3brENrR3UfB4gXe1ljv7+1GLgAdBxIpLJtngbcmd4HwRP5VEc
         76vn1U7sDOdcYtUS5Tw+L+pSDgCTK7K+totNqCvmloCwDuDdSgfOQxlTnMdQ/MluiLPo
         ajzDMB9P25y03TI/JH/FAVI7WlyX9m6RITfnSQfOmRMyHIPfjY73hIcnt2YVaU4HlVuX
         7tnp84CWpdIZ6ASbnuRSMzwtQnb/y636ysZDrPI7Wym0AUErLoPEzrizltK2w+G1jhaI
         BUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722091108; x=1722695908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tyb/h9fq2J1X3JG/8j30Z/QFEsnqq4g5IsDaX+MAsBc=;
        b=WKwanrj5sBRh6zzbE+mKNrYOWFR9lzPYcfnPltrnWDtBBmvMiJHVr/Y3TSR/qftrxU
         3A9Gfl5cWWaVFCtqxyeyp/vFNQjZ1VgimUv2tVf0aZjw5IGosXlJkfBlXJiLiFOWR4bF
         uC1wBHgxGZ3FYZ5rcOvaBOtYeRa2aJtXEsFZzlpaPwML7UBoPDjBNx5rEFtpU11hjgl6
         X135EguGCkfU4BF483Ew6r8sMa0etx94Cra6Nb5suikZXgda56OtVkGN+hrhBvIKMywT
         f/FMUmJtNO4j+jd4nk6Y+9LyqSLrJd2cMy1HVRsywiKeC+GMNv/1stIyQHjTlWz8ndLA
         CphQ==
X-Gm-Message-State: AOJu0YxXmp1spNAsAQfTigb0FsNZqz041gNfrb/c+5ALDi/CNyUO1lWz
	OhZg2fr/TrCjEtAcBNJcfpglVX3DJXIu4Wgx8S487v3Ytfjnuxwr/SaCFw==
X-Google-Smtp-Source: AGHT+IGL9a++hMMkFF5pfIZHaVgx/mpaEfaQznPxjEJYbBLhPYmc+zNnPKfV9T2sVZ+3GxmofTClPA==
X-Received: by 2002:a05:6830:6519:b0:703:6a59:b52b with SMTP id 46e09a7af769-70940c054f6mr3284094a34.3.1722091108323;
        Sat, 27 Jul 2024 07:38:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c7f7b0sm5378876a91.23.2024.07.27.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 07:38:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/6] hwmon: (max1619) Reorder include files to alphabetic order
Date: Sat, 27 Jul 2024 07:38:16 -0700
Message-Id: <20240727143820.1358225-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240727143820.1358225-1-linux@roeck-us.net>
References: <20240727143820.1358225-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify maintenance by reordering include files to alphabetic order.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1619.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 464f4c838394..8eb7d04bd2f5 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -12,15 +12,15 @@
  *   http://pdfserv.maxim-ic.com/en/ds/MAX1619.pdf
  */
 
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/jiffies.h>
-#include <linux/i2c.h>
+#include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 
 static const unsigned short normal_i2c[] = {
-- 
2.39.2

