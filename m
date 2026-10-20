Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533938;
	b=gJKSzeJLmqpvlRNLjVXJwvQpCiaPB9TtMb+HA5A9f8ix/j2HE6J5YYact8LUwjlXgO+/
	 nahqsiIdUoxV6dwIGCSOlZueWGMgHSk2VOrV2NMxxYL75fLI+jDKZrMihqCKu6AHsqosS
	 VkMlg7WB0i4s+5a1r2cMwI8bjPog0rElu7S0n0snNW+QHcquDFN2xRduMI0QqauM5H8cI
	 Z2X1H+P9icSP2lUvNZotiCeF9CcS7um+SyHA6BY9gtpx8fhI2ub61nsx723UG/aReZ1Rw
	 Aar81eSabWTk7VCbxKfiBphG4ikO2F/V8BnfCaO/MMjsArutah71/E/7lFsE7Sxut5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=TIqqEnJbNDYArvBPQDjfUHfcajn0B/4zXhCw8g8j96WX0QUQ+O9vmRgzCPltjeYoyEen
	 Yv0yVdl4NdpgsxBS4ZX3JozlUm6Ei7uYeb49YxPFfIehVWSqUvkr3Kk1mVCh1++XD656o
	 eYgmgWdbRehNrGYooaDKugK63mpRHgKN3PmD4DNTVmod2V3+hiCee41neoz92RadfMixk
	 6kkpRNWjnwzvmNjrpoX1bD92HBm0sKI59VVSt/bLQHFtB32yyBQNWXa6lN1+oTday+k58
	 ypj5biu50uxVKjoMYnO/nZdl6edgFU1Lbb7jhlO46hW2yz+EPjAFwk4yE/hwoClPoNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NPwPE6Kx;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF0C606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 22:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF0C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NPwPE6Kx
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so95160eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533937; x=1793138737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=NPwPE6Kxyq+m2RXE4/kcOP4buIj/UN5TdSWBw5siUz9I/NaQ9dlqu3Bgx21vt59bhX
         Sl1uKFljcjeQQga7TzMiwfqXKp2tfzS3wdhICW/obgjIpT5MKynYNds8CO4qh8AbskB6
         onT9l3QVU45cAokS3e4XW2M6IBD+GagxwoS+jK/zWeR1AqJRLFSmh9WGAU/N8ETqWsYs
         orZeZLJRUYEfHTifC8DoZ1fmjriQMrmmYy5PLMj5gg5eqChkHPYzpND4/Zfonz7U//x1
         E5D7cijLfTPrSx+8HhMiegzt9BO1NEsr4i3GyMJtJvSsZqN/FuPWyo6jtKwhVahrHoj9
         00MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533937; x=1793138737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=sEuXB1j9QIzHNL5lpdivTD45rpNjxCn9KrT7T61WTSZCR4cZE2u+OZ02DLaYF0C66P
         fY+dcwDbSC31EdsUvYnSyuyAXy3ziAZCEuZOsKdxH3iT19hm9E/Aw7Mvk6OZcdAmkC6k
         +nDSA3P1BaWaYWNwSmkrOjZBEOdCJOTI5Iib6Ka11eWFyiYdlrOskiQSRs/o1d2dyy+I
         +/aoNFRbigshCQELXeXljg1yFsUmfuZ+b2ryLWoDSUk2WRFnWACV/nKGHXhp9OFDnukV
         Ybz3iNT5Bm+zMuFUJgllHsGA+9VqjyLkHlfk48eXRDMmOoBnwal3E/JOIPNvQpiWBHkU
         8sFw==
X-Forwarded-Encrypted: i=1; AKwUvBwS+SSZWMh5hKMxY23YY5honh2yeZInvPhTN6CZYbDTr5lz/ijAGxqeMUhBQEUyluQunNg7U/QE9lxOJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKQFrKrLphoz2O1bHW4r/h+0Ck8mHx8fC0+MMcnla0NqV5M0I4p
	BIKudF8tzFYiO6Evx8A2NNONtzQFXIeofaLJSzJdgCK4V3n2nz4u11wslIlPjx1Cz6s=
X-Gm-Gg: AYBFou1ynM/aYnzn2GZoLjpCk4gcjXC5zcsDcNwbylHtuGNtjhxZVXja/HcHhDXKw+0
	WAwm8vNVDiR+Orx07VdRI2q/UGq1mTon9cC+FLKg4Htmyv8qb4uode6OU8vTnwO6+13Sp5s4HOs
	A1PFsNxX6ukcREZJz8KwV3gL4pJKyN9GTbvOxkiU1UbqnYK79c6qIkNWMigrN8eMxqA/MDpjzv7
	2S5tejV7DgFjZBh/nFqwyZuYMszGaDKsXOGuleBtg4ZS52D7+Hoimhwm/YYRYyzp9p+a5obYpop
	gsfh2qASdjOnFzuRW6pXjJSmbZJknyNNGsWLhROv3X1dTIZg1y8jv9idAHxMRGNEKjSldS1X0X8
	ZiHOYfpCvSGiObq+WfF5jbr36Le8zWH/J9J0P4VFhlaVTeDHMbBvRXiOEC/8ml8lnD7cFETpTNh
	hWV28Y+FJul6X5Ov0dlbOeqdONf0jjIGF3csWwqhPYDPSLx9M181aT4GkOWa6DmT1JHnv4/Qxkn
	w==
X-Received: by 2002:a05:693c:810f:b0:341:5da1:7851 with SMTP id 5a478bee46e88-3674c63d98bmr751792eec.12.1792533936541;
        Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 15:05:29 -0700
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-1-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=l2kS2EcpDnhnFD/N9cvWATlaQCr1yLIqhT8XqoBCuqatXxny12JqA7U9ERy/zmBY7cxBSMgn6
 q+2S73CAQJlDD4h9tItzALF/JEuO3Td0tO+SCm/f1Zx6WEq6nxZotYC
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

