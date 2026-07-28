Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7A1B7910
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198170; cv=none; b=N8iYXzxXp8HEli10NYaKJTwh4mYJop5RJhiB0UQ0jJlIxRzxn5WcStzMbKSEcYM/q+O7XYZsR6Uk+Cbgp0h1eQFtDrODiJDLoyyrgMAI0GjUdYUgqiEaQrko/+1l+NmTTLoBVfcuhb72l3f5+krtWlHxa0tR4tlsfOX0tPJympQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198170; c=relaxed/simple;
	bh=Vr6lYln3IIQd0jQpA8JmB1vRON4rBsCVrTFU2O+2vUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mxa533ob8HkhtOXxGOf6Gl/k0QEYxDiw3n0d1ZBA0Si66fvwRV5gFhwZuDKhHTWiXOmcDPvgnTgF0YCcA9HRsvC3ZKGOLenoYvOeShxyw/aIxtFSmog+6Ksf0RLjczOUEDrGzyCVaVnAshNiEwZqVCsDKdCdy1vx8jTjzUB9mHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHe6Vh3c; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHe6Vh3c"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81f52945098so8206377b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198168; x=1785802968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEZmseVazoMVtdSfGMQhrKWqDNsvj4vIcTNUE+WpTkw=;
        b=gHe6Vh3clY0ap6nCPBrujBxNFHWOcZGQAIz5a0sd95eRGtZ1Wl3AdMwLvrQcfs5aPr
         HVpv4pxPYmrqgZlp77IC3kue+aP5RreLhDV6oDZ+SPOIaUSY1QF5kHhCy5uW+pdFbdRR
         NRkVeRPmmLx3XNO6VA4Oefx94FZ+o30LLEjIPvOfd+3CzZFj/IYrABP4u9LV+1arMA4U
         w0A5Ilk70M+XqN+Y2VYumBUF26m7HEyuWgqoBXIJS7gyEz4NjWKTwvC1mCcJ5Uum7Jaj
         D7XwkP73X60zSf+KTpf5snhaWgyr0Y6PEgv9LJklriv/1+sAt3scSl5CYwNgmmE9cwbV
         vL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198168; x=1785802968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEZmseVazoMVtdSfGMQhrKWqDNsvj4vIcTNUE+WpTkw=;
        b=r/W82bbfhMmVgybf0alsDml2meqBe4SiNE2GeS8PGtiwEUP6V7+CEy7YXaw9ayuZyV
         bjAzLpugdKlNlXYF1nMJSSsHC1FknX+zzapxcm2ZDNsmcGC1EE65abIz8I0UR3DJ39jj
         kQ1aglSSYc7GrBQDEI5FpO5nTnHGQNFC2hnIjEll88QPu+EW2Yi/xS1GhCkZFK1Zem6a
         N6NQY3RReeMB8pFnIOPXnpUNPRBj1qHyx028Y7P56wvxx2t6XX6kR8iso+IxqtDOL7uj
         j3MkauQdaEYEeLcya90Smi0OILVAh8Jiohf1SdJ/1UzuO1ZmTCdO25PL+zDkaJsFcQMm
         iMkg==
X-Gm-Message-State: AOJu0YwLyLUaHeW6q4OMjreO7RzhspiTaXvY40oXiaw3dcNO3VHgJJey
	PE+z9qdeS4c4scCi0GXqE2NdzqAcjwXUe+FzvZPiHHDklRP8aVVQtFNiKS98ZC4H
X-Gm-Gg: AR+sD11ROY+9wXkoxU7MkR79d70RHbQZazfnvnZ9hVvOdwQMwIlIkU5xsN4g+mwzcuI
	j/G3mZUIyBqrPSEq/s2qxVm0hYxmnPqWj1QpLJVD3rSZUu92fCxg7YHUDNLrVkkbnyrSKtiEo7D
	WQPwzZayrmplsNLZzbyA/vGxZ78xBbX/01dgNM/Ivey+dXeV5xkj52d1WuxGpj2ZnQc+e3m8y05
	9fc5t7ktGkmHDKDs/5x6itmUkJXJ4wKDW0WfGvQyOZ7SLC6y7gfMu+N0FXLFPbY8anCW59JKqop
	5j9VO/efUSrpSAomG4J75GRb0pYaGsysup7PiJ0j3FpYg+S5QDtIlqjfu9bJrWrO7FZTgTHc0tX
	UyzW/ajXWsjvEQxp6pwNzbm19weeXVqknt4gpmemHUBXDTePUTLfAd+1RkaQOi878gWIUfjdxbL
	xTqgzCMlU35Ux5Sinb9Q==
X-Received: by 2002:a05:690c:7245:b0:81e:abe2:e022 with SMTP id 00721157ae682-81f991fe6a4mr544577b3.5.1785198168375;
        Mon, 27 Jul 2026 17:22:48 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f655acc7csm39583707b3.0.2026.07.27.17.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:22:46 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 21:22:19 -0300
Subject: [hwmon PATCH v2 3/8] hwmon: (adt7470) Fix busy-loop and I2C
 flooding in update thread
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_fixes-v2-3-598e38a46ba6@gmail.com>
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

