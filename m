Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D72275AE3;
	Wed, 28 Jan 2026 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769585188; cv=none; b=oQm8hM/Xp9wTzLQa2o2d6vJajUTnickkosMwDTPKar8sn8PtzkNL+hqGRf1wYf3Yv5IPx4rOW559jEp7b7Dj5VMs7/nnISPLx7bEa3j9H8TtLnbWcPtA5uaIlhRKp3rJLGevvA9iI3yS3gStnxC2eM/C83h4WO76Odxh7+1OyBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769585188; c=relaxed/simple;
	bh=R/WM+7Oc7FdzHmXnwhg9Z7MobMv6qKU5bU5GQs+44vc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GAnmMvcHIec5GU/KZR4RqFgXpnoMKcI1BLkcQBaty23cxpQDIZN3fjWOgdTkmx8ISmezT+THERFF+WVqU46HGZjhENMY91N89djakiQ1ZgLwQ7/JkDk4Eg+mrKX7uwhYaHjrD3e8PGK+qOgVtN4amgZtStt11kWQ0Y9oG/x96KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAntwoeunlpRAPdBg--.32823S2;
	Wed, 28 Jan 2026 15:26:22 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] hwmon: (pwm-fan) Add missing check for device_property_read_u32_array
Date: Wed, 28 Jan 2026 15:26:10 +0800
Message-Id: <20260128072610.2476625-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAntwoeunlpRAPdBg--.32823S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr18tw1rAFy7Kr4kXF15XFb_yoWDAFX_Cw
	4xuFZ3XrWrAFZ0kF42v34Sy34jqw1S9FZ7Xw1Utan3Aa15Z3s3JrWIvr1DGrn3ArZrZrn8
	Cw18ArW7Cr4rCjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUjb18PUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add check for the return value of device_property_read_u32_array() and
return the error if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/hwmon/pwm-fan.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 37269db2de84..3535007f5c37 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -609,8 +609,11 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		for (i = 0; i < ctx->tach_count; i++)
 			ctx->pulses_per_revolution[i] = 2;
 
-		device_property_read_u32_array(dev, "pulses-per-revolution",
-					       ctx->pulses_per_revolution, ctx->tach_count);
+		ret = device_property_read_u32_array(dev, "pulses-per-revolution",
+						     ctx->pulses_per_revolution, ctx->tach_count);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to read pulses-per-revolution\n");
 	}
 
 	channels = devm_kcalloc(dev, channel_count + 1,
-- 
2.25.1

