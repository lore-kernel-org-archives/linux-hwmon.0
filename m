Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C9433D4E4
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328919; cv=none; b=p3FgsqxJrUXv0mtmKKxua8ooRKAHgUTIkmqM9uc8mcEWv4IDVcf5QNG8YrWPv1+Arai3Z2BPXMANoRfg5epYeSVMya0YcgsVg029/8JWTdk9CKtkhuuf5LXBQBZeSzq6tR69rV9/Ocpob/CcrNYYWpIuGy+hlmviqZ30qGq0InU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328919; c=relaxed/simple;
	bh=qcrEpPlv6A0qiPGmD1BGxJVM1rv5juczVnDu6vwo8oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftT615/zdOAI7q+TvHx+CJf8t2jxrXejeKJlAfBSt73Cj+44+TMIx9d0rx9x/nJU06bmLN2Fusr9Wc+IL2q5OxYApo8DPruKoVdqaK8nC0QhUk5/OZJCo2cuK6r1eSQyl52K3NlW7bmdmNRo/xdP6N2zaXiVjBstm1h+a2rnC8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQDvTTVI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQDvTTVI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-449de065cb3so2606740f8f.2
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 05:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778328916; x=1778933716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvxMLSeAx0HJwTzPs3HX0F5L59Jmz3EDKfExCa+nOYc=;
        b=AQDvTTVIzYCT4EAp9oCZH0uJk55aCoX+m/z3ixO9jeso7oHI5XaxP0RBhAAhMsPvKk
         QVmkd6fTgV5i+J+ZaJN6GaVnrV08Zgv0c7vShlnSNN3YRy5vas6GyHqq9b8V7JLVDfhO
         IamG8ER6VA9r6SWq2m5lAbhFZCtxn4rXRa5cdvuomc75ZLB5DwuDARaQVc16V69Xp72l
         3/lDhsFNySGbKVP3s6sK/9461C0v/mvt0wgvUmDovvOFTCiwhf9CFwVT+O+nQXYsTGy4
         NrlHShu5hyx8Wvzm3+F4WQM9xVVVmdlrlRAokKpQMk8sCI1qWUM7bueQ1cJ80BZFJDMo
         3Bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778328916; x=1778933716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvxMLSeAx0HJwTzPs3HX0F5L59Jmz3EDKfExCa+nOYc=;
        b=sg2Rf7wI+rxzlee5KdLyFOjsfJj+5ZC4YPzaQDYvuLtTV/jI81yUMjb7st92s1DlhU
         qRKapJvk3PVohKZ91hI0i42OsCV61pzJanzZp5g+nzkn0rxX4/gtvpeI533ev0IN9n4A
         yhCso6Vn1yTPZJ+Akgew/H3PXvBA7SySVEDbW5+aKnRVsFJFPJ/CiwKpK1YVtVvc6kYr
         oA6dY/EL8Iko/ir/S0tvcuZBxcIQ33pqAc/3LoPgVIin1RW4sK22tlwtlXiO56vPp/3l
         tO2I21HYBLfbcjL8bCCvaRKT2FfgTt/XgZoArRGwaG6iZIDEHfZNqFJynlGo4tNdyyLK
         PW5Q==
X-Forwarded-Encrypted: i=1; AFNElJ83Ctx5Ze8x59b2uKD4Rg+b2ABBvFPjaMUaatSHR72mZiTO5TZy3tzpsmCbd0G00YwcFb4np3/S5QURsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM067VkZxskNbPrPo1c0snBHEP6BP4s4DVm7Z5XWmTfQU80Y07
	RQ7EPPTFzG7yVcU6TDua6nFbYUtMVZvRk5Ho2ajLHXhfXedoPqT4s6PnmDk4v3bv
X-Gm-Gg: Acq92OGdmymSLmJNG+DbA31/FrxZX+JjIqJvX1dzzy54+y6s57K4Mtu8BIYvC1h/l2s
	CXv3o3kS6wJT2mpW5m+NdSmRQ34Myu8rHhbBw86ht4T8a7jhsHV7bw1kajTXdKVq5JPfVI+Bts3
	oQjYm8iIlGfO5ARqWmV1OQ5mafCrzbPURkbjwYUcAJxcGtBZ6xd5b/+o4DkXHm9b77B51v7hHq+
	5EmalwPfRpMt6my4qfREV19wHQ/5ZNYl0G0aLy4zMdlond+P4sd6tJ0HfmvVSVRhzNTCVp+z8C2
	mxHLs4RwJ73OhaVB9PNYdztrB0ATDqZNCbEJ9joNIaY6HIq13NWY0R9cSFeeF604qo9K4W4uVX4
	M1makiX1kV7fKnJ0IzFp5sNEyKqvjBb0UzHYXS+nM4eOxrE5HlnAFhPmOE4nSa7aeB94Kg4OIwl
	mzJhb7TQZSSHLPSI2J6ZbKMRjqBVlZCBuE+esIMvhFQTZg4vUsR4CWb4+oOpumMplPAbIODAtHa
	OyZ
X-Received: by 2002:a05:6000:1a8b:b0:441:377f:82a7 with SMTP id ffacd0b85a97d-4515d3dc662mr28162945f8f.32.1778328916279;
        Sat, 09 May 2026 05:15:16 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.249.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6a64sm12054158f8f.6.2026.05.09.05.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 05:15:15 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (tmp102) Use device_property_read_string API
Date: Sat,  9 May 2026 15:15:11 +0300
Message-ID: <20260509121511.60601-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace of_property_read_string() with the preferded
device_property_read_string() in the probe function to
read the device label property, improving the driver
compatibility since this method is not limited to
Device Tree only.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/tmp102.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 3aa1a3fbeaa9..79578b28a91d 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -15,7 +15,8 @@
 #include <linux/jiffies.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 
 #define	DRIVER_NAME "tmp102"
 
@@ -313,7 +314,7 @@ static int tmp102_probe(struct i2c_client *client)
 	if (!tmp102)
 		return -ENOMEM;
 
-	of_property_read_string(dev->of_node, "label", &tmp102->label);
+	device_property_read_string(dev, "label", &tmp102->label);
 
 	i2c_set_clientdata(client, tmp102);
 
-- 
2.43.0

