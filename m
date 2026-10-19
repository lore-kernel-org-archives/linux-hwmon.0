Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435546;
	b=ceQp7ShvOeuLbUT9+K4x4w9kKtRtGDvvfVQuYSv5N5i/Sc5lPZMysUISGcSvYL6Qd3/N
	 MWMOYugpBmP2B3Cfq2cEqQnXq2yWZagRDOokKtO1n+itabX0NdrJyoax8NCetM0jx9Wjz
	 gWjhWEHTu7ZOr0guKQVSQvVoyq4hTirSluotlJfY+oPIEw8T2MQPXe4tdpN0KJgHvdAs2
	 it6MpPtj/5ATP42c2j2Ir6fESe9fsQZ5nJ/ukItsFQVy4ofKfDGlN3MLWW2AgNR3F7fpC
	 0g2FFrbzgkDjkfHhVcy5DIo8pkuF4qLBNg3pFuyH01927m2oYg7TpB2mbz1GDZDM/Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
	b=DpKa6NOyNkI5I0ko9CFaC0APnKzmJw4nnVecp0X2TQOK3/uI3vG45n8+fVokVXgaNosT
	 RoFTwH/OqHniBS4uR4WUzHcq7QNxGeV9UTIMUKt6bjQcgISESB9gsPo6e/DHFSCOkuxGa
	 m/c+nZdjQfjXaebSuSAVxT5li7iOzHaA7PTA0KVoSoQuPyGVntV24Q+1HVePA1+/BNt2q
	 s8nZc6kyun+1UMa7Ogyn5jQoMMtBwmZlP+n6uYK7qb3bBDu+Dh31EumXTGUzXPTgDXMbI
	 VzrWHsloyRbRdizBEKj6VuKI+vrmqHIBxfxOlxRX/tTU3N5gm7AwmmAJR/itAi3ycDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CROF+cxV;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DD606A337
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 18:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613DD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CROF+cxV
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-18cdcfc05ffso899676c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435545; x=1793040345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=CROF+cxVEiQyCpnV1Ol+NzHGgnxT88R0BFkUrod3jp1qyJ7/I/GHJIX1pjnufC3RC/
         ME4OtYwxOG2Z+oFmXjUkYoN5GAvf+zrekJVQKECUa1xfnKibOZYk31oflHTnbBYwIutp
         5/fq+mxjPPz6IQNFabdq9vjeD9W09bc/k+5+nljvtz0d6+0KrvrAjh87LydLiL8SxTyg
         9VcuD61HvEFIV9gZb0dmRGPXYSoRZHpXlJ14rarNUTq/REoCvjFzaPbxhxPKgmWxrdgt
         GiFzOHkr6uMOwHjIgXPq4MHaYFYw+Wnpmxczlv360BFsjRlnxG4mp5M4g1J7Ueamh8mn
         3nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435545; x=1793040345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=Z+i3yZ262DCIyF/g3GYZXKIFRJS2NPySI1iRcf8lVWyxYtdBm+DlRLfRS0AXbQUCC5
         jd5vxGyP0xxwpJJjR4GhjuWMUJiXXIm42lQ5aTtF5ZJCCErgq2zvdkU/JjdBRZBmgqiR
         lYZrjEQD2TDMjmK2SbCnDZPHxeaPi1w4PzsihWh3F8Eqi+mXyf297+OxEHmMwJOoa0mt
         x4Gdk5rVkexv3FYv9pbYoIqhNWvLMIsPNMID7ikQmCG05U2649C5dU8cBaDjXxYtdgHp
         Ss7YqG/vaTO+aP8/llMjYBMu/RulDXw6K3Gw+nLJUaYpuWwzyIQPxfTHOScgPQHhxa8e
         ct6w==
X-Forwarded-Encrypted: i=1; AKwUvBzlgOOzYPQOflDssvgtQBCRBHWz0mcEmrhJYUreDn2rGu2Vc+FjjrXHzrBHM5sRC2Vy5ZiNTND8D4bvUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3K1HjGBIOTEMaRZhfSG7oMyf52+ySC/mYlwF/lu+ISlHaRBSU
	tCt9QHaLz09lTi8IvVYTknQcAQK9UmG945BtvS27n+3F4rY5THTwYwUe/Wb1f+uXoglWqncAStN
	X3aLJ7uc=
X-Gm-Gg: AYBFou0hQZb2InIzQ8rLGz/C9/pCkpmW7CX61qVR+kH+w3I4tLMzIy3xA9pbrsRMWdL
	h40M/yRVGPdTtLnV0UCQTY79GRaHwJ37WjgS0iPztpNzAjvHCiL35w1OLX4nhDCx3Jh6mV+kQ3O
	T+y9NsGCR2P8dmGZMxZz6NZWJXhomUW0LE9wdpC5zUlIGc+03C6gSi+nDOEloO/yOvHaSwr2Qo1
	1Q0qrSvkfysWMPnWoZFXsNiECwOTJmI8ayEBhvduYGEAKVMmwFVXkPnMk2kO5ohc+heJ38rt1zA
	f32yrmSF6xevRTCkU+WQVttSfyiHqSLjlvHjBLwHhttTdCurLBxOBnGtScMYRClk/RalgnLp4iT
	QcEE90eEyrt2Cz5NmulbLJUOqnD9LDO2/dBWpnGAYNFap9HbFmJ8trIK6DwsuDfGkA4ni3mb6q/
	wz+CSaMSt7Uq+RROVLOi7tizwPEp799hUMIK5dm8yeSs9mHSi9FeS5WVzwDeaATu9hgg6dM3qiQ
	P4=
X-Received: by 2002:a05:701b:4183:10b0:14f:4b01:40a1 with SMTP id a92af1059eb24-18507fca393mr12939427c88.0.1792435545495;
        Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Mon, 19 Oct 2026 18:45:15 +0000
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fs1603-v1-2-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
In-Reply-To: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=1668;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=vv7jc6T42fhaJkWqiEeKPohXQukidcy6joILhcZ0eqE=;
 b=HII5ZHZ2cEzr6ZQ/XjUeiKk53W1QW46O2/OsGyl1EYsF4RSfn6+1k5/9ZFqIGdPzQ9eBYU7Gg
 TTkqnYQGH9vAuwL2Di/mC8zwqZG7d0WgXEHuyclQQ3UGjf6wx+ysP8A
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
get their own compatibles.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 42527c7ee9c8..73bc8c130802 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -466,6 +466,20 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1006-3300 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-3300
+            # TDK FS1006-5000 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-5000
+            # TDK FS1603 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1603
+            # TDK FS1604 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1604
+            # TDK FS1606 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606
+            # TDK FS1606-0600 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-0600
+            # TDK FS1606-2500 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-2500
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.43.0

