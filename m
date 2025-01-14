Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC3E214A91
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jan 2025 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891160; cv=none; b=I/PTOlDTDqbWWo5OH5HMAjIWKL4TXF+k7fVUHw2/SZVahaEKdrdaQB2v3s9jJgDTzJZ21tRpMKlJ7CPT6gXvdlpOAl0f+DQemUBQXdZBMzQddK5VvjUXz61k9qzWslYUbdV3TF3oi9LGcIypk8DTyJdzWqo+z13/l0JZpLeFd/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891160; c=relaxed/simple;
	bh=iFlwqURjDNXcEUtZcb4rdb8ETC9wJm5HQF39td2WpWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vdyteffp7+ffbtHFdpbJYm3CuBOcgQRJJmMQjtE6qSTz5P59TcZxUiLlxfWNcpuVwRos9AQ1LqnJ6NgKDScQBDjoczxdmPf/oOld0BhMaoy6nqWF/2J9ByTQNTaQO9xpM2fXjvlWXMDDdUb5lVXtVSONB3ij/AT5v5s2qolRQwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g4LS0txB; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g4LS0txB"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71e2bb84fe3so3231852a34.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jan 2025 13:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736891155; x=1737495955; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DLz/63hPMJ48akca1hvz/KCNQ8/u4nLZQzJDt50NRIg=;
        b=g4LS0txB2JacxIrFeFGg54+WeeGF3mWkDh80OEdLeIMlD0AYQvPUbyW25AJ/RA7dvR
         L7kdejJlhxviVt5Ob0210MA7FP4Tc66WEjs7aV98SGV5EPq0BNFPDgHnNd3qC5l7jp0+
         CHMM71jiiFfJaJURhUkz59+aH9CtK3lwoSIB60A9inA7Tui+48wP7bV1ayVmijbH+lOW
         2RjbxGXg6jrWq2uauclCRqmq3YRo6VBtlXJzhPBUApgq//GJ5f4zrKd7JfQeaapSEI6V
         k8fmgGVKRLWSD9HMqnt4Way3iNwPShc/8k0pyY25S48QyEANOAqQFPZK+cKSTkxKJi2/
         PCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891155; x=1737495955;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLz/63hPMJ48akca1hvz/KCNQ8/u4nLZQzJDt50NRIg=;
        b=H1c/yVMjMo2bbpKMxIoQNX9O8/SdTkVM0B+dhUM7mp9txa4iS/CW+CReQr+aV08Jdi
         VIP5jc12Rsx5Fx3NhoxyEtxz/yXD0EB9BRKrX5+VLhRzX2amTAa3YcF8R7Bd1OpDxawg
         1bXf2BwaynJ9268ClFz5iJUSVPU5gkTtzwvtkEDu8aYCWwLLAHbGWVIXxgOFgchgF+kI
         3v1iV0dcvm4DSOGQ9Cd9vTQNnTRS3+aPCjMbFHaVGTK33wuSPXnMBPo7+FZ0+UiqmryS
         DdFvkipV1362IXKV27xbLlU5y/+IjKTigngqJMoJO/HxNNTPyE1MICaUUocWY7yUghOD
         n76g==
X-Gm-Message-State: AOJu0YyeKg0kKz+Gcz/JR7nYvPN1hCl4POnUIRm5V5jNyzAje5sr5/Zd
	b+R00oBUPqGIExUfyIhqxfAlhl2DVheyJTzrGgtIcVZays8hQn0GD3IY6QbsbgE=
X-Gm-Gg: ASbGnctlU2aDRJE5FvFzDgwtkqMoTNB3QoofDBsJ97TQqqhu6XWbOe8Fgv1a8kRu1LR
	Uqx7oDRXaU4dEY/JpjC8vPFLIaV27Y4RMALuag5Z65iQ0suL18UC7rwzduEEA2aBj3NdOC/3Z8/
	40fnPwzezAVHLk2jqROL26Asd225uZuqsKsWJhXvzZsE3DnndaHRehG7Xirv5wyYD9oEwPV+ZmZ
	MUJzVki79PbAyG/9a8TfSn7qmeuUIheMyPng4Z7JDDm/SdyO0AADGSgdHS7XibP5Jj4daswb9qL
	JHca7+hpuYl6
