Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACB11422D4
	for <linux-hwmon@vger.kernel.org>; Wed, 13 Nov 2024 02:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731465631; cv=none; b=soyrvVda3Ld2lsIQ2jWDjZSJf0UWrUZ3JHGugl3ydbif+BE/kE07/Vvyd9WFq6n7ylYINxo5C/ClrPzmbdN456n+k4T5Rta2y5iikTUz4KVi9So7KeltTZwo23ew1YSnSM522sa1I7SpKWyPTygC63kscVMrD/IyeOzQRQQSoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731465631; c=relaxed/simple;
	bh=T13dYZj5wf2Zd3XF41N7aemiKFJr6ayRHpqcY9xRpR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liISqKNNsv7N6wKmIro4+jZOS/JySuvskG8Hs7GA4yqews0aemeFXJKplFE/gz9PcBXl4d+eXF/ZFikufvXOouCkQPqBeHXGnO2QJbZ9biGUTalCUUO6e54wFZF+2vghkqIx60qpahOSS8AXvOYs7jiEnLEcLVOB3x1KE+Cr9iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L1aCocgA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L1aCocgA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-210e5369b7dso66251935ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Nov 2024 18:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731465627; x=1732070427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUswgydF4ecDD8gA1hGl988rFxQMVbM/Q/QpWYHHIvg=;
        b=L1aCocgABbOP+l5rs4E+n5MoRU/dkQ19pizpfIMviXxj6JeXoVoybwwbKXG2t5DAMe
         mqByfrPGu3LZKftd/PmD+92SBWEyK6m8GoHwPN3u+T9jszMNQopopHfDoIQBH+MARRec
         T91Ye0rXtFMS/AoNf2wPAyRGLRxGbTES49cpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731465627; x=1732070427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUswgydF4ecDD8gA1hGl988rFxQMVbM/Q/QpWYHHIvg=;
        b=V4QyuQkpNJExdYbnTZFXgYILL+QPa99x3huQj4nQr6lKa74rk9XJMYM+yxoUj+pdW4
         ppCVGfeGavCk/ptr55hz9h0sm3P+upsCZlNBFf71z/Pl8Xu6NVCYivKn36HVJoCg5h++
         bOWbVTnGA8HcQUMTm8eji/pv8Z58jlDvt1JRw7c2j0UbnEFqk50qDZhAU6YQwo5C1wkc
         Tf+nUzCIRuML6OrfxeZxmkAGcXsN0Zw3rIGmfDfqMdkqT/q9cbP6A92GLAzg8OX4rqfz
         57fd02UHEPyMMpA+4xxddwh7XustE4RnOQb/gAQKdbKRsQeAk1KHCNMgPG1VrkKoo2CG
         ad7w==
X-Forwarded-Encrypted: i=1; AJvYcCXRxn2P4nneVKzEokSry7HxBrlZPR5RNPuh0xNLiwauyYUby/uQbyYFybx6l0au3a+DuQKpfDn5S/60qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6v97saJSPyEsnkdIGcOxo907KU3FQrznRQOzf07DUX3SQ/3EJ
	Hsl0Q/RXwuH74/uWsVoUusKhD29nboyjo0KMENvK1ZkJ7hfzU/QITcrJTkxVOC62JMmZweX45Og
	=
X-Google-Smtp-Source: AGHT+IGby99YKs2n1DW3eqEgTozJAq71CGujBYHsrQ+I43rpaTsytkJKH0YHFTNW8GkOp0t5qemLMg==
X-Received: by 2002:a17:902:d505:b0:20b:8e18:a396 with SMTP id d9443c01a7336-21183c7e137mr245463495ad.9.1731465627355;
        Tue, 12 Nov 2024 18:40:27 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:3dd4:86fa:9696:4236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e418d6sm101831325ad.142.2024.11.12.18.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 18:40:26 -0800 (PST)
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: 
Cc: "Sung-Chi, Li" <lschyi@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 1/2] hwmon: (cros_ec) register thermal sensors to thermal framework
Date: Wed, 13 Nov 2024 10:39:51 +0800
Message-ID: <20241113024000.3327161-1-lschyi@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241111074904.1059268-1-lschyi@chromium.org>
References: <20241111074904.1059268-1-lschyi@chromium.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec hwmon driver probes available thermal sensors when probing the
driver.  Register these thermal sensors to the thermal framework as well
via setting HWMON_C_REGISTER_TZ as a chip info, such that thermal
framework can adopt these sensors as well.

To make cros_ec registrable to thermal framework, the cros_ec dts need
the corresponding changes:

&cros_ec {
	#thermal-sensor-cells = <1>;
};

Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
---
 Changes in v2:
   - Rename `cros_ec_sensor_data` to `cros_ec_hwmon_thermal_zone_data`.
   - Rename `addr` in struct `cros_ec_hwmon_thermal_zone_data` to `idx`.
   - Use `cros_ec_hwmon_temp_to_millicelsius` to do value conversion in
     `cros_ec_thermal_get_temp` function.
   - Rename `cros_ec_thermal_get_temp` to `cros_ec_hwmon_thermal_get_temp` to
     make `cros_ec_hwmon` a prefix.
   - Use `%pe` in `cros_ec_hwmon_probe_temp_sensors` when printing out
     `data->tz_dev` if failed register thermal device.
   - Remove `cros_ec_hwmon_remove`, and the `.remove` value in
     `cros_ec_hwmon_driver` since there is no need to call
     `devm_thermal_of_zone_unregister` for clean up.
   - Revert function signature of `cros_ec_hwmon_probe_temp_sensors` since all
     needed parameters are presented.
   - Revert include of `linux/list.h` because no list data structure is used.
---
 Changes in v3:
   - Revert all changes and just as add HWMON_C_REGISTER_TZ as a chip info.
   - Remove unneeded Change-Id tag in commit message.
---
 drivers/hwmon/cros_ec_hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 5514cf780b8b..9991c3fa020a 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -141,6 +141,7 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 }
 
 static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
-- 
2.47.0.338.g60cca15819-goog

