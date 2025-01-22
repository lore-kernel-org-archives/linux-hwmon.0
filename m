Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85714C62;
	Wed, 22 Jan 2025 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737509424; cv=none; b=eYWazEpdTtx5adZYublmNQsiIVn7EOOINkv38OR1ZMx2ZMU+kjBtlExDyFuhctGFBq0vd6Ni/ILQ1tKtdklpQsw8RTROHEIVG3qnBqrcG+9o9Rtpx3Yz2nSIVRKgDMRcaqO4sVftxHqJ1D7o9dpD5fm/6ysmo2E7UqsR3F8lUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737509424; c=relaxed/simple;
	bh=VEP+JpTaAloP8tk16XbGzGqoy6Qk2di7vJCNqaGTa/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tbIM1HDDf8bodd4/5Go7VE6MJKluRuse3wcRIlQjFQaBfiZcO4iYrTLTN55EoKpT1DKFWystku/XSvGqPgdp73KT36x/v/+9GfwuQG452oOCdMbELjKDngLuj3IeadSD5u2JVLIMETNFGI9KUbJtdwNAtul0t8D9jZuC2d/jfwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=a69w28dH; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="a69w28dH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=cW6Sf
	7Q2dBYvtK2fPKtQodlHqxrGjrVTULzGiv4brX4=; b=a69w28dH8NXYjLyzFZOFQ
	B3wa0MykFgzszKGjozUlea9gBqYgYSxVuwrOF3OfJDQ6Qx+Pqk4krHVPVQ/mCx6z
	P/UDfml4gexHpLPI5fxQAnPSdouKg1JGAv86Zt7BnGlX4jxEXToQj2TcBfd+s7u8
	R/iRL2BactnD3GmJNFQ9d4=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnl7MGSpBnDxF+HQ--.57201S4;
	Wed, 22 Jan 2025 09:29:43 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	jdelvare@suse.com
Cc: Wenliang Yan <wenliang202407@163.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] hwmon:(ina238)Add support for SQ52206
Date: Wed, 22 Jan 2025 09:29:38 +0800
Message-ID: <20250122012940.1005571-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnl7MGSpBnDxF+HQ--.57201S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1DXFWxKr4ftFyUXw4DXFb_yoWDCrXE9a
	y8CrZ5Zr4kJF13Was7GFyfXryFy3y7Ars3t3WUtrW3AryayrsIgFn7tryqkw1DWFy3u3sr
	Aan8Aa1vywsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRENVyPUUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiJR7Y02eLteFcRAABsR

Add support for Silergy i2c power monitor SQ52206 to the ina238
driver as those two are similar.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

Add new chip SQ52206, the datasheet depends on 
https://us1.silergy.com/cloud/index/uniqid/676b659b4a503
The password is fx6NEe.

Changes in v3:
- addressed various review comments.
- Link to v1: https://lore.kernel.org/linux-hwmon/20250113035023.365697-1-wenliang202407@163.com/

Changes in v2:
- Explain why sq52206 compatibility has been added to ina2xx.yaml.
- addressed various review comments
- Link to v1: https://lore.kernel.org/linux-hwmon/20241224063559.391061-1-wenliang202407@163.com/

Wenliang Yan (2):
  dt-bindings:Add SQ52206 to ina2xx devicetree bindings
  hwmon:(ina238)Add support for SQ52206

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   4 +
 Documentation/hwmon/ina238.rst                |  15 ++
 drivers/hwmon/ina238.c                        | 208 +++++++++++++++---
 3 files changed, 195 insertions(+), 32 deletions(-)

-- 
2.43.0

