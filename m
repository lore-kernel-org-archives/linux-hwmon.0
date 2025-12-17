Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF094246BA8
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Dec 2025 01:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765935556; cv=none; b=BaDz0Ncl9xLKQwhtzm13r5Oh2bmQ7Z+3wknkvvU3TDcvsOVLtViDjb5zJicw6Qmk9p75NhpNx6TKGObcamMRxM5ZpdCcpZSIYvOEhTeqmUs+DDOYmGTGpzGf6EXda6GYepRSATamU6skzQRSsChLtdqJgM9/sgoBMMj1sFkz9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765935556; c=relaxed/simple;
	bh=R6jMX39u/0CQxF/rkw/bAQHe1G/ZkItHajamaxXa8nk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z8dLpZsCTlHzYBV+XHtm/NKEckBVuv+niKVQQd1Drl5AxNNjJIjcRbcsY/zL53as2wOxycp6NF2ZIclcOy14QVNeuZQZ6dL1pu9Hlg+Rz+Lh/5NiKYwXSHMMAhDGQRt3FTqXE4obQLg+52ibR2qKjUKnHHrfFk0TdjqCNPwqX6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VA8WsRox; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA8WsRox"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso4336748b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 17:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765935554; x=1766540354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f9CedbWj/VxecLLqFPg0ZwXqr7AQFdUN4BSPdMlplM=;
        b=VA8WsRox+9cNHvvG/3Dobz59CiOy/kvM0xbe3qo7AztLvVvYcSjaFiJu78XfO/LQ1x
         NyrFjIZ/D3i5FnOAyN3UG0cqriaA54xhey7flALykDPmpvViYqpCo73EwyAUcdL8G6YF
         rmbE1d6jJDGdhU5NTEV471fWsIV0125LjNoIgiUuTDk/GLbi92eFYuyJzCN6IOlJD8if
         FQMsn6QrTMXxkc8baDrZ+rMRqGkEvh4eW0VMEpL1Tuv9dtk/Y/Mw6iM5aa7kBrVObzEE
         I4bwGgnvk9NoUmJGbNaCiAKByFkckIgHrHDVcmWTRs1/7Uy17ee+is5O477nni24L8m9
         oFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765935554; x=1766540354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6f9CedbWj/VxecLLqFPg0ZwXqr7AQFdUN4BSPdMlplM=;
        b=GcIGqFdZpK4rat+a43Q5YQHgNHCzM0mzUnqoKsyJgCo6izGk87aPeDHUL2Atlx5R94
         ZkMGONMi03K2fSHzCLvX3wybJ3wkmcLA6yKey7WB0YuIXaCdhkyi1K9je86wT75s8WCA
         8yHukk21WOqjhIYvHfNdgI+STvp4G9hWX0PrmlqylGvapVMf9IZwc6Hii+MtBkuAwFZl
         5AFOeaz6LGVGIHEHhFR2j90tbdv0uGw4SPi4G7KgiXWsq9cAh942grgMlJTriGaHmabl
         Uz3uSMMeaGx3CFoOEOoPwC9HiFKOlLYmEe4RwpXuwWLffGc6jf8ljTNwbA7vDj9hvD/R
         HsZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy0G18FRFVrsuoVC3fajqNZw9ewnmHbV8OHeMDVAnCEefK4YAeWf0SSoVPPDTPdZiPGas30PxsnMEBAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHYhGRvxF5X8pEkDMoAAkiIz9qAeoZnO+IL4fmMnKb+RpfcJV
	PaZ80nfl5IskacflVeX5fGjBnbRo1SE4W5YV+bcW5KJiqz5Yy5KVAulM
X-Gm-Gg: AY/fxX4dKeJzyBT3CA+Q/OlV6300kC3KnxxgUAZECeYdhxsuPwFcEiW67+ma/1X/9rW
	nAz4r6LXWH7XPOsJr6btTx8V9qvFE+fwvvqhM2LOis48YkvNXoC29RsMbdIe+sChKSJDIrGWrq6
	Y+Ad2+m73CLDx7fmwfGaidX824UUKTAdfuTEo6YERTtMaE9T+8oBlrTXFTNFHFaWfrk0KON76I3
	0PQauise7C4/UlfVlh1MDokVTm126M3CoaeBhd/NSPvOrt3+pgCnLGek1BC4DoD0tBI/2FOakNV
	Xz+X1IOC1vXUOD401Wo5BH9L5RpAC2/XhkDuC2jI+1yGwmh23SKiL0n3ViZoZy23gC/630PvNnO
	1g+BI+zdXowhXPEuOvjW2R9p2RguKlV+hcyOJvqdVq/sX91LlpbdkfJfzq8+WwNdmo9GRg/5lt8
	G6j+vPrTtvikSJ/AcdNNNAnBAx6vdmwGTnsvPFByGbmArDhpX6dewoBeg0NfuXoFB+ocPt6LgeR
	L060+W2lfZa702LJFPcrPykI6EMfko=
X-Google-Smtp-Source: AGHT+IHC1PmX49Nhr1j9GF4FaJJh5+V4LVlVLE+blOGOBrHIA61KxCF/FTIxhxyHJMZ8rLpffAUF2A==
X-Received: by 2002:a05:6a00:bd5:b0:7f7:2f82:9904 with SMTP id d2e1a72fcca58-7f72f829a23mr10292444b3a.5.1765935553990;
        Tue, 16 Dec 2025 17:39:13 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb8745633sm848616b3a.5.2025.12.16.17.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 17:39:13 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: add STEF48H28
Date: Wed, 17 Dec 2025 09:35:43 +0800
Message-Id: <20251217013544.363715-2-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217013544.363715-1-hsu.yungteng@gmail.com>
References: <20251216083712.260140-1-hsu.yungteng@gmail.com>
 <20251217013544.363715-1-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the STEF48H28.

Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..7ff5b1dbe61c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -416,6 +416,8 @@ properties:
           - smsc,emc6d103s
             # SparkFun Qwiic Joystick (COM-15168) with i2c interface
           - sparkfun,qwiic-joystick
+            # STMicroelectronics Hot-swap controller stef48h28
+          - st,stef48h28
             # Sierra Wireless mangOH Green SPI IoT interface
           - swir,mangoh-iotport-spi
             # Synaptics I2C touchpad
-- 
2.34.1

