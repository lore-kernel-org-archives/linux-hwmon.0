Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822D3BADB4
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882844; cv=none; b=YRknBZfn+5pqxJNMQRGlu0sYjKum+za4UYUSkiNe9BAluFGr2wygiDtr8o3Sml5XvUFIIzhz7t1/TVDJDJMSomheKfb7qgj8v23INYujd3rOqIS2zbSNa8mE4B+DDlu5p/LBCDEEJy54cDma+AabZiCgFGCp7Y7mbUMa5JD9SFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882844; c=relaxed/simple;
	bh=EvfSLyottFHTKEjNHamFONTYoWIu7N8e5ndpd72WGf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fajz08qldqD88bOh0KTyFrQ7dR9K9fJ/PRPZ3OnpgQrE0FanVHXNIjKL/NtTEx8F/VlJkotymcoRnlaLgwm+m7Xp2Xz3Lqi5L1oVh+7SQJmwp+nK94NQcExwKerlaNixyTXRjmcQ1B4Mdz7rEauWYcCFU78yfpXialb/wqzpSCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxBgulyv; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxBgulyv"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-3045c195251so4995518eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779882842; x=1780487642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aunltCQrVILEaQ+TbdbV0mNvTCr1h5KSg1QSOe5Corg=;
        b=HxBgulyv/l9Aok5jF3Rw2pcHjsnqSJSxDW/tae7Wy7+aLUYdEHaLlJ3ejS0MGguNCo
         yUuaqAI5kyK7Hgb3T/H0OJk/dCHb6rgn75trzP1bpnoVD/gLSHzyu9NDhMk4fZiRY9FI
         foFDYgdTYd4FcLdexK6juCeGOE8JtYBu4mLij5o9GenlAMAHQoGR2DrJdDEykBtZ1oNA
         Vgs//7pO2F/ymlSpug607U5TFXAo4Yj/IsMZApROKFTkbgdzh5TdX4TTVGvK1MVIkjIK
         XwQjgeA9Bx5ZqZbI8FMAx7giaZDCduQNZf7L1zUKuitOzy21gnBlimABxuP6nlXpl9t1
         28AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779882842; x=1780487642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aunltCQrVILEaQ+TbdbV0mNvTCr1h5KSg1QSOe5Corg=;
        b=PFFVZbXZhDI2vWe2uDz9IkCbuFFjsuaq7ICudTlHXf7kzWNU2RdbnjhV2EgZkmXlkf
         uEanfviYJ9bE9XyYwto0tExUyTACpZcEcdy4hfIM4fZmEvKjFiCPi6DC6QnLuo6ISzH5
         MO3erQlY7kTnCbXB+D/WCRW/xjokwvuuxVMT15TzqvweEP8RAo7kdskbqrITNv1tsxTA
         luipZUNfZRnMXVfadqH6iqaL86KW4HpsnGlvpH0mpBgvbuVs5sMKilu0CJFGu2pORFae
         LocR4vBAFp3NQceuMJGa15AqRSQDoBb7mszKiQkQ9oNkX2k5Jcoauqn0T8s1oSY+jn/P
         RIQQ==
X-Forwarded-Encrypted: i=1; AFNElJ94eb8yXLDWltrUJ/FEcmJghn1OL8QiQNervJkL1XbB7F4s1bn8ajOAQUJpy3FRu12b7WJ/1OGM1f7p4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSkCNYd9VNslAD0jNrD2MfkYFy/ZTxax1KsLMZ1QCN0d4Y4B3Q
	yZ3wY5NeUi4On8xQmjcmd4p+fSAVYB8O/YLmLYXwdG+vTfL+DFZsKJc7
