Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70F63546CA;
	Sat,  4 Jul 2026 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783178151; cv=none; b=U8AebKqAA64dPdVaI17bfpynkYsE8306rcfnqoAMQ0XoRXD7Msp10wzf0T1ji0Kh8o7z7NeL1ZxlNT3+ml3Tg+5O+F8KsY9dmIFTcXBpJD+7XRGa7NBwSTxRoiMsSzpH+fMptLKhcjv0yb5XnUYn6o5cFZd5jVoPN3gQ6a8z4Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783178151; c=relaxed/simple;
	bh=0AU18OCrmiX0bOgzUYHjvDM1FJQ2d1Wq2WRW+lhhJvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ciHqb6Tiv6TzN9+gmmFzCAK3Ygjl0LXFBTYieNzhmvdx8oCPN8NK0FvwbaUKtAtHl+dYC4/vye+YVdT6wR473pwwhYg1XbXeqcTYylfbjGZiFO9HLtnI/NHguqMKEFevYafgc6MCmSrDryIQEWl92LziH+SkBXyiBvNquq6IrSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACnANShI0lqbmHbFg--.36808S2;
	Sat, 04 Jul 2026 23:15:45 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: acbel-fsg032: add missing MODULE_DEVICE_TABLE()
Date: Sat,  4 Jul 2026 23:15:43 +0800
Message-ID: <20260704151543.35069-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnANShI0lqbmHbFg--.36808S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWktrWrZr4UtryUKw4fGrg_yoWDKrgEkr
	93tr97Ww1UW390g343Wr1fur9293WrWFn2g340gFZ0ya45Xw1avrWvkwnxX34kJrW7AFnx
	Za4DWr1rC3y2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbz8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E
	14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjfUr5rcUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The driver has a match table for the i2c bus wired into its driver
structure, but the table is not exported with MODULE_DEVICE_TABLE().

Add the missing MODULE_DEVICE_TABLE() entry so module alias information
is generated for automatic module loading.

This is a source-level fix.  It does not claim dynamic hardware
reproduction; the evidence is the driver-owned match table, its use by
the driver registration structure, and the missing module alias
publication.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/hwmon/pmbus/acbel-fsg032.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/acbel-fsg032.c b/drivers/hwmon/pmbus/acbel-fsg032.c
index 9f07fb4abaff..47d8d2f1e4e2 100644
--- a/drivers/hwmon/pmbus/acbel-fsg032.c
+++ b/drivers/hwmon/pmbus/acbel-fsg032.c
@@ -52,6 +52,7 @@ static const struct i2c_device_id acbel_fsg032_id[] = {
 	{ "acbel_fsg032" },
 	{}
 };
+MODULE_DEVICE_TABLE(i2c, acbel_fsg032_id);
 
 static struct pmbus_driver_info acbel_fsg032_info = {
 	.pages = 1,
-- 
2.53.0

