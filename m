Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBEB1917F1
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941721; cv=none; b=L12AGyu8145nOi9oPaor7lKVucYnviLtI7QrEIeeFeAtr2cdjRaUgFtQqYXLiWOiwkD9uYHyw/Kd4Uy0ujVSFdL3Ut8DTJMHtP14emIe94LyU8Dg88YOdU1faVSL2unoPMRYYSLo+2vrOTV9v+YegobImmUsDTUOd8xRROMUDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941721; c=relaxed/simple;
	bh=fUJ50nNqzEo25SE79AYPaMX7LUUHzTN5oOiZ4xAgcTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OvJI0kMkdQ7Bbgd7SxE5FZoPHyEu18LE3hzcqiRVtTq/KMBoE+viu1nfmTegAZ5g7T7NgLyyxexO8v7JL6glh9/Oz1ulPM/rr6N9j5jQZEmcRhD1iaf/wfc+NqmkwCYVeVX4qgB/s94fegAVmvI/WugFKq2ixODuyKQT5+B6YNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VBu6gF5l; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VBu6gF5l"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4833115090dso2981595e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 16:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770941719; x=1771546519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkC79iRLW3tdZGeGE0h/zKnK7gWxEm2JpK3spSL5h0k=;
        b=VBu6gF5lDHN4wM2GSGIrQK7vnK2gc/Qx7krUJonGeQwGXeZZNKP0POuLpnQORloUtr
         qHlfXQxuCFYelrL40lwXfDfU8HmupjgQD+fhxjvYpsyd4hWFoFtgHodpCnOgC4FEoKWf
         fzhDdH7ibqYQw/7b+U3WiUY7iZI2nsdhegQVHTR3I+0QEKZECwpg/cf8A2ROEDeWUvJa
         T7oXXR92DkusBTuQQR2PTrsBPPXeyTkQqAql350qygPicr8tNgdcED97eHXHUzpXvTef
         GochuteDfIj6HcjB3pt8uLJE0rRNGNyOjPH2M+jwxTYSDpJtwq/HzlE8Ua7gLtWDdTK8
         bXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770941719; x=1771546519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hkC79iRLW3tdZGeGE0h/zKnK7gWxEm2JpK3spSL5h0k=;
        b=P9sHrLRk4b0DG5P7vjPECS2YZZRlf2LvPoNZ3PPuaSmAy8TKmQXeY1laL7O04uy/PH
         nZidHaPDYioTI3KM9arOLqtnjqg3gMzqk9BxXMSsrthI+id5PIbpLvdZm57Qk+ZhuFqY
         46ivZKVasXImIF/jGkTvWzm2r/BZTLpQjvdE5Jssk7hJTqj2sqwt8HgNM3O+UsjyVIzk
         m86MTdg7Cn76USRSM/PNIG0MoMijEx/Albvbd2NxG+NvNTCA1T1j0mL4jmNeuKL2I1F5
         58b5JTlM1KC1PnmdqM22eLZ/yh983FYsOGkNgo/uWH3WprbipyiRx4/hc80nx7coX6KF
         onxw==
X-Gm-Message-State: AOJu0YwTkRBeqHdjOe0p2VtjIcH+V3IJKlcmvc1ozjiVwf0B7LzuKLb+
	ZsDiE8FK3rlvJjqn+F/Z/G+p3anrxo98e/rmDsvGfmXle5MWWE2YnIgLRbBehfLyRIU=
X-Gm-Gg: AZuq6aJOK5x6k4+BseKYRsg6uKC3T+2eo+dnLdJ860flGKYUPx2qVhjScndlWpHc+kf
	5B3csKPFKYw35HMRSmf9nVP0WD0sIYanLN9JxXyedCV0/9jT2wTdLyYRVvUdbOf1vI7t4Mj8tQZ
	29jcLIEp6ztINXzZmZBjFDCZb+P9mbfDWl+dAU13XUtRoMtLKiaCNdl56XNurQIXlR3oaFkK0W1
	nB6BttnPsSo39UIhuBlDm/cJnUZVpK1ueeJHNK4Z+4uP0nlv5d9LQu0dKy6kz/vBVJilJIV5tn1
	g+KZcoTowv+4OUViyXhpOphSbBAFFXhqSx/wEUmYuD/aEnaq+c5/xoerKlrs28m/rxGO9x7Wxvi
	5luC/vyWF8WJexS/2gUnNCUg2ZnaeZimZvDPY6yD3zYmYcrNYy9KqDUSjIvkygrL1irjlO0umgq
	Pdod+uK6frqfw0rUxWDg4D25bhew5asLqvQOgNEayOucR2iwa7yL15ZwvZYNA9TRiQFB+SblHCW
	Wos1WCPTA==
X-Received: by 2002:a05:600c:4fd4:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-48370e18853mr16124895e9.5.1770941719083;
        Thu, 12 Feb 2026 16:15:19 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm234440945e9.6.2026.02.12.16.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:15:18 -0800 (PST)
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
Subject: [PATCH v2 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
Date: Fri, 13 Feb 2026 02:14:07 +0200
Message-Id: <20260213001408.2454567-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213001408.2454567-1-sbogdanov@baylibre.com>
References: <20260213001408.2454567-1-sbogdanov@baylibre.com>
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
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..973ee00c2c49 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.34.1

