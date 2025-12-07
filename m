Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9557423507C
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Dec 2025 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765139272; cv=none; b=E3hilOoqIFhEWXr0MIqClzB4qD88BWsaYKIAEJsZBKZ4D9Za1XvUYUbLb9bnukPvcD/9/Z8xxuCnTEgS2RrUHPdP+TdGo79Y9zMOuTppRePIn8WsL41N04I3xzqCSHydYMKdPgEoHOq3S5k/Wf8ri6yBq11OpD4ZCQEYfRmCPIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765139272; c=relaxed/simple;
	bh=pTFPo5Q2+iKTcmgIH35Rm0x5Pl4vIHoz+rvWyv3fWd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tm2HT6H3ORB0ksClm3Ym6NHj17oEUy0y6JqYNk3CKPAKDnWx5kXknX6Ye21n7hYgIJgHx3f6FlbMKQC8wwjaUZq7PcIY8AvheEpVFmcGyimidAWg6HMzjgNuuCiqbxbkBuiaBgfuGXwBCNCUcSB/WoMQXiyFyTX1iabq87sr4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZm3Onbt; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZm3Onbt"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso4559821b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Dec 2025 12:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765139270; x=1765744070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LTnGo5IRNTPqTb6QTueFQxQdCY9bvgmhSZCOqTE9YWI=;
        b=dZm3Onbt6H7NDXlKg0nW3QhK/pkBCv9pzOa4vJCI4fNTSgPa0qUsuZPkaF1q5kbG06
         0VELW6p5SVkQVF5RGgw45fHm88qk4Q7j5E1HterRbjACg7bax6WvRxuC2gt3YXOyY3nj
         VeSX2g6365OeoLlAhfy8fbhS4zG3QIyaZ8mXgt5c3gBiI8lPAR4fDR3bNtWo+RCGzl3y
         0heJ04jeBIj/GicKfAvlqmqB7S+LguCPOX74MBJGiGauF74VgSTaEjtaAfrIyrcPGWm8
         LroSSxILGS2tIoja8G0GXC3HBhppwode42+arBi8yOgZyTSLh1p587lE8zOIgV62e2tu
         0Z0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765139270; x=1765744070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTnGo5IRNTPqTb6QTueFQxQdCY9bvgmhSZCOqTE9YWI=;
        b=XMNxzNrbIkZRfZ+82cGaw651Yj4yWeER7/zF+L3qAeHS2pNJEFs6EG9mjBdqDjYkOs
         fq86vuT3dTagb5QrRjhcj0C22kLNZcBqAiIFOjTXnefSYE8gEXN2hVCRAoe5FDzHSgsi
         xvO3VR2Nw514wreMXdOme7MmJhtpxjnqTLWpIpQH5k7QwJ1HKW8FBhWsVh9qOC3veX+V
         dCWrbAclN84cPBoDDb32hWkjG8YExXmlBy/E+YXwCP7mni26D3N+uDutDPpk3g9INws2
         g4UJg2Zy8ej/T7RN0zGm1WdqujGJ2nmf3dW4+1H6PWfHW383PoWQoLBq1ZNItxs6IET7
         BvWQ==
X-Gm-Message-State: AOJu0Yz8kGSGKAvFRDpECsGwHcwyVfOvSGd+gZzkZn21V2DXv/ISrCEk
	gbgGaHHJQr6J3ATlkyRYgZQzKkyqJRGM3Z4vpZW6weJDA4el1L7CW/b/
X-Gm-Gg: ASbGnctGVCm63QuNa/b7uusK7viL6glb6uBzMae3QpbZUaO8sMqzx86cvRPB3nZ8pIr
	uqypk+sdnucseENxxjsnuIjoOYECAygjDJINlrYqyt4v/zSjHLB9vuFoxUNHpa4mo+4nvIco5W5
	+2bbN2nT1ZfGj3AUxxy22PwryBqkQHxffAt2o7H1hxfA6dxrCP4BplSsRZiIpYjjQnjLk2E3n7r
	7WGY9wRooFn6vzWlfOQ2dBVSTi47P5z1o82MPV2HwaxC6Ea5/m5Q9Ql/zEFq67auUWTqcUe64Sa
	o68zq0fr4qQJ2ubQG5i3QV8hhftTOclanQ6dP8PGrC3+GVZgXIhAR1kvPli8yCWR+WAxy20iw2S
	wNekysaShLfykowoQ/+stD/UjDvKJUDLgk5UjxTcK9EbVo5leH7/8HGVs77QWevimizVwkzME3v
	fQfFkBppOq3DScls71Zw/CC/ds+59R6EZqoZSrYw==
X-Google-Smtp-Source: AGHT+IGVt6rATJFKXgf7QcNgwJuR8JRguYCnyZ0hcV5ZGNWLUeU6GT4A8kEOcekzUI0dw+RlJq3oyw==
X-Received: by 2002:a05:6a00:3e14:b0:7e8:4433:8fb3 with SMTP id d2e1a72fcca58-7e8c6c9d722mr5238488b3a.59.1765139269782;
        Sun, 07 Dec 2025 12:27:49 -0800 (PST)
Received: from golem.. ([223.187.99.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ed31bsm11168091b3a.3.2025.12.07.12.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 12:27:49 -0800 (PST)
From: Shubham Sharma <slopixelz@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shubham Sharma <slopixelz@gmail.com>
Subject: [PATCH] Documentation: hwmon: g762: update DT binding reference
Date: Mon,  8 Dec 2025 01:57:12 +0530
Message-ID: <20251207202712.71787-1-slopixelz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the device tree binding reference to show the change
from .txt to YAML. Binding was converted in commit
3d8e25372417 ("dt-bindings: hwmon: g762: Convert to yaml schema")
and moved to Documentation/devicetree/bindings/hwmon/gmt,g762.yaml.

Signed-off-by: Shubham Sharma <slopixelz@gmail.com>
---
 Documentation/hwmon/g762.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
index 0371b3365c48..f224552a2d3c 100644
--- a/Documentation/hwmon/g762.rst
+++ b/Documentation/hwmon/g762.rst
@@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
 Note that those entries do not provide ways to setup the specific
 hardware characteristics of the system (reference clock, pulses per
 fan revolution, ...); Those can be modified via devicetree bindings
-documented in Documentation/devicetree/bindings/hwmon/g762.txt or
+documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
 using a specific platform_data structure in board initialization
 file (see include/linux/platform_data/g762.h).
 
-- 
2.43.0

