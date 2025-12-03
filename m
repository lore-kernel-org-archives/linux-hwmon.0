Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2A3BB48
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Dec 2025 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783066; cv=none; b=UUI62i+sHvb/j2Lgq/c6NR7qQw+UHIhjshbS0neg0u9bRaSZiwg7UO/MXrx5rEmZZRyhBdG2Wz1wg9E9x3O+F/j8aIKs04vbwOPBg730kyWvpWWYqS1RGy+F6ZnlhMjFEuTMNK9+BbkKTHmnc3wh3VM2klkErZ7OM75qNN/M0gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783066; c=relaxed/simple;
	bh=X5to5kJ9QCcHakcSKKmToFYntzDovncX5FCHRRR/eSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mzg+Fy1TQcdR4XVcKrCBAfS+krxgaXMiQUNgqbvBNkAY6yM8cXrc7nmAHlpB6ZX8DS+mWqfahbVIDXcqbLeYm9dT1/hgMvBGwg6QXD60TCKg3QPqvvWYbc7Rgr8oxUNIUYwZnvH9tkr8xddMnzGw3sAJGoRsVHErwfKn6nwef8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/ovXIf4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/ovXIf4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2984dfae0acso427265ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Dec 2025 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764783062; x=1765387862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VL2LiGMIjzcKPs2iQRcmiYPq/BCDQfmJT/ipwX2Yjag=;
        b=Z/ovXIf4rg81ny1SY4HzCTxI09VzAl+wys/yEQ+jUQUH/Gp7sXOALW/HZF3x5ivpdo
         wQxd/oCkkpe0VT8t8+/b/YDY6R8qIWn5Psb99LdkYlvuC3h1At1ux+ZWLfflioVFdrOP
         J9OSMx9IFKNARkQxLEhHqoPwmhcKH2drmRXRHi0yitVZ6+eEPyqM9yjbwFNkUcLHRJrj
         5kNzUMHU8dg8YqTwIGshxLkL3ArhpSlpc3WwchG94iwWXzG4dEOsVE711M3yLge0enjJ
         7juGJmYJFBwIcWPpuEoic888BQquPIS8ADzs0iAL0JgKigYhI2PN5NChAbPiWbXMin9C
         h1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764783062; x=1765387862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL2LiGMIjzcKPs2iQRcmiYPq/BCDQfmJT/ipwX2Yjag=;
        b=lPS8rNYicXqWEXQvTtd9VBrzBiu9mMYkRAmdEkBjxrOK7Ofyf8k2/Tc7EvhJQtXGm8
         8yutzDBCZlMVWCmGpW7RlUatQQGpKGrhYl9wk+u4Ds3Dge0YfuuAVHmvRJVL6QX9dgmc
         uehF3SN3eQDFYsABLmu+82VaEWoeVWyB/VUvDjOoWL9rPiGjnvRzU92RYNjkSLguP3X1
         l7h4w6/W8q1tW7b3fQzqo+roez2hzomPPp/oyM5Ab31smKXfO89FDUtTqbu5W//V4N2C
         NgfCkA2zaeTEyHjITQyWt8HjjkFtTRpTGnHAhsrl4k64EGALTTJxB3k5qjJ9p69t0biQ
         Nrvw==
X-Forwarded-Encrypted: i=1; AJvYcCU3msALyQ06pT1hcIPvx+Y/IaXKVr/8cGzmIGVn2eDfeyfhoQLAm2y59jrWkT19HLoRlD91KOyxlQfpIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7zaeRROwlBhSGVrh8JpEB4NfD4XyhP9zLbfcefjig2PP9JRJx
	sqKoevJjZ3kqhIV8cmuu72me1rA/SUtUf/ZYry43FeZiURMyv+kd2W7w
X-Gm-Gg: ASbGncvUJ88qTZ8fhkEHmUxxVsYiCvmOR4fCcC/TmMmYAITwuLK8UJ8UnxVH1nnct9v
	tFHXwp8Si5Y6L2Ze+5E+ASKyKd7DuVvu1Av8lHM1Zib1HdNouux45YeLVbxxsORZAZd2dAVfjEK
	gLLQYDvrhHbM8Hfj9qVhiJv+lnO7iWBoKYusy/xdRE8BPDs1rEk5/IYRvXdyZWZcRT1yHIwcvRB
	PgA+UuNpqYSAjqfqXLF0p035hlcVRt+m9oXvsb1L0gzVAuIMgx93NgNXvUkNO6/CHSG9oGP11yP
	ftAx5SJ3YBuMwdmMjWJ5rFCf8hIS+gxpDI9AmW5c2VRQewWyC6/xDY0N9KLMCGse24LSQ60qqyn
	9/nSABof9Bmrrcbb6tOh/coyE3nxeV0A13Qq0LmzgSqUDjjU7dpwgteSoTCoTtWIbqWW/xrnzFr
	JWxNmou+nLU1zRl7F4wxw=
X-Google-Smtp-Source: AGHT+IHwfzwNo3WgDLnMeITvwxsyF3Nm4DygMY+CPGD0yFiQOw0cFmDuP3b3Ag4gofjD9EGiOYdB2A==
X-Received: by 2002:a17:902:d50d:b0:295:8da5:c634 with SMTP id d9443c01a7336-29d9f67d5cdmr81995ad.9.1764783062301;
        Wed, 03 Dec 2025 09:31:02 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce47096csm190177005ad.44.2025.12.03.09.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:31:01 -0800 (PST)
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
Subject: [PATCH] Documentation: hwmon: g762: fix deadlink
Date: Wed,  3 Dec 2025 23:00:18 +0530
Message-Id: <20251203173019.46928-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding file 'g762.txt' has been converted to a YAML schema.
The current binding is located at:

    Documentation/devicetree/bindings/hwmon/gmt,g762.yaml

This change was made in https://lore.kernel.org/all/20240604164348.542-1-ansuelsmth@gmail.com/
and merged in 3d8e253724170ae9c8948c36801204fc2aa53682

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
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
2.34.1

