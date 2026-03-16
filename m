Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901D384231
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650411; cv=none; b=umiqJtnYGmf1iFL+LhCSmm++Sn7/beFLkkrX/a0gyqiRIscaFjQYUIPg/dBP0srbKoW+jvO4minA7tJCkbyF0UNKkeufWshe7Rw10HZDyNg5id9UxL7UmnW2bv2HVq1XMm7xraIWYJdLmmqr8Cl0HAfOMtn0vS+sQrCfqLb80W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650411; c=relaxed/simple;
	bh=RqDoIW7WugtGdMXzE2eIsOee9DNLTBABdKsQLGxjo/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXGVx4o7lDGmULWXMWEyHR5bJWhGOgkEdqbVTAY6MNvIMNkIWdvuHB6BC6NUXmElVVrPEubYh0fdzitwm5TVjpSVBwPgnK3QMAqjV+6yMFf/Md3FsuX7v+t5a+Ua+lXgsEPnAzDNnLj1Casg0h233A8BIayHB/vS5ra/dr28zcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PE9jzYeG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PE9jzYeG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so2424726a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773650408; x=1774255208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOAXNQ1o+ey9uPPxnP3jzFRrFOSx7L8yN/7up+eSyGw=;
        b=PE9jzYeGulKUydIB3wSH9fhXim+4KpvdXtAEea4zUNQuvWog7L7glTEMUi+UgmXYaJ
         knuqP2+ub/MQQ22d6a0oj66jTdoicscvj6KC88/N2Cuzq9b7i2NDclwDZJkBlI5npxTT
         55x/MBDoZHfuVbPHyyq9KJFvD8iKRsHA1mkfICDfFuTu3TNezG0bSjFovYpwSleDhder
         4iHd96BpBUwC9K1TXtZCSb4gIPurbO3oKdSC9IU//dKfEZfc9m5GC+tNVF1/Qc+sH4bB
         dJW/54rlVoUWop/xV/fVfdjLdGDSRZyBd2KgEo1EXvAtb9HrOeFAS+y8YcntjA2lUzk+
         YfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650408; x=1774255208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wOAXNQ1o+ey9uPPxnP3jzFRrFOSx7L8yN/7up+eSyGw=;
        b=cUmKRbDjV4RPg1ac0zIPhKnI46TZ/e28tK3ZlKA+DBRwvm1y5resgiReRzq/aNCm9F
         oseGf+zx4l58yPPKj5vd8R5MbSRtsB9EarAerpac3ew647h5rGkA0Joz8wO+Kh2hRC98
         XEogNsYX7HaSCjnYVFbJceEAuuy8PF49S4P4P1ard8GW+05Eny6Yy/HKkd3+fZCRks5o
         IRcFR4yoh+xAKgRYbSffCs57QtgxrsXv36tN5Bs22YD+eKq2EcwYxbdC8TMdPthmZcum
         03wxYJoOWRDBfKQGQ6YGP0VBSApdFmP7TmvjSlSGEcuoTPJ473qRLHveUGvWgCEyNLF5
         Xv6Q==
X-Gm-Message-State: AOJu0Yw7g4y49HyslRbQGbOTtyHpkn0HJyVcYMW5g+MKGe72iV77tiP9
	evOOLEbeMi4ecHEE6mClHQedBioq2mpxFMaCpYAPgP9GvdmnxvB4Mic+
X-Gm-Gg: ATEYQzwyouirm/zwNtRXMeV5f1OvRZ6n/WqTK1+ie7c8WO3ec/m8NOcuo36IPkts7HX
	kljuWMajPa3izg7nvPXcUcZ9Nq0deeCNqIqADCGXWTwSJBxLrYAhv3ByttPtX/XqVJz/smSYfjm
	PCYTxEKJqBSIT0/X8Pyqm8b+siI34Ps4DVsSu2QLvmnBn4HqiTUFvPVq+SAH8iguH5T0Vna9l+m
	0cTsoASUDwU8kViOA88Ii2a678p/fYs8jW2jAFuXhEbE/v2vFtLr1wM5tx3IhmNnZkk9XSN1tnY
	zNg3pgGBWUyu5oc9xNlFtRqFX2shvGqV68b2A0RnwnzU49UNGBe2VbzrbxbBas8qqLCRN72rGHL
	/32V8Z7RtHcnW53SFHZ0Ted7trCp1E7pHODs4WBGOp4+y07eBuIjqRe4hZYmRXN6bbAJ7HL6I5c
	FSH7Rl80PUKglibCS+fIA=
X-Received: by 2002:a17:90b:394f:b0:354:a332:1a61 with SMTP id 98e67ed59e1d1-35a21efb0eamr10430000a91.5.1773650407761;
        Mon, 16 Mar 2026 01:40:07 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0537b663csm45946865ad.51.2026.03.16.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:40:07 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 16 Mar 2026 16:39:33 +0800
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Delta Q54SN120A1
 and Q54SW120A7
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-add-q54sn120a1-q54q54sw120a7-v2-1-60e6182cc4a7@gmail.com>
References: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
In-Reply-To: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773650402; l=1104;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=RqDoIW7WugtGdMXzE2eIsOee9DNLTBABdKsQLGxjo/M=;
 b=Urz65Zd+H73gQS88yzQ3kRn4fLB+M4ty16QWNJyAuAqbd/RAkbZ3F5jmBxxcUPWOYaVRBNrr4
 Tg9lnLKT2OLAOhu4/M4VJZhMzGT60ktCu/X/JQN+0BPF35you6kXdYX
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Add two additional Delta 1/4-brick DC/DC power modules,
Q54SN120A1 and Q54SW120A7, to the trivial-devices list.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..f430e49b9ec1 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -95,6 +95,10 @@ properties:
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
+            # 1300W 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sn120a1
+            # 2000W 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sw120a7
             # Devantech SRF02 ultrasonic ranger in I2C mode
           - devantech,srf02
             # Devantech SRF08 ultrasonic ranger

-- 
2.34.1

