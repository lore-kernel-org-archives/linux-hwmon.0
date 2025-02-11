Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F0253F09
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 15:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289176; cv=none; b=Qxy+d76zmDiOgrf2vVx1gm1KVUIP1/MyT0uy9trxz5wKSHXTTc8aM3Pxa+jQLotUEnjR3gqaZgrx2NDa3y1OLIj/lX90cukbCkReULq8cygVJEOeWO/hM7oK56Xs62PkpNkuUK5qcgNghdrobnBIIvFWm4jLXD8uDsfDP/V4tWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289176; c=relaxed/simple;
	bh=cj48dyNTd0s9sZhJQ9XvBi9Ios9Yn3sGSNj2XqkMGhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpSLcEHEw9WBF0LYEIBDR6dWkojf6C3jy9sG/GvY4/fHsCF4xOqo57E30aj798y6+aiAaALsl4sa6x0NUZnHzWLIbgOHkwm8dlzVRhFldeF7HHHwPzTv6Wva2aNuE/mkqBpYS3LPxzX29c4PIbqdmGMFQEA+QZ3sqPrg0n7/5tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGC7jMb3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGC7jMb3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f573ff39bso85707925ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 07:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739289174; x=1739893974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20eQb4tQxHftvzVRi2J/iaF928YwTfWnxa70RPeCWJw=;
        b=PGC7jMb3FcO4b9IORpBKpIpkwSU/QVGtbApeli76jzMmyi6oYgepeFe9GjBaJzmI4j
         7sdbZ5QnWdlQcNuxkDkrk3wNjGXYtOjnA0QXxZ82vHuKEhGUrxdLHUNHzFRAs9GjNwYY
         0eGxPKwrdwyaY8QxJLw8ftWkmjr1oNqvXcdK32NeeJltbC3SdQkZWQ4nYge8bJG5FRhe
         tznGiImPmZ3lKAKjHFIWvqVX9NTEqvfHqkKiipDO3X3rIFaRxT8mcDi+fJ3JqH/TudMQ
         9IzN81m95RiimU8H/NYouiQQt9ob5MXKYxNwaagMfMvm+/DRvxGAeaSBDAXm/uQ1MooD
         /w8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289174; x=1739893974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20eQb4tQxHftvzVRi2J/iaF928YwTfWnxa70RPeCWJw=;
        b=bFUPU2dFHvURsuRGQoyNyL8vMLXMn0kcOAOy5NSH6oSHr63loHrclyfzp4t9IkDaXp
         vpzDZ5o1ykILfGFUujsV/aeK88iifBVTAUrHwpgZnmmSfanViIT0Rew1Rzu76K+PrUNA
         UINBhPZQxHegq65nZw969JlCEKeWN0jSkF8qH3hdQYGVuUICgNU75aT2NXUkEM8ejU9t
         vOZYEsmrUKV63EsKfrHdeoDreZPIcJG1BDFd2NmjNfXFhkz9WBW7PenJ2jQa9UmC9ASm
         +d1qBD8Wau6bPS7NZm8EjBsd7V4+DXWt9iygBIfgPzTcWwL0jxuGacIaN44zvQ/0hnYg
         CgsA==
X-Gm-Message-State: AOJu0YyXDH6iXOzAj36tkXikjlkNyCuasgrpFHx9ZH449OuAabAf9Tdt
	lYy7yCNPh2HpOHu/s/R+fHYhlhr6px5aTO7P2xP5/KjYLLFWu+G9F9HuIg==
X-Gm-Gg: ASbGnctGHyOfwLXumdOtDoSkNgpXMRHOQit88yYTISolzxFVGj82/Ya006zy2yPjk3m
	vQv93Y73NWyFUHEo3HksTIxWVm5dQpx7nBuspNFbtZSgM+Dpr4rn5SoUqB8+5fNIqFLS+njC0SN
	fVeHAD+3hfKEITq05O9mauKDZLh47uCctmJK6cYhAnNfQTqO3hTmrRXFI2ghWkhWIUb88cEggHb
	zhTKC/HJ7wQw6davk9mH459IEMsyP/oChsstALzTLxRKptuYlWsGsudHS/QP0e2v6yUDir0pYRW
	zUNCONCzPZgq79Kc+GBnfUH3lJ3/
X-Google-Smtp-Source: AGHT+IHab0C5kAALQQ4tG+Q0A+yoiWaUpk3a7yCBSDSZNGsW0WHJokWLo6bhWIUWtbku0x81KG7oRg==
X-Received: by 2002:a17:903:32c6:b0:215:94eb:adb6 with SMTP id d9443c01a7336-2207d0221c1mr2990745ad.40.1739289174141;
        Tue, 11 Feb 2025 07:52:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653cbbasm98518995ad.79.2025.02.11.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:52:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 5/8] hwmon: (pmbus/core) Declare regulator notification function as void
Date: Tue, 11 Feb 2025 07:52:37 -0800
Message-ID: <20250211155240.2077464-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211155240.2077464-1-linux@roeck-us.net>
References: <20250211155240.2077464-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulator notification function never returns an error.
Declare it as void.

While at it, fix its indentation.

No functional change.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/pmbus/pmbus_core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 39cdcbb96215..3085afc9c1ed 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3313,17 +3313,16 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 	return 0;
 }
 
-static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
+static void pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
 {
-		int j;
+	int j;
 
-		for (j = 0; j < data->info->num_regulators; j++) {
-			if (page == rdev_get_id(data->rdevs[j])) {
-				regulator_notifier_call_chain(data->rdevs[j], event, NULL);
-				break;
-			}
+	for (j = 0; j < data->info->num_regulators; j++) {
+		if (page == rdev_get_id(data->rdevs[j])) {
+			regulator_notifier_call_chain(data->rdevs[j], event, NULL);
+			break;
 		}
-		return 0;
+	}
 }
 #else
 static int pmbus_regulator_register(struct pmbus_data *data)
@@ -3331,9 +3330,8 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 	return 0;
 }
 
-static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
+static void pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
 {
-		return 0;
 }
 #endif
 
-- 
2.45.2

