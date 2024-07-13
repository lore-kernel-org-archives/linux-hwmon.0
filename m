Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DB83715E
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jul 2024 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720906450; cv=none; b=jjsDDlHVCUdkm98zIsCPNekRkftTXvbNPFeA4GXFnqMlHfl9hGsLtO9Mb674MTCgNU7N8LpmAyxQwPTj5yBEZUPFh5QFO7giIcjrOZvhBkPIWXfZ+rK92Zo9rLGU9Xr4IKSbuoCy1Sgp9kMrrpxV56IF7+/uukEg69xl8PuE4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720906450; c=relaxed/simple;
	bh=Rumo0AATxFlLpT3Qsvod3DrLjtBUCvvH+QsYmbvuP3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RV7mX+NjO0f98A3C6pmTJhWpShWjovanr85Ovgbh34TUvHrRA1hwLiJyNV5UT/9cPN+ZOOk0jExkGveNHrcT7H1z3pJQQEqJ4kMkLSsXI0DbfReLJAw1vxRlVHq7zOBbtSuOQxUu4aVB/XRnv3KjBu3ywTZv7elsmRSyWU0Ltm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ef4ef2ST; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ef4ef2ST"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d9bcb47182so1751941b6e.3
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Jul 2024 14:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720906448; x=1721511248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvocX9hpxAdSslW4oMUAeMmONsahjuWc0jH9fb5HwpE=;
        b=Ef4ef2STSaMpdxOv2+SlVRF6WTjI+C8fGr7Wg7ZI3LrISrtoEM5QF1rmRdKhLdo81Q
         w+OOddQc6vEAE87kpw9aZYcK0h8biZbq8QyLvmhOcXcPQZCHDh/aVJkBVTCERXJhMHgg
         1g5raQVLlqb2QMqVUxVmwepc7Zfl9SGkeP38B7tHyloPSB8cb1OMeqDmgZQUjCYrZb73
         IF8iihjM+qZfsEu5gWSeSMMcI2WNRtGeXZ0W5eaCP8jYTju1abaLwbMfL2EH+tUsTxt6
         H72DjWjpCvqWA5RdaZEITYag/cl3XlhbnGpd9RB8d1IysSptcARID6C8k9N6U4SG8ck5
         AK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720906448; x=1721511248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvocX9hpxAdSslW4oMUAeMmONsahjuWc0jH9fb5HwpE=;
        b=O1lB5JVmhMb4xfqZQcQqf6wtR9zjW3Wmv70/537awWL/7egzHeb5cdtOHsuCvDSR6L
         Op2kg6Zu4ex8NsFNoBXaZyBlim6Tkb5aOi4ErYDyBuXr4mUS7KmWwAWXEyGvgg/8f3AP
         rRgwLDpBOeotmMtJIJrq/BN0roQiwM6yGTIx3v6xodhb5Qb+5IZwPbZ6Fi3kYmjXKR7Q
         Mj4X6z0mOnG2BXWuYs4lBO0MnPT89p0FH2Z3BlMI+0h0Dk/OmU77Htzb1IeRude1E43r
         s1d+vubg0sLlhQJnJNEHoeCRCmOe75TEJAJsjrcI2QBf2nKAzTigCXFlQdLdlpaseSiA
         qtlw==
X-Gm-Message-State: AOJu0YxuK2bSTIaSTbCrdn7Qs38rkC159XyleKvSxoZp9qP71fc1gdLI
	sff6OnCknIOphpw+zXc0Lq5M94jMOJDgZv8Z85r8SX+d4C+JHkYKB9Kucw==
X-Google-Smtp-Source: AGHT+IHiOEyuyKfV5+KES0dC7QOOI58X3JnyDBWmXvcY4pCSoGlD4ax9rgKFgq00r2pVrQw/r43YhQ==
X-Received: by 2002:a54:441a:0:b0:3d9:ed9e:ae1 with SMTP id 5614622812f47-3d9ed9e0efemr10083338b6e.28.1720906447727;
        Sat, 13 Jul 2024 14:34:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc49fc1sm14262205ad.263.2024.07.13.14.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 14:34:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (max6697) Fix underflow when writing limit attributes
Date: Sat, 13 Jul 2024 14:34:02 -0700
Message-Id: <20240713213402.1085599-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240713213402.1085599-1-linux@roeck-us.net>
References: <20240713213402.1085599-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using DIV_ROUND_CLOSEST() on an unbound value can result in underflows.
Indeed, module test scripts report:

temp1_max: Suspected underflow: [min=0, read 255000, written -9223372036854775808]
temp1_crit: Suspected underflow: [min=0, read 255000, written -9223372036854775808]

Fix by introducing an extra set of clamping.

Fixes: 5372d2d71c46 ("hwmon: Driver for Maxim MAX6697 and compatibles")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6697.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 1111b2ea55ee..20981f9443dd 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -311,6 +311,7 @@ static ssize_t temp_store(struct device *dev,
 		return ret;
 
 	mutex_lock(&data->update_lock);
+	temp = clamp_val(temp, -1000000, 1000000);	/* prevent underflow */
 	temp = DIV_ROUND_CLOSEST(temp, 1000) + data->temp_offset;
 	temp = clamp_val(temp, 0, data->type == max6581 ? 255 : 127);
 	data->temp[nr][index] = temp;
-- 
2.39.2

