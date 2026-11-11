Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379733;
	b=htknoCrgI3tko7P4CrX55r2BWmj0dhkw41AUYbho4g4MOSe/2r6REPLjH+siEY2XC2/W
	 iEjx5BrVj0nlrf4dFKIphPAHVrstCjL//UuaZ+e3mTDAF+9pN0UzAGyOwWhZ+4N591OO4
	 mWC88hbBpNds8jTfijjKM34VpyqhUm7sLYZPgNjzz68z159EEseHIhlR34ilvl5X1Ark7
	 HGWJfrkfptR93ujBJ31u2wyk/tC+NAYjqKI7Stf92g7U7rVIfOsskXyGi9ZCpiBB6Cfy3
	 yDKPNo7HOkwdnttmFH5UxaUIGI70BUJzwVSd7DKBk/iDKcnq2AAzK9DdAlXo/N5B5tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379733;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R+Nh7+AUuzs//XDtIcn5bmTRYqTNO5OkqgpsOBnBqU8=;
	b=CfONmQ7V6MK5aj17OgK/X7kJS70sYNCStht/08byj08dB4IPjRphg3w9cuBNwYEK0y1Y
	 9v+LMdCU77dh3v5o2urUYsW5YxQYtUHkJv4MmL6VNsrMz8JSp4hpe+h9ARZYx6eg77goS
	 LpATkrIo/C75LdCCHxzYRtu1gFuJ79UcAjjeO02ByB1OQ10lwBolNfQUbSFnZjQhX/+DO
	 nD5I9cXX7JQ3tF3UulnzDAhiEAgX4JBclDX0PdJpkDGNYiyhVAZGFd0IJd2cy1jkydnbp
	 CcvDuTdLueC5JVNaC7POGhEdIn4Hu77R/n7ShzD9ulJYb9vzxKuaYQOCZOk9YuV6Z/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cZYWbgFd;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920C1606A327;
	Wed, 11 Nov 2026 06:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920C1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cZYWbgFd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=cZYWbgFdBFlu10wkeGslP3OBVASHvfsF8HeiZqBJAF9BJodwUcHKnbumNac2/lEq0GrtpGxq8+2UC
	 rCMBPe/sV2ghQcW/YbNrMh3g8LgWfElnF49n6Jyk+ErkLqjW9mXLLFq8LlStk2YwhaxQVsMAXQ9gDq
	 7taBIA5edTeng5jM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af40fce706-d602d;
	Wed, 11 Nov 2026 14:48:48 +0800 (CST)
X-RM-TRANSID:2ee76af40fce706-d602d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af40fcf849-d1a3a;
	Wed, 11 Nov 2026 14:48:48 +0800 (CST)
X-RM-TRANSID:2eea6af40fcf849-d1a3a
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jdelvare@suse.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (it87) Clamp voltage limits before multiplication
Date: Wed, 11 Nov 2026 14:48:47 +0800
Message-ID: <20261111064847.17317-1-zhujun2@cmss.chinamobile.com>
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

set_in() accepts an unsigned long, but in_to_reg() converts it to long
and multiplies it by 10 before clamping. Large positive limits can
become negative and select register zero instead of the maximum.

Keep the unsigned input type and clamp the voltage before scaling it by
the ADC resolution.

Fixes: ead8080351c9 ("hwmon: (it87) Add support for IT8732F")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/it87.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index bbb3f9788c2e..632d98ade940 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -738,8 +738,9 @@ static int adc_lsb(const struct it87_data *data, int nr)
 	return lsb;
 }
 
-static u8 in_to_reg(const struct it87_data *data, int nr, long val)
+static u8 in_to_reg(const struct it87_data *data, int nr, unsigned long val)
 {
+	val = min(val, 255UL * adc_lsb(data, nr) / 10);
 	val = DIV_ROUND_CLOSEST(val * 10, adc_lsb(data, nr));
 	return clamp_val(val, 0, 255);
 }
-- 
2.51.0


