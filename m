Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CFA39C63D
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669931; cv=none; b=pzvxcfBb5uEsyzJsdrrK86jK0opyQzwVvt7s+xTypec1ptPXeyyri3yX8om5fEr49lZwJJVhGIEabocnZAwpWbfmnQ3l+ALYukTDXOkhSoc6Jt4IOGrIDqhl4c2VSk8JtCTpT+4TBET6hjA3+lz5dDLga5Sh34IB/EHMvMXhwoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669931; c=relaxed/simple;
	bh=n6FYSU5YmxHfeq9L0JOIO5Jxr1WLOHeof8/dRnRSpTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fRIYjaQR8Om6nkzpPdvlqJRudGyBmI7j0xg9LXfzHtpHm+l7L7N3rtJXxL4GTMy/gBjDH8q+71iFgUjOh8D7rjHWWMADUxMyK1RyKqeqZhdeNv5gy7o/mJB/jdsSML/kUZJ1XqmTG3BgA+Y0/WaOSZKLFiRxXCVh283vygFZ56o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w28ZI-0002G7-U9; Mon, 16 Mar 2026 15:05:16 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w28ZH-000a8N-2n;
	Mon, 16 Mar 2026 15:05:15 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w28ZH-00000005twy-35wm;
	Mon, 16 Mar 2026 15:05:15 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v5 4/7] gpio: gpiolib: fix allocation order in hierarchical IRQ domains
Date: Mon, 16 Mar 2026 15:05:09 +0100
Message-ID: <20260316140514.1406588-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316140514.1406588-1-o.rempel@pengutronix.de>
References: <20260316140514.1406588-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Allocate parent IRQs after setting the basic IRQ handler to avoid NULL
pointer dereferences and RCU stalls.

In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_info()
before parent allocation causes a NULL pointer dereference for
slow-bus (SPI/I2C) IRQ chips because the child proxies .irq_bus_lock
to a parent->chip that is not yet populated.

Conversely, moving the entire configuration after parent allocation
causes RCU stalls if a hardware interrupt is pending; the unconfigured
descriptor defaults to handle_bad_irq and fails to acknowledge the
interrupt.

Fix this by splitting the initialization: set the handler and data
before parent allocation to handle pending events, but defer setting
the chip and hardware IRQ info until the parent is fully allocated.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Fixes: fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
changes v5:
- move this patch back to this series
- split irq_domain_set_info(). Set the handler and data before parent
  allocatio and set the chip and hardware IRQ info after parent
  allocation.
- previous version:
  https://lore.kernel.org/all/20260309134920.1918294-5-o.rempel@pengutronix.de/
---
 drivers/gpio/gpiolib.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9550500e1690..3ee1a403ccf8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1632,14 +1632,8 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	 * We set handle_bad_irq because the .set_type() should
 	 * always be invoked and set the right type of handler.
 	 */
-	irq_domain_set_info(d,
-			    irq,
-			    hwirq,
-			    gc->irq.chip,
-			    gc,
-			    girq->handler,
-			    NULL, NULL);
-	irq_set_probe(irq);
+	irq_set_handler(irq, girq->handler);
+	irq_set_handler_data(irq, gc);
 
 	/* This parent only handles asserted level IRQs */
 	ret = girq->populate_parent_alloc_arg(gc, &gpio_parent_fwspec,
@@ -1657,12 +1651,17 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	 */
 	if (irq_domain_is_msi(d->parent) && (ret == -EEXIST))
 		ret = 0;
-	if (ret)
+	if (ret) {
 		gpiochip_err(gc,
 			     "failed to allocate parent hwirq %d for hwirq %lu\n",
 			     parent_hwirq, hwirq);
+		return ret;
+	}
 
-	return ret;
+	irq_domain_set_hwirq_and_chip(d, irq, hwirq, gc->irq.chip, gc);
+	irq_set_probe(irq);
+
+	return 0;
 }
 
 static unsigned int gpiochip_child_offset_to_irq_noop(struct gpio_chip *gc,
-- 
2.47.3

