Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219467;
	b=cSm8Ka+YLPs9BrZ0xlx4LsXyH8FTZXnJoEKTLf5nkX0wpzZMgQaAV2cCuRu4+LGA6g1H
	 QKBy7XbtxOXc7foKiLE8/5xUKsnKJwfYeWFP1gp45+1OEw08kLuxwXHM0UuGZDT62m5tN
	 9+sVsx/ztZJ4alac/Q4uAA+EhBasBK2xmy2r8Q8ZRHOk53xGLpjNPdDQ2D8R9SxCQnYk4
	 M62Y+Ci2qt+wLvdkV4Tn+ANrrHJZp04kWf0BEBP4yHHVnBVUbRUPHtyog7GC0odXv0Hoo
	 biYn6L/bQY6hYFmcDoLGk/UdTb7Cp2vtUvOwPcJ3lj1UdHhTXj7KB+1WbC0avd9hIrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219467;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ddkOtMAYrsvUcLScu0EXL1q3r0bk7k3jibPpdc8N7ao=;
	b=URcq7DefWOV7mSg+dI0jHFuJJwQitFL01obMQpme9TqjEdes9lmLxw4sgP+19gcUVPpa
	 PX6oLhHvkQMbcZvxAeZt1EKB0HAfVeG3kEL4zTyvYtyBbqiFWo12+JSHPzbnWENQyPROs
	 jIIdzaDhpTMx8S/8U58PlnIEMk50Xn4UBFLEfwx7EjcQCu5vOomnIGy35lAgddVPfqjCS
	 fll6/2GmmzAji6dT843Nm+c8gGemlPzg9fLS++Ir1I9F8Di6qOZ0SqFpvHww1cSNMEcFc
	 cYkKbG66hoBtQ/nvKt4PGw+WeHuYefl3i165AYtE1mk/tU0j6yhCRa8/VoJ+CdomZHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=P0p5PnRf;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005BD606D807;
	Mon,  9 Nov 2026 10:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005BD606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=P0p5PnRf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=P0p5PnRftzOqM/fis4IKOwg1wV46an1d0qxsVwCIofOdVUqvvnNbV8zCA6kFh+bdqMs0bW7q7OD6i
	 6KlUc2AQ/iBaat/Lrco0ZbRyxlCYyieL6Ep16vo5PwL4Q0s7B5n54iAZSHhaaF51E3uMnY60EZMTbo
	 RaQ01AeXiFUrDysw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af19dbf1d2-ca47b;
	Mon, 09 Nov 2026 18:17:44 +0800 (CST)
X-RM-TRANSID:2ee96af19dbf1d2-ca47b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af19dc746c-8bf54;
	Mon, 09 Nov 2026 18:17:44 +0800 (CST)
X-RM-TRANSID:2ee66af19dc746c-8bf54
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jdelvare@suse.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (it87) Clamp temperatures before rounding
Date: Mon,  9 Nov 2026 18:17:43 +0800
Message-ID: <20261109101743.16955-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

TEMP_TO_REG() adds or subtracts 500 before clamping the result. Values
near LONG_MAX or LONG_MIN can overflow, causing a high temperature limit
to select the lowest register value, or vice versa.

Clamp the requested temperature to the signed 8-bit range before
rounding to whole degrees.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

 drivers/hwmon/it87.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index b8ad1ed043b3..036e0b7ce01b 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -771,8 +771,8 @@ static inline u16 FAN16_TO_REG(long rpm)
 #define FAN16_FROM_REG(val) ((val) == 0 ? -1 : (val) == 0xffff ? 0 : \
 			     1350000 / ((val) * 2))
 
-#define TEMP_TO_REG(val) (clamp_val(((val) < 0 ? (((val) - 500) / 1000) : \
-				    ((val) + 500) / 1000), -128, 127))
+#define TEMP_TO_REG(val) \
+	DIV_ROUND_CLOSEST(clamp_val((val), -128000, 127000), 1000)
 #define TEMP_FROM_REG(val) ((val) * 1000)
 
 static u8 pwm_to_reg(const struct it87_data *data, long val)

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



