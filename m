Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A4C288B1;
	Wed, 23 Oct 2024 01:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729648597; cv=none; b=mHcMUpNTWVniqCnK+mapA6u5IjywAUcKd0QRS9ZWweoBRvzy/Yj2EDpJAH6VhXDmMYB8wFNcqhNA33mhDvp8VhUmmorB0FPpgJnMPuZIZnruqKt/LESTt4aVn0dt3SZsyjzUj/TXW3woSEmnHm53RwyKLCmQAMkc20WtlBP47fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729648597; c=relaxed/simple;
	bh=IAUK0VEahJTjzSPbOZWk90cpKmyinG/+vIVp3kGuLYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDoMoXjBhNMqi3oBO3wHwnMVYVWzzqS/TSCUeCkUFv/jaSHJ6aA9XOVEUCeqqXxpMppNoUAfz7Jv5aMJ7/cDCjY3g6ToFLogpQZcR/yZYSmhzW5ux+1MRT/PjN03E9xACAmj2TMMBQfgT8XV/lotzGgyGZFCY0jpMa02MON1tak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmmimBiW; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmmimBiW"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7180a400238so225436a34.0;
        Tue, 22 Oct 2024 18:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729648595; x=1730253395; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lryxNke7l6Vbfvt9icuGOAP07lXE4dYS2YWVkTS/VWU=;
        b=fmmimBiWLHG9F6iRYrEb7GHtvwnMuy5a5LN8shq4mxR6EctpTwZ7lStJOnvF2WC7Kn
         PO4A55RRNvlZfRyFYRw6S+DAx/NfQPSckckaZJY7NpoQ9mFWmTwBaFvDb24AfRdgOYUL
         pQ1pLXI9Pr/F5Dfbsfr1Tc8DyaiB0LNTh/K6Z+DSapXRQDJhrzIa3OQ/3J4OK6akyJM5
         GdoD75REeKY/TY+kwtlY7kQlDCBoDs1qYPStEnaegzO3T8z/hbm8npv74fg0VBfqmi4x
         k21bH6dQAn6zABeZRZYchziGvfjp0r9Nt+SKXw2EH1QtAL38rfeJRE0kdsqAgyliHyfg
         vpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729648595; x=1730253395;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lryxNke7l6Vbfvt9icuGOAP07lXE4dYS2YWVkTS/VWU=;
        b=AuU304bNc6cm3kY2NwQdVg+AsdoZyBhPFkFVRr4vbEVjgWPom/bNflGjsnfDuPfz4V
         muVFTfb/uXqHbD7xtQ3lIdsQl3rjjN5xuxlW237H+PLE9bwxYNLx8C0Y+ZoRXGqKHeO9
         pnO7Wh+a8mt4iAUn5TlXPBFrxr0k4/Xkt+22hLG1E14SqEx+1NzkPLnDW7s2vAgi7BNo
         Lcv3DegycRY0CVB4SaPY00j+pzDCTdl7Kl5m9R7GYC+JdMCqyByijZToWW6uZoG84caY
         Na/lg6easxmWozyFfyUJIQn9HECml5ZdpQdRw9Agbre7LxxT2PFPtYvUHkbDD0UZ+flO
         M1YA==
X-Forwarded-Encrypted: i=1; AJvYcCUWIHdiWGe52/qx6kmLxHBEsC/kHVSjFXu/AwfzdJgVK0ODZU0GjmktIK9v6A31ZY/MMlmBsf6m6LkL@vger.kernel.org, AJvYcCVkPn8L3C+dwi2XHx/DfgG3CuHhYrz77YghxnvCLE9ON/2B0xd5NOVGverVN5GqusRN5YpsrWeECA0Hjlc=@vger.kernel.org, AJvYcCWR+MLmXBCzb9ZTVCKpMInTgKEf1hHQCBpXo9U+sHy31MW0zZ5QO4kgSBgYWUDGHapF5rEEXRbPiq7R@vger.kernel.org
X-Gm-Message-State: AOJu0YxxTEgScB3FUZK7WfgLcRaKrzauKOtWUWmjMOq5if32Yn8icoWF
	kzeJhFn2yEuhKVvkRupKt+0lyEKOvMZbY5WxV0pjJ5/Kyn55ctAqCiOqmtpd
X-Google-Smtp-Source: AGHT+IGlxT7b9CB1+rkoHTvPq9Drly+sr+w44v3/RH47irq/KE7gMBdh53fMvMHhGR1848P3qm+gAw==
X-Received: by 2002:a05:6830:3c05:b0:70f:7375:e2b5 with SMTP id 46e09a7af769-7184b61a3f3mr626460a34.6.1729648595063;
        Tue, 22 Oct 2024 18:56:35 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7182eb5274esm1611732a34.42.2024.10.22.18.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 18:56:33 -0700 (PDT)
Date: Tue, 22 Oct 2024 20:56:31 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: hwmon: pmbus: add bindings for isl68137
Message-ID: <cover.1729646466.git.grantpeltier93@gmail.com>
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

v2:
- Fix devicetree bindings schema errors
- Add "renesas," vendor prefix to "vout-voltage-divider" property
- Rebase patch series on v6.12-rc1

Grant Peltier (2):
  hwmon: (pmbus/isl68137) add support for voltage divider on Vout
  dt-bindings: hwmon: isl68137: add bindings to support voltage dividers

 .../hwmon/pmbus/renesas,isl68137.yaml         | 131 ++++++++++++
 drivers/hwmon/pmbus/isl68137.c                | 199 +++++++++++++++++-
 2 files changed, 325 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml

-- 
2.39.5

