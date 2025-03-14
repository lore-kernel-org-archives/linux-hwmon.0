Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE6C5223
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Mar 2025 03:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741922958; cv=none; b=rCSO+emFBUEOM7AjMEbo3ZDckfj20e33/Tr/Zo3Lb7sJTWyEwyMnJxrVA1GGaGOuxaCq+Z5kITgtxMH4ss8jU/J9x8fsQY2leFjuAiQPJfQe9nFQsqhGCxXwzAs8P3AJc7kfohzk1LQg8gcO1qopboKDLar9sTSOmXDD3cn2Reo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741922958; c=relaxed/simple;
	bh=JEc+b4gzMRm5S90GGEKe93nchde1Jsk0CIuBtqrVGVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tg3svAnZtiKyaPLAOC3ld6FLk966pdmSLpwY3w1izmKZjAVA1A336lOndWwlXMuoo5xvKuGhmdnZrEUs59VqlESUQNbuZWc5iZ8BKg8Db6iNaAOmds7bpzwkhLJdX7R6M/UvBS9IoEPJ9lw5ncxSvs+B3A3JPTL+CyVLgLCRato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=b4lLNipx; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="b4lLNipx"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301493f45aeso1729300a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Mar 2025 20:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1741922951; x=1742527751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+fHBdefAKTuvqBTja+aHTmqTwfnpgR1I8Ype2lMp3M=;
        b=b4lLNipxIwuCD4+imrhpPmlyrAozjiZLVJaYbsI6vCyUgBJz61cKxeUCHji4eIMYZB
         au+tjFY19mKaVceuZdSC0qlUKxcNyMypeqLQyhVPAo2rGiqofhpblUPhmPl6jqqVt/fZ
         +i08cbSQKHwVRDbyGHd86y/Jww3nW9qQeQ4dhanRpIMz1KjyqMxRmsp6d9Oz2BIUdf8T
         f0YiyDwbCxMlqCeFc6dRmddDEapph+O/WXdpSLlh/W2A5Gdleu8oZsJZhAF/7MHXijVy
         EdeXmRBCsyUQnS8T364w2d5qeUuEnluRNDPNzXep/hjb27pvSBlS6v5qyw/QaO06zz/S
         crhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741922951; x=1742527751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+fHBdefAKTuvqBTja+aHTmqTwfnpgR1I8Ype2lMp3M=;
        b=FVsS4KSrEcL5ZjNpG+JAEHI6Qef1N3S5MxhXKqXaTfOzqNBp3Isb5rCqkQNPt71oVM
         6SX408oyKRRL6fCavtK+uT5axLE637DzChATIryjKEJujnkv+KxeOXbGurKBo27m6WUs
         oJiBBLLa60XgvEAIEQpuqrdJf/uxBViCHD+y5ugM7SN/2ciIX1FXWZNUNcWQ9PjdhK/q
         YxL3C05pGUlV6blrhOs0/sL/ZTQAldptz6cNBN24BgIHpyRlakqLnzIH2ZflRwpN3Epe
         WZsTyCI+6WqYNOBXVCkFDqvwMmUrrJXAuhCS4pqc+pzhpRQHvCaj9n+cjOfsQEx2whOL
         gutQ==
X-Gm-Message-State: AOJu0Yxg7A9MKkjhXbJVxw95qzNhcb/dW1M/nxMyq1nUTBRFlprlxJse
	DtWJdGG0KXnu6xucCWHTjVMgbSWDObyC211bd941mz6S6/fUtOhgi5dCLur0gRywylAJL9JWFdw
	1lB0=
X-Gm-Gg: ASbGncsa6FEf5uce5pA2JWPrKm8mh1lSZhm9PJh7M37K2M/Yih2oate+xzeNt6f7zsF
	dXWI6WdLu4UeLxBNQLp2SVO7o4nUHlC2ewIUsf3tMcwi9Qh+UKRX9BZb6jyHXx/aFrar+TlTqOt
	hXvdirNSGBRewP63HDIpBvAcDk3V9T+G4O8NIsT3HVREwyrUHtpdJEEXMT+YDg6vPKFQ6f9AqCw
	aIYKFVMve3o2IG/flHQYQ+s4k6oe5hECF6s97BKS4hxsUKwOMXnpMtHWReIqeaSy7G4bHzS0ldk
	PNTQC8QPUEV9CMHJuj7XjlNoZid4WQPQf01bKg+xgw3bGYoEJ3Pe3R997M7SSpGm0i0ceUBy92C
	XmrwxAWTSJyu9xNExlOM8gk4u8IBJAib3CB4r
X-Google-Smtp-Source: AGHT+IG+UDy0lo7+WI3GyqEL/W+EMj0EJQ3MyfXK6Q982K8vUIRQOdUgw1rN90no/x6Ww0uVMqmY2A==
X-Received: by 2002:a05:6a20:4306:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-1f5c13164ffmr1377359637.42.1741922951414;
        Thu, 13 Mar 2025 20:29:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9e5d47sm2058339a12.32.2025.03.13.20.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 20:29:09 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: linux-hwmon@vger.kernel.org
Cc: Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v1] dt-bindings: hwmon: (pmbus/isl68137) Document RAA229621
Date: Fri, 14 Mar 2025 11:20:55 +0800
Message-Id: <20250314032055.3125534-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add undocumented raa229621 into compatible in dt-bindings

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index bac5f8e352aa..3dc7f15484d2 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -56,6 +56,7 @@ properties:
       - renesas,raa228228
       - renesas,raa229001
       - renesas,raa229004
+      - renesas,raa229621
 
   reg:
     maxItems: 1
-- 
2.25.1

