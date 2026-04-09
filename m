Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A0A244675
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 19:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775762741; cv=none; b=F/k+CgR7tCzdSWciHqn6FSasrXGbf27hkthTn0BRbJpqPPg9rsFkugpNchHwM/e2qcWfDvJd6MS2FH3691pvxH/cSSfDwS5NgUqk0tbTrjvULPJHw7dAq5C7Ee9lfSt5LsuUuX5y34SJfctmYYEisNpRY00ce/1J+xf8gwUC2bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775762741; c=relaxed/simple;
	bh=Shlml1x04AqaKJFSbdD+a8pxqKdd4p83WPB+tCnh8g0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSKzHKx424qQ8VqS3YY1TynCR2aCbnITHlvuxmoW3NbChh1Ru7LOmGWPsMc3GSvEkXu/KjXg7mvI5shQLxRkwooxy2WaoRRA10kaRn5NnGXw9+YHF6Pt059VilIj30GsNtQH/C0Z7wOr9NDBxj2g2kQdumgF8OF6Xim+HYFIfZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygt5y9K1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygt5y9K1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfd96354aso802077f8f.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2026 12:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775762738; x=1776367538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFLCLjfa7UD1L4DDesk5U5lkx8vWDPtLxcV4qQo9Nqc=;
        b=Ygt5y9K1/FcHVZmG6s5z+WB6wdg7KbtWx7y6pI97xuoQs0edjDMp0tFU6gcDpB5ot7
         nnOi3dAoR2QDn+7T7b4HVcFGSd6p6TlEJXkoWmS6kDkRPkm8tw/rgwB5MUNoDJq8que3
         UpT0aEmbKrbs0xnnrbi1w3+lPZbyjJ8HK4vTugzqNx49bQDkguQNE6BobojLh1L9p9mY
         NnzzD3es1gLDXDvG8/qGjotwqNdHT3umoLUTSOTwDqHgPPjvxijtECL3gu30bYH6/0/m
         1RLHRvCcjY/7xnG55kF5SjdhzhMJWWcndWPpIbJYck5FN5QR9eCPZ8XUZsx3y9bNEf86
         clMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775762738; x=1776367538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFLCLjfa7UD1L4DDesk5U5lkx8vWDPtLxcV4qQo9Nqc=;
        b=gnATtSXvkPMvL1tUSCLYPSrNrhumMzgZw+g469y+MMYnMpv42D/tFnpb7Rv5xbXG4Y
         OQEhgHzbcxhixCfCb5VjiAUnXRTAq+MTSER6nuy4jwl2/7B3CWCQdjBDqTgKxAkQ+ZG7
         rwqd/3LqV03XJ3NsWNs32NLO1EtdQtfPq29xNiqPAZ8yglqrVgR1+Ofxl+X0cum5QxaN
         7oCLo6DJMORS9oYd7PSYSQUPFFl7DfwUL08JBPpYeNfndTbMStSniHTJ9dBOswxyrV+o
         buPBIWLI4JH6j9eka1SdgE9bmpwFLld/k/gLpq/WyRQLxHuZRoK5rGkQmtIxAB1AqCvI
         CXJQ==
X-Gm-Message-State: AOJu0Yw89AZrZGumDkIXQH0wx7pntYpV4D5deI/dDlrNyn8IzuQzx0hc
	k5FBswSy9hYTRlA/PbGfRXcCdYlhQb41VBVymZZch0jBqeFSIbO+6SNu
