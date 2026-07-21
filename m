Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3287340BCB0;
	Tue, 21 Jul 2026 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615540; cv=none; b=YfEsDVaC4CkB5C2On6uWLToSECYxgD5tNIRmhCpy6V1Mwzm200zzzfB70Pqy2x+EXBwQz8IbDsdQPt2w6N2BLkszY3wqKqmBwUhCAxk3kIEQeUuFTCy7cXoZbs/fWRElyqdyEKULqyeTWTrMtjZqDO39pCI3WQH4vJL7SjcVAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615540; c=relaxed/simple;
	bh=Bn+mjHD2IEppmCcxLbMdGRfdadYeLoPUhKh/DKeDdwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxYL5nye06te4uydaYlnOoTpvpptozZ6FU9Rg+jRbH1lu3/D1fKypDCI0vf7f5LijmI0BKpFOZqGeN3vdTIBnDFRP5TJ2W638n3zCvlCxx4HEe711iWrdebvmAgCLH0KNl6etKIVdtC0fCp8bNchlhOzmzsLA5z1k2xajcaEhMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0TFss8H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0TFss8H"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0141C2BCFC;
	Tue, 21 Jul 2026 06:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784615539;
	bh=Bn+mjHD2IEppmCcxLbMdGRfdadYeLoPUhKh/DKeDdwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N0TFss8HnoalmVLy9gVe1WThqevTQH6+5alO9jmbv0ZFx0UChC+8YbhVoJD0Gv9qP
	 np039YRoGh1R0IrWhr1df9/X8HZvKsvsqyIomjlQBtjzK5xGnYCMe0T98+qhmdyfNo
	 g+FDj9aWNBzVN8pMKgoj7V86rK/YqLd6XgEaVjQl0KlW+EoQjftj01VARA7kVlPMsw
	 Tc5BJOWisrT8cjsiSiT2bWNDqPVA41WArc/nzVUyxzyBTeYlGw0EIKYI/Wr9PcJUxW
	 OGxKeVlR0uxmBdCnbeC6sc7OuJkQMddCMHSW14vK2T92zeaj8eP6xZ52poe/ykOr6A
	 fFqJ7pPp1wpmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B865C44529;
	Tue, 21 Jul 2026 06:32:19 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Tue, 21 Jul 2026 14:31:32 +0800
Subject: [PATCH v3 1/4] dt-bindings: Add vendor prefix for Kandou
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-kb9002-upstream-v3-1-70563922be8d@amd.com>
References: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
In-Reply-To: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615506; l=789;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=3lNslbOQdXYZMYDoyDnFtx7x1pZDPtfgEkyZivjTfbY=;
 b=cVJXoQgL+20qL0b5gsAGWZ3YQVRFpuaE2kyLpHSo+GfASJD30FrHzrZYg/iTbyn+MIbf07Eo9
 gQY40mfJ7jiCZQmd9UBroDG+T6pfREx7cc3Dn8l3KPFY/uWDl0iwD7v
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

Kandou Bus, S.A. is the vendor of the KB9002 PCIe retimer.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..727871970d97 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -879,6 +879,8 @@ patternProperties:
     description: JuTouch Technology Co., Ltd.
   "^kam,.*":
     description: Kamstrup A/S
+  "^kandou,.*":
+    description: Kandou Bus, S.A.
   "^karo,.*":
     description: Ka-Ro electronics GmbH
   "^keithkoep,.*":

-- 
2.34.1


