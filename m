Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEC23F0A90
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920658; cv=none; b=Gu+DHAspWm53X8qsBajRgrvK6j+Tmos7K4zhiK/3VLsUMh90NK2mXDNLHv9k7rEZhPxoXaFWureAmE30c+2vf7J/sUjTPV5/u/r2KbkdaU0J6dAr95eaVEHivkWAdBcuGJOaVvMjjGbHUtMfmISKBto5mtCyOIqZkaZZXd0MldY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920658; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plpn1WctWocGA0ijpUAibkMGhtWqmWCRak6dcM/gCVEueflau4J+rBkaGJb7m+UQyj4VpCKZwMF3Q+f6kOszBc8KPoFHaSAHdKGmCXqt69b87VXLBG5WwS2XnmmJYK+NNoLwr/zY1sbsM3NdY81N4HlU5fVRESuQbam3fuOx6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EtsLWIxm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EtsLWIxm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso4995015e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785920651; x=1786525451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=EtsLWIxm90bqO0pNwLeOvny9TOKms0H7hvq1lu3sCTDQrNN+6zn8FAxJKxvvIlhPIP
         5O5QXsakOEdFJxL1gd2z1ytNTKD4Ar1k3oXVzOOjoOGjvp2EfaZyioD928DMa52xfNO5
         yOBhIVShmHuK1ioSNmnaKxP8SAj9DDFAHq0L+AhPqPThjD309BcLpJcQbT+3e4ZQo/Kk
         mUWPxHo5JfirnW4ssQ9DdlWaAouXGryAkqng+9FzQzdmR2t7xGYjmo37c4mpoxce6/lV
         0vabw0bE8+L1ec7Y1vlGSLkwk8twkwhu+3pjj+YD81iTFBTxTW7EH7XNoFIvOLPdAuPU
         BSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920651; x=1786525451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=j5PYfUcNY5sY2+L6ljbkrDDEC67+9NmsHtONHXqKIpUfdJs56l9ke7O4YdNRhUEnBf
         dfor8elgfi+D+4/HrJ4J4XBXtUTE6QByRds/vITZntCyIsx2iH5qVz+9MII+6LfVZBW6
         rkvmIad2qWUbUMa8duxH0PRuWjDpNCJHBk6oIQ1tDKYIUH4R0LrY97kIKTor5pBIdjw2
         xDJrhr0nWv879/FNY2YwNk8WtMTcZz83G33izlgI3t0ctGIfzGjLScoQ84lpcoyYKca6
         gXO3i5Xi/p9r9Ge4OhrzMZPpI1WxjLYcpvmi1GvG3sdGhhaKZxYJrKFEUA1q8j0Y8wEz
         URmw==
X-Gm-Message-State: AOJu0Yxzjw2g/0BMPJKsggNvuAps+67wiaV7i7jth76EtFyqE8EwPsCN
	2KLq59EHPtHDzwOXAPkgRIlcMzeI6tRr6YrQMcfWLP9LxgWOSeABrcU3LLu9TkLhjIIRAH148Js
	PbMhfN0PDaQ==
X-Gm-Gg: AR+sD11QAggLKGjK7UdvaN2YLcNwQJgWxta1CWpwTbgLwJK2YWYuLmjYWSQB3znCnOC
	DmSjaEEZ4wm4bwh82t0LS4Chx4wYaySj9BhRJsV5PspREc2pebnDFgFDgATgKbTmPbVhg0lUSRh
	cZPukqgxvlxUiqo6SYfG8ZOppAwUUaVmCbDOPNe/NduYsQUpF1smy+nP8ZXuBBwaeaqspfI9z7i
	SSBs5asKsIegAp1EMJm35V+2SmCW8dEtunfkfmS72YNxOQEKfi9JTF3sA2OXNiDP8doq0qBQIvp
	Dtg29PEe9oQv2sXDislRoXX01fSeTsyPLktSZwYPFrjCybgR2ynCdRxBJTFTLvdfssGwbDhoe1L
	zO8y0LskgvwmcaKC07j0U/opNOyWHQk8vaVFUYCB8T3yZzJyC2mYne2na7ENmQpDn/NVWmcRxrG
	MjNtzVbaI/xCr1UPqMIUKLVTk8lPegS1wsT55WseqZ/HLyFvkXp8aoBfLQNpNRGFuzcs4/dHfWj
	aGMHMZCzFHKLhKZwBzU8e40PaRYrGbj0ikhLXgRFjZl/SCMypgrhifIvDYtXnyno2KLMzyJeleb
	nuatNEFgoXHmhAH7u77TDufX20kWDA==
X-Received: by 2002:a05:600d:8483:b0:498:1371:6612 with SMTP id 5b1f17b1804b1-4994e7a70aemr44104035e9.6.1785920650758;
        Wed, 05 Aug 2026 02:04:10 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99319bsm34082105e9.3.2026.08.05.02.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:04:10 -0700 (PDT)
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
Subject: [PATCH v6 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Wed,  5 Aug 2026 12:03:56 +0300
Message-ID: <20260805090400.2059006-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805090400.2059006-1-sbogdanov@baylibre.com>
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
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

