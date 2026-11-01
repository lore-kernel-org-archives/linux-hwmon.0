Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571308;
	b=VdRhERvnzwEqCXy/vJxuJnzbBlJTh6Pf6vsqzbO+b6mBhGaiEAFfrrndKSjiemwyWeKh
	 0n4PiNJjz0bsEL1l8aCrC5CiWhBYMPHHrhjWUTuxijjrTKkE3Q3/jnI+/HIzsosqpS2Sh
	 dpEd9ew6weixuQiD7y7zjeDTK2Kv9xHGntXVNXcVxIgXKroGKzse9HRhAD8foqh29k4/6
	 PKVkdwQg9ypUg7t88j+OSjh1fToU12liGaVHbLZ5oDg2Bb96qrKvBEGBNbUSTT+yqDiZo
	 hoTBvjKQvXgvs46HWlWhu/O66HGt+pcPeR5z6VYAUrCdBvbRxTFVlVo3VKYwfkF2rXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571308;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=VNVGu/D/wrBBV+BXSddmoSZd6zPTYzJLygpxC2NiH2Q=;
	b=SrPoZZEYZ5tZiDGVrvf4gQbO1ozpeZPqMfnlv8uQ/kFpQ1cdFyIrfjgc1HkQH/lANmjo
	 Vzoa6GfPWrLnFHF/qq3S6BSaxcbUMkRkIg3hjk6I0zSTPPAu/2GhU2F+AMcuBkOlNTG9l
	 bIidE1VcKQQMyUJEhnLX6L9WJfncr1edHIuMY3vXlmrD4zYZmJ97evKi0TNHin4iq0fG8
	 HADGk5LB5iF0rFqLsJsQVWRadX8THy578YAxomxQ7AkwZjOoaeZMe3ErzISLl78l82Bs5
	 7pgsmNSZkDrEA+9pRM67uROq4MqqKkRT4P7OPuEoce6Bn1zX22RDcfufaE/i2y4JyyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVSUn8h8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99580606A329;
	Sun,  1 Nov 2026 22:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVSUn8h8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC7A1F00919;
	Sun,  1 Nov 2026 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571307;
	bh=VNVGu/D/wrBBV+BXSddmoSZd6zPTYzJLygpxC2NiH2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jVSUn8h8NnUbwE0QXk13vcqGrXzGqqfGglVanzwnR5J9XZN85YAgO/ySvKBFyIPaI
	 81AaAgw51JtgFA2hMKDhu4WBsbrG5mSga51WWZR248QU8wnR5+G6C506a/e0YdGrjU
	 UZBKIilyisG4fJFywI0KqiEg/XjOgj8A4AZ2kyy5zb17qXECKrifJiNaV+/HS4+xeo
	 HFQgyPy5B24EZSjj2NQIHd24mA/FmuVQGP49okVj3scR3FkhgML5r49SdWN4jfYDWV
	 zLzy6u+xcmPgnGpdFmg/JogXUgPS8pmSYxLoBs6CwukbsOEWZPQVWMBMJ6dNwjx/m4
	 VdZ6oBPjv/ngA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 01 Nov 2026 23:14:37 +0100
Subject: [PATCH v2 4/7] reset: Add BCMBCA block resets through the PMB
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261101-xg6846b-bcmbca-xrdp-reset-v2-4-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
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

Support BCM6846 XRDP and PVTMON resets through the Processor Monitor
Bus (PMB) of the third generation Power Management Controller (PMC3).

The sequence is hardware-tested in the XG6846B OpenWrt port.

Power-cycle resets for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL were
considered but left out. These belong in power-domain and platform
power-management abstractions, which can coordinate affected users.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 MAINTAINERS                      |   1 +
 drivers/reset/Kconfig            |  13 ++
 drivers/reset/Makefile           |   1 +
 drivers/reset/reset-bcmbca-pmb.c | 309 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 324 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 18e32cc036b5..29ec1c9d617e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5452,6 +5452,7 @@ F:	Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
 F:	Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
 F:	Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
 F:	drivers/mfd/bcmbca_pmc3_pmb.c
