Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84866628
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 00:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721954617; cv=none; b=AZvIh32rnUXTWR8zP9ZLDHVmcbnC2m2NwLDUm4KLrAN4Rhnymuf1rv2BFfb9mMFN4lxWYsT4PyLtB9wmVBM+lJnC8sEJmXHgUGM8Upej5I2SodHQJ+COCf8LyjXPuEl9YNbbWohBZx85oZigA74MRQDtJQSbuYT55o9vRgAB8S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721954617; c=relaxed/simple;
	bh=z+nCM/m+QxunRt/e4sGwKV/6GJ+qaUgh8zcNkvi/mn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tWxukXI3Q3if1g0bH03MtayDGiqgQBbp61nk1SDcXLdKykzSdwhE8tfLcW1JZkcWv+Md4p8mfZa9AUW/jTU3cDJwycTT1XJrFJgl9i7Vt+t+g1L/RtTfuhDyLCZwozpsNFyvmyExMnbyWwplbE3FU0pUIjb5KqaRPBFgWf8Smi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbOaSI37; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbOaSI37"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso403913b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jul 2024 17:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721954614; x=1722559414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZ3EaG/4CXd4QBVocifml96MCTY/RdzDlPE18sv8YM8=;
        b=MbOaSI37f34e1GP+oH2xXmDzEAJHU+7KzSJ2P4yrfqVuautMRc3xwqt4fY7I6d9kaE
         RWMGEC73T5WLqDanU+m6ijfkq4h5HTX27g1GkZttQ8c+gGAx7Fl0Hdr3tjrhlo95rtFk
         avShAUui2kA9NLnrHv+gKBqCes6NebTqREoN3afFkocAS3B/gi8HEzW/lgVEWsSpoB2Y
         tyfnVphFhelT6T2axaWEjXCS415O+A5eBCqdQsdWBkOL8EikAXwft66VtLe2thuR0ol4
         8Qar1fGFxHmpvrTHE2bKOV36/hmKt5EZ9KIGlTMejZcbaHY6osphGtIbkHA21nNmPGmH
         fAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721954614; x=1722559414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YZ3EaG/4CXd4QBVocifml96MCTY/RdzDlPE18sv8YM8=;
        b=KT78ABxpZpNpKHF95ll1Wc02ZD4cckb0gwy7GYwzddE5p1bLVPL5ueLBrsN7RVHuS7
         4TAFhMeWfSlvvo7iv5yOSD8NqQ01SwKrPaGT1NlPiH5i0qIW1btjwrm16ReIlhV7xyEf
         n5zR0e0Trd9WRyJhXYEku26F82o5czsDG05ntgkb1MRe8HRL2OZoCyMtgH7SncOGRhDz
         fD7k+UH6QQwNovtgG0LGje58IrM+xQ3OmM0mQ4upYBY22UaJq88J2zjpbO4BkidH2CXW
         8AranWNUc4rEyPWO1kr2migdr4jt9aXhS++0Xt4fJrkibK4byiVl46A/Y0YSH60T/cIR
         mkbg==
X-Gm-Message-State: AOJu0YwpUbm++JN2sxtdiGvQUaqTbTtDMpncYvTcR9x0rwpk0Oz1mlms
	og6cJhgC6DP1imlaxxlPYse9oL6DDW25yon2hjvx1XNljS/HtQnOcpDsgg==
X-Google-Smtp-Source: AGHT+IFpTa26e2HjP5DbMRWC3je8H8RqQIxAXMHTX2p6674ZnhjtzbN8/Zuj0msyh96OGeLqTYPOEA==
X-Received: by 2002:a05:6a21:a4c1:b0:1c4:8bba:76e9 with SMTP id adf61e73a8af0-1c48bbaac17mr1200630637.53.1721954614265;
        Thu, 25 Jul 2024 17:43:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f3efdcsm20154535ad.217.2024.07.25.17.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 17:43:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/5] hwmon: (max1668) Reorder include files to alphabetic order
Date: Thu, 25 Jul 2024 17:43:25 -0700
Message-Id: <20240726004329.934763-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726004329.934763-1-linux@roeck-us.net>
References: <20240726004329.934763-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder include files to alphabetic order to simplify driver maintenance.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1668.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index 9fc583ebb11b..f5b5cc29da17 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -6,15 +6,15 @@
  * some credit to Christoph Scheurer, but largely a rewrite
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
 
 /* Addresses to scan */
 static const unsigned short max1668_addr_list[] = {
-- 
2.39.2

