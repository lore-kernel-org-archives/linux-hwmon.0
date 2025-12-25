Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF1F50F
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Dec 2025 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766672613; cv=none; b=Uk2LOsUBeLKeJmq8oqgRshneHRRDdrgVHi0F5FGh8OIbhojvmWpLuWRb2yCjxEzGEj8B1N6map35sO2adP6rM6erwEHCWq8tm+K0+gRV9b2OBKsrdSkOs9wsy3++Qg3KDlBSIC/5yXaxphlzK8SINrG2MHKnlipdZOq/sjFTTcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766672613; c=relaxed/simple;
	bh=dsrn3N+A51ks7sZLvgkYsRGf+s0sbrbkVTdSHltC0CY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIYN1tumi0519JUFFpYurq/9Zw2dqn1fZmcPqEnCRaJJe45ouQhWbLwFbLTtC6w7qy9uX0eVcNdRcdkb8Y1BN6cCzf8Jg7hQjgrBy4q3oMUKVB8PQielTxnIfe78Knm/h5KrpI+fXadxsW8L8Q4qO8kxt8LrXo192VMAUgmDcs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2yE/WWL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2yE/WWL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0bb2f093aso67634625ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Dec 2025 06:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766672610; x=1767277410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9IYMret24pBGBbwNr9UIDhqJoSq0M0EW8YOiqUJqL4=;
        b=K2yE/WWL1XnF55hjUaFD3y3FsMLEJL0qYLQI6y/YR+y4mM2CtDe7A88XUXBb86EM63
         oJRRMHqDAyBUiApW9fr+H+iKxArs3HYKvjR9teblHrmgjjzt9zo0faWjbc1YvRuAD/PC
         /ZApAZk3czX/MJ7dtLFr4npQDphCPQhAWqnRnSY3jRzZoEVwBGUdecqxtb2DasPctTMu
         RBuuCS/JHZndzLmVozM6cU1Nz0yf4eKs8uRSR6pfGqH5s5tQ2RWoAtMphpUGLOVIRQEu
         n96s//i121zeimb3RzNPjqJIgyYj4XmSZhQoIizYfvjgXkMQRQGCwqg4noBFoJLiw8Y3
         CXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766672610; x=1767277410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9IYMret24pBGBbwNr9UIDhqJoSq0M0EW8YOiqUJqL4=;
        b=jAaWNTAJO3aN0SFFIzQWoXfGrJOc/kzGk9Udmker7e1a0hvjXukUyplifU9gLPCsqw
         0wPW72bS218C0Al0h+pIdcOtlYWcIf3PMkzm/ZNoSchaZEZyk7A/a9NWCWQCZi57SiBI
         0qY0FXSVwsRF2P6qg8eVdG/Ps92bMpJ2WGg/vy8mFKDx2LK6JUNSVQfY5o841HvdKhjc
         /F7V0EjkQrkm19sc5rKL7iQehyeSqlxVpV5saMubDpfJihGbp4cNMPYe4mvMArhXd6qV
         HOWuBQlFShPP5Ecp1uSFEroOwigvkPu8nMrEWZ3xKzmnJgZysB4UiD+5FcktaY/XVlG2
         DRXg==
X-Forwarded-Encrypted: i=1; AJvYcCUfUGzax+WySDQCOJbxsAasFU0VpsvbAWT11UVN9UVVcU3gwpMKm/ifGJoDYHxEb/gCVrXI/peU6Ajlew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4gNTE/pQ6IOsdo7Kz3BMkK291AKALdgC9XUGsg88BGnAeNExZ
	gKurfzIY1cecceS441uKE18dUBr/K+6JiPVv7wONpS2sJBFvCobYjr7N
X-Gm-Gg: AY/fxX4O/EuMnhqAbdzw0Mi8iLpygR0vu1X0ncRbUWWrzaU5fcmP23Lgg71GTHfGl80
	tP+fRGikLNCE7c0Fw1eEAEupTNjmpbBbST674350MMnXliyct1dE8q4lmyDNnQOOzuOEbfdx0vZ
	UV4wuPCBk9bx8nnioAlZB2iUOD185gGwRfJkIzjVc1vspQfO6IlVVhazgQuWKfHRJQlTRB8hvDe
	rfwXHrHqOZZcENixLfB92iCVSGcf2Skkc70HlT4bgr/iNd0M+GFOtJ4mKmPnbP/JKFnG4AFyRTK
	/JogumD8xs0kxFB8JBFBbH4103ET2PaDChfkSVZr3xsv7M1GpYUQ5/RWRkvPAflyZqCj+vZWI9s
	yZEKJ/38Hl7yQflsad4IwACrThzaZZ3TSRuBrPb9qWRLZecVFcWP700v056BBFALA72gu/7lJzk
	2u8toCz1MO0LgQ/U6oPk0=
X-Google-Smtp-Source: AGHT+IEgldb1YbMp/0OQv2OCTDWpW3s/dO9277wG6owY+Nsb28UheLdhLl1FHUxCKCGvZ7TdCOVnQw==
X-Received: by 2002:a17:902:ef43:b0:2a0:945d:a195 with SMTP id d9443c01a7336-2a2f283beabmr201883465ad.45.1766672610532;
        Thu, 25 Dec 2025 06:23:30 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm180892195ad.25.2025.12.25.06.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 06:23:30 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH 0/2] platform/x86: hp-wmi: Add manual fan support for Victus S laptops 
Date: Thu, 25 Dec 2025 19:53:08 +0530
Message-ID: <20251225142310.204831-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for manual fan speed control and PWM reporting
for HP Victus S-style laptops.

The first patch refactors the hwmon implementation to use a per-device
private context for state tracking. It implements RPM-to-PWM conversion
using linear interpolation based on the laptop's internal fan tables
retrieved via WMI. It also introduces PWM_MODE_MANUAL, allowing users
to set specific fan speeds.

The second patch addresses a firmware-specific behavior where the
system reverts to "Auto" fan mode after a 120-second timeout if no WMI
fan commands are received. A delayed workqueue is implemented to act
as a keep-alive heartbeat, refreshing the fan state every 90 seconds
to ensure user-selected profiles remain active indefinitely.

Tested on: HP Omen 16-wf1xxx (board ID 8C78)

Krishna Chomal (2):
  platform/x86: hp-wmi: add manual fan control for Victus S models
  platform/x86: hp-wmi: implement fan keep-alive

 drivers/platform/x86/hp/hp-wmi.c | 287 ++++++++++++++++++++++++++-----
 1 file changed, 243 insertions(+), 44 deletions(-)

-- 
2.52.0

