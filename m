Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2F03FD4;
	Mon, 13 Jan 2025 03:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736740343; cv=none; b=GKY+4BG3zy2e3bTd7JCYmOkOmNbd6eTmbMMlR9MAc4Spq0s8Dai3WHDeWtaFEqOxqK143op0s0rN3+Ed3SPhEbGGx10jXEl6shUuhLg8/1OU3I6oEXZBqyy+WoMd2C7OCajJYK8fbJ7M7tWCRQPb/ED6bN5Z0f+hmX+6sDMnwtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736740343; c=relaxed/simple;
	bh=47lpHW6S1QmQwBeCGGTUBM/gKlGLiFKGT55dUx7+i8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAsHNVSmFoQ6v3ibfrQw0cPzCvMYHi8IA2A53pVtDTF+yXNHJFxD0ZCC0cnTLf0Z69WPQt257OhHMlPHYFgkdw5rrCfvp5QHbVgdVnJAdksonlO4cefo7EQrEWSdTtESwBOQ+rjNjtP4bGV0t+wZD3011BMYhQXoSJNEfQSw0So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nAmT1JOf; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nAmT1JOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=6VKE8
	qZZS/rUWg3wUGhsuefcF317K88uCMsOa/kGQrQ=; b=nAmT1JOfUO8dWGM9Vg998
	fNgPKeUAcsbO4+lhM6FBlhLGjnv102tlS9xOvTAFFo0HtfzUiUnb1soeG2JZ//ma
	WunVW1DgJzTGvUTrHuD1N8wOjDiuBoxOW2aLumfndi6Ixk3gCukxeCqQpLCqNdbD
	2awaJG0pEzRLaHoE8ifEwQ=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3n1u4jYRnlJg_Fw--.9826S4;
	Mon, 13 Jan 2025 11:51:22 +0800 (CST)
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
Subject: [PATCH v2 0/2] hwmon:(ina238)Add support for SQ52206
Date: Mon, 13 Jan 2025 11:50:21 +0800
Message-ID: <20250113035023.365697-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n1u4jYRnlJg_Fw--.9826S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1DXFW7tF48Zr48Jr1DJrb_yoWfGFgEka
	yxCrZ8Zr48JF13Wa4fJFWfXryFyw4xZrsYk3WUtrW3AryayFsIgF1ktryjyw1DXFW3u3sr
	Aan8AayvkFsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRR9YF3UUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiox3T02eEjaYDPgAAsL

Add support for Silergy i2c power monitor SQ52206 to the ina238
driver as those two are similar.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

Add new chip SQ52206, the datasheet depends on 
https://us1.silergy.com/cloud/index/uniqid/676b659b4a503
The password is fx6NEe.

Changes in v2:
- Explain why sq52206 compatibility has been added to ina2xx.yaml.
- addressed various review comments
- Link to v1: https://lore.kernel.org/linux-hwmon/20241224063559.391061-1-wenliang202407@163.com/

Wenliang Yan (2):
  dt-bindings:Add SQ52206 to ina2xx devicetree bindings
  hwmon:(ina238)Add support for SQ52206

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   1 +
 Documentation/hwmon/ina238.rst                |  15 ++
 drivers/hwmon/ina238.c                        | 207 +++++++++++++++---
 3 files changed, 191 insertions(+), 32 deletions(-)

-- 
2.43.0

