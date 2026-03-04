Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8B9309DB5
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 07:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608120; cv=none; b=olgRvG/86ebBAjl3P5Wl3YPnWu8EEP2Wn3ItjgBZmnr7cWyfuiKF7C2ns9IEGw1CVgWRm31RXqxh0ojQ8qwX+kNiDWF4ooyrgVbWetHVm5D3V7ZMosz7OLBvIFgKtDV9K2YTswzIEl7wdRzvPAfW8lEyWNi8ju/gx+0lbGES3f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608120; c=relaxed/simple;
	bh=2D7OmnZNznfr12HRuVWR6Mw7dZPUCmEaw/CtC/IUQUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a6eFVu38uj8ofhWBHK056P969VKrFuQU6tr/Y/VcoiRmm8oQIsN4u+H0LKJBo5eE6E6wY27i+4gznR2O1WdfAiNvkrfnMKHo9nL0w176rcrsZXz+E58cAFAKyOONLn0rbFq0J7S0/83FxVkhdQE33h7IdpMRLPKL6JB5q0FJPVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1tyj4T8; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1tyj4T8"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bded9bf7a7so4764266eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 23:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772608119; x=1773212919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8nGnzPrNPl6mGWCEnP6l5wCtiMPY7eXNdUImo32HCY=;
        b=T1tyj4T8hQn2u90OpmQNEH/2pW5Qvgqzu1vIOrB0hNqT5B7No/M19Ma+oL8YaIaFf/
         23OWDOg+zfu8GOXnoK3V9tFX/wRhy6GYCOQbBykdjgi3mbjxMm/yHzYe08x4Fh7I+hLT
         wl3x+rrffbBOch7rMFE/ZXW9mMMVrcCI7OJu7yeqCtBksmA8++EKVIBQr3hujZoJnttV
         1Bb1ViodrdPobZmM0c1tFT9cJjOOHvj+WcqW9Yu8ZigztqOMXTJsflQYQ+h8G68tshjX
         a8HDoIanw/Kwuct06EPRdwkBcoDyVYPSrwpt7GTnXZ0BP2ghQUrrPSJmdB7ZLhLDvVCY
         rfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608119; x=1773212919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s8nGnzPrNPl6mGWCEnP6l5wCtiMPY7eXNdUImo32HCY=;
        b=VboVo+HU0np+mrNjigUt9vcMRCD60TiVoooirKh9J/IisTzhMkXQxFy/pwmlYhRj8a
         lZMUc650w9jNNG7QUisVSPP0VlnlMdsiJwzUPsAM7yWCepRmDpQVKooWqNsp0IDdgDzQ
         XItQM9DURvnM+sAykQy9mI5LGQr8UmJ4pKZj5oSyYvKSs4fh8gYxP3JTYcCxSzGGi04J
         jT0Y4GslMbfTk6tuSHU6cODVU9oIJRneG1pxSsjrl/W/EPC09FWasjtMGNhfOu+Cq9Bx
         0DgIZ+5vVKiMMDWbfYsOrmjrsNAL2IYdDwjiKywahYDejHDVz3M/GFLSXeLSSQ9h1wHp
         Fw4g==
X-Gm-Message-State: AOJu0YwmR7ApHj6sj0nECz0UemQZp72MesrCTAC5tHPNvEpPfEUiGgaP
	srZc15zpdW2TuZDQMp12tpWIwKg+5LKqsrJPONx9zcST/C9lQ/3rjtBYOKY0Ow==
X-Gm-Gg: ATEYQzyI3Ug5HXHQOf/odipzA3XUOB/NOqxg5Joo/ZrSrmoAAbTBwL63Wn9fz/Yqr81
	VtUbUSrVaw7T4xNyYNRr+05stNJ30HcyleXadz0hOEzvcWpy/XZ0vlQGYkQuxm+ZeUNypzaIM/p
	2nZoiFwlSBtCCCs0M92aYnCkJFxxIamFU/v8weVRJbzdCK/V23xoa16FECzgShQc/+tbTyLXzrk
	VHec6kBmmglNhrk8glFxS6T3FPAfSbdIo+fuxZR/AKo3KLoLjsJjI9Sejh1kSmW/DhyPxbWnmfq
	HU4cfSeEBMnwxKiNRHjFOcWGzi646A0nxh6L+m6oLNvZ+IPD7EYfFmgKBjt7NcPG+/OebGMR9T0
	vDQQJw9vlxrT3JIRspCTBi2n3NpC1AUE7TQpBGlNmoi49p1t3zX5PXbajteytl0Oj6l5ItALwy5
	lWJ1pr/PT+kfniXbMzTJ5JXB9RveUeSDQjo11//e0Mt2FgQgBKGgbEq2WWarfYEDqbT7MpFFoR8
	54DEoLD9Nw=
