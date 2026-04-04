Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B26168BD
	for <linux-hwmon@vger.kernel.org>; Sat,  4 Apr 2026 00:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261193; cv=none; b=fzQ6K4CMWx15uFokSxepiVfTW0o9c7J/fxHiXqZmhjkJh7jKP381beUjwHDIcVqLP6yYkkq2UtE6G+JgNdxKpOhH53LHFQEhKJvnsgDlHZGTIboFzPy7H6DPo4yd04nSE08v/erzn6qCUzqdy3QmsV1acph6OTZ+UlDEuQJmptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261193; c=relaxed/simple;
	bh=D+AzceZEghxm68NX6nC72rDHGLvWdmwrrl+yqG6QI2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OATAh1yCcyPHwdVjErhZYdWN5gNlZ0LNgVBDeyY7DEHtScq/xCN6LQuS1RMqfoao1a0dOYcxIpcCaGhQsuucu4i1gjujBGjFuivIzafHOA35yu/NwxKQ0w8uRK5UyF0/g1upHHLX5XxwuL+QVzodIPho4cIKgkHm++QIUnOe2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7nWTYCG; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7nWTYCG"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c5b3d8eab1so1158359eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 17:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775261190; x=1775865990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZL5DDvQ6OKJUcno6W5QyqIQNFxw1PCZLs2LADrng9d0=;
        b=k7nWTYCGhm7ST77vNUp0pC9L+wGlMAPIrc+Wko5lztXiXSBLfSTMgQmnac/ai3WHwZ
         BXW3PO9DdMrWBP8w2r4QkeAyAMDoqzV3O240hBhoYAjm9HJSDRvSSOnOy13lK0No3LcD
         kRbMpvCFpuLqL/5gwLlbRRxPHJDFQBRSQ/kRdjAs0gZu77ol/FUC4D8qe+N77coRJoCS
         ihUIFFSCAe5tJvqJq3xZnnLhbyORTWdT53dt2p6JRXEr2qe1IZHQqxgEwc2dJmEz3zQX
         FwCikzb3KmxZ66+dByqpUdVYfxuvwUJlBcO+b0FXyzhxdD+Gp24NKKiJ2tKrFmr/wesk
         wREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775261190; x=1775865990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZL5DDvQ6OKJUcno6W5QyqIQNFxw1PCZLs2LADrng9d0=;
        b=QWIg7xA8Q8VipfNiVznRJVghTY5EaDsL2OPu+KgtrThi7uwvH0mh9j5oGashT11Al6
         g8bSYR7PuQpDvWRTn7WH96rVai2/37HVrXWRXzh+Qw6dta62mOgoQjrVyYJBqUXYLpSs
         qKGZsd2UWzhzxNonntFzw8U9++Ko0u9CINwFFLDzg2klL56JqZeJAT+SeHUq07lZkJuN
         btBHOh4V6UIjkw5ijuoMD1EbWZlyoeA14QPZVpDyE5IW7MJimxcUb1jEm+FyiL3ZmJID
         rl0otZAjkO66qLItoh42F6X4H8BSZ981C4J/GTm9qECE7XwJoPki11pgKq6dpqahe9Lv
         16pw==
X-Gm-Message-State: AOJu0Yz3O7LIQObKBIU/He3SYgfemT3YL/IfKT+s12N1Co0usfu/Vui8
	CurVMpk9FKn+VAbvmQFjLxs095xWmFTnK8kT38cHdFZkj8hExdZ3/bQ0aqPdfQ==
X-Gm-Gg: AeBDieuTaB4PgrRvsirtlgXjO5GQaum4fJopHVD2nnqA0MCZiAmt5HoiG9pzUNm1PYw
	qfkUet73X0QFqmwT/w0Tf665oBu1i0Qh2R/uHx9VAUaytnGY761Zk9B+/ebkXNsajkJVcqgU8bS
	Qgd6H2YPkQPBng6vxbnJfKy/IifdbQznMtX32pUznWNhgxRx4UvkNcj/leBscysi+D3+L6kv2fX
	XXRwSL/ZMUCJOZih3OWM1ZAtegJDSYDugsIiqPOwE2QdzLVNkcozr/62/54NKOf4rsSd3bYZ6vp
	PJV2VZcMzPDNBkfks9zc7yMAQAR2NBFHXtJT5QFoN8dK6j7rSYeFRkzX/H5F3rPKkEKIDV6Phhm
	36+h7N/crRPmJIgEzgfB0IqZ4iCjGcZhLvvyY+nEfUG4F9wT8CJhHrATi8ub0dqwf0HsrabyDyJ
	CTSUs6vLBSZWGPC9sev6F6iarIzezSrTx6J+PL
X-Received: by 2002:a05:7301:2f8b:b0:2c4:ab8f:1da2 with SMTP id 5a478bee46e88-2cbfb98efe6mr2417016eec.21.1775261189819;
        Fri, 03 Apr 2026 17:06:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm6855252eec.17.2026.04.03.17.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 17:06:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for hwmon-for-v7.0-rc7
Date: Fri,  3 Apr 2026 17:06:27 -0700
Message-ID: <20260404000627.3649092-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux hwmon-for-v7.0-rc7 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc7

Thanks,
Guenter
------

The following changes since commit 7aaa8047eafd0bd628065b15757d9b48c5f9c07d:

  Linux 7.0-rc6 (2026-03-29 15:40:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.0-rc7

for you to fetch changes up to cffff6df669a438ecac506dadd49a53d4475a796:

  hwmon: (asus-ec-sensors) Fix T_Sensor for PRIME X670E-PRO WIFI (2026-04-01 07:45:57 -0700)

----------------------------------------------------------------
hwmon fixes for v7.0-rc7

- asus-ec-sensors: Fix temperature sensor for PRIME X670E-PRO WIFI

- occ: Add missing newline, and fix potential division by zero

- pmbus/tps53679: Fix device ID comparison and printing in tps53676_identify()

- pmbus/ltc4286: Add missing MODULE_IMPORT_NS("PMBUS")

- pmbus/pxe1610: Check return value of page-select write in probe

- pmbus/tps53679: Fix array access with zero-length block read

----------------------------------------------------------------
Corey Hickey (1):
      hwmon: (asus-ec-sensors) Fix T_Sensor for PRIME X670E-PRO WIFI

Sanman Pradhan (6):
      hwmon: (tps53679) Fix array access with zero-length block read
      hwmon: (pxe1610) Check return value of page-select write in probe
      hwmon: (ltc4286) Add missing MODULE_IMPORT_NS("PMBUS")
      hwmon: (tps53679) Fix device ID comparison and printing in tps53676_identify()
      hwmon: (occ) Fix division by zero in occ_show_power_1()
      hwmon: (occ) Fix missing newline in occ_show_extended()

 drivers/hwmon/asus-ec-sensors.c |  7 ++++++-
 drivers/hwmon/occ/common.c      | 19 +++++++++----------
 drivers/hwmon/pmbus/ltc4286.c   |  1 +
 drivers/hwmon/pmbus/pxe1610.c   |  5 ++++-
 drivers/hwmon/pmbus/tps53679.c  | 10 +++++-----
 5 files changed, 25 insertions(+), 17 deletions(-)
