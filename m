Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA34349B7;
	Sun, 27 Sep 2026 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536441; cv=none; b=hNxSJneqBticIEH911r3WI4oKHU02fVLHRlHVuxQ9nQ1C3sUvZy9ga6YFo6xxXn4usLe6CSqxsI6oeSVaK7GsXpoGvFCZOvCu3PHL7SVJWDC8o7CF1seoCMHD4CM8gfeObuMNzECRtK+Z31vFO92oJW5anI8m+/TaPwf7xCy0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536441; c=relaxed/simple;
	bh=T0fyka8QM4xfEq/gh6qKKZDmhO9iSMSF9TpS9OOPHRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wgh5XkpoSACAidpn+Olw/R4QMg+cmCSvYpVC+F5wtsLVUbLh1NUtez1EKIzLeb5o17eOlgUcpxio8cUn2x51v8bNcwYv27ZEUdfBdJAxKFHRhdiTEE0E75u4pVbvQsRIW0eeyFGRNoQDsWVDlIHyNxr2p2mBgyfNSct2FU1bQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=aerAIki7; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="aerAIki7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790536431; x=1790795631;
	bh=wwQJy1aVVHK5qKcM1TMGlIffe/GSdb/P6CiSZX6UIwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aerAIki7TeKHqJlTXDnZ3FRz9J5YpeCix2zIi5OxhRrMPrjQK5skfE/6jFfl4KqNk
	 ypWOG7+JcMAYnDLQdjoLX8vlOwXU4dNc+kdoZ9mlkPSXF+bhYxjlsoin6rWH5Pcu6+
	 uqm6vXVwfIOtmOYOZHia8DbvrNPHVF0zauKHBtIxYI3pzoeae5dKnXeDfFbKt7e6nX
	 4tYbOPdwJdon30iv+0Pp5pOsm8AHrjDrVHlXa/YJ8zt8S1YmPTgg87ggV1pOKALJfR
	 KjuxJXAZXjY8ELe3JTWpqJjaoa9brMfg+yHAJNIWlet6aBsh2NG0GneWxjZdpfHeCh
	 spgIEhfR5ImAQ==
X-Pm-Submission-Id: 4htDct3wWtz2ScPT
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
Subject: [PATCH v5 4/5] hwmon: (aquacomputer_d5next) Skip unknown firmware version offsets
Date: Sun, 27 Sep 2026 22:13:15 +0300
Message-ID: <20260927191316.4137752-5-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927191316.4137752-1-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
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
index f80027b27..13272eb88 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1344,7 +1344,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
 	priv->serial_number[1] = get_unaligned_be16(data + priv->serial_number_start_offset +
 						    SERIAL_PART_OFFSET);
-	priv->firmware_version = get_unaligned_be16(data + priv->firmware_version_offset);
+	if (priv->firmware_version_offset)
+		priv->firmware_version = get_unaligned_be16(data + priv->firmware_version_offset);
 
 	/* Physical temperature sensor readings */
 	for (i = 0; i < priv->num_temp_sensors; i++) {
