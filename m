Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B22B1A680B
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198165; cv=none; b=rBJk9V2leMPHr655VOHfT9T1YT6eFRjTBl5rczeN2xD68beafvWJee9auB0abeTyMcOcKu6BuTbWf6nsFbLHWqE7mFrZZ1tPHJtHAA6zBh1NxWFpkKq14hP9HyIPsK2NqIuC4lML6TE/DtbrBeSOmK2xXRBvSiLkoT8ZJ8gY9QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198165; c=relaxed/simple;
	bh=otyfV37K5jCT+kjDuv33Jof243V9rWG53jfTfDM1hko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HY7xnd7NHgxC82oWQCuDwCKTjfOa96kFnqIizNo+7J6ASVvM4cbnJvUmjTXcIdcPZopzsk95FcnyWQ0xyz7pRjV2CF2LZ7Ibflhrf0gh3GkaRVel8UYYK1et9i1FXXmGKlLr0l7me7lGUx2MlTePJvPi5gSNE17ayhr810nVRHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBKnEu++; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBKnEu++"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ed000b507so26096727b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198163; x=1785802963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fe5LqOn1qfiOnUxC1maEycp7XWWBtguH8PckX6DUpu0=;
        b=lBKnEu++d/33U2OAvlMYDogA2dRAImED5BfiFivFghDZrPONlOZRa6nUNQ7xIpW5No
         7ksTLlb/xQwbbNbPTTOPkKigp9z3zMY9/elXM8ZGBungH8r1zX+BYISVhB/JAZFi/Wq+
         CYtN8jlk2L6O05NiCp4gsqwID5n0jb790lJWBizTS2E9EOjDLmYsxnz1WyIHJ32BS0mQ
         pZV3AEqx5lYimQI4Zk8Bb3kwlFJk3wN4qcwNNTfPU4u9EUoDeqMVc7wFQneSg3G3SpLX
         PgrzjQU9yOhPzpP8Az2DOIHXIp6h89QgF8r8o3fUVvrdoste9Yximj2mhfa2oOfTfzec
         dr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198163; x=1785802963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fe5LqOn1qfiOnUxC1maEycp7XWWBtguH8PckX6DUpu0=;
        b=UYti+h0WPHc/PLFSqItLyDomK7/dR5cSY7HA1DzMWWSDntGA9kWzonivebc8Rvh4zl
         Ss9e+Y5yMWgh2ykOpxEUUzCFJVh5kwYJw8xGb64tkcCqVJ02bdCU6+NDmbDPkBP564h/
         xuYvnnYkp06riZKF10l4abLmW9nG4dVbjURB+J/xx4snYv5hZoXFVp0bfu7xe6Py18pu
         iJs1Z8N/BYok+69AJIqJ7hT0Op4+mvXHHbJNkEKjrkKXJu6MEpF6fEiCyIlBDK6HkRSF
         rN+uvfobk6tMHeLH/q6AcZwZTot6qBrIzLTa58pfUUJsp1JBPaZuaofcpyCRCx5v+7KV
         BETQ==
X-Gm-Message-State: AOJu0YwUjPt1n68CWAKINyE07Ihub0crjjcE3rJ7HCuiEyY5QakHujCE
	gml+nw/jIfN4HdoPhC/l3e6pG4Pp37xetZz5tWOwQlWmn26Is48F8x6ySJe4MvXU
X-Gm-Gg: AR+sD12F53YDv9UPJQRpA0qP2SDRoBgoRRNpmv8SuH/CmfXPGoIGo5n1tTicONhfqiD
	z0dKTnkq4PETbaVybsOo8kEZDe9Gq3f31i28hbXmQ0ojbNz5gQHMiwp02FlQNdNJfGJLkoZy9na
	k/ZAxfGBy3O5FdTF+MCI7pNKQxNuC4DeasJFk8u0qNmvtK/p0mHaz7v9Rzuv5BLxov8SzDK4wu3
	fX6kMbQksqRMbH7JaN3pf5KlmCEgGVL23GNrx2Jl/UHxOYKIlLR3FvD6YrDavHLjQnopByzgR/K
	HGbs1+daN185CUdW/BHuYbC5bTZjspHpmYO2NBWwI5oqmXysNFjUXp1HRZ0f/agr6CBaTI3SPqs
	actE6DcQgjbpx2BNIgcuZgW0SFziFWRZ8gns7Z01GhhGbYl9sywkwgJ2flRqzLzHSVMqSN5eQ9z
	IsecVtA1ysy3IOVLHrHg==
X-Received: by 2002:a05:690c:e3ef:b0:81e:bee4:2c1c with SMTP id 00721157ae682-81f9927660fmr308827b3.63.1785198162957;
        Mon, 27 Jul 2026 17:22:42 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f655acc7csm39583707b3.0.2026.07.27.17.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:22:38 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 21:22:18 -0300
Subject: [hwmon PATCH v2 2/8] hwmon: (adt7470) Fix cache updated before
 hardware write on I2C error
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_fixes-v2-2-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
In-Reply-To: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
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

