Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530042;
	b=ua5DukwZNPBW64+h+T7rW4SQfqbMIeWJSz6qEkYiActo+Kgl9Pz4c8+6T19mPzHZ2N/n
	 RuLdfWk6ekKZEtKfNbjxEXhweTHA0b1wV/jv1j6UkVG2muyqAmdicfTmocTAv14kkeJf/
	 i6Utw9mH4tU/95equnt8kzAoQYfKR4hpyJLmrYQKnas6m4AK9NHksmCmVvoBeYDRj/uoK
	 srJhPQ2RimTPdeoATnzCCS+wTpLvAz2xAzvy2oCeui9gRSOVMpWwtyRjAIXxn2U8/RAJd
	 gTs/7Tj0SfaBOp/XETfsS7iW7cKok6sv85HMk12estcLHcf5TUXHTrUqzws7+n27GyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AexwcsRGwzjjNvCz+2Yi3C/cbZ1yMKJ7WYhXkPSgkVk=;
	b=Vb+zNNQvQqsMe1EOX77G/D6+VQ5jZUpTeKuV8/96wSA+RmAnmVFn6KHqY3itknf7CG7N
	 YAvJyTFzmW+dWJjyj3yQTAtevUSPtsYqzCMvr1jJBuRSokau5h6sjjeZRTT9FnuVFQnZv
	 WRDUjWYHiIu1KwT1K0CRPysPT8uPM4JtHcUBc4s1CLKCqp4Wij0+2y4aQoy92V1rO5V0J
	 i6AlbZb+/a6OlrCMV1AF5i/ZxIJmt4bHUl9RYMESQloU/p5+t1kqEc1QXZ81fXtbSluoA
	 Kxt+osysJBtSLywanqYIDQcurBr4YL7bSe7eoKendf+CDYCsNgoE6NhcaYFb268nBlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aglBb8YV;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A481A606A329
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A481A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aglBb8YV
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so23544725e9.2
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 02:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530040; x=1794134840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AexwcsRGwzjjNvCz+2Yi3C/cbZ1yMKJ7WYhXkPSgkVk=;
        b=aglBb8YVKgoNb71KyRKWkL0xRX0pkCyiGqavmUrOaAz23M6tr/2ZqV7/XfnNVWKHXI
         fpAEpZxzQG+TipsAFosqLjfC6JQRFSPx+hjkvrswXLIbCfOt/0OmIvq61nIJnIq4rOMo
         VVk3Im/v373RcWAsGvJe9H8NhqeIXCciTAtsUmx1g+kva7Q4Ra+MlTkso5vNLMqB3cKZ
         OhWzBQRrn/4FtdtC33FPamn3cWPOh18xPzSm1kWI+dg8b5V1jbDHDSTdpMEUE/qlRWVH
         YmUwEHk4d/aD37MPJKqtWRDc1MtjxbeZ4DeGAcNjsM4+P28knX4+8Xwc12228gLOyoWs
         MMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530040; x=1794134840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AexwcsRGwzjjNvCz+2Yi3C/cbZ1yMKJ7WYhXkPSgkVk=;
        b=ZpXtTrH/gQef3sflxPAQncp3AYExWVhF1lOxLe+/XAKhQ65bf+irw85fYh/PfCXlIO
         qYcI//t2Ho+yy9bfc6uf2f7FPtGrFvEMHg5Nj5YIna2a41G9UnzMYCZxVgcVuzfYVgLj
         MDXPlXEK1yn1zn6lg1tPO4X2NDuvSykfRc8vNMOwq4tj2MneffLtPNBAqrUE3o+55//C
         wQOQQ+EL7DclokPYvpn9GTpInXyRhNS8D9TQZjKLlUmy5azHPUyCqY9U8KVfyRun2T5i
         rk7MO/ccVXGOVPEX/ZHoLmS5IiwWqARG6K447cmAQH1ul8nZxuWZtZJBUCqDjBl6aJKJ
         MLTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcUMm1NhMVxaHuE9gjAzLN5UVZLHkWVwvijxMCoK0dT6JJ0F3/D5KMMSkIrxRYlr1b95f96DgTBKFf0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVkgrH6z1zOZUpMLvk8ytf4xyoDGv5TOJPX3QZLXqo7XOFst+b
	5LPoNvG1LD1dnZoy4QKqNzzfNQPnIhYzgynxftiDnrW7gS9MlsuTTx/w
X-Gm-Gg: AYBFou2aykrwXWdHtfz3MbjpeHUgWq9Nh4nKs1XciqlaOlyUitA4n0yzOsl7zvPxx56
	1CmyWLpg1qhN7EzKdgDB1b+h7faRcvj6CP+vGhp9EgW/vmm3oCjeLi/oz2AGr0t497UrAFXOn5Q
	EfmPSxY19IiALrMrR0qGfvCt0ssfEs7QSL/eFAl3JKTcMTybap7LlWCckCX1xpsGpnm7kMXdXf/
	eL1Wp+yuklq36IpdOeQ1k4Y63a6bLeyVXqDh74hftyL4ySWxeDzyeHQubvklM1OE1QjqWofKfE8
	BnLQrKdsifZJ0FfQa3Hvt4nUh5Fo/FDOB28ffmKmg4tcRZ1ngFGNWJLRQLbr73QKqAmASFjUPy2
	WbV9s+9PewgYNtEmXG64KT3BQssXqxdq93nOw74qg/Pn7DtcsCa6nxdygC5yXfYQPJ5Msnjknlz
	AdPqcqsC9QWkpWhgjpm6lKG8nJPXSNvKsPkNWJ/57ylmjWMrFMZiffBFI0cEZrosf6sSmGFMQls
	e/Dzd33MrKYpOd1Fl5CyWSIftmFGUCcsvoxyT9rg+n/u0lolLvE8OVnA5FR5Y2IHX0ajzEq501o
	TFnfAgIJbwP9biY+L0GsND3sW4E=
