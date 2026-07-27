Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3173BED31
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123311; cv=none; b=lxrcnPD5mQ8yanImdRz9vXiy3P0kqrMTXb0lklELN65KYVDdkZX4tFFgh+Na8RqUrB+ReeI8eVGw9KAE6yvCHH06Bd2qwWK/bPlfLYeYGzPbTf652geC1/OHKcf+kSEb7/PPS5f8BtT5vWbx3P+a91C4QLp4MMSx1/PS0WQ4zyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123311; c=relaxed/simple;
	bh=otyfV37K5jCT+kjDuv33Jof243V9rWG53jfTfDM1hko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HoLaOyrFSwK1/zBg7mYfFJx9bL62z6D7tOUGcHk6q+Vg1kaHSVXULhFfwkqFjsgWzdMOSPUgg1zKU7xIflmA29Bo9GO2ume1Bti/zlWQV/QQ7eTJVbECxUYl/jBCF1UV4R0MtV3/bG/kPG1bB2Ls66BqlfswRJsXe/Eo/Z5tT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyjMfH6G; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyjMfH6G"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-667923d86a7so2997516d50.0
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 20:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785123308; x=1785728108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fe5LqOn1qfiOnUxC1maEycp7XWWBtguH8PckX6DUpu0=;
        b=AyjMfH6GoIYcfKZDyZvBywigZxisGd3RTOE6pbV4VDb3a0m+vsbPJlWf9wjZEQBg2B
         7e2LjJu3XQgZTvi8slmrdCJmIdW1JTi+HVwoYuIPQbLKHJw0t/N8O94XGQ+/I4k7kwkJ
         BeGgazej7RrOTuOEyAfn08Y8Ff9Z3W5+UpYLR0jav1OTEkHgNuKoPIn09jZdr2LIeqx4
         PZeSlUZW4cUsFL90qBQQs+nEBlTXPir21pSpehIO1ptrfiAB/zLjo9sBeEc0ndz4ZMZY
         miJgcmy6tFirZDRO0ZVHUAmBMomA0Upvbf/e3K9mnZV+5f0uw+NmVWast4e17E+Tzzy4
         57qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123308; x=1785728108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fe5LqOn1qfiOnUxC1maEycp7XWWBtguH8PckX6DUpu0=;
        b=bmGQIFsauZowqmLyMrDDjGpvr+zOwJxzZMbCKJkB0oJcouTmgetg9YoneYODDRTvCS
         2P0PRKbQe3kGPaS4a3CanzPcBb5Sk4GawYwhzRut3x/9FhU+0APrbHdAnUwI/KHDzFb0
         9B21a29fMKcHI98URjeSOPQaKspGmqWMI6QTnQSFXpe+Xn1kFY5OUwCRX2oFVoQJdZeg
         9h+BsiXpb7WZ+yCgVkgbtZzZWl+n14W4LNf8pNKbBi/qDU4hRqlZ64mSmu9EBQlFKc8X
         05/a1K7uptaFKUXyFWWKR1XdM8p4iW6jqhXsOQPuOxt7wL/T80RdiZq7GgptCheq2WbE
         op+w==
X-Gm-Message-State: AOJu0YwSyxdFSkKd26kSIE/ZgIRdNJSEEe4gXX3UD4iPQNz+CoplZvHW
	Y7QWNDMoxskKpsPTgJ8WwHoUhvZwUk021VQXKpcnd1q0STPj8+OAM18x
X-Gm-Gg: AR+sD11PYr67qkpVae0Qi57hv80fW+n8OC9m//J4q5WYina2kEhGhQEIPg/+/5f2B6q
	B52FZXIoBvJvVIMzDnsTJjK+0yNco6VNDzTyHoYc3/JJKH3y9QgVzl4e2PeJzt48wreUbRKNV+i
	OXEW+QPjhpML47fdsNcKsoWffewPPMdmKvV0cQpwp+tUwqo2KKnuBuj/xGiFEtUym46qHx/jiWD
	mzdp83SrWMhJro600ArqLKorbDIqcZGDxK57TkaMGsbKmOzsLbc7ioOytWaBmQBjHoz2gr5nlWx
	V0U0n6WIZF03H2Po0gUgfXkl3wQp/wBr7kstQtslZLms5hZeEiNVa9KMDWHGcXozIBgCnhZruB6
	XDfxqggFXxCIaFwnoqRYLRKrUk/RY934gQVam3ptxp/+b7/RMHluccoRLUDPcxh5yenoCTboYBh
	vs9RPBtWQ4CBH27NFeoA==
X-Received: by 2002:a53:d051:0:20b0:667:8b90:2ed1 with SMTP id 956f58d0204a3-668c7c2a582mr1401100d50.45.1785123308261;
        Sun, 26 Jul 2026 20:35:08 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668c6d63596sm2751525d50.6.2026.07.26.20.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 20:35:06 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 00:34:39 -0300
Subject: [hwmon PATCH v3 2/6] hwmon: (adt7470) Fix cache updated before
 hardware write on I2C error
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_thermalzone-v3-2-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
In-Reply-To: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
X-Mailer: b4 0.15.2

adt7470_temp_write() and adt7470_pwm_write() update the driver's
cached values (temp_min, temp_max, pwm_input, pwm_enable) before issuing
the corresponding regmap_write(), and never check whether the write
succeeded before committing that update. If the I2C transaction fails,
the function correctly propagates the error to the caller, but the cache
silently keeps the new value, which was never actually applied to the
hardware. Subsequent reads then report a value that does not match the
device state.

Reorder both write paths to update the cache only after a successful
regmap_write(), so the cache always reflects what was actually
written to the hardware.

Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 481d51617f4b..62ec68ea0a40 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -589,14 +589,16 @@ static int adt7470_temp_write(struct device *dev, u32 attr, int channel, long va
 	switch (attr) {
 	case hwmon_temp_min:
 		mutex_lock(&data->lock);
-		data->temp_min[channel] = val;
 		err = regmap_write(data->regmap, ADT7470_TEMP_MIN_REG(channel), val);
+		if (!err)
+			data->temp_min[channel] = val;
 		mutex_unlock(&data->lock);
 		break;
 	case hwmon_temp_max:
 		mutex_lock(&data->lock);
-		data->temp_max[channel] = val;
 		err = regmap_write(data->regmap, ADT7470_TEMP_MAX_REG(channel), val);
+		if (!err)
+			data->temp_max[channel] = val;
 		mutex_unlock(&data->lock);
 		break;
 	default:
@@ -831,9 +833,10 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 	case hwmon_pwm_input:
 		val = clamp_val(val, 0, 255);
 		mutex_lock(&data->lock);
-		data->pwm[channel] = val;
 		err = regmap_write(data->regmap, ADT7470_REG_PWM(channel),
-				   data->pwm[channel]);
+				   val);
+		if (!err)
+			data->pwm[channel] = val;
 		mutex_unlock(&data->lock);
 		break;
 	case hwmon_pwm_enable:
@@ -847,10 +850,11 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 		val--;
 
 		mutex_lock(&data->lock);
-		data->pwm_automatic[channel] = val;
 		err = regmap_update_bits(data->regmap, ADT7470_REG_PWM_CFG(channel),
 					 pwm_auto_reg_mask,
 					 val ? pwm_auto_reg_mask : 0);
+		if (!err)
+			data->pwm_automatic[channel] = val;
 		mutex_unlock(&data->lock);
 		break;
 	case hwmon_pwm_freq:

-- 
2.55.0

