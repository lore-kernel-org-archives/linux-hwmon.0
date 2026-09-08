Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304014DBD9B
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859136; cv=none; b=QgOJChEOwca1kCA0f0M5ImEDxqBFdtipZgcWJv8YuEgHUUWpwOuNUVDceAoCCxgNHjakFHhA9fyi7a1oO3Ak47NrPtGUwKPn+uFROQp8o4dMjaH97+5Gdak/XrFSkmcl/SHBnhFENsTTsbAFWSajQq8IfpMQ+7pEahRPTFlK8L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859136; c=relaxed/simple;
	bh=jxumOtO/ae67qr2veCqiYfiAIRJQOkMaRiPR9coBogA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pOjfGsSenGbLa/XRJKLZygOMeAYHu4NJjatMlqgo9PuaqnGp1CJoEwg2o87EB/EzVzqB6HV/awgC/zhAVbR1PkB4IIc5EWg+BgfuimQ2uwq6SGOo20kIkp/2dg0+P9yPxXRBOK+WjHdXKwZaqP0H4d0nrP1hw1lFhfL8wANTx4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdkg+r/5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdkg+r/5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f96c5b722so3091972f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859132; x=1789463932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fv7CjFwdw09GhLaGW+A8s1wFrpjeqIA/fnUBh+D6xLs=;
        b=rdkg+r/5one0mJ0hygCHflSaasAZ2l4tP5pj5hnUWGPDk0U56XRNIcacEBESlUigbO
         RyzLSDga3q+mv6AyCG2zApR5iffcInzB166S6KkuR1YpeYu8U/rvV5UkObR4cFodmvy4
         Z7ruf8lYPQ+u15HoDOcCrWka6TqWPyEIm96NIhsA0B3gI1UTUu00PkPHNskUW4bDbj+D
         jPKkUBSeeb94my4G0EkD5x7w6mC1Iu1RJI1wxU1Ek3tybUNcGdV3s2RAIaRnt+bx71Rs
         4gbknDNdMu/4YKYIkT2wWHiZNI3N/9kqpyzB+6tC8iaJdrUwoN+IIcG98EFg71tTNwSy
         RklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859132; x=1789463932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv7CjFwdw09GhLaGW+A8s1wFrpjeqIA/fnUBh+D6xLs=;
        b=RvtYS8fLVA0tZm5zQtvGDv2GcxBL5FWzB7AXPYirNWusI20dWR3oSroF3awOONr600
         DHHU+bbMXBZ2ZSC+aTzyWN32t7VrnVEylzBqmHXYFFExOuJTgGx2PPF6ShSj4nIgOude
         IWFNXIyeF+qj7OlOYMPa36+Oz4cXzXPHV1ovGE1ITweLi/P3pnMlD0GQDnxWEFLNApGj
         snrpoztYjGk25oqMQeCtcwOkzg3egC8JPyRdQIFTvjEe/AQ48ioDE7wE4AHD8EpNuVLu
         K42FowtzS+1jZDWdeyN2argbKQbJkrJcGj5VGyjugQik4hMXN4sNRFW0wAPE2Q3FnkUo
         CiWA==
X-Forwarded-Encrypted: i=1; AKwUvBz+QVexYgdseMPC7HE8cJtXk74dcaYrETDTDsXokUS8OHBVHsI+ULJC8or9u759Ukn41pjva0vQQ02TJg==@vger.kernel.org
X-Gm-Message-State: AFuF++mY89MLHlgSyv4cSpv+k5uz+7Yy2OMRik5R7Frdbm9WB3nt45p/
	egafHTvHcjwyK/2j4IUxsApcnFvF+4+X5kbjX3RrglAOKfgAGKW3fLlM
X-Gm-Gg: AYBFou3EbebOZxdz+4PGd1Jt+rjGPWYYfdllXKsq5XMcw0c92zwBdGwxAXm+HvwlnLn
	T7WGXkqVFZYWXcndULDxqynjQRTvVL8BrYIIz39aCsnWy4ZRFE36FbmRAqlm/pasHxj0EWwiLz8
	7z2SSwdnnv3NLZOVCTqd637f6b/ZVgp2ysehNrYZZ8JymYEjBw/egPrYTihesD2aUH94YpuLaU2
	y/aLqbgLZRIX/DAiewOlz9w0l4uJMTMh7NnoYH0MtKVmItceMpCZjnKaOV5gj7m5vtbhezqGRmB
	ExtgLg00exgY5SpBDhSIKyZh7e0H1Meprki1uEdkpClek02ScRAHiZJQZoUHZ5r05z6U006wtHO
	RHqdnURnyzpHwiAHWwf4Esu5htJYAwuZXir97KIjVKAbkX9W/vbZQeVweL92AnRQccJotq3ftoX
	wcbssFgUN2cUvhCCB2EAtfEzeUuOVcQMSNxMoynzVTG+0ISNip4R/lA31H5L4pyVDG+9a0/LU8B
	tZiTZ8N4hj0cvlzvpRDIQUzW2LqnyDmpg==
X-Received: by 2002:a5d:5f51:0:b0:485:8a47:5b9c with SMTP id ffacd0b85a97d-4858a475d7dmr24889964f8f.57.1788859132184;
        Tue, 08 Sep 2026 02:18:52 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48588135600sm30514063f8f.2.2026.09.08.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:18:51 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] platform/arm64: Lenovo Yoga Slim 7x Gen 11 embedded controller
Date: Tue,  8 Sep 2026 11:17:50 +0200
Message-ID: <20260908091752.5508-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7x Gen 11 is a Qualcomm Snapdragon X2 Elite (glymur)
laptop. It carries a Compal EF06 embedded controller on I2C at address
0x70, which is the only source on this machine for the board thermistors,
the battery cell voltages, the fan tachometer, the keyboard backlight, and
the mic-mute and airplane-mode keys.

Patch 1 documents the binding, patch 2 adds the driver.

Why this is not qcom-hamoa-ec
-----------------------------

The Snapdragon reference designs - glymur CRD, hamoa IoT EVK, Asus Zenbook
A16 - place their embedded controller at 0x76, and
drivers/platform/arm64/qcom-hamoa-ec.c drives those. This machine is
different: only 0x70 ACKs, and 0x76 is not populated at all. That is also
why the firmware reports every host fan capability as unsupported, since
profiles, trip points, LUTs and tachometer queries are all addressed to
0x76.

Binding qcom-hamoa-ec here does not work. It speaks a different command set
(0x05/0x0e/0x42), appears to probe only because it never validates the
firmware version it reads back, then reports zero fans and leaves the
interrupt asserted at roughly 25 events/s indefinitely.

The ACPI tables describe both controllers: one at 0x76 (OperationRegion
DVUM, fields FC20-FC2A) inherited from the reference design, and the one
this driver targets at 0x70 (OperationRegion ERAM, battery and charger
fields). Only the latter responds on this board.

Notes
-----

Fan speed is reported but not controlled, deliberately - the EC enforces no
thermal floor over a manual setpoint. Patch 2 has the measurement.

The DT node for the controller is not part of this series; it lands with
the board DTS, which is being upstreamed separately.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11").

Oleg Keri (2):
  dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
  platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec  |  21 +
 .../lenovo,yoga-slim7x-gen11-ec.yaml          |  56 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  22 +
 drivers/platform/arm64/Makefile               |   1 +
 .../arm64/lenovo-yoga-slim7x-gen11-ec.c       | 639 ++++++++++++++++++
 6 files changed, 747 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

-- 
2.55.0

base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
