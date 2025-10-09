Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F0226E146
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Oct 2025 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760043429; cv=none; b=ur2vTJRBBFZyk8gvYjnzn0buYHDzXGAPGYeYpGxZhNkTkQc73MBc8qJ3NRN8/uV4sSBdhz0NpPGKjzQ+KEX48O89B5ZI8kCxD5pwpNHFiNtXQRaS0guceNnMDnZfOqc8QhRcchvklYqHJhzQzX2nOCU32uUOBmuPVdbKDtD6Lto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760043429; c=relaxed/simple;
	bh=ObtF3qvZv5wx0HantbNW95jKmTegeqMeLEJQ423Ulbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oKmZ76V4zL5ZKWOtDSaQ08yj72NiYd8WAWizjuSY8BGoZnocqDVLabh77Ztvwv00Ipzn1lqyPnKuJsydUdmUn2g+iT8PtncywDbnxvy84xzvaNB2g3t4WhAhoc6j/MLgfwZTPOCT//QJ9snugakZAk6kTY2lxLAvXWAYAjzCb6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPf7iiPi; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPf7iiPi"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1411180b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Oct 2025 13:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760043427; x=1760648227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0U17ptGvtCie7i1raH5xF1gZt/QiHby33L+InxvW2qI=;
        b=VPf7iiPiILDRrOMe83p/ms9cwU3ADvhImCtferxs+d8LPHkrN1Ga8KPeIXb27jgpCo
         ouicatJGR2xmBeXHxRjKuzm41ps4nINCpHA5wvDU2DDsYdCwqDxSB0pgnB9YIZV4g/mI
         FwPo3ZzDcZjjv3P0YmeJvxUOpseITb4m4NEu7Lg27G8Ay7YUUAH7QaPBfXlRe849OXEC
         z8afHGUQHXSxwBpPolXNEp3h8zIH7nGDZllsBAV2a2V54iPbmyCdF5Myvb4WXoFna4sr
         S4Kbhd1aZH3a6M/OtqXuiRnJYs0oicZ4uB5XRuKcUD0yk/v3jMwn5ouCoNCZyZsvf7DR
         jjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760043428; x=1760648228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0U17ptGvtCie7i1raH5xF1gZt/QiHby33L+InxvW2qI=;
        b=D4zyNX9rYBiVXi3Wsk8vuLTgyXB62H+7AC0yxiWyHaSnDj8k35pZfoP2VDoXq7qnwZ
         WXG3SMFNidldXbKmJySRSNbL66EG/cyWfEZa8bI+tjsRtg77ALi08P/nAyDnXUxkD+oc
         yfgVRRzPbOu7afB0VroVmmCM9Xx20TIY3ynUmIfu4Fo199hjQZEYNmDvs2Ge8ZaVTNUa
         VW+9cRXklRfOARdIVhQocqP5S/IrVKLc2nG3XU6tLArmNSishIpbOhMfuV7KAzmdbfas
         2WgbcPTeoliTuFVUFiRxgqgWdy/XwCoHGwKJEsEyy9JuC6XBkCA1FowBQJxUy6zDYoeu
         Ue/g==
X-Forwarded-Encrypted: i=1; AJvYcCXgHXxcRLB8br8LGub/BbTdqyF0Y3z5vxZY+3qbNmQ/GrDg7qr2J5+6YX7q6Nuhi8nu1jZZeBXnXMqTqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjsIUqAY2bTf5/hCiLyrqw6lIUPLVRa2c8C8qj9La2C3HzA+Fl
	ofrYD2PxjFixgkMF6Sv7dEYKuYIY7SiB8WDGun8gLERSdEE+GHjKwYacPjTMBg==
X-Gm-Gg: ASbGncvAUf1bzBkMhC/oRrPSuAap2di0GHiPOUCAHYGW+gy2Q7nI5SAkDZW3iwn10dU
	EijOy1HtTYsNCIkPJEg6ebNfgJm5XCzUGgFC/mlxePVCnKT+KV3bxbcvWJe9aANf3eh6dcCV06/
	eNIgOgGt9q2aSMNXUipSz5wBvfJG23iIs3WE/SC/NWiM2wOP+wogxMpxL/9jtpwqEFEykNVXSRE
	JEysvpirpkYjCRE8kVqSW5cab8eFP8eVhEZpFsjt7A09G+3DfF94Lhwke/V1OC/zJVhPF+z4lPO
	1ZmHLrkDd23oisAqTthlXzBYkqCkesCSHXzHAqM5L6hOmoU5EJkoN3tvdBCc6bxYfiuhuejDEAR
	iaazJjFG4nop9IMy5QHABC3JbtQhuer82HkqIgl3/7rbtvtv+JTR1dPUjLdv5rDmX46TC0WrrO3
	rqHy4pgJQ9mal9aeEz7CE363TiS8hWTFuQdPNF2w0XHtuY48IRQteb7L7x/Q==
X-Google-Smtp-Source: AGHT+IEQ3CQYxnXD0r7zcZD/W4QYBcUzXDWpnIYyhdFQwzlX1UxVe1+oMTH1I901zaf2ZfVIMH+03Q==
X-Received: by 2002:a05:6a21:50f:b0:2c6:2c4c:fafa with SMTP id adf61e73a8af0-32da901461bmr11185277637.28.1760043427345;
        Thu, 09 Oct 2025 13:57:07 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61ac8d7fsm787678a91.21.2025.10.09.13.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 13:57:06 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: add mps,mp9945
Date: Fri, 10 Oct 2025 04:54:57 +0800
Message-ID: <20251009205458.396368-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for MPS mp9945 controller.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
v2:
  - add Conor's Acked-by

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 58ff948d93c9..08e2ca1b573e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -317,6 +317,8 @@ properties:
           - mps,mp5998
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
+            # Monolithic Power Systems Inc. digital step-down converter mp9945
+          - mps,mp9945
             # Temperature sensor with integrated fan control
           - national,lm63
             # Temperature sensor with integrated fan control
-- 
2.43.0