X-Gm-Gg: Acq92OE5Pz7Kh7XrRe7IIKD6WHttw/+MaPftcfJKF8UYmWgSZZLF7+jD5hoivllY7Oz
	vRLYFEd904gKwUt4pJP4rLvGxCAIbaw2KVOZAVoOcgJ2xdlkJUOyp2nYzJUlyYfqxnem5+J2DIm
	L6j5KH2BJHoYFdkKkxRgwpsyEip+zDfrQc11d8IXvbY+QJpDLfO9DFte5BMX62+RJfC3QptV/7O
	yVBf/GiY0PYOeSHWsMRV5J+eHiz5EbtUQ3y/Xew+cOj45DwTO+iySQdZGdf1Y3VVfBZU2U/XrfO
	9LBf2Hz7a3MAeh6iSw/2ORgekO4aV+HPVpNlaZ+Yhol22t3RBQJ9aeuULvT324MLLV9vgN/Q+rX
	RQdphySUmgKdMDLVibSu6pcxQLqc6seMpqnromGt289ojj58RSDJ64hkyedRyJ6tN5QCaKdVgPy
	XXDNV4iI2v6PLk7VqgQmaBYQ==
X-Received: by 2002:a05:7300:8607:b0:2ed:935:aa33 with SMTP id 5a478bee46e88-30448fd64b5mr11992768eec.5.1779882842238;
        Wed, 27 May 2026 04:54:02 -0700 (PDT)
Received: from zhanwei.. ([192.227.223.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304cb5c381asm216045eec.8.2026.05.27.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:54:01 -0700 (PDT)
From: Zhan Wei <zhanwei919@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Guenter Roeck <linux@roeck-us.net>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Wei <zhanwei919@gmail.com>
Subject: [RFC PATCH] drm/xe/hwmon: report a single fan for DG2 instead of two
Date: Wed, 27 May 2026 19:53:11 +0800
Message-ID: <20260527115311.13398-1-zhanwei919@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xe_hwmon_pcode_read_fan_control() currently hardcodes *uval = 2 when
queried with FSC_READ_NUM_FANS on DG2. This causes fan2_input to be
exposed via sysfs, but on the tested Arc A750 LE (DG2 G10, PCI ID
0x56a1) fan2_input reads 0 RPM permanently while fan1_input correctly
reports ~800 RPM with both physical fan physically spinning.

The RPM is calculated delta-based from a tach pulse counter:

    rotations = (reg_val - fi->reg_val_prev) / 2;

so a constant-zero RPM means the register at offset 0x138170
(BMG_FAN_2_SPEED) simply does not accumulate pulses on DG2 silicon.
The i915 driver does not expose fan2 on DG2 at all -- it only maps
PCU_PWM_FAN_SPEED (0x138140, identical to BMG_FAN_1_SPEED), consistent
with the observation that only one fan tach register is wired on DG2.

Report a single fan for DG2 to keep the phantom fan2_input out of
sysfs.  Battlemage paths are unchanged.

Tested on Arc A750 LE (DG2 G10): with this patch applied, fan2_input
no longer appears in /sys/class/hwmon/hwmonX/ and `sensors xe-pci-0300`
shows fan1 only.

Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
---
Open questions for reviewers: this is verified only on DG2 G10. Owners
of G11 (e.g. ASRock Challenger A750) and G12 (e.g. Sparkle Titan A750
with three physical fans) -- does fan2_input or fan3_input ever read
non-zero in your setup? If so, the right fix is a per-subplatform
table rather than a flat 1.

 drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..2a60a76b1971 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -860,9 +860,15 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 
-	/* Platforms that don't return correct value */
+	/*
+	 * The PCODE FAN_SPEED_CONTROL subcommands return an error on DG2, so we
+	 * answer the FSC_READ_NUM_FANS query here. DG2 only wires a single fan
+	 * tachometer register (BMG_FAN_1_SPEED == 0x138140, shared with i915's
+	 * PCU_PWM_FAN_SPEED); BMG_FAN_2/3_SPEED read 0 on DG2 silicon. Reporting
+	 * one fan keeps a phantom fan2_input that always reads 0 out of sysfs.
+	 */
 	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
-		*uval = 2;
+		*uval = 1;
 		return 0;
 	}
 
-- 
2.43.0

