Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413DC37BE9C
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238012; cv=none; b=dUKKnTwXp9Ijh8MEZ1rKiNfLjVeB8h8j4FVf9+dAEiNrnjsGIgY+F9TZIZLoqgMc+lFWoawPQuUu3XpMdKLe9L/NLi6OdxRFqZHgk09qYdlws9Uhr1wNgKLMTgTKXlk6SQM9KcBIkXzhbfLuN4eJ/MdXO/uuj9LJA0G3KvE1Fj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238012; c=relaxed/simple;
	bh=fFt5H/vWiCtTQAYyQ96ZY4dZJbxj1cRaOyYCVfaS3d0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ceUvHGrd38KxUlFx8c0w5E7Ci3nw4CyeaGGntRY32fORTTKy4SMtM64iS2B/70P47yNXOvVyd7r2iCqzSkf5mj9xSh0WyWLiNdbuj9fjM7WMgniqq5uIn5Nw20ilXDbGawABXTqudM4yEvk+ASBdXUFhpZT4Hfz9q4AJJWdFar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b=JpbaEGSN; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="JpbaEGSN"
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202608201459570ef97dd3ae00020768
        for <linux-hwmon@vger.kernel.org>;
        Thu, 20 Aug 2026 16:59:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ei2eh9mRhWE0wThFaoRZu+a1n8eCN+REJC5RtmCgjY8=;
 b=JpbaEGSNaKqQxSGyqOUI+/UZkVQPKFwPjbH9K63t0F7NDyna8zlrgVZKaDGYlwbywLksIl
 bOQofCX5cYtI934X8AB37P0NTXHVHMrVqIojldQGtcaZz0Qo3U39RBrLL1SGA9UpxJcG9fEG
 tG5A2R3NYuWjts7VE4XnkO1rjPKaPlCIao20XUjyZ09Za5kaBFSSk3TDsmG3FngFWfZEz2PX
 tly2MjWnXb/8GNTeEQmmVm5DCqKvUJP4SO8Kyt8YkTJw9sy+augc7cdKNYs2QOSZvNpCUIHU
 XD/8h/cJltdF6LWpEQb4PGem+/UkgEWuYl/FAlSS7BDiUMmAErB+T27g==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 0/2] hwmon: Add Sensirion STS4x temperature sensor support
Date: Thu, 20 Aug 2026 16:59:44 +0200
Message-ID: <20260820145946.35468-1-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

This patch series adds support for the Sensirion STS4x family of digital
temperature sensors by extending the existing sht4x driver and adding
the "sensirion,sts40" compatible string to trivial-devices.

The STS4x series shares the same I2C commands, conversion formulas,
CRC-8 checksum, and measurement timings with the SHT4x humidity and
temperature sensors, but returns 3 bytes of temperature data instead
of 6 bytes.

Alessandro Zini (2):
  dt-bindings: trivial-devices: Add Sensirion STS4x series
  hwmon: (sht4x): Add support for Sensirion STS4x temperature sensors

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/sht4x.rst                 | 17 +++++-
 drivers/hwmon/sht4x.c                         | 56 ++++++++++++++-----
 3 files changed, 57 insertions(+), 18 deletions(-)

-- 
2.55.0

