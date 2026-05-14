Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB07308F0A;
	Thu, 14 May 2026 01:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721252; cv=none; b=KFJigo8xXp9sl/z1pROzyQimgHcd13bQoKHApd8TZomqKpfam2FIzLwDqUXrfhqwjEbK3n7f6RmHwOLqrJnZ4b+pXRGPvDZKSAUNh7MSsHRxsyX769Z96sBtQd0V3PHx5wD0RPh9tbPek5FHVZkEV+uIbmA8B7U95SO3yafYGBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721252; c=relaxed/simple;
	bh=sXLih5raIl33sSNlnOoF6ZEBSgpWgjRZfHKHN76USE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMH9k9K1Fw7Mm5cTGK2ZgZZZm3s9JubauOnRN9KMN50Q6r6ORt5hsMjeosNlhBdILl9Rv/Y0kW6Ou6amg6/fPl77nG+XI4UWoE3I60AttzKT7MPucs9dwwWcMOnji3zY9UTpxJRekTrHztCbUgeWLXdIbv9iKnG42QKnajNuzH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Y9Vp3y4t; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Y9Vp3y4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Kc
	Drh3VbtdURX7weCLGXHiqFH5wBtE/xwYPo6+ozhNU=; b=Y9Vp3y4taV180X+Pxs
	rKAxYV4+hvWdk2uoFq9yeF64FZdMAh1V6FZf5pUr8lJ5Jr1Fc6UKDDLFD7C1C0RF
	zkjtAkxaYYA8skrGwaeFDBD57+OpQBOSjw6yk56RFpSkxcTXzTi0AF8XDKI5Sg5H
	ij7wPjAY77Q9zo5QU1WM4xd6Y=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3Hy+1IQVqnFYFBQ--.27803S4;
	Thu, 14 May 2026 09:13:40 +0800 (CST)
From: Kean <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean <rh_king@163.com>
Subject: [PATCH 2/3] hwmon: lenovo-ec-sensors: Fix NULL pointer dereference when DMI match fails
Date: Thu, 14 May 2026 09:14:10 +0800
Message-ID: <20260514011411.4167069-3-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514011411.4167069-1-rh_king@163.com>
References: <20260514011411.4167069-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Hy+1IQVqnFYFBQ--.27803S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF45Xw13Jw1fJF1UZFWUurg_yoWDWrc_ur
	1Uur97XryYywn0yr4vvF4S9F90kFWq9rykZr1Iy3yfAw18XFs5WFWkZrs0v3WfurWUAFZ8
	A395AF93uw4fAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRpHqxUUUUUU==
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC3wRVBGoFIcT3RAAA3z

dmi_first_match() returns NULL if the running system does not match any
entry in thinkstation_dmi_table. Without a NULL check, the subsequent
dmi_id->driver_data access dereferences a NULL pointer, causing a kernel
oops or panic.

Add a NULL check and return -ENODEV to gracefully fail the probe when
the driver is loaded on an unsupported platform.

Signed-off-by: Kean <rh_king@163.com>

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/hwmon/lenovo-ec-sensors.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
index a32b1f2c6a3a..b0f2a04ce679 100644
--- a/drivers/hwmon/lenovo-ec-sensors.c
+++ b/drivers/hwmon/lenovo-ec-sensors.c
@@ -546,6 +546,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 	}
 
 	dmi_id = dmi_first_match(thinkstation_dmi_table);
+	if (!dmi_id)
+		return -ENODEV;
 
 	switch ((long)dmi_id->driver_data) {
 	case 0:
-- 
2.47.3

