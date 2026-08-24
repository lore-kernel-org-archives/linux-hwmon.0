Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB3038332A
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596748; cv=none; b=YelDIKmkaunn0ZsV3HsP6vWk5RYn8oOLRfEAku5PbXdJ9OIKFdY0Hsj7oBIDBK2y6jptqaCgIGbtuHgXBccxlAbGG1We13N/FlxCFkOh4oAZk6t9PyJH3Era/RetlxiyUl3MsNFwJ+apR+yE+EYr5q/pDkhkrZaZIHRq1VBbjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596748; c=relaxed/simple;
	bh=UcyJEQg7H2gnviO8EH9JS5mN+ToiD8s+ifVtmSch4qY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZcT4JEgDlbSO/GiBNFjErHHeUd1RKS2FncOJoCfS2DX88sVhdI/GIusdS6V3qBBx4GNACQgcE0cLEHwBLVUW0alf2r8XK9Gw2YoFhT98+1J+ed/2f1U9bwDSx4uroK2wMaSdYcoLQXkhKs6veVAezei1roYqh93CNWfUMjP8r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlfIu31t; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlfIu31t"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso448114966b.2
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 11:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787596745; x=1788201545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HoRsXIEXKhVImHPPPTxpEdfN4hjRFo5aCqfJBTRCVE=;
        b=XlfIu31tPD0clP4x57yU5sm6th9o1NaZ2fdp/ZIfKZSb7IrCoYOj0aKvkQ5D4f1C/S
         IS0WWSzF8ut0M7LXk25nPSXHcxgXSwLfCpChGHtiiefRY8uI9SSmbBYKTGwU5SZhDWey
         KNh/8hHnoh4RMj4wNF9KyvCfYmGVWbxnZB4gtkauP1Zzj/G/bfUt7TMgPHHRRXK7U9M3
         J0CaCrY+AiZJKFcM4AQhQ7ANoGI8bMIsGlUEN37nwy7JujUfbT9LI7v25pEuKRxBUta8
         elnSHrJPrZGvgYKGe6G7r5uyzRkMl20eDIfOSD4mGtDf7qSvPnAFZaZFDBWMLkwduBiF
         NtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787596745; x=1788201545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HoRsXIEXKhVImHPPPTxpEdfN4hjRFo5aCqfJBTRCVE=;
        b=BaXtPjVOBr442Z+IbLEcp7fe2RfjCnEjmlAQjQWm6uked9exlSSe2gNP0dlxwcpOVS
         hdfTNTkXdLZaUD+m3HUMAOd78LIFPC9zdMmc5pxwZxRcfaKWoMUw0pZRXkA3i7AM/pUJ
         UTZZXm9J/fLxT2Xq+CAA6OjISX08jpHk0W/ssteBosFb3oFB+w4qO1fBWqWcim0VIIIB
         dBUgPd2nshed/VMhMEC77OuhII346qHxo7Kt4QfiaZ1jdr5Ag27ItmAu8gVWgYl/qEzt
         emcoKWIiW8FwxbKMQcoj40ZhrlHbAMjUaUpRCOlK1GmyRGM6s5slFFfvV48BKhChZ/+z
         q3WA==
X-Forwarded-Encrypted: i=1; AHgh+RqI284n62Z4PLp4Rpjvf2b+SJ8GODzHHLy3fhOAS7EwwMbGmrH7bu/Z8ENrKJ/eZEu9xXYVyfPICzbDaw==@vger.kernel.org
X-Gm-Message-State: AFuF++nH+7k8+mfq4s7pV/OTGLz6B7627Nc1CAonaIsZH78h8hBoRlLg
	xd5AxumP91wgxPlkCnDO21lzl+zw8vxbVPVRRvk8a0BynuKV9fUb/EBd
X-Gm-Gg: AR+sD11KvEiaI+ZIaSjKfqXz/B+pREm+Xv9ilgkZwtwEHdYIFReisUB02uKODC8WZZd
	BjkyjGfjeBk8uxwXgRqjJW8lW0zmTxUtgFbenGfBD35RaAMlfgrotoQfWyZLu1pUvMeOnsYzlHw
	TSlk0z+qFrqPswlaNC7CHDH6hSPKIlZm4u7pRcaTWnJ7YgjM/2Uz8Es59vy73ZdcM/LydH+YNfF
	1aFJkL/hOHeapUd4N2Eh4gQ/xQJPGpIf4YznXyviYf6qTMmqabZ7sAhnj7tG+D0RXk59jccJCuD
	he1U3YsQyjHcixlAfR3BsPLeiulS9IMX2F2xwdsoFeS6G+sObr5BqSU4OjkEuhOWF7BBSLgbuNQ
	cyxqyHy03qddxNOTydA8k4VPCOX4KRsaz6vHqX/S84+nC8vuUpbsSNembgoUtGSJA4BeieIkVnA
	7Q/dYgppYAjX4TRjKOg1YG427cGNrDahpInWOMLZ7ZJWk/hZFFXdtQcnyvKcJZo4nSixb9X7p/9
	vzZnfMQ875SK6wTW1psBOVkFILMk9TtrGSgVLWXSrJ1bg==
X-Received: by 2002:a17:907:3e2a:b0:c21:7feb:4574 with SMTP id a640c23a62f3a-c246a2cece6mr2862354366b.1.1787596744812;
        Mon, 24 Aug 2026 11:39:04 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([2a02:2f08:440b:2900:8e59:1937:8c58:aeb6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249673d43bsm1307499266b.47.2026.08.24.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:39:04 -0700 (PDT)
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
Subject: [PATCH 0/2] hwmon: lm90: Fix DT channel constraints and reject unsupported channel 2
Date: Mon, 24 Aug 2026 21:38:58 +0300
Message-ID: <20260824183900.8983-1-flaviu.nistor@gmail.com>
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

 .../bindings/hwmon/national,lm90.yaml         | 29 +++++++++++++++++--
 drivers/hwmon/lm90.c                          |  5 ++++
 2 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.34.1

