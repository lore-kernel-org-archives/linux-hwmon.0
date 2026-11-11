Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379970;
	b=Xu8o3PfFyK2h8ZIZooNAcsEhwYE8tDKOlmP+P6xJnZqBCaXPh/zHDWiMgMPuEOOY3hNd
	 UPWyQxW0FWPUIKFdpkT7/jVaer/7GarorMYMs7ybhVbZDClhLQcThxfPgmEC1TSF/jua1
	 cpdKYhdDpZ+7ll8wDh3Qrk89XclE/hQ5XCnKE1iRRnLxg2k5DosytPkSvs/Zsr6gmA2w/
	 lZzq486odsD4OAfuT8aYi6wgD3XHTlCF7dN7IYG9EMfjpRyhWTM5uL3NUKJ4bxNXDV0hT
	 thqyi5ZWawSyul8EHgb3Er7ED+A+LJycswyVGP4UIZTZokPSBUFPzpfQnRzxaB0E94g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379970;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pnjinjODmMLa7JROu/ME+a4Z2QVAzLBoXj0aMC9e0wU=;
	b=AuAifB0czgPLdi0mVj5MhQoMAquSJGh5rZllSEqmVHMcy6tWdlVvmtpoYGj2l1WxUMAE
	 j45k8qspqWYqFcJMaO/yZGNV+iM437ZKtyaAdve6lOqvZrR7m+SYZp0W4wRmLHwWaG47u
	 IM30htdThVIFWV6Ffo4/iaZ80bcSmn+g1NNhdgFfb0tgp1cHIciOx/pT5i1ZUWOBXEnPQ
	 uIaF0cW0R6nqwoAwxukmSFcIpdNr0TG+rm2qMcOCJroNkWgmzsUsV/J6ac0yIIRpMmlcu
	 6mUA2ZAp0CF7v10jyomPwB5chWH8qhcbpON3c4+J2e+c8u8QxmHvFKIUUY4E0IgVtuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Evf6g9i3;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D3F606A31C;
	Wed, 11 Nov 2026 06:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D3F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Evf6g9i3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Evf6g9i3t84y04zo3L5cv174H9sFNHv5XRhoKiVNYhuFZrRb1QPbSmlqLodrcphtb6p8iAVIsDN8n
	 UciUH5kwRuJNeMP4vwnKZY/2XBxBRnk22VFy9rB8//4jaz22n5nLXtlxgzbQ8E4lAjYJFJGVGq0EG5
	 gIZ+4CN+ekZZx2zQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af410bf67b-da9de;
	Wed, 11 Nov 2026 14:52:48 +0800 (CST)
X-RM-TRANSID:2ee96af410bf67b-da9de
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36af410be1d2-d136d;
	Wed, 11 Nov 2026 14:52:48 +0800 (CST)
X-RM-TRANSID:2ee36af410be1d2-d136d
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jdelvare@suse.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (it87) Bound 16-bit fan limits before conversion
Date: Wed, 11 Nov 2026 14:52:46 +0800
Message-ID: <20261111065246.17682-1-zhujun2@cmss.chinamobile.com>
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

FAN16_TO_REG() doubles an unrestricted positive long and adds 1350000
before dividing. Large fan limits can overflow these intermediate values
and select an incorrect tachometer limit. Converting LONG_MAX can select
0xfffe instead of 1.

Apply the same RPM bound used by the 8-bit conversion before doing the
arithmetic. Keep zero as the alarm-disable value.

Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/it87.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index bbb3f9788c2e..b8ad1ed043b3 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -761,6 +761,7 @@ static inline u16 FAN16_TO_REG(long rpm)
 {
 	if (rpm == 0)
 		return 0xffff;
+	rpm = clamp_val(rpm, 1, 1000000);
 	return clamp_val((1350000 + rpm) / (rpm * 2), 1, 0xfffe);
 }
 
-- 
2.51.0


