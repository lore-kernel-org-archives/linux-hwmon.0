Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9BE811E6;
	Wed, 21 Feb 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530734; cv=none; b=ikY9/mopsssQLTIT9t5ie1SVn59k58xm53Iz+CNU7goeNoGHRBQNjPP3uRlWMygR1mYGfJ5beAULgcSPqtN5HNVBBNicu0P1FYBEeVNGzhOwqDpwsEge8kPjeiqVZHYxypUSuBkdxIvZ8iz2GOxhCbfP5rAQ2TCUMboRNixPgpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530734; c=relaxed/simple;
	bh=Hc2gNosDH0WL3FwUMTKC6bjH3WyWXFkJYhu4PhBaqz8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p+StxV6fTx8WushFZZuoRzIYiTG8oZLihFjPX//jaegyXrQfBUklE5XYtbjVzNwM3CRqjlUQw4PwP7dKLxei6vy6JbXODuUdTKVNaRilH7FN+GZ/E/PaHCgFbFT92NbuYCU6lNRhlvHuq4Zl7joJWp7cY/ckjN/2og6N3WY5NVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgTGeDWD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgTGeDWD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e4741b23d7so2144426b3a.0;
        Wed, 21 Feb 2024 07:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708530721; x=1709135521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2xk9Gvlf2w28BmSjU5WKADzraWBiGin15NR7z07i4Zs=;
        b=bgTGeDWD1pofMm6++dAdVixI7ThjRiEbNkeDkeQ6uT3oH30lcuwzulOlLsvKxUJ7+F
         Wt9P9Ft9k1iXwYy5zibqlcTy/MiuwAtKxC3mrvTCImWgBHD/g7+kEBIY0E5EBinp8FOY
         QH2fVYXYv+Hy48kH/NzdZeDFIfCwLxQ45SCvVepIoq2R3/GHdbLFWkxZYPSWDGy/jiJn
         9DaURZPbTybezWIo9RIUpANPxfCwxsq1hZLE2NS9wIGupEcFnS2V2F0oEQ6Vyo/HG9un
         Mj6rCoyDPUmP9VTuj2eBWw3rbJCYbUFOyMt70RrW1jxJshfI3/CLzvSV0qPlq1XRJUtC
         Eotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708530721; x=1709135521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xk9Gvlf2w28BmSjU5WKADzraWBiGin15NR7z07i4Zs=;
        b=EYGCIpEv0j9izfJPOYwkWxqRQ6B+Agy50XfOE3bDmLU7Wkv+VQysTIPJ6ehz17Fc9r
         XSTw7PAMUrc/rfr4iuUMxYyrO9ywLZvCjUPBsBCXJ1T21KgGwrrSVEp+Qztw6/b8+1IA
         nOE2Zf6dOjmIvLjzXiHhqWh9/zfS+LOiDDzZe/SjM0TW6GrpF6RyXfDycnhrAeUjQprx
         KW0AxVDgQvJrCq70UDorqopoTdTDBRdn8Xd55O9ONFnCM7LYZrvF5yH5KN591vYL7/Dz
         leGVZLCnyEZPUEdE778VqWJeftffQb0dVjTPYe7CjRYa83Jk4YwjwQYK/xFKlnqzZ80A
         C1Og==
X-Forwarded-Encrypted: i=1; AJvYcCV3hUZ+aoRznyybjAOGPhFX0jtHgn0Fw/Kh9tZyQ/w0poSZDIMRb3JciEGj7sLzTMVwT1DC5Koz/V1I2qC5qTCL5pYCSw9KGF99Y0bwrZyz1DElX8Gw/Ht+5jO/2pkfrmQK7KTLxt3t
X-Gm-Message-State: AOJu0Yw4FLFbiQeuvN55vDl7kWSdfSXXBHo1psSA9Ibqq7rcoX1lCSoK
	HyDmbCszyPiSoCgcxDF4jRTkEI1outvraI20qVQCyIIr37rWDLl8
X-Google-Smtp-Source: AGHT+IESlZPmZB6/4B+dz/kWbgIFk+P/yIAK0XMGtrEWa37UGlzShSisN/YO2nhOBgZoH7hUyCgSKg==
X-Received: by 2002:a05:6a20:e68c:b0:19c:8ed6:8bb5 with SMTP id mz12-20020a056a20e68c00b0019c8ed68bb5mr17627595pzb.39.1708530721194;
        Wed, 21 Feb 2024 07:52:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id lp8-20020a056a003d4800b006e4c4c3d4cfsm90032pfb.207.2024.02.21.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 07:52:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Zev Weiss <zev@bewilderbeest.net>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] dt-bindings: hwmon: nuvoton,nct6775: Add compatible value for NCT6799
Date: Wed, 21 Feb 2024 07:51:58 -0800
Message-Id: <20240221155158.2234898-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While NCT6799 is mostly compatible to NCT6798, it needs a separate
compatible entry because it is not completely compatible and does
require chip specific code in the driver.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
index 358b262431fc..e3db642878d4 100644
--- a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
@@ -25,6 +25,7 @@ properties:
       - nuvoton,nct6796
       - nuvoton,nct6797
       - nuvoton,nct6798
+      - nuvoton,nct6799
 
   reg:
     maxItems: 1
-- 
2.39.2

