Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de [129.70.45.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642307F7FC;
	Thu, 26 Dec 2024 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.70.45.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232536; cv=none; b=mnlOIe9/kGzyA2NdjEvf5UvJduzKed3OnvMvL/0s9e18wtjI0SyP5oMvHGwmucZaRZsBslUm/ofLbnioconcjs75/sfHXWymRWnCeE+aZaQACpfaJ8POMkCskiPP0Hbk7e5z/HvmGeSjIqYDF7IBc07DaN356FQ7ITHx+KzvHDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232536; c=relaxed/simple;
	bh=aWDXt9CcZLQScdYqNMUw/PrvZqtmrT3OuAqytb4VPdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+4DsHvyB9WJReMdtbXqOEA6YdLLYiQ1BQx3QmcmVfQCadYrRR+7Jiclq5FYUbXo3Ij9qKXkvS5IJ6NH/FR2gCa4w0h7wZx0itr9cYWPun1eMfKfEeaOpOJ/2hb0FgzPbo2pqi8Xk7n7xHXe7lviIRSVFVklSe7A/REfJLOjSMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de; spf=pass smtp.mailfrom=math.uni-bielefeld.de; dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b=oJuf4N+v; arc=none smtp.client-ip=129.70.45.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="oJuf4N+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=math.uni-bielefeld.de; s=default; t=1735232528;
	bh=aWDXt9CcZLQScdYqNMUw/PrvZqtmrT3OuAqytb4VPdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oJuf4N+vnmuzhxGbnFdWXCaqufmcZQdOsuCcdAOAQ4BsCPG37658H+XHfBm9+8ckG
	 ilCiu7AhPP/J62DQz+3IO3pxUe40cK5jfWFtAUKWXYr2iQtRx5mjMJ9MZLYYtmy8u8
	 ZS6gB+TYfZHRS0rsNS1bssVbJKjrwVDB1PNQO3Bg1TfDGIWFCINZTKtnht+Rdpc3J4
	 2e/LkJpbrCXR9+SPZvZL7/19v1PKTZR7iaZdvv/N0MJ9cgMrQ0kBVwVcbYUbc/gyNB
	 /sH6ZdbGEHkLtbAiLFCIr3Swx0KqTa2U5+q5GMbhBkyQmD5V6o5xCj42ACKGpA8Kh2
	 d4mY8iTKjOJLw==
Received: from localhost (58-32-133-N4.customer.vsm.sh [170.133.32.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id E1DD6206CD;
	Thu, 26 Dec 2024 18:02:05 +0100 (CET)
From: tjakobi@math.uni-bielefeld.de
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] hwmon: (oxp-sensors) Fix typos in documentation
Date: Thu, 26 Dec 2024 18:00:17 +0100
Message-ID: <0578a6ad7c132e8b3ccc21573304d8ff535af597.1735232354.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

No functional changes.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 Documentation/hwmon/oxp-sensors.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/oxp-sensors.rst b/Documentation/hwmon/oxp-sensors.rst
index 581c4dafbfa1..5f70ccce0b0a 100644
--- a/Documentation/hwmon/oxp-sensors.rst
+++ b/Documentation/hwmon/oxp-sensors.rst
@@ -74,7 +74,7 @@ fan1_input
 
 pwm1_enable
   Read Write. Enable manual fan control. Write "1" to set to manual, write "0"
-  to let the EC control de fan speed. Read this attribute to see current status.
+  to let the EC control the fan speed. Read this attribute to see current status.
 
 pwm1
   Read Write. Read this attribute to see current duty cycle in the range [0-255].
-- 
2.45.2

