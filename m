Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFBE2E92B3
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 01:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203948; cv=none; b=qy6XJMuR6MAYzgp+vVZZRMWhSJQ+FWiBA2t/7X8JQFDVi1o9/3DFigsJnzVCagsiea/fwH3ZQPe9dcL/eLmsEuWRSFscugzom5c22hTSp4AC22M6NzWDbY+84TriKIJDb3G0PYAEHu3Zyx2naoYguoItIU2mW7XCvikvsKOpnTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203948; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSDf8yVwl16VmaC49bqbwMkjwk70FhboEFhzHNAs54FLbzt9o059+56030jrEigLxy/msoB6DRGizHNNwZJvddWVIWlq4OKk4tr+Zz1ZWB4PtFoIs8SaXOHDiu2KpeQunOcu0DN5Bi7iQZ6ROB8Nt12GQ1GMDwvN6crsoqgyesQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kchdpqwQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kchdpqwQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so17495355e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785203945; x=1785808745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=kchdpqwQzA5vSfU4UdgVgYg8cWB726+J/57Qs44+OhrLjbAftpGX5XJn7uiv8YsMNP
         1MxkqAnxanMm4/L2NlhG4M4ir0ZAo72Q717+X2+1XNX5UxwIkwPb9DXzTY6IRewxpaKH
         GcISDVOMh8aNvo0DtpAUloT7F6JJkcq57L5t8ponNTYfE1niNfE/q+/pwRR1X1tcWlod
         hU2hY4mrvUJ16tVkDf/oMxP1yeyX9ZFlU8E0Y8G4c1XfR9/YQK6joXZYBlyIsM9NRZiC
         oOpbHlIbK5EvHxp1qoIXfSawdIcye10fCcsRsNP8S0KaSNrkac81CXY2AusiXMG1W6Pk
         esxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785203945; x=1785808745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=JkptwQBkESwVV8aDiOxO3pL8Np85/kE4BhMZKNIuUTwyFyHwzdIyuwwRPO5sUa5yDn
         eHEeClsQc4zfOYwrxnh6VR42cyw/MNGff0k/NfzSM3KTFxywQZ4qaDwUvqbGZSpRI2II
         NpJjek9puIY26VnZhgo28QA5t69YeOfW5uh94tA01h7pkD9tBF9F7frBdcBEwBhKOco7
         wv0rUpyrXIWYcSge1B2NCpKthcFhfaSJNnmuFbrXKeGRIDldFlWzNWV6WhqA0PXp7pkl
         1F9rNyLIgcNdcKyqaxT2vLL4SatVranHBIhtc4uI4EpUZeuOXLUXr2XxT31P+OB+70Pa
         dkhg==
X-Gm-Message-State: AOJu0Yx+S4PcwQulThF2Y11wy6MSeIQa5fCIyFVec6vCbVPMR4keGskV
	YurOFV4uEF7iJKaZycQS4ClJrx55tjw+OHl/jys1lJXhHOpWz6w+4zVAhiwAl77fY/A=
X-Gm-Gg: AR+sD13ibr4+uTrwdjnijEIdQvxkrxni0i1859caB6M/i/NhbTh30IDBtHRuRtSlDmD
	bbnXUfqkoJra9oDyWtzvBn8qfLdPJwzvVKJvS3OVwV5p0fkDUvNgctCaPU0WCieWqq6TLJt2QmU
	VK0PjDM0lSg27oomGVvwVqZ1ncFi46RvGBzC0d/jzCLxtjaofQ1pYPA4FOfq3apV8v0dBYN0vhS
	jlXVWfJv17pXGC3sQsY1IyRh5Zx8ZbOFPfggG8SAtFr2tMZX+F8YH2gEJfojbBc6G0l8lX03GJY
	7aUYd9/NKG9pZkEmZN+BN9AkThHDfqOcTI4K4k/ZVdwfIBTMyge5MfepWxln2FRu9Aufn/rFXMN
	UT/JvyIQ2YKL/j4u4dxbYqMais2FvrhakwqSGRVhHzZi48v0r3ouc2Mh2kJ/wkoJXOqfSG1v+/+
	Y4F1UD7Gb4NTfqOh9Ck0DKYZmnwGIZ9N2ELUpI/tixXVAGZoQmw7ORHa7hO2ncIohIS5QWvCjXk
	PMa2MAV9X1heeU64NhH2eWv2BGq4BFdxaLOYtcUIy9P+fIn5lwM4OnYkQ==
X-Received: by 2002:a5d:59c8:0:b0:47f:9d0e:f94 with SMTP id ffacd0b85a97d-47fb1f107d7mr198973f8f.36.1785203945484;
        Mon, 27 Jul 2026 18:59:05 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm52380930f8f.16.2026.07.27.18.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:59:05 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Tue, 28 Jul 2026 04:58:47 +0300
Message-ID: <20260728015857.193890-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728015857.193890-1-sbogdanov@baylibre.com>
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..63ccb67576df 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -5,18 +5,20 @@
 $id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments TPS25990 Stackable eFuse
+title: Texas Instruments Stackable eFuses
 
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
 description:
-  The TI TPS25990 is an integrated, high-current circuit
+  The TI TPS25990 and TPS1689 are integrated, high-current circuit
   protection and power management device with PMBUS interface
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.43.0

