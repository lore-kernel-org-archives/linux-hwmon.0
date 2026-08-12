Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6467541D127
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 10:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530939; cv=none; b=OstNIHn2HlCieHnxsT79z5XI+XI8zT5XvoqFpYAIRGKFMp819EwLgCQxXmr7/4cc81cFrz+0kZIIDtfZhO18UWRS+3B/Zxp65Rklq18XsMc1wWvU3mQ+WhxaUBmU74QgGvXScgMlD2Tz5m1002lodMBbtP/TrF00XdB25smIS7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530939; c=relaxed/simple;
	bh=fDm5OgbTBl5iPXEnSa7Ard5SQYNJ2RbUB/zwyucZOnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1gKAZZ97kYwzuISzFLl8L3aZ0T6vBvx2xOJOU6eEzf5UjlC197/1lwAIYrM3iy3yaevYiEVkT/oQyjORQTA6WTL8kOQVrJNDxGMtFtk9cwxtRR4IaWaefqLMyum7PzJfM/OBjJjeT+IE8gHyoOLq2V43fMqOf+kxzN5sU8ZhWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=LFLEWxKD; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="LFLEWxKD"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90a6b298887so4199856d6.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 03:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786530937; x=1787135737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKIsJHjgPoQf+kbiTogFfPswRclgUU+W7sLet0609EM=;
        b=LFLEWxKD4LbNFnP7Tip/5ntXaLxq6Xtn1+qP7I8/H4LRcQA5Pu0LHpScKKeIWILX/F
         OMWW3PZ9kkg5HjhTjl8JQkXHO4MhVCo9KzTXqR5q5TJ+rKu0nLVrcDrk2cJvw8qx1+rK
         hUm3l24QPg76sfSV7a5m0vRxiOHbtuqGtOs8d1t9WpRZ15vBuzCNwRQbJxZIbNReH+aV
         Dgla2U8gdZ1Tm5FMnWI9WFDEeG2429FVGWtVJa1lOhz10vQcCU5cGF3qin6J05wg66dE
         iZw0LI90tXxHpyqdK7rXqMqSBxZZ6ej0eTBrddG2iDXxkefPCoAJENxyPPs9ZPJ4UOpO
         2nPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530937; x=1787135737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKIsJHjgPoQf+kbiTogFfPswRclgUU+W7sLet0609EM=;
        b=E8zt42ww3C+srWRY69rxeiKAt3If9vSponVHR7K58IYk6eXl41YNa7zTXdArifZQho
         JWxQM0wRz+xQRsXD1qYVP/KPuzVQ5u0YihnNGCT2wfoxnoXS2dhV8RcOK3mOnm9hGtdh
         epuoyXF/SD1MSzoqMAdvZ88P1E/K26rxWHZFs2qIz6uCZXaZnAFR1oq+PUzQQnFXH2P/
         S+35t+Zq5JR387i3Twbgy1kiNTQBYpbgLghABS+kFm2Knzx5tRo1S2MYdsKjlHrq7wyO
         F4CGhFfB/0SKK8u3WthAKWo6FwJkK/xLTxTZS3flL2XADq8F4fxc/D9pBGdmTdOFEJr1
         o7lw==
X-Forwarded-Encrypted: i=1; AHgh+RqfKj2B89noCCMJwwXsfb9LLrVgoGInxC4xP3aUetRETZdlXP/PjUHk13rXoOgUJQDim1JVnZYkNaLjcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa//NWjMhkDkJwA2x0PMEqnwwulJgVri/fGtG/jkJjmo/Zfl+N
	Ad1XUaUgtl1sxUaPVNUX3y84zFwSZxXl4P+hglLLl2Tip5Xb76uoOfKIMrgnmOgSGJs=
X-Gm-Gg: AR+sD13v1C/ap2ssaKz0kMr7OJhuxu5sOjEdOpPGU0lBf/93bp3AQkW/0YyNd8ymXGd
	Uz6VRb26oWf0lpbNqGQnbX6LiZqiTfZV4FR152iQsG4AcE1YZxr8rRIvOFmDf5wej1gtwTqLcLB
	2tBJ4YzUKWLgSFLRiQLUTuFe5VrjLmvE7STkduXfZwBlbHcXMc0ngeGaM2yrO+zYJI4uu4LFuSi
	2Oa84AvTgKo/dI8IzsfMhZ2ia2U8e68H5/9Cm1P3kpBIL0jrumRPOJsvw8StfP5VMM0QUeizlka
	a+MPx6bNqlhXxhUsT+lfd9guIi+XBHWDnTCMa7hRUP/HTo1/EUKUwrL5eFqtRsYh8aqCzXmOTDR
	px7ZvMSzMModL2g/92aaYTbivEOO6q3TFJ0UBdlMpWFQVo5os3VQ9wDtl046cHItEZ+Q8X0Zhzy
	LssMz09tJhvX7NO/k8ADf9cs/IanehIKvEhHkAEIjsezBUTXnDAtfa4F+tP7qWSgmlFpcYgchV+
	+MiS2IddT4eLcywuH1fbrHbdG4rgYE1WPWvpRol8AYF
