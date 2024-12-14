Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60D614884D
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Dec 2024 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734166731; cv=none; b=jkWCvxaZnvHFSxOkzolAr/5AMw+3BA6nzS8VOIXPV3NkQC+6xsRKaDV4ZKUsWFsG19jfMT13Po03HZ3DfpIepQc851MA/klc+Xitt2DvDze3W/wWd/17giOZhdufbuHXsf137/jkQO05Znlhw40Ky+fS5TZ9RTjNQFc2ieygy3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734166731; c=relaxed/simple;
	bh=zQN6iwp6Y32PiYMuvozsNnk/2p6mq1E6tHzA1BTGVfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9bAyoMKl5V0XO76dMFyjhDsswppOSzSiuwdh3BjeXzXJl9oitUYwCOFpJW6aQhuzUnm6eqZL0lgDR5V/Jvw5qjA1IitigYE12rVL9DUuGWDjAJGj4SQprxlYHX4p7YNKfxHUysk/tVrmswWHt+DUFzQY60aGnrlmQsGWpHCl9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Eix67qK/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Eix67qK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Yg3sxrO8amGPC5
	bVg3qoW13+Oy28brYGfIfQcsHCxIk=; b=Eix67qK/CztGxDAgskx4pZ/Q3unUVq
	z7IcVd7YFfU+6LG5xebR4QFq8DjhTGJakVEJklXkbAMCJNC5ChtU2CRszO88031o
	zvWCuYCfq7WFZP5SRhqXeUnIkHYiRLut9NX9FSULU6gtQS37kpZdK5kdxcX+ONYI
	irDIt1lw0m1cqXLCa5Nn7IMJEO+l63K3LSX1b8PKLym5t8PGKoDwI9IcA3n3Nr+z
	oJa/urBdr24J5Tp+u9b0iqizhktHqrYyw+CE0YkUF23lbwpXl8O5A8t3vBSkEDPd
	vaBACQk3lyeCKK6lUFfb5IqCWh6Yzr/ew+di/465sZCxmxX/qvGOUxeQ==
Received: (qmail 3036643 invoked from network); 14 Dec 2024 09:58:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2024 09:58:37 +0100
X-UD-Smtp-Session: l3s3148p1@zUEiJzcpxIFehhtJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
Subject: [RFC PATCH 0/2] add generic parity calculation for u8
Date: Sat, 14 Dec 2024 09:58:30 +0100
Message-ID: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a small series to provide generic parity calculation in the
kernel. There are already some open coded versions. I especially want to
avoid more of that in the I3C world, where odd parity is frequently
used. This series will allow for cleanups there. More detailed
motivation can be found in patch 1.

Based on 6.13-rc2. Build tested only, as I don't have SPD5118 HW.
Still RFC to discuss the placement in bitops.h and maybe Guenter can
test this series?

Looking forward to comments.


Wolfram Sang (2):
  bitops: add generic parity calculation for u8
  hwmon: (spd5118) Use generic parity calculation

 drivers/hwmon/spd5118.c |  8 +-------
 include/linux/bitops.h  | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.45.2

