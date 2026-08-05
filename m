Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B83E4C6D
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921119; cv=none; b=pYe+Ob32lYaB5p8e/moiBbPqJUIht3ntfY0HjTqpuL15SStIlHvdO0m6DXdow7KPlVoOFX91i0nlxb2/PidIZwUEdHKOabyd6qMgx/0NRxSpD9Q9WETCoTH9Kn68D+DGWmE2HdinqMsh1jRHTnODpC0O26qpoFgDMkWBkS7BXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921119; c=relaxed/simple;
	bh=Po1kGrx5EeIEP6xmiLoDE4sxhUkiA/m5kFmOQAaZHUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=mt1iq/gir1fnry+zges88VEN67HqyW3C0q+ye26GjzR4aIh1cXT64zOQdNbHqY/M+eua/gFkrN/GVMeM7go3wdkwJA0fzpLSN33U6qdjCPMN/kVEXWmJ4VPnxGohsHd35+BB3lCnkOxzusV3VC+jA8TemoqXZpMPzmOfV0F+4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o+Ch8Hg7; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o+Ch8Hg7"
X-Mailbox-Line: From troy.mitchell@linux.dev  Wed Aug  5 02:03:29 2026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785921115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLTSEYfRh/OPcBA2Yh6WL4PX3iP/fJj9kbntKv+PhPk=;
	b=o+Ch8Hg7SEZ6tA+UIYwDO52d3OZ9y/06osXf/k6PR3UuHaTecNDho4mX25T4NUOqMV4Anm
	WUVsMQza4qeIUedeKKaRWvUOGXyxWUuU3Q97Cqu5G5uB1ddh4w2/AdpLxb620Ikik5Szll
	pNngT6WaDxwc6pDwtbLfCp78MuG9Tfg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 05 Aug 2026 02:00:51 -0700
Subject: [PATCH v3 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ctl2301-v3-1-b86c75d1c552@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=874;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=Po1kGrx5EeIEP6xmiLoDE4sxhUkiA/m5kFmOQAaZHUc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlFv4/IX02XPafwbUus3LGUd1XNzBd4Wc4sXlrj0rRde
 afOU/c9HaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOxy2T4Z/zqaLj+oQvmq1YI
 lSmqKqb5ME59stOveMXy5jXqbfcOODIyrLj3ebGu91Gz5mLR32wLni7wrpjgV3FSNPGpVSif+BN
 /fgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
In-Reply-To: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
X-Migadu-Flow: FLOW_OUT

Add the vendor prefix for Sensylink Microelectronics.

Link: https://en.sensylink.com/
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..22d0d26f1bbd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1467,6 +1467,8 @@ patternProperties:
     description: Sensirion AG
   "^sensortek,.*":
     description: Sensortek Technology Corporation
+  "^sensylink,.*":
+    description: Sensylink Microelectronics Technology Co., Ltd.
   "^sercomm,.*":
     description: Sercomm (Suzhou) Corporation
   "^sff,.*":

-- 
2.55.0

