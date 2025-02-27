Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE32777EF
	for <linux-hwmon@vger.kernel.org>; Thu, 27 Feb 2025 22:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740695106; cv=none; b=kyONG7IJLmat18kdRHAes5HnFf2M+GR/8g1Jo4qOr/8kZlf+K0AbiZZnDrNEkcE2jc/6SsjmJSjOFS+mXkDAE7q/swFAWhRxdlidU/6/1RLdBMm7ORuC6mKNGj7IAv9E33l/YrDx1O722wf4FKj6WuaTXI6JaHrd4Qzl3SqHhKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740695106; c=relaxed/simple;
	bh=yqmRATo9Iwptsr2ah/UqyMGkFCyCO9rGj356YotKp84=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qK8T6WkhXCsqmk95cwUG0YfwYXTvtjRJMt7Q5Y0JEGE6YVfuxzmwLLIs99eb6OVi1LezHPTAsRc38pe2b2RpAedrgGFaryph9vhhivOwpT7CkAq11vV/UvCCqaDBudwEi5ismjjIEoB5DblwtNJh8EfYelhxmFN7aobSQUouhMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--titusr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bWLeMhjM; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--titusr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bWLeMhjM"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7c09b9c6991so286610285a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Feb 2025 14:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740695103; x=1741299903; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HSLRljK43Uk2l/2Nirh2DotK7yX9JYKhPGxc7DELhYk=;
        b=bWLeMhjMx1u1wQCLXxf4NbMn6+byKR1Vjj7Y5G0KJC11dBTqEIMNP0jN2WuSW4lTC/
         dC/xRsyqptKgE7cHogjryDLUf9c9xiq6r98iPV3h3FKyL6eisGmsoVrDnxRZP8Ig+5lU
         TnunqcyQPOzB5rWwknA4c6WCV4Upq9+N9Cjb68KiL4xFcbjmLKB0xW9IrLhCYAukNCpy
         hO87znVRpfTdL+l0wGnZpSMTJBQvjL2Wmn9ZCsuMymjE37CRbTN0/7Tz3/jccwSETUhI
         vCYN81oAF7d/q5uEtqyuPkVZ74+Qt/QQP87FXn9knhMKxw9Mzk78Mu1SFMlj3M8IEieh
         eH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740695103; x=1741299903;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSLRljK43Uk2l/2Nirh2DotK7yX9JYKhPGxc7DELhYk=;
        b=KHgqvnKTbZfy1YRUtqaFMdIEol5LduBukemuS4lcGb0DSj6cmZ0xBJwsQF2UHjMzD8
         0gDyXkOlAK7nAcXgZgOwsrbW9iw5RdkkigYjiCnNwQCylhO+81+tE+hKRaK6z7Z6q3HW
         KveyYLB6p4WE7CpjSU/gpm5OUx8a2gFHKeM+OszpPXRepZvaihJUkV3X0HjQFk+NBdRV
         so1vUlC1T6nAHRQ+rK0uLiJgvDsAQo0lLobsnbwscoqZrWeK/HyoyLGqePNX3cvZ5Nmq
         tkuMO8oZ1oPenJlAmFxf0sJq2tzn+RWzQU2CFLnnza45znS0w7RkQB814e+vNj4kLvjJ
         wfRw==
X-Gm-Message-State: AOJu0YywFQKjRgb/8fRG6UXEt+fkwXe5J84Xt6G3bNxgGBU2Q/aSgfI2
	GFu3xBf5R0vQ7kVEoyHEBvTkSfXeerLWl2IF2D8YobBBbP8VoxER8beCmE73NiLXRMUuibBBhiV
	MEg==
X-Google-Smtp-Source: AGHT+IEqTrAwZcU5ZEKxLHbUG+APrCAbFivtv8f+7zvkxGRFmGzE/9PiLmm3fuoj+RusAO97plbJo4qqGvI=
X-Received: from qkap10.prod.google.com ([2002:a05:620a:a90a:b0:7c0:9e2a:81cd])
 (user=titusr job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:4408:b0:7c0:b9f3:bd1e
 with SMTP id af79cd13be357-7c39c64a49cmr156313085a.49.1740695103560; Thu, 27
 Feb 2025 14:25:03 -0800 (PST)
Date: Thu, 27 Feb 2025 22:24:55 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227222455.2583468-1-titusr@google.com>
Subject: [PATCH] hwmon: (pmbus) Initialise page count in pmbus_identify()
From: Titus Rwantare <titusr@google.com>
To: linux@roeck-us.net, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"

The `pmbus_identify()` function fails to correctly determine the number
of supported pages on PMBus devices. This occurs because `info->pages`
is implicitly zero-initialised, and `pmbus_set_page()` does not perform
writes to the page register if `info->pages` is not yet initialised.
Without this patch, `info->pages` is always set to the maximum after
scanning.

This patch initialises `info->pages` to `PMBUS_PAGES` before the probing
loop, enabling `pmbus_set_page()` writes to make it out onto the bus
correctly identifying the number of pages. `PMBUS_PAGES` seemed like a
reasonable non-zero number because that's the current result of the
identification process.

Testing was done with a PMBus device in QEMU.

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 drivers/hwmon/pmbus/pmbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 77cf268e7d2d..920cd5408141 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -103,6 +103,8 @@ static int pmbus_identify(struct i2c_client *client,
 		if (pmbus_check_byte_register(client, 0, PMBUS_PAGE)) {
 			int page;
 
+			info->pages = PMBUS_PAGES;
+
 			for (page = 1; page < PMBUS_PAGES; page++) {
 				if (pmbus_set_page(client, page, 0xff) < 0)
 					break;
-- 
2.48.1.711.g2feabab25a-goog

