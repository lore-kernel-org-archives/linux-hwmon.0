Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A13C9EEF
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172070; cv=none; b=Z2nj7n3Uta+eM/tNQtNp3jGvxGYNiNXjf/fTAuZSjl15MiILR/YZoZTKWAkmznCcalYNOwqYD43umtkRnBSAOn0dyZilLfNXswPLjUwLtQnh0YRVZpLbBxZq1asNj7/6vEbf3OiR3qZuDETjnZbmOP0jchipD4x5hIl+MxiNPEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172070; c=relaxed/simple;
	bh=QyXGOSCMhNFMYsXpPKcOvXoQAJoVbNEMyk1T1kn3M2g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jFL1nGTU5f77PzoGyMNZfSIEY6L/sPfb1R/SxiiRsLoEO7nupME/PZA5iI+ouU7nutSRY5iC3cCbL/s6VXxoScQCRjAL4D8SdRFPC5jkz39+ld5yviEODLQkPIG+s3/1w1y6iAszwdSbZe/uefCjl2P9FcnaysZNNbmngmxkMeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+vw0V7A; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+vw0V7A"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84234c83142so3277824b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 03:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781172067; x=1781776867; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9BCmmGp98tP7vpTLYAGl0cPpmP2dXSe3pZaGWlv+WcE=;
        b=M+vw0V7Arx980+SHOfNCDSyqUDQGKKH5ZyYMPwDXi+Av/pP29TOjOe345/oYvKhuNe
         qq3vrN/6m4bUo8SyLVasCFFwBvbYnqXjJe3K0VqgF/GL8logty/gXdMybfRGHFFEtEWM
         r4l1C0CbuRTPzDGDieiemeU+60uOPlKmE34j7dkxJvJLHJ3UE+N6g+UvEFZAv+gkxV9/
         UGJLKqUT/YExjCTuA3X2XYdnNGMD9lHDw5au1a17bRJYBjG+7KsBfs9btKpGbALzmhzL
         aYmNdUDD0T7a/NntfWdGh0FeqCokacocBTNhZdl6G2E5GzMiW+ySsc/KA6+3BSHNQLkk
         EHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172067; x=1781776867;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BCmmGp98tP7vpTLYAGl0cPpmP2dXSe3pZaGWlv+WcE=;
        b=mIYlbB8xa62cia+2K4LTpiRLDHQUbhjdUS9do+UeY2b6nYLmv0pZPI2nLRjpMEXinJ
         FnL20T8WuLn8wwkTH6eUYAlRf90wn2hheertktBLdpR2P54FExCnrFKHBlLU3A//jiet
         wbZt6F1xfKTTVEpHIQLO/a9Ke5mIJVP6Ix6jbkvdZiUYGdKzjk0/c00MoBzPfUCpZPA8
         uRuLMzqrIeKHUfLYT23aDPAGrj07Ed8AogjhFAda2yVjHYTWFhOe5vaf6IgaQH4izklJ
         ApHgCxh/kwoiPTOJYGB+1nzb+eJs2p9g2CsACHuzAC9+IFb+9QeqYLdIl2nHNkA6XIO8
         oBqQ==
X-Gm-Message-State: AOJu0YzQCyV8OZEj6sldWnlnZVTqqbEX8If2AVNpDdoN0N5sxreBct+f
	NGjVs0W6TPnD6oJUGf+AWYk6iphelPjcW2XU45TnKffm3OiZe1eRROQ3
X-Gm-Gg: Acq92OFWxT5Zoqg0xt9gaXgaNf2y5ENbgdpPiCh59WjjCO40oSq5ZlwzA4BodbVR2h5
	rxkz0WrxSSupRuBrTWun4btACXIKbGNa6lOl/IZqm7F/lPW+88CIeDm0S8iBM+ZcKSVX+uKZMEq
	wK7qcvLNC6gB4nR06sKf7oMWAAhHJtjGtHleSQ3gV7tkVtohncR4eE9B0VQHduMnZxoZsPN64+R
	dZnN9PO3KQZXCdzP9+2LHNveRzCf1hLXXPxUv7/RQ6nnGjuJO9ej1bZYqESE/ek740MXLmhDKwH
	sLYrtImykWH8Gxhrutb0LTaXnNES0aFSv5Cx7JisFCG3XTb7nLQio0HarqAedpBzQh5CnzP2/Xe
	WmFNSRwvbv7DCT3wdkrk3f9OwAz9bePjpnMVGaVeHJoDg+Jl9X21Lk4mHe5tbSSbVnB4md6dO8c
	4miG1P3A8rWPZnhKIsvOJfBG1VPLJw2Ir4KmpefNExLnc3fhGe92xL8bIWdivYxiOnBCltIAUdO
	hR5Sdc3ksOKtZA=
X-Received: by 2002:a05:6a00:390b:b0:837:a211:4ee2 with SMTP id d2e1a72fcca58-84336df7ea7mr2358672b3a.38.1781172067225;
        Thu, 11 Jun 2026 03:01:07 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c92edsm1458228b3a.32.2026.06.11.03.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:01:06 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] hwmon: (pmbus/lm25066) Support SMBus Current Limit
 configuration
Date: Thu, 11 Jun 2026 17:58:43 +0800
Message-Id: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANOGKmoC/yXMTQ7CIBBA4as0s3YSfgJYr2K6UBxwTEsNtMaEc
 HdRl9/ivQqFMlOB01Ah04sLr6lDHgbw90uKhHzrBiWUFVZKnBdlhLXoZ/RrChwxHOWoTHBaO4L
 ePTMFfv+e5+nvsl8f5LfvCFr7ABw/BZZ1AAAA
X-Change-ID: 20260611-lm25066-cl-config-f81925f7337e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@qunatatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172064; l=1224;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=QyXGOSCMhNFMYsXpPKcOvXoQAJoVbNEMyk1T1kn3M2g=;
 b=Jm65z9PjYXe3Kw48Woq8SPQDkDDjqvOdDF9/YhrKoC7y4aPXtJmIBWK8ovy39qCX2XfhAqhfi
 aKEUvgX6l4wAI+m0Rh/S1aSRTirdGLidQT/Envcn3fU8BIabB15F5vs
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

This patch series adds support for configuring the Current Limit (CL)
behavior of the TI LM25066 and compatible devices (LM25056, LM5064,
LM5066, LM5066I) using SMBus settings instead of physical hardware pins.

The first patch documents the mutually exclusive Devicetree properties
'ti,cl-smbus-high' and 'ti,cl-smbus-low'.

The second patch implements the driver changes to configure the DEVICE_SETUP
(0xD9) register based on these DT properties. It handles the dynamic differences
in the CL bit (bit 4) mapping where LM25056 and LM25066 have swapped logic for
High/Low settings compared to LM5064, LM5066, and LM5066i.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Potin Lai (2):
      dt-bindings: hwmon: pmbus: ti,lm25066: add current limit properties
      hwmon: (pmbus/lm25066) add SMBus current limit configuration support

 .../bindings/hwmon/pmbus/ti,lm25066.yaml           | 20 +++++++++++++++++
 drivers/hwmon/pmbus/lm25066.c                      | 25 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260611-lm25066-cl-config-f81925f7337e

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

