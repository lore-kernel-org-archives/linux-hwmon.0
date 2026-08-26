Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770DA3A3826
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Aug 2026 18:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770091; cv=none; b=GqD6xngouXKJmwzsnpE7CvVNnIV5CgatS1/1tVCQ5U9rPxHPATcAAN4h5Ddecfl76TodxzuqP3UwrDSFhO4gBEJkXOG76wlY0aS7YV1pwhk5pG7GIqS8QhmhkhXbBaVwkCvDxbYczjtfzW5qLNl3CxbTKNxOPp0MJjuK75t6X9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770091; c=relaxed/simple;
	bh=1Hm5k9fnEVwBaXvX+rrl1XNH/vHieND2jPcZRb7RxS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ByEe93sWuW2LWGKINJDHMSDGPKDrdC6Py4RMLQAgKYFkbhr7fz+SCXT20Gc41zS2X5kpAVIe04PQv2We0XJViyXnjiofAsoM0kofIXBbBeOZ9wexnkzu9dTh4RQ9DDyBE9KTzrAIbVPRznFWvgvZeEssRtV6p3Jyx7AND/2idZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JncePQQh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JncePQQh"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2529b3139fso133257066b.3
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Aug 2026 11:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770074; x=1788374874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYxeX5UfuTCRGRCYmJDrUw0DxeZXUagnvzMWA/KuGYY=;
        b=JncePQQhLnU98nB52uDJUobQC5sHIuc92Y1gCh4fG8qwE3NuabHpwM4nDrrjEmXP7u
         9cI8OW9W0o2nzSAe6ZcHqf48DEouhOZUXyxarbYoeECxRj75ouOar20IHcKY+NwVi7CO
         f3U18RysXhA7TAwQjEL5sUccXRk31q1eg9s0LxPMOUqsLURaFKmQG8EvFsXUo+mMTsmC
         GUeJbbZ5bubwXBqxEV9cZaFMkKnWLQlb7RpkNuafzYVdCJJVpg6Qmaxgam9SsM+/lA9D
         fKJMZRfc8t8hvD6WIZkRORofevUuwEf6pOC471URppWksLctWplmsRCsUGYWeNBuzhg9
         hGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770074; x=1788374874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYxeX5UfuTCRGRCYmJDrUw0DxeZXUagnvzMWA/KuGYY=;
        b=SwxRSrafyqsXmQfDpS8//f1pGyUNZ4xZsPdmd6+2dspNdBElO+ooc1M7GP3jUVbqtK
         nkW4go+v/wmCc1ZcDSxvSfxEnM7MWiinzktnqxc6nYU+t2FCWDhbQYGHxpGVDK5P4pUA
         Omp6GBaIptmF9H+yN85F+NTqasTwxP1IrLa0wqbbLaGYQESuCng53uT9t7fPsUhVq0BQ
         24+NIpJgLM+BJl9TFb9rylic87Q7ZRlYx2A9pDEcTihvOb0JwOPLTEJnYywzWMBt1nnX
         bhP39XYvrUZZmW72/BiCe06jYavNoI8nsDL2Rsfi1zPGJQvh/UHAA/4Bmz1koRVugeKk
         1ecg==
X-Forwarded-Encrypted: i=1; AHgh+RrU51Dn1FX2rE0cn7fGpAOcCUOT8AMzbAe5e+0APjooSPCb2fzeuBwR3d8QVjG1QyFTbEf6jg+2aHQ9Ow==@vger.kernel.org
X-Gm-Message-State: AFuF++lwcJDO6ZMkUO3ZQL+JeFD6+fJJmC2xYaO6KYfp7H6RPtquoiBC
	wwl9ap+94iWURONhJx9fJ//xKEkPrNlEWzREqmi81rx+KzmKsd8ycxOI
X-Gm-Gg: AR+sD13y9+xEIitbBlGeL/fP7k7EUxcRYeEWiMhR373i5/qWM5u1duuiCti5lBRNRoo
	BYkvHSq9SGEkgT7Y7H3W2z7tnZkCVgYIGbQe3FTTlRdFLRzhyfWlvILNNdyNjo0XsC0wLS9IhUz
	gxaHIrhLCgQYZMUfg+dBFvLaWymtXaK3ojY891DwNg8mOgenVuavCny0+Kvu+VIMsvZnOYSl1Zl
	DGYilhEZXic3SVxv6nZjqzjf2zU58xzSHLTtB69u076pO+mk4oyunOJBVsmNZr1I7GACgemWsk+
	naMEct2WJ9KYeKZJfncO0jwewEGMroolskcwslXHuYGa5zP1SzVtVsf/d+lI7hyUojaXpAkLozL
	5j4dvVwoirwW5ZuQGaSWv1aypEGveHEBMzizFsPfMSMeQmVRBHymFqDXv7mLlcgtDG+fJYeg8jK
	N/J36+rrKx5imdG/8TdkRbLzImmjDqihjEm9ESTB6tnn+Qhn8DaN7NelC8L/CLjjb/wMH8Chf2/
	jh4VC7uViK2IqJxMkcAh13fsxSFtpdC4FmeEA==
X-Received: by 2002:a17:907:7249:b0:c21:792:8257 with SMTP id a640c23a62f3a-c250bc37bb2mr1060199866b.15.1787770073799;
        Wed, 26 Aug 2026 11:47:53 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2533945d0esm114523366b.9.2026.08.26.11.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:47:53 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] hwmon: lm90: Fix DT channel constraints and reject unsupported channel 2
Date: Wed, 26 Aug 2026 21:47:47 +0300
Message-ID: <20260826184750.4798-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intention of this patch series is to fix DT channel constrains in the
dt-bindings and inprove the driver to reject unsupported channel 2.

dt-bindings:
Forbid temperature-offset-millicelsius on channel@0 (local sensor).
Rejecting of assigning temperature-offset-millicelsius for channel@0 is
already implemented in the driver.
Reject channel@2 for compatibles that have only one remote sensor.

driver:
If the sensor have only one remote channel, reject a possible unsupported
channel 2 and return an error, similar to miss-assigment of temperature
-offset-millicelsius property to channel@0.

Flaviu Nistor (2):
  dt-bindings: hwmon: national,lm90: Fix channel constraints for
    temperature offset
  hwmon: (lm90) Reject channel 2 on chips with only one remote sensor

 .../bindings/hwmon/national,lm90.yaml         | 28 +++++++++++++++++--
 drivers/hwmon/lm90.c                          |  5 ++++
 2 files changed, 30 insertions(+), 3 deletions(-)

-- 
2.34.1

