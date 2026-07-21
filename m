Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57EE3B83E0
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 05:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613034; cv=none; b=hz12fH8bFsPwEZh7irMrvUWhX1HmlxX+Nuyw4QquYJQM7mUIfgcke2Bc1CrnSdVG5jqD+HAiO1ab6eRCZP20oLHV15X29HsaCPZTPGkm6xd9Pk3LT++Ixr1mEG/EhU5GA8elImyCpD6skF/m1lLDiGA9nf7N2eNCFba+eB9PDWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613034; c=relaxed/simple;
	bh=Ez5w7zvTNFZ4gFy5ylLJYttK28CEOO05StpVXafibco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=At34UBjjcp/AEo4unfYDmAO9YhCPn47fIdDRiEmsnvCCKaVnXaMcAVfHGnB/W2Uy4kNAc7OtwM+FWnnf4N69ztu11K0z4olJ1OASCRsVx9CHyXsNxFC07isqUTZ2H+vHEpPonCR7GoSoPgIHxUQ0bxLvP8vPhgyKI+mdyLLe+Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJHxktTH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJHxktTH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3755896b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 22:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784613033; x=1785217833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Irned0KcW0F4/+po4+h2gUa9EK+kp0SPiPjmk8rujME=;
        b=CJHxktTHPmBPRqmOVQamtmScmi6zoMPEqrkGfwLXB58sLHp0gyct9bc7bNX39RaUQW
         ToGF+RE6kllUc/uFrDcTjTVapTzHxhcIMDLuADrPkqZa5QgXYRr6+J8r/M4nvzos2e1Z
         0bnaim5lkWj5/oAwIqvJOUX4D+q4a7ZypBTpTqCajTitWo7m8GVQuqfmKVUlrI5Z6X/d
         CBOkFEPIapR+/L5mzkvCx93N+QhmDFoG9wsWFvD5fXQ4JxNQULWSFezLn2Ih0NaCmQXP
         AGAv4RmddAln+UG+2cL4s1qGPAY9X0QH5UbsAgJpULVozkCIaDWdoa1tW2a+4m9EUl7L
         Q0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784613033; x=1785217833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Irned0KcW0F4/+po4+h2gUa9EK+kp0SPiPjmk8rujME=;
        b=QNX8V8+KnNAknh5I3o57qQdpamz/cSTsq+AkrIcbtZmM491ye0YhrrrZAlAr+t2E7t
         a9CthFu0wVnXRX3SAvdmkSmQWZjP5Trz2CPMc+wZbgL7n8tVDJSvJTn3mWd2vYtZoppK
         kQDSXn6q5wgDTSzqgmYzXrH2G4bsK4TmDcqmFaONarte4sAcwOmGEqsnS/0DDkwGNNyx
         Dx7pHcX1PgpaTTCdLm8hx3VmMkcgVjgPfv9CHvWeFkZuKhZcX3EJ0vT3FPUzSC6gRfiw
         VM0MNDTs9KRyWfMbCFP8OYRIf83Il85SGqbYMioe1EObTxrWuUFlbHADJZ702QkGoAPQ
         7WUg==
X-Gm-Message-State: AOJu0YxJ7vXuIdv/p8tvcQ5jsPseZaZ0FAv2ph0PJLUXl6it8u90MXMS
	aKo0ToOOg3n2vw5CzCzult9tZpnoxh7Mb8Xf92q494Z93xvNaCHp030=
X-Gm-Gg: AfdE7clF9iaFFBXANWV6C/rESjrIj8Ugwfz3reJqIAtuY3dog8K2FnGlq4ynMAuD4lI
	cbN//5lB88qIwr9g3Nk3BqpQv8HPuPbWAYeAUfhOk9LX2gRq3n5F6N8IoKEGVUajfyNEu6xFUD5
	bsWuqPYZbziXVKK9cCS1Pi+MAE3x3pAO2SvSKltR5pxHL4kEZy4NGpa+eNYD2MK1qqbcYiRb4lk
	Gi8VHlY3etN0nKm5Jcf/HJ4Dod2Ad2cen9zhBA5E9oyAzsTTdwIIZLMh5GTbk6f9kwFwDv4OlPy
	O4y86AQudSWIImaH1x4SaTkZEprlnrpIGLFXXqV/PW0oQ6mAH1/3TgTDEyeLJqZJMMVHpAMMFEy
	E66tX19ny7L0acDOR84Z8IqbG5c/Qh41LYLhXQySMODcsAJ/Dqy26bbUCXOZKf31BH9dEA+Khu5
	4ZGXmuHZ9b/iN1vhpqAAxyplnUH6Q=
X-Received: by 2002:a05:6a20:d492:b0:3c3:750f:3cf9 with SMTP id adf61e73a8af0-3c38d90c927mr24013128637.11.1784613032892;
        Mon, 20 Jul 2026 22:50:32 -0700 (PDT)
Received: from t-rex ([2401:4900:adc3:1a5d:adf7:50fc:93fc:9a82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de21asm43606969eec.23.2026.07.20.22.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 22:50:32 -0700 (PDT)
From: kr494167@gmail.com
To: linux@roeck-us.net,
	nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] hwmon: ltc4283: add missing MODULE_DEVICE_TABLE for OF match table
Date: Tue, 21 Jul 2026 11:20:22 +0530
Message-ID: <20260721055022.34629-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

The driver registers ltc4283_of_match as the platform driver's
.of_match_table so the kernel probes the device when a DT node with
compatible "adi,ltc4283" is present, but the corresponding
MODULE_DEVICE_TABLE(of, ...) call is absent.

Without it the module alias table (modules.alias) does not contain an
"of:N*T*Cadi,ltc4283" entry, so udev / kmod cannot auto-load the
module when the DT node appears, breaking modules-based deployments
while built-in configurations happen to work by accident.

Add the missing MODULE_DEVICE_TABLE() to fix module auto-loading.

Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Controller")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/hwmon/ltc4283.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
index 9b85293ea664..9ec409bc2648 100644
--- a/drivers/hwmon/ltc4283.c
+++ b/drivers/hwmon/ltc4283.c
@@ -1772,6 +1772,7 @@ static const struct of_device_id ltc4283_of_match[] = {
 	{ .compatible = "adi,ltc4283" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, ltc4283_of_match);
 
 static const struct i2c_device_id ltc4283_i2c_id[] = {
 	{ "ltc4283" },
-- 
2.55.0

