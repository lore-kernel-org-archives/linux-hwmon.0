Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9CD42980C
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627342; cv=none; b=X2ElrFLOd+RA+6y/KW1UX+ymoqrLuY8nlV3FY+pcSDCM4V/dvfZOpPzAzTXY283S8xk71JsfW+69+R6wG36SKeoF+N7rHnqdRXfHa6SAJ/giuLrMeXDDdRFLwwqHhSHLeDiMNZA0Bz4uhZ+usjO93XhPrS+VNWeiC9j1EvlMZ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627342; c=relaxed/simple;
	bh=612r3AG72QRyYEjk5fbNd5SB1mpMpgIAzo+3/vrc600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mO2VLmb1ysHsjFb/7uX63G2BiJ8pR9KVUOVj1vT2p1lYSbhvNFkc4vXH0/FA238ZKfiQIhGPstzrkAz0418VDAtIAlf2OmuUqiWa01U4fJL+zVrmEzCUzIOCiWysU0RgOFAn4WiShDkONNR+Vx4eiGtzZj842uZ8YJ3BapCrypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R1QVjBNO; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R1QVjBNO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784627338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yW0a7NecQZu8tgs68hPXWQu1JjvNLTiVMw9Gd5E5ZSk=;
	b=R1QVjBNObzrVZoAzzhS18ns7eQ/nfN83ZZsTluCtR6BUhNdVarBCKu+fVJz+IFNWbxPgbx
	mscmDr+wGMchsOyEpm3ro/TjSWACBQEWMPfp2fsOhS5GvH1p5IaNCeyFAl+XEza+xnJXPj
	XlE366aKqAdxlgAGcB/I4x8qdgLb2wk=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 21 Jul 2026 02:48:27 -0700
Subject: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
In-Reply-To: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=841;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=612r3AG72QRyYEjk5fbNd5SB1mpMpgIAzo+3/vrc600=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnxDvkvkq8plZgnyf9e8OZEu6zaDOZXLhe/h6jLzbtns
 1/kfvm+jlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgImcu83IsEFLrD5uYQD/h5ts
 195rfLCLfOnwunTugjb3MxsfSaTZdjMynJR8//lJQO3LS4/sGLQ07K/M4vyt29fAt6Qmw/klY2c
 iAwA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT

Add the vendor prefix for Sensylink Microelectronics.

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

