Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571284;
	b=t5o+N65YAFz/xNZDXc3TOJgzOhmmm9kAGBIagSwMmSppJSwr/H9ltHfvNixagjLZFlJ3
	 M3zjrdLi7TQ/7rSTOUg3FPwjTCHzbo6sSjHjuT1yCLJ5G4Vo4JzH0SRhSuU+dinSbvsU4
	 S6RGYS5wFT8Jb33Onjoeoe/dF48tQix235Peozvcsew9Tk71pSpG/gC0m2Nnx3hScCKgm
	 rVKUCDEgKaXFGlqPJVu43PN4EQKpx8LXuPr0nlPXkKdiY1VyI2tSv8v/v8Cec/U1SEgyU
	 KlBKTELhEX2jTu9PzqEgI3WwyW7hmtjEOBYhxysFCO/crkvUTOi1NstaYjAnmUnseTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571284;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=lrsjzjehIG+LsU8wpx0+lgcbIIx5YCUiOoTNxMaQY7I=;
	b=r2pIZf9/RXXMf5DY27jylPN5RM1aDsochEWdIU6bAzZ1RtwSoY/jT0Vt815642fvX9bc
	 4yfHtSMLRkLTFVGcEZGFpz7DXrM0cjMkjIYDxvwCc6s+aE7XGc2fI+oNvD2wiPSZKqC8o
	 JmNMhlsCXdCF1RVh5z7ug0Lm1jqKuo/zBHPgy6l2BBgqS56od19wJk95MdPIOwr/sDvOA
	 M/oFwDiDgnAfrp44rG/Rtr7q8Bc+1IllbDYXEx8ke1FS6RvIyAvdNi+37OM+bAc47NUGI
	 hKDy4rY0i5M3BM8hMnnw/SVpqIw9Cn0vJCW52p/VgBGq5I0rEBN4enRBt7nbVwGGx7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeCwmY0I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DBA606A324;
	Sun,  1 Nov 2026 22:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeCwmY0I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57EC1F000C1;
	Sun,  1 Nov 2026 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571284;
	bh=lrsjzjehIG+LsU8wpx0+lgcbIIx5YCUiOoTNxMaQY7I=;
	h=From:Subject:Date:To:Cc;
	b=QeCwmY0IHi5Vid6QnU9QJJOM8+a31UrK/+W6Wp1KtD0ViHY27N9BKLWTTZbh3ZPLk
	 rugC49LAhSYg1T1CbTXIAnXOk9EvEABHIueZrKzMs+3DGsIfmAFE7GV+/R+xARxXo/
	 qGsf4h++YnphpxRaARiFAnBOBE/sbYYju6OQrAunkDBOhkeTq0uV1IjAiILZLr1gxD
	 chuqiR71cR5en3Vf5k/16mkXwi6aCYmgMDLk57yiA2+1g/ZegUv1OkYTcTgJR0gb64
	 zF/lc5TfjoLOWSc3eRv2K3r+RW42br/WIJL7bxBOuUqNXhaOgrtILUAnWDAL07kLIK
	 GvWvc3jERlrzQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/7] BCMBCA PMB clock, reset and hardware monitoring
 support
Date: Sun, 01 Nov 2026 23:14:33 +0100
Message-Id: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NSw6CQBAFr2J6bZvp4RtX3sOwmE8DExVIDyEYw
 t0dSdy6rEpevQ0iS+AI19MGwkuIYRwS6PMJXG+GjjH4xKCVLklRhmtX1nlp0bqXdQZX8RMKR57
 Rc0W2Vk4XJoe0n4TbsB7te5O4D3Ee5X1cLfS1v2r+p7oQKvSmLTxVFRNltwfLwM/LKB00+75/A
 G/R+JvDAAAA
X-Change-ID: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
X-Mailer: b4 0.16.0

This is another of these big upfront design binding and driver hoards
that is the consequence of adding new SoC support.

