Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4412F1F4606
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Mar 2025 04:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741841292; cv=none; b=GKUXhJDCLShsJWj9qq9HDbkGHEOoX+nWLBwFEQS75uNOA90p4RPh/AnX7Cffk9ToMOKisP88UK4MmhQReFGL/BBmW3ltWWDnL4bFlnnQmK3n+rlDxoQBSF9l2RxyL4IotDwo4IpmPhHwyiEAo7Qzhg6mbgnIZ/0MI9/sXxfnb4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741841292; c=relaxed/simple;
	bh=6YZPbCIstrkFIBq12YFEFEcPE+av42I+9yZpNMwYV10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEzSB3baPsHE1wbGA1A7vQEusxi4Qq1HFKhK0oTyU0JIqmoFDXJGak8i3ulHdB2sOtPkfYrNx8J076ZbYX12HwUXMRTyChvjUfl1BcHhkX+5bPpbgIhP3eosNc4LDYLcAa9lsLsamoIAycfsX4PGlMiSirIK5Pwt1sqiunLYO0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d1j28/+P; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d1j28/+P"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22349bb8605so10921065ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Mar 2025 21:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741841290; x=1742446090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+gtVH5q1IVL2N3KNRKRTyNZRjmajO4WtYbaLiekdyM=;
        b=d1j28/+PWwXggRJEerxJ8uv9XGJXiifIENRLWIg5mh1IWwveyxq35dm59UlTcOWkTq
         1jqOm1jdiiJM7yrEYK02vVGFvc4lrG2i7FZZjpjBwvcJCpf3hMQ3XJB6xYtpkERyAVoh
         TiGMipo+q7toJgaJ+wwxLQo/PS56nz4zXQXqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741841290; x=1742446090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+gtVH5q1IVL2N3KNRKRTyNZRjmajO4WtYbaLiekdyM=;
        b=uMXpogu3L2NZjl1hwLmixJPpYWNPmzPIrwUnmWtdk1+H3AjijthMGdYyzcmpq42BhL
         fIeUxpLVN1uHaoRyOk1HlSUYPc+cY/mJ3gEdrop/GWvUamIaK0jEEXo/19ShOyYEVXWC
         twBZ0iqWp14dVtwJr/3ky0W1T7OO5Z1rjQP1PIpzb/9dlSHORO3JZvc5m7QGCVYlY8At
         LrYKgfbKr8V0cc8G2hZLc3AsAbAuEKD3XQu6T1t7CjWi0LPayQ2A3ZA0qupvlNf3gECq
         c2CfTnxGRNWULm+neb37nXykQgRfYuT1eWzfx3Jryu30Lil8NZS4ya5vrYa6HlVqqyIL
         U3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX2BMsuE6p+j7Ng+mLDUQVpX2yXOsN2Z46J+zjKcX5SDSdRqelbp+CMnKj7t7sUmDDeczTndXPqG6JViQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDrHVnrsI8G2swcOS9m43b80z6bbLAaQcfgunNQGqv5WmE/OP+
	60uwUFoFX0e+kmxtTnUMVQCGm88pZtOHwWscLUPGKMwyf4/ZGTOI8T86pSe+S/XJ39SgvmTGPSA
	=
X-Gm-Gg: ASbGnctRzLcJtGEQsK/wRu2pdb7lnnmvUbu4C09jyL97WrIx8gKkzMkTMt8iPmOxLX7
	ousiaybbsYO8mhP9ekyt3fx4Dlhd6EdvaPz7a841viyq9LNQRnPEgcUnto36RevWKT2U4P8GEyY
	fqHbaNP8bSkS2jaXenlCN0zXDj+4Z4kz4mahIex4vNPY8J2ylshyAhJ1zE0Y3a28/a0dOY0tP8Q
	iGVpG60IIOq3c+37SQSr42vebt6DJZA0m7oRSlRe9pln2NMhlVpc0CHnWT9rn4zJrozlx9mf+A0
	OwPJ8EfYYPoSmLtEl6O4XPemHq4zTnPfLgJLP3swrpfdLZ0jMe0y3X79a2xItr4+FSQ=
X-Google-Smtp-Source: AGHT+IEaZ5AffNlbpnnWajl9IqcugOB73K+75CMHqeDiaMOSmLOQz2lLmmj4CJcymfMhLCNoiy1i9w==
X-Received: by 2002:a17:903:2281:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-22428c1908amr341875375ad.50.1741841290572;
        Wed, 12 Mar 2025 21:48:10 -0700 (PDT)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:1872:6051:5c24:509e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5c03sm4188025ad.249.2025.03.12.21.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 21:48:10 -0700 (PDT)
From: Sung-Chi Li <lschyi@chromium.org>
Date: Thu, 13 Mar 2025 12:47:44 +0800
Subject: [PATCH 3/3] hwmon: (cros_ec) Register fan target attribute
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-extend_ec_hwmon_fan-v1-3-5c566776f2c4@chromium.org>
References: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
In-Reply-To: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741841282; l=1917;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=6YZPbCIstrkFIBq12YFEFEcPE+av42I+9yZpNMwYV10=;
 b=JhUhhxTRkvnPU2ov79FmQS4td92jVH4sj9+r0KoSiXE2Sg7nvJ8UWqERzYXiXc47oPttOjo78
 tc+qyXZb9F1AjCgrfx1CFLpQ/fMpFl1pTwbrfgNiaVXvLnhUkahlThK
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

The ChromeOS embedded controller (EC) supports closed loop fan speed
control, so add this attribute under hwmon framework such that kernel
can specify the desired fan RPM for fans connected to the EC.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
 drivers/hwmon/cros_ec_hwmon.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 73bfcbbaf9531be6b753cfef8045fd5dab5b2ab3..56a8ee13ec2a9f8e7127815a530d2a254a45bf55 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -168,8 +168,15 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 	const struct cros_ec_hwmon_priv *priv = data;
 
 	if (type == hwmon_fan) {
-		if (priv->usable_fans & BIT(channel))
+		if (!(priv->usable_fans & BIT(channel)))
+			return 0;
+
+		switch (attr) {
+		case hwmon_fan_target:
+			return 0644;
+		default:
 			return 0444;
+		}
 	} else if (type == hwmon_temp) {
 		if (priv->temp_sensor_names[channel])
 			return 0444;
@@ -194,10 +201,10 @@ static int cros_ec_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT),
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,

-- 
2.49.0.rc0.332.g42c0ae87b1-goog

