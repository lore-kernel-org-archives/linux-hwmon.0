Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5D01F3FE3
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Mar 2025 04:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741841286; cv=none; b=Zsvy6i+TN2BmbtP1rVspuCLs6cNGaRNkcHO0j6aX5XOpy0NAE03u5i9wFKW/+YQqqKlD/QLEp+oa/OGXy0WoMv6rmuOLbVlBZW08rV4obReToQKa6Et1yQR+qibxPAcaBDTbwJc+IAb1CnbfeVyCtuyohmweaSKAuiVf21HJ7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741841286; c=relaxed/simple;
	bh=Y0Td/sWdH+knvqeBCTi/FRD4AvDH3lbDPwadbtlNZfE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XYs0wotY0FgCnp2woMgLZkSGzDGV7ZAytZYMZMrk7pigA/ud1myc9AyXImlHzK+yZuucqO2bhgTt1//uyMifKlB5yG1nMDMsR6+/1H5FinBRSK6BDV9fjq7Go7pSl74nJ9cDlrTPvTPkMpcDc/vMmlPf4fCFeSxt/lFX+yhJqSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=go2wVPv/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="go2wVPv/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22438c356c8so9795535ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Mar 2025 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741841284; x=1742446084; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=REcOQ3NimKP7+/Ghwgmby8IZ78g2GtCKzkTqzXtjVyU=;
        b=go2wVPv/A4p4GOOQPYJW3ZiemYurgGkCM4P6pw4PSTTlo2H6yKzpwxjOOQ4o5udSPd
         mLrV8i8/QxMKyKdOqKF9JdX5rT+o6dXwkvQnAls0aspDMIw33iUgi8YM2Dd8FaplqS3v
         KBmXC6GfC+oJoSiX/rqjFdq7O9DGhUMfMVWTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741841284; x=1742446084;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REcOQ3NimKP7+/Ghwgmby8IZ78g2GtCKzkTqzXtjVyU=;
        b=Ik9vd7pXbCBjw9ZhgxXHvsTzpsX1hLrTEvRCrioW/w9VccYc3dkM0Ec+632tz9YcGn
         P6Y60FUaXqNaHIiOdzyiapHc+2rQ1/VmWSajGWhW5cyg0a/WGKkKk1GARwyE+3Eqlie0
         7zALKMQ71QLIrOf+VFJ1wkgM5LvDmcfMeeyATpp21DCEzOUVuS4MonZnBQsrljEaMjC7
         DxGJ5rttdtmWZ4lyZnEJ/AZd8UgjrEl8SpqG8OfWz5WcW/SfAlMtxVY62pDBxIvm250C
         GLkOA6wTX7AzP9TfIVadsYiUrntBzeHeJ0ZHu7+zKq8lMGn9eBH3dGcaN0z7DAk2ll3i
         S95w==
X-Forwarded-Encrypted: i=1; AJvYcCWiFbQa1pqMfb8XnCaq08cATO/AY0ZhnqSi0dMV6Suz6UT1Sfg5vEhGg+dQR14s3a/KRX39xHWllmstFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Wg9zra6UmskH1mczHfzi+9oYLlux5Qj7KpvqDcfMu5RuhGRo
	9oOFtIjnkVWLiRup4ouKDWI7QcramMaaCUSosWoTUZOUPJ3yInf6+DhCKIZNPQ==
X-Gm-Gg: ASbGncs5bd0uARmGXz+Rfrd/KDOI7iUcOvI4buHnwAYbRQ5L7Y1Zr+ptWyzC2COLbqO
	Y6jE4k/oPddHc8YxPRspLpCjRJ9WU3cMFfjP9jZK7KPshH+NberotwCGJ/zo4cc/fuVgtJGVafj
	2yzKzm6vFKlQcT/RavIQEhzyD17pf14bQk3mf5e8OrpxY91xMvXt90gJG7Q6bADg5mMJXIhFGUx
	3f8Pjz4a8Tp4h5Xz5M3FfzJTzurCAtKVorE8cH9ah8y7m5pcNu8tKqtCXsy6SSkgPluczYCKroR
	N8CHzcHOBRZ1WX2fI8DfYdLWqe9FcaCzVyj2iBO0PNZinK8/QZAdc9Ry5Q/Dfw3KmwI=
X-Google-Smtp-Source: AGHT+IFivHliX3YVhdxncqv12rrqQ3yO7uTaNUb3Gnhhii9egYkYfMhfwC4Ns2bXiI/Sc861z4Cx7g==
X-Received: by 2002:a17:902:ccc5:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22428a9d152mr344857145ad.29.1741841284353;
        Wed, 12 Mar 2025 21:48:04 -0700 (PDT)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:1872:6051:5c24:509e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5c03sm4188025ad.249.2025.03.12.21.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 21:48:04 -0700 (PDT)
From: Sung-Chi Li <lschyi@chromium.org>
Subject: [PATCH 0/3] Export the target RPM fan control by ChromeOS EC under
 hwmon
Date: Thu, 13 Mar 2025 12:47:41 +0800
Message-Id: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1j0mcC/x3MQQqAIBBA0avErBNKcVFXiZDJxppFU2iUEN09a
 fkW/z+QKDIl6KsHIl2ceJeCtq7ArygLKZ6LQTfaNqY1ivJJMjvybr23XVxAUWiD7RAn7ScDpTw
 iBc7/dRjf9wNxGYvyZQAAAA==
X-Change-ID: 20250313-extend_ec_hwmon_fan-a5f59aab2cb3
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741841282; l=847;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=Y0Td/sWdH+knvqeBCTi/FRD4AvDH3lbDPwadbtlNZfE=;
 b=6crJeFwDT8h8Rk+m2OeKexaNtQbX5DfEuIIILaDCnFdUl2qZRkUR2HWQEJBeTDc0KSkaDvwpF
 lcKNjE6CRHeBxUNV3+8QlRLnzLCaFg1kXTyCaoIVGAoUQQaXP69v0Lf
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

ChromeOS embedded controller (EC) supports closed-loop fan control. We
anticipate to have the fan related control from the kernel side, so this
series register the HWMON_F_TARGET attribute, and implement the read and
write function for setting/reading the target fan RPM from the EC side.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
Sung-Chi Li (3):
      hwmon: (cros_ec) Add setting target fan RPM function
      hwmon: (cros_ec) Add reading target fan RPM function
      hwmon: (cros_ec) Register fan target attribute

 drivers/hwmon/cros_ec_hwmon.c | 69 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 5 deletions(-)
---
base-commit: 9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
change-id: 20250313-extend_ec_hwmon_fan-a5f59aab2cb3

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>

