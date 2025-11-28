Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9308E2FE59A
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764334046; cv=none; b=RFdOi38oKnHI4MTpqkjSEqzI0TBOfW3O0mrjmPOJZk6vXJFEh6E6Xz26p/5djcZdYgzJu3GZ6FC52Hx0DfNALjNkmftHejaMbQuHNXRLpr9fFqfW0upmkFmmW2N7rPWOsc3ozzzUH1ZtFDH2w7RHHIHe79G9zdPJ2lj3HX2reo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764334046; c=relaxed/simple;
	bh=kzV9+demnOfcGL4XXbAez13alLimd8ksp0/UGXP6G3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=keqhl+pSkfLLTL3iGJk6L99W1k4x55ZEyyGFnh3+B+zzxOBbx+WTE55nhd/QhY7aJ2cRLblqe6Lm7D3tmo/CXxob6MrE8CnA58f31/JxDfqQoYptpQMbiqijxb2E2b28PqcUpu4IswBNNC+nI2lZW/LX3Z1/wxgOoe/QSrEOle8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPq0SR4f; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPq0SR4f"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34374febdefso1971441a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 04:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764334044; x=1764938844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=to/vAA7bFq5ou2zypDaoBxJgK9XuwGqaOChWbgZEfKc=;
        b=hPq0SR4flAB9joF8x7U0XGpCjGcV/5C+VeQ3pkEnprTbH4mcwTIxaGSubZuewQ4nDm
         xhCKxjgBJv6qcu2UA1thVHGK7yhnIy1eW4RwRoR/aDAu1rVjdHcI3EuIkaxagn5t+9xX
         Z4gv+vbE1DskSgV9cthcrsQgw+/TWr28MBw8HKPRnuSrInGjVnyLIC90rudthkV4nP5k
         MT1LekDXkUj/ErkcFbO4tItJnhut7VHBJtGWKsBZcz/BwRQ+FhnMXjgNEl2F6WkdTSJI
         S5sry03Iqwg8F27bW0mJDC8p95kOzRV7x403BmJqjYINT5WkN7L8Bhkda8NPHTeHWZGX
         4iXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764334044; x=1764938844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=to/vAA7bFq5ou2zypDaoBxJgK9XuwGqaOChWbgZEfKc=;
        b=ZU3Qw8uSaqx36VOpWMhAg3iaaUJruz7CJ4oldf2TjaUzh5Hvoda7zPZy2Put7FWUnt
         qLF6gOv5B4j6JlcuGvEqra/GgFrZdQNSLpXe06iw5yxmqV7wrJsuRfEv+RGdJwzzBQ7L
         ujtJxs858GddNNus6tULWtpsKMbtQfUK7RzpGEmIHIZRwCR4ol6aOfYZzL1KiGCv2xVS
         K3WSjifFjDkeotObu5m7diZjhpEu2n9WQbJ7DfUDPJbqjMAo6CmU/lBJh4zbwBpIb136
         f7xicDXpfXG/HwT1gvVcJqwmVetH8JAYTCQ0vOKNGg75AUJAdEdaodHi0BOoB/Hu5wzQ
         /CWQ==
X-Gm-Message-State: AOJu0YyxU4B4iRQWsyAdaapJZSrh4/xBrQpDN7UTrV2Q3C7PeBVtlcWT
	sYDjDG172WKlXO0sWKh9gP59lDR8uxiCCa8e80lw/0nOjiOdI+qw4JRc
X-Gm-Gg: ASbGnctyEx4PnNOa+2YnDJNi19HwH1sw5GVndTQdRggtnxZFPM8BDi0pkdvZjW8ZKsr
	b9pbVUj3gwkmhDyrb9bv3aYkvtlHZRHVRWEe6ySp6R1NGMTajbMp+Wb9UpiQD0QNm3fwGgg30W6
	UTyOaddmh9DTrJyBrG3zH7aPnCROG1iKjNcWVBdpxqmj2xF7JvslYzm2IeB6uSTwVFGFLRgXG8y
	ZRECHE8ji+FBTpUz3tByITQKGXlpvWPoxKgWI1WrULfIzDgHpj2S1SvfR0v6hNwO16Yjxyq8mWP
	hZEJgciN0GRxqpi4kvL1+psxgsegqbm8D4EIQz4Mm8oWqLbyXWZulgxxy+tU2vO+035++cipN6b
	iOJ5HlQEE+JUX31DOQ10mf0UEKiRudoZXuMvfQLOdEj+Rfqo4CwEyJxYtyiX0X+BaJSaP6ZPoDA
	jrl9JGqIEmITnMn9c/TctSj7JLAAD7UmayNoZBPASInFA7utD4ELAuEIVzTI+Cjr+anntA
X-Google-Smtp-Source: AGHT+IExavDrPYTAuFxviXdm3Se4ZMrsz/2FAilIbVsaAp7O+j6qMRHnuF8vULFtkbT7mW/nwVgERA==
X-Received: by 2002:a05:7022:2521:b0:11b:a892:80b4 with SMTP id a92af1059eb24-11c9d60dc74mr17778260c88.5.1764334043683;
        Fri, 28 Nov 2025 04:47:23 -0800 (PST)
Received: from 2045L.localdomain (7.sub-75-221-66.myvzw.com. [75.221.66.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5fcasm20956715c88.2.2025.11.28.04.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 04:47:23 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gui-Dong Han <hanguidong02@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (max16065) Use local variable to avoid TOCTOU
Date: Fri, 28 Nov 2025 20:47:09 +0800
Message-ID: <20251128124709.3876-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In max16065_current_show, data->curr_sense is read twice: once for the
error check and again for the calculation. Since
i2c_smbus_read_byte_data returns negative error codes on failure, if the
data changes to an error code between the check and the use, ADC_TO_CURR
results in an incorrect calculation.

Read data->curr_sense into a local variable to ensure consistency. Note
that data->curr_gain is constant and safe to access directly.

This aligns max16065_current_show with max16065_input_show, which
already uses a local variable for the same reason.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
Cc: stable@vger.kernel.org
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Based on the discussion in the link, I will submit a series of patches to
address TOCTOU issues in the hwmon subsystem by converting macros to
functions or adjusting locking where appropriate.
---
 drivers/hwmon/max16065.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index 0ccb5eb596fc..4c9e7892a73c 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -216,12 +216,13 @@ static ssize_t max16065_current_show(struct device *dev,
 				     struct device_attribute *da, char *buf)
 {
 	struct max16065_data *data = max16065_update_device(dev);
+	int curr_sense = data->curr_sense;
 
-	if (unlikely(data->curr_sense < 0))
-		return data->curr_sense;
+	if (unlikely(curr_sense < 0))
+		return curr_sense;
 
 	return sysfs_emit(buf, "%d\n",
-			  ADC_TO_CURR(data->curr_sense, data->curr_gain));
+			  ADC_TO_CURR(curr_sense, data->curr_gain));
 }
 
 static ssize_t max16065_limit_store(struct device *dev,
-- 
2.43.0

