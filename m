Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECDA37F00B
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Apr 2026 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211323; cv=none; b=ctthlwMmUnaPhr/90e8AoYHPYMkRnDive+64fgS8fvXCSCu9Sg08FmS3oy3a6C6JNdjl52MbKisfscgu95QRshfh8nlo5pPl1J4FarGtRu+GZPD9tM81T/adIOwlhQCn5O2TaNpsk3AfXI+tLjNZGjgnk5h6GQLBT9SRehmius4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211323; c=relaxed/simple;
	bh=M8pM+GPIuGPy5U0CrCsD+rzuXxctkeEQCRG4ScSiarg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=jFF0kymH80XRRnzG4zvKTWtTnFVX1HM6QaLeHAlcUtM39PQzb0IDS1EcscxiopR5vSh8nYNzUfqeamj7hZ1dKBhtUwV9EuwCQryaqIE5Km+fKdUZSxnd1/sSI2MzYdaFa35quQba5i8HeADjyzHZQgAPiI9b3XerIoA+nOpxk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amHTerVL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amHTerVL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aae4816912so11019555ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 03:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211320; x=1775816120; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=efhMbwARh0s/fyMoKyosJ1VtXtEFuu3Fxddl0+j9z2o=;
        b=amHTerVL6y+ygv3DQI7VlMweWKL41zxKYnl61M/V0ZjE1D1D5GirDB4DY6/ekyVv1N
         DtPafoxoY2m0edWAstfVic6Mul3/Zk95ST4LL81hynslInJWK4cZENPiXbIvdcmkP2E1
         RurstDHySJHlns/+eTXiLpQWwG4TXwIuJbT+Efrt1HF1EehZtWo4SQw4RcUYlrLH1vVy
         R8qS4wz3Pcu8EBTkirWNDaQZ+1Jsleiwsdn+7UlD2nJpgh0iV96CUMgJJchkEKqH5dJR
         dpLvYadOSfa2iHLK8AMUYrgS8UBtUkNCxbQ8yctCyA7HEWYIs6N5TeyQtmsILAFFkVCB
         yvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211320; x=1775816120;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efhMbwARh0s/fyMoKyosJ1VtXtEFuu3Fxddl0+j9z2o=;
        b=bBtxt/KcS8G+JIZzmIF9xU4N6QhrkT3FfAMYvYzTc/nMwuvWc5jSerJo2mnWR93tD7
         dlOlfOVFMuqeTD4uNutdSYRFQycZdWROuhPR7UfPZKX1X1j1NWVvqsjG20Mw16gO8Oj+
         XMICuNW5BcS6kA4yDv3beGo15sbVpo3lbwNNll/tMG5BxCZI3U4mzpVa48nDjX9kvtqE
         jj6f5x9GK89R9AEXnd2HjR1wSj02nOCW307i5GqWYrGP82VaxJDXtKkrKUr6AMhHgB7j
         yMTxq5MXKR8/SQCW1di9Zg6sAV7bi9rhO0BDmR5Mi1axnQPb/aBs8xIaN/6BE+3WiJwW
         rDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+wX38UMfY5g8R44jPrtB1U4fGVeZBMTE6JEf/fbBwbV4zs7YWPGq30l2XOTSuwnQgb3DGL64vrr+cew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFeQFaDRQQSNSioU0mQIHY0pg5EyCF0THGh/696CnVzaJG9QCm
	GGk4tnJMTMZG4qNh/ZNozgonlFj4qmQ1zvNOKJxBow+AQRI1WCFpwfte
X-Gm-Gg: AeBDietYi4K2c8hJhJ8USzFVAvElgn30C8nUT6quUgq/kmSV9/+o45cLLnRGcrqBa04
	N0/L9FfGfbisbZyr9dRj4FRJHBD2IIp6H5lt19dY2oJ/8he2MfqhgSB2PFSzNeZNksCWLiJNn6m
	d9u8SEiIAQOySeenPjkP13dAgh+bn0SaDdsS/Oi7mfGK5Amfq2V7M7CRUF9uWzpn9fKXJJMr8WR
	vRDR7Dj0XWbnPDyrGqv1i5MGqiuqfGwBuwguCa+4R31I+XcWyKcj4ldsxYDbuznW3NkJ0pdWcjG
	pBbH/ef7ClYIZQFt/wGLgbgidJlP+TLf1pxpniTbIjWU9Iv4VpyOjAxwsQQJ0RiGkcRpynZCegh
	0O+1uXUyvAyFug4E3CktBojElMlJBenc7b0HH+FU5J94prHI7kQq0oaCUjq4owmkZmJnW+QTZaO
	KnfvpDhVNMtGbdoCkExVQTUopHcRcZgyLbO6X06FlbOQULgjP07be8
X-Received: by 2002:a17:902:ebc4:b0:2b2:4697:78fa with SMTP id d9443c01a7336-2b28188a80cmr26284235ad.44.1775211320378;
        Fri, 03 Apr 2026 03:15:20 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm54383675ad.3.2026.04.03.03.15.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:15:20 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Fri,  3 Apr 2026 18:14:54 +0800
Message-Id: <1775211296-63722-2-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
The prefix was confirmed from the manufacturer's website:
https://www.gxcas.com/en/index.html

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..354836eb8e72 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -676,6 +676,8 @@ patternProperties:
     description: Gateworks Corporation
                  use "gateworks" vendor prefix
     deprecated: true
+  "^gxcas,.*":
+    description: Beijing Galaxy-CAS Technology Co., Ltd.
   "^hannstar,.*":
     description: HannStar Display Corporation
   "^haochuangyi,.*":
-- 
2.34.1

