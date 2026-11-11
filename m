Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379898;
	b=aKxjGy9JsneJEabNViOntaeG72h/7IZfSHRHx/he3PPVO4FMn77cty5woSrbKM+nNM7f
	 AFVbmONIXQl/q0zG4Nj0Ty0UxpX+hHoFQfriuaiWk1kH3dwE+N8q0rs5rfrS8mK+7LeZe
	 ZjbxGNultoNleROKPB0520Nffc8q/xI8AW5FAA4AF45iWCEFOcHs/vUSgeje4p+tQd/f3
	 fKpCm5aphAUbWey9n7rYhAyN1TGBL3r5SCdc2ejOyGtk9a4HzRSDXQX96crhJSJxcxItq
	 CvtnpSoyYiBoE4pQJZfsPu/UR0RbQJoSVGKvbWEipneSh7vsPJX0XQKOWDu9NcIQZpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379898;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=koy/T6v7QbDspzOYd4+fqYG8HU28puw/FquCAa7g/3w=;
	b=09RPwR83okAkVdI6VkUNyk/hJHP6VCnoNBSIkDrEBqL7tPiRD0/rFG6TXL/2o5c9Rjq6
	 ILmI6bWouH/25JR3IsTH406JCe3IWzu5B8rrCYkGVeKI5MnC2nknJ6IlA1WGG8FCULlwM
	 /m4TuSTI9OrgOLaUFvQsf8wRarjGPOVzioFq7PSbVAQHYehReAk0U8oyMZLiBvS5hIijU
	 ZX5E9gjIPWl5W/78bHwLIq9ckhhxIL8wb779soYYAGwdSSUIP36yZ2OkukENBXovY4KJ8
	 nECf+rBtiBEAWGFPdCzgGgqSmOiB/8TG02oeiDYEYsOcaNsbAdiXW1igh9cEaSNaw8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YkiXIWsI;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C7F606A31C;
	Wed, 11 Nov 2026 06:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C7F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YkiXIWsI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=YkiXIWsIL0IB6PjKnKD7KQA+PaWcy8u+bd815RvByZQebqe2gaHy1ix19y8KZbAgBGn4SUYwxlvFF
	 x2ldbPBeAfLCrBVdbL4fu7EhKgCuyVbEzX2KugljVVC9Im2yly7OuckMJCmEpXf2H/p1hCTlDaKKXl
	 +veY8V14I5ekW00I=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af41074191-75304;
	Wed, 11 Nov 2026 14:51:36 +0800 (CST)
X-RM-TRANSID:2ee86af41074191-75304
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af41077069-d2054;
	Wed, 11 Nov 2026 14:51:36 +0800 (CST)
X-RM-TRANSID:2ee66af41077069-d2054
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: vt8231@hiddenengine.co.uk
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (vt8231) Clamp voltage limits before scaling
Date: Wed, 11 Nov 2026 14:51:34 +0800
Message-ID: <20261111065134.17560-1-zhujun2@cmss.chinamobile.com>
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

The voltage limit stores multiply an unrestricted unsigned long before
clamping the register value. Large inputs can wrap and select a low
threshold. On 32-bit systems, writing 4483265 mV to a regular voltage
limit selects register 3 instead of 255.

Bound the input before multiplication, using the separate scaling for
input 5. This preserves the conversion throughout the representable
range.

Fixes: 1de9e371b89e ("[PATCH] hwmon: New vt8231 driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/vt8231.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index 1fe361bc30e2..a022119ee305 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -293,6 +293,7 @@ static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
 		return err;
 
 	mutex_lock(&data->update_lock);
+	val = min(val, 255UL * 10000 / 958);
 	data->in_min[nr] = clamp_val(((val * 958) / 10000) + 3, 0, 255);
 	vt8231_write_value(data, regvoltmin[nr], data->in_min[nr]);
 	mutex_unlock(&data->update_lock);
@@ -313,6 +314,7 @@ static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
 		return err;
 
 	mutex_lock(&data->update_lock);
+	val = min(val, 255UL * 10000 / 958);
 	data->in_max[nr] = clamp_val(((val * 958) / 10000) + 3, 0, 255);
 	vt8231_write_value(data, regvoltmax[nr], data->in_max[nr]);
 	mutex_unlock(&data->update_lock);
@@ -360,6 +362,7 @@ static ssize_t in5_min_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
+	val = min(val, 255UL * 10000 * 54 / (958 * 34));
 	data->in_min[5] = clamp_val(((val * 958 * 34) / (10000 * 54)) + 3,
 				    0, 255);
 	vt8231_write_value(data, regvoltmin[5], data->in_min[5]);
@@ -380,6 +383,7 @@ static ssize_t in5_max_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
+	val = min(val, 255UL * 10000 * 54 / (958 * 34));
 	data->in_max[5] = clamp_val(((val * 958 * 34) / (10000 * 54)) + 3,
 				    0, 255);
 	vt8231_write_value(data, regvoltmax[5], data->in_max[5]);
-- 
2.51.0


