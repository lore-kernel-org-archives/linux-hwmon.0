Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B94220F3E
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 23:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785023317; cv=none; b=SSiQTbdxObLTJ2c8VldzxgfFnoL8iiZDmy/I3PpljQdQBwQe/xY2tj9u/y1yejHLlj7OcCmF3Tshw2SWVWKGUKpWTeJYGqzV743q19X/S85yw63oOAMDZT0baRa8qL+PIOeZee2VWC3vVj453padCO9bLvGgD29UJqYNacKeFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785023317; c=relaxed/simple;
	bh=qPW6fx5to97rMGKkaH4tadgjuQOncETyeW5CvoID6KU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YwwQbVJ5d0+j7xm0K9ff7ipgYSv09rtRgZsRqQ+BDAwVxfwwAxz0H37jmMDGI7jjfUUueQ/tZN0E1xSvI0p0dKPaBugnV/kb92OQJJ8nkGMoZGx9BJUs7uE0bQumZjP85P22f8WbbCh/M8ng20ZubdynBmwohu7xqVdFb7EtmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWbAPfX6; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWbAPfX6"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbb973e6749so1854885a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 16:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785023315; x=1785628115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UA6JyjodUlepw1arqmSZrR5lowCqhPIe5fLUVreoOjk=;
        b=ZWbAPfX6uJi/ZvzQoac8m65OrGyeg/fcvSIlb5hkJuXrTzszjrAu+EGzlQhZX5JUZz
         NsTLvWZLLMybtJlqaQmU6tQEUOiytFJRPJJp9eHc9mhv7JWiRb5rGv0VtTnG+jqAcq1h
         BPGOGiZxao5xVNkTqULO9EeNi0V602UyO78lLlSMA+s3m2ALRdU4yf5u5PPF9D6+fn0j
         wfzZZOruMzMvkgpdPUP6fZkB4DzLZM01WAms+JhTS/VvDWjslwhwdR7wIIWlS45+gO2k
         JViBOPB7U8NjUSs9FzhpMOxMZmJeeTQsiAoF1BL5kgOpD//5ei3pAwOSOCNwRNRUXfkh
         /Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785023315; x=1785628115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UA6JyjodUlepw1arqmSZrR5lowCqhPIe5fLUVreoOjk=;
        b=CJr4FGy9/0xyH6bk2cdHdms7OW1q5IS3+jOkmBxYBV9ovOr58qY9fGYqxl7V45XVS1
         fgnmruAE73C4x3IA70+XjQrKZcPUmGFNzCRVoG1cxn+S7jPn7266332yCSBXRwAjEMbb
         Fe1ZinJDlzsRYtiQ48mj76fYBNrqd5CWepoCqU2CterwV9FubaqhlaiG9xxnf1mDo4XR
         sDzF+Z0haRvkrK2N2IYjuzNGUgRDtjpyAD8EigBx25dmsYPLQw2r6xU3jti9Ka61r6kX
         6AZiQ6OBP7A5mmZ5Ekzv95wKF4v18XU7VPd8hNFvBcDjokkyOfc0FJy+NUTfALM9ZBKt
         ALkw==
X-Gm-Message-State: AOJu0YxTn5jU72k1yUQB2aeEduvUuKRXaX5vWqMZQ/Gv0H63nfm9KvtB
	MwdIrEICFXiqkHm/ifUq7/YfvfC6OOeEalAKtxLuIVQtqc63qebaLaMdGF+DlA==
X-Gm-Gg: AR+sD10n8Nhn2VqjSPAV37RHQ3ZjDkuu+MCMbW1cf5K6XNGGFooP7kEmx5SWsPYIlEk
	Cqu/43YyNV6PJM4hsID9zYBV9pb/chKZsHnmiimShENr0vkkGdsLrij6URBb8/NhHZ9X7akBfzs
	5ltq29EY4lG9IxoLaGWwnYZB7VTc/KGbq7xkiIYkpHaWtLy9j6tWT4f5aemb68XFP7DGPMEOzsn
	Nvi0aPUdVKiG/ZrcyTsSYZeYhtaFJYlP/+RKfnXBl7wlWyxI3g9g3Pt28tdeJRHb668KMI+URUK
	nEouP7TERYbSyAaJIauJ76hvn/TOqlPWHWErl/Mk5EyE/HBmUaQYsUpQ6YRDN5JOI/macCy38Jb
	vKKlvytPBKoCg8+CoUqm/Y5DXZ/ku1tpVcBKamgtEhAGxCucF/PYJLU8QjC7cF+XlSrwgKP+o4U
	tFmX0An0fFoQw4YYlIl9cYC+NWAA==
X-Received: by 2002:a05:6a20:431e:b0:3c3:64cb:9b99 with SMTP id adf61e73a8af0-3c67d9b39b8mr3486933637.6.1785023314831;
        Sat, 25 Jul 2026 16:48:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1285sm15940927eec.5.2026.07.25.16.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:48:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (lm90) Only report alarms if driver is ready
Date: Sat, 25 Jul 2026 16:48:31 -0700
Message-ID: <20260725234831.1949014-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Userspace can read sysfs attributes before driver registration is complete,
immediately after devm_hwmon_device_register_with_info() has been called.
At that time, data->hwmon_dev is not yet initialized. This can trigger
a NULL pointer access since lm90_update_device() and with it
lm90_update_alarms_locked() will be called. This call schedules
report_work and lm90_report_alarms(), which passes the still-NULL
data->hwmon_dev to hwmon_notify_event() and triggers a NULL pointer
dereference.

Fix the problem by only scheduling the worker if data->hwmon_dev is set.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: f6d0775119fb9 ("hwmon: (lm90) Rework alarm/status handling")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 4b9c0ccdf260..b03f75f4ddec 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1194,7 +1194,7 @@ static int lm90_update_alarms_locked(struct lm90_data *data, bool force)
 		check_enable = (client->irq || !(data->config_orig & 0x80)) &&
 			(data->config & 0x80);
 
-		if (force || check_enable)
+		if (data->hwmon_dev && (force || check_enable))
 			schedule_work(&data->report_work);
 
 		/*
-- 
2.45.2

