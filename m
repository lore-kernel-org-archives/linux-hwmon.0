Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD7076DB6
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Dec 2023 23:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="YW5xSbd0"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bb8977162aso92789b6e.2
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Dec 2023 15:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703201497; x=1703806297; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=trj2UjC/YtIz6QCG5+fR8YcYr1hMRs+1oPS6HsPhuyM=;
        b=YW5xSbd0ll37d8d2+DgOguuHxjLQ2wPOSy0FTweZR4c8zPu8NWdMQqBSWIQMpw8OIl
         GDqrxEwu8lw/ahLQtnqcyO0HkrodnayxaJ3DN81R8W9Q5v84kMMM/RMUEnczeLQzFawX
         UctD40+1qNVX2aeMLu4spxban5kIAPRHG1n9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703201497; x=1703806297;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=trj2UjC/YtIz6QCG5+fR8YcYr1hMRs+1oPS6HsPhuyM=;
        b=wIiO20eb/oRtmzfY3XJvczfUm70FP08rolLSiSiKT7payn1FKNLMZ9QZSo20N5Ughn
         2Hx/4ESYV/ZDUjPNW7/RtTraTB450kg7A3hii8qz2hlmwZx000Q8cF4zuQ4rVaQPV1LG
         0MU4GlkL8YCzAuMx/5WOZgZhpKXmLiD/J/5O6CCzVAiVJoyY61Ml6wuvM378HMGX5IDH
         JcjtvQ8NcymMeRNg9Q4mc92TSDtEYNj2pUQKm1Ezp147LNCIzYTVtF/Xge4Sg0bQpS7C
         QvhqVrocfmMKI9W4OBGmQUIwT4gtAq/muIKPW+AjOCbUFBNXxOrnZ9OzkhYc8ysKQ+LX
         NhSw==
X-Gm-Message-State: AOJu0YzLYTBN1OHfeHdhjzqoQUK4sCl+cA8IROCPMpemiSKzScH+5vAH
	p0iBW0PkELkkwacrN1ZddgWCejfvN6tV3Q==
X-Google-Smtp-Source: AGHT+IHeRemHWemfuJkcauBZwWcQTQ0ufpigRSxdQmvyuLI9JfySLwoJ3RY6QxVIRPjSQqj0+bVXqQ==
X-Received: by 2002:a05:6808:398d:b0:3b8:4841:2bae with SMTP id gq13-20020a056808398d00b003b848412baemr612259oib.19.1703201497380;
        Thu, 21 Dec 2023 15:31:37 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id ew11-20020a0562140aab00b0067f626a5b2esm957438qvb.74.2023.12.21.15.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 15:31:36 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: rdunlap@infradead.org
Cc: corbet@lwn.net,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luzmaximilian@gmail.com
Subject: [PATCH v2] hwmon: clarify intent of fan min/max
Date: Thu, 21 Dec 2023 18:31:33 -0500
Message-Id: <20231221233133.14978-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <40285311-8adc-4ca9-86ce-27c8b723a102@infradead.org>
References: <40285311-8adc-4ca9-86ce-27c8b723a102@infradead.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

This adds a link to the hwmon sysfs attributes in the hwmon patch
submission bullet points. It also adds an explanation denoting the
intent of the fan min and max attributes.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
---
 Documentation/hwmon/submitting-patches.rst |  4 +++-
 Documentation/hwmon/sysfs-interface.rst    | 12 +++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/submitting-patches.rst b/Documentation/hwmon/submitting-patches.rst
index 6482c4f13..d634c41d7 100644
--- a/Documentation/hwmon/submitting-patches.rst
+++ b/Documentation/hwmon/submitting-patches.rst
@@ -141,7 +141,9 @@ increase the chances of your change being accepted.
 
 * When deciding which sysfs attributes to support, look at the chip's
   capabilities. While we do not expect your driver to support everything the
-  chip may offer, it should at least support all limits and alarms.
+  chip may offer, it should at least support all limits and alarms. Only
+  add attributes that follow the intent of the attributes, as described in
+  Documentation/hwmon/sysfs-interface.rst.
 
 * Last but not least, please check if a driver for your chip already exists
   before starting to write a new driver. Especially for temperature sensors,
diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index f76e9f8cc..edfde3b13 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -167,13 +167,19 @@ Fans
 ****
 
 `fan[1-*]_min`
-		Fan minimum value
+		Fan minimum value. This is intended as a way to specify
+		the desired minimum speed to the device if the device
+		supports that. It is not intended for communicating
+		a constant that denotes the lowest possible fan speed.
 
 `fan[1-*]_max`
-		Fan maximum value
+		Fan maximum value. This is intended as a way to specify
+		the desired maximum speed to the device if the device
+		supports that. It is not intended for communicating
+		a constant that denotes the highest possible fan speed.
 
 `fan[1-*]_input`
-		Fan input value.
+		Fan input value. This is the fan's current speed.
 
 `fan[1-*]_div`
 		Fan divisor.
-- 
2.17.1

