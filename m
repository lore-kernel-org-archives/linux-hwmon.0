Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379889;
	b=gKhSRz0cduLfFoOpaKcK4hIIgueqZEovg1EmP3L1OP0e01jPs0JAJi7XTty3LNjSTftl
	 7mhXyriP1b87sdUoYQdnCKEE9tQW82Q68SfOhbLjfEG7KPYfBTGub+Ll59LxZzW48wKql
	 0h0U48/JVAvRa9ntIzDVZXj9IzY+6qOAagqIVns+hz86RuD+ZHPDFavA78wepJs/2T2Vw
	 nQJL7tOUBmBI3DuZxZmVdks3pyz5+XzfFVgTNYvdTBzqwl1T7PuoELgHsAcJ2UVzGvTAK
	 fMuvJcaBNiXAEIUI2CSjkfjBIDN54u/UNJeldbx6tRjLSQ3lXln3Bg9o2WELxHyclQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379889;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Dcn4NTXZOWzahlVK6mPlUnVs+tsyJTRCB6y3SqfZ5eA=;
	b=QHfNw4xfRHvzxEJ8J7Fz/p/pXLQt3c54tUQkdpIApa3b1a02Fnx8EIJG25GoaanvYpbU
	 MkIp1g2MQIfLgenfvRONoRXjE6B7wHTurzcScH1tb7SO0QL+85fV4vOxhdexEfMr9VpLa
	 pHgXCAPfk3yofcrCa1xfMnqukyfK+6/KeZMCUz7EDoiIt9l6wnv48ZngGXIFs94+klq33
	 fcpGnVTPKKfbaErii64yJW9jhtn7iu9I8HysTnFJ5p0ZxjDY5IcYPql0qAIraauSpKTuP
	 vQBzoNGDfaATpHSmvbAeoaD6P2wOUxmbN7GQx2In/Av4u2/cDbjvspq5iNlAJNY+PGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="TfobjG/W";
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738D4606A997;
	Wed, 11 Nov 2026 06:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738D4606A997
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=TfobjG/W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=TfobjG/WjdcQs8nAYKY6Sv9WKk01lGvK2Ng/ywdBGZroo5T/h10sWd4yiZHEjihTcrZwnD7wnrvDq
	 8tYj7V+65fnbfua1WDOhNOeBYm2VlA0UmtBqFeBR/nK8ooaaWaOK++i+cHyK0x59VJK6Y2ulsoSg07
	 TJyDlG64WqHa1wqs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af4106a7c9-d60f0;
	Wed, 11 Nov 2026 14:51:24 +0800 (CST)
X-RM-TRANSID:2ee76af4106a7c9-d60f0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af4106bc22-d1c86;
	Wed, 11 Nov 2026 14:51:24 +0800 (CST)
X-RM-TRANSID:2ee86af4106bc22-d1c86
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jdelvare@suse.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83795) Clamp fan control times before rounding
Date: Wed, 11 Nov 2026 14:51:22 +0800
Message-ID: <20261111065123.17512-1-zhujun2@cmss.chinamobile.com>
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

time_to_reg() adds 50 before clamping the result. An unsigned long close
to ULONG_MAX wraps, so an excessive stop time can select zero rather
than the maximum. The same conversion is used for fan speed transition
times.

Clamp to the maximum representable duration before adding the rounding
adjustment.

Fixes: 792d376b4f3f ("hwmon: New driver for the W83795G/ADG monitoring chips")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/w83795.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
index 96fbb0a5006f..9b0ef0c8c5b7 100644
--- a/drivers/hwmon/w83795.c
+++ b/drivers/hwmon/w83795.c
@@ -260,7 +260,7 @@ static inline unsigned long time_from_reg(u8 reg)
 
 static inline u8 time_to_reg(unsigned long val)
 {
-	return clamp_val((val + 50) / 100, 0, 0xff);
+	return (min(val, 25500UL) + 50) / 100;
 }
 
 static inline long temp_from_reg(s8 reg)
-- 
2.51.0


