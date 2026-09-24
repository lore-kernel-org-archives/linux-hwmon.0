Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518945039
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225328; cv=none; b=nzHly03zxgh78snIcg/GTxwustteOtfE7hekL0Xk0AcTiLVO5xxQBsE0Gca7S6nUr7Fa5XAOzr1+B6Qq+Dc5jhHLaQV7cCJwD2Ca6UFQCivYq2Jr3GVmT/2A173d2yG4Z3fGz4/ya9HZicSJRn1HIjvWqHOK+KRcZCcaGf0Yi7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225328; c=relaxed/simple;
	bh=RDhiZTJn9JZMliO98reeN3q65S/Mi1aPZvEhe1g8xZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AivMbcIxdHVFb9dd+6DcK1PtTXhnRWJKFx7ao60ei17SglhS4L47NSiVK5t80Kse7BNzUwSf+aQko6DhcPeAl8SyyH9n96QzcXtoVFaW13TW2BtR9OQjmtk4fqyZt+rDJ/g2aQXaaWKhcQwtdKIHky8YWDOaeb54FaHMeQnvWSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZ+yX3nL; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZ+yX3nL"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso1394128e0c.3
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 21:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790225326; x=1790830126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvXy3wzD3laTECf2tTVINO6MB/5KI0mICCk5R7d02GA=;
        b=hZ+yX3nLEqMBAQHITMA3paLl8zPde4DUfrtvJ/JQt3rFtQCKY6SUReTcR6LY46BI+n
         9Rg6oPMJ18RrR3PFxY1A7aUcUGcKPcLxav0wKNDyO3Dpi4vXkXOtixfC2nVQlACSr7lm
         D00/zW1a4pMnEbWZNG1k/Wu6LSMBMEKpmUM0jFlILScjgwDe0YzuJLbCDj0800kO0hyP
         tq2tLNYMHNDmSayfk8IyaEFATG/o+lYmb1SxWJQ7BEGwT1jrzQURlLhSbvxNtR0ACRXm
         gYSP4vnxdT9cDGkN2kh5GKeYms57SW9byq+5WlPdFwujDR8595G1wBPQfDLcsZ5EJnwa
         V6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790225326; x=1790830126;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvXy3wzD3laTECf2tTVINO6MB/5KI0mICCk5R7d02GA=;
        b=IXhjdtsJgYpyucec1/lCO6vIiCEJyKKJB5gfcq6v7ORetUN5flx6QOjCK7nA5U0Dik
         Gg7v1tNTt0F21CTV/L7r1lotN02E4QXK6fYu3D/51gyLgjKJJvviOTQyTM2zRImIC6gV
         KTggtxM1l3krAF77J64CTpdycrT680V3lcLuKPvWPKBW0bihON7MLNxlRVyncsMJlaJg
         mb5XKaaOA8jLnBE+a/Jr7Zr5vuvRcidGrkV9u0evAjWhfmbL6sMcJI+XORgYVqC7Dves
         ia73uUSVMhnIDzLYh25bb9DtHoDzvuoFRKNCFLrXIqRJg0EAPaS0ZUAsmr/DgrVxbH+f
         +G1A==
X-Gm-Message-State: AFuF++lxmxH3v8ZSkvM8F+nlYbyCle5Hap7NlO17FHNi+We0ySafxLYm
	449hGnWs+0XQZRopKPeATAWa6p9hVwbrc9rhhmTe7fokj6WxgfA8S+RF
X-Gm-Gg: AYBFou3Q8LIOq8+u7ts30qluQKtqkVFlCMMA96K4/iA8PKkacpD/PH/amrtCIrMkeir
	KeZUX3d9Dh491kbV5Mlx7NiKDQ8GPuMYycsbhybWGXHvrd0TRcOlWhwhps5odx17Pd53Jum0oZ6
	3z2hZAnLQDj7WOc9x+LCYmHFsOIIS/zeUnGAG+xCiOMwFDtGUSxlHvYJ7HoF4q0USvwmB6aCCD/
	bXMU0z7Fi2ptELZUBS4FMCAqmj+I1mDOubzJ+Rb8O18DWTFAuKpWMW57ZIv7oNmc2wZtRzsDe97
	8bm0gUSUPfwupGeEumnK1EEpkLSQUtTSSW7Z3VesvMLDfm4EwudEmxXhfb2jh4wFzO3aNCwx0ZB
	dU+lCtQNzJ9kChwrd8AgjfXi2Yuvn+bjRGNkIZpnty5QNt9QH4WScHMLzezpbWJrbIgH3HeKPvo
	lrh9VPMewfEa4ePLJn9sXStVFCh52sZ5Gtxt71D5AJLTfMtk1mb+gUQfiLD2jpAT38O0A3zHGKe
	IXr
X-Received: by 2002:a05:6122:4f81:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5cb080766b9mr985964e0c.4.1790225326167;
        Wed, 23 Sep 2026 21:48:46 -0700 (PDT)
Received: from pop-os.. ([2804:29b8:504e:6aa0:a0c2:47fd:82bc:f7ed])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm5360908e0c.13.2026.09.23.21.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:48:45 -0700 (PDT)
From: =?UTF-8?q?Emanuel=20=C3=81vila?= <avilaemanueel@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Emanuel=20=C3=81vila?= <avilaemanueel@gmail.com>
Subject: [PATCH] hwmon: (dell-smm) Add Dell 16 DC16250 to fan control whitelist
Date: Thu, 24 Sep 2026 01:48:29 -0300
Message-ID: <20260924044829.2889204-1-avilaemanueel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Dell 16 DC16250, the BIOS keeps the CPU fan at its highest state
(~4700 RPM) even when the system is idle at 45 °C, and fan speed writes
through pwm1 are overridden by the BIOS within a few seconds.

The I8K_FAN_30A3_31A3 SMM code pair works on this machine through the
WMI-SMM backend: after writing 1 to pwm1_enable, the fan accepts all
three fan states (0, 128 and 255 via pwm1) and reports matching RPM,
and writing 2 hands control back to the BIOS.

Tested on BIOS 1.8.1 with kernel 7.1.5 (Pop!_OS 24.04).

Assisted-by: claude-opus-5-5
Signed-off-by: Emanuel Ávila <avilaemanueel@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 99a58ed26..88837f028 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1679,6 +1679,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell 16 DC16250",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 16 DC16250"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{ }
 };
 
-- 
2.43.0

