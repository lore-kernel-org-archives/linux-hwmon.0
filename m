Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909EB1E0490
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Dec 2024 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436996; cv=none; b=Eop8VPwCXpXNXjXW7HCYgLSgl113rabuHf493Ts4DUuM0W4/bBB35BReNpWgEKtf6evxCPajSiEmAWqqvaiowhdIi1ZwvbYqfTsxAeJeSr6hoMQh09fLpvdwv3mAV6jGPucQEea1j1lLgP+nI8LprbdUa6PQw18x6SyUcCCH3GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436996; c=relaxed/simple;
	bh=HkrSbm7kUlMNddDrvxBJPF0cvxt1KsH3xRO6bgQ6Jm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJYO3qAsqBsWE14uZgC4O2jcw1PhYsI48nonlKTbnGqaf9BoaK9Pa5Ei53ueeiWqL+sI10mr0XjNXtAoNWCNqJNgH39t/v+m0DUom8sT4z8Vt7vMft3Y/yMssfvFd9s3PZlFikBW/TzNN/ktQAyOTsWr60e/x3iS6RNLMwlAwqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KyutQ2SJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KyutQ2SJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Qr4wQmZxBRIjXd
	0EQ5hYYFE+imRebWgseKj22z9Akdo=; b=KyutQ2SJvDuUhiXN/gqEKxnFob/wwg
	xaueRaWuXioLj6vq+vTNwtTzP216idcXgVU67+hzS4PKmxnm5u9+2rl7VvnW1+DV
	YYT27n52whJz+ctrBkbJCJyylWsBJunZ9OfMCy47wKb7XxOY6wNf7EbmUrsaD3av
	gpziTEMq5Wnvt+OrN0gNrTxygkWQ1NNkw6nZuF7TRVLJj8UwU/t5qezx22Q84qvF
	0dHfdeLnb8uj1dRogfQa9v7kuU+Gd/+wig1CXKwOOQwbFR1TUFcu5njuBlWGKvY5
	HUbpaXW7M2pHt53PmDZP6oXDAXB13/h0pTeEzuYBernny4zrYp13D7yg==
Received: (qmail 4062858 invoked from network); 17 Dec 2024 13:03:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2024 13:03:08 +0100
X-UD-Smtp-Session: l3s3148p1@OGOYFHYpVuQgAwDPXwAQAA/MfjDm1Sk8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] hwmon: (lm75) Add NXP P3T1755 support
Date: Tue, 17 Dec 2024 13:03:04 +0100
Message-ID: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series adds support for the above temp sensor. Ultimately, I
want to support it via I3C. But for now, start simple and add I2C
support, so we have something to compare against.


Wolfram Sang (2):
  dt-bindings: hwmon: lm75: Add NXP P3T1755 sensor
  hwmon: (lm75) Add NXP P3T1755 support

 Documentation/devicetree/bindings/hwmon/lm75.yaml |  1 +
 Documentation/hwmon/lm75.rst                      |  6 ++++--
 drivers/hwmon/lm75.c                              | 13 +++++++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.45.2

