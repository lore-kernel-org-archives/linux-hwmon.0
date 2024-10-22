Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A64E145A1C;
	Tue, 22 Oct 2024 19:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729625048; cv=none; b=Gq595Gijnv7GYhIqzCydOzUwA8hfFx/lWdLXAQUt7WOrrii6MA0pbeJn4QlezVwuAXWox6wCzR//0vZ0kHTTWDaInB5wNd4yxFPZprB2KVQCFUAiDjogSttbmsFmSA+jSTU20hbTPwMX76OQBeQjlAN6MAoYpAVuqeZYho14Gwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729625048; c=relaxed/simple;
	bh=43RVGIAXouzdHpJgr70wMhFOw2DvnuJq/tbDJzsSUFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ou/bdbp2E67Gs5tI4sw9ZpsVYr46dHb9ujhXKG6QWoIgxXNXyU4zOt8FBknbnCJj5C+0Y2t6LT603OwvFAvmZx76ZCY0AAnfSWhwSz/pYMPCwyRwPLqUBU3VBMElsIWI3X9s+ZxvYZNh8FqWmNfc2S4S0cEzPfGAOTk4l3VzGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yn+vc+zF; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yn+vc+zF"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e61b3922f8so84196b6e.0;
        Tue, 22 Oct 2024 12:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729625046; x=1730229846; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DF2bPXZJUXMHjRvnPt6S+mLYDOSI3zfeDCASQg0Nejc=;
        b=Yn+vc+zFfpCIsX79uOCn+kIYt52F4DEgUNimc5GAM3pzBRc3slNQJPk4AdKMAgkcnB
         rQoG7J61dafPBtyI0pauT8FnyRIIizMFmu3t9DrasjryLlNoqzTo6cMHDWdMa0HOGW8J
         gOlwbRmW9D15UyzBFlOzZyJ+RfCh6bSGgabgNOGMwD4E/op2TUfDS69ov/5foiSGXiDB
         PoWNNoHn3EBOM0NZHIsW7BrNM8ujXa5kNc0cQ9hIat7wF4msYsk8TicuYhKmAFDcqdow
         uwLNWwYkmNKSGxC5HvAh0KF3Ns6OP5XoHGz/gXOWKHxmhbu/GEK37iVTYVsvc+7KPyLj
         Futg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729625046; x=1730229846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DF2bPXZJUXMHjRvnPt6S+mLYDOSI3zfeDCASQg0Nejc=;
        b=GGr21aBAhYbAvktmiaSQIRr8hDGaxYaQLrXQJQhUjjABpeoIZHfje5iHjw/miGu9GN
         p1XQGiMyvU3JIavv6jVVum9m0tLprH0JmCXgop/eGdNoLMMK6nrgGpnRjlXnQhQvlKWx
         eTJlJ72k5p/dg0K3YNcCdChJhOmBSs+GhRrkvRAv6mvRpgHKkOLuLTgc/Q1bznlcxtBQ
         GDXJfglEmXnx1hfajHKZZN2WiahSrNuYXNZ2qNMnunkFe3MssXaZfaShlhWmbhIzLQKE
         NfXilc4izok+5Jyg003x6W07f59V+/zCW4GDNDHvI9pKQ1UrqK1xKUA0Xs+iLo1j1FxP
         cIsQ==
X-Forwarded-Encrypted: i=1; AJvYcCULVvzpTkvwoQ4Krj8chQf4DcGuCSKH0L8bR8tWhPzQSq1V1ZZDYBk5Bk8Ufuiy2y1tNZHj89raaIDP@vger.kernel.org, AJvYcCUv3QUoCuv+9Tg9jX8QrmPhcC0pHhjDWhlYF+dtAgk9m2HQsSJaNAmpeiYOr79CSM39GGVKFx7PxxWR@vger.kernel.org, AJvYcCV06hVGV6PBFl6BIoT5GrsoaMFBEEtfX42Oufi3TIELsUr/wpEndq5a54z/Ah5lHUbwpSIDz4klSAMulU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrT2nOPpDncOOiLXyOv0jZhlAzHN+KxwtlK9kHgETF18bWy4X3
	PGAs7pon0q6lHYkRZVNnrQ32Ij1zDEXX8omvvnhk40bBbe5CkFle
X-Google-Smtp-Source: AGHT+IFNxkBqnQHU9G8MREEbOqtP0wAMoW6jz7BP3fh2N8xr6S4zoHrnI1yGrUxWLH0z9sEgBgoHEg==
X-Received: by 2002:a05:6808:1390:b0:3e2:a4a8:49fc with SMTP id 5614622812f47-3e6245b71b5mr89220b6e.15.1729625046252;
        Tue, 22 Oct 2024 12:24:06 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e61034f027sm1431216b6e.46.2024.10.22.12.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:24:04 -0700 (PDT)
Date: Tue, 22 Oct 2024 14:24:01 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: linux@roeck-us.net, geert+renesas@glider.be, magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: hwmon: pmbus: add bindings for isl68137
Message-ID: <cover.1729622189.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Renesas digital multiphase voltage regulators are capable of regulating
output voltages that exceed the range that their Vsense pins can detect.
In such applications, users may place a voltage divider between Vout and
the Vsense pin for a given rail. However, the driver currently has no
way of knowing if a voltage divider is being used which results in
erroneous telemetry being reported through hwmon.

This patch set defines a devicetree bindings schema for Renesas digital
multiphase voltage regulators that are supported by the isl68137 driver
to allow users to add voltage divider definitions for any rail powered
by the device. This patch set also includes the required changes to the
isl68137 driver to enable scaling Vout/Pout telemetry for rails with a
defined voltage divider.

Grant Peltier (2):
  hwmon: (pmbus/isl68137) add support for voltage divider on Vout
  dt-bindings: hwmon: isl68137: add bindings to support voltage dividers

 .../hwmon/pmbus/renesas,isl68137.yaml         | 133 ++++++++++++
 drivers/hwmon/pmbus/isl68137.c                | 199 +++++++++++++++++-
 2 files changed, 327 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml

-- 
2.39.5

