Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E501A5BA9
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Mar 2025 03:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741749306; cv=none; b=pFWxL9bEOAhJkYqclPjRScNxR++72n3a8gxy2cocD5ZAGRwZlXp/cNz5s3UzJjCuhIHTT7Jnt2BxkkDbJL5k5dktXUxvI61RQr/EPYX4ufQ5w6XjlmM72/hZp3nX54a+8jdYiQp4OFpS3u8OAvUsUuGhM2c7KjzqryGGGU5Chy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741749306; c=relaxed/simple;
	bh=lLiinFsf6dzuzLVBrSf38DHhzKbtBhiixtsvYpDZnPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QclSTP+6deV6BQ5SypvAkLbBQYFusP6mpj0mvcdJBOKF/wshLisAJXtIoj4sZ3hDdZK3bKUbRLnwDZb2hNYDJs7fyQSfySTgOKEcB5XwP5sPdNsVez03ZzDPQlyWsTW6MqxQa3wBO5esuA/jMYC2l7mThZWhN5LoiFnuL0Af7C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=XAgOGQPy; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="XAgOGQPy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Eh53+LzKAMOCTF7qxCeyjF3NvgZCvtnJdZbpOru5X00=; b=XAgOGQPyncgSh/J4eoHhNHKIoa
	Cz2WqoJOYqYbnoI0+dLoZIgawCc7I14gd78w10WpAm0SkUCF5LBwq446aB8nU6RUty+WxD5EsCV+z
	Qexu0sZStN62zZ1U/Np1n8UIcLh2iuiLnQCdGMJkR8UQTD+gCaXhktw1FTkKSBMkxR5scQfx1q/Bb
	hKP03EZ0LWaMuo6KKUFeC28e1St1vDqaUlXGLx6DbEeGplB/v/CZ75pbX0Mr2MxeP2z9xLaDrHYrV
	7kVHYvR988mXl/qijIGFi2hlD+ZxTDuIDk/CLZUROaUvqT2GMTHlSgAz2SEJNvYO2Sov+fqj5qwcq
	6TGGRitsRD8GUgjYrBqgZ2//e54Hp4jn3N/FxIbqOdd7pakSX3FT3DrvSOZGsqg3FN57LuTA/Q2u9
	KgbxTzab8yO3YYF5PvgoT5ASTVPwiQ3bkyNsTCQq4cDNDCxHXRbQB7cS5us5SU+8NNvAotw2E3hp1
	+vtyKDkaD5k3/NiSPDYD6UF0fPCNh/is4BmniPNzL5RZwDLCjB3AW7VyDXyyFP375kHTOZKhMHRMw
	TWuP4UoYP2qb/LPkTLka1F+8WS2fhk0Sx/zQXYJEdjS+dvQcJxTyhBfH57H1mnGRDCRoS3LUof1Zn
	Ni1JJZRhkTMR/iYIpGcvj8kVLPA9/4i/16KpKmDvE=;
Received: from [2a02:587:6a05:cc00:427e:b12b:efbc:e3a5] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1tsCSX-00000001oMn-1icr;
	Wed, 12 Mar 2025 05:08:41 +0200
From: Tasos Sahanidis <tasos@tasossah.com>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH] hwmon: (nct6775-core) Fix out of bounds access for NCT679{8,9}
Date: Wed, 12 Mar 2025 05:08:32 +0200
Message-Id: <20250312030832.106475-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pwm_num is set to 7 for these chips, but NCT6776_REG_PWM_MODE and
NCT6776_PWM_MODE_MASK only contain 6 values.

Fix this by adding another 0 to the end of each array.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 drivers/hwmon/nct6775-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index fa3351351825..79bc67ffb998 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -273,8 +273,8 @@ static const s8 NCT6776_BEEP_BITS[NUM_BEEP_BITS] = {
 static const u16 NCT6776_REG_TOLERANCE_H[] = {
 	0x10c, 0x20c, 0x30c, 0x80c, 0x90c, 0xa0c, 0xb0c };
 
-static const u8 NCT6776_REG_PWM_MODE[] = { 0x04, 0, 0, 0, 0, 0 };
-static const u8 NCT6776_PWM_MODE_MASK[] = { 0x01, 0, 0, 0, 0, 0 };
+static const u8 NCT6776_REG_PWM_MODE[] = { 0x04, 0, 0, 0, 0, 0, 0 };
+static const u8 NCT6776_PWM_MODE_MASK[] = { 0x01, 0, 0, 0, 0, 0, 0 };
 
 static const u16 NCT6776_REG_FAN_MIN[] = {
 	0x63a, 0x63c, 0x63e, 0x640, 0x642, 0x64a, 0x64c };
-- 
2.34.1

