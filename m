Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CC5255F2D
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 03:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479912; cv=none; b=mn9yr3TMzlSbYT8A4F4HBXJpOXXCshQalYAc0pGisASZ90keKZqPDP8NImhQczlhJM/TZZLfavjBlv+tFuwb1BLH+awGGF6j/Tm8/C34ngLthD3qZOKGoBbRZRqdgv/Vzxa40ZCykzN5g07lwobky5uPzh3H9rcn4M6FFemwGs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479912; c=relaxed/simple;
	bh=oIrgGebe4Uz5qIt36uBo7TqIEvJpwlb7BT1rwIY0nPI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lpRGnqxydTcdNZF5whdOMfCdUT5ODxDP0d13UBnrUjZv8tp0aT0RtkDaqhd5NR/7Lhbg+rNl+gduuBj65H97LTtxDklqc2dJCAT5MEwfqUVV25rTgyhLS4ho0YWm7gsc+Ye7GJRpFKzcSEFKBOtl7VPD8Tad79G9DIDfM93LHGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdkpzLfB; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdkpzLfB"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38175907a56so1134307a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 20:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783479910; x=1784084710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFsetDj3RzXGvHphofVRkj5Usv498A8zFSmgO/cSQxY=;
        b=RdkpzLfBfFcAOZjtXmsZkNgTReLResBV9ffUlbZza2ACEzAT/K0i6Vz/mr7sGSWwTQ
         sip8bOsArdkSMTLWuT0OzfCDrF+s6qc9aHNtF3aek6js4e1BN7ZkymtZV3KDFStRADzi
         sgdOZIHCcyf+FKUROEwp0f+zynKuRq66NwxzhoGjUT40OgyyuzPIg5SYKUZPNU4tZoR8
         GG6YRj9ICG93L0zdpJH/Nu5izfSPoEfgfMXr6tVejvTOb1RRti9DcFqaeEFXO+jKsZnz
         tw0MZaOkgBxm2QgxTvzPgPJBEYQqvOJsl2olFLV5+go4vUh/k6/sdp+gZMrTd8wTCqcW
         fv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783479910; x=1784084710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFsetDj3RzXGvHphofVRkj5Usv498A8zFSmgO/cSQxY=;
        b=Wn4ssvg43AdITYU0IjMx/DAAX6JwyBqe97rynhrniEbVq/tCTbIDwHgI1eTI4gZYTP
         WIl7Wn1O0dc89l2E+OVXTD8A0N3k4WLflutgmPMciCTffRVi4aaTqFyn873yqiYWCKg/
         a8/5Hy21TMDgPrquBjW41Whkd5RcmcdIgQnnkmtl3QWDHsoZ1/DrsmvPtVJA22HsQ1RY
         cEfNG/FcObBq8eiO8MbwcUxMtehdTdGlBQGAUs0R3cI6rSyR714EDCmbgPvQqtjJFT4U
         DWlRHsTTMVIq+iPI4D1FpPdHQeDVf7K9ZVyMkKjutSfy2qh3dEgxcmM1xrGkYLmLHs+b
         +++g==
X-Gm-Message-State: AOJu0YzVg7GV7QfvhzUxcnqp/Wb3WyYa/nP7QhejiJhf3+yTUs5zz+Cw
	iAm/2zT1btjuBFWvjj1Quowdqi9vdbuOxmg4ApUMvUtlZ+AQo/Q4RS+XjYuSjg==
X-Gm-Gg: AfdE7cl33l83o6x6CIzFq7MA2BUu0xikxw5qBCtP0yZZee9EnWPyj5by5zrW5A0Pqor
	0Bj5BezsPx5edX+aIJ0AYCXwsiZIY2jY5lrc0k6FUp0F4cQ3+8iSq9tL+/xWXfpnP+6Dv/mxY5T
	/CVSpQ1g0K0skDkC5TfujP2tRBNYZmq31A8Qw9zt7ZiPPbBBekKi2zcTSMAgiJOVEwo1KF2sojw
	EN3cga9YlCqBAqxLXmuklSVgVHGNX1wzHqEupaMFgGY7agT/z8xXia35uGrGbsmIJsRNbZeCiXd
	/fDN1h35eyLus7k49Wnwux8LXNoIXl1U1PacRXNWkPL4vOFxhrQSzXUfIgEcktfRJecbaYYXsud
	tNfR3V9UURr3I8NPdKO+mK5u0xzoNAC+lHziIEw3gJppBM9XHgd6hk/FUSC4ESXAhkfmmPldjbh
	cyVkNG+pVEtfyq4x3ZFkwMmBLOBQ==
X-Received: by 2002:a17:90b:55cf:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-387d6b963a4mr5626652a91.4.1783479909908;
        Tue, 07 Jul 2026 20:05:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm3720364eec.9.2026.07.07.20.05.09
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:05:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: [PATCH v2 0/4] Fix error handling in HID device probe functions
Date: Tue,  7 Jul 2026 20:05:03 -0700
Message-ID: <20260708030507.227193-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling hid_hw_stop() does not stop the device IO.
This results in a race condition between hid_input_report() and the point
immediately following the execution of hid_device_io_start() within
driver probe functions. If the probe operation fails after "io start"
has been initiated, this race condition will result in a UAF vulnerability.

Fix the problem by calling hid_device_io_stop() before calling
hid_hw_stop() in affected hardware monitoring drivers.

v2: Call hid_device_io_stop() only if hid_device_io_start() has been called

----------------------------------------------------------------
Guenter Roeck (4):
      hwmon: (corsair-cpro) Stop device IO before calling hid_hw_stop
      hwmon: (gigabyte_waterforce) Stop device IO before calling hid_hw_stop
      hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop
      hwmon: (nzxt-kraken3) Stop device IO before calling hid_hw_stop

 drivers/hwmon/corsair-cpro.c        | 1 +
 drivers/hwmon/gigabyte_waterforce.c | 4 +++-
 drivers/hwmon/nzxt-kraken3.c        | 6 ++++--
 drivers/hwmon/nzxt-smart2.c         | 2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)
