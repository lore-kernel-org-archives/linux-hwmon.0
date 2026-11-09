Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.239.18.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212738;
	b=BE+2/aqvLfM7NbJsExkf/mIfXRz/NNsua/Xz/2G88zifUcHhtGDUfDGur+lJb9bXlSBX
	 +cjTgXPWH+OR75/7xlJAfOUfgNv44bsn4w87lG4lOiOq/ORZ/rmRa5/jIAVf26GVnOEVV
	 VyJIBtWpsHov/UpWAnBpIcKCZa7z5Ae7TYKuGU/N3A1hpi43Kpvlx1Thd+nIcSkz2xaKm
	 ZbdUIybLHJRpXn/Z3dNdLXRB8CKRXQjVCR6jBi/E1D4tq+sLPcvL5gm+pL6y9vv35778e
	 GnANYucQPAbuUjEphGFwya+YWuZ7maPpM79H7awTjxSWAVhUyWJslDqb20BtownvxZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kGQvWo/xPEHPMcUYpxjKbmNlMcLuvue4Rku5+1n/1RE=;
	b=q4pdcH42V1mFgKp3WtHLssq3IbWTTYJsp7G3xTssoS7bNcIe5/e5pHWiS2o5JzlGqR2D
	 fOTQHzBLqEDEuXO8ubRI1bXU+jhXELjhFYVtSy+kzzZnKNX7NbqwVS3WOG5LJ5DXI/YCf
	 3maAK/4HRdqDJWDTKcsWng6MdoSR+b4p0lETkemEBeokib2yyIhMBkLf6ciXL8VSHaPgg
	 2UkvB4Df5KfZzeMUHviOU+kBErJtRYO9bh6aH0YsvDdwp+lszfqiZPPKMUce1jha9vL0w
	 PlmpHCW0Bjy0lcM21q7WczGAU7hlqnCyzl4EvOIhgUqfuu72Ihzqw3Lv5xu4uB7Sncg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ac2.se;
	spf=pass smtp.mailfrom=accum.se;
	dkim=pass header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=WX24HB3g;
	arc=none smtp.remote-ip=130.239.18.156
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE282606A337
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 08:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE282606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accum.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=WX24HB3g
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 6DBA444B96;
	Mon,  9 Nov 2026 09:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1794212728; bh=10JYNY6cBmSi3Yuv+baG4Dr4W/iPnYXNyNhOxfW1a9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WX24HB3gFTB/eeTD8CJt+8Gue1aRNKWMeMuoz++opbetiio5YoJmeojawnZYehcch
	 Yp3p5Ql3UhVS2w457sg1MsuJayNcRcJB1vnM0SjXQCmjFWUlUt1rOkZoUkoB791ixw
	 h6eYazjJttWmX7GIDKsnmIpVLOzH1frrE/nuGO2U=
Received: from suiko.ac2.se (suiko.ac2.se [130.239.18.162])
	by mail.acc.umu.se (Postfix) with ESMTP id 131C244B90;
	Mon,  9 Nov 2026 09:25:28 +0100 (CET)
Received: by suiko.ac2.se (Postfix, from userid 24471)
	id 0EA9842B4B; Mon,  9 Nov 2026 09:25:28 +0100 (CET)
From: Anton Lundin <glance@ac2.se>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Zev Weiss <zev@bewilderbeest.net>,
	Anton Lundin <glance@ac2.se>
Subject: [PATCH v2 2/3] hwmon: (nct6775) Avoid reading nonexistent PWM-mode registers
Date: Mon,  9 Nov 2026 09:25:10 +0100
Message-ID: <20261109082511.851377-3-glance@ac2.se>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109082511.851377-1-glance@ac2.se>
References: <20261109082511.851377-1-glance@ac2.se>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A register value of 0 is used to say that this pwm doesn't have modes.

There were already a guard for this in store_pwm_mode() but
nct6775_update_pwm() didn't have one, and read register 0 and then
didn't use the value.

This introduces a guard so we won't read a configuration register we're
not interested in.

Signed-off-by: Anton Lundin <glance@ac2.se>
---
 drivers/hwmon/nct6775-core.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 3515a962adac..09dc9cecb278 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1432,11 +1432,15 @@ static int nct6775_update_pwm(struct device *dev)
 		if (!(data->has_pwm & BIT(i)))
 			continue;
 
-		err = nct6775_read_value(data, data->REG_PWM_MODE[i], &reg);
-		if (err)
-			return err;
-		duty_is_dc = data->REG_PWM_MODE[i] && (reg & data->PWM_MODE_MASK[i]);
-		data->pwm_mode[i] = !duty_is_dc;
+		if (data->REG_PWM_MODE[i] == 0) {
+			data->pwm_mode[i] = 1;
+		} else {
+			err = nct6775_read_value(data, data->REG_PWM_MODE[i], &reg);
+			if (err)
+				return err;
+			duty_is_dc = data->REG_PWM_MODE[i] && (reg & data->PWM_MODE_MASK[i]);
+			data->pwm_mode[i] = !duty_is_dc;
+		}
 
 		err = nct6775_read_value(data, data->REG_FAN_MODE[i], &fanmodecfg);
 		if (err)
-- 
2.47.3

