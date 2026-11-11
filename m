Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379841;
	b=4loCDooBOW0U8WYj+OuX+tFqA9PlKpV01IdtfED9dI+FMeD5mBvgsS6AKkEM6spldf1y
	 lE7XjSHZhgJOf9piwzwYuDaN0boR3J7MHeYI+7vZIbfeOJZagy7qzIdjwmvVyIdR6BEXV
	 h/1U0/kqifQt99LJlrTg+KJeGBtYB3c9CPVSCA3KU3RApUUyF1+qEAud9s8xfpnO1XFQb
	 AD4iVwobr/2cFJoiZ2ugKs4uy+1Fgl3CBuYlnIB1BzHqfwY7JcTe5XYPoggzUCJ3LGm0t
	 Jnu41q38WvlEt5CbPoKdpDvqsCoaOJWH8/dJ/Qf/v2K37fHWdI5p/1NRZmBgB+Du6vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379841;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hnlG4i0jRfr6FtmkmVyNsdb+r7DVPqanS2R4csL1Vg8=;
	b=KUicrHJylJRy/dy0YSs7lzkeS1uMVkXvmSA3H4W3BrJOH+NaWiXIDwgmLkf6bcn4ohQi
	 3ufcL2hlqmzCAU0cbzjEIzXrSiZnCPgqLmYCF/21U71rh3HWvAfpr5JwL/bafa5UMUBks
	 cK0nVk6oUgjkus/b7DAbrqEQMk6IJTKHtS2R8ieXKmlUQBCfsbK6ccJK7ZBrm8f3A/WQ4
	 rMS/I2wuN5Ub/O6IUBJb6Nvag2iXfPnPFGd9jWqiuAiPs2I8J+xseS39IyHBwWnXOWZzq
	 d0XRao6gKj6hcFi5rKt2wBS5VE05+ZWYueFNG2QDxC68fi9S7l2nkIfPOw1aUsbCiRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rTbMt+eM;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13439606A31C;
	Wed, 11 Nov 2026 06:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13439606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rTbMt+eM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rTbMt+eM4cqxphsiDi/cu2uyyEXk2h34B5eEmvRR016FIg+OxjJJOBz1P5inzcx3qLFNDT04/5fxm
	 tDHwT90PhVh41fb6NbF0HIhD2mNfT6zX7/iYLFo+wKj6qpfEilgGxwKzAH7seqXFVD0oYt6AxlufE/
	 iQ/tF6FmfUnGH020=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af40fdcccc-a1516;
	Wed, 11 Nov 2026 14:49:01 +0800 (CST)
X-RM-TRANSID:2ee36af40fdcccc-a1516
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af40fdb861-d1a52;
	Wed, 11 Nov 2026 14:49:01 +0800 (CST)
X-RM-TRANSID:2eea6af40fdb861-d1a52
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83627hf) Clamp VRM9 voltage limits before subtracting
Date: Wed, 11 Nov 2026 14:48:59 +0800
Message-ID: <20261111064900.17338-1-zhujun2@cmss.chinamobile.com>
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

The VRM9 limit conversion subtracts the 700 mV offset from an unsigned
value before clamping. Writing zero to in0_min or in0_max therefore
selects register 255 instead of zero. Multiplication can also wrap for
large inputs.

Bound the input before applying the VRM9 conversion. The chosen bounds
cover the full register range and keep the arithmetic within range.

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/w83627hf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index a26f4cdfb8e2..3ebb41db5033 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -853,7 +853,7 @@ static ssize_t in0_min_store(struct device *dev,
 
 		/* use VRM9 calculation */
 		data->in_min[0] =
-			clamp_val(((val * 100) - 70000 + 244) / 488, 0, 255);
+			clamp_val((clamp_val(val, 700, 2000) * 100 - 70000 + 244) / 488, 0, 255);
 	else
 		/* use VRM8 (standard) calculation */
 		data->in_min[0] = IN_TO_REG(val);
@@ -892,7 +892,7 @@ static ssize_t in0_max_store(struct device *dev,
 		
 		/* use VRM9 calculation */
 		data->in_max[0] =
-			clamp_val(((val * 100) - 70000 + 244) / 488, 0, 255);
+			clamp_val((clamp_val(val, 700, 2000) * 100 - 70000 + 244) / 488, 0, 255);
 	else
 		/* use VRM8 (standard) calculation */
 		data->in_max[0] = IN_TO_REG(val);
-- 
2.51.0


