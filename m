Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F201DFF7;
	Sat, 25 Jan 2025 03:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737774228; cv=none; b=p4kcInhE7amk3XupLm4zP4p8rBHz+ratF6QfVSMboitlzPE2ALxARIWYLE0r0C8JXJlD9S8XznoWJcRbHQ+BgDKVejkEw7KctMrG0Ipmden8WaeA3sFYaqPSOTBEnpRqUbCsRavG4VlEnJnowpwnxNnO/BfdD7Jw7YQuo3DUaec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737774228; c=relaxed/simple;
	bh=XiF/jY/Qm1UIxeSqvs6E2QTnjOhfIO1tKy0oVj5QStE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/4daZnfkK1mgpKFMpC3BkdKwtUOAzuW+WB8mxuTLkChMUHjc/Ql9lclpd6epV7NuP/w6RTx6L/t5CQPB3ZKsMzXJpS3jFMwVdBu2GTl7ZpB+VvMOBAVjhpgo7sYZcfAMEwSq06YwqdxXFIta8A8uyRhv+HXdZ4U/2ul94utC6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=m/yPtBYY; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="m/yPtBYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=f2ifr
	sk0Ocb/Ft8CkL8Ocv2BBkDvRdM+5cCYbWG2GBY=; b=m/yPtBYYpjT7hmsQtlYM2
	d+vFozxL1pepeizsqriPBlBhkTJ9Xb14WDZrJc0T2Vo6Fq+N1SaDrzaejxIxRoWj
	czoi6SNrzZKeZW0sIMKrS4prPwBBB0f22w6YZqmOJ0MVTPrEAjoLlzVLQehliY+8
	9PJFMv2zerM2Egx76ygGRM=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXjXdnVJRn4+zBHw--.4932S4;
	Sat, 25 Jan 2025 11:03:04 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: christophe.jaillet@wanadoo.fr,
	linux@roeck-us.net,
	jdelvare@suse.com
Cc: Wenliang Yan <wenliang202407@163.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] hwmon:(ina238)Add support for SQ52206
Date: Sat, 25 Jan 2025 11:02:58 +0800
Message-ID: <20250125030300.1230967-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXjXdnVJRn4+zBHw--.4932S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1DXFWfZrWxKw4rAF47Jwb_yoWkKrbE9a
	yxCrZ5XF4kJF13Ga4xCFy3XryFy3y7Arsay3WUtrWfAr1ayrsIgFn7tryqkw1DWFyfu3sr
	Zan8Aa1vyrsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRsjjUUUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiowvf02eUN8HpIgABsr

Add support for Silergy i2c power monitor SQ52206 to the ina238
driver as those two are similar.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

Add new chip SQ52206, the datasheet depends on 
https://us1.silergy.com/cloud/index/uniqid/676b659b4a503
The password is fx6NEe.

Changes in v4:
- addressed various review comments.
- Link to v3: https://lore.kernel.org/linux-hwmon/20250117082017.688212-1-wenliang202407@163.com/

Changes in v3:
- addressed various review comments.
- Link to v2: https://lore.kernel.org/linux-hwmon/20250113035023.365697-1-wenliang202407@163.com/

Changes in v2:
- Explain why sq52206 compatibility has been added to ina2xx.yaml.
- addressed various review comments
- Link to v1: https://lore.kernel.org/linux-hwmon/20241224063559.391061-1-wenliang202407@163.com/

Wenliang Yan (2):
  dt-bindings:Add SQ52206 to ina2xx devicetree bindings
  hwmon:(ina238)Add support for SQ52206

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   4 +
 Documentation/hwmon/ina238.rst                |  15 ++
 drivers/hwmon/ina238.c                        | 209 +++++++++++++++---
 3 files changed, 195 insertions(+), 33 deletions(-)

-- 
2.43.0

