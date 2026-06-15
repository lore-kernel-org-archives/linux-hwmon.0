Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123733AFAFF;
	Mon, 15 Jun 2026 06:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506021; cv=none; b=TeWybzr1wOuuEhVNKkeym9qR7rydPkAkXRBJHmVlV9Ctx4rVCNQvCJjSgmzIaOW2yYv2Zx2DgOjBuwY2a4XM2km4MeP+b2UbTz4XMQ7x8TtU00uOgPcJzaaASi7GhDsAMxQjCYTMxlQbkY9yzi/C/EcUoQeZ9Z+48XCfUsZJVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506021; c=relaxed/simple;
	bh=NUPO8d+fdvF8v5TjLwW5umGWMJvx/Tj3GLjRV7HdJQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4Sm68DChOyFaP5HCkzPrqoHAcyxSfVjbo/IUcf7tUzTLTb95B8U6+4n4ACHUXGaI8eoSJybEzpRsgdT8TxmznA1s7Y8bJ3BrU0xfe0a79t/a3ClALnJA0zwlJ735MpldYuRXsN+TQtGiFpWR6x453CFXDHnzGL0si+89FjXBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHx_reny9qcMmTEw--.24605S2;
	Mon, 15 Jun 2026 14:46:54 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] hwmon: (ibmaem) clean up sensors if version sysfs file fails
Date: Mon, 15 Jun 2026 14:46:36 +0800
Message-ID: <20260615064636.39215-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHx_reny9qcMmTEw--.24605S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF4rWr1xXFyUuFWUGFW3Jrb_yoWDuwc_Cr
	W5X34xAw4UtF1Yq3ZIyryFv3yvkF4UuF4fJF1fKa9xAry3XFZ3Xr1vvrn0yw1xGrW8KF93
	uw48XrW8C348GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwkFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj9a97UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

aem_register_sensors() creates the dynamic sensor files and the name
sysfs file before creating the version file.

Errors from the dynamic sensor files and from the name file already jump
to aem_remove_sensors(), but an error from creating the version file is
returned directly.  That leaves the earlier sysfs files published even
though the AEM instance probe fails and the backing state is torn down.

Route the version-file failure through the same cleanup path as the
earlier sysfs creation failures.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/hwmon/ibmaem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index 0a9c3a29e6f2..305c41dd15bb 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -945,6 +945,9 @@ static int aem_register_sensors(struct aem_data *data,
 	if (err)
 		goto error;
 	err = device_create_file(dev, &sensor_dev_attr_version.dev_attr);
+	if (err)
+		goto error;
+
 	return err;
 
 error:
-- 
2.50.1 (Apple Git-155)

