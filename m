Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A27E376BC2;
	Wed, 14 Jan 2026 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378730; cv=none; b=knV/d0i6rgwB93br1QLVU9HamwbZiy9BcHAHAaxq6vLx/BsDiu1CTILj+dsiPaZ/6htQ0xUq0Srzz3tnBEUJvQYxcOV172creCyYmHkW3YGWib8/B28AV2rZpqPn+X5gjL524mIUIBlrcla/8KRruV7RpV0Ua49OJPZT8bhOIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378730; c=relaxed/simple;
	bh=umJMT2a8HkP65LZGwaclUMNtNmRq/M1MyAPGp0R/Ioc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=msiZnRotzwBISSeczMsndnzVlsNNjmOpIAbL/rYJW/gLJgi5dFpOP7qJRJRtx+qXIGGjgnbZCk+ZnFNvJj7YTjlBIKS3yHkmo9kYglThFm3vNuZOzm0c32pgteoyZKdVWUWdKJutdU1cYD07REHTwu8zMj44R/EKfXAf7kJZync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KkNLy6X9; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KkNLy6X9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=lrZhfvwsDK9q8cF
	H54OhbOqf40oDBNfj3AwHxM0pHLA=; b=KkNLy6X9T/l7IJN1MTwrT4UFXaKQdBx
	q67i42vqG4Flb+Wr+cC+f5MUeieSTecDYxh2kTFnsKXYeo23VMZMdRO990KqmZiY
	PLgIsxsQMF2mYdlkhZLtOjoCooxOEAz+aiFYkHmqsyGT+Gq2ApHE7pY24nsDqbPX
	fuFYx833g8wo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wB3LaYsUWdpIIuhFg--.292S2;
	Wed, 14 Jan 2026 16:17:51 +0800 (CST)
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
Subject: [PATCH v4 RESEND 0/8] hwmon: (ina3221) Various improvement and add support for SQ52210
Date: Wed, 14 Jan 2026 03:17:33 -0500
Message-Id: <20260114081741.111340-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wB3LaYsUWdpIIuhFg--.292S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFyDCFW3ZFyUXFyfZry5Arb_yoW8Jw1kpa
	9293y5Gr98Jr1xXa9Ikw4xu34Yqr1fZF429r97Jay0vF4Yy3WIvFWvgwn0ywnrGr9xKFyk
	Wa4S9Fn3KasrArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU-4SOUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5w+TZ2lnUS-OwAAA3i
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Resending this series.

1.Add review information for the binding(PATCH 1).

2.Modify the description of the patch(PATCH 2).

3.Add initialization for 'alert_type_select'(PATCH 4).

4.Add out-of-bounds checks for the array(PATCH 8).

---
v3: https://lore.kernel.org/linux-hwmon/20251120081921.39412-1-wenliang202407@163.com/
v2: https://lore.kernel.org/linux-hwmon/20251118125148.95603-1-wenliang202407@163.com/
v1: https://lore.kernel.org/linux-hwmon/20251111080546.32421-1-wenliang202407@163.com/

Wenliang Yan (8):
  dt-bindings: hwmon: ti,ina3221: Add SQ52210
  hwmon: (ina3221) Add support for SQ52210
  hwmon: (ina3221) Pre-calculate current and power LSB
  hwmon: (ina3221) Support alert configuration
  hwmon: (ina3221) Introduce power attribute and alert characteristics
  hwmon: (ina3221) Support for writing alert limit values and modify the
    'ina3221_read_value' function
  hwmon: (ina3221) Support write/read functions for 'power' attribute
  hwmon: (ina3221) Modify write/read functions for 'in' and 'curr'
    attribute

 .../devicetree/bindings/hwmon/ti,ina3221.yaml |  15 +-
 Documentation/hwmon/ina3221.rst               |  24 +
 drivers/hwmon/ina3221.c                       | 536 +++++++++++++++++-
 3 files changed, 561 insertions(+), 14 deletions(-)

-- 
2.17.1

