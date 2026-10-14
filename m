Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D2488DBE
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 22:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016551; cv=none; b=K4TS+dQogdKKK7SxgUWbmN2ui09+ojL/06Z2ot6qAyMaoURyA5Ns3IuX4Xmoq7bjKPJbMI/Ab9AvID71OJTvp7suHhJCebZW0jjV55S0boZcIL3aFleinv9l3At40vnh468ALkbnkgvTEgn3+pFFlbRLdn3DzquE1YbBWobXPfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016551; c=relaxed/simple;
	bh=xFEmAAT49vOrGlbwyZJCJpFg7gwDK6WlTjnMnrxO8bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oSgOUgDtVRnCs8PilAc1DXVLuKv9AKWug347Z9bEK8ezsANLRCHqmg1f/guvzGjUOV3s4HtDN4aREflJqTDxp5cWaspgdT3SJ6glpukkfC4eKQz6KPb8fJWwZ17Ag/1E9M/eGarnyA3vGZ+cpZaTCOObX9pX0X8Jb9ya1u58df8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUjUgw7r; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUjUgw7r"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2156503eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 15:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016550; x=1792621350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2b7f1ifOYnCy9LytpiVooR3kRz3vXe1JYmZB2bLzwcY=;
        b=UUjUgw7rcVdbgL1OES4tTklOrZBQSJKt4SIH6hfwZ2AV9afaf1nG/XNywi6iVdrOLw
         oTuMEaw+YfXcDoVoPAtX/D1iEr7BQ8I2JreFByfSpFj4mYZX4C/U2XzRvedNvZaGt9/j
         OUcUEXo9xhXWM3c3l8cFbJ5YkmugLcJE47UM7ngENVXmB9AXrB7zltVZcz9tttA+awgj
         3zejwZGyY8jIGh46LwQr9PgapKLf24nwqfifL+/43Plwkrg7E4rfi944gMTCc2GqP2f8
         T5mifXZbdyP62krikIUEvoboEYGuyVdswrvqZ+ROL+JoHy1z1PhSSRy6e2/N08j4AfVe
         u+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016550; x=1792621350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2b7f1ifOYnCy9LytpiVooR3kRz3vXe1JYmZB2bLzwcY=;
        b=qWHHttaUARVeTqgFwk3inJ7wGG7EUbhUAJBYUDbcFPhgToc7niGGqZlPsv0ris0v+w
         P3fV/zjrrJA6zI1q6KbS5IVS65EvdCrbhtLFxeBX32VuucGXxwquYC24apxbeGRsK5mo
         iGQqH8NwyvQ8/FngflIXBbUBWcdMRfxTGo6RQMfj3dPEDzMNSMYxOzrJuCbppErjFh9E
         w4IJUdcjKMHmcxhLRFUvUMtEgHL2wbb01v24bdMYS8pmeu++TiKArztpS/3vCZcnIeb0
         XD9kXkKr0kymYAYG6DkmVYNIXb2pTSFtwMfAvmN+g0koNqZkQX0E8ywmV6feRgTB4FCb
         JcBA==
X-Forwarded-Encrypted: i=1; AKwUvBx+OG3wN4dfWVwHEm5b1KWsvXsTHKbdeb6Mb71gyUR8ZG3SPGbS6mSAbk/+qJYpanrjnMDkKI/mI+1MBg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIdDB+BLnH4udpuGUdy+RPEagteZwU4p3aUqspFsfUzpdSioSvH
	5x4NE0Riieh3Kc1af4mUza4iicDzVqQkE2M2lCh48vyMPYaKKdfEQtef
X-Gm-Gg: AYBFou0fJfEwtzUfnYhmNmqOsmJT0JSn9FvNQAhrKlyqP4GVrNWkul0YvX5j/C1zYjI
	1B/95kpu08mLNpFMpIdutW3xSAv5G+ZVNnO6B2H+huWF2TC6QjN2TOgZdCuaV65LTMFs0CvYTJB
	CvD2doJm1DTCGncvmJxRGwXpWB6oRpS7LXMDpn7fROtTbVCXgrxbJ5NS28OIApYYJqqoi9F45fY
	bXv5KSqVa4LQkZhOOiYs6+6lDl4aK2JVKiICSM0rNVgQoHDyKR1InajBpParwedHX4TxdFHH5TF
	ZbjHQZjakb2SxWk8BYov/DxLDFpw1XdePG/7RMdpV6pZve6v3EZ/mec6exQ8wIHGCcO1Z+vRuQJ
	Aq/UjzQ01Syv4VSEf8jEVJZI5BeYl60mPUe1rX6P8c8Z4AeOsLE4H7apLCYuHGJQNue+HyccARC
	rhWq+Hv9VNw/XiKmwdpF6Mgu5gTW7nAPOwpOvFAw9pQIJvbzspmvG9kindojVapJeXuNzBKHf+c
	blYmDASyZGk4aokNg==
