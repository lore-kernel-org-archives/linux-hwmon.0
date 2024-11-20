Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2AE8615A
	for <linux-hwmon@vger.kernel.org>; Wed, 20 Nov 2024 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732091651; cv=none; b=G/+xXvps0KEy5QfetQXUpjl9QSI6q9jKN6R9PbssXVR2H1sKCXJkWsGXp3veNEN7KmtV8Mi6/7w9K1xLody+O16D89BITWN4Sfy3FA8Vteh1KD+Wfny1wH/kkOCa2PiM/Lk444up9Y6o1/8qavg7eCL+bmMlh4Twj41x1etgwDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732091651; c=relaxed/simple;
	bh=GRDqG9yY6Z32OOYsdvevy8HmejjBUPykoAD8smWEtKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7scjj9TwXTvhlIGUcLpl4e1/tWSF8dhdr5RudnTj5emI3DsYGxJAWcrIojO0O8xZRTh9TkjuLr5pP9VTQbBEYrUGvJmcpc4A8zSOjdA1CfBJK52FSob4lVbxvTxLDzuL8ocx+I/snbQxJMcovN0zbcJ186nIEFHuQW9aRF7FGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M139WiQr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M139WiQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=BzKhmpSdjWou+wACtFt1L+9aYWsfG8g74XVaa5mSLyc=; b=M139Wi
	QrWASRnXh/ERotb2z4380COf1jGcx/LqmRsQy+/Or1RlST7DlX/wmls7eSkY+NU+
	o5HyRCHK32+RIQHyinBbjNYJJTztHAJGUoe1MkH19a2yFXTS9skJmuw2HzaSV/Wv
	22R24EwuYuhh70GSeuAzmuyyCRh6aMNGU1PX0kfxYApqX9r6TlFYF1sZnrin8ZXH
	PkXlWYze19RasiLjavNQZ9/D1UBVj3ZEg9uxsFHrR8sEqobuPlFfJ2TRd8zg8XTL
	1TwQIkvttMOFlcx+Yvf0xQur6apQv1FendmyoNwONZakcaD9diLh+tURcGAgQjfT
	7Zo7vKgj3r+kfkjA==
Received: (qmail 832297 invoked from network); 20 Nov 2024 09:34:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 09:34:04 +0100
X-UD-Smtp-Session: l3s3148p1@MlEtA1QnyLIgAwDPXxznANR4Jedc6XSv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (isl28022) document shunt voltage channel
Date: Wed, 20 Nov 2024 09:33:51 +0100
Message-ID: <20241120083349.22226-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
References: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the upstreaming process, the driver has been extended to report
the shunt voltage as well. Document that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/hwmon/isl28022.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/hwmon/isl28022.rst b/Documentation/hwmon/isl28022.rst
index a7920a884b9f..273ce5460135 100644
--- a/Documentation/hwmon/isl28022.rst
+++ b/Documentation/hwmon/isl28022.rst
@@ -48,6 +48,7 @@ The following attributes are supported. All attributes are read-only.
 
 ======================= =======================================================
 in0_input		bus voltage (milli Volt)
+in1_input		shunt voltage (milli Volt)
 
 curr1_input		current (milli Ampere)
 power1_input		power (micro Watt)
-- 
2.45.2

