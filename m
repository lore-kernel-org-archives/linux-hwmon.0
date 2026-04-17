Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915BD258CD7
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 05:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776405432; cv=none; b=LZjmAZNFJQR0hER0xQFFMVjZXJyRvuz8+nAxckhicN6tYNq4XXy7KNqO6pg9U+VY07V3HmxFAro9/EWX3NCbY+jcsqCCaC2gux8rNsOtloskqkBen/Ml0KbtgSGYPcq5q2EnMZrGU1TnMDZ1VQVjCEkF+hyzAIsLszfndah8ey0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776405432; c=relaxed/simple;
	bh=3XBlCNppyhd1BhqYq1UCFEPoUFO8iz7DE5pVzVeK7nU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hrmgw8cniX6U8aN+QLHvMsPxUXrEFSSzf8UNb7NmXlFz3/UJJOQlRMdkp8je+JiMby4urj75UN9hMWhs5Z3OooAppoq+02+yUR3RNa68uLcNnIaE7mtEecGFn8nMU9rcmCZdQ50DHBuR5nho2zKFULl3/HZEiLf+/qzF1ZAhZw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOxo+NdV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOxo+NdV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a041eae5so1602535e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 22:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776405430; x=1777010230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzxcqCRFdyfyYqCuUswaXW/SQTDk0gS70ucDr/UkU20=;
        b=NOxo+NdVUhgLVvm7hkBf3QMWt5bBmULyMvpQ2YAJ58v+376+Ml7C1QZgx0uXebQJEq
         WXWTsp1wXZ2G3ngqPKPJrpG7j+eCG3HPiO3FPe1PxTj4hwoc2bOypgcx31Zczn10aMGT
         U35re7V7Q4aYCAVn6CYw/o5CbvHQmoamPg818fCYpQtsAdAi/uIt707+5mTRo1ORUjB4
         nme0fK+PfI8KbWkn3kWct7+rN7wdC7lWXYeCgDtZXLJI/7ZsTACDTnH0BNt2P9KKIMLt
         em4MIDK5QlYbjDlQ8pyNCOfOWq1dKjXPUXRZHncx70n68Bi+3x59dLA76oYiIR0Yw0Ej
         XivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776405430; x=1777010230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzxcqCRFdyfyYqCuUswaXW/SQTDk0gS70ucDr/UkU20=;
        b=DHV3m0v4xZ5E3T7b/vSWz7wMl0IDb8yXhatQRqZ5hXn6g+wpHPia8Gl3gwmC5JfnCF
         uNbIbPG90TZ5UH4YpDAEEF1KEafNiXO2seA7itsBjb42c8BCSH36e8GXiwSQLWVICtit
         U38FvyAf7zYt3InjjwocqkLf60TPSshgF4hfKKFqnbXpzDwstaiAtpsFOsUJ15dr6CEs
         7eFlbZ8DwFRG6NoUmTPxJJh+eKz5T206c0LeGlS0kX0SFW9DjPNqEu6I4ii7o/LlA0MX
         dUXW+OtSvBwfkb3MCQsP88gWDXaXFta+tM3M/711mEwqpD3YZeEjv+cbwWyDl6M1uKeh
         speQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h95vyJavZsW+moMNt5mZpADk8duVO0rKUlHJkGdWd9/AZ3vkonEwfK9s02yWdbR5VUGEGJ+bwCayF6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEnWuF3F5GFSJPeEOBD2kaKDaL0Kl4QU0uxEShRph0rQTTo4Bs
	U8ZLW6ZdrAElmSIvkx7WS/w/zhhv1Eg3I7800AM4qTTGInkyD8YEM262
X-Gm-Gg: AeBDieu6PQ4V+Asdf7kNMcqvG36CuJcmjLWQ080Z7YUeK3wLxeNOjG4op+EFLKUjYqy
	0JmP7i9C4reA9TM4vV5kaCDk+Ao/yiyuNzTUiBWYhF7BTE/qInQc45iJbFcAZW1csfdqx+ryBH9
	CXwR4b9z/nqyEWsnGcZsHneRI1QPtp7wVQguOIghCiS0zFugW4GCCUc+vE0qxjjXlTRnU9EwqgB
	dIRiAxnyExpCORYsHROxZ2dGZFAZu2K+BrmhHg3zEHOd13779SIAALk8lS8eAIl7j7FT0j3xJFB
	vcIh7IHt1Rqma/aPooE8ro7KFfMvq12XLWi6yd94jWvvAaL6zqzdRip3pxpE3lkE8P6kO/mwIVV
	aK6UtPLIrpnx+8889uf4UswFeJk0FwhXG0mGijG6ghGLrKNvUmhPqn2Vwb0lbZAmN4V1S8vDxIG
	UzcqW92BR/UOBC37tsCNhI9GTeNUT/PwPen2THvmy6JCid6Ln2HXEeFTa8VdcGLpRvxyLcnf4kF
	uoqV4RE47IMyw==
X-Received: by 2002:a05:600c:46c8:b0:488:ae4e:51a5 with SMTP id 5b1f17b1804b1-488fb778d5dmr18976835e9.15.1776405429875;
        Thu, 16 Apr 2026 22:57:09 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.249.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm1774466f8f.9.2026.04.16.22.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:57:09 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lm75) Add explicit default cases in lm75_is_visible()
Date: Fri, 17 Apr 2026 08:57:00 +0300
Message-ID: <20260417055700.5739-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add explicit default labels to switch statements in
lm75_is_visible().

This makes the control flow explicit and improves
readability, but also keeps consistency to other
usage of the switch statement in the driver.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/lm75.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index f1a1e5b888f6..e132501bbfdf 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -539,6 +539,8 @@ static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
 			if (config_data->params->num_sample_times > 1)
 				return 0644;
 			return 0444;
+		default:
+			break;
 		}
 		break;
 	case hwmon_temp:
@@ -555,6 +557,8 @@ static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
 			if (config_data->params->alarm)
 				return 0444;
 			break;
+		default:
+			break;
 		}
 		break;
 	default:
-- 
2.34.1

