Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B3C41E6DB;
	Fri, 11 Sep 2026 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111125; cv=none; b=bcBp/frcmzNh9T1LQV2xgYVz+8lDtn2ynqf/7EUnoIeCS+VV/5jBrAsF2Rdxu/pnpq6q59nn6H0eCiD8mo79cv80WavbA4bnJPkQ0i6Lhv3TXWGTInN5cMYoxs3ETMzEc7+/53+/9C5A0CK6B9gLHCUIqt/akWY+4mbz2db25pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111125; c=relaxed/simple;
	bh=jnC/IR/erjL3B1oXtS+b5W5Yw4vcpnoRVI8BCWHSzD0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FDVQrf9CUkdxqfVY3G0aur/9fUZyHaHukLY13XlMDSEaJmz9YpUVN6hm9rUKWM9vDLs/ELVKJHP0IMbT8A4EB6dheHCtDjz1f0UWXvX5NHhobnT+2CTgLNzcgxio6gdTH9BgiEYvYm3pTAdrdP+2j+91nyE/mbUomx/bwHnATOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=AEUYaqTf; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="AEUYaqTf"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d658659f;
	Fri, 11 Sep 2026 15:18:26 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Paul Barker <pbarker@konsulko.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] hwmon: (pwm-fan) Stop RPM timer before freeing tach data
Date: Fri, 11 Sep 2026 15:18:09 +0800
Message-Id: <20260911071809.130151-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f54f8d903a1kunm4dcaa7a21caa32
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSU1PVkseSUkdHkxDH08YGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=AEUYaqTf9iFJBmVR4eTvnqsuZL+pgU4e0ZlceXFlfORhKCkA7W+fBnV4iQGDvpF/iJdasVW23Iu1zGbAp9ce91k1vrEYqO3Q14i31H1ImhY+Rq1DsIXRkVIflhXpxVhCerdgijJ3y6loE4jaF7XscKu+cEWqFkkkwaZZSeaWCLQ=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=BHw1Xz4Il79ijZFVbhzm026y/ge7oLeTxMH+jMArwhw=;
	h=date:mime-version:subject:message-id:from;

sample_timer() rearms the RPM timer and accesses the devm-managed
ctx->tachs and ctx->pulses_per_revolution arrays. The cleanup action
which stops the timer is registered before those arrays are allocated.

Since devres releases entries in reverse order, driver detach can free
the arrays before pwm_fan_cleanup() shuts down the timer. A timer expiry
in that window accesses the freed tach data.

With a KASAN kernel, a test-only kprobe delayed entry to
pwm_fan_cleanup() while normal sysfs unbind ran. Each of three runs
reported three four-byte reads and two four-byte writes in sample_timer()
after its backing devm allocations had been freed. The helper did not
invoke the timer callback, cleanup actions or free functions.

With the fix, three matching unbind runs completed without KASAN, BUG,
WARNING, Oops or panic. Instrumentation confirmed that timer retirement
completed before the first timer backing allocation was released.

Split timer retirement from the power cleanup and register its devres
action after the timer backing data and IRQ actions are installed. This
preserves the early power rollback action while ensuring the timer is
retired before its backing data is released. Use timer_shutdown_sync()
because the callback can rearm itself.

Fixes: 01695410d452 ("hwmon: (pwm-fan) Store tach data separately")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 drivers/hwmon/pwm-fan.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 3b87f65bae05..c633d7f6464c 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -483,7 +483,6 @@ static void pwm_fan_cleanup(void *__ctx)
 {
 	struct pwm_fan_ctx *ctx = __ctx;
 
-	timer_delete_sync(&ctx->rpm_timer);
 	if (ctx->pwm_shutdown) {
 		ctx->enable_mode = pwm_enable_reg_enable;
 		__set_pwm(ctx, ctx->pwm_shutdown);
@@ -494,6 +493,13 @@ static void pwm_fan_cleanup(void *__ctx)
 	}
 }
 
+static void pwm_fan_timer_cleanup(void *__ctx)
+{
+	struct pwm_fan_ctx *ctx = __ctx;
+
+	timer_shutdown_sync(&ctx->rpm_timer);
+}
+
 static int pwm_fan_probe(struct platform_device *pdev)
 {
 	struct thermal_cooling_device *cdev;
@@ -644,6 +650,10 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	}
 
 	if (ctx->tach_count > 0) {
+		ret = devm_add_action_or_reset(dev, pwm_fan_timer_cleanup, ctx);
+		if (ret)
+			return ret;
+
 		ctx->sample_start = ktime_get();
 		mod_timer(&ctx->rpm_timer, jiffies + HZ);
 
@@ -700,6 +710,7 @@ static void pwm_fan_shutdown(struct platform_device *pdev)
 {
 	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
 
+	pwm_fan_timer_cleanup(ctx);
 	pwm_fan_cleanup(ctx);
 }
 
-- 
2.39.5

