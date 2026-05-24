Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951DD33C183
	for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655882; cv=none; b=HYSAfT/3hOHIeIIyiNHFDWBMIKqoEDuO1hUuE1Pg3E5mGchqcyWz74H9k4XRv2e3eODl7M3J+hmRHhoJHnjj8TW9Nr3OKlQ9Th/5gv9QdrvReEa8qeV8itFJmVTfq2pX1OYVkslwEhumQBVUlgHeNmMxMg+FNsqA56QuAjfmmkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655882; c=relaxed/simple;
	bh=/E6noZEAxsmqEWcfMOy++WDBnV+JRuYmIOlWaCLHqFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2S/mDPCiUzA9ffpFZsmS+BKhzEWFxMGBrwKsOCbZ7PRmoEd4jzdcQEWNUxjVFKC6hDrpD3MqYQW31ZugPp7S3AlySBm+jinzpeJOX5uv+w9DoLGQVaw2FjNaA+E+CC2eOkGsldd/FW0B0fRWZR3oWw8hLyGWQ5mUD1cvLpgfTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTqru2vc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTqru2vc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso28332435e9.2
        for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779655879; x=1780260679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFd4yJ/TC4wEbZC59wd9fQSCOjR2w318PilPDVoxbPw=;
        b=oTqru2vcdTnZiWMZkpNMv9u7o2L0pLHcfkA7TkK9woFGYlYbPozZtQqICzS27/ybPQ
         nV/KWK/0vLAl0EshAzJL451DxkaIRToVSt1sROHanFWDS5KihzClqoK1VkZmCh342cIe
         +U8xMkoVVBWw7unuREfntsXHbt6nSV3q6PK8frZ7kG9CCC9L3EaVeU9YM6RV0S7wDbIu
         NE0UnO4LHuUJe21vbXexD/7db2l2cK5DRqvCAp4+PJVrwnutv3AQCHCfEZCYiVzL3qXV
         0NnlLhU5Ix7kwfWdh6t1rDy06yVIgRA6JCdJyCJnscSNt8wR0PoAc0SmSEoaj0R6P745
         Wapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779655879; x=1780260679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFd4yJ/TC4wEbZC59wd9fQSCOjR2w318PilPDVoxbPw=;
        b=GFNt8yv+DttXAPWf7MzaBJslvUqIRHOMmf/JJ3xny8CRiELfLJaXNFj4Rv1yxADjD5
         2OU+lzL3IJAV2918roWtkxO6t+SuTfMCCyEJriTx7s4N3cFzwVEQOYehrvHReHonykXs
         epPqHNtvWKAkdy1QMw5vu/+7mRZdOyA+KrbPRmzjOT5xlV9zjUfu+/rVGMi2NbAPl2Su
         zoeW63bqGSzLr+M0pvvNK3kw731wUiIMkFvdEUxj12LLouv2yIq1YSpbpHScXJ0deNXw
         3Tr++LKc0rG28ipzepQseFGEm7xm9wr1OyawdrEWnDYupPEOcXKbC61Er7I3wyP14XVR
         AxKA==
X-Forwarded-Encrypted: i=1; AFNElJ85b4oumm3Bgr08aob9Xpi60k95JY0gpXE6EwA7kUVWvnxkzHRd7YBYBLgM6RM/76FH3G0oCpdFpQuzNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+tLNC7bErkDkQLT9uozgMInEIan8DN26J272g06+42tTDvNK
	x+G3wieGZXnsqHjvwfekzS+rhI+caaAfMj+sBm/4nsfdhP4PMmCttuBK
X-Gm-Gg: Acq92OH0Vt2ir7bT6ksAoKXSaogmSd4z9cRSplkfzGbM4Q477wOTDY0tS8W2AFlha36
	qK9F7hdUOLvLOU5BflyAAWKTtsu1c7hw9jIKeGyh3evB25XR3Jik/Cf7Z93UYYxcTEGuPPk3jyd
	HMWptTA+J8JE5FyTQ1Bwi/aE3nDzQAHbnZHmnntDi5/pkpWtjGvkEBJh7ZV3HAIbVGa3CCWxTYC
	z0nhE3sk2xV9TfB4HEo++hfw0fNY4VOvGM5IhF7lRXh9El6dY2F/fvioXfKzGQdGJbwlr6cHAnl
	aWTu0bhw6GhtkFX2rshCzH7cS/UWQOMOAeAwR92xJ4KrX9I7yQFU2ZjLET8f3TKgJG5zxif54nM
	wh5/zr+PrlLebniMQIqOWIP8mcMAksWe4P6KJVsIUZYnyX3IPZ81J5UHfkRfT6a4IpHeJBBvvpO
	tYTEgT
X-Received: by 2002:a05:600c:818e:b0:490:58f4:ba23 with SMTP id 5b1f17b1804b1-4905c60ef29mr62901095e9.30.1779655878894;
        Sun, 24 May 2026 13:51:18 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d6ebf0sm22738588f8f.34.2026.05.24.13.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 13:51:18 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 4/4] MAINTAINERS: add entry for Sensirion SLF3x flow sensor driver
Date: Sun, 24 May 2026 22:49:39 +0200
Message-ID: <20260524205112.26638-5-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260524205112.26638-1-wafgo01@gmail.com>
References: <20260524205112.26638-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wadim Mueller <wadim.mueller@cmblu.de>

Signed-off-by: Wadim Mueller <wadim.mueller@cmblu.de>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06a8c7457..5cafa8c8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24187,6 +24187,13 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-iio-chemical-sgp40
 F:	drivers/iio/chemical/sgp40.c
 
+SENSIRION SLF3X LIQUID FLOW SENSOR DRIVER
+M:	Wadim Mueller <wadim.mueller@cmblu.de>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
+F:	drivers/iio/flow/slf3x.c
+
 SENSIRION SPS30 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
-- 
2.52.0

