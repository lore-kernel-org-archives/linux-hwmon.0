Received: from msa.smtpout.orange.fr (msa-213.smtpout.orange.fr [193.252.23.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C371A38C3;
	Tue, 30 Apr 2024 21:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714511370; cv=none; b=iwswWYKDDI7F+9Qu3aynMo4sRvdwKJyKg7kusrJfUh7PbPGBmiSJ91tPEcEwyHfKgG6YyXnL6NGoC0JesdKI+SfM6mhAuHDg2/7qxhBmeIBq5vL520MyX7kCeytHuy/NynYUtwemLX0QhwQA2Em3qX2OGZ8U/TnbSOeLApF/0B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714511370; c=relaxed/simple;
	bh=UfJuu82F6jpw8gEeR1fW/N2CyCIsDOh7I6WOZiEsJ9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pylPqKFvAGhGeGMoqUkmEMm96M4ozNNGx0vrVoOFogsgWPKxcZigvOEHnpa1Mo2XN6Ku6pM47n+4j96lz9qUHQfD7mXJFzusysSH0ezyxBsy5xCe8r5MaodcxZ+Ju/R4E4ZuQVmJArgANrbrHizaCXoOKUzKAHM/hOtPX6OBazA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=D4rF0c/K; arc=none smtp.client-ip=193.252.23.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="D4rF0c/K"
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 1uj0sOnduq0Jb1uj0sIsK2; Tue, 30 Apr 2024 23:09:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714511359;
	bh=cm4oXpsDK4IVPaMOHCgAbDDgettPN75Y4z00AU4xToo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=D4rF0c/KGAmLacclz6jplDFH2l2Y4zdpHGMYCTIvUZvFdiob/KhFFT0C7ifBcHjfu
	 Wm+WzjQ9sdoOTYcEh3wTIpxVIIoH+IlUoEMWb7+aI6Gyg+UrDXdk63QfWkFhZqBjqn
	 PMMbDXRdqtdkEAeZULw5S8cdmU+gemxOT4hHYMo88lfhPUi9vbSDBJjPGs9SMRxvrU
	 IyUMZ64BLSFy2O+PUK0BiKqNInztjkEhMrEJ7x0N0Y163Zu0aZzwBJdWRfGQNxqf4P
	 Gk0Ms43xN9cfT2vwFUBX7d5Cj4Rb0ip+xYNJ9znpfhM/zMMi5bkq6lLQtrkRw96N9l
	 HjCBPEmnx0CpA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 30 Apr 2024 23:09:19 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (stts751) Remove an unused field in struct stts751_priv
Date: Tue, 30 Apr 2024 23:09:07 +0200
Message-ID: <94ccf9caaa6b0101351bf381f09f4428c5e0835c.1714511322.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In "struct stts751_priv", the 'smbus_timeout' field is unused.
Remove it.

Found with cppcheck, unusedStructMember.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This field was added in the initial commit 7f07ec0fa17a ("hwmon: new driver
for ST stts751 thermal sensor") but was never used.
---
 drivers/hwmon/stts751.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
index 847c99376930..867410afa4f8 100644
--- a/drivers/hwmon/stts751.c
+++ b/drivers/hwmon/stts751.c
@@ -91,7 +91,6 @@ struct stts751_priv {
 	int event_max, event_min;
 	int therm;
 	int hyst;
-	bool smbus_timeout;
 	int temp;
 	unsigned long last_update, last_alert_update;
 	u8 config;
-- 
2.44.0

