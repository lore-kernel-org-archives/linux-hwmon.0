Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D38E377ED7
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179280; cv=none; b=juPzTMxKN7NRnTBkxR0oBAXy7mY2WRjyJpKa0/QFTA+Am5fo0GQfa0Rzj29XojmNxLeQkpGVQjXs6+HhUWWRJaMULDOXIpfCiR2m4A6MNvPiUPMQ9twuz8JposyElGMYlreVYOZJAkA+7c+G4jPvbqAsDmApdtmAbPp5gK69/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179280; c=relaxed/simple;
	bh=BN9WuBVz/WnI/54xFzRT/m25+yMWcUxes7Zj186oHOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jndB4ifzFAUztoahhEf8qS5f2i2JaBfUeYGdlIXSEJq/z0NXLU+FODO7pmgDm4we+InrsGmY5cZTXmOh5Wi3aVuOVjFM68isJc6rOrx3IXVHVUOHZoJOyQ4HIeZ7NIB+ikWhns8YKGmQj8ajU3+a+giVLFBltXPgwxSYEIBOOZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alQ4gPKw; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alQ4gPKw"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1806220a91.3
        for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 15:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780179278; x=1780784078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TklKtQ9Lphlf35fAH/RuxfGHZ21LYqtB8VMND4KVgMs=;
        b=alQ4gPKwak3ArVy1H3HZ3X5ByPgwlnKmhmjUZ8wSU7HvFAK/AnCVLbJITwkV5hPAFh
         sLlyp2hhPY929tNsBGL362HZohudMTYDluZhDnQaI9EuwvUBFlh4bKaSxc8vKzzFYqzw
         jxw/TnbAvCcfPvuPTot5HJIM0df0WG+cKNeYHD9951hr8w2g9LIIfAH9mBG1fOrmENaY
         ADLrsXjDELrY1WF9gnuMYUa1j2F9vSfg4ZMqnekqgAWfq4W2tPbJ/N5aVT6pu1PZY8mJ
         Pt/XAg9IwOF1mLv/wrys5uf5zrjp5LvjwJ69wywOVza7k7ZkzLPotGjFwT9e8iqdnNmf
         cCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179278; x=1780784078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TklKtQ9Lphlf35fAH/RuxfGHZ21LYqtB8VMND4KVgMs=;
        b=aZlyDTm+9Wo5LTqbf6luSCzv5fKptItOifYjUAr2bO45ZktUgR07i68f8nzcOkDaZ1
         zQZJ7AuiMsnrGXuU2nUNK+p4dYXLvuAILDHwCER22VTBMG80fis/oTF3LPHhTSFDNFOD
         Gh/8WUDX9LQh6FdmdeFUqIj9kmHbBZYOKmF66erbU+tQckSk1lh4D4xuBGtZtD8J+7BG
         1Rusaq61PyqVbfgvppiSeDqbHLzxcGHQK+s/LAizerUwvPcjujPbYqjIcHprxM2PznA9
         FSagbZLm65UpY5AqVYUjQpcwidArEeSz2bW6Ndgt0kyC5AmPx+MTIvzamk+bUXMh1iPb
         JQ0g==
X-Forwarded-Encrypted: i=1; AFNElJ/HgTdlh5oDzWnV7Vx1UnyOfvWwHhogMzFT2Kr08GxMkkSsxPvTPtFRHiKTBQbAi67NgUXjYRV6chsq3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6wJAY0qZ5FLZFetb48ZqbOnqmjn+bPTaxbKSei/bfj8nmj1IT
	ZJAVnoDrJvk9IsYSRUiaN5PFjPy6D/4bhFWhIu6bj036XHKRrjSRRMWE
X-Gm-Gg: Acq92OHH4Z+eWQ7tbBQU1DCXsxh8QA31bqZ/a9kU5aTiaOtLdQ52hT4nZk6PLJgSJnc
	SP4OJOLz2NiBwX4WjI09LLwQh2Dq8OPlOfSlmc8W/lzoSFleQYrh7QxwKtx3qHUYoEIeREvNnYo
	EHbdoQyL8Mjv5p85UgzsCiD1FMQugHXP8sYEgTw9KPoDQVnVkhNylhH9QAYEghUG51WJOYnrStC
	dzP7+vLpNgjEoqMo/n+QmT6+2aQCTUkE3tdHd65UNaDh+oIVHlarTMwH6xrgayzug4N1MCnnyzF
	4HE6piDM713Wjo+48xqjCwSFxnoH/Ly11JB9fxejjabPD/NiQf9sxSB6TfJJ0mN5RAN0d964ES3
	cKo6EuSx/06hei/aR7bMEWJxKWes0Jq3kvUNUACkmCa6fM1A1AHmB3To1GJ3Gq0cKfIhnEx/OdS
	xHXEljwXh5NRx4k91MJTmIu2TJv7eGgycg9Z4WdmhuhTTxBn9i0utYf/dd7qEXBjJlryxWpQSJu
	eiF
X-Received: by 2002:a17:90b:5704:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-36c501dd3eamr4925741a91.16.1780179277724;
        Sat, 30 May 2026 15:14:37 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a9299sm5515226a12.7.2026.05.30.15.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:14:37 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: linux@roeck-us.net,
	jdelvare@suse.com,
	nuno.sa@analog.com
Cc: abdurrahman@nexthop.ai,
	bartosz.golaszewski@oss.qualcomm.com,
	linusw@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	manishbaing2789@gmail.com
Subject: [PATCH 5/7] hwmon: nct6775-platform: Use zero-initialization instead of memset()
Date: Sat, 30 May 2026 22:13:50 +0000
Message-ID: <20260530221353.159461-6-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530221353.159461-1-manishbaing2789@gmail.com>
References: <20260530221353.159461-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the scope of 'struct resource res' by moving it inside the for-loop
and using empty brace initialization (= {}). This ensures the structure is
safely zero-initialized on every iteration, allowing for the safe removal
of explicit memset() call.

No functional change.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 drivers/hwmon/nct6775-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index 1975399ac440..b73086a56d97 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1528,7 +1528,6 @@ static int __init sensors_nct6775_platform_init(void)
 	int i, err;
 	bool found = false;
 	int address;
-	struct resource res;
 	struct nct6775_sio_data sio_data;
 	int sioaddr[2] = { 0x2e, 0x4e };
 	enum sensor_access access = access_direct;
@@ -1562,6 +1561,8 @@ static int __init sensors_nct6775_platform_init(void)
 	 * nct6775 hardware monitor, and call probe()
 	 */
 	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
+		struct resource res = { };
+
 		sio_data.sio_outb = superio_outb;
 		sio_data.sio_inb = superio_inb;
 		sio_data.sio_select = superio_select;
@@ -1596,7 +1597,6 @@ static int __init sensors_nct6775_platform_init(void)
 			goto exit_device_put;
 
 		if (sio_data.access == access_direct) {
-			memset(&res, 0, sizeof(res));
 			res.name = DRVNAME;
 			res.start = address + IOREGION_OFFSET;
 			res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
-- 
2.43.0

