Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB12613635C
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Sep 2025 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757835698; cv=none; b=st33pny1+H2+BhcxKvX3Ikv3jDqYvGn/IvgJYW/R9X16egngPiqMiNJxLCGxjh/5jBi44EauxLnWy3vgo0mWQ7GLXvaqcha0APv3p42sDnGFHR1wKcvpmnUJ8iKBhWZ6z3my5DoyryEB6qVOMkvUgLmvLX/8udoiLdAp/dlsRnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757835698; c=relaxed/simple;
	bh=pmQMhinXOhrMn7twXeioOkcACZnshftCDLBST5UA2PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PF1R+/pfq/mkrl/mk+yH6hdRQFhj33MIloPkFwsVPIEkD5Xw6u2VkCEd/fLos3+rIvv4DbA1E7ObiLlDkk6O3nxMuzxUBKrGQ04D9JpDVRhqYRwSB28wrTCj+8U+HdDBl7kGqBmyYA35skmlzCkWvTWKhlhuqxBIUAQbMeS4+TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2s6XjVD; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2s6XjVD"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-624fdf51b44so3831813a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Sep 2025 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757835695; x=1758440495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVz0/HlF5BDemuRDpr/RdeWre5VSdXxEH0yfhTNk8c8=;
        b=h2s6XjVDG8ESFF4BN2Y0WoCpxUxuhCPWc5yiZtIjAYPim5ltN0OfYKsHkon//iklmU
         aIZg1EIXrvsYK5HxtcE8Ms9uUECdoPSqrAzwXJ7TVYvq54yOFDC/9VSF7fXvwdi6fvDT
         5ZRNRfE8UFReeyMrdV26wIgwck/w5WSESf7L4/qE2144EP8FMEFOfneZUXO1GWtDHhfN
         Y+Ub4I3qMVzYAqecTBodbNuzSGxQDHk4+pZrX9xTH3He8uAXFuqPOyLWJWc7aFJPHJcR
         utXvW8qvmGweqEPxNjODSX4pXHmdh76yA6BkmRIg8oCV3VDH+3Wse4bUdqOmz7430490
         EEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757835695; x=1758440495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVz0/HlF5BDemuRDpr/RdeWre5VSdXxEH0yfhTNk8c8=;
        b=iAENW4o32ApdCpzWefxAw0SeDR6VIjx51wEv6rEsFxhY3rAqWiDTfmwjUEmu+cg8nO
         K/uvLhaTMSjqhQpiF8VxUPHVyck5FU30SGrudE6VIF6jvV4kwrmUkYcuNfeBy3+shIq5
         /a9pr/A6ogtsIgGvI1zQHp7gmHfcdsbp4OiBnYFu3wGX3MhAnhBCH/FgGBpkaen4aGpR
         MKumn2z3tHxxQr1J4bo/LV42nOZ7eVd+mzbLviHQPtkbmKeB0X0g9Z7b2QBNB4CNqt4h
         pV3G80bCdc1xvh+pJjnSF6E6S2Zb9QdQI+6qVJqDa6v9W3IyLCgW/Q/H5kwFpmFckxym
         hVUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOmLTmPFCsIkofs96QTndSdVeGzgUZRqouKSJlzdOzg32SxHvXf/tKyB32jySXQY+KVWDjuIKYMXqn0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YymkmO4vWNLkqQgOo85Q6WOk/mVdaFmUebSsa8FVfJShsviCVqB
	5e++7JWuRX+Ja7ydEEvSTZXh2n2WxRlVP28F4QES+XC7eSfdSLQqxdRQ
X-Gm-Gg: ASbGncueiDMw10V1MeAh028DvsMqcKXSe72eUeC6imk+cXee5fQV0ARumc9tvs4sjCQ
	IZ8zkiPu02VpHvk2g+9toAi8tXP48iXt7KUE9C6tUk5Ixi8NxPD+qG9imhKgduEatENIxyuVj8J
	CUaGjAe92/5+u3DQAuko5SW2F9xOMpylpfhC1twqgPM0fdGcluTMqCsOsOghH2VMDsR5q4xgee/
	UYtzykPph5HhPFVI2eDg+wdwXw7CoVnVCkv7s5B325r+U9Q3sViPOvaMTfjb1RIzl84pj1F6npg
	xune8Vg6jbp0lflWNRTKR4HOQFd4gTU6DLJsTqH35DGq495NbXydbd9PbtHsVOt4qaj/vnlVQ0j
	IabVkwaWZiBtHVMMHgABrm01M9RmdFzpyHt/q/+zbnJ135h8o6DpIkQ==
X-Google-Smtp-Source: AGHT+IGLYz4jfjdFSz+MYmIiQbcg7D/ueOUPZPKysgwUDND7TVCItTEm/+HVOxXfc/JBMcUVkJEbug==
X-Received: by 2002:a05:6402:4559:b0:62b:2899:5b31 with SMTP id 4fb4d7f45d1cf-62ed80b6b91mr7436333a12.5.1757835694751;
        Sun, 14 Sep 2025 00:41:34 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad741sm6752413a12.21.2025.09.14.00.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 00:41:34 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Shane Fagan <mail@shanefagan.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X670E-E GAMING WIFI
Date: Sun, 14 Sep 2025 09:41:14 +0200
Message-ID: <20250914074125.135656-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shane Fagan <mail@shanefagan.com>

Add support for ROG STRIX X670E-E GAMING WIFI

Signed-off-by: Shane Fagan <mail@shanefagan.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 6a9c5f30e016..836d41373848 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -33,6 +33,7 @@ Supported boards:
  * ROG STRIX X570-E GAMING WIFI II
  * ROG STRIX X570-F GAMING
  * ROG STRIX X570-I GAMING
+ * ROG STRIX X670E-E GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
  * ROG STRIX Z390-F GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 32d4dd26aa84..3f6d89bcc8a2 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -614,6 +614,13 @@ static const struct ec_board_info board_info_strix_x570_i_gaming = {
 	.family = family_amd_500_series,
 };
 
+static const struct ec_board_info board_info_strix_x670e_e_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB  | SENSOR_TEMP_VRM,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_x670e_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 			SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
@@ -764,6 +771,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x570_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X570-I GAMING",
 					&board_info_strix_x570_i_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-E GAMING WIFI",
+					&board_info_strix_x670e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-I GAMING WIFI",
 					&board_info_strix_x670e_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-I GAMING WIFI",
-- 
2.51.0

