Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E037719
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 04:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160033; cv=none; b=iNOAkk5kNq3t5+lhRr3hd4ArdGRnNkYno/OIA02KkA1MmI9oibJiz5P53QKcZ7t2XS8dsAriX975/e0M0SRqdtGAwLlwISce8nXp8nyUvxdzUpvIZCR/7EVdkV2LnLy2ogwH2Db4WfTfqqO2iyw4jHhqZhRMnjcV9gFK2aZzzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160033; c=relaxed/simple;
	bh=EgYOxfGmFe5uS0EZujjpIOVcYeLqOmTqrefZ4vZXeEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHxTYpDmUtogwhDA0aiVqmkEMpAX6WqMp7ihpzutyJRpmWQpMgWbIqxc2M9vIdRSKqq2/WIYj/UCyUlT2cX+lm/YdhUaAy9QUg0tYMvnCcTLlzu1w3kW6vWpzUSNWZRnaDGEu4ozq+/kDFDI9YQQGAqqt9nmj5Xx584/c68rO7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYYmnJ3N; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYYmnJ3N"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f710c17baso19437205ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Feb 2025 20:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739160031; x=1739764831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbH3LsdXcYVIlGQ3XjpZnJa8/7ao6NKRwO4znGOn17o=;
        b=fYYmnJ3Nhk3gluYU6E03Mj4w5Fwk1tWbR7GX024143za3W3NsZNepnI76QfVTk6RXd
         XuRUYV2mBd4eiPHbGH2j59OFzZMtBGjf4akyOAQf2PSO2EmpFbh/JbIcMY3ohIPXTEUu
         x9dW6G2Iv4BubjQ8kUW5ahjHa6CCm7g79crawBCOGVuF+2PZYzQArwBUU3P4DX20WH1I
         XJjFIBJC+Q83sqIHIGQxIAIBcS3n5iOJImo8n8dmud+MkzBWB/HmyF3+n54TDDmbU9Fq
         zYInIauX3z9T4SzkhZnz2M09MsJ01qrHegZ+FsDWVZ0JPUDmNTZpwwAxlxPB5SQTtFBx
         iocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739160031; x=1739764831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CbH3LsdXcYVIlGQ3XjpZnJa8/7ao6NKRwO4znGOn17o=;
        b=jPHBnXBomFwHjOf2cbis8riVhhfLT7yvc8Kb9KqtOGrrkUlpenDV4j3rKYY2/hMqIz
         l2M+Gc0hAU+9ozKxT3fOQ4zWdiM24XHqKI4IzBysGNL8yFD+1B9U+4OD5pMeMG6ul6AK
         v/5bNwqQN+iJVlwgq8yhewS6UyV+TWxR4oy+1rfnG+0lS5BCZeGGig0oR1ZOkaQ8Bz2X
         D25jIe16WQ48lSzja/yAXtoegx/S+xbGsAFer5hV+9+m1/Rv0sAbgXC61ubfXapMsJ8x
         QNBELjp7ntFpEWarLZvERMJ6ccOyhgQpfUBcekocfw+6xZTCtvAG9udWVhNw6BN/clCD
         JqVg==
X-Gm-Message-State: AOJu0YzV4YdPl5PUTKgEgklch8klFt6jdnlV6un4ESEs2mD40G4/eX2U
	YSuxXmSs2Mj+7zT4gJy6gKsVXLgvXPsbS9cUPOY4ft3A7HOmnJEzi4y5IQ==
X-Gm-Gg: ASbGnct41u4+oCyIf/9hLFNYKUm/TzA1lTdl9QDcqKe3Sp7OojqLJSHo4UzzfekrlFA
	p0LKZmguDIV9DV7GDSvHG6gpAmdENes3ygLB6TgRxgGqnRE8KOXOE90hJkPDl9aizBirUkHk5zr
	OJHk9cYH+98mA3OoTnVdMntQYibRUNZPqeNazjDvAs/0zZhRCx7KyEcBdf36nGdz2fN7sFT/DJL
	ESBlIfFoszjzypUiMhMxvY+QN3kQnxFK+v7zx+SyG2d09YJroOYaWzYPa5ZFoaHxiWizCBByFrB
	h9QjNiGcrIRukgQkkg+ZRk9SQelT
X-Google-Smtp-Source: AGHT+IEFCJWxr3VKEEYxlb3YAEV+2f6RjwJ3Dx4bv9FklHIbxN3wOu/bTLGiRdLwJBP1yTTJAzeOJA==
X-Received: by 2002:a17:903:2b03:b0:216:2dc5:2310 with SMTP id d9443c01a7336-21f4e77985cmr220563695ad.48.1739160030810;
        Sun, 09 Feb 2025 20:00:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653c997sm67123145ad.78.2025.02.09.20.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:00:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 8/8] hwmon: (pmbus/core) Report content of CAPABILITY register in debugfs
Date: Sun,  9 Feb 2025 20:00:24 -0800
Message-ID: <20250210040024.2296208-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250210040024.2296208-1-linux@roeck-us.net>
References: <20250210040024.2296208-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report the value of the CAPABILITY register in debugfs if supported.
Only check if the register is supported if PMBUS_NO_CAPABILITY
is not set.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index f4d4a91ff4aa..b2e3cd1ec941 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3585,6 +3585,15 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 	 * assume that values of the following registers are the same for all
 	 * pages and report values only for page 0.
 	 */
+	if (!(data->flags & PMBUS_NO_CAPABILITY) &&
+	    pmbus_check_byte_register(client, 0, PMBUS_CAPABILITY)) {
+		entries[idx].client = client;
+		entries[idx].page = 0;
+		entries[idx].reg = PMBUS_CAPABILITY;
+		debugfs_create_file("capability", 0444, debugfs,
+				    &entries[idx++],
+				    &pmbus_debugfs_ops);
+	}
 	if (pmbus_check_byte_register(client, 0, PMBUS_REVISION)) {
 		entries[idx].client = client;
 		entries[idx].page = 0;
-- 
2.45.2

