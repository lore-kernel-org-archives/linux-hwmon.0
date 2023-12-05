Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1502368E91;
	Tue,  5 Dec 2023 15:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nt37GRXp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DB45C433C8;
	Tue,  5 Dec 2023 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701789777;
	bh=zmMe6JBH09XXMGADR7GVSPNl3I74k767y2uX7Ridnpw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Nt37GRXp8T6Vou5oJUp+AZfyMY/yS99kJTn5PsE/YFgmZNkdb35wrAlyto3w9kTWj
	 dtADUn6/VKALGf9mQZm8UUhqyfuL+BrMzIXu8Q6RbkxzpGHqoxjT3I//z5HfmkNDOY
	 mQJUQVH2LZpHcxNvT6NZ6ms2usgtIXVSD9GfmD74ZJ6GptFt7peyhwy4Ix96bXMg0k
	 16XPH4AQI+JSfJWX3o2KbuvNC8n7TV0V/vcoCyqdL7E+sF9qD7n5PBxo8YcWvkTspJ
	 lkTQtD65xFJ7TptCrjojUJ+HXqSjfEgAfeFqLHe3Bc09LzIVhYrFmiFM5MN9mFn7Rn
	 UkI4+dt5Hxp0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D86DC4167B;
	Tue,  5 Dec 2023 15:22:57 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v3 0/2] Add support for LTC4282
Date: Tue, 05 Dec 2023 16:22:54 +0100
Message-Id: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE5Ab2UC/03MQQ6DIBBA0auYWXcMA6LoqvdouiB0VBIFA9o0M
 d69pKsu3+L/EzInzxmG6oTEb599DAXqVoGbbZgY/asYpJCKSDa47K6RRmI+ti2mHY2jttOsSAs
 DpdoSj/7zOz6exWOKK+5zYvv3IUGaeqFranVvOoUKwxFine3dBrvEqXZxhev6ArTQuAKfAAAA
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701789775; l=2306;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=zmMe6JBH09XXMGADR7GVSPNl3I74k767y2uX7Ridnpw=;
 b=y+rnkM3pXhxCNJfuqsOWQ7W778iLQ8AibszEbiqJrlzeuh9DYCA2OvLdY63+O4C1a8SrnRN2o
 XOUeKCuhWZoDLTqOagsansAxcS3ciSBeCS5V1KB0hwZ2z5kxWM4I0dn
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received:
 by B4 Relay for nuno.sa@analog.com/20231116 with auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: <nuno.sa@analog.com>

v1:
 * https://lore.kernel.org/linux-hwmon/20231110151905.1659873-1-nuno.sa@analog.com/

v2:
 * https://lore.kernel.org/linux-hwmon/20231124-ltc4282-support-v2-0-952bf926f83c@analog.com 

Changes in V3:
- Bindings:
   * Remove 'default' from string types;
   * Update gpios descriptions and removed leftovers from when they were
     integer types.
   * Dropped gpio function. With that, adi,gpio3-mode and adi,gpio-alert were
     dropped.
- Driver:
   * Make all clock ops static;
   * Dropped macro to create debugfs attributes;
   * Dropped GPIO support;
   * Removed regulator consumer header (leftover from v1).

There are still some possible interfaces which are dubious from an hwmon
point view. Namely:

* fet_short_fault
* fet_bad_fault
* power1_good

power1_good and fet_short can be "monitored" with gpio1 and 2
respectively so maybe we could remove the. OTHO, some users might want
the pins free for GPIO usage. fet_bad_fault is a status bit (we also have it in
fault_logs) that might be meaningful to monitor (I think).

Also to note, I'm still seeing the following sparse issue:

"CHECK   drivers/hwmon/ltc4282.c
drivers/hwmon/ltc4282.c:805:34: warning: dubious: x & !y
drivers/hwmon/ltc4282.c:895:34: warning: dubious: x & !y" 

However, this does not look to be directly related with the driver. It's
on FIED_PREP() taking values like !val or !!val.

I'm also removing the GPIO maintainers/reviewers from Cc since there's no
gpiochip support anymore. If not adequate, I'll Cc them again...

---
Nuno Sa (2):
      dt-bindings: hwmon: Add LTC4282 bindings
      hwmon: ltc4282: add support for the LTC4282 chip

 .../devicetree/bindings/hwmon/adi,ltc4282.yaml     |  142 ++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4282.rst                    |  108 ++
 MAINTAINERS                                        |    8 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4282.c                            | 1705 ++++++++++++++++++++
 7 files changed, 1976 insertions(+)
---
base-commit: 44482310b7f8ac4cd8fa7be4cee8c1b260ea5ee9
change-id: 20231124-ltc4282-support-8c1675e31508
--

Thanks!
- Nuno Sá

