Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D6B1F8692;
	Fri, 17 Jan 2025 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737102147; cv=none; b=UTeSyNMaq8c3FYIhLzt3D6IFcPh4f7KZ1IHjne61PPE/5JaT1xraGZLhZHLI9+UEv+nyD4KKoXveXQcTGFUeSK8LIZ6POPTBGDzfwyfzYtdysD6QMKf7IXEmP4nqc9LtoyiLCl9ULilm1fFIsfOjc7+O6rMwaZhqS915UsPJOac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737102147; c=relaxed/simple;
	bh=VEP+JpTaAloP8tk16XbGzGqoy6Qk2di7vJCNqaGTa/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEpySG64YmxIevlYLXsGMRDkEmnwSn1yzY8Q+Q1mcOF3Zl15jCC9/zGfTl81YJO+ykEXyEHm1whf0dGb4JS5lZaTwZrzqHZzdA+NQ2DwFX/Ek+PCSvVuM2Pm2EFp59vcz804hGaksbHEoBp/PL3JfBVFoUPqfwPSIr93Zleznd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RrP4zi91; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RrP4zi91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=cW6Sf
	7Q2dBYvtK2fPKtQodlHqxrGjrVTULzGiv4brX4=; b=RrP4zi91wrpjROquiRnf6
	xpWpZumPB/VCtL0cerhHxpieUKzMbq36k6sWHpl/LPhxTTXlyRGpL5+h07W2qC2r
	nNz2JKgY4wLTGxgqUTdky3AtTx80Z2ymP58GtKV5E1XRlgrXRpE+eDiy1CWYPx9y
	V0TYc/4OLwOEskrgIA7bUs=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wAn2B4CE4pnaxwRGw--.23797S4;
	Fri, 17 Jan 2025 16:21:24 +0800 (CST)
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
Date: Fri, 17 Jan 2025 16:20:15 +0800
Message-ID: <20250117082017.688212-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn2B4CE4pnaxwRGw--.23797S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1DXFWxKr4ftFyUXw4DXFb_yoWDCrXE9a
	y8CrZ5Zr4kJF13Was7GFyfXryFy3y7Ars3t3WUtrW3AryayrsIgFn7tryqkw1DWFy3u3sr
	Aan8Aa1vywsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUjYL3UUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNQHX02eKDDN-AQAAsc

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

