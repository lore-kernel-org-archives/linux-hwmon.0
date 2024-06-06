Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB4146A88
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Jun 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679539; cv=none; b=jNL+NMpAtoCqJ9jsSNxoDtLAMFXGLw18ozA8jDL6fkoqlRLbT7qmuIjBf/OC4Fo45dDmNMJSN7jQUKhHdspKNA0g60GjJA8zk11vD7B3s/8hXkFfd9zMB0ijDNy6PD5NlEVDpto22DfvHo2w6Zf7rHmHQ/wo307xaHgFs+m0B1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679539; c=relaxed/simple;
	bh=me6Ty41cRCSnMOmdHM0XNnCYCzQRzAGcL0KUR6aAOg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNTOXHtq6bIg/1/Dd/8kMLzHpNTfRe+l+WECbfElPvwn+LluRmDfnODRbhO282rg2zai+z8cT+JYfYau8EYiU8E1UaiWoG42G6sumlrJJuBo1TBAWxnuIB4UfLaPIR4o7iUIjfSSfQ+HpKT4d7tDlKbw7dSKvSlIfUCDFP2YuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgWk78SX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgWk78SX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a1fe6392eso1139517a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Jun 2024 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717679536; x=1718284336; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PxE7l690bffTKUzQL4YoKYab1ziPbqqN+8E58otRGxA=;
        b=fgWk78SX8ddpC3EEREr42d64HI1y7nQ22Omr+c54YWBSAgm1ki4ftHxPuX/dFbrmax
         Vydb4RhUhLaI/5Qo1SU3NBCD40CpR2mab47hE4T6g/HAkZrTdg4pH5TO+SXWJygrmtGE
         1RTev4hbteS8gej3t/w6KljVdQRL/mslxzIGxYYdu9Zl3NKjlXPA7CZfrpDp7zse0pJp
         U2iuwZ7DG/+/aDsgKANoRzmVD0ds0xAXjqJFTrBcN1Hv6LaWP5kzlVLDsTMlawHrZtL1
         pn7LHVIjUj5gXUJN0mKs2A7hjbd/UnuUobLRcscDga1WQoJIrYYu/sOPCoh/vR9qJYuc
         zICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679536; x=1718284336;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PxE7l690bffTKUzQL4YoKYab1ziPbqqN+8E58otRGxA=;
        b=qxjyAlgaXEQqkgiIOSIwT1j1SAkwvrpJUCoLmLyF+BXo4xu03b9lOS6s6mhMzLDRlu
         fP2M+z3zJI0z7sK/ffoR5NJi7AZmtdOp8KYOLFr0DF5fxLQN8stI12yHHr5mcCdTcOA0
         HE0eln3dGK6yEr4hZ/jwBARTyLqNj4DjY5Lo+5t8VqBa07sOBDkzQU4mEIe7ehttthj1
         WozOnNMUYpDwZ7mxnQ4Tquo64/jrCVaIWvJKTQILlfXK7/HpeNWrwD8Wsy2c78dLomzp
         H89LhqW7iuYmwtg/0I7I6RScS6p6Ng+jp+3fLda1SfVhlXK3UipaBp8z8qSAttN8mJZR
         +LUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHkxL7A7Ugg2njPyGQwbQxXlU2eijofyowSRdX6zieTahxDAPdg15d6yyp/ohmyjUN2iMRSaQXqQ0eGTtLSeLWpc79xXZTr8zRsiE=
X-Gm-Message-State: AOJu0YxFWhmhSjBuA8kC5DrRg8I7KPXA7tQ7ZD9gMATBXcoTLG2bAjNt
	yYANWTV7ZhEokV84TmWyuO/hqeNzj/1dXjO5heh8iOH2K2KtrCKDwzI0w19bh+o=
X-Google-Smtp-Source: AGHT+IEz8YfL+SCPuHJF+3F2Q+2LZ4go3JrKNs5304zCp0iKQZ2Bs1sP4ET868nj7mSwau9p+NP6xg==
X-Received: by 2002:a17:906:390f:b0:a62:5ff6:c728 with SMTP id a640c23a62f3a-a69a025318amr374676066b.76.1717679535821;
        Thu, 06 Jun 2024 06:12:15 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805ccb1csm96890166b.80.2024.06.06.06.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:12:15 -0700 (PDT)
Date: Thu, 6 Jun 2024 16:12:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (cros_ec) Prevent read overflow in probe()
Message-ID: <42331b70-bd3c-496c-8c79-3ec4faad40b8@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "resp.sensor_name" comes from cros_ec_cmd() and it hasn't necessarily
been NUL terminated.  We had not intended to read past "sensor_name_size"
bytes, however, there is a width vs precision bug in the format string.
The format needs to be precision '%.*s' instead of width '%*s'.
Precision prevents an out of bounds read, but width is a no-op.

Fixes: bc3e45258096 ("hwmon: add ChromeOS EC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwmon/cros_ec_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 41f268fa8260..b3ba7247e06b 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -212,7 +212,7 @@ static void cros_ec_hwmon_probe_temp_sensors(struct device *dev, struct cros_ec_
 			continue;
 
 		sensor_name_size = strnlen(resp.sensor_name, sizeof(resp.sensor_name));
-		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%*s",
+		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
 							    (int)sensor_name_size,
 							    resp.sensor_name);
 	}
-- 
2.43.0

