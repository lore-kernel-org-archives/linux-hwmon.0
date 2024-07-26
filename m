Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61EC4C99
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722032172; cv=none; b=eOlTPaWAr6A/E63Rs8BoQScVGWnWGs2QGe/uDAiqxBjMwOavqTGL7ji+zRz5aWcsEHnfI1mJSowvfwkrSlL3TzxyC1nZJhTh7N+KdqJ/6079ihCyBOV0HqlKIs3pjsycCXuF/eYZWB/v44N8EbqRM3VSoHfeADyCnOpmH5sQRM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722032172; c=relaxed/simple;
	bh=5A3HmYWrG/JHfNl8CBkFrnLUVXeSext/VolRVBGiMCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IxWSc4Ww9L75qWQk+BF1pke9L+CtOpXl82zLWcGhBfNoQAMIsOhnl/bZB5zEl/ww4gAK2gxgTLHG7qiaPk3OIcmWbdetzymAbFMj1lXuJTrfBxy+vGiqjFZwy3PPvXwEQp94ZxppCJMxkOlLUZu633T18CL4f6XE7tlVi14tfZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muTZogd/; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muTZogd/"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3992195d08aso11163855ab.0
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722032168; x=1722636968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tP3rxUGqnF8b5+X7YA/COhrego+TOipxI7A0odRA2wc=;
        b=muTZogd/m0doD2S8znR5i31sEGs6N+cS7BcYIwd4VzpmXVFBTWzmQG8c/YjEuOzzr1
         64yt/wNlJnVXkkDwXVP3ZeIuD4PFLMqde66Sb55Q/5T6RuzlQcv+5bky05164FYPVqBm
         99Y0utJRGY0bJ+rnVdoYxSjMIMBz0WTbK3CUJCBhqh5hGAIYMvN/jBZ6GV0velhZv8xQ
         FDpYX5z34hWFLalK8ww1iEjiXqbJtIVIxndVihes3qJqzUv1gqTjvua9WiEpjucav6xu
         +/iqr5kuJcgHp8HonOsChhGpful679V8kUppzDjgCywu3yswV74FySld80qJ4Dhuvxzd
         pjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722032168; x=1722636968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tP3rxUGqnF8b5+X7YA/COhrego+TOipxI7A0odRA2wc=;
        b=uyvbi/Nm1/I7joYAQRrRghsWcZlzOOTKN14GVgb4Rjq4M0KobNm/B16G13F6Aby33V
         AjCNeRRKWYtZYOdVISyRyi3oWxGiAiuo/v26bA/5PO7oNsOf90soRtX2dDsIeXn1IvCZ
         FAC2k08fW0iD7UJ+lGFUSjBV0vRvvwhsiil9DXLxbyFCrmi3l3X0aICpb3pFu8GQf4bZ
         puw4gNaJQul0oX4RFPog+wvgPXIBFZ/XhVwQQxO6w5tm3nv0qxMfrFwj2cOihWEmX8N4
         ja1HcibE4g4hKnjALKuDDD3Qp99yn/fBP6gViIjW0WAlinuT9pMYYamDzTxrxbB29yRW
         1uQw==
X-Gm-Message-State: AOJu0YyAlRCWd8uKcu1BeBKGt4nLC4j9Ed2Z0yeMtpykmfC7ttyVcpSh
	Y27l8YtaE+XLvKuatlIHy7lfdVAPqMrrG4JZJVZZeJTBGxraXYHH2OXqFQ==
X-Google-Smtp-Source: AGHT+IFSvS2jso9taDMqZ7T9TiXNQN2WVyqjknbB11TH7RfzKNmUGAFV2qL3QY5eo1HWFtYy6kVNIg==
X-Received: by 2002:a05:6e02:184d:b0:39a:12d7:2841 with SMTP id e9e14a558f8ab-39aec2e3585mr12358665ab.15.1722032168355;
        Fri, 26 Jul 2024 15:16:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f9ec428bsm2793299a12.63.2024.07.26.15.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 15:16:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/5] hwmon: (max1668) Reorder include files to alphabetic order
Date: Fri, 26 Jul 2024 15:15:59 -0700
Message-Id: <20240726221603.1190437-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726221603.1190437-1-linux@roeck-us.net>
References: <20240726221603.1190437-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder include files to alphabetic order to simplify driver maintenance.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

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

