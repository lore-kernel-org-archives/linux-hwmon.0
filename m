Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605B73546FE
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730532; cv=none; b=kwwPRDe1mIBO4gHLNpsE3uVNXJgqL8MGugFpzUGCElisco+dxMGv59RhMqDkA0aJSi2RmT3GFV+tCeajrdCfURe3fQ0fgYIPLSB9DB2FsS88uilaFjZlQLgN7Xi3hlFp3mGsNI3M6uDC8e1ebRaO2Fvua11XfM9FPe17o5oYNoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730532; c=relaxed/simple;
	bh=vXIWMxe3Uww7AcKwANpmJ5A0Ol7y9EokqZn9vBIJzaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jLx1cmDJOGSNfMwEGFftHwoypnmAqKq2/oYe7QUSwCbNIBywKtdN80Q9XxIsXKgb2VH1bBeIz8hKJ0EyEAxGOiYbEeQS2SlYkVVvM3rMelxRyl//Ul4j4eWgnVQBOkRbNWqT8tRKjL5ROTmFNBsdYRmfwvZvS/l8AUHUizDICjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEezeaMh; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEezeaMh"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so10815981a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784730529; x=1785335329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vKNjE79oreENMLoTNyhPbXKbIGZ+vMn6OpqVeGvJ5t4=;
        b=fEezeaMhI2ctk3Ge0cW5lDauzMfwHV4RJiFESOQaA1+ktxq1WzlxPnBWKVG2qUHrJE
         dAwiliUIH5zFjDw89lgS0u7P2g9gRMiie00ZBPhHMG2ZCjE8W1iOJ9EGhJx8Yx1kYI0/
         6EOMFvDxtwkF2lMyiEQCUCJWniDpZfgUmpRM/lhydlt40UjiktKQOkJ8yK8tqRdgxPp7
         VaqHl66Wsl/kkNSEejzxArzCYEWhtNZg3hQjXzHIpUXbEACJHm4IafvctotmNwKATKcp
         SvxwlJOnsdAZCxqzoNJJIY2CNPyh1qDxrw8rbJck8gT/sqbbeVXRMGD9fCnbghnoJo8R
         r1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730529; x=1785335329;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vKNjE79oreENMLoTNyhPbXKbIGZ+vMn6OpqVeGvJ5t4=;
        b=MmWLcBpe7U/qckFX8WwWv8EglZROkrUvoBbcOVWCyrjoAdPBlDWAcRfuGBFCv6KPH0
         n7oGtmOLpHQ7pIdsVV89htYG3wfCcRnh6A0MePKL9KLmLA5b9wWg0m6JbQoBWDK/XkrO
         SoxHtuj+puIti5sD4GgyaBGknY5Tq4vVtFI4fWnEjTIA2Ac9ZdsMzxdix6I1l7ug768b
         yLTqhjCwblR/2Y4rxKbKrxsScqvyxtzWR9ZnzJ3htjwQcPoCDpOUDKvqHHzrvIYRgNrp
         N7y4R3Voy44onrVhYOM0QRoV8zhmGs9akkwaw/IgVGHByOV+FQS+ZTMlS3u1KI2DNSI1
         WxCg==
X-Gm-Message-State: AOJu0YxYObAW8RW8B3z9LyWP3WYp2VyvNU3uEr03iabOqmb+GJNxRsBk
	vvpXgOZBznax8vm2nzbPwoyn33U+YHzBMd/Zla2eb3pRTNoyRY9kBV4HwwYhxg==
X-Gm-Gg: AR+sD13aPek+LQlYnwIVWVMI+ydhYJ65+WedQEPjplbqd5uMAnymtzCR4PAl3MBVk50
	Y5ZSjUwl6w3f/F6/iNnoD2qaR3etXNDf1YZsxQsdI6ZpK+na5c2KUpEiLjnlpThLyFes91m3pRW
	wT5zR7PCqG1mBZ+NF3+1l/QhcB8YucjQrooxi9bi0RMtLUm69p4NcmJXh/IV9ptYUsAKLZjT6ge
	qEFAYxzFLC8pVcMcCygmc7OAtNOqQ2gmXub2SR19au7VLy22rXbX3h2KUvylmvySqooiZey1loo
	fMFv1Y8ELuveh23saAVbvj7rQVx7jQoS/Tf4AYGw7EzBIQpxohMHIpaKmxYUcq8sWFNoiKZQNdo
	aKDYFiwgzBNXlXOSXBrijdHCy+bvQnBceKdheGrM2zhtaw87BzsW8lzU8ngwDglUn0vKQNW9XY+
	zqGe2FkorHI5+dsH8=
