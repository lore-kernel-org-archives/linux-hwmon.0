Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C53358C2
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429716; cv=none; b=rOiHXNEJ0M5fL5f9HkOFxKxRtOE+hqp1SiKhugFvr3iwM9CkZ+OkWzTbdOSbeW7aix06B4X8Pj7lvPrjF+zk39YcLS2nFzkf+RCixt25sZpGy7UsCOzvTFQnTItjRZESFHK3F/EGgYmp5LMQ2VgocOPbkf5shwOfdrPP6O9N8MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429716; c=relaxed/simple;
	bh=4aZiUsgt+xSsUojpAPZM8tmAn9Cz4nlX94Ji+aNVrPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=VcocIM+/ISNyUAEsY+q3G7UZBU6AzdJ10YWBPDpqo2zYiwKlYzc25L6yKYQKmBQXS7EkHUlLXnKlaJf1udWuAHZ+VnNmc6f2Sfpc869o5MdwlBF6xH/pYEFTllzmeo4jjVE4yaVilQo8i3AhCnAgIxHCF4u2ijawmCMjVRbgYvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2jBFh0z; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o2jBFh0z"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8296d553142so1207079b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 02:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429714; x=1775034514; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58pr77FsNif7HCk/WKA1+2J9HLLbVNeB4mpW6v36PgU=;
        b=o2jBFh0zDvp25EVW8B0EiUcUZa6pMrTQ+JJZkeKrFtHSBVDqzNRCQWgYo2qIw7StVE
         nmzjuMAgy+2NXqof8RRMtCXUG1M4TXMy89VkRWD9+8RfBp5I9xBJfflwWvowX4vEEf1R
         JJlO2fEEHogDPVR+vE5WBdm3f1DOCatzC1HzbL5sa+cLgGRMHnqaX8BMU/agyLIaf/5U
         9IQzQyTd7z53bGAh1zJI6uA8Tgg2eBOSRIeDRk5e/oAFPUvUMtmVZMa4o3mx29LwOLWv
         og9XNaqPe0Yh/V3SaoGY5Lmi0WvTA3otFPDVsr71sk25QKYOavODp1NjdNR5XoU7fQvg
         uv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429714; x=1775034514;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58pr77FsNif7HCk/WKA1+2J9HLLbVNeB4mpW6v36PgU=;
        b=r+65fyFm0B0EbU3oPYOR31SmusbBduyC4YMQDbrINqZk481eQT+PKI6EkujS0ttOiK
         edGYUep0QIugkQgd0vgNl97BEoUbukhMtfh7HmQ01sV4OPS6czrVyMC1QJzPWLWQMSo1
         QTqeBeZvn0zpfPqVpRGUmqcZmWS0Gc9lM9FBow9dXD7I3D07V2t7YcYXQEQY/MWQSbXh
         iTL66G+ZSvBq7tvrDb+8bZoX7t0cJGJPDdXTXy+46WfZkloDpwc1hRjL6lvymb1Yt14X
         xnkZrxNfHuZ1hoL+5tZkdcpgfc+JFtWXygA9YXYZOAWH2gRjnHvf9RuvrvQnFEUz56hw
         l6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoC8XBhrwmCtEej0zp+tM41PxJaeA56hpZqMNFUjwElOnfmg1SHu8JFERUedQupFR4W5KcE8C83f6ivg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbVYsJcdjraEy7lJBb691ULldWsHX8Vk2umsTzNCqh2Ayt05qT
	fDA+HKQX/Yog//8XsmIsxUxvzFNav5FxR0uCjOf3vh+xjOBfskrx+8L8/USh6KzU6IXq4g==
X-Gm-Gg: ATEYQzy6wwbuZuLxTKnF9ZIekcVseiq75En29Nw+mRCfQPny/lAEZkzYJVpxtdVsozV
	yRfKc2RreUP91aeFCCvT/hkAr4kjPMpVsGGOUAOCMUgV4FiBNH+MEva3rVNAzddKqFEndMk9tup
	UcbL3kWqjlvKWunDfReOuHMrrMrZJCwCFZjpvBkFwalJMAxE51ACU1Gy01QPX+epbDRsFVgd6wf
	YahTEecF5OYHVxpJt0nTmVryCLiNBFhChHZuBXk/NXO4aSS1HmXJYoruj/VjW6uqtDVaEpWxDqr
	lw4A/XHg+cSPwY5p9SCSTeYrBhIrf9rJReJXjTNdGmt1+5KIjKuQwEcJxVNTNS7SLG0TSRwgW73
	zbtevBdfnq+jQD0XbLTLgUv6i1ONhLaT7brcozdXKuCD25fB2ZRZV9wDG4Nov4xF+tTocCFR6qN
	CRfbSk43ztsvoDU2QUL/u3pK6uvAtDftQO8OAoBb8UGUpdTPFm4Jt/MKDPgIzkmuk=
X-Received: by 2002:a05:6a00:6c8c:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82c6dfb1f4fmr2606847b3a.46.1774429714164;
        Wed, 25 Mar 2026 02:08:34 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm17476982b3a.22.2026.03.25.02.08.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:08:33 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v4 3/4] hwmon: (sht3x) Add devicetree support
Date: Wed, 25 Mar 2026 17:08:09 +0800
Message-Id: <1774429690-129139-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add of_match_table to support devicetree based instantiation.
Specific match data is used to distinguish between temperature/humidity
(SHT) and temperature-only (STS) sensors.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..f2b1d3b8eb23 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -939,8 +939,19 @@ static const struct i2c_device_id sht3x_ids[] = {
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht30", .data = (void *)sht3x },
+	{ .compatible = "sensirion,sts30", .data = (void *)sts3x },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, sht3x_of_match);
+
 static struct i2c_driver sht3x_i2c_driver = {
-	.driver.name = "sht3x",
+	.driver = {
+		.name = "sht3x",
+		.of_match_table = sht3x_of_match,
+	},
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
-- 
2.34.1

