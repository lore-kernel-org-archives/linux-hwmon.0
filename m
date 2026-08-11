Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B193064B5;
	Tue, 11 Aug 2026 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441099; cv=none; b=gS9w/mPi3lBFGBnQGdjME22p+GkmUw3ZLjI8GwGzkd0d4Iaq2dZJyu+97qV1CpLhNhrbQQBoGZkS+7H4od9KeMxBPN4JnSSCtxzP7JYQ0FueZk62vYz23B1M0KGyi+9PVVJm16dZ/fyHvM0gRaMDkZzR/pmMUFHMCZ9LmERhYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441099; c=relaxed/simple;
	bh=ehixhbCEWJdFDMLMYl6aG0cCBu6lzwj7xlZtxH2v8yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dcn0u91rjxBBtOgaLRZ+w4284KNCv3YhQh7bLTQcrb2HQtGOMcW6m4DzonUabvsw5RVn/7VXx18BSY8OTggPLE5PYC1FR4jR+e4KB8ax22FT/eEu9EkrcF4odtco7nDOQt+7hIcDa678n5/jhmcK6HdKV4F7h0L4LLk2047MRgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=j/TdrHFh; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="j/TdrHFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5z
	KCTy8fqMdDBRosBYfA400jIe/zYO63RLInE7V6PL4=; b=j/TdrHFhoFv/ohxUr3
	wNCzaLDZtpbFg6WvW9ln+sZvgxgWjjPukYHIFE1x/As1iO49V2ReOcBMxq68iGwr
	WHb0xW+R1Xpccqn/11ZZqurGy33OdgCanEVczZcffAMYa/q6r0CBzdNgUrFqBznr
	16hyyZL9vXBm/aV459bNtDHaU=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBHysZy7XpqJ77_OQ--.33587S2;
	Tue, 11 Aug 2026 17:37:55 +0800 (CST)
From: huangjia2hi@163.com
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiazhi Huang <huangjia2hi@163.com>
Subject: [PATCH 0/2] hwmon: (nct6775) Documentation fix and NCT5585D support
Date: Tue, 11 Aug 2026 17:37:42 +0800
Message-ID: <20260811093744.12199-1-huangjia2hi@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHysZy7XpqJ77_OQ--.33587S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyftryDKr4DurW8Ar4fZrb_yoWxuFcE9a
	10gFZxXryqy3WUAFy2yFnI9FWUJr4UWF4Dua4DZrZxA343Xr98CFyqvry2y3WjqrW7uFyU
	X3ykJrWxta4ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRtCzPUUUUU==
X-CM-SenderInfo: xkxd0whmldjxrl6rljoofrz/xtbC6xPQB2p67XNa1QAA3u

From: Jiazhi Huang <huangjia2hi@163.com>

Patch 1 adds the missing NCT6797D and NCT6798D entries to the
documentation. These chips are already supported by the driver code
but were never documented.

Patch 2 adds NCT5585D, which is fully compatible with NCT6798D
(same chip ID 0xd428). Tested on an ASUS PRIME H610M-D motherboard.

Jiazhi Huang (2):
  Documentation: hwmon: (nct6775) Add missing NCT6797D and NCT6798D
  hwmon: (nct6775) Add NCT5585D to list of supported chips

 Documentation/hwmon/nct6775.rst  | 24 ++++++++++++++++++++++++
 drivers/hwmon/nct6775-core.c     |  1 +
 drivers/hwmon/nct6775-platform.c |  2 +-
 3 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.55.0

