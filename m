Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380009;
	b=yjv3M+8IntrNyP7VyN8bEwcu7VG+c6rwgcjtnl8GRUAYGZZug0vXsciVwKWowRinSOae
	 Q7Cqix5eRaoYG52RoelVYRPbN69JEpDrK2uIK/8VXPlktVq5S3xGeQpd3QXZJ2tlEWNiE
	 2BIMcjTYVf5x2n2Njt6hBcd0fwWbdjSzyyN6L/CdM39B1fkLVPf2HKO+J7ja1ls2VDAKD
	 bvqryyAMkJfLttKuyoWLwetSYXmtoUSTbcqx+vakyjJZUB0PT9sXqg0Twt5rZgbNWzX6u
	 GNvGrpxOMsHwkIo6szgqssnByhUQvDtiHuOI8Jvf0gIPR2f+QGvYPe7Kose6zuqEmfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380009;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AyjfQU+yoUSKk8eYrWKnMnUhkNrbpB3JaFAxG5B+hGE=;
	b=ijwqCzDsfsESDzouKft8PJ7ZjibjfLo6hvpRknRQpLvWJzP0QmzpZcz11wMKRj/hTPdW
	 XrmOotUeTieusW/EJBiGMa3/6gnfhufrr+IN72cnOhDvJX3VfEUjYqhN5CNyIywvGTBy2
	 6huVQyMxsJg0IuarPDsyL1OynbtLWsyfXcApZXKrYmQApHBadnI3xNP3cz4jc2mye162Y
	 qjCLsSAGMhUtHPkq+XAsl4HvAQZcG0xwb+WmcEgyQgzOj6/DSus/1WM9JJtZ47Q7Vh79k
	 0HDvOEbHPg3nm6kHzEZWZp+VI2iT8ezh8kZ5C9d+aJhKMP1IQJm3MJ+mdvOdrIcuvIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Jw0Fq4+B;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E4E60A2601;
	Wed, 11 Nov 2026 06:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E4E60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Jw0Fq4+B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Jw0Fq4+BOa4+R/8QvpVB7iclZ+o54X7eSsOCt5uzyKyzRVKFNEQKh/GrpbjIUzkHtFYMBVvwVWqqy
	 YPysugonGYOh+5mncCnDHeeO8GoK1bAzd2BPQ+FFEx6o5iD2GAgLx+Brd5z3+gvkg6Flb+Z0spBS+s
	 FW2qJ4B8p0tTluhQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af410e581f-d6146;
	Wed, 11 Nov 2026 14:53:26 +0800 (CST)
X-RM-TRANSID:2ee76af410e581f-d6146
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af410e4c8c-d20c7;
	Wed, 11 Nov 2026 14:53:26 +0800 (CST)
X-RM-TRANSID:2ee56af410e4c8c-d20c7
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (lm85) Bound fan stop temperatures before subtraction
Date: Wed, 11 Nov 2026 14:53:24 +0800
Message-ID: <20261111065324.17776-1-zhujun2@cmss.chinamobile.com>
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

temp_auto_temp_off_store() subtracts an unrestricted long from the zone
limit before clamping the resulting hysteresis. Extreme inputs can
overflow this subtraction and select the wrong end of the hysteresis
range.

Bound the requested stop temperature before calculating the difference.
A signed 8-bit zone limit and a maximum hysteresis of 15 degrees require
only the -143..127 degree range.

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/lm85.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 80bd1f47114d..e776ec4ae40f 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -1153,6 +1153,7 @@ static ssize_t temp_auto_temp_off_store(struct device *dev,
 
 	mutex_lock(&data->update_lock);
 	min = TEMP_FROM_REG(data->zone[nr].limit);
+	val = clamp_val(val, -128000 - 15000, 127000);
 	data->zone[nr].hyst = HYST_TO_REG(min - val);
 	if (nr == 0 || nr == 1) {
 		lm85_write_value(client, LM85_REG_AFAN_HYST1,
-- 
2.51.0


