Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D33CC7CD
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 23:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782774878; cv=none; b=Fd2jPgab7pX0PeUTKlGxQIJ8iVLQN1hefKEAnUVDHUhRsRsXUG74DNbgCPmwjwnkoKOOzuO4gkjDXTqxAG7jWv4v5QeEjr0xGYoAVjMUUY+r+KOLKtby13ycUTgjILLFKR9KiAZr0lDSG4dUP/uPzyWZHV48iBukk901TqkX5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782774878; c=relaxed/simple;
	bh=XfEXYaGAXxgjcLTDMyXTaAObDGS8eUjFUBHdx8WUeMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fB3vp1YegJWEmwb54oRVC9UHezUEf5+Rq4Wn1IsdW71VATtpccSZ2rCAg48djSXMDLmP79QtWlR3hDpF8Ywr0g8jH2ioCXNCp7K8g9KfLhvD7sxdZD2teLYRCNFJ2eavxOZQR+guqf6pd4KedmmPKF2LrzxFVTlW/wvX0QA9vzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Juv5f9Hd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Juv5f9Hd"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8471013fac2so953157b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 16:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782774877; x=1783379677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oCyueg8VCCrdLe9u/zkIH3h3ZoDLHvQq3aMSdAbpjGU=;
        b=Juv5f9HdAsLC1NQxUPILJ40U4jG4i9yLqA2KsVEkeaC7OMm/cmmUKBD3M5/N//jpQh
         Mt/E1FAcITlOWQuUrnZKxkJj9gsWJoYVI942CWxCC9UPTC275x8Rc1lrGQBPf2OclIAA
         q4hqTWyxsVfvUlEBk382zV5tgE2uMVwVfYSMUNP/IxTYLS7uElx6E4QyddGVQlZ+FrQc
         /wtgWBHXdPkcPCAH4Vm/cSAbi8OSplJakF9V/sDGOkpHTdbc/WmsCdBJIHYmVjFdjxPg
         h5jKywT1LwA22Tm8Z4dsOM9VzNllcOG3xkVDNsn4lyQBxiIGbVGFLf2fVVcaQ8JmgVg6
         /k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782774877; x=1783379677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCyueg8VCCrdLe9u/zkIH3h3ZoDLHvQq3aMSdAbpjGU=;
        b=Ee7XHbiPZk6paJQI0+xHpmQ92NAuipsWxC1TWGs6C+2aZEgllresXDXin8m79X360k
         6srpiMZTVeCW5nkgBhp3p5Pkvg5dLZ8TUFQJhS6S41RPteGCV50E6KmPMi5zowY+4ACA
         R+qxnzdoAnyI0IhDvmmfwRzg8PKipR147q/GV/vFtW/40PK2XqHa0hDaCyqR/r6EINKs
         2OfkPKokuRDm/LLwcTl722xQP8+mh83h9clYBw/P9c/I8U7reLDjDt9SP9Se5zxNGok+
         fK8o48j+TV8ujaXw/6WknY5RsmD146cShCr38o4CEEd+ijJcz1LJNW+gHJIeBic+vNBc
         NyGA==
X-Gm-Message-State: AOJu0YwaJRAJk0BMA8YD3Ah9z1TipEA3sWwm24KmHB3fkrIFJxPaKkfF
	H0lEIopBL1gCWGJXzlPi7MYGx2QALzN720lXVvjgO6EE9c5I+u0fPnwXYmCsvw==
X-Gm-Gg: AfdE7ckDvNhXUBL0jR8+ym+aZL5+ZB98kCFdeBZ1w8Y94/RXunedWPDhb5MZFNHi3xD
	rnFXMUYjc8PovNg/nwYhkbWT3kvKqgNbVbY4J+PmD8fOShysqRqhjgOVgjY/+uu+o2qh2nwqsep
	PkzKLxEIlq6OxngsTEwZInPTYRKgxTHMm4Iw5pxdWc2Ui1sZONUuSVoJMdrc0zIYIb+rbhnxhKa
	rABkeaqeC9qJgK9MmcIlCefTzV6BU9fMDqogfZh4HZBx0JWm1omWSW6r8RdX0wR3T+iDvkG6qPB
	c3dHH0CoG502uyqSORMc9yd9Wx5Rqu99aJBgbDpljrwk0TiutrrO1IzHQXMqgB8LZrbUtEs9Q/0
	NQiCBlfTa6jHRb9aucuCAe4S2S7fiSRLsb0pO0O5Kyr6C4sBRzcECkEiaV9ssGOuvkiFgyKJKOe
	3cBGKg+BjwNXtUdoLGTGLLr5AV7Q==
X-Received: by 2002:aa7:9066:0:b0:846:2f3c:3f66 with SMTP id d2e1a72fcca58-8479f2bf928mr989526b3a.60.1782774876545;
        Mon, 29 Jun 2026 16:14:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fff9744sm538578b3a.14.2026.06.29.16.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 16:14:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (pmbus) Fix passing events to regulator core
Date: Mon, 29 Jun 2026 16:14:34 -0700
Message-ID: <20260629231434.2011247-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

Commit 754bd2b4a084 ("hwmon: (pmbus/core) Protect regulator operations with
mutex") introduced a worker to batch regulator events over time using
atomic_or(). The delayed worker then passes the combined bitmask unmodified
to regulator_notifier_call_chain().

The core regulator subsystem's regulator_handle_critical() function
evaluates the event parameter using a strict switch statement. If
multiple distinct faults occur before the worker runs (e.g.,
REGULATOR_EVENT_UNDER_VOLTAGE | REGULATOR_EVENT_OVER_CURRENT), the combined
bitmask fails to match any case. This leaves the reason as NULL and
completely bypasses the critical hw_protection_trigger().

Fix the problem by passing events bit by bit to the regulator event
handler.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 754bd2b4a084 ("hwmon: (pmbus/core) Protect regulator operations with mutex")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index e8fdd799c71c..997b328964bc 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3329,18 +3329,23 @@ static void pmbus_regulator_notify_worker(struct work_struct *work)
 	int i, j;
 
 	for (i = 0; i < data->info->pages; i++) {
-		int event;
+		unsigned int event;
 
 		event = atomic_xchg(&data->regulator_events[i], 0);
 		if (!event)
 			continue;
 
 		for (j = 0; j < data->info->num_regulators; j++) {
-			if (i == rdev_get_id(data->rdevs[j])) {
+			if (i != rdev_get_id(data->rdevs[j]))
+				continue;
+			while (event) {
+				unsigned int _event = BIT(__ffs(event));
+
 				regulator_notifier_call_chain(data->rdevs[j],
-							      event, NULL);
-				break;
+							      _event, NULL);
+				event &= ~_event;
 			}
+			break;
 		}
 	}
 }
-- 
2.45.2