X-Google-Smtp-Source: AGHT+IFjTHupVA1AJrLWZs7eEecAGwy9TIDhOySdNUqsVMyQ//EsyfIum87eJDCsKhHpplV9AUiTAQ==
X-Received: by 2002:a05:6830:3910:b0:71d:62ad:5262 with SMTP id 46e09a7af769-721e2e3a52dmr18719933a34.10.1736891154747;
        Tue, 14 Jan 2025 13:45:54 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7232698f926sm4392137a34.40.2025.01.14.13.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:45:54 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 14 Jan 2025 15:45:52 -0600
Subject: [PATCH] hwmon: (tmp513) Fix division of negative numbers
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-fix-si-prefix-macro-sign-bugs-v1-1-696fd8d10f00@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAA/bhmcC/yXMQQ5AMBCF4avIrE3SopW4ilgUo2ahpBMiEXdX7
 N6XvPwXCEUmgSa7INLBwmtI0HkGw+yCJ+QxGQpVGKV1hROfKIxbpHctbohrsg/Y716wVLWtS7L
 kKgOp8d++ftvd9wOOfGxFbwAAAA==
X-Change-ID: 20250114-fix-si-prefix-macro-sign-bugs-307673e6ea45
To: Eric Tremblay <etremblay@distech-controls.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Fix several issues with division of negative numbers in the tmp513
driver.

The docs on the DIV_ROUND_CLOSEST macro explain that dividing a negative
value by an unsigned type is undefined behavior. The driver was doing
this in several places, i.e. data->shunt_uohms has type of u32. The
actual "undefined" behavior is that it converts both values to unsigned
before doing the division, for example:

    int ret = DIV_ROUND_CLOSEST(-100, 3U);

results in ret == 1431655732 instead of -33.

Furthermore the MILLI macro has a type of unsigned long. Multiplying a
signed long by an unsigned long results in an unsigned long.

So, we need to cast both MILLI and data data->shunt_uohms to long when
using the DIV_ROUND_CLOSEST macro.

Fixes: f07f9d2467f4 ("hwmon: (tmp513) Use SI constants from units.h")
Fixes: 59dfa75e5d82 ("hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/hwmon/tmp513.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 1c2cb12071b80866b751b71bf39292580cd47929..1c7601de47d0720352d729e35a5b7eeaf109355f 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -207,7 +207,9 @@ static int tmp51x_get_value(struct tmp51x_data *data, u8 reg, u8 pos,
 		*val = sign_extend32(regval,
 				     reg == TMP51X_SHUNT_CURRENT_RESULT ?
 				     16 - tmp51x_get_pga_shift(data) : 15);
-		*val = DIV_ROUND_CLOSEST(*val * 10 * MILLI, data->shunt_uohms);
+		*val = DIV_ROUND_CLOSEST(*val * 10 * (long)MILLI,
+					 (long)data->shunt_uohms);
+
 		break;
 	case TMP51X_BUS_VOLTAGE_RESULT:
 	case TMP51X_BUS_VOLTAGE_H_LIMIT:
@@ -223,7 +225,7 @@ static int tmp51x_get_value(struct tmp51x_data *data, u8 reg, u8 pos,
 	case TMP51X_BUS_CURRENT_RESULT:
 		// Current = (ShuntVoltage * CalibrationRegister) / 4096
 		*val = sign_extend32(regval, 15) * (long)data->curr_lsb_ua;
-		*val = DIV_ROUND_CLOSEST(*val, MILLI);
+		*val = DIV_ROUND_CLOSEST(*val, (long)MILLI);
 		break;
 	case TMP51X_LOCAL_TEMP_RESULT:
 	case TMP51X_REMOTE_TEMP_RESULT_1:
@@ -263,7 +265,8 @@ static int tmp51x_set_value(struct tmp51x_data *data, u8 reg, long val)
 		 * The user enter current value and we convert it to
 		 * voltage. 1lsb = 10uV
 		 */
-		val = DIV_ROUND_CLOSEST(val * data->shunt_uohms, 10 * MILLI);
+		val = DIV_ROUND_CLOSEST(val * (long)data->shunt_uohms,
+					10 * (long)MILLI);
 		max_val = U16_MAX >> tmp51x_get_pga_shift(data);
 		regval = clamp_val(val, -max_val, max_val);
 		break;

---
base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
change-id: 20250114-fix-si-prefix-macro-sign-bugs-307673e6ea45

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

