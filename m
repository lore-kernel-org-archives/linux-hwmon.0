Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A13DB30C
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517111; cv=none; b=RTgkfCRExLBeqAbGsLsw4dwyO0XblqYOF7u2SX33PcXL/WXTtuWq4uyMNM8MPeaYCWExYLN42XKzDdc5MKJtsqjP5vZi0bktZMiSsP5Cxg3P2p6eq8BV6hzREEqM3LBrtGUf8X7Li/zfpbGlTs6laFd18+uZYsb55VdB3b7f3rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517111; c=relaxed/simple;
	bh=HODmTcXqpkVz8upSr1TfFa4wg8vBwZE/zjgJ/idrByE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZQndtjKNYNZLnxSwXW+gwtrrZc07F+3PCofjkbQObN99vC4UulMEy7gih7I589MaLANbZL2nnXx5MvLr9BIwbSDaNLeIPG6R9MD31oob86airh9J4I0jTrQFHjpAwp1rlRAYbGGVmkKU6o8CwDblsvt7VbiyjZXb1bKIrZ11xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOEMvekZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOEMvekZ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8423efad617so1923537b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781517107; x=1782121907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/rIphLJeoUl7R3ABdw1JOIvV3ARmALyt+fJc+YgD7k=;
        b=rOEMvekZW+VYyyHeTkvaS4nbH9OZY663o6EfAms1hfRmJ9K8pVACcsRXU7CyfaSPGB
         0o7fDFSKAxpFHnY5ifBwLlQ571E0kK6eVoAEwunlBrz2bE3Q58Wtx1xBjWEK7P1vtXf3
         w0+q+UH7SohXOrKfFRuOICSpmks36IdoPT57hTK1XQ5/zAyauP/3JDrIu3hxLb1yh6DV
         Povi3WzLMjjNIwVGTVs1SXjFbb+q89HWQCeEZl6o66/KsC6mK7hn9ik8vPxl0PN1MQdG
         WwyZts9YDfJYz0qapUALIjnZ4yJ8Dmqnjc4OddsFG8QaGgPDUIY8TLp7YkG7zOC4S/4b
         52Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517107; x=1782121907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d/rIphLJeoUl7R3ABdw1JOIvV3ARmALyt+fJc+YgD7k=;
        b=QBpOkXosrM5r0P6bAj6eAOxp1zZQPAxosOlzvzb9N9DJwTj7RRWDUHSbAtW3AoJ8oV
         O+QrUpx0OAVuZdbN8/YnJVZVXvp3ZxnFqVe2NwfiBmdHcXpt1o+sQZhsE5FRxVwMz0T9
         RHH3C9aR5m6ddqqvnqobPrqSXoK+a5zn91q+5pQDQUtHrEoXWsNwLBp6c26aggSiwKSN
         zmQHErFivgcIMRTWF3XRY3uHqa1ZvBIw1ZfhQui/wxtCJik5Quni7sySvRRIhwI2Cwur
         oGyxDsLXCFwSQPWm3RS9GyH+quDvuXeI2ozEsm63somEe2rwU3X75he+1+6TlRkaAoc0
         ndcg==
X-Gm-Message-State: AOJu0Yw1uColVwnKE4PXv1pt3sLaut4LwgRVs2H5Uq9mnDNX6fM6mToy
	dO/eexooIJeQCGGzXEij/CyY/tzsKqAnjZWhLAnteNfRqoY4Fbvv8Vb6
X-Gm-Gg: Acq92OETAAoAZxdnxNwJkM0cRAkrHXO1b65lC5xAFwW0ml6TVbF8WNlszZ4AgiPPKpi
	OQEfGxDw3LfviV/Y3O0YET2TLJQxXT8lI84OehZnZBpSS1UO907td9ZbUvMpn3iEJZCF6AGZJ6U
	hyL7at1N4PycdOY6zEzna5OXP9ygEU9DmKh06/BwjkLBC85cqsF6/8/9WMEH6PH3746oNmJ0y0P
	e2taMUfXgOSQBymo/zvJF2r+To2mRBf6BJ5ZZ4LIiCtZx+RfagIcsgkYd2GIzp5QnPytJH65kPI
	pX7e4DoeqY1QIM4qD9H8QJvf6Ask9SwmsDeS/Y/fqKk4+qe/dgfhG9f1l1xVSeEEPq5+eipSEu2
	bZVmZTqR21UD6ZTchXoi/fKic2pXWi4zySvM+1vc2sg5WRbas5DyxSMZC5touKeI8NIiV6xnmec
	46lzyz0ZopFR9SL9GsjRQcpYTWxjJ7dG0uZ2wvvbPavCErTnkKvt8tCC3KHrDVyryZuA==
X-Received: by 2002:a05:6a00:1993:b0:842:6004:3fd9 with SMTP id d2e1a72fcca58-8434cf1590fmr14616990b3a.29.1781517107309;
        Mon, 15 Jun 2026 02:51:47 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm9922207b3a.33.2026.06.15.02.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:51:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 15 Jun 2026 17:49:16 +0800
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>
References: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
In-Reply-To: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781517101; l=1952;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=HODmTcXqpkVz8upSr1TfFa4wg8vBwZE/zjgJ/idrByE=;
 b=7z8rPmUZMwcSfoOqG62nxNjTgm+lFLygOWMSLDLYp7uz6FWBBNI8fe3xR7e8erPbPoOuq2g3+
 fdhumYCR2VFCTdegyQSO0MRCny+XZ/g7K6Vwn8b3J0nPAkg9383HH6N
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Add a 'ti,current-range' string property to configure the device's Current
Limit (CL) behavior to "high" or "low" via the register, overriding the
physical CL pin setting.

This configuration is supported on LM25066, LM5064, LM5066, and LM5066i.
LM25056 is excluded because it does not support configuring the current
limit via the DEVICE_SETUP register (bit 2 of DEVICE_SETUP is reserved).

The values "low" and "high" map to the respective low/high threshold
voltages of the chips:
- LM25066: low = 25 mV, high = 46 mV
- LM5064, LM5066, LM5066i: low = 26 mV, high = 50 mV

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
index a20f140dc79a..fe42daabaaa8 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
@@ -46,12 +46,32 @@ properties:
 
     additionalProperties: false
 
+  ti,current-range:
+    description: |
+      Configure the current limit setting. When present, this property
+      overrides the hardware setting of the physical CL pin by configuring
+      the DEVICE_SETUP register.
+      - "low": maps to 25 mV (LM25066) or 26 mV (LM5064, LM5066, LM5066i)
+      - "high": maps to 46 mV (LM25066) or 50 mV (LM5064, LM5066, LM5066i)
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - low
+      - high
+
 required:
   - compatible
   - reg
 
 allOf:
   - $ref: /schemas/hwmon/hwmon-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm25056
+    then:
+      properties:
+        ti,current-range: false
 
 unevaluatedProperties: false
 

-- 
2.52.0

