Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2E83370FF
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908852; cv=none; b=CHc+9Cqh8CYzTbNsk3eU5I+QTbgptZj0dX7xm6shIG1/2Mgt07YHE6bvphhJ213Yud1kjAtOHaGoK97Hwd1r/SrWDbnJ+Ff/5nlKT8TEOenGH+gdQ8o6yuGUHUzLuUyV4ND9t2RPJHHa9fKf0Gaq0qNtB4HBpzAxFxgWqcFAR44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908852; c=relaxed/simple;
	bh=GZaiHl5kPYgwTDmyYNu0ZdCOBaL0hWngpNEIZXR8gMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KY0HDOJ+Hb11YmGrR5Q5qwHikD30sF6JkwX9vF8d+jekRQpABOBDnGL9sL+E9+cyRjuNu2e61lnXDOXPEo6tq2MTvU4U1tc7ukjK2v2BeF5Vm9Fo4JyKlQz9mj+S3p+ISaF4tq8RMU0msVCRG+Wqd6BpNGqF3OcoIfgrNQ/i20s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayam9lTn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayam9lTn"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb2314f52so2355657f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 10:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765908848; x=1766513648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5DT0l62HH+N5FXjN/JQeeIZgC1m0wiWexHPfvHTn9Ok=;
        b=ayam9lTntVCC0TMtNMMR6QN5uMbnLWhQAxJdj6foXNPnzALC6WlhC5C7eWvo9fGjnh
         DP40NN2utRTrB9SB+Tx3++Y8cCHW0rZ1zy7Ud/bx4BvA+z98xApAqhqmPMh5YYtkGyzr
         IHySb5xjTN4jQ0Z4jTRxhnI9lauSLp8vek2QPLGgCXxYHTJ0RyA+oqZdPlOiU5BfOYsh
         8/DwoIo2eFoOq3AVrg/cwzvkVL0zBCIOtTwudCMMSI8M4K1WCW3Y80ji15Mmnt1VtcC5
         CgJ0iKH+qj1cwHqHKVtbHYe88rvHk+X5f1UiPS35wXjmoQvrgFCuCCtdap1xsUXaBU6b
         mVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765908848; x=1766513648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DT0l62HH+N5FXjN/JQeeIZgC1m0wiWexHPfvHTn9Ok=;
        b=q1cH7/5Tw46J2mIRrI4hO54/+2Nses6RjvbhVaeNJxY7+whqRR0nOOOhEuPpxkZLQl
         NnXtZtYPn3pGfioS/Zw3vwrAEoyqkEmvLrg0ITMzQ+6PFMNJzw39I9imXud5bXpTFKKy
         QOdj4NtbGHduAqXesWT2J2+xlnzrPaKyo+uMgUvc4hd9pJqwyp47gpCRVjea6WX4RZzJ
         HHUNrgDL5aPvLNnp24lxYnK9W6kGa3i2nZq11mMVeBdHPkoEN4rSgFenytgB5+yAVwV9
         QIINE38brVsl5uWDXwqaq3TgSC+5LGRq+Z90t3vDe5KPr02ayvLhFKSIQVZl3yNRkdxj
         h2cw==
X-Forwarded-Encrypted: i=1; AJvYcCVd07y1LWAgjSNdwSZk+6zVpuQ3+66tiVNVYRicTceTN4HivWkaARO31gJc57Dy65Wk5KuX022WYHeaVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNCAe5IBo8ufKExhjfiCObVQq/T3qp6BWiTeU2Ybvc7cPIMOGP
	AsGhrgqsLs9rhC6t66hb7Ucpl3v2FBXyUnA9aB8B+0EnzoOFgNRKLJp9
X-Gm-Gg: AY/fxX4v2BxabZFX7ChBQ6zVLBP/yIJ6vbFGs9MSSeaH2lIwnr6cztsNqH0HG7vzXqr
	s5284i8wP6qRmmCzIf6fUi2FwfJU3umH4psZV83Tk8rVHQXUBmcQyTgKsVt6NxmH+5dBfsGBJJ7
	SSUlBJFHt/lVhDrvsciqi5owUzxlbB3dAYd5o/GNfoMf8iY/kFIwJqRy/d4CBCcYO7ztPmYTm4x
	ii31HcDMhvbDLQdtyqLRu0RAYewKg3rpKPcXKt8X6sDEfbym/JoSSDdvcuWiLQ9KRGk6r/gFx/I
	e4myFdWBmvf1OX12eTMdRjMTIdzFozgbonhUGSmrqwlBydIAibcgCfT38QGnYaDlSuvcrJ20K4+
	e6dka/S+gWBuzqDWm1cRXpfBkkM21BneNYW5UhfweMfd7N1tzOfoOPbJ94LuYLUyJ/2PVQ/GHYl
	hysbJJzHiH8yRFkvUIXshqJxoJjGNCZbFk7SU=
X-Google-Smtp-Source: AGHT+IHWED2pnU5xquHaZgiCC9dyKadUd7tRo2IOSXPv/gMYvhgnATqPcNxk1VtezoiHIhl73Nc2yA==
X-Received: by 2002:a05:6000:2dc8:b0:431:864:d4a9 with SMTP id ffacd0b85a97d-4310864d75fmr2595998f8f.8.1765908848147;
        Tue, 16 Dec 2025 10:14:08 -0800 (PST)
Received: from dev-linux.homserver.local ([51.154.248.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adeeedcsm374259f8f.31.2025.12.16.10.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 10:14:07 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Huang Rui <ray.huang@amd.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] hwmon: (fam15h_power) Use generic power management
Date: Tue, 16 Dec 2025 18:13:59 +0000
Message-ID: <20251216181401.598273-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to the generic PCI power management framework and remove legacy
.resume() callback. With the generic framework, the
standard PCI related work like:
        - pci_save/restore_state()
        - pci_enable/disable_device()
        - pci_set_power_state()
is handled by the PCI core and this driver should implement only
device specific operations in its respective callback function.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/hwmon/fam15h_power.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index 8ecebea53651..efcbea2d070e 100644
--- a/drivers/hwmon/fam15h_power.c
+++ b/drivers/hwmon/fam15h_power.c
@@ -372,15 +372,14 @@ static void tweak_runavg_range(struct pci_dev *pdev)
 		REG_TDP_RUNNING_AVERAGE, val);
 }
 
-#ifdef CONFIG_PM
-static int fam15h_power_resume(struct pci_dev *pdev)
+static int fam15h_power_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	tweak_runavg_range(pdev);
 	return 0;
 }
-#else
-#define fam15h_power_resume NULL
-#endif
+
+static DEFINE_SIMPLE_DEV_PM_OPS(fam15h_power_ops, NULL, fam15h_power_resume);
 
 static int fam15h_power_init_data(struct pci_dev *f4,
 				  struct fam15h_power_data *data)
@@ -493,7 +492,7 @@ static struct pci_driver fam15h_power_driver = {
 	.name = "fam15h_power",
 	.id_table = fam15h_power_id_table,
 	.probe = fam15h_power_probe,
-	.resume = fam15h_power_resume,
+	.driver.pm = &fam15h_power_ops,
 };
 
 module_pci_driver(fam15h_power_driver);
-- 
2.51.0