X-Received: by 2002:a05:7301:3a84:b0:351:985:e729 with SMTP id 5a478bee46e88-3537e01e8b6mr25315973eec.12.1792016549619;
        Wed, 14 Oct 2026 15:22:29 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:7561])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d202sm54635124eec.13.2026.10.14.15.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:22:29 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	hmohsin@meta.com,
	mike.marciniszyn@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v4 0/6] eth: fbnic: expand hwmon sensor support
Date: Wed, 14 Oct 2026 15:22:18 -0700
Message-ID: <20261014222225.2803660-1-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware capability response carries per-board sensor thresholds,
and the firmware reports which range a sensor has entered whenever it
crosses one of them. This series surfaces both to userspace:

 - Move the sensor read logic out of fbnic_mac, closer to its only
   caller in the hwmon code, and drop the now-unused get_sensor op.
 - Cache the temperature and voltage readings for the current jiffy so
   a burst of attribute reads issues a single firmware round-trip.
 - Parse and expose the temperature (min/max/crit) and voltage
   (min/max) thresholds. Thresholds the firmware does not report are
   not exposed.
 - Parse the range firmware reports, both in the unsolicited threshold
   event and in the sensor read response, and cache it per sensor.
 - Expose temp1_alarm and in0_alarm from that cached range, and notify
   on each crossing through hwmon_notify_event().
 - Derive the range from the reading carried with the event, on old
   firmware that predates range reporting.

Changes from v3:
 - Moved cache seeding to fbnic_mbx_init() in patch 2, so it also runs
   on resume and AER recovery paths rather than only on probe.
 - Dropped previous patch exposing all hwmon attributes unconditionally as
   read-only. Thresholds the firmware does not report are now not visible
   in sysfs.
 - Collapsed the five per-threshold alarm attributes
   (temp1_{min,max,crit}_alarm, in0_{min,max}_alarm) into one alarm per
   sensor, temp1_alarm and in0_alarm. Firmware reports which range a
   sensor is in rather than per-limit flags, so a single attribute
   matches what the hardware reports.
 - That alarm now comes from the reported range rather than from a
   driver-side comparison of a live reading against the thresholds.
 - Split the alarm work into two: patch 4 parses and caches the range,
   from both the unsolicited event and the sensor read response, and
   patch 5 exposes the attributes and notifies on each crossing. The
   previous "firmware notifies hwmon on sensor threshold events" patch 6
   is now folded into those.
 - Added patch 6 for firmware that predates range reporting, which
   flags only that a limit was exceeded.

Changes from v2:
 - Addressed Jakub's patch 3 feedback on jiffy comparison when
   checking cache validity.

Changes from v1:
 - Addressed Jakub's patch 6 feedback on including a
   if (!IS_REACHABLE(CONFIG_HWMON)) return; guard.

Zinc Lim (6):
  eth: fbnic: move sensor read logic out of fbnic_mac
  eth: fbnic: cache hwmon sensor readings
  eth: fbnic: report temperature and voltage thresholds via hwmon
  eth: fbnic: parse the alarm range reported by firmware
  eth: fbnic: report temperature and voltage alarms via hwmon
  eth: fbnic: derive the alarm range on older firmware

 drivers/net/ethernet/meta/fbnic/fbnic.h       |  11 +
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c    | 140 +++++++-
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h    |  44 +++
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 332 ++++++++++++++++--
 drivers/net/ethernet/meta/fbnic/fbnic_mac.c   |  55 ---
 drivers/net/ethernet/meta/fbnic/fbnic_mac.h   |   2 -
 6 files changed, 500 insertions(+), 84 deletions(-)

--
2.53.0-Meta