+F:	drivers/reset/reset-bcmbca-pmb.c
 F:	include/dt-bindings/clock/brcm,bcm6846-pmb.h
 F:	include/dt-bindings/reset/brcm,bcm6846-pmb.h
 F:	include/linux/mfd/bcmbca-pmb.h
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..56f7aee6cf1f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -49,6 +49,19 @@ config RESET_BCM6345
 	help
 	  This enables the reset controller driver for BCM6345 SoCs.
 
+config RESET_BCMBCA_PMB
+	tristate "Broadcom BCMBCA PMB reset controller"
+	depends on ARCH_BCMBCA || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	depends on MFD_BCMBCA_PMB
+	select REGMAP
+	default MFD_BCMBCA_PMB
+	help
+	  Reset BCMBCA blocks through the Processor Monitor Bus (PMB) of
+	  the third generation Power Management Controller (PMC3).
+
+	  The module will be called reset-bcmbca-pmb.
+
 config RESET_BERLIN
 	tristate "Berlin Reset Driver"
 	depends on ARCH_BERLIN || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3..26c8a73f774f 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_RESET_ASPEED) += reset-aspeed.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
 obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
+obj-$(CONFIG_RESET_BCMBCA_PMB) += reset-bcmbca-pmb.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
diff --git a/drivers/reset/reset-bcmbca-pmb.c b/drivers/reset/reset-bcmbca-pmb.c
new file mode 100644
index 000000000000..532398032fa8
--- /dev/null
+++ b/drivers/reset/reset-bcmbca-pmb.c
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * BCMBCA block resets through the Processor Monitor Bus (PMB) of the
+ * third generation Power Management Controller (PMC3).
+ */
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/mfd/bcmbca-pmb.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/brcm,bcm6846-pmb.h>
+
+/* BCM6846 BPCM zone control, in PMB words (6846/BPCM.h). */
+#define BCM6846_ZONE_CONTROL(zone)	(32 + (zone) * 8)
+#define BCM6846_ZONE_DPG_EN		BIT(8)
+#define BCM6846_ZONE_POWER_DOWN		BIT(9)
+#define BCM6846_ZONE_POWER_UP		BIT(10)
+#define BCM6846_ZONE_MEM_POWER		BIT(11)
+#define BCM6846_ZONE_RESET		BIT(12)
+#define BCM6846_ZONE_POWER_ON		BIT(26)
+
+struct bcmbca_pmb_reset_block {
+	u8 bus;
+	u8 device;
+	u16 offset; /* PMB word offset of the reset register. */
+	u32 mask;
+	u32 assert_value;
+	u32 deassert_value;
+};
+
+struct bcmbca_pmb_reset;
+
+struct bcmbca_pmb_reset_group {
+	const char *name;
+	int (*reset)(struct bcmbca_pmb_reset *rst,
+		     const struct bcmbca_pmb_reset_group *group);
+	const struct bcmbca_pmb_reset_block *blocks;
+	unsigned int num_blocks;
+	/* Minimum reset assertion hold time in microseconds. */
+	unsigned int assert_hold_us;
+};
+
+struct bcmbca_pmb_reset_variant {
+	const struct bcmbca_pmb_reset_group *groups;
+	unsigned int num_groups;
+};
+
+struct bcmbca_pmb_reset {
+	struct reset_controller_dev rcdev;
+	const struct bcmbca_pmb_reset_variant *variant;
+	struct regmap *regmap;
+	/* Serialize complete reset pulses and failure cleanup. */
+	struct mutex lock;
+};
+
+static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
+				     const struct bcmbca_pmb_reset_group *group);
+
+static int bcm6846_xrdp_reset(struct bcmbca_pmb_reset *rst,
+			      const struct bcmbca_pmb_reset_group *group);
+
+static const struct bcmbca_pmb_reset_block bcm6846_xrdp_resets[] = {
+	{
+		.bus = 1,
+		.device = 12,
+		.offset = 5,
+		.mask = GENMASK(27, 0),
+		/* Keep bits 0–2 deasserted, matching the vendor sequence. */
+		.assert_value = GENMASK(2, 0),
+		.deassert_value = GENMASK(27, 0),
+	},
+	{
+		.bus = 1,
+		.device = 14,
+		.offset = 5,
+		.mask = GENMASK(27, 0),
+		.deassert_value = GENMASK(27, 0),
+	},
+	{
+		.bus = 1,
+		.device = 15,
+		.offset = 5,
+		.mask = GENMASK(27, 0),
+		.deassert_value = GENMASK(27, 0),
+	},
+	{
+		.bus = 1,
+		.device = 16,
+		.offset = 5,
+		.mask = GENMASK(27, 0),
+		.deassert_value = GENMASK(27, 0),
+	},
+};
+
+/* Analog acquisition reset, independent of clock and power configuration. */
+static const struct bcmbca_pmb_reset_block bcm6846_pvtmon_reset = {
+	.bus = 1,
+	.device = 6,
+	.offset = 17,
+	.mask = BIT(0),
+	.deassert_value = BIT(0),
+};
+
+static const struct bcmbca_pmb_reset_group bcm6846_pmb_reset_groups[] = {
+	[BCM6846_RESET_XRDP] = {
+		.name = "XRDP",
+		.reset = bcm6846_xrdp_reset,
+		.blocks = bcm6846_xrdp_resets,
+		.num_blocks = ARRAY_SIZE(bcm6846_xrdp_resets),
+		.assert_hold_us = 10,
+	},
+	[BCM6846_RESET_PVTMON] = {
+		.name = "PVTMON",
+		.reset = bcmbca_pmb_reset_sequence,
+		.blocks = &bcm6846_pvtmon_reset,
+		.num_blocks = 1,
+		.assert_hold_us = 1000,
+	},
+};
+
+static const struct bcmbca_pmb_reset_variant bcm6846_pmb_variant = {
+	.groups = bcm6846_pmb_reset_groups,
+	.num_groups = ARRAY_SIZE(bcm6846_pmb_reset_groups),
+};
+
+/* Best effort: never restart a partially reset group. */
+static void bcmbca_pmb_reset_cleanup(struct bcmbca_pmb_reset *rst,
+				     const struct bcmbca_pmb_reset_group *group)
+{
+	const struct bcmbca_pmb_reset_block *block;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < group->num_blocks; i++) {
+		block = &group->blocks[i];
+		ret = regmap_update_bits(rst->regmap,
+					 BCMBCA_PMB_REG(block->bus, block->device, block->offset),
+					 block->mask, block->assert_value);
+		if (ret)
+			dev_err(rst->rcdev.dev,
+				"failed to hold PMB bus %u device %u in reset: %d\n",
+				block->bus, block->device, ret);
+	}
+}
+
+static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
+				     const struct bcmbca_pmb_reset_group *group)
+{
+	const struct bcmbca_pmb_reset_block *block;
+	enum {
+		PASS_ASSERT,
+		PASS_DEASSERT,
+	} pass;
+	unsigned int i;
+	int ret;
+
+	if (!group->num_blocks)
+		return -EINVAL;
+
+	/* Assert every block before releasing any of them. */
+	for (pass = PASS_ASSERT; pass <= PASS_DEASSERT; pass++) {
+		for (i = 0; i < group->num_blocks; i++) {
+			block = &group->blocks[i];
+			ret = regmap_update_bits(rst->regmap,
+						 BCMBCA_PMB_REG(block->bus, block->device,
+								block->offset), block->mask,
+						 pass == PASS_DEASSERT ? block->deassert_value :
+						 block->assert_value);
+			if (ret)
+				goto cleanup;
+		}
+		if (pass == PASS_ASSERT && group->assert_hold_us)
+			usleep_range(group->assert_hold_us, group->assert_hold_us * 2);
+	}
+cleanup:
+	if (ret) {
+		dev_err(rst->rcdev.dev, "%s %s failed at PMB bus %u device %u: %d\n",
+			group->name, pass == PASS_DEASSERT ? "deassert" : "assert",
+			block->bus, block->device, ret);
+		bcmbca_pmb_reset_cleanup(rst, group);
+	}
+	return ret;
+}
+
+/* The boot loader may power down the Runners before entering Linux. */
+static int bcm6846_power_on_zone(struct bcmbca_pmb_reset *rst, u8 device, u8 zone)
+{
+	unsigned int reg = BCMBCA_PMB_REG(1, device, BCM6846_ZONE_CONTROL(zone));
+	u32 value, mask;
+	int ret;
+
+	ret = regmap_read(rst->regmap, reg, &value);
+	if (ret)
+		return ret;
+	if ((value & BCM6846_ZONE_POWER_ON) && !(value & BCM6846_ZONE_POWER_DOWN))
+		return 0;
+
+	/* Match PowerOnZone() in the BCM6846 vendor PMC driver. */
+	mask = BCM6846_ZONE_POWER_DOWN | BCM6846_ZONE_DPG_EN |
+	       BCM6846_ZONE_POWER_UP | BCM6846_ZONE_MEM_POWER | BCM6846_ZONE_RESET;
+	ret = regmap_write_bits(rst->regmap, reg, mask, mask & ~BCM6846_ZONE_POWER_DOWN);
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout(rst->regmap, reg, value,
+					value & BCM6846_ZONE_POWER_ON, 10, 10000);
+}
+
+static int bcm6846_xrdp_reset(struct bcmbca_pmb_reset *rst,
+			      const struct bcmbca_pmb_reset_group *group)
+{
+	/* BCM6846 pmc_addr.h: XRDP, three Runners, then WAN (no WAN reset). */
+	static const struct {
+		u8 device;
+		u8 zones;
+	} power[] = {
+		{ 12, 3 }, { 14, 1 }, { 15, 1 }, { 16, 1 }, { 11, 3 },
+	};
+	unsigned int i, zone;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(power); i++) {
+		for (zone = 0; zone < power[i].zones; zone++) {
+			ret = bcm6846_power_on_zone(rst, power[i].device, zone);
+			if (ret) {
+				dev_err(rst->rcdev.dev,
+					"XRDP power-up failed at PMB bus 1 device %u zone %u: %d\n",
+					power[i].device, zone, ret);
+				bcmbca_pmb_reset_cleanup(rst, group);
+				return ret;
+			}
+		}
+	}
+
+	return bcmbca_pmb_reset_sequence(rst, group);
+}
+
+static int bcmbca_pmb_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct bcmbca_pmb_reset *rst = container_of(rcdev, struct bcmbca_pmb_reset, rcdev);
+	const struct bcmbca_pmb_reset_group *group;
+	int ret;
+
+	if (id >= rst->variant->num_groups)
+		return -EINVAL;
+	group = &rst->variant->groups[id];
+	if (!group->reset)
+		return -EINVAL;
+
+	mutex_lock(&rst->lock);
+	ret = group->reset(rst, group);
+	mutex_unlock(&rst->lock);
+	return ret;
+}
+
+static const struct reset_control_ops bcmbca_pmb_reset_ops = {
+	.reset = bcmbca_pmb_reset,
+};
+
+static int bcmbca_pmb_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap = dev_get_regmap(dev->parent, NULL);
+	struct bcmbca_pmb_reset *rst;
+
+	if (!regmap)
+		return -ENODEV;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+	rst->variant = device_get_match_data(dev);
+	if (!rst->variant)
+		return -ENODEV;
+	rst->regmap = regmap;
+	mutex_init(&rst->lock);
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.dev = dev;
+	rst->rcdev.ops = &bcmbca_pmb_reset_ops;
+	rst->rcdev.of_node = dev->of_node;
+	rst->rcdev.of_reset_n_cells = 1;
+	rst->rcdev.nr_resets = rst->variant->num_groups;
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct of_device_id bcmbca_pmb_reset_of_match[] = {
+	{ .compatible = "brcm,bcm6846-pmb-reset", .data = &bcm6846_pmb_variant },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bcmbca_pmb_reset_of_match);
+
+static struct platform_driver bcmbca_pmb_reset_driver = {
+	.probe = bcmbca_pmb_reset_probe,
+	.driver = {
+		.name = "brcm-pmb-reset",
+		.of_match_table = bcmbca_pmb_reset_of_match,
+	},
+};
+module_platform_driver(bcmbca_pmb_reset_driver);
+
+MODULE_DESCRIPTION("Broadcom BCMBCA PMB reset controller");
+MODULE_LICENSE("GPL");

-- 
2.56.0

