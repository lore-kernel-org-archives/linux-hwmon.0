Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237576;
	b=G1+ybhgSRhv6IWuCPdlJIzw8fl1VWiDMIU9vKMRq+HyKh3Gu2yXQFHHYDD/M4+y4AZgL
	 X1c1DsKAlFWPXeIbVXL9cFRWvfCNCwOi+vuE1KXFdYE9cMiYI8hThMeGLv7YGzGbzWvLz
	 1V1F3pu2n/2ht+1EYQpJMtqoC+M11PrSJo3jo9CkOzmXTW3ZBXSvsVz+Viy30CMuRQyjs
	 X1hTOzUwz96jcxck5+ewIJOpQf0sCFnbaSc3s8dLwxWdbDCAvvRvzstkTTN1tywGk02yy
	 bnQ61l9VGCfl/rpSaiVifxWw1ruFRcsXtFBbLUGa6sOLX6AK7Mj7HzQza1j00NoxCnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237576;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=M15McApv6NMlbd+nFsrUEB2TsKnW0avvkz2CQP6vIBI=;
	b=bZaTDiJKyoqH7KEEbji8lAISy7R4eHbeBMQErH0CHAuCReJIo9l5eb/qUAlSeFWOHTBs
	 +BBTxCY9JKzeBvmwo4+6cJCKFqIBEO91cvRvREqcppScTJwjdI9jl0ktUkWRw0cQpyv+F
	 uEFz7RFleenWu8dHeg/T9LMqheJHDnY2GKhBALLbcb41/A6CzaO13nOqaFM50kwYBa7qO
	 0Ke88YBywGnGqI7osYo6vywFfPnlzGDNl3JLbIviWZl0WtbomH7aI+/bH7kn9rmWkObAC
	 4nhOBlfpxykmqscmM5S4DD1RsFHrMnMX6HVTsUVSKzssWhEP3U1WPdIgKiC/gMSg0lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kkyMeqGD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117BA606A325;
	Mon,  9 Nov 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kkyMeqGD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9031F008A2;
	Mon,  9 Nov 2026 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794237575;
	bh=M15McApv6NMlbd+nFsrUEB2TsKnW0avvkz2CQP6vIBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kkyMeqGDFcJsoC+jwSF16HpmtHilqfrL+XTdEozENWdXTKlcXdJ7ZvXAQbTmtxliu
	 gDxtvH68k0Xefc4fnOZd+ajqv1Oxv4Po1n6bEFqcHuEW/f4Hm00ZjlCMNzZceD7SKe
	 WMxWwyT5rmmJhGQNqHDtYR3ktVmEuw1WkUJM1euw+CHBLIC+W5ybg22kOObfoHgeRO
	 LIVMFqnZMzKAhs83hKSgvefZd4KZhxpmROrOOae707YlGKw2HNByeSgJXeVZMQzbxM
	 VOwU9YNYAi2Ad08dhBV5T+x5XzpCoq8lITFmU5HUCT0wJdwmsVX92h1imc5i/Cz+Xo
	 ObR6gTcOUKuHA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-hwmon@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>
Subject: [PATCH 2/2] hwmon: (scmi) Configure sensors before exposing channels
Date: Mon,  9 Nov 2026 15:19:27 +0000
Message-ID: <20261109151927.1672956-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109151927.1672956-1-sudeep.holla@kernel.org>
References: <20261109151927.1672956-1-sudeep.holla@kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCMI hwmon enables sensors with SENSOR_CONFIG_SET, but only after
registering the hwmon device and only for temperature sensors. This
leaves other sensor classes disabled on firmware that defaults sensors
to off, and exposes temperature channels before they are ready.

Configure each supported sensor while building the channel list, before
registering the hwmon device. Leave failed sensors out of the list so
their channels remain hidden, while continuing with other sensors.

Cc: Marek Vasut <marek.vasut@mailbox.org>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-4bdf9a68-22d5-4305-b684-f11fe6d1dbcc
Fixes: 72804d1631b3 ("hwmon: (scmi) Enable sensors to assure they can be read")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/hwmon/scmi-hwmon.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

Depends/rebased on https://lore.kernel.org/all/AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 0c82d8dbd626..91a63e92c3ed 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -325,6 +325,12 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		case ENERGY:
 			type = scmi_types[sensor->type];
 			idx = --nr_count[type];
+			ret = sensor_ops->config_set(ph, sensor->id, sensor_config);
+			if (ret) {
+				dev_err(dev, "Error enabling sensor %s. err=%d\n",
+					sensor->name, ret);
+				continue;
+			}
 			*(scmi_sensors->info[type] + idx) = sensor;
 			break;
 		}
@@ -341,13 +347,6 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		if (!sensor)
 			continue;
 
-		ret = sensor_ops->config_set(ph, sensor->id, sensor_config);
-		if (ret) {
-			dev_err(dev, "Error enabling sensor %s. err=%d\n",
-				sensor->name, ret);
-			continue;
-		}
-
 		/*
 		 * Warn on any misconfiguration related to thermal zones but
 		 * bail out of probing only on memory errors.
-- 
2.43.0

