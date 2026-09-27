Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA12C43498D;
	Sun, 27 Sep 2026 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534269; cv=none; b=Ebsp4ZI1918Hzx9JfZYLz5Eo4Txx3RL9u3X0RPv7FD0BHxgDyS9I7DwczLKOrKBmAEvBGEoPtY7pKt/ghvdZuNMZWprtl5jyviCb1vOwZ+Pe446WHMAzOkPHRquKtY+6CQN/zK0F0Azn08fUPnufJHok32tMqGSGANJjJ3tZWZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534269; c=relaxed/simple;
	bh=EMoAhRF20ECWldgXY/HxZ6l6d2HQahg6C9wvCjUFNEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTXF5Q2Kmq7qlAH8qk3fB3yq0jXcKUf97bY9/1KGpy6DjDE3mDks9yV3alQF1nxFOEmwAktxVJ4+FZONUmojYwVUtjrphZCIgf2NYM5WhNH8xSSfFGOi9JLbgITMBUEcsjneIaw81CHektHCdS7eiO2QNmBjllxxmwzeBdKdlig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=r/Q8RXFz; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="r/Q8RXFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790534256; x=1790793456;
	bh=dsgzSqtZ38GNqA8lNUt2hOXrCYmKda3hAzLw5Z1VjFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=r/Q8RXFzclCRcKu+xjYPWPRJjfjCr4dorIqj8hQrpQEJ8C27hrYiI+S+keEZv4LyP
	 vrrlRuyCL/TT04MlYR7CjSKzOshJSWJWkBH9/KPt07h0F5bqoHUTlDAvOgpMvVnj/W
	 ZmNI2/qzQDbaRnZAvikHBRkOMzo/O5lIMPQ/YSqSljnLCtUCB+vtcQb2swp9T3dWEf
	 cKhmB9k8frH0POkIx8wghsW37lwW1jNZkt1jQar+Lzu6y8OrdMbpLu00AkOy7ZYanl
	 JqRl+BA2YUkEHKaD/oy4nVbm95uFKjSNvACTMDK3axjhOaKH7PbMN/G0eK/mVBsIM2
	 hU1m0Hr5s48EA==
X-Pm-Submission-Id: 4htCq26Jpbz1DF4w
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 4/5] hwmon: (aquacomputer_d5next) Skip unknown firmware version offsets
Date: Sun, 27 Sep 2026 21:37:22 +0300
Message-ID: <20260927183723.4078226-5-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927183723.4078226-1-contact@vasily.cc>
References: <20260927183723.4078226-1-contact@vasily.cc>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only decode the firmware version when its offset is known, matching the
condition used to expose the firmware_version debugfs file. This lets a
device leave the offset at zero without interpreting the report ID and
following byte as a firmware version.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
 drivers/hwmon/aquacomputer_d5next.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index d4ed204ca..5c0c47eb0 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1342,7 +1342,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
 	priv->serial_number[1] = get_unaligned_be16(data + priv->serial_number_start_offset +
 						    SERIAL_PART_OFFSET);
-	priv->firmware_version = get_unaligned_be16(data + priv->firmware_version_offset);
+	if (priv->firmware_version_offset)
+		priv->firmware_version = get_unaligned_be16(data + priv->firmware_version_offset);
 
 	/* Physical temperature sensor readings */
 	for (i = 0; i < priv->num_temp_sensors; i++) {
