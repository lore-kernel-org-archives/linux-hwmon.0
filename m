Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672CD80034;
	Sat, 25 Jan 2025 03:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737774251; cv=none; b=HQRaT1vCkIf18DXnBs3PPfUtGFFHii8i0P1KG/VLtpvHmFFHv3f8yQcqzwR5juVqxmMEEGqfwMi1EqvYjCx8vzErc/vyN0ZHlCRczMQZdkPIZ5VioRIE+0fuIPTVkk+y5Xj+m/ZlqwT2PUFabllld72tX/D+gc5qBSKk58ovrVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737774251; c=relaxed/simple;
	bh=iwMrKPUtdksCm20rNy99Q9sCRLNQuFGue9T7y1A+wkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yr0S+A3rHPb+14UwCqSKGzO4YknuDdJ0oyWqX4ubLA5vrk44U5shhHCAF3sDhqOdPCA5fSzq+SA2xwkP1loFZQMBAYCluf65LkkV3YubXeiwMjq7xZ+8x6702KxbE9PKlvCtvuCnOiPy40ACcQXFzkaQwhL49K3eYqLr5Fd+mOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aJNeYu5n; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aJNeYu5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=XEEbb
	ltAAns4tDgmbWOXBWFItEIpvnE/kHRLpxjMq+Q=; b=aJNeYu5nbD8ZaHXVsWd5T
	Aj65zkEufNppDIW1B6EabpOBVmo3s1xKbn6oR+Z7cUI5t365dsQR/8AMbhsN/XNr
	KY5ZEKYofndwVGG1hSHbi5h2ht9rKc41bQm3PPNInwSV0hSpajSvc2iNoRcIiooU
	G0wJu0Jc6gZ0tUXX8s9PPQ=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXjXdnVJRn4+zBHw--.4932S5;
	Sat, 25 Jan 2025 11:03:07 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: christophe.jaillet@wanadoo.fr,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Sat, 25 Jan 2025 11:02:59 +0800
Message-ID: <20250125030300.1230967-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125030300.1230967-1-wenliang202407@163.com>
References: <20250125030300.1230967-1-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXjXdnVJRn4+zBHw--.4932S5
X-Coremail-Antispam: 1Uf129KBjvJXoWrtFy7ZFW7Jr4DGr1DGrykXwb_yoW8JrW7p3
	y3GF17tryFgr13W3y8t3WkGr15Z3Wv9a18KF1DJr1Fga1DXa4Yqa9xKr1kKF1UCr1fZFWr
	WFn2gr48tw40yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piTGQDUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbioxjf02eUTE5ncwAAsS

Add the sq52206 compatible to the ina2xx.yaml

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

Add the meaning of 'shunt-gain' in SQ52206.

 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 05a9cb36cd82..bf2b334ba5c7 100644
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
 
+      For SQ52206,the shunt-gain value 1 mapps to ADCRANGE=10/11, the value 2
+      mapps to ADCRANGE=01, and the value 4 mapps to ADCRANGE=00.
+
       The default value is device dependent, and is defined by the reset value
       of PGA/ADCRANGE in the respective configuration registers.
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.43.0

