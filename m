Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9BA2080E6;
	Fri, 10 Jan 2025 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497600; cv=none; b=L+mmi2yoNdQKi3Ufv98b5YgJz/d/uyn+kK4oBu7VncAqNK/OhQ2KfGyjUFu7r++L8f1TvpMFltfqXwXnnj1wIsulHBex7u54RSTJMC4MHWHGa32qtu9UJC1scX16Sk5v+Zh6iNp5zCXYcShl3YDBinelpfUCLk3hltvkNn40Wa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497600; c=relaxed/simple;
	bh=SciGJRCmi+0dEFWV/P49VyNcsADs8YerTsNvmxG4tng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DTYsPVaS1jk/y9y+uTZccYYMsBLmpu1N84+BKSkLUW4mu24AzgYQOnFzoDMG8RRmLvu6ypS+P9yyVJheBv8IcelLB0CVSFYadcpdOyREQvBWsB/F+mSKkL0Uf7xlCcY8M0HKet8ugq+0PxlIEwaSA+r8cZbLjyTANca3nGOboKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ22BO3c; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJ22BO3c"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-219f8263ae0so29638865ad.0;
        Fri, 10 Jan 2025 00:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736497599; x=1737102399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CjURWEZjlpMd0rMJuVHjwg/chXpPrhzbqpxOKVUWUU=;
        b=aJ22BO3cClPEshxP7QE83YIPytvXHrAjEWFFt1JsoikSd7OxNXQFZBjzw7XApiyFCg
         dgkCvpIBa8iETIbC9AZLfNk6H+wy40DdfS83sXAcaeEHbsDogNI2BQWQWfhiW6ackBMV
         IEOWJdnML9CN1l7RwRnAKKtPy6G/2jXDeHU2nGoRVHh/avfh4THqWnfwtAtdW7uth4qp
         XiYED5SqzlS/qu4PY7Vyw7k+oMxm24pdPdCXoPtAaWlLbXxiCbm0GZgb5vDCNMg2fnDP
         TZRdjorWDp9YRYc9GIAqd7QfdaccYjyq46HrqNnvhl6R94L2K5auWG4neuX5AdoWDUuP
         khdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736497599; x=1737102399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CjURWEZjlpMd0rMJuVHjwg/chXpPrhzbqpxOKVUWUU=;
        b=glYzzmKna22oyLGbfM60w9sbje6YFygKdhYWMfar0zTQRjeWYfUYxwx69muhSZUVMw
         azaWjAKM0rkwbXJCOQwwbVoNo//ixu+RPY1RIcvzeyBE1InaWXWkfIF683RJddR979WB
         wDBAwK/T4dO7yk0wrtNPoJLpofU9iAHQFTyJZX9DgLU9LCpKw5SWs11R6knm0TcH+1W6
         Wai68F3poCWWD7PjyQCeA5RGZwbT6srqKJSt0urq9djQCc6OWUvNR31k+eQC90g0Oi97
         +VJ+UDIdBQZ+dTAYIQQU4TqsZfzpvhFh0a8RbM9Uw2cjCxA3ZSzDDaV4UzLo4jadgaow
         wEzw==
X-Forwarded-Encrypted: i=1; AJvYcCVMNTx8Sbsld+BiwyVgfa5XGovcT3i4E3l20/85f8yMwmp6fe+cGOuZVZl5tWZOPoUqsTardUUpDJvO+oRX@vger.kernel.org, AJvYcCVlDyN/SHjhItXnIYikElCRhjTJgHDuYGMxeokl7fTGO1rPcEGfloZ3xVwEGL6mAa880k3gepJ1NwGA@vger.kernel.org, AJvYcCVs6FBt9WQQMC31fUsfSxYhORcCtU7A/gtxlxtUdJOp4FCenAJDENWF4xc7s6BETMzIz2aUjCFJjWvn@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQFLQDSduIp0i4l0Mmez+KHSwgBR5gDVbWn7ivaTV9LobySbK
	h1laNWXsW3vE4sdfsVpM1NdLtF/GbB+vAdzDDh8q2nQiIRRLBC9xSkcrbg==
X-Gm-Gg: ASbGncvU9IcKl9hu5hNzQDPIqoWVS+0KaapXfmPa/N5+D9u8fxRSkjqvQJCZfqyXS4K
	jsh/6XiCg0Ci9pqPROi5pu2p1tLh9nnDYgvb3hz0qoG+2VrIUR2I8hqOJyKRWz4jXj4wl5rX47/
	At/B/rcfRZh99L1aw4ppUd0uDKggtPHWTCtSIRaPtVj1Vq84nVSWohKS14AI7VmfV9wMPfLcu74
	l+KKZKFBd4MLDJKFxIVxJ7EeuJYKNH4H6gsDfAjRsaOFRfc92uFE4efAoCl072Zppzowy6P977f
	bHDUqDbYyKxYbY04NAC2npAN
X-Google-Smtp-Source: AGHT+IE1ay5Rfntve2eKGTe7p/iyv8boF0i1TX7FP+zYowSZtpV6RkFz3/9SGXznDYsNhhCveKVzvg==
X-Received: by 2002:a17:903:2348:b0:215:9d29:9724 with SMTP id d9443c01a7336-21a83fc05c9mr159260855ad.38.1736497598599;
        Fri, 10 Jan 2025 00:26:38 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d0eesm9346815ad.169.2025.01.10.00.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:26:37 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
To: tmyu0@nuvoton.com,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v1 2/2] dt-bindings: hwmon: Add support for NCT7716, NCT7717 and NCT7718 in lm90
Date: Fri, 10 Jan 2025 16:26:12 +0800
Message-Id: <20250110082612.4107571-3-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110082612.4107571-1-a0282524688@gmail.com>
References: <20250110082612.4107571-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will allow binding the driver with the device from the device tree.

NCT7716 and NCT7717 do not support to add temperature offset.
The maximum offset supported by NCT7718 is 127875 millicelsius

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 6e59c8fdef30..4feb76919404 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -32,6 +32,9 @@ properties:
       - national,lm89
       - national,lm90
       - national,lm99
+      - nuvoton,nct7716
+      - nuvoton,nct7717
+      - nuvoton,nct7718
       - nxp,sa56004
       - onnn,nct1008
       - ti,tmp451
@@ -120,6 +123,8 @@ allOf:
               - dallas,max6659
               - dallas,max6695
               - dallas,max6696
+              - nuvoton,nct7716
+              - nuvoton,nct7717
     then:
       patternProperties:
         "^channel@([0-2])$":
@@ -155,6 +160,7 @@ allOf:
               - national,lm89
               - national,lm90
               - national,lm99
+              - nuvoton,nct7718
               - nxp,sa56004
               - winbond,w83l771
     then:
-- 
2.34.1

