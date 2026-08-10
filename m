Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E2844212E
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389838; cv=none; b=NFjKQj0EDPivcfsq/7mPbOS/6I8YRHULIOWB3tClrawt28hpx8v4MBSpN5kCjh61njSzmXw4c+RSBb2sPb45GV/tLVvBC/78p7RzCluM575hw3Djy/jIDFFdPHv/r+eqGMKzbt/Zk0p2wUtxYPhUGTjPkNNX1q9+MwDYBkFxx00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389838; c=relaxed/simple;
	bh=cmcBRihOWeRm2A62QThP0eO/LBtlR8g441e00NZTPlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSMMD2fmN+V1WxUYEdmw2aHjSXuWk1lonOOSsqsdsUmQf7ZMdGrR5nxcUo30fhtjENlVHhLtW1GPdlhdPI8veKqf+R2BMVQewwZEKYnNIsKv85otDt/X16aE8K/LgiWzan8PVvhIsu2RlfWuaT1620CKIku1SzpGFn/OHQ/U9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/larUZq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/larUZq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso25987075e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786389828; x=1786994628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=13S3RQKmhLPmbcYWBBgpmRSfPBJG5AWZF61QpVweiYo=;
        b=Y/larUZqR5K2ccIQhpp68eGBgXlQ8j8BAGPW16fpKCXBzxW/mr71ZdP36zqofYv5q+
         bnHcBBW4pU+1YhtXmtRRwCw3pagGLOCeD/r0T/aFkPYDwyU1ZCSD932EyKtqSC86/LR7
         pRdLrM+xwqls8oJwFL94UcyW36Z+1aHpZXo2uPB3QZZRFDWLVYM3x/Jyzh6MydFDAQ5j
         3DdQKZiE+6VP8jAKScL8bgpVxdn2amfZHkn9JA/d7Rz7KbVljBu6u3xmb4BSmXpW0ZBj
         hWMcOXbaUWuXfhD3vwf/ioRkFedW9K/9jjlb664VUM255isqhhoPKjY2v3DP9yV5y5mQ
         V31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389828; x=1786994628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13S3RQKmhLPmbcYWBBgpmRSfPBJG5AWZF61QpVweiYo=;
        b=jlXGJDg25EA7I9jutjx1tukez1QL5m22yGjxmnlhTZYTGlktJRyOmNXKCI2XkWjNKu
         2HEiq/FwuVF8nJh5WvPU484+I06W1pvO50UGNNgdU9KNgwpMo9W/QX25kSz7i9hYqmAT
         14DGqsURFdyBZubAGkaJ3ISq9hrxBfsTrj19K4muYoofdjYhpe75Y2ynHaEC7e60AXYq
         YtHBknGhr3XAjIH+IrAJ9dfPY8lRamGFVrcu2WH5T5VU6gWRWkDzjNyuH5ac/4PyYmCD
         8alz6tgEMuboo1e4YGVKS8mHhlUbtXfQ/c3Ln9NukKYLNUBHbkS0jsMdvaBaaGAA/V4U
         qt1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoxRginLZjBimxk50/lFFSCLk8joI1x98bzm45a7McnfrqIsFJwFwikbaN3C9c4NbvStHehYIYr197yaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjz08kPZHwfu445A9a7i4IRmm0Da19JbLOkURtukg+VcCWAo9Y
	J2B+h7S0CU93erpNH547NU9FyScSG/iPvdjSH/lWB4y8IiL9IlEyWmspYeaCoA==
X-Gm-Gg: AR+sD11UmywYAoem8+0FRdFm7n+h8cyXNvGQ03b7H/cz2r5kNLThPRJ/btoXh4j5EXk
	k/fdyE/idfh6NAiDq3YyCew6kL2aqyN9JKstAnzjJkitlbGewr2R1uyBwTfAilbjA3C/qoqVik1
	8q4FlanAnuQBvAzsyN+Tgxy5kcmwQWrQ5fDVz66MNattlicQtK2uwy3LeDCur8fh0f13u0wIHdp
	wLfuA80mBv63dh5DTSZG9gdfwunQJLGeYEvt3Z2IR/MTtslLhksgDmFILna91YJl6QjDlywCpmP
	M9w0n8IZSouafW09RJeRGZ01B+tCV2/VUgcR3vm9It/5L1RrdLbr8xMWAWe3ir5wi142UhnB7ax
	xxYfrBowRYAZje1dqdmv8KxPMUK8e2/xOi76iCDtsYqO63Mp8VfJb+DUjb4NhaksBk4zgCZgESm
	tDt3b2cQHSBA/lZEryRjjjmdoaATxdBmTO+usRuqWU5ynFG9/aNOpOx3SPRpyOVNH9q5nW9xGqs
	nSBp8DVMv4PmSXHuoqSuDSIWUpP/b0=
X-Received: by 2002:a05:600c:1548:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-499726dacc9mr43965065e9.0.1786389827363;
        Mon, 10 Aug 2026 12:23:47 -0700 (PDT)
Received: from prometheus.tail8f5cca.ts.net ([85.11.110.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49974170572sm12497975e9.15.2026.08.10.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:23:47 -0700 (PDT)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Zhang Rui <rui.zhang@intel.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Szymon Wilczek <swilczek.lx@gmail.com>
Subject: [PATCH] hwmon: (coretemp) Fix core_data leak on CPUs without PTS
Date: Mon, 10 Aug 2026 21:23:44 +0200
Message-ID: <20260810192344.3733721-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pdata->core_data is allocated in init_temp_data() when the first core
temp_data of a package is created, but it is only released from
destroy_temp_data(), and only in the branch that handles the package
temp_data.

Package temp_data is created solely when the CPU supports
X86_FEATURE_PTS. On a CPU without it, coretemp_cpu_online() never calls
coretemp_add_core() with pkg_flag set, so pdata->pkg_data stays NULL.
coretemp_cpu_offline() then skips the removal of the package interface,
destroy_temp_data() is never called for package data, and the array is
still allocated when coretemp_device_remove() frees the platform data
that pointed at it.

Release the array in coretemp_device_remove(). destroy_temp_data() sets
pdata->core_data to NULL when it frees it, so the added kfree() is a
no-op on CPUs that do have PTS.

Tested on an Intel Core i5-1135G7. The driver was instrumented to log
every allocation and release of pdata->core_data, and the PTS check in
coretemp_cpu_online() was patched out to emulate a CPU without package
thermal support. Without this change the array was allocated and never
released, and coretemp_device_remove() still saw a non-NULL pointer.
With it the array is released and the pointer accounting balances. On an
unmodified build the release still happens via the package temp_data and
the added kfree() sees NULL, with no slab warnings over repeated module
load and unload cycles.

Fixes: 1a793caf6f69 ("hwmon: (coretemp) Use dynamic allocated memory for core temp_data")
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
 drivers/hwmon/coretemp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 6215ea49faaa..ab9c8cbf887a 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -650,6 +650,7 @@ static void coretemp_device_remove(int zoneid)
 	struct platform_data *pdata = platform_get_drvdata(pdev);
 
 	ida_destroy(&pdata->ida);
+	kfree(pdata->core_data);
 	kfree(pdata);
 	platform_device_unregister(pdev);
 }

base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
prerequisite-patch-id: 1c584cb0c0bb331df7601073d4f307fec3fcd585
-- 
2.55.0

