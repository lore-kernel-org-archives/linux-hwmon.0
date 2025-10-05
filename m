Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2758F1DFE22
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Oct 2025 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759697467; cv=none; b=dsnb5A/EWN/i3HlB25TRzjFdBQBQh6I0MVVpmKGyLTIz5uETdFl3vA0R3T4f87J7AQ44LAY4UASdz9zgsSS1IW1xrV5c4XnErfDSLpDeUClY1jjDgb1BzuOnJXvp1nXL/IWKzBZnrCZmW9sgtGmM2AicBFT3IyS4lggO+EnTRXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759697467; c=relaxed/simple;
	bh=sGOdOd5lj8RNH7bLfh4PeOtHP2wnFce2PImaX2QQu08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B87wuCnKxsUXqvQaVV/yz4W6Iu/O6lm2yxeZRkV/40BneDtOyRtWx3CKe/87XgQKVsmR1NJ1vn3IftEU9f1xY12lnbVSs5cJ4M0MxSr2vmSWsICBuKOy0yrrYEQvEBAbzGpQ5e1/m3N4glfZZcMjE6Y8r2UnqIDCUOQnWBmHFYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivFkiYE0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivFkiYE0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-279e2554b6fso27703595ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Oct 2025 13:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759697465; x=1760302265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0PulYaesouydzPIXRseNOAbBXULJfQ7jKlImAk9vNY=;
        b=ivFkiYE0o7K4WkX9n+kh+TMo6ZOgNr5RZ8iLOHOHvaKgNiLxAFoS89nsKO2uUI4fle
         DsAojqYYYJELjUOYB9P6x0Lprx6iXYKY3R0hC1R2qOe22COgS7LusomQYxJUeMOXZn/O
         rHKmSoj+ZX6AWQkfXd0skCaEXYHytFatdKmtAU1tq5piM10EP+6CAMi3bzglYPmvzvu4
         sflASavVE4od+IYZ0DZ89Sbwp45wp2Z7eSF8IcOFDCPkuQmwNazm+KycIf1xbRkeiMJ1
         SSHiOIThzXSnyEPZnnadvvbK7iwMobYBLoXHDN6IUGR3HCoEpEMy5JzSK8LLC5SufYBd
         r05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759697465; x=1760302265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0PulYaesouydzPIXRseNOAbBXULJfQ7jKlImAk9vNY=;
        b=NBpLWB7yHFjMknYH7DlijHE6ppkt/4bBnTy8UtUG886+1JHvKB3HIx2weScHJoTKtZ
         yyHnmgcEenZDpnFf9fADCOoZSbFcxtE4E8CLMuUftD9r/ZgFBlbaLXwyLY7osBu2jn0S
         PYAdpG8QIp0aWrOkmhNLymxcxjJiEpVFGRlM/31Nvzw0AxhMOmg+9XOnCrmPwsYKM5IL
         F1nlpzdJ+ODPUfANBxd/Y77fpyL8hoein/4g596CR/L94Lce7Sxfj7/aUIiv6vDzJVv1
         lHkLVn6JLy13swkjaCzJXkgCnsCJjcWK6zToKd6gZlVip8Hv8Zd9Vxn6bpfPbZRQ1Rbx
         xIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsuyd1VlaPJIN56yVEcbbUPQi7WaANBS/RpQ05ADeR70g6Go9N6m770/KP/UPBGlFU0Hx1MEOXQWivug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/wclAJNTIqO73muLZLEDGz8FcUD6l1fEvttrb2PRqFZkibpQ
	K8A9MjtMUf5jxp7aUfnEQKU2jpw66q3UJvutk/eOtnVt+sYeFIbuEe6wTe4uXg==
X-Gm-Gg: ASbGncuOtEgO1D15onqlfRcnjyYuzc9FGKvEbkfOPNwwE/G3HwxJgNMDseBoqOhVHZs
	N8D14ZmsDjn17ZaGOe35QOChsuTd9YaxJ9yxslSGasHnV+XtoptGz3CwX9Ccspneqe6UIIvnfz/
	R/Os8XkQM5hhskwqBhzcgBC9rpXg+tw+qEiNbrj4mZMiY4bKNkQEgAPFrFbI9A+7L8rmn35UwEi
	u5CbKA14ClbU2nZJnH9XPUbTUUW2tB6rY9HXODi94R1jLX5HERNJp1QSBMjjYgTqX+GvnOpMztM
	C627bi36HbSICK28II2irM6/7QNdQ+8YMywGzL9RXIJOLKMeiGf8WDJe+NnpZCq41r3S8sbtFRM
	r5SB/6uTXtsYJKHySPnVWXg0TG7Q2NNMSFaESvq5N8DroP8C9Gze+KsaEG018MmcujBa5CHS8Es
	HGUwspq7apsYeeBcFJL9YdpYXx+WYv/CnpM83rxhrFiB3HLIRqR8O9zZmmGg==
X-Google-Smtp-Source: AGHT+IGE6psfDyF/tpG5iD9+AN4sMGtubuFXdijlLDL6L8UyOx68nbT2vXp8iohVZVMCKB2D81UvNw==
X-Received: by 2002:a17:903:1ae6:b0:269:936c:88da with SMTP id d9443c01a7336-28e9a61ef1fmr103838395ad.41.1759697465228;
        Sun, 05 Oct 2025 13:51:05 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1267d7sm110498115ad.49.2025.10.05.13.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 13:51:04 -0700 (PDT)
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
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: add mps,mp9945
Date: Mon,  6 Oct 2025 04:48:54 +0800
Message-ID: <20251005204855.190270-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for MPS mp9945 controller.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
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