X-Received: by 2002:a05:6214:212a:b0:8f2:1d56:3e8c with SMTP id 6a1803df08f44-90a700268e3mr35084676d6.29.1786530937041;
        Wed, 12 Aug 2026 03:35:37 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c29e942sm18718386d6.12.2026.08.12.03.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:35:36 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH v3 0/3] hwmon: Add ASUS ROG Ryujin III support
Date: Wed, 12 Aug 2026 06:35:29 -0400
Message-ID: <20260812103532.395049-1-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hardware monitoring support for ASUS ROG Ryujin III coolers.

Compared with the Ryujin II, the Ryujin III uses different offsets in
its status reports and a different cooler-duty channel. It also does not
expose the Ryujin II's external fan-controller channels. The first patch
moves those details into per-device configuration and rejects HID devices
without that configuration before it is dereferenced. The second patch
adds the Extreme and EVA Edition variants. The third patch, authored by
Will Smith, adds the White Edition USB ID. Will confirmed his authorship
sign-off and tested that variant on his hardware.

The Ryujin III implementation and White Edition were tested through the
linked project pull requests. The EVA Edition hardware was tested by me.

Codex using gpt-5.6-sol assisted with porting the changes to the current
hwmon tree, organizing the patch series, updating documentation and
commit messages, and running build, checkpatch, Sparse, and Sphinx
validation. I reviewed and tested the resulting changes on ROG Ryujin
III EVA Edition hardware.

The v3 series passes git diff --check and checkpatch --strict. Its final
tree is identical to v2, for which the driver object compiled in-tree
with W=1 in both built-in and module configurations, and Sparse reported
no findings for either configuration. The range-diff confirms that
patches 2 and 3 are unchanged and that patch 4 was folded into patch 1.

Changes in v3:
- Fold the missing driver_data check from patch 4 into patch 1, as
  requested by Guenter Roeck.
- No source changes from v2.

v2: https://lore.kernel.org/r/20260811233943.319729-1-renari@arimil.com
v1: https://lore.kernel.org/r/20260807000107.1786892-1-renari@arimil.com


Arie Miller (2):
  hwmon: (asus_rog_ryujin) Add per-device configuration
  hwmon: (asus_rog_ryujin) Add ROG Ryujin III support

Will Smith (1):
  hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition

 Documentation/hwmon/asus_rog_ryujin.rst | 25 ++++---
 drivers/hwmon/Kconfig                   |  4 +-
 drivers/hwmon/asus_rog_ryujin.c         | 96 ++++++++++++++++++-------
 3 files changed, 87 insertions(+), 38 deletions(-)

Range-diff against v2:
1:  686fd2251bea ! 1:  35b53d4b4085 hwmon: (asus_rog_ryujin) Add per-device configuration
    @@ Commit message
         a different report layout or do not include the external fan
         controller, while preserving the existing Ryujin II 360 behavior.
     
    +    Handles an issue reported by Sashiko where an id could
    +    be missing driver_data.
    +
    +    Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
         Assisted-by: Codex:gpt-5.6-sol sparse
         Signed-off-by: Arie Miller <renari@arimil.com>
     
    @@ drivers/hwmon/asus_rog_ryujin.c: static int rog_ryujin_raw_event(struct hid_devi
      		if (!completion_done(&priv->cooler_status_received))
      			complete_all(&priv->cooler_status_received);
     @@ drivers/hwmon/asus_rog_ryujin.c: static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
    + 	struct rog_ryujin_data *priv;
    + 	int ret;
    + 
    ++	if (!id->driver_data)
    ++		return -EINVAL;
    ++
    + 	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
    + 	if (!priv)
      		return -ENOMEM;
      
      	priv->hdev = hdev;
2:  68d87330a2f7 = 2:  ce2e2c681daf hwmon: (asus_rog_ryujin) Add ROG Ryujin III support
3:  c3d95809f962 = 3:  2dca57c91535 hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition
4:  e9558b907537 < -:  ------------ hwmon: (asus_rog_ryujin) Handle missing driver data

base-commit: 54743b5ab981d686b885c3da639d4ed6cc995e8b
-- 
2.55.0

