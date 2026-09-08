Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03035C693
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908263; cv=none; b=skWsiuN9g0YhTEsVWTFw9Nz2qL9pzYDRXQQgJeouu40b6xppEJlDCg6gyCGevxtTubXU/4bxgw80tOdq3yLWu+BWONw36SbF59dzRbihcDVaVI5LwMSHe+gQeoJW7IXVV9XVEonZI+1FXfy/m4jZdalOroV9Wm5AgJLzTEkJwKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908263; c=relaxed/simple;
	bh=rkKyl75oNGSh9argBDO65R8TRc+7/cMdzZ2u2kUAnOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLf+t0RE+jVOLPivOg15A/m7wwBSwBVZZhWgrC6suXW8cjpZSQC7BTxrXrrA5RlV8X1g/H+bycv/XXmzvFdF42F3yepITHr0jtCVRgoEhq2qjJ4ESYVn0pNODLaM5uQ/f4MTx3B9HbbdCL1D2/dDJrploG3i74b4IfLL5fFUavY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sX2n17ka; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sX2n17ka"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so38911025ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 15:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908260; x=1789513060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dc0GX5Div10dtBv7GvQstkhNGLImZIuVjBsaWt2c5iA=;
        b=sX2n17kaiGgHH6AD+8GmtskgzlMfU1KmRrrXB1nJ1dTYB73Z09J7PElYBGKMVxKmNW
         lLHJmfUJW/hqx1TV87Ny1iij0rx3nAeGEVSxpJaKcYKN5BqvrbU+3oc8RGx58kdOueN4
         m4gBT2rEMJm7Peifv5e7Aboqkx5btPC6nXZFZqbKq0U46m/bOUBsOsPoNCx/f83d9WhP
         ZLgu9XcnClxWOMxUWehIyaYXq+FDCV+BTwJ2WT1qy3Yg+LEL/Y0k/XklKSlm/l0NDYOe
         feYbBMIyJI7H41kInv5fYzloU4bCpxZzOvS9Iwn/g9VYlAO52e4n0Sp4UwYtZhKkjUpw
         YPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908260; x=1789513060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dc0GX5Div10dtBv7GvQstkhNGLImZIuVjBsaWt2c5iA=;
        b=VxXw1U5+hkr2IXMQmjLtkLZbPnupRq5n0P97GOy0/AlxsQXPchoMmJH6jGGPeFwrQm
         BCJo7g+vpFewPaM3NnKb7kuh26vHgIS2I6guRKoH7mdVFqaUQNZIcABsbGFkysADm3ku
         S/PmsJvyHWeI4EIlT8Watao0ov2NAeSfuH7G5Vj2S7aIBXboeiZZLc/rvuzDAoLU4Y06
         RG/UPAT+/iOn8empT8+jHWTFTt42I/fGJ49d4eSieybjmy5Q1orjMPmIL0P0rrsbwezF
         skaxeLk4WjllGXFHRy1FZsplMRlJyymjRgKXLj0P4Fjoq7BP0GdSxpCQYanBAuQYkXxy
         shCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhR97OPNhdWMWm7n2Qm0CAY//4lGrSW1oS3U+RMUeyDilMBPcQ+KFNejxWeOdsOmgomXoHAiO6/7sqQQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ntd/BB+PV9rdSTMz/+4qxeMiciZgQaVOHkf0S5nDa6WcyWwgp2
	uEvnCLVD4rjg2BmxGS8fJZofYS3N/mkPIBxsr08ny12OSl9STC1unB3D
X-Gm-Gg: AYBFou2K7WLs//GsWwGAK5zXqpJqLiNW65vARFCm8axvTSjQ47zVTm2mSvoiNJixVPY
	L6z856Q4CrksVuFkFFE2h+VSCv3Xtgq+lGi84fedh+Gtdos1CpeY6GmbhdkPA2t3M52rK0OhuxB
	PHCksbyV8hGsGSiAa65kgixYvFq3fYb4Jfi//0xOzw7vz+v0sbVzFinsHf62ithDlEYqUnmx502
	cFWI+RC9Y01dUYkUhkYPgvdiGykmvMbwGyWKSbxfATZSn+fdXtrIrvR1Zaex+PCsfxSuwdpBXRO
	PoE3bB5MKKWgyIpD69tITXkNO8uBlhIwKJyWT0kfZPD6hPb4XlXgpkEkbyPkqapPrbQOKMs7WY1
	gz8rR0FXHO1WfV9vtBGvKxSnTTPwh4azjzpptt7ZFNgYG8HQOVukVn5s8bAxtmP7ZI6H0EQLl67
	Gi8p+eth5yqrx1r2VvPcTrn+gBXkBa6CpRUiDZnGbajlEo9BlSp3sy3nsd3+pxswtlbnQ=
X-Received: by 2002:a17:90a:d64e:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39b2612eb54mr47140729a91.9.1788908260481;
        Tue, 08 Sep 2026 15:57:40 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:91c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm36187940c88.11.2026.09.08.15.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:40 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v3 0/6] eth: fbnic: expand hwmon sensor support
Date: Tue,  8 Sep 2026 15:57:31 -0700
Message-ID: <20260908225737.3034403-1-limzhineng2@gmail.com>
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

Changes from v2:
 - Addressed Jakub's patch 3 feedback on jiffy comparison when
   checking cache validity.

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
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 262 ++++++++++++++++--
 drivers/net/ethernet/meta/fbnic/fbnic_mac.c   |  55 ----
 drivers/net/ethernet/meta/fbnic/fbnic_mac.h   |   2 -
 6 files changed, 348 insertions(+), 84 deletions(-)

--
2.53.0-Meta
