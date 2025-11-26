Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C231CA7D;
	Wed, 26 Nov 2025 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154522; cv=none; b=goqLfyHApmyVfDTXEGwGv8yFl7u60xqT/0Dsvg34rPRnxmrRNkZZbrX6Dg9ZotaJ2gGBNR/I0vheY7UNXXoX/PnkL7aVcWDg/CCdbuJ0oiQVt1tWZb6ZXTlpGl4Ia/+ZX+f3ALMH9Qx+BJ6fZDYSl8IuNS8RMnLpj9avbEy/t+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154522; c=relaxed/simple;
	bh=NbmH3+O3JuhGT46AKR6K04OqXl8y/YO5ts+LdYB2T6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZCsHgAwQYeCvmPAX24dBKqhk0w8xxiFK09iaewn1jQgAZ9XWaty2sUEqxlXFBweZ5yxhTj0TnxrP6IiJeypLI83+paegwBI/Boik/pZkuU13GYXAO7BDAG93EtIwVpqXhn8FgwtoizoAG1WxswmdTQbG77Q86Vks5ne7FYtj/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAAX32+K3CZpl9IkAg--.50822S2;
	Wed, 26 Nov 2025 18:55:07 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>,
	Alistair Francis <alistair@alistair23.me>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] hwmon: sy7636a: Fix regulator_enable resource leak on error path
Date: Wed, 26 Nov 2025 18:54:45 +0800
Message-ID: <20251126105445.1810-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAX32+K3CZpl9IkAg--.50822S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWUuw47tr47CFWDZw4DXFb_yoWDZFg_tr
	WkWr93Grs7uFnYkrn2ya98Cr9xKr1qqFs7Za1xKrWay34UZFsxX39rZrZ3Aw47Z3yUKFyD
	Zw48Wr4xCr15AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjO6pDUUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwSA2km094cWgAAse

In sy7636a_sensor_probe(), regulator_enable() is called but if
devm_hwmon_device_register_with_info() fails, the function returns
without calling regulator_disable(), leaving the regulator enabled
and leaking the reference count.

Add regulator_disable() call in the error path to properly disable
the regulator.

Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/hwmon/sy7636a-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index ed110884786b..b8e598a616ad 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -88,6 +88,7 @@ static int sy7636a_sensor_probe(struct platform_device *pdev)
 	if (IS_ERR(hwmon_dev)) {
 		err = PTR_ERR(hwmon_dev);
 		dev_err(&pdev->dev, "Unable to register hwmon device, returned %d\n", err);
+		regulator_disable(regulator);
 		return err;
 	}
 
-- 
2.50.1.windows.1