X-Gm-Gg: AeBDiesXBKHm5b6HKMcKW7d1vloR55Bct5sVMB/ONDfZtNEIM65pfAYSZWTLhmjsP6r
	Gejqwp7ZIiKMlU7VEEPqnIkFC0h3yFU5DalRWJ6BNx4u3yjavtOblSYQYPgF2Foh/zol22wBPJD
	jC/UDbJUC6yrwO0BtGrF9nlKoXciaVfBSZvEpAPhQrIVRkAR6DlyypQuXoEb5Ib7DRy3frwThJc
	KXym2ZptWXXltsHqhdomdjozkq35Jml2yYuli4McsshYhc0Utw4ZeioM2Ba5GhPnJfI5k5WvE+0
	k1HT6t5KUMxA/2vz1pL4rzyxMPE4W5JfyiMb7iF+prCGX6yYd2L8cMK50O0UadqdKfzdQVB3uj4
	iPWKEPwAR7WICV2LMRvHyix9Zy0TXgkG6gZpHoYih1kH8l0wgQHh6nPxxWErY/CklI+8Gb15t4i
	nx4w+qpZXeB8fcXyH9MZ376QKlkfQZqsrHquHeiPJk8RIS6+rBZfhlRHvyCdllQWXZx3Iznrk49
	+TV1p0ayYXV88860oiYO6FFQOZbNqAQGomtjgrFK+PWogHPqhp6TV717mimmCOdLm1st1AL
X-Received: by 2002:a05:6000:2c06:b0:439:fc2c:363e with SMTP id ffacd0b85a97d-43d642703f3mr411939f8f.13.1775762737928;
        Thu, 09 Apr 2026 12:25:37 -0700 (PDT)
Received: from fedora (host31-51-210-33.range31-51.btcentralplus.com. [31.51.210.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5ccdasm1019732f8f.34.2026.04.09.12.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 12:25:37 -0700 (PDT)
From: Josh Hesketh <josh.hesketh@gmail.com>
To: eugene.shalygin@gmail.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Josh Hesketh <josh.hesketh@gmail.com>
Subject: [PATCH] hwmon: asus-ec-sensors: remove braces from single-statement blocks
Date: Thu,  9 Apr 2026 20:24:38 +0100
Message-ID: <20260409192438.15383-1-josh.hesketh@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces from single-statement if blocks
to follow kernel style guidelines

Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index adedaf0db10e..22a52c8f72a6 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -1027,9 +1027,8 @@ static void setup_sensor_data(struct ec_sensors_data *ec)
 				break;
 			}
 		}
-		if (!bank_found) {
+		if (!bank_found)
 			ec->banks[ec->nr_banks++] = bank;
-		}
 		s++;
 	}
 	sort(ec->banks, ec->nr_banks, 1, bank_compare, NULL);
@@ -1086,9 +1085,8 @@ static int asus_ec_bank_switch(u8 bank, u8 *old)
 {
 	int status = 0;
 
-	if (old) {
+	if (old)
 		status = ec_read(ASUS_EC_BANK_REGISTER, old);
-	}
 	if (status || (old && (*old == bank)))
 		return status;
 	return ec_write(ASUS_EC_BANK_REGISTER, bank);
@@ -1125,9 +1123,8 @@ static int asus_ec_block_read(const struct device *dev,
 		}
 		for (ireg = 0; ireg < ec->nr_registers; ireg++) {
 			reg_bank = register_bank(ec->registers[ireg]);
-			if (reg_bank < bank) {
+			if (reg_bank < bank)
 				continue;
-			}
 			ec_read(register_index(ec->registers[ireg]),
 				ec->read_buffer + ireg);
 		}
@@ -1189,9 +1186,8 @@ static int update_ec_sensors(const struct device *dev,
 
 	status = asus_ec_block_read(dev, ec);
 
-	if (!status) {
+	if (!status)
 		update_sensor_values(ec, ec->read_buffer);
-	}
 
 	if (!ec->lock_data.unlock(&ec->lock_data))
 		dev_err(dev, "Failed to release mutex");
@@ -1240,9 +1236,8 @@ static int asus_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	struct ec_sensors_data *state = dev_get_drvdata(dev);
 	int sidx = find_ec_sensor_index(state, type, channel);
 
-	if (sidx < 0) {
+	if (sidx < 0)
 		return sidx;
-	}
 
 	ret = get_cached_value_or_update(dev, sidx, state, &value);
 	if (!ret) {
-- 
2.53.0

