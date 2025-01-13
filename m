Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2B73C3C;
	Mon, 13 Jan 2025 03:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736740343; cv=none; b=XbZI6ABBGsQuLc8Q1XLWbbMrh+AOx7nvr8qqB+/FoZVW5RQBZxC35WeO+9RBtzejHUxzcbzC6iqKjRj6HHnYL04qmN4MqT9+bFCIUOdmtyxxx08DJn2LcT2rvjNrapC0H4o7Y2XE4M8pe96dPKlazWhQKLzA80TMhrCqv203kWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736740343; c=relaxed/simple;
	bh=Lb62dUHuMqDvDY93BKOGGmjATYVYUR2Hg3Rb0MXu9yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAyedkTuBK+BzhIRkp/G+ZX6YicHnCk4enLMLe2+7lMvD8ET819VFzdNKAztiHdgJO63SNLb0yrDAD3xaPe2NFIv5xd4CUAgF2MvQLhmxs/DIKny+/l+sC1YTeDdei4maDqAsFfiW8BfdDJ19XVnYzx9eIJiqIn6qLh/4wbpXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WWsqITyb; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WWsqITyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=tOeY1
	twPE3v7SVoPmp51PxqMY/dLNQkcRBLT92i53Eo=; b=WWsqITybPdOhGDl6ebDXH
	F9TGnP922orWcmvv5zVKCJVB6VvdNGxPPsg4ZvusOaOwQXh12DHZUmrAj1BuXMhH
	2hQo70pUNGMoIy9Xzn7KH2p07Fv908eVW3KCHYZC/VYh+FI8KhyHAJhnrwBXss0H
	sV81ZUbErGqwInpGvMgGQU=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3n1u4jYRnlJg_Fw--.9826S5;
	Mon, 13 Jan 2025 11:51:33 +0800 (CST)
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
Subject: [PATCH v2 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Mon, 13 Jan 2025 11:50:22 +0800
Message-ID: <20250113035023.365697-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113035023.365697-1-wenliang202407@163.com>
References: <20250113035023.365697-1-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n1u4jYRnlJg_Fw--.9826S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1fAw18Ar43Kw1rCw1UGFg_yoWfGwcEgF
	W7Aw1UZrZ8JFyFgr1DA3y8tr1ayw12kF4kAwnrArZ3A3yYvr909a4kJ398A3WUXay3uF1r
	Zws5JrWqqr42kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNF4iUUUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiMBnT02eEhXDUogAAsJ

Add the sq52206 compatible to the ina2xx.yaml

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

The new features added to sq52206 compared to ina238 do not
affect the differences in hardware properties.The properties
described in the ina2xx.yaml are applicable to the sq52206.

 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 05a9cb36cd82..f0b7758ab29f 100644
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
-- 
2.43.0

