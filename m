Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742FA17591;
	Wed, 25 Dec 2024 02:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735092231; cv=none; b=EYDrUKqayqcjE3k2kwg553fnFIJRSCUoj7btKuyiUhpBkExZs87PaP6sAGP7wz+yCGSM10Ed0Sd69NCsrd/jJQC+XUtt9f9MpZcBhLDSPjJJq5O0fdN24zGcaHIK0u+bKrQm8R/bFCcRcNougButXm2r2HszHQchw5rPCyoAo/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735092231; c=relaxed/simple;
	bh=TIcNcCJhoTVjPyh/lf6YMX4opzjlAdx8Dq92HYmVlKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ca9TdU3yr5dfg3KhOfa6+Yx1IwnA/hc5yxFcp3t8GQcvTcwd0Kwb9fGWSbC/onCU6HFEFraihC4ygegpYFVesmMpmwDHQyLQKNlIFYJ3AGdKun5l6nfyljqP1ai2s8oqKfdY2TP0pBWdYznuqPp8/6JaZUI7Cg1Iij6zPt9xwFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=porp2Ffq; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="porp2Ffq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=f9oWu
	9Cat8FuZZ8TF9tEadnv9ykTlIOQfpN2/NTylfs=; b=porp2FfqWdPM2UKoBF2se
	etPQd29YEY6ou1qL/MY/l3ndGoAW5jHYbQzwUhljkT1vFeqfYjOUsCP57gCRjC+b
	1eFAjrks7FmTkd3c9wIqdEv7B5JiPZKXTz1X5+MGQJFbPm2VTSOwEETRG+AGXI4L
	nPMUtqI8AcfyzRmYJsniD8=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBXVAvbZ2tn9MwIBg--.45990S4;
	Wed, 25 Dec 2024 10:03:08 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wenliang <wenliang202407@163.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Wed, 25 Dec 2024 10:03:05 +0800
Message-ID: <20241225020305.440008-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXVAvbZ2tn9MwIBg--.45990S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFyUXF13XrWfZFy8ZrWkZwb_yoW3tFgEga
	1xZr1UZFZ5JFyFgw4DAa97Jr13tw12kF4kCw1jyrs5Aw1DZrZ09a4kJ34DAw1xWFW7uFy5
	uws5JFWqqrsrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRROJ5UUUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNRHA02drYJKFBwAAsL

From: Wenliang <wenliang202407@163.com>

Document the compatible string for the Silergy SQ52206, this device
is a variant of the existing INA2xx devices and has the same device
tree bindings.

Signed-off-by: Wenliang <wenliang202407@163.com>
---
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

