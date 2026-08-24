Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0046517B418
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 17:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593864; cv=none; b=ZToz3npF/eXYa3WkMI10ymtCxdmmaY+YLx7ukNxqX9Tjk24+6HUoIjYCnyI3H0zICLklvSOMkdcfbz82tCRCT+T13XPPOiHXYtYMdEOEQqg+tQzgAWOkl01GV8Ft5wVmW1eA3OOAMrzXO9UhZkEfp2IjnImtE62W0OtRcIBMJ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593864; c=relaxed/simple;
	bh=j+4P5I1w7yupkjtI1aHIdS2EV8F3BTV+hCLwZ4e00/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=do1ENfgcplZ6jMyEFn822TCGBqUs7xP4bOlyefvtccA4qseZIGcQcD5na0nIPH03++VJ2sNjNkCiuKn7n8gdPsv9Qva6pjX87W0pEPSM89Cz72EbImW1H+FnNWrhN0GB8dWKAJbEIEU3veYFT+8JfnPrivEeE2qtv/WQ1mxuSiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qLsQeXgz; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLsQeXgz"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3335088a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787593862; x=1788198662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAf9E7CenHe6l5YzESk+eJosOnuoeSazKjhyH+9ql1Q=;
        b=qLsQeXgzu+15APZs86ZxH5A4GWc0YvJppIAxI8cgH1VAekYqW1OXsOvwtr0yFqsrIo
         HWiFb9Ee7tnpw5Got1QbAVpWrKsolAOCMMYLZHfk9dQzhQETMrEIJxojR81ceduU1TXC
         qt04DBFoPj16Jr8SHTZFJBTDSbG0p0sd1aqDQCeNiJn3HPJbrWcmviQxbrcapk8g6JvD
         AyG7IWOP56lpph1ax1/GurpUlwm4jN7trLz3uaWXdFD8IzFV59ITt9XbB6b8KWl03lNo
         TfxC+Zu3CoXMB6BkUj5aVehmPzurxmPHl1wUWAOMLh/7rIAtGLaxeTUZqO0RLO+JW2dT
         D94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593862; x=1788198662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAf9E7CenHe6l5YzESk+eJosOnuoeSazKjhyH+9ql1Q=;
        b=GaSGv1905CaHAhctpD8tglwNgEWYcs7APs1szHtGx/Hn2E2hQS9whcUrmxhEOTveou
         26kjRtvZZ4JtRlg8jGMcrZn7zPajpAZ1uHSn/vHqA46O7dSmRz+Il8DPrM+ui9lkhY8V
         g7i7+v9nkrgbk0HZPv1zHacq8SvICDJ1iG6oEqknIVn54IcfzEipqJHyf7JftCD2UX1x
         yerjspBvj+Q8D8I2tch+AP+N/IrdOeR8HCZ1UuvQuOH9Njdp1ZBD5OxfUyCAbDGsOv7F
         +q+P7lJxE4sJEeaSwcfwC2aiwNAvpL3DXs25ocqhC/uUqBsDA7znYBHydprarBFt0UKD
         jaOg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3G7iUBIYbEKXMIFGohE0PQmkb039oNZfvDVi4DZLgyvB1ktm+BRc3K7+zt2yvvj6IZAwyipEMaWYAng==@vger.kernel.org
X-Gm-Message-State: AFuF++kC6KvFX9BiM6UwtNX/SBzsF5LjeIhvfBBtZ1/ZepxfYm36H2Iu
	0ax1+pZICvkgL9hucNzVCLm2UR5sajSFZGoDtzlL49LDwVDcrniImnWN
X-Gm-Gg: AR+sD11LTvMEZhLAfAmn7hd0WPuM+PQAWjVts7xUtc1pPtE5qz54ufPKdrya8Dr10iU
	RzcRTEKGF18wii3g7M6qpUnEBX6daqDrA8aiNF3BMR150s5gaz2HYgLo+xAPh8sZ83n1os3eQBu
	Bs6S3EQlunDJX4CjRKSNHrccqMQckBVD4ji98pmGSElGH/0cZfDarNh7w9BVg13WaZWrsRIUCLz
	Dh2EMPGW6+uqqeVGYxIJ0WV14cOvWOdZkFAROC9QkBgwEUctIT2MkHujPUbMqvVrQkwu/1DRQxC
	Tya537jfGXeXE268xoVBEAV4zXKkjMsWHghsX8os/RhmtQIoWs4m5AsrZSz+pJ78e+dZMVvdv/B
	GK+2JOt2CLhNxjgASwpqspGa3lACbfFCfsiny93zWt6fHO9DwZvccKrdI6zeQZ9ddiipCIpP2Kk
	yA9U7Z2fntSKDvowvT1Lk1NL/Y72/gH4b4HDq9NIRFPC2cJQGAugcRGWgDzf9r2wB7YEfMWBb4f
	WfhYg==
X-Received: by 2002:a05:6a20:918c:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3cd301a21c1mr51934883637.17.1787593862323;
        Mon, 24 Aug 2026 10:51:02 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:ddd2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm29482466eec.17.2026.08.24.10.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:51:01 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Simon Horman <horms@kernel.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	Zinc Lim <limzhineng2@gmail.com>
Subject: [PATCH net-next v2 0/6] eth: fbnic: expand hwmon sensor support
Date: Mon, 24 Aug 2026 10:50:53 -0700
Message-ID: <20260824175059.2485048-1-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fbnic currently exposes only the raw temperature and voltage readings
(temp1_input, in0_input) via hwmon. This series builds that out into a
complete sensor interface and hardens the read path.

The firmware capability response already carries per-board sensor
thresholds, and the firmware can asynchronously report when a sensor
crosses one of them. This series surfaces both to userspace and cleans
up the supporting plumbing:

 - Move the sensor read logic out of fbnic_mac, closer to its only
   caller in the hwmon code, and drop the now-unused get_sensor op.
 - Expose all hwmon attributes unconditionally as read-only (0444).
 - Cache the temperature and voltage readings for the current jiffy so
   a burst of attribute reads issues a single firmware round-trip.
 - Parse and expose the temperature (min/max/crit) and voltage
   (min/max) thresholds. Thresholds the firmware did not populate read
   back as -ENODATA.
 - Add the corresponding alarm attributes, computed by comparing a live
   reading against the stored thresholds.
 - Translate the firmware's sensor-threshold-exceeded message into an
   hwmon event so userspace is notified on the relevant attribute.

Changes from v1:
 - Addressed Jakub's patch 6 feedback on including a
   if (!IS_REACHABLE(CONFIG_HWMON)) return; guard.

Zinc Lim (6):
  eth: fbnic: move sensor read logic out of fbnic_mac
  eth: fbnic: expose all hwmon attributes unconditionally as read-only
  eth: fbnic: cache hwmon sensor readings
  eth: fbnic: report temperature and voltage thresholds via hwmon
  eth: fbnic: report temperature and voltage alarms via hwmon
  eth: fbnic: firmware notifies hwmon on sensor threshold events

 drivers/net/ethernet/meta/fbnic/fbnic.h       |   8 +
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c    |  75 +++++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h    |  30 ++
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 263 ++++++++++++++++--
 drivers/net/ethernet/meta/fbnic/fbnic_mac.c   |  55 ----
 drivers/net/ethernet/meta/fbnic/fbnic_mac.h   |   2 -
 6 files changed, 349 insertions(+), 84 deletions(-)

--
2.53.0-Meta
