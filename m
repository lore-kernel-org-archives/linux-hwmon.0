Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE79B311C15
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Dec 2025 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785571; cv=none; b=UGWlVKP8Kucmvf3/2Ieeh5XzQN21hRF1f5Qv6L/8NSsuq3hVYMXhzWHqgrndZpcDJ/qxKSZK/1kRruNSt5afCG3InUFAe5WMsymeCCSuygu3lQW8TpYhqAT9FdVHsPi1JNPnqXclEYuhk9Z/nDWkYgcV2amrI1AFsaCbz+jwqME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785571; c=relaxed/simple;
	bh=dq7F0uo55KGJeoowbZ9mn+/+bBkR9BMF4bPhrTA5kps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BeitM2y7KsOXmQtRFI/z6ICCQHEL/MU8HyQYGfZNFtDsbk8aOW2hHW30FG21m5nF1iL3EtLMdtQdd5t7gCYYsMGea3+JTihilq51FbXmpAJBDe8o0X/r4d4nzb1EZBKD/Y5Db+V/+myGv2YTjKQ2Fpg0RiMklhVcASqtRPxCDXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDAjMeUM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDAjMeUM"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34381ec9197so6256407a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Dec 2025 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764785567; x=1765390367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RuIrONfPlUsQW0/G+UHR3N64wTGPf7SXig/c0u6w874=;
        b=WDAjMeUMyAI8FioQ36n66Wm7NrXpgpR7WdLcTUDmRd9HCTXZ4spgDF5LjMTy8/KoI7
         S3zveGHwJN3rP+uQdO1S62KDoi60qzmL/CX2xNo2/wzUO6jWVLh+aEk6JJxMbBkjVCs2
         xhr5Dwz7A1j9MHqWkte/13rKWI/+GXcuynprfuJnk9JpAq/4FR5cthCVD1DfBQnBI5nU
         XOfBiLTNEK0en3Bgs370/jGki2pRY3qLIRw+323PDC8znb++mKnAxD5zqB9ShIj0EqFF
         HsTqglGZxWxs7k+wdndeziLgGfPekzQ4KBhh+Yp0l/GJ4SLzeenK3iD+LvITn4JRyv4b
         n8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785567; x=1765390367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuIrONfPlUsQW0/G+UHR3N64wTGPf7SXig/c0u6w874=;
        b=XzJIT0g39A5j9g4rhTP+m/eTcAaBlXxfMXE8bpTXbm9yIkjLdJ9L93VbVxRfzBJNzz
         R6PmLSLC8ogsvtlgb4H0mZNhqcEuJXWXTA5bnbQnbUw2EAsGc5UA1HiwyXj4TL5Cbcfr
         u0bvzQed+SCyeZM6LYawd/KWspszc/93vqrcKeyULi3Mo0b8sVdzRP41sYg7XKZIrkOw
         mHwYuGrGmSIPyhhhdRpTM15XB1LXUBBzvGp7hItM+7RlcaQTq5GEqg3ShiLISHKupKMD
         lE68P3TBMm9/pzzh8mZRA5twR5OlJziIuCYeTSnsD5CQBGyjnl74WATesxdgJFztBbzG
         WCgw==
X-Forwarded-Encrypted: i=1; AJvYcCUCdv6cEwdCokcAgeZ2lqcYMbwt++dplwPEF+Okm5bPclxrHhIy5w2zKOYE+ZD2eVH7Tw9kbsdKxtncQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/0Lh9HY+ogfqAbC6X7Q6knGnrjAkO9Sdxur73o6i8zXLZZhj
	Y+yAXKs5biadLzlBve9qC5ud1+O0+9JGRMGbnqJyfhTla4WaLSkNeddu
X-Gm-Gg: ASbGnctskf338eq8Y3h28LS2JWMHTuM0z4OLuZh/8+lyTct+FmA4EdW5va45s7j5T/t
	Jx9s1WAzaVfATpNFgnSWeo12rd7xs/YoQBZCOFFXOGJWt92lLbl6yGT08y26wI+LJELztMejy1Q
	pLfRQrXSu1mgN0AR6ta9ofYxnbr3cmndT+vFc+L3NOsZXxtzQ/0YDOKRKZdsetQ0BAEHH598ZcZ
	8mjNH22haBjLaJJSgQwRlieeijm8HESZfpphPPg5XgQ/WCaSicqxE/cBrU1zkQ28LVpMg04Ufem
	ZqU/vYw2ia8jiZYf4hsN79QNtOHfO4MnNDcAQvI0ksKkaWO0TSkBjq2WehU4oIyIVERyEOVG2p9
	E/WlFoooHc7PFD0SflgV9exKuOwgkwzaPx8xyY54CPT2wljDglgDizZWtIszGkNtt7EBjt5j7Bj
	Jpo/D95Fkrc0iaJZeNGQs=
X-Google-Smtp-Source: AGHT+IGZrryg5z3Z/u/8JFpgB0WolHytle+7b50MsN8Rhr9Rq03qsmx+6dhKqLkzgC6AajyFnVhnjw==
X-Received: by 2002:a17:90b:2d47:b0:32a:34d8:33d3 with SMTP id 98e67ed59e1d1-349124f6c2emr3577411a91.0.1764785567109;
        Wed, 03 Dec 2025 10:12:47 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34910bf9fd1sm3475565a91.13.2025.12.03.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:12:46 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] dt-bindings: hwmon: g762: fix dead link to G762 binding
Date: Wed,  3 Dec 2025 23:42:13 +0530
Message-Id: <20251203181213.51618-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old text binding 'g762.txt' was replaced by a DT schema in
commit 3d8e253724170ae9c8948c36801204fc2aa53682
("dt-bindings: hwmon: Convert g762 to YAML schema").

Update the reference to point to the new YAML binding:
    Documentation/devicetree/bindings/hwmon/gmt,g762.yaml

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
Changelog:
- Use proper commit SHA reference syntax

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
2.34.1

