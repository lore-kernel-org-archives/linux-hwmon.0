Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705E3375CF
	for <linux-hwmon@vger.kernel.org>; Tue,  6 Jan 2026 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715441; cv=none; b=VTlNVOBG2HjevBO3xAsnwNXpTixidMonDlTCnO5GIivMw6MrvXFypoLPuI8i6ewRytu8dPXWSmEBswZKtxN77938s0huFLnbZjSLv6mHlDKu+QenXbOqB2XKFZzBcgCHVmYk95ZnXQJAUkGaNrItiLfn856e7ldntRU+XKXADwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715441; c=relaxed/simple;
	bh=q7ZffHMEJ6S7HH7Vy46Q9bG0ze32HCzvVz8NWmJuFOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTMKSAEh0A+G50qXfPr+HMCv+gVeCkxVL+CQ/9DAXEmRcvVhck+BuLjAM+Yf5MYMlSPAc0uOsH2mbzlwtOkDpbz/6YrTOXFWPLBX/w6chYePauH+xa7KQZWGYOltS/vpeXNYs1bCCjWAzL0aqq1XkhaOAmFmytakB1frCo/q3uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SA+sYJyg; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SA+sYJyg"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65089cebdb4so533475a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jan 2026 08:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767715438; x=1768320238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0luukR6GB0vtkreCdXxNdvwtnnCpUjD0tYf9hb5lzG4=;
        b=SA+sYJygsbjW1ueD7jOvHp3jVNB26Uss/b+NYm5ajaPA1L4XFcWlmPh8NIMIl4npW2
         sluo4fCrzvV7o3q7amlveuPA+6hCVbxi+2y6ZKmOe3aAhMk+0dp7wX1ypTP7kV6gUZxD
         hbQWEq11ll7oJD4e0HQkZHyYiJ/o+6MiHBqdpzKvC1nAjAf1EkK8MZzSJ9bleIUI/pgV
         aY3QafY7zFzde6V3b+zkgR16Ic2CNDyyY2uq7z5vu03vdFxqM5Neoi944iO/8SMu0FcG
         12BqqJKEg5OfJlqdsepHDpbGLT5Z5BuUrEHkbgM5U2bcIpwKZsDYqsEeiShB49aHSrjP
         hUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715438; x=1768320238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0luukR6GB0vtkreCdXxNdvwtnnCpUjD0tYf9hb5lzG4=;
        b=BJR+91mWOE/LlhFcjzR9ckVm4Dej8P3j8h7kqwTIZbr4T5S3tNb3KTV9Ib6aywF6/F
         QUw6A8HLE6i+CEd+VbrK8x3FdeV+uyWm/P39eJNpnvaY+oO9/PoFnmA43+OPOfA3v30L
         4FjPCHy+4/CEqGM1nAthbVOd6HCkVb0X2GBNjZs1IbmL2OXdKXwx/Ch5yHZsVz6MdCb4
         rzZEOa0kS6lzOEpfH1zMzh+PzdNi8UARXsPDYTd1WKWIvTGsERVBSIU0opeqzAe604ll
         R/qID9iBRTNSwsMxAp51IgtycnbRa4RZx5MJR0MinKgcCRWIUw8vmFhA/299gh40i5XG
         Z7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVO0zC88N+AFBxZ83eCjKhQEEwfGDtKrTXV+IejX/XmYSPbCFxj3+Ao5/cINVbkxVdJusRKMXieK+9bbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymO7LMpc++FeHrDKjUGDzm4n7wWlxn8fAtvQ4JBGiNte8hUCAT
	wjzAxjI0FzhmMmkM9639MF5jR235tbNyMrrN4SZnfGnzGqS0y8viG33K
X-Gm-Gg: AY/fxX4I+OVuvg4ITrN3uiiDyGnvSSgTwW0qAzv3LPog5JFn8T+Ymwb2QEkqrMo2klO
	/JjrVU4T8Zwe1fGePjtJZMS+QnSrEF+Ee51gPd0arGqPoW5p5En1t3DD8R3bPoA1Bs+1ajLNIED
	pUfw6lwBqnSVQIkkrYHZ5zvwqLBElPo9As7bZTk3rg1FaxW2ojnisksjIKnOUfnR7cWhvT7AdKj
	clYedAGL4C32UQF/bvAmr8W5471oqovpcbM6Y6iCYZAue06c5SZukpsjBXa/SDSc6xzcfG12QSu
	bapobxyvbdWd2c6lViYnK14QtXY5NZRuJkyTO1F38xtIkvSWcfG1uxkmJpRMXtTCvZFz0aTXrKY
	fZrgNqW5saWs2lLNVaikxA5P1bylOn4J/A281LBJW+Pk0cBkG/n/0XW1YCo6Ss+xQqGtcti5Rvd
	bY9XFR5j9s6qat9AYT6M3qcLo=
X-Google-Smtp-Source: AGHT+IGR9v3J89GSKErBV2ue+nf1hP2ngLMAfTwsJSEBW82CVZzOXwAEySuFK3GwjV2cHC8Zmar8wQ==
X-Received: by 2002:a05:6402:1e91:b0:64d:f39:3fdb with SMTP id 4fb4d7f45d1cf-6507932220dmr3241052a12.13.1767715437804;
        Tue, 06 Jan 2026 08:03:57 -0800 (PST)
Received: from vamoirid-laptop.. ([2a04:ee41:82:7577:80f9:d6dd:93b5:e2ef])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65ca0sm2474912a12.24.2026.01.06.08.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:03:56 -0800 (PST)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Subject: [PATCH v1 1/2] dt-bindings: trivial-devices: Add hitron,hac300s
Date: Tue,  6 Jan 2026 17:03:52 +0100
Message-ID: <20260106160353.14023-2-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106160353.14023-1-vassilisamir@gmail.com>
References: <20260106160353.14023-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

Add HiTRON HAC300S PSU to trivial devices since it is simple PMBUS
capable device.

Since this is the first supported device from this vendor, document its
name to the vendor-prefixes.yaml file as well.

Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..4864ef9bed7c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -123,6 +123,8 @@ properties:
           - fsl,mma8450
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # HiTRON AC/DC CompatcPCI Power Supply
+          - hitron,hac300s
             # Honeywell Humidicon HIH-6130 humidity/temperature sensor
           - honeywell,hi6130
             # IBM Common Form Factor Power Supply Versions (all versions)
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..fdb11141e597 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -701,6 +701,8 @@ patternProperties:
     description: Hitachi Ltd.
   "^hitex,.*":
     description: Hitex Development Tools
+  "^hitron,.*":
+    description: HiTRON Electronics Corporation
   "^holt,.*":
     description: Holt Integrated Circuits, Inc.
   "^holtek,.*":
-- 
2.47.3

