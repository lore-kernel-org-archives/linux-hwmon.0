Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831732ECD32;
	Thu, 18 Dec 2025 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048881; cv=none; b=jjL/3NueUCN43L6dZmPs490AHPy7PS53u2Ixx15cQThbB5nWKdGDHIfzLAoRxXgDCM16gnjfQkm5z8rnHd97bFXyhHE88DW6RnrRbBEusSCWp6IDD8zQhsL+dz3h0xnT0/OGZOqw7f+Us7ObKtYSGYEmW6Os3ZHF5YKWTcQSnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048881; c=relaxed/simple;
	bh=S4xxlSlkjywJL1VhdwtjTgNc/0wkfC7aMTwlvwAa/J0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qCsjg2oXVPvW1jnRmYJvFgmrH/5o7trXV0BtBRfS5pP6yCxf/9+L1OeFUdasQYbxy/QubhuipQaY4CT/nkewDg85nzIVPbaIexARohjj5jlPPs4AUB5E2N3WR1uTIQtF+KfuMsLJ5gi3UIMCsCIqAZ4YSnj4/+yrleyH1CeqMx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=R0/13jt+; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="R0/13jt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=ISUhT8CVNB0W9nR
	91e4U6Z46MDIuYLNi5JE8yekOZPw=; b=R0/13jt+8+kuAygRNb0ZAcxt5OouMHi
	t9Y1LjiXZbCIYisNzrOglIOy+vMCgevPTZgaaIufPDwu+dTQO3gOA67ei9uCAjqs
	ZyiH5egw9d7fj9xf0Z1xPSrNiJr1kSlEnf0smjX3GPyvT6GOCoHAhk889PJYHYZI
	vtpjhCjP0l0g=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXPaw5xENpP8BcBA--.40S2;
	Thu, 18 Dec 2025 17:07:08 +0800 (CST)
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
Subject: [PATCH v4 0/8] hwmon: (ina3221) Various improvement and add support for SQ52210
Date: Thu, 18 Dec 2025 04:06:51 -0500
Message-Id: <20251218090659.66991-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wBXPaw5xENpP8BcBA--.40S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww17WrykArWxXr43uFyDJrb_yoW8JFykpa
	92kw45Gr98Jr1xXa9Ikw48u34Yqr1fAF429r97Jay0vF4jy3WIvrWvgwn0ywnrGr9xKFyD
	Ja4fuFn7KasrArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU-4SOUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCvx1rP2lDxD1YMQAA3M
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

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

