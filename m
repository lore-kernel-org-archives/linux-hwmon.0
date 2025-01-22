Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE0923DE;
	Wed, 22 Jan 2025 01:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737509425; cv=none; b=eJVjku1j+SzAxdcXPkoKLdrDa6yCcB3MRckHV6ttTkHolhCFzvrfhohNu74gpxzqiv/A2It3nDV/s8277TfxHnySA+G9J9r7tZjqg8DedXp+d5vDD0rLffKHDGXqgV5YpzW1TQYxYAxWXujs8ufqWsg8fSJZp5d+gXAdN4DlF6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737509425; c=relaxed/simple;
	bh=vrM9FCcSabp0iENUkhYWnk5ZCUCWJihsBrxkmgjFOz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axG2DyNLXyrKR1+muKZS3Va/5NtpEcCiSE8Lj2D+sD+vIPkTfBh0Tjucg+CyFb0D8M+6w8Jaj4NdNGXrU/YO0BGWnVqsq8C/NvnQjLIUduiX/08uOGXRYAFZ1IO0pHSDGW6tDyEZRPtDWajjTxPPoc3NDHtAjDnVGGgsqhrM55k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=E73XVTtj; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="E73XVTtj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=PPF2T
	NJs26XvPTra079pkEfMaeRetMCkRx0gBDwYafE=; b=E73XVTtj/2Gxb4NSFGrro
	E87HuK+6XLWNoYMDVSIE1Jyp2nNEQMbjgVnhwvSSFDfpO7HY3gWS3xxz3ltJHP5+
	gp2S8fDBhPDaikPcL+uaQJ6p8uFjMXay7p0wTZrHtJmpjI1kvF7li+Zq6INIZOXc
	XIpnrQjQfJMwADYZi2iBlc=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnl7MGSpBnDxF+HQ--.57201S5;
	Wed, 22 Jan 2025 09:29:46 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Wed, 22 Jan 2025 09:29:39 +0800
Message-ID: <20250122012940.1005571-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122012940.1005571-1-wenliang202407@163.com>
References: <20250122012940.1005571-1-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnl7MGSpBnDxF+HQ--.57201S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1DJryxJF43ur4DJr4rAFb_yoWkuFbEgF
	WxAF4DXrZ8JFyFgr1qyw48Jr1ayws3Cr4kAw1UJFZYy3yavr90ga4kJw4kAF1xJFW3uFyr
	Zan5Wr45KrsrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRCJPiUUUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNQTc02eQPfTHwQAAsG

Add the sq52206 compatible to the ina2xx.yaml

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

Add the meaning of 'shunt-gain' in SQ52206.

 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 05a9cb36cd82..25e0b2f0b28d 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - silergy,sq52206
       - silergy,sy24655
       - ti,ina209
       - ti,ina219
@@ -58,6 +59,9 @@ properties:
       shunt voltage, and a value of 4 maps to ADCRANGE=0 such that a wider
       voltage range is used.
 
+      For SQ52206,the shunt gain value 1 mapps to ADCRANGE=10/11, the value 2
+      mapps to ADCRANGE=01, and the value 4 mapps to ADCRANGE=00.
+
       The default value is device dependent, and is defined by the reset value
       of PGA/ADCRANGE in the respective configuration registers.
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.43.0

