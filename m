Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD9672627
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011767; cv=none; b=XuYbY1IZa6zhN4nw8a0LzlDNdZ3JIeB1ufV+MJBnJxFTRaWsQnoklarw2sKZ4W4JcL7bvS0391YU9BxdTqib8VEA8jEMen7ajQ26ErGQm66evNR7oR74KkC91B2prXcIkObimqdbpKFYnsIa6NAZsuv/srxWMneMFTVdpXdkNsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011767; c=relaxed/simple;
	bh=zR3niyRBpiKpurs1dczTgt7o9pgCj8N5Cp38Sp6DFbg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M8OVyGvDD9mUKzX5VqTArb4U82QBhzcJ3270jqVY8JiBpAW62gBGJnEaIgNcFfsygpslX/EJH3/pILHmIRWlMaXuoSxiRi284cdGwcmxeouNmbbWnN1Ez6xH18uzHInhKAWNSw3hcVTeHOfiNX6L3QmMkQZhJX5py089Pd7E3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=f9oUVzbc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="f9oUVzbc"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-436234ef0f0so4378103f8f.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 01:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1772011764; x=1772616564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=33V8jmhyWf3FJayStb/RFEHOZof6HOLk7BpuerYJxU4=;
        b=f9oUVzbcNUaCCUp8szbi//rmmmtY3Awf0hbhSRkl7dXeOmzmgo7mUVVX0TB/zCOfZX
         2iiu95OzZSO/S8c7oFaYH6yyjZxfkImc2QKNq2ykOuoUw5mLGOM5N4RnXKCk2Ic3Aytu
         1cry6AlfWhtpxVk0ZwekJw736+LFvMXVMWiPcKiwUK0h8VxGrCyxPSUgcTHN7FhlaEo6
         OtPqf9TnIS4+f3cH4JFJMCwCfQwZecuB842drm1OShhl+VqPQauZIzbpVYfmQCPi2eY+
         AzwB3sAxVJdFLxWbYOUC8BWLfh3MHCgdeLKwPmYmKuXKHT8/bcKTAELovhzafXe7G8Jc
         +Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011764; x=1772616564;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33V8jmhyWf3FJayStb/RFEHOZof6HOLk7BpuerYJxU4=;
        b=Y6K2AT4I9CiLG1dypGANAxxw7pQnfWZAmHko2X3Zesm9UHqQ6ZcyVdCCR2fVGbPUzL
         xT6eE2ihOvyjdPrrvMiEyUVufcXbGzQ25LOukgdlCDOat9LB7gnxHgKhfjKcWNdMLONb
         mb+krKCb4R4mLvYQggVHChPLqLypyQw/rDTmy8gEHm+H2y5f0c+WgUX4H7fJgauxI/Eo
         uNeKuc6mhWB+IVzTTqgRrH3z5IPFAmIFUASlUQT2iontQkfp1Y2yfsGKJxJ7HTzGiNVN
         PxAwAvRsxWudyDAuqzbooAZ6yxKrVn+Fu41+GPLzZ/7nAP1IVl3a/n6QbDI63LKMfrXy
         Vzkg==
X-Gm-Message-State: AOJu0YwCnDkdXwvBEyo9MstJvGyfQ5bGdvAoXe1hj0NL1y/74s42mD3F
	63hz2wKXm713Ap5eHN0nvs3fv0guFCvtE1iyXjskmZcFaY1JfOvpd/zFdKJ563XmDaA=
X-Gm-Gg: ATEYQzx6LNQFmI1ECaDC4doI68c9goE7utByEZoaEh5D6/LywHyDcOFUjdI/tWCQP9Q
	5jXKMdP10arzWVg+PpD8dmqJYy+PvHN/Sqy5pyUS9YfbchWOgWMyLBy4Y+zL+ky7cdPouB/zGtU
	ofguh91AKj+kvtKK6LVTQ5JIMunik1F1sbIhSCYrdST/X2K5t3122Y5fctW7NNG1SbbyWSSG3f9
	5SUmgmPqIVzD94uWeDcG9HmDjOqQuJDptYb8s2vQiMBv0I8B+t6uw1YwcV8UeytdfpE9wj/V6DC
	XzT2UzA/Nzb8LLxZVMLNsR1ngB/UQgPwMT0sQalq74h2gL7wdVUxMkZwnaUMNWrPTLNd7O4Q7Xc
	rvYPTf4SyTDSXWOnXgM5nGKgnwkI6Rlqz9mMqWqmu8PyyYwzftUwJOeXvEd71RIgR55Ye0oug8X
	wlGNlQaW9YcX8NrqaJA09cB+1TTx4N7Ca5qN7poyZGSC/CpJPYuZqfxNm9Rf65vWf6Cj1OpCIYM
	d8=
X-Received: by 2002:a05:6000:615:b0:432:84f9:8bf9 with SMTP id ffacd0b85a97d-4396f194d4emr26153557f8f.57.1772011763625;
        Wed, 25 Feb 2026 01:29:23 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-44-101.alshamil.net.ae. [94.59.44.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm33027463f8f.38.2026.02.25.01.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:29:23 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/2] Add support for Texas Instruments INA4230 power
 monitor
Date: Wed, 25 Feb 2026 13:29:10 +0400
Message-Id: <20260225-ina4230-v1-0-92b1de981d46@flipper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAObAnmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NL3cy8RBMjYwNdc5NEAyMTA0tDU+MUJaDqgqLUtMwKsEnRsbW1AEG
 LzxJZAAAA
X-Change-ID: 20260219-ina4230-74a02409153d
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1800; i=alchark@flipper.net;
 h=from:subject:message-id; bh=zR3niyRBpiKpurs1dczTgt7o9pgCj8N5Cp38Sp6DFbg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTOO/Dlm4joA6XOiBMCgUaqj17He0rYbMpK+fjv/uf4P
 IsJ/VvXdUxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVf8UZGea9qJj75Hojo9LpPdOXJxxdfU3J9etbK4nrHyzaPHo2dpsz/K/o3Pb
 P84o215PHEtV749pXnEqxMlrGrSy71fSqyIpDAQwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

TI INA4230 is a 4-channel power monitor with I2C interface, similar in
operation to INA3221 (3-channel) and INA219 (single-channel) but with
a different register layout, different alerting mechanism and slightly
different support for directly reading calculated current/power/energy
values (pre-multiplied by the device itself and needing only to be scaled
by the driver depending on its selected LSB unit values).

In this initial implementation, the driver supports reading voltage,
current, power and energy values, but does not yet support alerts, which
can be added separately if needed. Also the overflows during hardware
calculations are not yet handled, nor is the support for the device's
internal 32-bit energy counter reset.

An example device tree using this binding and driver is available at [1]
(not currently upstreamed, as the device in question is in engineering
phase and not yet publicly available)

[1] https://github.com/flipperdevices/flipper-linux-kernel/blob/flipper-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (2):
      dt-bindings: hwmon: Add DT schema for TI INA4230
      hwmon: Add support for TI INA4230 power monitor

 .../devicetree/bindings/hwmon/ti,ina4230.yaml      | 128 +++
 MAINTAINERS                                        |   6 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/ina4230.c                            | 997 +++++++++++++++++++++
 5 files changed, 1143 insertions(+)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260219-ina4230-74a02409153d

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

