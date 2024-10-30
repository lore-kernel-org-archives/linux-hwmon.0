Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED061BD9EB;
	Wed, 30 Oct 2024 22:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730328012; cv=none; b=ieQiarcVg1pqXTwLqAsr9qu+Z9XKMY/Zze0a3UKQxhM9Kiu5hVXZUhw1dGX4f4asrrkEuh7obOPPFHlYMCIHfP36cMlAkwIewArL4jU10jdnYT2GEcb2aOG4NWJsr8WnfuDgvepzqAiH3HO1tbi4TmajV+1XQ1hHr8ww0Bhohis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730328012; c=relaxed/simple;
	bh=A420gRaTViQzgKO2OfI9AJ8LuZSnVmCZD2bHs83zjfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A54EvAinsJNQ8QlAwKCaqNm3Z/CqzttZIYfZoCN2LfKFi7KT5ZRxKIixlfscMCFb1tLqrXw8O3VoELe7Qm4KtmBA/RXc1PW+CAMgLG5YT+frFFPkFEVCplxjz/2YlcbdTBS+VqPJwPwgGJ4CVvWuUhRupI43g1NZbtznDIICV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYTDW1yB; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYTDW1yB"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5e5a0519d00so192507eaf.3;
        Wed, 30 Oct 2024 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730328009; x=1730932809; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwNlaXTTxap0+PQNwVIFm7yWGMaMI6gTg23hYeKPXp4=;
        b=RYTDW1yBoHVOg6CBehxu5ygUHphbC6wSMxFoo8uhFdfpV19xL4uCOuKIhdfLWsgdQZ
         wYjtfOPBU78c+Yo+hXuRmm6WoHAIWWEnh0TrtdXRbe11w3iz6BQzYDRPCIP/YkErpifc
         Epyh0NKx+qglOUc/N2TlGzf1ej9hb+/khh4UHDY/7engL31bEHYPeF7nFijZYGosZM/3
         1H+S2bQu7gaWpKwYTXt0pSIRmTLKv4k20fetTxrcNPIhFfUrKCwOdAv6KodUxGORnjRj
         o5QZ+yeJ4+3uRJ954GbSt15v5nQlhgEYDAhgHnZuLr5qNRZfWF9C+VmwdAVtP3VPZz2G
         G98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730328009; x=1730932809;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwNlaXTTxap0+PQNwVIFm7yWGMaMI6gTg23hYeKPXp4=;
        b=PjfEcQmv1/LZ5o3Uv6ttE5l3Boj5VGiLo/l+cyBIqcxmGEKeRpHc+Hq9s9uh9NTBII
         x4UWPhEgJBgb8JcUIJG5vuloL/GOj5JhW4bhppV+2Jf8fJJ8qC1r5rw1rbUEHEJAZSoj
         DKInaLgkApI63pJX+deOKL8dxfwk5i3gcSm5yYNGhfLZba4O1yc9t9FhZABTWFVrUImq
         fClt8IWoJ1W1GCo7wS//VZEQ6o7+l7P6I2UI4wjmeDf9UzLnnW0Wvj1iRNphLyM9LbYd
         EEXTZSoIiOoCKgmMMtbHU3vAVkoTBs/orjouhdRZn6kHsqV6d/X09Lfgz5JEfveiKvC2
         qG1w==
X-Forwarded-Encrypted: i=1; AJvYcCVL1nZSA3CodEjR1SG7HpLWbDKYtQdX4g1SeMJvBfoMcdq5iJDjyIhBV8YvId1y5COqRpPqy6SNNG2t@vger.kernel.org, AJvYcCWPCqUVYWT1zhDgZtDPCaMUTuc5H5EAbQpShWF2pIQgOkKHfMjrkzqd+ga7zjwcFcBHsr0x9nBHuFOr@vger.kernel.org, AJvYcCXiVfJRkzGYqfCdWAW3F2q9osFMw6LlDYIjFt02kGD9NOjcuXeBTqqV4Uc9aYg4nTk2qFn+14UpVpB5ROE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH/6VsvE8dkZk2u9BXUNFs6nMQ3uwUG8NRshW+9JjhS9x5gAmj
	+XjRE7BeypjXjWlHqRiXqqmMdKWhlVxOtIUYUeOmTofOJ1b4BNerCDqmOeVf
X-Google-Smtp-Source: AGHT+IEPtcIwyy7gc7rFMZC+2zTp6bnJXPoPItFXi5kwKS9SyyCAofukAi+3Y+Gt6oX8qTYESXcx5A==
X-Received: by 2002:a05:6820:2223:b0:5eb:88a5:20e8 with SMTP id 006d021491bc7-5ec238e63damr13017569eaf.1.1730328009163;
        Wed, 30 Oct 2024 15:40:09 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::3b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec70607719sm34608eaf.30.2024.10.30.15.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 15:40:07 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:40:04 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 0/2] dt-bindings: hwmon: pmbus: add bindings for isl68137
Message-ID: <cover.1730326915.git.grantpeltier93@gmail.com>
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

v6:
- Amend patch commit messages to explain why the vout-voltage-divider
  property was copied from the max20730 instead of using the iio
  voltage-divider property

v5:
- Fix clang compilation errors related to C23 syntax

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

 .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++++
 drivers/hwmon/pmbus/isl68137.c                | 209 +++++++++++++++++-
 2 files changed, 351 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml

-- 
2.39.5

