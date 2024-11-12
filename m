Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA84217472;
	Tue, 12 Nov 2024 20:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442069; cv=none; b=k2dOoVks1Rl5K+KzMEfyn2bvuBmtMMqXKn4MXgyUp8eq5rEMZf1i8HrNNo6iCtw4JzoGfI+dRdUe1YKkeb9pfmKx2QKYO+CPloaNHTZaD1+uwa2KBGSIlliuVxlJnHESzWon0Ul5YbDnaCkIv+bcG0qEAHpruaS2KbFmb3IefYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442069; c=relaxed/simple;
	bh=rSLmyqeNHuTdR9sMp7gy4kwBp7eWQTFOdqTGs/7XKRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kOQYIYPljgW/dtJcmtsGagzuGdofk8mBkUGSpXSycwvSTGkYE8mES4vvlunes6tkrXhlYKiSSb6wVH3QZL5SWNirk9Q3eJO8dy6J793l7cqK6atnXQjeTIrxJBz0m1urEALWj8pIlLa+SbilWgjHDa7V6cQ0a3zfWLcB19wergE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUPUz02Y; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUPUz02Y"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-71822fabf4fso3426995a34.2;
        Tue, 12 Nov 2024 12:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731442067; x=1732046867; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TqXKsycxkRwYLgMO1MGNkvOKvK0HlTP2D8dyd7IQy+s=;
        b=SUPUz02YfAaiZ+a2uXLdPalwhVqEl4eTnLpkGFQwEt9zHV+CBPL++yoHIlJcjFY016
         A3QMq6m9ay+j6fLVMXiG41/mQNG3I6a/wV6pSvSCa50Ue26Af70dW9SqAbDAJPaXvPB5
         HSEbC+YXehzyOHCs/VqJfPgeo9dmvu9YXl5eU4GNR/6Aku77Qwx8MZoAMa+tW37ckZ8D
         8rvy7c7R03ijh9jBbNEOaJOj5zr4TpMJgha5w53zBhYDao+qibfaaxiMWK/XNiJj4QAD
         LfyAqRuLDBRr9wZsdT/x6NpKTj7A0pdHPmWIA4Vjj+bkp6isinN2NI7c4jsIzLWH5OxQ
         QBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442067; x=1732046867;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqXKsycxkRwYLgMO1MGNkvOKvK0HlTP2D8dyd7IQy+s=;
        b=j0UYowbPC+/qDMEqvVhlWa9mUWRMVInMu3rRIv1BRDWvdpZCLqPNWRgEn6i7ZgYrYd
         EGnpz/XfG8qBgKTIJbs2YQpfbCWBmsAvW7DqHRpFOiaHGEh00+odNiU1wuw4lYcARVYo
         +5yHXxVFWOj6Sb+C9cgbVAhsGVsMMJ3Qu2pq3SPjkeiH72Y/f+p9Hdz4EsMRLtwiJUca
         NH3S8JHQa4OC31Ameo0Q+WXAnBJ223sYTsrSK8rydNKvtO8IHixImVlTQBrqzQLmwa5/
         QdGsAB/ZHLej3qydqFPK5ewihiDdlzotxpJYn5jWKYLDSJYfnLbA/nIuyGW+aT7l6j+E
         fc0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVH0gZO4rhDqkIJr5yDm5UMvOfDt1J1OryDTgIPWsAu/dp3XlwLPFjklZa5jV7a3ipU+9flXVYgCFRQ@vger.kernel.org, AJvYcCW438sfO81mCaxG+rRcrlVnvB0zAoKHX77n1fTYv/K3D/1fgFyotALrWSRIbcXrpn6SNhKqCrBZvkW2t2s=@vger.kernel.org, AJvYcCWBZ50bX5drHfFL9iu5UpSZF/qRUkGBRRUNXCTFU1YkOE6UUATt3VtdsDWbzzhuPUyrD7QgyhTC+Ybm@vger.kernel.org
X-Gm-Message-State: AOJu0YyCz0/3eS47ZvIftEe/PMm259cx5IBgkLNvvZYir+4Ob1p9ihqx
	O7tWwurwBgAttgwMFjNPO+0CvsOUdUoFOoToZLWxeVegmiooZ2/r
X-Google-Smtp-Source: AGHT+IGVOU35a+o8MM/vu1VdrdX4QPNA111CfAaQTQQWc5KsdScfPbulyFDV0vtpP2txz/UtR45DNQ==
X-Received: by 2002:a05:6830:2105:b0:710:ea11:3d34 with SMTP id 46e09a7af769-71a1c1e0cf1mr15784192a34.12.1731442067175;
        Tue, 12 Nov 2024 12:07:47 -0800 (PST)
Received: from raspberrypi ([2600:1700:90:4c80::3b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a5ffacc08sm45453a34.36.2024.11.12.12.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 12:07:46 -0800 (PST)
Date: Tue, 12 Nov 2024 14:07:44 -0600
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 0/2] dt-bindings: hwmon: pmbus: add bindings for isl68137
Message-ID: <cover.1731439797.git.grantpeltier93@gmail.com>
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

v7:
- Port existing device bindings from trivial-bindings.yaml
- Rename new bindings file to isil,isl68137.yaml to match pre-existing
  bindings
- Style fixes for issues reported by checkpatch --strict

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

 .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 148 ++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   6 -
 drivers/hwmon/pmbus/isl68137.c                | 210 +++++++++++++++++-
 3 files changed, 353 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml

-- 
2.39.5

