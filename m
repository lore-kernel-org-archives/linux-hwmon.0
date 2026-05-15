Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2B3F44EA
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 22:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883127; cv=none; b=hGwoOz5FpXoqbpotp4YSFPDp2fR00v4UmjYyE3NNMIgov37nGJB48BetwGHKCemG4W8ptW/1PLwOSLbTrIpWnrdnJsABTLbTIXY35ct4ACKsPYvLOJxoEbBsl/3j3H60obSgZfgQmzHPtYuORq8/zdaTxwkvJo8gZCbHn6TnUC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883127; c=relaxed/simple;
	bh=+I0xhDp4SpUwbzVVvV+VuUoAZCghaJHfoyGjcmblC9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2/6U+YZktJgpXvhI9yFOrgH3GYT0WXHKVLdKj5mbcIdkCrwevLYt9k6WYmGIea2G5jetXLRJJrGAR1gK3rU1SsjI8rgYD8XL3U2CD+nPgKQnP8LSgu4ctXbVyYH5QghX4Wg9fgdD6ViRArrwfETBGvCllUdcC2XCh6W3XrpSK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=k1DBY4R1; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="k1DBY4R1"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso179362eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 15:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778883124; x=1779487924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bfjoVc2ZTz8zNHb4moDa0nNqdOodwiu4sj42S3RCu4=;
        b=k1DBY4R1A4jUigR/l1ua3hyy6reD7u4N3M5OZx4Xjz3ride/Zn0AUaUOQYxYsQBlGY
         jdIi5zPuu7eEtLwiBqq+jSfH8dgcb8DjnB6cx0HXgS5fzzWVqJ9GBlhbz/kWpCz7KK+W
         tCDoyGWVMuA7FF8wLBnC0Ss7i0EOgdWh0P0AP/S6vfL6uZgAzlicwoCPlfe1Oh+KDgzk
         Hs9mKieDj1+sFyJ0eFbrS7c6r6MPvsRHI5avBK+ZxqIDiK2Zjv0cQWLSDgYKp6S8jSVS
         HmaDb94oOi5GBNWirrSS0Jqf5L5BnZ8x77LXt8lj20KEPoi7geugd9Muiklsj0dYkBhh
         TwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883124; x=1779487924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+bfjoVc2ZTz8zNHb4moDa0nNqdOodwiu4sj42S3RCu4=;
        b=o0u6n3C5786cVJPMM3sR0hQ25uCC6O/7oVOfSuJP8uOPDTevjbOwexquRgzOV8xeiB
         u4uLEHHFqLDbcZ1ExgatWjwrvZH0BPANrVMmXVNVwnTNsOSfy/YsS0IpdEmV1qhMeWcr
         nYszUjtj2o3Zu/JnU+4m1P3vML5l+F0BB/paLYe3ptTchijPn7cmHchspyCNWrtNvP0n
         tSB6NECdfa5jHMNZSTFURpIe7c9dafP1GnH9QNi8u675iA0Y6tJSVd1zxcGoZPi3GMII
         Bf1f/BILUVoEMXXV4e80Nukr7gVZIokqDxRDv8jfzQ2N+xdmcYWXcE4BfN6uftIGNaoI
         GBUQ==
X-Forwarded-Encrypted: i=1; AFNElJ873AWEOX5qoVtE2KWtQwdkkn9M/V9OLAk17N528CjH7OmlAjk271nRFzgr6/CZo5k43engnMtn+YhODw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA7fEte+xQ2h7wI/IjsI1aWY0KI5zWR0Hcai9kxWftVlyY0W/O
	V1XZNDqsCNy3/hNB0HU+vDrZDuD7bGlzR0RkQmIkGqzYQRR3ax85fW/hGuWu9flpmjM=
X-Gm-Gg: Acq92OF0+chTy665LVhdZ82iZiPt9127jcQ/LXWzHczd0+bY/pVgY99foxKDg/ZBCv8
	8pQz8vuACGVlTLtjRNTWhaE99iWbnlrWFQBQfP3jdudL5HiqcnV1SETF1v4LdnM931Y9uDZjXRp
	AAKN6Ix6oCCReO310ra0T3UOy5w7sY+ku5EbTlPYS8kveYGqLMD/r0+OE541m4WWr7tTpkaUi7X
	tKBxKHxgjVHl9SRWINHW1r8sIeEuUtKQyiIofO1dtGgf1b2ULkcw6XL8hV2TTP3EsFobP5nLTjt
	va/PFyUd+h7KQNKy+kKtSG1N1+UfmbfUCcIviSreKZ7wx5gyVxmJ+IFY/YOH53+FnmHhiaRrB4A
	xbz/BpPGxKuBl1RgBx4R+F5fAhl6NJyfDQfPRhzXiPFPNwx5X5txidiavlcCMQoFOps5ac8oH+a
	yHyrZpe/mWwtHBpSYCCgHfewgzCWe6h3H48pO9
X-Received: by 2002:a05:7300:f193:b0:2df:7882:1cf3 with SMTP id 5a478bee46e88-3025eaafc91mr5186644eec.2.1778883124281;
        Fri, 15 May 2026 15:12:04 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm9626315eec.5.2026.05.15.15.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:12:03 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Fri, 15 May 2026 15:11:47 -0700
Subject: [PATCH 1/5] hwmon: (pmbus/adm1266) seed timestamp from the
 real-time clock
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-adm1266-fixes-v1-1-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
In-Reply-To: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778883122; l=1424;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=+I0xhDp4SpUwbzVVvV+VuUoAZCghaJHfoyGjcmblC9o=;
 b=o73nMyBiu8rsMOWD3agOF7Ur1lWSxqpwjd1nw0RRSHnPxVRuX4azpL6+vHSE6K0ZX8PU5iSla
 PzFKl00eeRnD8r/zEL1C8y/SvMJHCj86t0Rqp9moGxxCfWoXQb8TR1f
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_set_rtc() seeds the chip's SET_RTC register from
ktime_get_seconds(), which returns CLOCK_MONOTONIC -- i.e. seconds
since the host last booted, not seconds since the Unix epoch.

The chip stamps that value into every blackbox record it captures.
Userspace reading those timestamps back expects wall-clock seconds:
that's what the SET_RTC frame layout documents (datasheet Rev. D,
Table 84) and what every other consumer of "seconds since epoch"
assumes.  Seeding from CLOCK_MONOTONIC gives blackbox records a
timestamp that is only meaningful within a single boot of the host
and silently resets to small values on every reboot.

Switch to ktime_get_real_seconds() so the seed matches what the
register is documented to hold.

Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index d90f8f80be8e..a86666c73a5e 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -432,7 +432,7 @@ static int adm1266_set_rtc(struct adm1266_data *data)
 	char write_buf[6];
 	int i;
 
-	kt = ktime_get_seconds();
+	kt = ktime_get_real_seconds();
 
 	memset(write_buf, 0, sizeof(write_buf));
 

-- 
2.53.0

