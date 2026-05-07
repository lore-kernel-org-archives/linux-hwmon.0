Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE723BC673
	for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2026 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148776; cv=none; b=ZXbjrzXRA4j4zZNwL/VUv8s/SFL/rInFROwdgSp7BnV2MSkZ/UZ4+HqonkKLidj273B396X0AUNIdw9lRffAjTtPV43YEQ5cxaUYqL8gO0Ep1oy+Y/9so2iIiX9EYJMc7/cR4BrszD2kOP4AGyGuj2QLufxdkkpyZbyhOw04Jt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148776; c=relaxed/simple;
	bh=3xfA1DkquYuRG5e/fkJPGHmYNlnl2sMR1OxKC/FswyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AM6/t/i07HgaDMyhDAZNpj0/hzshft0Qp8p65ZAD/AP9ypyobhc7ydrHtukdTuITwtn80IDOC/ierP/0DRdXtll1hjz2LpFAR6Toy65bMkEub4kdWSGzWh63J0yOFZn7PD1llQAm03cxQloNKuyHP72Sr+twWg2uIshMqiM6zfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRowDPRy; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRowDPRy"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-834f1075805so395258b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2026 03:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148774; x=1778753574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TsBqtt18Cwy3ovtqkmoggUEtnSub60FoPA8LRbU20A=;
        b=NRowDPRyT61Dfh1jbN9+aiUu+RUIhtbtwHs4cMU6rA52J0hOb7TUVzk55xrn+gDCit
         pBHBZ1Wf/7JTjmZg2YoutaNbGiW3sMU3ZFZJmkqf0cAEvd+M48e+yFRNFb4peRCEKZkL
         6bDQTiYReOlfy8yFyxTLa3nurAYO3OtR2qB97gClBXA3QQM4VtChoByQDFstS6wzWlE7
         2z8O7DYLFIuxSPoQ/MeKkX0AHfWC1GxlPkIRlokYJ8tUTpP80Q4ZjRpXxkKB8HEivvX4
         YM9FoK90rsqpEpTXTBKEUBQRtcY14XtyFIwQTyr67Gqoa8LVaNX+updy6B+Rg4rGDMFg
         xhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148774; x=1778753574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TsBqtt18Cwy3ovtqkmoggUEtnSub60FoPA8LRbU20A=;
        b=k9K/C0LJJLqaNegLLPqymSuBihnzMhzZZwwKLdnpcds7dCxL3ARyi9nAhz5J5ONukP
         sf+4RdRNjPvxe+OcpUS3Vgwwr4jFLbCQMlj0n/zk8lADfZ9tdeR0Y2lcL3YKSklJZvh8
         8Ojwj7uuEfknu1tBzUoCcImBW3lBhn1uDzgwc2cmis3PBxJwOyjQ7YqcITheQK+vCTPK
         O9tlwTf+6bZquLJIDjIiLiUCq9l6hDF67gNzgfUpBh4eLk2m5jedBZOLqGRWbQOFHR86
         bXdmih+L//3xBUMI8WIBmprz6hKoMKx5rBW/4DUtFVPpA9XDwYw4CJ0quPXfTMA9wXI1
         X1zA==
X-Gm-Message-State: AOJu0YyBY1IHofgwcAVLcMLCsYnAMdBtDvY1V0EcleYYTkDnpnoLQ/Up
	n0b1eWC9aFhiOiNjQrMNrQN0BcnwmErmXLeNkY8j7+O9jQ3EIq4AZaXS
X-Gm-Gg: AeBDievdgnFLZiCucN/CkodGDxLcSyhlWBcQONKrvu6kNZvfm7jL34QcQkJXsMMYM1v
	v1bvvKtqlfrExno44pzCC29L7LRsbHkweqtDftRqbzxUrHPAg/rAevHU43f8C8vhGDLlWfmUoZV
	S1dJYRC3NAuziUJi+8zx9BDH62Jcb9xdpLkt91emF+QE4uvgDj/uKafHseNIEIUuYGrdlBVdNbO
	ZkN/ZKh86WM9oMfqiDC27jbvOaLffSyL10gs9VsaSMRgy1Qs59jAviaf03VF/+w6m8Uk74KU41b
	0/3zVzYV7oqoXoPmIji41TJiqZV2ws+8xv2Om0n6Hj7kVfXW99lSB63GvTEjGztmPh8ZTVrz8Vc
	YHDcYuvJq6FPZrkXgjZb3dcGvO5LycCkBhDD8L/eCh2nPNr/ENVgYHLXCbKgpcFKA0EHotnBzIQ
	MUKbpNEn9BUsg1k7msLALdAzxw57lSO67o2WAMiPsQGgh8+JPhHudwIUADLeuSQOlu50zvKpusD
	oaXKumH3JtJfChhnYVH8F+Vw+bBpw==
X-Received: by 2002:a05:6a00:27a4:b0:838:a46:ce99 with SMTP id d2e1a72fcca58-83a5e457a1fmr6768497b3a.48.1778148774344;
        Thu, 07 May 2026 03:12:54 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm9797998b3a.40.2026.05.07.03.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:12:54 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH 0/3] hwmon: lm93: clean up coding style issues
Date: Thu,  7 May 2026 15:41:40 +0530
Message-ID: <20260507101143.559475-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series includes code style changes for lm93 driver to fix
several checkpatch.pl warnings. No functional changes are made. I tested
the changes by compiling the file.

Changes include:
- Add blank lines after variable declarations
- Change 'unsigned' to 'unsigned int'
- Remove else blocks after break or return statements

Ninad Naik (3):
  hwmon: lm93: Add missing blank lines after declarations
  hwmon: lm93: Change unsigned to unsigned int for clarity
  hwmon: lm93: Remove else blocks after break or return for consistency

 drivers/hwmon/lm93.c | 87 ++++++++++++++++++++++++++++----------------
 1 file changed, 56 insertions(+), 31 deletions(-)

-- 
2.54.0

