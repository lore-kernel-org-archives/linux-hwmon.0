Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482223;
	b=gen1jwKNbfGMNdw9WL04xLxA67AjnEuLGgsxOML8HQofkEzM5DQi6S4GFFZzCXoRmpr8
	 9iXdmi2C+pfWn8RosUauluMuRO/hEUUPZqjflyuGEgBfVHQyW/A0KWVQKdHifd3t/FzY/
	 OyNigLXdfdPzbOOf4kAitt0l7e9/50T1F9WvybdgO0mDNMNfrDDGffvaogdV+esDHWKgY
	 7w8Qwna13NTdWaLnptjAy0D+v/u65mk8dhWRbzfvWVeQqwc/1TUdip5bhCAKOZQy6Ymee
	 rgH9xykXUFen+soTbzgPZPyRlwNJkj11QHFDk+301m9l918AuI+BBDYWvn0rxLLMTUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=wFi8MloGGyhyliPZ35P2waw82t5oyOBb5gIbo68zGzCPW8hotoSdrYe8CKtVK8dmVXY0
	 vOL2pVL7+f50hYpijuHcyUZC9Ayydme5MsnRSUqiqNOH5Ua0cVC4FYqYd994RkaKYYh6C
	 UvmjU3c8rLG7ZTQz+riNFBswxHI9sEXoxekMfHUyz+Xa5a5SjqJxPHSwYWCFo3l+yFKWx
	 nB93StavVuWNRLBYVbpvEF5p8ISfqjxPkXqehLp7EYQtwEgkmx0qXBla6CS9aM0dkqFJf
	 IhyJLHSJF1fo9YHGsEs6qe0pw98laHZ/69t4fUXBesT5KzZV519hkQueUhNzojj9A3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=jcz2VWjk;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED2A606A32D
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 07:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED2A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=jcz2VWjk
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36661f953e4so387525eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482222; x=1793087022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=jcz2VWjkuRfgXbBhx/KKl5w3vkhEDoiY+Wlol1+XvK0xP+awL4v9Q10OcBvf4rFcl4
         mO/gUbwhDOwJgHa3+CTRFamicC8LDSXg83G8H2GKq93UyarAqRuppkGft3Muf8i/cpEz
         8cIbYEJLL6oweIwHxr+I1CSZS62dOD8k8EJNS1Rg6GMdNsxGAC4/4U1/46f6YsuHoBFZ
         IUy7jtA/n60fl3/GARvQ8sikZqHc5EvHkGrcUHxWUP0ZRCjEgWxnqBUw8TXkzNuGd5JP
         u/YzV0jowInNgDG43z2AzzZ1Jm0upj4IGqA8LugeJuUe+edGwWHoVzfB57k1XHwcIGzm
         YlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482222; x=1793087022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=EG8P5EMknYldTpbE4U38MxWK9YwPAEW8ZWATIsnVW6xLZ5xLCDh81QrP6+S6nBbulo
         ydjh7Q2X9bmebBcUm6+hhm7M0VH1ZlfY2DMf9L0JidWNArVN0fpxHSW5pj5foNu5J5m4
         3XAthrLPHOmvhxZxHu9MfnDDKeVg0COPGcakyiNgxwegjLmLlW2qCGVzL4+7s7ZlsbGM
         Icg5MXaFyRyKewJoq7DMW3UiOAvupU6X3vNYVAeC70X12fPmBBZkD9X4I/vOVmCfv22+
         rGxRVgU0qctoczk6iMWb8ECIz67n55Mlh0D4zxqShjCrAnu72VBd3DQbiuu5JyKBo3wC
         J9Mw==
X-Forwarded-Encrypted: i=1; AKwUvBzSWbvKZqsti2dcuTPZ2eP3Sm5z4lrbXsYH4GPHuhZ8kielVosK5NrMTxaw3zogEcv3tg3M8OG7Pj2g8A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKn+FUod0a/PbqKBXE92mkBBsu9St494cyY6BH7sm2PBAoSyZZh
	5n08r22lI8WsN+N+fYEejlL+8hRtmPnda/f+PIyP2SC5TsCZNbdgsggKy58MCEFn8fE=
X-Gm-Gg: AYBFou0ITjaAQm3MNHiM/NyTR4mhOw05sKNGiQkvU4r+kJspQFW7UMRt15ojn5MM2fS
	1979+7UCijCqsRQFXZiW3/fnIeQ4rU6uLxNVXIpOpB1XloqiJXlOiFflqcmcFJHVUlMotD5fT7e
	7jGASUMCPULOa2HM7eyQJerp7yCVSbPGIH9MBArmHZCQcUg7KTaLiDOwnjCOfi3+8/HcAOdzlGi
	cfBeh0ZnPOvntBQqwyNeVzuQuL9qCGkhPUd7l9MOU7qDSr3hUJqFVzK5H4B0D+RHWjlnYmT1GS8
	CDyywm4XeBkVq8DEe1ep3ivN1P2nwEl1Vrh5TINpLxO/08E/SLdzVCk/z1qznpnVaGOwVmgIPUW
	HI/eY4OV0+pN0kfWxoBrVwcK+hk9HVbPSYMcSDmx5tn98X7JDpa6g44djdYafVd1nfzz6tgPEMW
	9qa7Cefj/I2gTROVihE95EolP/4y8RaSUIbDhi0VLVbTUOQXohhlmwhdXy3yrmrt6vDxyYno50c
	Q==
X-Received: by 2002:a05:7300:7aa4:b0:35e:43fa:eea3 with SMTP id 5a478bee46e88-361a137072dmr14671485eec.8.1792482222408;
        Tue, 20 Oct 2026 00:43:42 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:41 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:37 -0700
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-1-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=Gc8fMRC2VdUO2eazAV2eIUKk/69CqdZf3MnaUZXQVl+m50iPHpTIDDuZqOY9uzqOQHCX4/rxi
 Yd1BAvbA5N2ApiBCaavG6v3/71xIelOS9dkW1XSGs9FjolgOS1/HLic
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

