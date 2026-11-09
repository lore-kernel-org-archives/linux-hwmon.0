Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217063;
	b=GZytF3+oWTIFni+1xwqlMSpXHSWuILkJgzJZqyPAJ6IxYKkJpJphoP+pED6fIUzng0/f
	 pR7TyYOaQFKi/WIlo91GZSbZY5zJ9AN/Ut7+hKOK1WNyvkoQVbM34Zu1bvt6ewMl5EX5p
	 /ZibVq8TJgHvT8zuaDINi7sfKHNeLDNCQK/uyu0+BtsFiAi2aP8QWTrjA6NyoO/ZMp3X3
	 NaSvzbf+KyK21byYSjEpC5pJIdVzx/HNmQVydnXJskHFsrfQZGSZORLmSHc129zH84kwy
	 QzPivazsxvf7kvoguuVbt0ty1UbpRGr6Yb+03YbuME5giycT0JsB8mCm6Ba7OrRWELA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217063;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pdQo22DKD+JvOWRMuDf69of/AG4sxAXBKnBk66wCO84=;
	b=WwzWgnYE57IEH+fZsI5ej0WHSt5WXV1i+gtr+SmVAF3Scehq9hfo1yc+f/jmADZHE1JT
	 ru7GFwfax5aHfVoAutq3i5A3u91yoFgOz71DjiVO0vJVX+RKCjS8gucry3kHerul1igub
	 dfeXpmzbdhtg4vZEiLWfepWMf2ZbIw0D8ntuG4SeRoKDpF13Km/J41wooF9Tl+n/hDvyJ
	 lhwOMlXlq5Iu4wlAvL5vGp11KeemWmK9krwxdqWQ6DvtbavTp+x8SNMWTzDdak9VrbYG3
	 ySRkDy6iDEYkGSvaF2a/cE7oFLDuWWjvJKZKkITSM/3e5hjqvl5awk7NLmPlLnJNCfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="aoH4/nx6";
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D926A606A323;
	Mon,  9 Nov 2026 09:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D926A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aoH4/nx6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=aoH4/nx6btEucbdG0adW7sGC6WLblqFJGGys7VkNQFezeRXSVRcvaCb5rnQVOi17HcQWIRxBfnxdI
	 iMo+A0XmsWdOsOITmp69vZrdcPW46tpJTYuxYOGIzT3qlNOfGlcvnYEiD4khRNdrgR2ODjoL0j3fos
	 sPwvpQulMWIh94y4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af19464acd-c9d74;
	Mon, 09 Nov 2026 17:37:40 +0800 (CST)
X-RM-TRANSID:2ee96af19464acd-c9d74
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af19463c09-8a6ef;
	Mon, 09 Nov 2026 17:37:40 +0800 (CST)
X-RM-TRANSID:2eea6af19463c09-8a6ef
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: vt8231@hiddenengine.co.uk
Cc: zhujun <zhujun2@cmss.chinamobile.com>,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (vt8231) Clamp voltage limits before scaling
Date: Mon,  9 Nov 2026 17:37:38 +0800
Message-ID: <20261109093739.5539-1-zhujun2@cmss.chinamobile.com>
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

From: zhujun <zhujun2@cmss.chinamobile.com>

The voltage limit stores multiply an unrestricted unsigned long before
clamping the register value. Large inputs can wrap and select a low
threshold. On 32-bit systems, writing 4483265 mV to a regular voltage
limit selects register 3 instead of 255.

Bound the input before multiplication, using the separate scaling for
input 5. This preserves the conversion throughout the representable
range.

Fixes: 1de9e371b89e ("[PATCH] hwmon: New vt8231 driver")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on 32-bit and 64-bit;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor hardware or booted-kernel test was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
The human submitter must review and add their Signed-off-by.

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

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



