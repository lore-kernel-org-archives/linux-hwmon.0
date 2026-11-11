Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379976;
	b=s+nLA5jhsnSd4G8QFzipmV8YcA60U/j1QXcU7dHlnTgVmTQMeAKBvpz/kdxLUVoCTzX9
	 Qeg8GUqLdY1CRFWeowPI2eAi9VQivF/9mNtrvAoM6/mOoBSeywQ4UTsE2lgbOzr3bzzAY
	 rsc02td+g9JrXbLzI4X0NOjCRVtpZMlPxjjILype1HmMCC5DhJCSA9vEcqwWrvl5JUmKa
	 0PS7YGpHDEYw70FxrtIhiwRiKer7fYDIj394GiDOLu2fG+nW3VeuBvHQbVUsZnhLMCa5D
	 NlwLbYrN1OKEuJPSN1LTo+/k28AzNbhjZnGenqogGdiQpgsclioiISih9R2kPsarCJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379976;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wVtU8v738Ui1E6oFIdZU0RxbVE6v4Y9offS3OGnfUTk=;
	b=O6BhyMbYdX/NdVFD9tzMIkS+p2cC98rV8oF9a9UzDbSuyezqxiAhBD/Lz358SOBEv948
	 0ZJfUP0hoBXMYdC60lqMNqLh0DKvWwLt53C0uP9TnYzjRa7GvsD+zHpTAJFFYU8OSU7P1
	 AclW9qAvpElUiiO/xaE1fHGlRobScHvibwl4ekNs60YyKvulBnfEr3SDlb5UZl8BXIAjx
	 DlJgvaqa6Lh+tTBJPaKANJtPTZWPJf1GyZS7Ahf0rj5fkHVM04AOVQYUZfSWqq9aLVuMK
	 Mg+y+yoS9KWKqJ0mkx7YjdmeVmDsLJOdbGV4ORJyLtguD+BZaulj4L7SzO+BPK4HmSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Qt0D2KC3;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A42606A330;
	Wed, 11 Nov 2026 06:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A42606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Qt0D2KC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Qt0D2KC3YTLs2JkEuWyAswLPnfbJWUTKkaQ9rrANDnc9YhYK3xCqPfbBtQE5qK8HnCrBdJb6gsAPV
	 P2mv6vhpDOhsGuCnEMs8UC8+sPb4BUCQ5CY3tn4MmO4PnjWe0t2r6fYmCLbvEXQvo6od1I2oN2LKvF
	 FvQPivcxZytHLEWM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af410c5cf7-b1169;
	Wed, 11 Nov 2026 14:52:53 +0800 (CST)
X-RM-TRANSID:2ee16af410c5cf7-b1169
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af410c4104-d20ef;
	Wed, 11 Nov 2026 14:52:53 +0800 (CST)
X-RM-TRANSID:2ee66af410c4104-d20ef
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jdelvare@suse.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (it87) Clamp temperatures before rounding
Date: Wed, 11 Nov 2026 14:52:52 +0800
Message-ID: <20261111065252.17695-1-zhujun2@cmss.chinamobile.com>
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

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
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
-- 
2.51.0


