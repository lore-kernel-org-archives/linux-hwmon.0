Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B1E156228
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Aug 2025 03:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754622319; cv=none; b=u1GdPKgoRkTt2FAu57Wp2gZ8KuX0vY3+MN7CT44LGDddvWsPFv11m2FD45LOMh5Q7cEtiqGcHvJv5F6cNk9Kc02T+9d+/FkFadylbuyAE+rqa97Ghh4EloNqjK2/rJ1gXh1CzansHg2gAj4l7td41iUN4BHoGFUDbqwkGSMl8V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754622319; c=relaxed/simple;
	bh=SKuB7zBcK7mLbXiYBp8Gr9Doqs4A0hTzTpbNrPT93Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPFP8lOno186pxr3prMcbOWyIH1r2TN/vg+hivtdaTfkshxB2vHHSpkf4QaS18l66zle9ha+xjPUpOfgTKpFZiYt+MunhVRok28++tXBh2I7UpgEmiDwKnZ/ymAQdW4wQmTkLgmqfuI8J05N4NraHs0fkJARgWiVoEzBWwBoAqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=FVOy92HH; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="FVOy92HH"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A2A7A2C06D5;
	Fri,  8 Aug 2025 15:05:13 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1754622313;
	bh=lzIcPnfpb3OaSGts70KM8tj1a/SrZdes5omJV10nrLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FVOy92HHlGQhYxYCawN6HyJ4K49TiAvoNZbccLbqkQyvuS222qLV0YUN89DH4Whw7
	 36mUMPV8WLZ8h19PCE2KMJ5BrBE5WYjNVTrbFnI2OQ7DR2mjzFQ/xeRqfgUVJcMd74
	 fBIKOygwjugegqP2Vo0acBctsRE8/2L7EG+0VjqinucEuio+cPm9m7VWFmvVLhFXYv
	 FKQDRS6lNUgqzFkBj1jpDs1jpe3QYjyjHPad96HQirui2A+MehkmQe/zmbP/od94Yn
	 H8iwzeJJkKjSnYR0jqI2TVlfvlIl0USJPb7yT2Qqw/rH4JU7K62UuBHC2m/oRzX9qj
	 pI04J/8+p7IlQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B689569690001>; Fri, 08 Aug 2025 15:05:13 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 65DA813EE56;
	Fri,  8 Aug 2025 15:05:13 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 645662804D2; Fri,  8 Aug 2025 15:05:13 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA780 device
Date: Fri,  8 Aug 2025 15:05:09 +1200
Message-ID: <20250808030510.552724-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808030510.552724-1-chris.packham@alliedtelesis.co.nz>
References: <20250808030510.552724-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dtt4CEg4 c=1 sm=1 tr=0 ts=68956969 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=2OwXVqhp2XgA:10 a=fH_isJ2AH04nZXhinUYA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a compatible string for the INA780 device.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Doc=
umentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index d1fb7b9abda0..9df3b423dff2 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -31,6 +31,7 @@ properties:
       - ti,ina237
       - ti,ina238
       - ti,ina260
+      - ti,ina780
=20
   reg:
     maxItems: 1
--=20
2.50.1