X-Received: by 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ac1793f8ddmr170505775e9.14.1793530039980;
        Sun, 01 Nov 2026 02:47:19 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:19 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:47 +0300
Subject: [PATCH 7/7] platform/x86: asus-wmi: show the effective duty for
 enabled curves
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-asus-fan-floors-v4-v1-7-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

When a custom fan curve is enabled, the embedded controller executes
each point at max(written_duty, floor_duty).  However,
pwmY_auto_pointZ_pwm reports only the stored value, diverging from
the duty applied by hardware.

Return max(stored, floor) from pwmY_auto_pointZ_pwm when the curve is
enabled and floor data is valid.  When disabled, continue returning
the stored value.

Because the controller operates in integer percentages while sysfs
uses PWM units (0-255), the reported value is an upper bound of the
applied duty.  Consequently, reading an enabled curve is not
read/modify/write safe: writing back a read value commits the
firmware floor into the stored curve.

Trigger sysfs notifications on pwmY_auto_pointZ_pwm on enable and
disable transitions, as well as floor refreshes, so pollers detect
changes in effective duty.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 Documentation/ABI/testing/sysfs-platform-asus-wmi | 14 +++++++++++
 drivers/platform/x86/asus-wmi.c                   | 30 +++++++++++++++++++----
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index 24931cc97ca86..36b633a5dfc49 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -281,6 +281,20 @@ Description:
 		(0-255); the driver scales the duty to the percentage the
 		firmware expects when the curve is enabled.
 
+		While the curve is enabled, _pwm reports the effective duty,
+		which is the higher of the stored duty and the firmware floor
+		of the point (pwmY_auto_pointZ_floor_pwm).  A disabled curve
+		reports the stored duty.  The controller works in whole
+		percent, so the reported value is an upper bound: the applied
+		duty can be up to 2.5 pwm units lower.
+
+		Reading while the curve is enabled is therefore not
+		read-modify-write safe: a curve editor that reads the points
+		and writes them back stores the effective duty as the new
+		curve, and the duty the user originally wrote is lost.  Read
+		the curve while it is disabled, or write back the values that
+		were written rather than the ones that were read.
+
 		The embedded controller binds point Z (Z = 1..8) to the
 		temperature decade [30 + 10 * (Z - 1), 39 + 10 * (Z - 1)]
 		degrees Celsius and silently clamps the threshold into that
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 74476904cb99c..bae5a528ac5d8 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -324,7 +324,7 @@ struct asus_wmi {
 	bool gpu_fan_curve_available;
 	bool mid_fan_curve_available;
 	struct fan_curve_data custom_fan_curves[3];
-	/* protects custom_fan_curves[].floors */
+	/* protects custom_fan_curves[].floors and .floors_valid */
 	struct mutex fan_curve_lock;
 	struct device *fan_curve_hwmon;
 
@@ -3754,7 +3754,7 @@ static int fan_curve_load_floors(struct asus_wmi *asus, u32 fan_dev)
 	return 0;
 }
 
-static void fan_curve_notify_floors(struct asus_wmi *asus)
+static void fan_curve_notify(struct asus_wmi *asus)
 {
 	struct device *hwmon = asus->fan_curve_hwmon;
 	bool valid[ARRAY_SIZE(asus->custom_fan_curves)];
@@ -3778,6 +3778,10 @@ static void fan_curve_notify_floors(struct asus_wmi *asus)
 				 "pwm%d_auto_point%d_floor_pwm",
 				 fan + 1, point + 1);
 			sysfs_notify(&hwmon->kobj, NULL, name);
+			snprintf(name, sizeof(name),
+				 "pwm%d_auto_point%d_pwm",
+				 fan + 1, point + 1);
+			sysfs_notify(&hwmon->kobj, NULL, name);
 		}
 	}
 }
@@ -3797,7 +3801,7 @@ static void fan_curve_refresh_floors(struct asus_wmi *asus)
 	if (asus->mid_fan_curve_available)
 		fan_curve_load_floors(asus, ASUS_WMI_DEVID_MID_FAN_CURVE);
 
-	fan_curve_notify_floors(asus);
+	fan_curve_notify(asus);
 }
 
 /* Check if the capability exists, populate its defaults and read its floor table */
@@ -3855,15 +3859,28 @@ static ssize_t fan_curve_show(struct device *dev,
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 	struct fan_curve_data *data;
 	int value, pwm, index;
+	bool enabled;
 
 	data = fan_curve_attr_2_select(asus, attr);
 	pwm = dev_attr->nr & FAN_CURVE_PWM_MASK;
 	index = dev_attr->index;
 
-	if (pwm)
+	if (pwm) {
+		enabled = data->enabled;
 		value = data->percents[index];
-	else
+
+		/*
+		 * The EC runs the point at the higher of the curve and the
+		 * firmware floor, so report the duty it applies.  Only the
+		 * floor table is protected by fan_curve_lock; enabled and
+		 * percents are written without it, so this is a snapshot.
+		 */
+		guard(mutex)(&asus->fan_curve_lock);
+		if (enabled && data->floors_valid)
+			value = max(value, (int)data->floors[index]);
+	} else {
 		value = data->temps[index];
+	}
 
 	return sysfs_emit(buf, "%d\n", value);
 }
@@ -4059,6 +4076,9 @@ static ssize_t fan_curve_enable_store(struct device *dev,
 			fan_curve_refresh_floors(asus);
 		}
 	}
+
+	fan_curve_notify(asus);
+
 	return count;
 }
 

-- 
2.56.0

