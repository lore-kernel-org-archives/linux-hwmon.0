Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861CE27456
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198181; cv=none; b=ewLd4Wo/39yvqSZxsSAUmSH96o4Y0wO5h51mqYxV4BEfAD38yL/Zld0JxciLvZX11MRI+7iFlx2Ty+9LRD+FWZsJHoJPR4nCD4XsIn4XOA4cLewv2SxAPfuTkTRrPG0ez8mAxbRSKb4mcC4Dy+lGeqACb9yApVNcjk7IwGmMVNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198181; c=relaxed/simple;
	bh=H7hTsnq9+s03+SPBFHSJw0CB5FBlzIK0QNtNG6ua8UI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwg91p91F/rBV76MrSGjQo0UvPxfGbBUinc0lpInwTotL56NVAkAOEawe4t4zwD0v6LA+An8ITQEKQTX7nX0X2t8rwY/0kiEoXapRZ2PbMGYWu42CUuCpnnWvDKVMjNJiyBDqRIeNRUanniSXdJFCyFJCI9eMGzEasu6rhP2s2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=df23UZqJ; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="df23UZqJ"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81ed073fed0so42181057b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198179; x=1785802979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvyoFte8Y8rjtYJvXt/G3cfpMVwp2UmRUQHaxoL3Pg4=;
        b=df23UZqJjnkVo81k28N0CEGCFJA+sRi/b/dJJEmwucDwnxds8oTgokm4ydL0JOw2ev
         OTLjn74R3cuy7peSjAQNNd9FcDqmRIUmpr6c21kzdZ6GudyMsWIPKrsAB0kTybIp52Wf
         2EZ8YuJ4hEFRdrrGdDI9I9Wd87Hob1fvnfBnvetM604XNutbUMI/AmBk/n2BKu/+MGDA
         gD93hZN6bzn3mr6BROsI8z8/HrHe94rhYNoPvLA/OkRWyxiXVLpk+4bNZXhBTyqprIOV
         /EkTiXSTBG/eK4EL+NJ6qQeSDppyEUYVen0t8UDOd4xIc4IimQ39+R3YM2LUbYT+VPtb
         xFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198179; x=1785802979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvyoFte8Y8rjtYJvXt/G3cfpMVwp2UmRUQHaxoL3Pg4=;
        b=V5lZ2pe9wpu5JSjzYvkQIKnfeAwtXZO/L/1MAmG2mJA+n80iPSH2B8ViBSWgD8DkAf
         ddl4lZfunsxzGk6Ux/znPFfHKo2mpB6Pa3vywqG6ZzqTfML+l/4d7/6+Lvw9b4qZIIhI
         lataGjM5MrbQzXFKQ3zIME0aNeYcpg2AMkCuRNQb9MAn0N9rzPQ2MsIOWNVzUhNfkOum
         Xy8tS2nuPOGdhgCHEVW89UdgmmisGnFDUulplrQeMpfWTAy7hlFs/Lrd5mK+c2fGCFHZ
         JaxEv3Ne1ONqxxf+d2KF+1qkSljjSGvwfvj1pYvCpuErSOMWoyMQCPt4AY4FGoTpw0Py
         ZkTw==
X-Gm-Message-State: AOJu0YzsLXDGUI0Qr20j7DPYL2s6pnEQcw6mBkl5y1PCZGXa5Nfw5c5T
	olOHpH52FyttBr+OV8rNiPhQYwGPpdefDkBsB+/95i9q0Guj/rTtody9COUV6N3V
X-Gm-Gg: AR+sD101zZoQA09PJ+tAMvuYP9Cw2jBI/HZMKWIB5ZX8OiWhahXlamqmhKT53RMRjAp
	fJVhrIiSTp1XaZaQcN3KvCJ0F/TEblFk3PzrUuevSQMulY6yL89tCf1HbEFn/VLJMs7uozXC1PP
	OSZRoYIqfPk5y25MRjcbkBZlJ6cfPnnBW26x1pRSqSHNKsrP1UPVh/Womna/ZyfkLEEO+RiuxDv
	GuzzxhJH1iHPDcosTjGdo4kT3vYNA+ZtcKkLbAAaqm5SVyQyxQZrHPl1QmL3gG4jC9ONE82aldH
	NdNkOEyFimKEiO+6GpFqi4BbZ8Qq50h5XcHBMM0sOXLYF67L0Th19J8CT+Dqh3p5QcsDSsosOvL
	74w+N6LG38L29wkzyySHvnDnJzYncuw4db3pbWLthsxKcJqWqyKxmh1v3wE6wTR9sHs2KvFUF61
	RmOv6/29XbRYs1NKEvzvetFMGbGKQfWiD2Z1ed8po46gIUz665uqsQSc7W5zTmo5Y8PL00IrsUI
	htW
X-Received: by 2002:a05:690c:67c6:b0:81e:b7dc:3dce with SMTP id 00721157ae682-81f992e2bdamr295937b3.63.1785198179527;
        Mon, 27 Jul 2026 17:22:59 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f655acc7csm39583707b3.0.2026.07.27.17.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:22:56 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 21:22:21 -0300
Subject: [hwmon PATCH v2 5/8] hwmon: (adt7470) Fix temperature alarm logic
 in hwmon_temp_read()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_fixes-v2-5-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
In-Reply-To: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

During the conversion the alarm callback started interpreting the
channel index as an alarm bitmask, resulting in incorrect alarm
reporting. Compute the proper alarm bit instead.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260717211224.B9E291F000E9@smtp.kernel.org
Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index a34635526aaa..c6fc7d38d698 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -110,6 +110,21 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 
 #define ALARM2(x)		((x) << 8)
 
+/* TEMP1..TEMP7 (ch 0..6) are, respectively BIT(0)..BIT(6) of reg 0x41 and
+ * 0x72, or BIT(0)..BIT(6) of data->alarm.
+ * TEMP8..TEMP9 (ch 7..9) are, respectively BIT(0)..BIT(2) of reg 0x42 and
+ * 0x73, or BIT(8)..BIT(10) of data->alarm.
+ */
+#define TEMP_ALARM_BIT(ch)	({		\
+	typeof(ch) _ch = (ch);			\
+	(1 << (_ch < 7 ? _ch : _ch + 1));	\
+})
+
+/* FAN1..FAN4 (ch 0..3) are respectively BIT(4)..BIT(7) in
+ * reg 0x42 and 0x73 or BIT(12)..BIT(15) in data->alarm.
+ */
+#define FAN_ALARM_BIT(ch)	(1 << (12 + (ch)))
+
 #define ADT7470_VENDOR		0x41
 #define ADT7470_DEVICE		0x70
 /* datasheet only mentions a revision 2 */
@@ -569,7 +584,7 @@ static int adt7470_temp_read(struct device *dev, u32 attr, int channel, long *va
 		*val = 1000 * data->temp_max[channel];
 		break;
 	case hwmon_temp_alarm:
-		*val = !!(data->alarm & channel);
+		*val = !!(data->alarm & TEMP_ALARM_BIT(channel));
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -668,7 +683,7 @@ static int adt7470_fan_read(struct device *dev, u32 attr, int channel, long *val
 			*val = 0;
 		break;
 	case hwmon_fan_alarm:
-		*val = !!(data->alarm & (1 << (12 + channel)));
+		*val = !!(data->alarm & FAN_ALARM_BIT(channel));
 		break;
 	default:
 		return -EOPNOTSUPP;

-- 
2.55.0

