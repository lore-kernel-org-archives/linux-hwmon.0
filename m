Received: from e242-9.smtp-out.us-west-1.amazonses.com (e242-9.smtp-out.us-west-1.amazonses.com [23.251.242.9])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C458364958;
	Wed, 18 Mar 2026 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817333; cv=none; b=Wjc8lnn3Pnt2JzZwX9g452V8RS4HvmUsxdLyZpSR5bYbdfacWZ8gyI4vUrcG/Ka8sSIipKmt9Rl0BeSThquesGsj60IyMag+lHc5geqN4BFlf8n5OKct6nfQ1KAgUPHKuB37KAKIfSDDt14NPSuvda7LpFe5z/LsbwL3dnt7S6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817333; c=relaxed/simple;
	bh=xyfqi3wcs43bqJjhxmJmQYNslqfZp/UhIsnxL1Nswfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UC4wBELjfFw+zjlFF8RErAx4bxvVL+JasumKXNoumGunr1XAxRDZqiKa4rmbOxakhsc6dVZzHaUlXXLWvNfh3Dn/ZLyrbwt/3oyKUcxi2q1vbg52t6nM06Z4s0oqhH4IiwFcIiMwyXdPEXqymQM+kfqlF8pHEsybOftE/KD+Q/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=GK2F3LjB; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=NT5B4wvj; arc=none smtp.client-ip=23.251.242.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="GK2F3LjB";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="NT5B4wvj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rodjp4ft5fg4rp24cb2ntayvghblvgrq; d=monolithicpower.com;
	t=1773817332;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xyfqi3wcs43bqJjhxmJmQYNslqfZp/UhIsnxL1Nswfs=;
	b=GK2F3LjBN3GqbPIIB2DJAVnbz0eVHD9WRGXSmtKt4GcsLGRedMp2SVxptHAxAfzs
	PRqhPv6cNlL6LIA/BqJ9BX9FMApjh4GzgqWNPBmj/Ud2R725N9SdwZp6y4nbV9ke4E7
	thyFaAzqoHsj8PnAQzhp/UKH9vInxgRTU8/jxL2wkHqPPgD/Qk0Bxp3sUw4Uhm0e43f
	ijb+GRWS8XTgWaBalEH01EyLZrpzaHwr9kDsaj1TaZZTaO+nVqkQ9XF9NX8iaV23XaU
	GllJoRyXHVV5hpOrdZ6rbkm/lX602hkcSKmUywOnd/NQX2pa8ys6RxFz89XpsU7loS3
	gl0hCsM1GQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=voqdhibj3ww47nmt5hkqcrgg7xiynmza; d=amazonses.com; t=1773817332;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=xyfqi3wcs43bqJjhxmJmQYNslqfZp/UhIsnxL1Nswfs=;
	b=NT5B4wvjwGBUQQQjZ3/SO7G0uKl9b0dAdOHv1mfnR7bQoP8pW8EGFEkvXnfgmMw9
	4uFeFQRwPfMbw9lvQD13n/YoTfN4PJl0Rk1OVXRgYa2JO6AQwm5wJmjHIoJipGgoV5d
	NInS8Fbkyu0TF/efC45NZmgkKo4Tsfp6+tNhm+Vo=
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: Yuxi.Wang@monolithicpower.com, linux@roeck-us.net, corbet@lwn.net, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: wyx137120466@gmail.com, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: Add mps mpm369x driver bindings
Date: Wed, 18 Mar 2026 07:02:11 +0000
Message-ID: <0111019cffc080de-4f80c201-5cfb-4bcc-ab98-8c8747aa4639-000000@us-west-1.amazonses.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20260318070115.1609-1-Yuxi.Wang@monolithicpower.com>
References: <20260318070115.1609-1-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: :1.us-west-1.CVpA5H5M7EMrIGr0u6+8nP6wkCH59pkYLxtNQh1UjuczBtN1WmV60RtUapmzBbQ7+P+SiHg5vbyEpY0uRvudPF12wRQI7xDHNKjWPMJN/yd9hVbV9UslJ09o7rVZZCRhPDXT8kPM9Nch5RQcZE90uz62B8giHS2hgInWMbQKX5A=:1.us-west-1.yP6/L6iaxFc47BvsTr22yvAX3nKjbzwVEN8jceuJEpw=:AmazonSES
X-SES-Outgoing: 2026.03.18-23.251.242.9

Add a device tree bindings for mpm369x device family,
which includes mpm3695-20 and mpm3690S-15.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..7b9d9bc89d07 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -342,6 +342,10 @@ properties:
             # Monolithic Power Systems Inc. digital step-down converter mp9945
           - mps,mp9945
             # Temperature sensor with integrated fan control
+          - mps,mpm3695-20
+            # Monolithic Power Systems Inc. multi-phase controller mpm3695-20
+          - mps,mpm3690S-15
+            # Monolithic Power Systems Inc. multi-phase controller mpm3690S-15
           - national,lm63
             # Temperature sensor with integrated fan control
           - national,lm64
-- 
2.39.2