X-Received: by 2002:a17:90b:4d09:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38e4b594eb3mr23588144a91.31.1784730529195;
        Wed, 22 Jul 2026 07:28:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm9855130c88.3.2026.07.22.07.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:28:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Gerhart?= <gerhart@posteo.de>
Subject: [PATCH] hwmon: (nct6775-core) Fix number of temperature registers for NCT6116
Date: Wed, 22 Jul 2026 07:28:46 -0700
Message-ID: <20260722142846.2302075-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Unlike NCT6106, NCT6116 only has three temperature registers, and with
it only three temperature source and temperature source configuration
registers. The register addresses match those of NCT6106 and can be
re-used.

The code used a separate array to list the temperature source registers
for NCT6116, but used the size of the NCT6106 register array to set
the number of registers. The NCT6106 register array provides six addresses,
while the temperature source register array for NCT6116 only provides three
addresses. This causes a KASAN report.

BUG: KASAN: global-out-of-bounds in nct6775_probe+0x936/0x46f0 [nct6775]
Read of size 2 at addr ffffffffc19561a6 by task modprobe/954
...
Call Trace:
 dump_stack+0x7d/0xa7
 print_address_description.constprop.0+0x1c/0x220
 ? __kasan_kmalloc.constprop.0+0xc9/0xd0
 ? __kmalloc_node_track_caller+0x194/0x5b0
 ? nct6775_probe+0x936/0x46f0 [nct6775]
 ? nct6775_probe+0x936/0x46f0 [nct6775]
...

Fix the problem by hard-coding the number of temperature and temperature
configuration registers to three for NCT6116. Drop the unnecessary
NCT6116_REG_TEMP_SOURCE array and re-use NCT6106_REG_TEMP_SOURCE.

Reported-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Closes: https://lore.kernel.org/linux-hwmon/57cfc3fa-d4e9-4c10-8aa7-4ad0af7ebebe@roeck-us.net/T/#t
Fixes: 29c7cb485b32 ("hwmon: (nct6775) Integrate new model nct6116")
Cc: Björn Gerhart <gerhart@posteo.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775-core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index d668dc390def..51253acff4b0 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -846,8 +846,6 @@ static const u16 NCT6116_FAN_PULSE_SHIFT[] = { 0, 2, 4, 6, 6 };
 static const u16 NCT6116_REG_PWM[] = { 0x119, 0x129, 0x139, 0x199, 0x1a9 };
 static const u16 NCT6116_REG_FAN_MODE[] = { 0x113, 0x123, 0x133, 0x193, 0x1a3 };
 static const u16 NCT6116_REG_TEMP_SEL[] = { 0x110, 0x120, 0x130, 0x190, 0x1a0 };
-static const u16 NCT6116_REG_TEMP_SOURCE[] = {
-	0xb0, 0xb1, 0xb2 };
 
 static const u16 NCT6116_REG_CRITICAL_TEMP[] = {
 	0x11a, 0x12a, 0x13a, 0x19a, 0x1aa };
@@ -3652,7 +3650,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		  = NCT6106_CRITICAL_PWM_ENABLE_MASK;
 		data->REG_CRITICAL_PWM = NCT6116_REG_CRITICAL_PWM;
 		data->REG_TEMP_OFFSET = NCT6106_REG_TEMP_OFFSET;
-		data->REG_TEMP_SOURCE = NCT6116_REG_TEMP_SOURCE;
+		data->REG_TEMP_SOURCE = NCT6106_REG_TEMP_SOURCE;
 		data->REG_TEMP_SEL = NCT6116_REG_TEMP_SEL;
 		data->REG_WEIGHT_TEMP_SEL = NCT6106_REG_WEIGHT_TEMP_SEL;
 		data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
@@ -3666,13 +3664,13 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 
 		reg_temp = NCT6106_REG_TEMP;
 		reg_temp_mon = NCT6106_REG_TEMP_MON;
-		num_reg_temp = ARRAY_SIZE(NCT6106_REG_TEMP);
+		num_reg_temp = 3;
 		num_reg_temp_mon = ARRAY_SIZE(NCT6106_REG_TEMP_MON);
 		num_reg_tsi_temp = ARRAY_SIZE(NCT6116_REG_TSI_TEMP);
 		reg_temp_over = NCT6106_REG_TEMP_OVER;
 		reg_temp_hyst = NCT6106_REG_TEMP_HYST;
 		reg_temp_config = NCT6106_REG_TEMP_CONFIG;
-		num_reg_temp_config = ARRAY_SIZE(NCT6106_REG_TEMP_CONFIG);
+		num_reg_temp_config = 3;
 		reg_temp_alternate = NCT6106_REG_TEMP_ALTERNATE;
 		reg_temp_crit = NCT6106_REG_TEMP_CRIT;
 		reg_temp_crit_l = NCT6106_REG_TEMP_CRIT_L;
-- 
2.45.2

