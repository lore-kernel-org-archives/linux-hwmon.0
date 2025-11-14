Received: from mx13.kaspersky-labs.com (mx13.kaspersky-labs.com [91.103.66.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BA932572A;
	Fri, 14 Nov 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.103.66.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132457; cv=none; b=uED1ksx4OA5d3BXuEBkudCnVO14zVJeNQiXgqp4ShNqsLLpUKEJLCqis8bhh4pA+XLfPxYh4pxQWC2zUB9gyF/tiOm/K/Br+WKt1LFKDKyJEiL0TrpDF+kFPju4/nsrf8kkRMeNnmLl7H1zO+pRxncNHXhWU6X9FrQndH824rRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132457; c=relaxed/simple;
	bh=d/G7fOyd+PKA49zh4IDE237eoGff6XzJbRsbsbEy9kY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hy5FwM9oDVdBcqXFjnh/V0J92+Nl9xTIh/kxrTG1ksHdFzhWA8lk+GLQm5nz/lPgGKttcAcJXoQQ9P5n7YOiZgqzbqVw83McBD4GJvBquIZKIzfsTsxATjz0ZoSq40xkNVnqfyS7TOKhkwwFFjJQiN0CihhZk7CkrrJr4fI51Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=r7p/YuEq; arc=none smtp.client-ip=91.103.66.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="r7p/YuEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1763132451;
	bh=UCcHOAW472GN2iBcXs9PqGlXaA/bRv6Esq7rnOuymxg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r7p/YuEq3nNJv5TUafSS8N3cBzPwscIwk68IbYB1TyfOTURAA3V24M8r3KAEe/LK+
	 O1QEkgHXVAYUE4/RIATPKmG81csVgb6sA7k7CwdkHc4bVZaWQHqAdbbShm7XGRbO2c
	 RLKmM0H9KEB1aF2K6V00s7i2k+w5FS2CmZ5QTTXtRuTBEQY375mzuFmZawxh1V7Kz/
	 e1KJsUq8XvBE80HwhD6pKzkg5z7EsN5szynLqo2SZ3F+q4IM3VzwqNrmpKZ5IsULTq
	 oKwnpbUUFY/ftK/WIshyXcwnvud41yQtCDg72iprlb05ZlcVEuYGayrkhOpJOnhW8j
	 DDpJ2CZ8/isMQ==
Received: from relay13.kaspersky-labs.com (localhost [127.0.0.1])
	by relay13.kaspersky-labs.com (Postfix) with ESMTP id 60E3A3E5D2C;
	Fri, 14 Nov 2025 18:00:51 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub13.kaspersky-labs.com (Postfix) with ESMTPS id C15573E3642;
	Fri, 14 Nov 2025 18:00:50 +0300 (MSK)
Received: from zhigulin-p.avp.ru (10.16.104.190) by HQMAILSRV2.avp.ru
 (10.64.57.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 14 Nov
 2025 18:00:50 +0300
From: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>, Luka Perkov
	<luka.perkov@sartura.hr>, Guenter Roeck <linux@roeck-us.net>,
	<linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] hwmon: tps23861: add regmap_bulk_read() handling in port resistance read
Date: Fri, 14 Nov 2025 18:00:44 +0300
Message-ID: <20251114150045.2230687-1-Pavel.Zhigulin@kaspersky.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HQMAILSRV2.avp.ru (10.64.57.52) To HQMAILSRV2.avp.ru
 (10.64.57.52)
X-KSE-ServerInfo: HQMAILSRV2.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/14/2025 14:44:52
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 198109 [Nov 14 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: Pavel.Zhigulin@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 76 0.3.76
 6aad6e32ec76b30ee13ccddeafeaa4d1732eef15
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;zhigulin-p.avp.ru:7.1.1,5.0.1;kaspersky.com:7.1.1,5.0.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/14/2025 14:46:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/14/2025 2:08:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/11/14 12:42:00 #27925085
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52

regmap_bulk_read() was called without checking its return value
in function tps23861_port_resistance(). If the read failed,
the code proceeded with an uninitialized register value.

Add return value handling

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: fff7b8ab2255 ("hwmon: add Texas Instruments TPS23861 driver")
Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
---
 drivers/hwmon/tps23861.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
index 4cb3960d5170..8873b2e21064 100644
--- a/drivers/hwmon/tps23861.c
+++ b/drivers/hwmon/tps23861.c
@@ -457,13 +457,16 @@ static char *port_poe_plus_status_string(uint8_t poe_plus, unsigned int port)
 static int tps23861_port_resistance(struct tps23861_data *data, int port)
 {
 	unsigned int raw_val;
+	int rc = 0;
 	__le16 regval;

-	regmap_bulk_read(data->regmap,
-			 PORT_1_RESISTANCE_LSB + PORT_N_RESISTANCE_LSB_OFFSET * port,
-			 &regval,
-			 2);
+	rc = regmap_bulk_read(data->regmap,
+			      PORT_1_RESISTANCE_LSB + PORT_N_RESISTANCE_LSB_OFFSET * port,
+			      &regval,
+			      2);

+	if (rc < 0)
+		return 0;
 	raw_val = le16_to_cpu(regval);
 	switch (FIELD_GET(PORT_RESISTANCE_RSN_MASK, raw_val)) {
 	case PORT_RESISTANCE_RSN_OTHER:
--
2.43.0

