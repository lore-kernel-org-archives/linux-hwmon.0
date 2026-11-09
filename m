Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237572;
	b=jffTTr9WmgEd2kulZvX0DV7828k71y3jSP7yIFyLdAmyzBmX6J091uzdk223F5C4LuLj
	 G2RqSiI46ac5rJcLCujtHwkviwv6WM7+OFtFTim3vRQ/3XpXWnXLH4XN6RyfsHxgYg5P2
	 44RPiZtLtFIRrFL8wglodTl9gF3p9t1hDplJkjCz8LkRNQB9tYXYN/ntRnYctSdHptaaP
	 h3r4tWyBxaMTH6wgxT/4QsXhmiNOiS17fV0mTpY4X4nwCHkIH3JtcCa8H3U72Gq4MU741
	 cEj8LszmP66yGNPkMWJcdbBX4OMLRhijh6pqHHyMIJ6TiX0Vb2iPz4wkLEEhdg79jcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237572;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eRim2hz+Ku8h/f31Wjn4ZJ0jFf1mb4btxIGXDD9mdpc=;
	b=fqiDTjyAJy7v02PC6Kvssbtp+rAdckX6UBlFZuszHXwB1d0kytI4aeJz4V+cP+iyHwq7
	 271rG/L/b5kIWImGkLRQl9jUgrae0yzmEe7Gd5TzguU4K6s9jp6nF64t9KHBbFB+mklRM
	 gWx0wUXzZLEST97nCPMZu4JTWkHvYsoH8MdiojPG8oYVlMZyK/Xi1iNMWqgZqY/ctSgSo
	 Pb44FwFalR/47/8pwfJB6HJkC12txUmaOKpibV9Q3kO0xi+iTAAZgJLwNWUOxkU2O0okP
	 KT1KEzL19zdxUV5SaVKljGLupv2pChlAH9kLWf2VcRDty5zxApo4K/DQRZhf+CaR9/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TR1CQHMj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A974606A33C;
	Mon,  9 Nov 2026 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TR1CQHMj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9711F008BD;
	Mon,  9 Nov 2026 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794237572;
	bh=eRim2hz+Ku8h/f31Wjn4ZJ0jFf1mb4btxIGXDD9mdpc=;
	h=From:To:Cc:Subject:Date;
	b=TR1CQHMji1ajjD9aOHzEtH1XZLzKphRlEAvl7krj+IV6alRfqSMtS3i15Yw65Cy5p
	 sFwvQzmKG+mzi+sZR1PvsxQfG3aktwewxqJ4+j7858Dc1qbapa+iRUVK74yzjXk0DT
	 WxnSFmPb12NYSKvOOJpIEcPGLe2gEl6Do9jrMi2yYC14lsRWGk2oP8W34Bcw24i5VJ
	 R8/8sAWINod+ON9IMYOeBPFKcgabyuiv2vBl1Nx/NovxTIKplmCo8grdglK8pYKpJF
	 628wJetH9PMsi0WfmORs6+r+0xzWWJPcTZNsVUAHTLpTVjJaqar62mkaQqMDNoOspy
	 eJ34+0LF/BxHA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-hwmon@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/2] hwmon: (scmi) Check channel config allocation
Date: Mon,  9 Nov 2026 15:19:26 +0000
Message-ID: <20261109151927.1672956-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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

scmi_hwmon_add_chan_info() can fail to allocate a channel's config
array. Ignoring that error leaves a channel with a NULL config pointer
in the hwmon chip info, which hwmon dereferences while registering the
device.

Check the helper's return value and abort probe on failure.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-d10ced6b-a6f0-403b-9619-f5a6573f9e7f
Fixes: b23688aefb8b ("hwmon: add support for sensors exported via ARM SCMI")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/hwmon/scmi-hwmon.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 7789285b6c67..0c82d8dbd626 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -228,8 +228,8 @@ static int scmi_thermal_sensor_register(struct device *dev,
 
 static int scmi_hwmon_probe(struct scmi_device *sdev)
 {
-	int i, idx;
 	u16 nr_sensors;
+	int i, idx, ret;
 	enum hwmon_sensor_types type;
 	struct scmi_sensors *scmi_sensors;
 	const struct scmi_sensor_info *sensor;
@@ -297,8 +297,12 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		if (!nr_count[type])
 			continue;
 
-		scmi_hwmon_add_chan_info(scmi_hwmon_chan, dev, nr_count[type],
-					 type, hwmon_attributes[type]);
+		ret = scmi_hwmon_add_chan_info(scmi_hwmon_chan, dev,
+					       nr_count[type], type,
+					       hwmon_attributes[type]);
+		if (ret)
+			return ret;
+
 		*ptr_scmi_ci++ = scmi_hwmon_chan++;
 
 		scmi_sensors->info[type] =
@@ -333,8 +337,6 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		return PTR_ERR(hwdev);
 
 	for (i = 0; i < nr_count_temp; i++) {
-		int ret;
-
 		sensor = *(scmi_sensors->info[hwmon_temp] + i);
 		if (!sensor)
 			continue;
-- 
2.43.0

