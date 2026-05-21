Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16EA22A4E9
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779398801; cv=none; b=CohDxUQwA7dKk2wqG3IP1eXkUIt0Y0J+XRIUGU3k1UyCbUeFW4mc7Y8eTfDwzrsJUEuwy3creDIc3xH/Fy14f7Slsa3b1FkesvVSBf2rZplaYXjbVnMa3jQBqkvFuS0M6oUEY+0pIwGPYcjMAa4DUulLjkljBT720pbXeF0Tu3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779398801; c=relaxed/simple;
	bh=W9UCh6etWAO2X39ZH6Zlt7LaaonKADzytmR8FfQb2TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tw0GOm6NXiu8wncgWXusHMGzSu9Hij19/ch0Y9HvJOPdT0LbYOjN4uHgXcbJS4/8b2Z/jE7TuC/xBA2voKD1FaJ5vRysLZSq289APAzN1p2woiuqeOy7wQK6svUe3JqzzzcwknqfeOVPLKi1SXYW2UJTsS8JnGen4KdTB0WrZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkEyoDcO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkEyoDcO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48fde648a71so46969735e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 14:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779398798; x=1780003598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mw6JSFde/0t4gzSdNqxbDUYeWRevNmJYNptU7kEl+Mk=;
        b=VkEyoDcO3seZDTRMopCjeWuMdwxAz5wnMbe4M0pvqqCx0ah1Cln/pKV0GPurdswATS
         8Ngmu87A4PYiBfiHTkZ5qi4u+LUyscHy1E/lyYFwK+Jt2lTGu3rx5noiV/tJi5PMt007
         OuI6cT4lNjlRnuHwakYoWBE/H1sUrxLkd1yHqD/hHcmIBzSI1P+rBC9MYmjFFBaPfZsf
         UnChMJCBwaettuLO15kd6Mo/CnkcMTj8fYulsNaMvcjKuCINUOc5kytUG0oGPGwXZqUk
         sEQQQDXUcgWWrWoTumnP9NjT55WNJ2N56hO1y1FCYsC9Oodn2VyiaLdrk1d4EeSAIksd
         16Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779398798; x=1780003598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mw6JSFde/0t4gzSdNqxbDUYeWRevNmJYNptU7kEl+Mk=;
        b=RXDBJZr5Sfikvys4eXa6RhVgNMcORbYBmfOxWAGvx9fsUTQ39N9JZRBjYPBNlUITHT
         LqjldUUIkbeH114QyA7tFNDEXcXORJxPnZZ5qiEKhYzRfK3wpBeCVki8mwB3JC6DuA8M
         rpWeRrO7Ryd2uftMxJaAg32/NMr8uGyk3VwdBRWQ4rhyMC8qhJUFvjTGhhk2B3eSPPvr
         px4Jj7fBKVzgVW7CXsz1Py/I6z927xLRDkYPH7/e4fk7r2zbe48/5YwfiZ6pWnWPZCdh
         5Jbm2JXNb7fOAWIqma4EFecAxcoyvipCin7+ugjvTfgwONwhsvmQ7459BHocONi4q8t7
         NU5Q==
X-Gm-Message-State: AOJu0Yxt9Qsj0J1/c+aGHTkqXtp0akVwywg1Y8oclDpYdmVCX1tcLzOZ
	44YqCdbOw/KxtBJ0jECqbQJrzIGb4/Q48fdYn+R8BLUSq+LkYPzI4XIA
X-Gm-Gg: Acq92OHn+4pu9tkaIn79cQ8p57WB9KTgrPrQKuQj3ezx1z0/7Ps55zr9diRQkHBd2Wh
	2jcdMY65ORkVteCoWsm5skwPKPhExvbaZXVqyTxpz7d9n3wouaUVOaEdvZbIgJu0JYY1WEPH1lm
	kT1sL0bB9fI4zceo6L357n0WNl0okJYFrspnCU9KATTqqtea62gs/OnKXOpxNC9YoQXQlrFdohF
	8u0BbmHEt5D7r/Jb7/nD7qbqQjR40Mp9gq0mBL6cmBlbklP0pTR3WGiCX34jpfzFn0vt00y4mHs
	szRAqQ22gp5XvdJXIN45thVvYdd8sUUZVRgzp0vEzgX4LjP6oBn80RI9Vb7FbldoUdRJRxlw2Ip
	cVgtFw6zVkS315EMocRm8lFHuMR+r1Hj/iBP+nwUM8mUKZ8mOjI1yH1avd5Jya+WSqBxOCway+C
	rRNafbiF/22fMz/oXZL6jd9JjThEp3P2qf1CT9MUt4VzyaG5IViwZHbyOpgwMn23vsYQ==
X-Received: by 2002:a05:600d:4448:20b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-490422687c3mr3816005e9.4.1779398798055;
        Thu, 21 May 2026 14:26:38 -0700 (PDT)
Received: from reiner.fritz.box (p5de56b80.dip0.t-ipconnect.de. [93.229.107.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033cdcc01sm99548295e9.0.2026.05.21.14.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 14:26:37 -0700 (PDT)
From: "=?UTF-8?q?Reiner=20Pr=C3=B6ls?=" <reiner.proels@gmail.com>
X-Google-Original-From: =?UTF-8?q?Reiner=20Pr=C3=B6ls?= <Reiner.Proels@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Reiner=20Pr=C3=B6ls?= <reiner.proels@gmail.com>
Subject: [PATCH] hwmon: (nct6683) Add support for ASRock Z890 Pro-A
Date: Thu, 21 May 2026 23:26:11 +0200
Message-ID: <20260521212632.223724-1-Reiner.Proels@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Reiner Pröls <reiner.proels@gmail.com>

Add the ASRock Z890 Pro-A customer ID to the list of supported
boards for the NCT6683 hardware monitoring driver.

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Reiner Pröls <reiner.proels@gmail.com>
---
 drivers/hwmon/nct6683.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 0581770380cc..37405329ba78 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -177,12 +177,13 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_MSI3	0x207
 #define NCT6683_CUSTOMER_ID_MSI4	0x20d
 #define NCT6683_CUSTOMER_ID_AMD		0x162b
-#define NCT6683_CUSTOMER_ID_ASROCK		0xe2c
+#define NCT6683_CUSTOMER_ID_ASROCK	0xe2c
 #define NCT6683_CUSTOMER_ID_ASROCK2	0xe1b
 #define NCT6683_CUSTOMER_ID_ASROCK3	0x1631
 #define NCT6683_CUSTOMER_ID_ASROCK4	0x163e
 #define NCT6683_CUSTOMER_ID_ASROCK5	0x1621
 #define NCT6683_CUSTOMER_ID_ASROCK6	0x1633
+#define NCT6683_CUSTOMER_ID_ASROCK7	0x163d

 #define NCT6683_REG_BUILD_YEAR		0x604
 #define NCT6683_REG_BUILD_MONTH		0x605
@@ -1248,6 +1249,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK6:
 		break;
+	case NCT6683_CUSTOMER_ID_ASROCK7:
+		break;
 	default:
 		if (!force)
 			return -ENODEV;
--
2.43.0

