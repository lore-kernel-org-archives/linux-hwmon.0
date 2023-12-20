Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EACF48CCF
	for <linux-hwmon@vger.kernel.org>; Wed, 20 Dec 2023 23:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="G4yaldpv"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7811c58ee93so9524385a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Dec 2023 15:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703115868; x=1703720668; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujwXnb/57SrShdbFiFg1ZNindUc/Du0wOxKx0/yrEAo=;
        b=G4yaldpv7JATsIFkuWh8NtNsFj/l31VoO0tfWqL6FJB54bFBQu/TLs/ndTVElcwnVg
         XoVenSjzLendHWIhVUEt7KJVyIBVdKO8fCgEYqlaRe7e0sS6rVL6unhhSLqpTkhNYbVM
         qt00Rws23MWUjQEyP013cijuWP9q1pVU1R8Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703115868; x=1703720668;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujwXnb/57SrShdbFiFg1ZNindUc/Du0wOxKx0/yrEAo=;
        b=GiTTKaH+ADwXSGjNcrRQh0lxCEXzUGBJddxwAtUjh8JSzAwMKhMxbgE4s3rJuDUHLX
         uddak7jeTYm1rdB3H9r2MV98SIt9Yfzoj6EQHN9DzUwThNTAU7UQNagSRs+ArRyn4twS
         haYyG3X9qXzLNsI7RU5OWNndfyHh7UxfsSqVOZbe6FbC/dmeGT7v0eGD/oai+tPStACR
         ocKULTuu4QjYW/NsIRoof7oeswRBs7T+vjtEiKLLLii0pupvqfbxPS9QYYmVh3PhwL8O
         RJmevZBUI4gGdYNIboW904bWZcvRyMhw2uU6EHYUsFS/XDavbnkjMxfCxSUidnqKORPZ
         mu9Q==
X-Gm-Message-State: AOJu0YxWI2v7u1J9jHW+fCEa1miwkER1zH+fij/lLI88DQzOgrqhBZ+k
	7b4TV76XICfXIJCEraOEJvVymw==
X-Google-Smtp-Source: AGHT+IEwsd//PAEBVv5GwsrPY7oyDghqDlu+Q6mS9iIdom5t8bH14OgzkaVJ4k9xOq01CZZ+HZwa+w==
X-Received: by 2002:a05:620a:27c9:b0:77f:38f3:3d4a with SMTP id i9-20020a05620a27c900b0077f38f33d4amr22092324qkp.25.1703115868166;
        Wed, 20 Dec 2023 15:44:28 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id qj6-20020a05620a880600b0077f1645282csm276742qkn.22.2023.12.20.15.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:44:26 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] Surface fan monitoring driver
Date: Wed, 20 Dec 2023 18:44:13 -0500
Message-Id: <20231220234415.5219-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Currently, there is no way to obtain the fan's current speed on Microsoft
Surface Series devices, this patch series adds a new module that provides
read-only access to the fan's current speed through the hwmon system.

This new module relies on the Surface System Aggregator Module which is the
system responsible for communication with the EC on these devices. The
first commit adds an entry into the SSAM registry for the fan's speed
functionality (for the Surface Pro 9), the second commit adds the new
module and documentation. Both patches can be applied independently of each
other. Tested on a Microsoft Surface Pro 9.

A full development log can be found on [1]. Fan control is always handled
by the EC and cannot be influenced directly. It was identified during the
development of this module that there are fan profiles between which can be
switched. I'm currently developing improvements to the Surface platform
profile module in [2] that will be submitted in the future.


[1]: https://github.com/linux-surface/kernel/pull/144
[2]: https://github.com/linux-surface/kernel/pull/145

Ivor Wanders (2):
  hwmon: add fan speed monitoring driver for Surface devices
  platform/surface: aggregator_registry: add entry for fan speed

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/surface_fan.rst           |  27 ++++
 MAINTAINERS                                   |   8 ++
 drivers/hwmon/Kconfig                         |  13 ++
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/surface_fan.c                   | 125 ++++++++++++++++++
 .../surface/surface_aggregator_registry.c     |   7 +
 7 files changed, 182 insertions(+)
 create mode 100644 Documentation/hwmon/surface_fan.rst
 create mode 100644 drivers/hwmon/surface_fan.c

-- 
2.17.1