X-Received: by 2002:a05:7301:2f88:b0:2be:778:49aa with SMTP id 5a478bee46e88-2be3108f8d4mr323361eec.27.1772608118477;
        Tue, 03 Mar 2026 23:08:38 -0800 (PST)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2f5f1f4dsm831673eec.25.2026.03.03.23.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:08:37 -0800 (PST)
From: Sanman Pradhan <sanman.p211993@gmail.com>
X-Google-Original-From: Sanman Pradhan <psanman@juniper.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	andriy.shevchenko@intel.com,
	Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v2] hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read
Date: Tue,  3 Mar 2026 23:06:08 -0800
Message-Id: <20260304070607.1942-1-psanman@juniper.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <SA1PR05MB8708FB8CDA1A57DE77D158A7BA7CA@SA1PR05MB8708.namprd05.prod.outlook.com>
References: <SA1PR05MB8708FB8CDA1A57DE77D158A7BA7CA@SA1PR05MB8708.namprd05.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The q54sj108a2_debugfs_read function suffers from a stack buffer overflow
due to incorrect arguments passed to bin2hex(). The function currently
passes 'data' as the destination and 'data_char' as the source.

Because bin2hex() converts each input byte into two hex characters, a
32-byte block read results in 64 bytes of output. Since 'data' is only
34 bytes (I2C_SMBUS_BLOCK_MAX + 2), this writes 30 bytes past the end
of the buffer onto the stack.

Additionally, the arguments were swapped: it was reading from the
zero-initialized 'data_char' and writing to 'data', resulting in
all-zero output regardless of the actual I2C read.

Fix this by:
1. Expanding 'data_char' to 66 bytes to safely hold the hex output.
2. Correcting the bin2hex() argument order and using the actual read count.
3. Using a pointer to select the correct output buffer for the final
   simple_read_from_buffer call.

Fixes: d014538aa385 ("hwmon: (pmbus) Driver for Delta power supplies Q54SJ108A2")
Cc: stable@vger.kernel.org
Signed-off-by: Sanman Pradhan <psanman@juniper.net>
---

v2:
- Fixed email formatting/line-wrapping issues

---
 drivers/hwmon/pmbus/q54sj108a2.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index fc030ca34480..d5d60a9af8c5 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -79,7 +79,8 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 	int idx = *idxp;
 	struct q54sj108a2_data *psu = to_psu(idxp, idx);
 	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
-	char data_char[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	char data_char[I2C_SMBUS_BLOCK_MAX * 2 + 2] = { 0 };
+	char *out = data;
 	char *res;
 
 	switch (idx) {
@@ -150,27 +151,27 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
 		if (rc < 0)
 			return rc;
 
-		res = bin2hex(data, data_char, 32);
-		rc = res - data;
-
+		res = bin2hex(data_char, data, rc);
+		rc = res - data_char;
+		out = data_char;
 		break;
 	case Q54SJ108A2_DEBUGFS_FLASH_KEY:
 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, data);
 		if (rc < 0)
 			return rc;
 
-		res = bin2hex(data, data_char, 4);
-		rc = res - data;
-
+		res = bin2hex(data_char, data, rc);
+		rc = res - data_char;
+		out = data_char;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	data[rc] = '\n';
+	out[rc] = '\n';
 	rc += 2;
 
-	return simple_read_from_buffer(buf, count, ppos, data, rc);
+	return simple_read_from_buffer(buf, count, ppos, out, rc);
 }
 
 static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *buf,
-- 
2.34.1

