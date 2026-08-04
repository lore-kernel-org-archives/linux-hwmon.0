Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531EC429CC6;
	Tue,  4 Aug 2026 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829756; cv=none; b=LAV7ubIJCkol/WnaFCKcNcxTiNX+UevqnKTGdk/B/XvxCVteAjgv1yIh7mWmnpomF6+b2PiTEQOMqAAsL4SrcNgknaLu660wcMnNwDIqbOqztZOVGPTe9++iWPgAK8AGfdDsxYp1MyYjWTXeTQVwNqN6SYuYXbjCzjsyE0rJipQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829756; c=relaxed/simple;
	bh=6TOyFHCsKvP3XY3bEblneLWpWYQKPuxX2Q+3qk5v2r0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L9vrdtUKf8z0nu/Fy4xHqJM9NY+vY4AqXVJEtKn09ACd6sR+ZO7gTS8CsogbD/eSts7XE+JkOnrNxh/2cxxK80Z4snlMaeyh9Ita+4V5CMb15wl0Sb9hLxOkIFHWisSNvMxmtl+Chlf0U0M5LWcSaDwKPxRpG6rbuSLdg1MA8SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KgS0Nz18; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KgS0Nz18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+B
	/rwI+u6vQelmZMzZCAyIww0TT71xhICa1MNeg8psQ=; b=KgS0Nz18Xujt+vGHTO
	/H05DjioAJPSORo7ub1CLnudFKSCF+GFd3zqhAdHpgFfO5JrqJiSMjVE59n8Mcjh
	njUmVspmzc8A4rJS73J3J9lABW24DOVe0kK7mQlcbPWZBC0eaKi2QXbi0OPEPMhK
	TwTbgKxCQ9Pv88ciAsDgaly9w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3X5NcmXFqbW2DJA--.34588S2;
	Tue, 04 Aug 2026 15:48:45 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Aleksandr Mezin <mezin.alexander@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH] hwmon: (nzxt-smart2) Check return value of init_device() in probe
Date: Tue,  4 Aug 2026 15:48:42 +0800
Message-Id: <20260804074842.505923-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgD3X5NcmXFqbW2DJA--.34588S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw47ZF45JF18WryrAryUGFg_yoW8Zry3pr
	WrCa9IkrWDKrWY93W7ZFy8Za4Yk3W0y3yFkryUJw1F9rn8ArySvrWrt34jvwn5tayrGFn7
	AFyvqryrCF17ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piw0ekUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6R10P2pxmV39EQAA3M

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

The init_device() call in nzxt_smart2_hid_probe() can fail because it
sends HID output reports to the hardware to detect fans and set the
update interval.  If the hardware is not responding or the HID reports
fail, init_device() returns a negative error code.

However, the return value was ignored, causing the probe to continue
and register an hwmon device even though the device was never properly
initialized.  This leads to an inconsistent state where the driver
reports stale data or blocks on wait queues that will never be woken.

The same function's return value is already checked in the
reset_resume() handler, confirming the author's intent that errors
should be propagated.

Note that this fix was not possible before commit 59d104b54b0b
("hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop")
because the out_hw_close error path was missing hid_device_io_stop(),
which would have opened a use-after-free risk window.

Fixes: 53e68c20aeb1 ("hwmon: add driver for NZXT RGB&Fan Controller/Smart Device v2.")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 drivers/hwmon/nzxt-smart2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index ff0c0bee0e83..efc78a8f58c8 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -754,7 +754,11 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
 
 	hid_device_io_start(hdev);
 
-	init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
+	ret = init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
+	if (ret) {
+		dev_err(&hdev->dev, "init_device failed: %d\n", ret);
+		goto out_hw_close;
+	}
 
 	drvdata->hwmon =
 		hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", drvdata,

base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
-- 
2.25.1

