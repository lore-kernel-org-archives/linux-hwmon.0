Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E23321B1;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254560; cv=none; b=qND2yyEi/Px9PpqFLwqx7yh1HxkKtUBZdNRXx5jR+tkvqBnagW2HgItG1wJkupv4Ot2NHFRi/mhKXJ3UPndXs6GWqy6vamNdFWrZTyoUwSq0gP/y5NCsZTU+F0tBI2YZt+CrDN/h/RRt0Rrzs9YYNlSg51mWtKKOKP//TwBp9t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254560; c=relaxed/simple;
	bh=R1iqUtqOuhShL/Z71oQFUiw3Kxe9IhmPJ4+ezwSgN4I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sIjsrWJgAXfaEpWphS/tTPOMI8/xGF9/oAxSFoil0CbgW7mIVO0hnNePEfYAzCiQjyeDv/qPRAKnBzkudrdtdKHznykXnDkRsHf5pxo62P3VTlDkCdXllpGBopsAZDawj0oDdrU0sZHRtX/6TgjGRPk6MzoxOZ+NOQoz6UUKPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltFrYj8s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltFrYj8s"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F239C2BCC6;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785254560;
	bh=R1iqUtqOuhShL/Z71oQFUiw3Kxe9IhmPJ4+ezwSgN4I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ltFrYj8smK0kMTO2qSLgsmGB6ndDa0hbMICyuDNmAItJ6URwL+qKBErkkobJraxh5
	 7XW7rs446EkOE3oWpt/nCvSwg9pqj99h13ZJHo/Bp/HH/5LscdHQlrrNvawOpNsmR0
	 acAF0Q6M2ZzterndLJkbWXuXSSAunzlL9ZuEqMW9myZPdyJkTGRJbQLnlZZeaM38Vb
	 EMFsg7TsgtgQe3JJcjQfOvoSpHUHtq2fBkz/Ej0A3ljPL9Omc/hAkhMSwA9p2MzvZh
	 ezcWnz0jGeuVpj2k+2Hj9CZb8FW2y8ybO+x75jIHmBWjl9p7roe1vsgkTQMhM2Ncz7
	 Nulk2OoKfFReA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6A3C531F9;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH 0/5] hwmon: (pmbus) Add support for MAX20826 and similar
 devices
Date: Tue, 28 Jul 2026 17:03:47 +0100
Message-Id: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQDDQNXqV0YdOxTsEkZNQK4
 t2N7fIt/t9AuQgrtM0GhRdRSbHCXhoIQxffjPKqBjLkzI08Dt8xRRy7lYwnhzrnnMqEwROzu1r
 rOUCNc+Fe1t/4/vhb5+eHw3TeYN8PERV35noAAAA=
X-Change-ID: 20260728-hwmon-max20826-support-c82ee65118ec
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, 
 Alan Tull <atull@opensource.altera.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785254629; l=2138;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=R1iqUtqOuhShL/Z71oQFUiw3Kxe9IhmPJ4+ezwSgN4I=;
 b=b9HV+Hqjh563A6qYvO9D3ge9OpibJJYjVWyF3ncH08ZgXg0IFycHU/q/kwsK5fdYC5wDhvxyW
 TIozHxBZjW9D3hp2p2LafB0I3e/Y6/SF1/qVShwpKZFmgv1WThs5AsS
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

Add support for Analog Devices MAX20826, MAX20855B, MAX20908,
MAX20912 and MAX20916 dual-output multiphase PMBus voltage regulator
controllers.

This follows up on the earlier MAX20912/MAX20916 submission and the
review discussion around it [1]. Compared to that minimal driver, this
series covers the full MAX20826 family and implements the device-specific
pieces discussed there: optional EN GPIO handling, non-standard phase
reporting, direct address mode, and regulator support.

The first patches prepare/fix PMBus core support needed by the driver:
fix regulator enable/disable return handling, allow up to 16 phases, and
add a device-specific block-read hook. The remaining patches add the DT
binding and the MAX20826-family driver/documentation.

Guenter,

We are still checking the possibility of getting you docs for at least
one of the parts supported byu this series.

[1]: https://lore.kernel.org/linux-hwmon/20260707122701.751878-3-fredchen.openbmc@gmail.com/

---
Nuno Sá (5):
      hwmon: (pmbus/core) fix regulator enable/disable
      hwmon: (pmbus/core) increase number of phases and add new mask
      hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data()
      dt-bindings: hwmon/pmbus: Document MAX20826 and similar devices
      hwmon: (pmbus) add support for MAX20826 and similar devices

 .../bindings/hwmon/pmbus/adi,max20826.yaml         |   56 ++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/max20826.rst                   |  124 +++
 MAINTAINERS                                        |    9 +
 drivers/hwmon/pmbus/Kconfig                        |   19 +
 drivers/hwmon/pmbus/Makefile                       |    1 +
 drivers/hwmon/pmbus/max20826.c                     | 1037 ++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |    6 +-
 drivers/hwmon/pmbus/pmbus_core.c                   |   39 +-
 9 files changed, 1286 insertions(+), 6 deletions(-)
---
base-commit: 92413f439d1ec5e55b73ede8d66a7b971cbd1ced
change-id: 20260728-hwmon-max20826-support-c82ee65118ec
--

Thanks!
- Nuno Sá


