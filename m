Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23355346E7D
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123315; cv=none; b=hVBGjr3JHczHjxbsuT2m7bnzv1ErsLH14yauStaT+Iaf2kn2/dITK2/UCfKI6TKWyROFxO3B9Byi7kisSwIoMOJsbJSIlQwdJSHkDirvK1eEFuUCyib1iglRzqauL/5++sxRdGDYHdmGXNcrgTJeWKWnUrafDaWUaH9uANxvo98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123315; c=relaxed/simple;
	bh=Vr6lYln3IIQd0jQpA8JmB1vRON4rBsCVrTFU2O+2vUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQiqsa6NRWAZJrhmCauBHGp5aFLgz1rW+XlfffK2fMG1gAsBFMTeto1YUDSITLzweXGA9x6k5KnbezbfeA8mrVMK1Yl6M5x7Lqef4y9RCdGCyPzDo47gmTBKSrnE2CXvqe8Z8dvtXgLOUf+kXJqrYABr3GKLE5Yefm6aaaUgrgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AL/jgodN; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AL/jgodN"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-667923d86a7so2997585d50.0
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 20:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785123313; x=1785728113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEZmseVazoMVtdSfGMQhrKWqDNsvj4vIcTNUE+WpTkw=;
        b=AL/jgodNnz26SIdKAquQ7XrCzjVPL23C9puK++PYOqVa471jIBRaNAuhBQb/psl4A6
         J8z0EFe2gZyTU8mi8sDwC0JyjHPsN7lh8CAjj0Dg4c6d7t3yKvGzp47ZFck6pVk7yKc7
         UDP4WIgerQr6bqE6dQ70nSq9zFEyvpUr68YgMUanifwM4NztYh5FrDwGy+xlzzuYYyzM
         O5rc0b9btiXs97TEmi/VmGLEyFcaWNtDs2lWWJD2xbqEkVoNE+lOQKqYW88GuCYEv1+9
         EIXfZgjiP+AH1Z+zkQPCzy67XOB6KDuZRyrMxZslVWLfG9nOgc+zorvGZYnHE5sIF0Lt
         owDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123313; x=1785728113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEZmseVazoMVtdSfGMQhrKWqDNsvj4vIcTNUE+WpTkw=;
        b=hNfMd2QPgt0PAYUP6lL4tJX8vpjbuDPKu5RalqREl1AJgg7O/ULMvdLMg+VHwuXv+s
         mgPw1IpIz47Abm8Ugac44qNFUJc9DoWVD32rUgiBSQFj7W2bngrfifIM39cE6gCoevjd
         iUY2GpZaJPPySMoejTzM2cZDfqpmbAvitr6WWw+VnONAgOfbYOI73Tc7RGiOrHCOu2Ov
         DXOlFtvld7dSHw8qeQwTFc4MlSc7t67gXNQgsKfhVG6pXMBJMHcXG/R4ZHlAIEVK/rUj
         hhnu+2lyFLrHu1RmbOtRqVneyePq3UPVbHqRLBRjLGmcCy5NI+NLxx0s5srRumg8PSYG
         Lkvw==
X-Gm-Message-State: AOJu0YxQHv4EfBPEE9oofG0PqXLiH0QHCQM4tzg9V/fMkY7PpXCi6DDT
	Oh6MM6GOSxRj6B6YpmwRaKK8u/DOqC5oHvpFWpOQ9NnF5NMjR8zIoV04
X-Gm-Gg: AR+sD13t6XOCnhm0HLQRDlLN9pUy2wvQN6gf2mnunLig2qkdzHsvM2JW5fIW4/dKX/G
	gFheN6NPkihgm8q1rDlxZGxm2+Qlzh91ZWxogpDGu+NwWrhCLsHJhAn+dYj2U3adtviQ7Cyd9jR
	E+YZl3Y9l2jPPXiZYdwnKIXi6yOjpQ1JgUzavek5xXIeyB4UXF6MuhuM4vrCLpAC5nj6UX+bf4f
	OZ8RESTyaspd7j/YLGRsLQGnGGti34ET5RYPuG3qUrBlz+kpFTKoimlqaMX/ogva2RvFRa8HDrT
	Li4G0gQivvUZFqwqFaNEhUGjOYTayAfdxsb0b7iEr+g3JduDTGq9ZXSgfODQpQMPdArM4HOjyq0
	xWIPGGf80X7tGYgRkTnWArsOmvDHGIMzvOlnsxwdQPAHN0TwacLMo4XJmJq8GyPC//eWzkO5vn0
	hmAMYJGYZFvUHQUzLb7NMNpRmp19Qo
X-Received: by 2002:a05:690e:1489:b0:665:992:8a85 with SMTP id 956f58d0204a3-668c7a9b001mr1805097d50.23.1785123312898;
        Sun, 26 Jul 2026 20:35:12 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668c6d63596sm2751525d50.6.2026.07.26.20.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 20:35:11 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 00:34:40 -0300
Subject: [hwmon PATCH v3 3/6] hwmon: (adt7470) Fix busy-loop and I2C
 flooding in update thread
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_thermalzone-v3-3-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
In-Reply-To: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

When userspace configures 'auto_update_interval' to 0 via sysfs, the
background kthread executes schedule_timeout_interruptible(0), which
returns immediately.

If 'num_temp_sensors' is concurrently or previously set to 0, the
msleep_interruptible() delay inside adt7470_read_temperatures() also
becomes 0. This combination forces the background thread into a tight,
unbounded busy-loop, hogging the CPU and flooding the I2C bus with a
continuous stream of transactions.

Fix this vulnerability by raising the lower limit of the clamp_val in
auto_update_interval_store() from 0 to 500 milliseconds. This guarantees
a reasonable minimum sleep window between sensor updates, protecting the
system from intentional or accidental I2C bus denial of service.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.org
Fixes: 89fac11cb3e7 ("adt7470: make automatic fan control really work")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 62ec68ea0a40..0b19b0925d1c 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -509,7 +509,7 @@ static ssize_t auto_update_interval_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 60000);
+	temp = clamp_val(temp, 500, 60000);
 
 	mutex_lock(&data->lock);
 	data->auto_update_interval = temp;

-- 
2.55.0

