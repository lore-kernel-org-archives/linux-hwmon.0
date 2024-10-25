Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0CCFC0E;
	Fri, 25 Oct 2024 00:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729816724; cv=none; b=VfF4x50bUddBjk46sqqlOBOt/UmC1nDSY7ofcDmXDvCSwZppb/yO2DJjRJuGabj1UKQQY8YVKhJp7aw5PWppPgIeLGSTOyafbbHE1p9bpHG9yen7bwYAClQzPBasDaX79l186tvVTbJdQGqcfVG0XPpQexWu7BYu+giZ3wC6LEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729816724; c=relaxed/simple;
	bh=Z+GlSaKGUcGFkk+9JQT75VCXJBPwwDugVMzGFa29DDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n4UyWELZ1k8U0izKAt9A1URxDkkCNNrS2+ofLYHeaopzLU8/61rivLeLs4zipVyPBc86CZgDofda+0/qJZrIP39Dg1NWzGMIjR7GkutFGaax4Oj6NHj5MncbKia52JHGcVPmYcm+DhWE6UdKuhT/tSosciqIoIcEaP8H+18Iq/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cydp3JRM; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cydp3JRM"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e602994635so1063671b6e.0;
        Thu, 24 Oct 2024 17:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729816721; x=1730421521; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6BlrmuLAXWYvwAmVHQ53OJ6Dh1T9KAqkcBtL/LePC0=;
        b=Cydp3JRMe9UsL8N7XZXzN2sWn6DXj0G+hSktpORNp+tub/MZTUKMd1AAaMQZ6QokKF
         nyGbkrWrPkUMY1M3avlS9H3AvXgY4GD8S5iAsibBZq3Hnuc0mucgGgfhyUJML7MhBDyo
         J5uVRO/qmJ0wwp2zc5kbNxTCG9boUr5nu0FRGZvmqqgMtk4HupUfkmw6lMcpuzki9mjp
         yA7Q5MToTkrP8aXJcZtN39pCxjDe9JMQ1yVOnZrs+IhEwuE2J7/qxlUNdOgBcYRLBH/I
         ZIucW8BGRc/8TH6vZfr1ZGA7xdAzY4MXjBmJfoKdk4pEkot/p/Du+G5EQHB11QMNmHDS
         +UOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729816721; x=1730421521;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6BlrmuLAXWYvwAmVHQ53OJ6Dh1T9KAqkcBtL/LePC0=;
        b=heN95W5nk+NrW22unnZ29mhKRkPbBh8KyUIiFV1RB4ktfEiRKlXGxE/1HTkDbccMzg
         QRZHKeKCbyBLHck4xl7Di+jPc7OcDiNxkDseUFDd7IOjIddRwQcD1Kye2x3+TvCFH5s4
         EHk1ii5gEQjcmc875fKMBYYSf68uON4fI2XyKDP/EoWpS2r5fX662G37PQf477WJ15lS
         dQ6rBuENpxxicCBuKgUYFoVC2IGDc9H+rsbTu1BHJ/nBFnXmwN0oGWUh0BTEvdxVXddV
         c6ZCdyj7g34IF2xPaSoqys5kbxihqcS7EDA2LayQS1M4X69f8dNNVZBxi3GRHNkeEgEs
         tAzA==
X-Forwarded-Encrypted: i=1; AJvYcCWb3ltSdDK/KR03olPWdworiZ4r1yFMw0K3pwyj/xcUT6/tUtapQLCo/SMiy8Uhq+LIAR3eKfetTmcF@vger.kernel.org, AJvYcCXeBhqbzkyvsbZvf09q0IJsawuAXThu5z09G3rDofndEl+jCn521jLpMFCS/BAkeG+88Zs1owxzfekuB3s=@vger.kernel.org, AJvYcCXzbvQEr6iiopo5Si0sAtaQDOt9tqWSanH67zWheLQ6PJQbP5tEgS4L21v/Qoafa2K+mYG7H/pGXMTF@vger.kernel.org
X-Gm-Message-State: AOJu0YzOeMJZLqkweK5tKykKaXeRA9Wuhs9J1MeCJG4NDvD6yA4a19uX
	B5+LWB4kstS6KsxwjHUp7FqIIDopp+AOGs2TTwZrAiiaWfCbj2dJ
X-Google-Smtp-Source: AGHT+IFcU4zmgz3biJ/NgZxSBTi42IlGakpwNHfhpUH5jg5ibq9nRM1MCmGtLGhLYqN/FeQyEMajMQ==
X-Received: by 2002:a05:6808:338a:b0:3e6:2464:9b16 with SMTP id 5614622812f47-3e624649f82mr8059081b6e.34.1729816721329;
        Thu, 24 Oct 2024 17:38:41 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e63248d0e2sm33607b6e.15.2024.10.24.17.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:38:39 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:38:37 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 0/2] dt-bindings: hwmon: pmbus: add bindings for isl68137
Message-ID: <cover.1729812789.git.grantpeltier93@gmail.com>
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
erroneous telemetry being reported over hwmon.

This patch set defines a devicetree bindings schema for Renesas digital
multiphase voltage regulators that are supported by the isl68137 driver
to allow users to add voltage divider definitions for any rail powered
by the device. This patch set also includes the required changes to the
isl68137 driver to enable scaling Vout/Pout telemetry for rails with a
defined voltage divider.

v4:
- Revert devicetree property name to "vout-voltage-divider" and refactor
  property description and driver implementation to match existing
  vout-voltage-divider implementation in max20730 as no suitable generic
  voltage divider schema exists.
- Minor fixes based on Guenter's review of v2.
- Initialize voltage dividers for all channels to defaults that simplify
  logic in PMBus word read/write functions.

v3:
- Report and return errors reading the vout-voltage-divider property from
  the devicetree when the property is defined
- Change u64 division/rounding operations to use explicit math64 macros

v2:
- Fix devicetree bindings schema errors
- Add "renesas," vendor prefix to "vout-voltage-divider" property
- Rebase patch series on v6.12-rc1

Grant Peltier (2):
  hwmon: (pmbus/isl68137) add support for voltage divider on Vout
  dt-bindings: hwmon: isl68137: add bindings to support voltage dividers

 .../hwmon/pmbus/renesas,isl68137.yaml         | 147 +++++++++++++
 drivers/hwmon/pmbus/isl68137.c                | 207 +++++++++++++++++-
 2 files changed, 349 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml

-- 
2.39.5