My stake is to be able to boot and test a full featured Cortex-A7
system and the BCM6846 XG6846B is one such system on my desk.

It's been cooking for a while in various prototype forms.

IMPLEMENTATION:

The PMC contains various stuff so this needs to be a simple MFD node
so more things can be added into it later.

Inside the PMC is the PMB, the processor monitor bus. This bridges
to several individual peripherals which are very clearly distinct
devices on that bus.

Handle the PMB with an MFD driver with clock, reset and hwmon
providers.

The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
ports and copper WAN and has been tested on that series. The zone
power-up sequence also passed direct CFE flash boot in the Linux 6.18
OpenWrt port; this folded v7.3-rc1 revision still needs hardware testing.

MERGE STRATEGY:

Through an MFD immutable branch once everyone ACKs the subdrivers,
it will take time I guess. All patches except the last one (DTS file)
to be queued in MFD.

The patches were authored with the assistance of an LLM.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Use a shared PMB regmap in all child drivers, keeping keyhole semaphore
  handling and timeout recovery inside the MFD provider.
- Drop PCIe reset IDs and sequences pending proper power and lane
  configuration handling.
- Power up the XRDP, Runner and WAN zones before the XRDP reset pulse,
  preserving the sequence tested with direct CFE flash boot in OpenWrt.
- Describe clock, reset and PVTMON PMB child nodes with separate
  compatibles.
- Move the PMB transport and accessor header under MFD and register
  clock, reset and PVTMON MFD cells matched to their child DT nodes.
  Select reset variants through OF match data.
- Add PMB clock support and give PVTMON clock and reset resources.
- Add PVTMON hwmon support for temperature and all seven voltage inputs,
  retaining the zero-cell thermal sensor through the hwmon bridge.
- Add a separate BCM6846 clocks and monitoring DTS patch.
- Drop the unnecessary literal block marker from the PMC description.
- Use the BCM6846-specific "brcm,bcm6846-pmc" compatible.
- Expand PMC as "Power Management Controller" throughout.
- Move the LLM assistance disclosure from trailers to the cover letter.
- Drop the RFC prefix.
- Link to v1: https://patch.msgid.link/20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org

---
Linus Walleij (7):
      dt-bindings: mfd: Describe the BCM6846 PMC complex
      dt-bindings: soc: Describe the BCM6846 Processor Monitor Bus
      mfd: Add a shared BCMBCA PMC3 PMB transport
      reset: Add BCMBCA block resets through the PMB
      clk: bcm: Add BCMBCA PMB clocks
      hwmon: Add Broadcom PMB PVTMON monitoring
      ARM: dts: broadcom: Add BCM6846 PMB clocks and hardware monitoring

 .../bindings/clock/brcm,bcm6846-pmb-clock.yaml     |  39 +++
 .../bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml    |  42 +++
 .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  |  82 +++++
 .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     |  31 ++
 .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         |  80 +++++
 Documentation/hwmon/bcm_pmb_pvtmon.rst             |  53 +++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |  16 +
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |  47 +++
 drivers/clk/bcm/Kconfig                            |  11 +
 drivers/clk/bcm/Makefile                           |   1 +
 drivers/clk/bcm/clk-bcmbca-pmb.c                   | 389 +++++++++++++++++++++
 drivers/hwmon/Kconfig                              |  18 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/bcm_pmb_pvtmon.c                     | 232 ++++++++++++
 drivers/mfd/Kconfig                                |  11 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/bcmbca_pmc3_pmb.c                      | 297 ++++++++++++++++
 drivers/reset/Kconfig                              |  13 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-bcmbca-pmb.c                   | 309 ++++++++++++++++
 include/dt-bindings/clock/brcm,bcm6846-pmb.h       |  42 +++
 include/dt-bindings/reset/brcm,bcm6846-pmb.h       |  11 +
 include/linux/mfd/bcmbca-pmb.h                     |  11 +
 24 files changed, 1739 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4

Best regards,
--  
Linus Walleij <linusw@kernel.org>

