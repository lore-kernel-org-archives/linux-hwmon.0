Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BB25B1DA;
	Tue, 18 Nov 2025 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470391; cv=none; b=G0EGCgxDjV+tOeh8EMpO/G4VjscbFLC0mETn0jvqC1qbbQ4xNju7Hia1hs4yKoTTSCCL9JWpoo1+eevuXcO/mjqthYQA2TzOYCIinK8jKiV1CpGPiw2AZNtqPwcgZriGZp0zJ/wFJqwo//HIsZr1tsldW1qicmlYjqs39Hp0R6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470391; c=relaxed/simple;
	bh=b+3NNDEmBfo0b6cBtVUyLQpJHddqfOu/5vPPktBKRRQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=MiBb8RkxpL9aCd/V6kLypQtYNiZuRRzFYNc3uwAJoVit5Gl/xGynF/zMN1IsK2gyMSRcEbU3fvr1TQGakcwqPpjt9dl9H04u/750H6vaRpOYfqkmaMtcjkUoYpbLASpO9SFDLZbiQL/tpuhXUX1o+J1x9RerU+AwDR/YigKOK0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pq6gHoGE; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pq6gHoGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=hDKIAgNYQ0CbvOi
	d7MWnOKrl+wj/VHn7LH6R44Hd3tE=; b=pq6gHoGEo+zupF1QzbFuMLp4iC/M1Ew
	tT6ElbocWq12zn6wsdcfA8u9C3C5xxlbrTI168GzTgS641xpEvMDKYJTbKb0Sd0A
	+Y4Gert7+l7gEG5rJ1tTVR8LreB32CK7arOMTWFaCFrvDJVTJuVubOZF9d+Im3wS
	poDWZQnFl/s0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3E8H1axxpyxYsBA--.3548S2;
	Tue, 18 Nov 2025 20:52:07 +0800 (CST)
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
Subject: [PATCH v2 0/8] hwmon: (ina3221) Various improvement and add support for SQ52210
Date: Tue, 18 Nov 2025 07:51:40 -0500
Message-Id: <20251118125148.95603-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3E8H1axxpyxYsBA--.3548S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7JF1xGr1fuFWxur4xJFWkZwb_yoW8Jr4fpa
	9a9345Wr1vqr1xZa9Ikr48u34YqF4fJF4ayr9rJ3y0qa1UA3WSvrW8KFyqy3srJr1ftry8
	ua4I9r4ku3srCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUfrc-UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwBh6Tmkca-iszgAA3o
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Revised based on feedback from the previous version:

1.Adjusted the description in dt-bindings: only added a compatible string
for sq52210.

2.Modified the register read/write value conversion function, refined the
calculation logic for each register, and reduced unnecessary function
calls.

3.Restructured the patch content for easier review.

---
v1: https://lore.kernel.org/linux-hwmon/20251111080546.32421-1-wenliang202407@163.com/

Wenliang Yan (8):
  dt-bindings: hwmon: ti,ina3221: Add SQ52210
  hwmon: (ina3221) Add support for SQ52210
  hwmon: (ina3221) Pre-calculate current and power LSB
  hwmon: (ina3221) Support alert configuration
  hwmon: (ina3221) Introduce power attribute and alert characteristics
  hwmon: (ina3221) Support for writing alert limit values and modify
    the 'ina3221_read_value' function.
  hwmon: (ina3221) Support write/read functions for 'power' attribute
  hwmon: (ina3221) Modify write/read functions for 'in' and 'curr'
    attribute

 .../devicetree/bindings/hwmon/ti,ina3221.yaml |   4 +-
 Documentation/hwmon/ina3221.rst               |  24 +
 drivers/hwmon/ina3221.c                       | 520 +++++++++++++++++-
 3 files changed, 533 insertions(+), 15 deletions(-)

-- 
2.17.1

