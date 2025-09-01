Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFE2263C90
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Sep 2025 15:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738952; cv=none; b=E/RHDBMN27cQ9o8utxEnrZDl8LGyz7YAh55RyY5HD5TZcF9gK9w8hy9P38XB8JCohQ4hu3DWmOC3enXFkjLO1QrUwOP1Ub4+uxaTSRahuRGPVnc8EM+Aj+Knh1MTfioCXni00AEcfjglIdXjPoIKpmU0l4qOkXLEIwZytuGEkPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738952; c=relaxed/simple;
	bh=AoWXJl7d3AagFu7FJZQ4L61pXpyj9fj3UAWi3Ov1/kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haY0WdBpuVuytfDWtrSX8ZCcoKcN/tqHMGhkxG/ZiNlI2PhlPB1Kht/NCx23/tGYjCSqGxsOhhmybkHdp2DFK5xdUjskRRsBAzcp1F3hfG2ogQMQTJ4498OnyhSX5CEOq/zrut0frJb8mDEqYzKhpaDT6Znahwk8sD3Hlk0cb2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRCbdPRQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRCbdPRQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7722bcb989aso2260066b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Sep 2025 08:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756738949; x=1757343749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wogqYcOTsBuKSGXmYkIYcKXM9OqBJdjyo+KFPiiKk4k=;
        b=PRCbdPRQ5qgHtQpzNyuQewObzU4+C3tGW+tfcw8rQ8ETE6c5+FSNLX6ccV7iYBnV/K
         IGL9H90UkhpHBKCVyR31n9LYymQwwi/GRHtNDv6aXvvN9bQacIkCNpk6CXdtjtKm/jCp
         hFk6bm1aX96Xslwx8JpGLJpO/9SRxbDJHq0/MmkMSGkBwzUKq+23ACR9xuh9hla4ffpi
         KVm9yiqr2TlV0nwVRzkDlf98NM4wsZXZFBJQmhGY3zymxYu+v2bHFGSzcYCBgCncKJzg
         Zi1Rp+8hP5wmQDDm509YeWyB/Fo7VWvzNUC54Th0jT+3ZSBjiWtDh5G1qe6tHTzqFIur
         fkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756738949; x=1757343749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wogqYcOTsBuKSGXmYkIYcKXM9OqBJdjyo+KFPiiKk4k=;
        b=QpIHgAhnPGHsdkS9mUl7FvqVrW6vDn7DpsQjwqBPyEveK9x7yZFOM5y7C6OP17Zrri
         U21ROcbxJoHjvfO+Ek0dfhiQ6E1+pUvyGF+XgAAIHE9rZE/rB62yfWWHiOyjEFjyGEu4
         gNTjcXD4i1q3roP3eY/6UtCxsdyfuCeFiaHcZ48sCBoH4wMURA4xXpWu4x20PyI+kGD5
         R4Q65pExIT8nXFCbHcOI7dLmNN4gNUsrEG0DYQZ+5j+gWFB/A1xYB3lhzxPSMglaGcwi
         2l9IyKmSOvygCuVyX6H66N1U/bRzHXs9rGRiQH6YyHuyzVCy4/Q/Zv0WvcVaWa4PN23j
         6Usg==
X-Gm-Message-State: AOJu0YzG9HqI/lOKhipkRT6lbEoOoMBgfl7OblLovs9cXuYlOliOFoBh
	vLlUoFM09kc6h+mvwqC59paE/CB0u2mwMotMe8alS90YBWCqDEIPwXhnoTdilw==
X-Gm-Gg: ASbGncv3qJHqVcN0J/0r1Y0WxqyuoZHl0b7sMcci33y9wE2pGxzpcpzVTRgD9JhfIKc
	83TQWxH7JA9LdvMjU8pbgRIhL6h1c8VBUC/n60pjY2n+jnXPeGJb87M/rZr5ahdK4e0r+9XkluI
	Z8U2clNLWVpGPX6mEGBGczBBmpaWPGqHDNm90lE9RCAhacnrs7yANcwzr7kTC56a/9YObiKc8s4
	+en7VPeNfOi2R/iAs7EtW58iiXr/D+WFbf3AlHAp7Ht4Xv/U65yGsa9CYzZXhwW5LAZG1TAAfs+
	1amEc8FqeFdQu9d6qKOPofHogBpXxMT7CWiKFqFfDP9T/AGT8sGD0UhlysqCbrWYsT/pjD9y7Jx
	4sQA9cs6v9bNEMdXjm9wX3tjE2B1lAEFU9+tbb2smQuCyq3JI/OD4NfEq
X-Google-Smtp-Source: AGHT+IHHrOFtQvr7oLh1NaGy0rUsFva4ClrJF3RB1d7ybLocu6kwmC/+K3DZa8JXqBMAiKWRHG8HMw==
X-Received: by 2002:a05:6a00:80b:b0:772:50c6:47d6 with SMTP id d2e1a72fcca58-77250c660aamr6536939b3a.2.1756738948990;
        Mon, 01 Sep 2025 08:02:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26adf7sm10963852b3a.15.2025.09.01.08.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 08:02:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Wenliang Yan <wenliang202407@163.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] hwmon: (ina238) Correctly clamp power limits
Date: Mon,  1 Sep 2025 08:02:23 -0700
Message-ID: <20250901150223.2636135-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250901150223.2636135-1-linux@roeck-us.net>
References: <20250901150223.2636135-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ina238_write_power() was attempting to clamp the user input but was
throwing away the result. Ensure that we clamp the value to the
appropriate range before it is converted into a register value.

Fixes: 0d9f596b1fe34 ("hwmon: (ina238) Modify the calculation formula to adapt to different chips")
Cc: Wenliang Yan <wenliang202407@163.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index c6b2734898d0..59a2c8889fa2 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -517,9 +517,10 @@ static int ina238_write_power(struct device *dev, u32 attr, long val)
 	 * Unsigned postive values. Compared against the 24-bit power register,
 	 * lower 8-bits are truncated. Same conversion to/from uW as POWER
 	 * register.
+	 * The first clamp_val() is to establish a baseline to avoid overflows.
 	 */
-	regval = clamp_val(val, 0, LONG_MAX);
-	regval = div_u64(val * 4 * 100 * data->rshunt, data->config->power_calculate_factor *
+	regval = clamp_val(val, 0, LONG_MAX / 2);
+	regval = div_u64(regval * 4 * 100 * data->rshunt, data->config->power_calculate_factor *
 			1000ULL * INA238_FIXED_SHUNT * data->gain);
 	regval = clamp_val(regval >> 8, 0, U16_MAX);
 
-- 
2.45.2

