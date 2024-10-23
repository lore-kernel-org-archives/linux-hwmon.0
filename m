Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F229013AA2B;
	Wed, 23 Oct 2024 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729716742; cv=none; b=Ieup/Yw8PuKmC4C2oBumuq79pm89KbM5sA+ldJ3xDvOITD+pFDiRTJ5A4ttJU83xEoUXmwxACvqV8eZGx09L3hLC67xyYpE0R8KULCmIDfGedhkzXqsRGBn6Op/vUCQnSX/FVn6r9/xQNLmnmPWNTYt1nVYN1uEEzYQRZECcvZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729716742; c=relaxed/simple;
	bh=6Tb9pV9LKWRPVhJB94rtHiF5fsrInY9eTzz7D4KN0BM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvvyiTsENUM0GpDBdNC2EfOUR1tW/8xwWpPpkpprVr6ZwpFdK3myIPM15jMp+VGhutJ7naxHaR8OmoXcPsmegEr46O1dFaD4KDxox1I/uZOOrpsYEH/Fdiy+jfIwFiKG9npksRAkNGvAJ5QtoAKRRhSWbikXZgd32Y/K8rRcm0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AM6dabTf; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM6dabTf"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5eb60f6b4a7so53759eaf.0;
        Wed, 23 Oct 2024 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729716740; x=1730321540; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jbKCohA6TwC7UhYKQo7aMkg7DeKcY9uJ0EDFXngfwA=;
        b=AM6dabTfDFALbRqEKceeJFKANwrP/4CB2y1ZUHqFYJWIu0hFBTlfjzWt8l5aa/GCja
         ajh1xUyj02yOnq8C44kQFsGZACHf7DBwx5RIgAVlMw5hc//SP5is/WJREjGqYvHFsAZx
         aeaepHkeyYEAIka66tfnovEW6JfJCXHmX7yX/BfnOD7U9+N8ltYGRxGerYBLTkR3dB2f
         r0nuNKzpKioSMZkiS/xgAVbzL+s5q13DuyofgHGCS8H8D8LFcE7arEZopiIGKfB7NL+0
         uBlJyJxXsTx61Em8jim2L0UkElivsXm48TfG7WQQt84qDaHp4lD6WM2JnNa5uV8CiTN3
         cfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729716740; x=1730321540;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jbKCohA6TwC7UhYKQo7aMkg7DeKcY9uJ0EDFXngfwA=;
        b=c7/Lsq2LGy0LAMiIKXYP8Pby+FVuV7nP5ZueBh0bA1LQt3JwETsmkc5ob+Nozksj38
         0yJhob5mq3tWOlVw8blqiScY9FfYxUmS+mVZpYSY+IXisf2CEUa+6w3/vJ1uUvigwznn
         y64F+Atq2NjLlbybUN5+Ztorox+de/IPDeprznImf+rmN0HYbBUnTLzNlCnjvqBqbbMW
         FhnnRr5KHC/3bvvnh8Sz53WFkcAB8LaR0fVDxjg4V5jHpb1dr4Uuc9YEE/qS2UemfOKQ
         D9Bo550poA8m0E0aVh07fRnFcz3V+uqMLEeUPBoEozlgwgGDOfsW0llWQW2WvQZpiEy9
         kptg==
X-Forwarded-Encrypted: i=1; AJvYcCWe/NCLJ6kN0sJ6Ztga2epOdajJ8NjB3TIiJlHpNNYsQrn0hKs9Hjp1wJ/oJp9UQmHFJXzK5hLn1WFw@vger.kernel.org, AJvYcCXLayeMvx9DPBd9v6vvni4nI5EelhOM8FueYgU8zVmnPJgNiUm5vutmYarRP10AzFfiqpJqVXVhun66BVg=@vger.kernel.org, AJvYcCXW7tqtpGZlmK+KMzC+XhuTrdYFMfgaUH0JtKNPDCZfjwyzLxtN8x//WPluS4Evvnwkoga94BfMQ3HM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8K4CmHowIBbM+nHfEXIPvEXalx5UpF+DwiMNOIno02aESt8Hx
	z7YORouIjfxrnsdIRjYvlmTTatRgDoqCZ95E5wR2UaiMC/Pbx/4v
X-Google-Smtp-Source: AGHT+IHV0IpveUxQDGeApYx1dNz0WIaE6DawoHEQ3wydp2sgV6+/FNxfzLeaAihAF5Iqj0zjtmD0qA==
X-Received: by 2002:a05:6871:706:b0:261:7c5:f018 with SMTP id 586e51a60fabf-28ccb3a0246mr4158703fac.4.1729716739817;
        Wed, 23 Oct 2024 13:52:19 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7182ebd5ef0sm1855407a34.60.2024.10.23.13.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 13:52:18 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:52:15 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/2] dt-bindings: hwmon: pmbus: add bindings for isl68137
Message-ID: <cover.1729715599.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Renesas digital multiphase voltage regulators are capable of regulating
output voltages that exceed the range that their Vsense pins can detect.
In such applications, users may place a voltage divider between Vout and
the Vsense pin for a given rail. However, the driver currently has no
way of knowing if a voltage divider is being used which results in
erroneous telemetry being reported over hwmon.

This patch set defines a devicetree bindings schema for Renesas digital
multiphase voltage regulators that are supported by the isl68137 driver
to allow users to add voltage divider definitions for any rail powered
by the device. This patch set also includes the required changes to the
isl68137 driver to enable scaling Vout/Pout telemetry for rails with a
defined voltage divider.

v3:
- Report and return errors reading the vout-voltage-divider property from
  the devicetree when the property is defined
- Change u64 division/rounding operations to use explicit math64 macros

v2:
- Fix devicetree bindings schema errors
- Add "renesas," vendor prefix to "vout-voltage-divider" property
- Rebase patch series on v6.12-rc1

Grant Peltier (2):
  hwmon: (pmbus/isl68137) add support for voltage divider on Vout
  dt-bindings: hwmon: isl68137: add bindings to support voltage dividers

 .../hwmon/pmbus/renesas,isl68137.yaml         | 131 +++++++++++
 drivers/hwmon/pmbus/isl68137.c                | 204 +++++++++++++++++-
 2 files changed, 330 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml

-- 
2.39.5

