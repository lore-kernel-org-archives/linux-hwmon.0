Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639633191CE
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253622; cv=none; b=Kpk+SFoTqPqRHi4Gp4V5N5osf45Z/f5IBpsAzRX1WGqXrEoxASFKRjZCmzNtWVy4GpmXr8V4vxbJ3BHcnzsZI7V+kCMVZTS7/QxT+8CwFa2SLY8kngHeuOPQuTROqZ8AD9mVvffkl7JzE4GcWkmW/b3UQ7tGCdNbqjtSw1Yv9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253622; c=relaxed/simple;
	bh=UX6zSifAirvrYiVhdbxfUmfvhHFfjbbOHUb2/t/puqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LAXKk3yL1Aiy3CICmPJ6BolEtKXW2/9ZzeJPmSVAsQEhYyQZyY1JkreEIbqe0GXNo4JeLmsXSO7VGe0zf5iNHxw/h/06snXFhaAvJmdDJokS60MHqC1mV/QH3ph+9ZGOpVqpI9N2vDUReqYOfSezXrJfqOxnY5ZNdcscMkePxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy7xo3nZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy7xo3nZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc73e322dbso270135ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 08:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253621; x=1785858421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7/qbf+cu4TMainFNEVQ92oPbqkQFNtpoISTqralmxI=;
        b=Dy7xo3nZq8eGXMAv75f3/UQCu5H562an054TWv56EL4FN/KSZ+TBR0vYApI3xtEdmy
         QZ7wBE11/4ay5Z43KmEwN3gkAR/dE/WkX296TooYz8P7Y1OjZWEXMzRPDz1guGQg71Hl
         a1Pgdu2zUBhDu+JMNTfRnWMrBPB4+K0sjsybsUlWemnp8rObfocW9XSjrCzumdTcgO0y
         f4uaGEeqME0VokQOT1irJ79X3BI2PPJTd91c/nHnSu9Pc/ZeWTF1YBq5+soIq+fThCj4
         yE6CtbQU0aiXrrXUi2idtu68qsqU2+9i2NjbO5WVVYaZ5dr1y2XhHhVamNApQJ4qGrtU
         1IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253621; x=1785858421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7/qbf+cu4TMainFNEVQ92oPbqkQFNtpoISTqralmxI=;
        b=nqnT2qH4+lVC4KCjkA/tq4AS7+IuR07UXo5T9BYYjwUb1bSLDXo9o9Cx97TQZDFIuR
         UBG2iRASBIW5GMKnuNlRC5W5OIznt3F0/KkbAVTV6sCa8Spyca+xG2gF4WVw5zcfwsO0
         cCsZVttD2pmMf1/Gy3+GFDDZzEYVyzYaxm17jHk3hJrmJgs3VCYcvJV0E9jhGkYXIHPy
         L++W9qwIPezC3fFzZIAnEBTtOQXS/Ww+rrvCVcdBlnYEMqaG6WFYi02bhw6rPHIUWre3
         dGL88lGLlFOBlAfwutgQ1g/Jyd/ypfg8tc272Gaj2RP/6XvtyYo2vFo1/rb/7Q2IpTtE
         HiIw==
X-Gm-Message-State: AOJu0YwsTpGq5uKCS06oZyNZroMJYP8a5/6U3Y0q0nBunptO7GGJOc8G
	tDWBX+u5zj6BpWMGdZXUJ1at6bovIleg/8DPp8TNdYVO64snvlnaQhrKFi97KA==
X-Gm-Gg: AR+sD12CGuBnR8JKhnX9COqwUpckSKPSoKXtw/vDCXuoQ6UEYNR2ejU0RiY37s800Ui
	/uqS5LBKkMtw9VdTZjcapRtq1e32Z7BFN1dQVM9e1+bNdIObKch/yrDUvDkyu7HJAeX8F3nQAxZ
	nqMuI8VqcCgdhYAyFJl5fPOEmNcG4n/OiiBlYNCuou5p8aEEmUWlT5KAa4OUsJOyNERfi1Wzxu/
	f/nwMb8VPxAr2Q2uDesWNW8pQxniI69LQCMEbc7F66oaRn9gVZnYH6hBwF0v/XsjTiu3ekH6B7+
	jRiMv18vxVYEJM7zQ6w+MpRHRwN3awpYtejiNuRJZYvYrX1wVOQx0uhf+sudS6SIveQiKjRtVki
	EKW4VZeR+jUQOkXKFEsgolYG9GD45sCYvxW+VAhucKu/u851ikqrVt7aNdWW/UBKQM7+D4BPY6N
	qn1wHvk4Z9/GOsjj0=
X-Received: by 2002:a05:6a20:a108:b0:3b1:a9ce:507e with SMTP id adf61e73a8af0-3c8ba48292fmr3123659637.32.1785253620420;
        Tue, 28 Jul 2026 08:47:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b88e12sm148963eec.11.2026.07.28.08.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:47:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus) Fix return value from pmbus_update_byte_data()
Date: Tue, 28 Jul 2026 08:46:57 -0700
Message-ID: <20260728154657.3910899-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmbus_update_byte_data() is supposed to return a negative error code or 0.
However, if no change is made to the register, it actually returns the
register value. This can result in problems if the calling code explicitly
expects to see an error code or 0.

Fix it to return 0 on success or the error code as expected.

Fixes: 11c119986f270 ("hwmon: (pmbus) add helpers for byte write and read modify write")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 24c4d502733c..aac86d4f64b5 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -513,7 +513,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 	if (tmp != rv)
 		rv = _pmbus_write_byte_data(client, page, reg, tmp);
 
-	return rv;
+	return rv < 0 ? rv : 0;
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, "PMBUS");
 
-- 
2.45.2

