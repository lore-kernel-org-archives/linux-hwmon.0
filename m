Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B8E375AD2
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774075932; cv=none; b=fqTZb14gfdC71DyJ5XG5Y7MVirkiVXf7gTv+u5HSQiFTIcC5Y62g9w6D2x5nrtnB/zvRKDWLP5pRBUHEzmQh4xTgj9GGqeAagLabX+2HcjE+RkiIzgTP7Mq3QtQbFjHJCrYc+3yF/ilHd3PA5JRD+sne83beoMNs1Do2Mw6rkOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774075932; c=relaxed/simple;
	bh=xGds+6kNFpF57uqDr3pwzOK/6YLaVqnYfsmgWRGkBRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NstXzpilu5AkUl4v2SpD4yW+0VfZWGmGNCYzhYbb9ciG+Hold4yNlYN7vXO1V7aYIL4nMRcDq9H52R0hxBiNdzwmEz0rnVSGJFEyawXwMhTiWJ2jTFpp5N/qWH4H870TZMlDMvrlvve5DBMjX3CSMcrnXUJLEzBhnmoP5A9LGrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w3qBZ-0002Po-2y; Sat, 21 Mar 2026 07:51:49 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w3qBX-001MfQ-1S;
	Sat, 21 Mar 2026 07:51:47 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w3qBX-0000000GRVx-1Xso;
	Sat, 21 Mar 2026 07:51:47 +0100
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
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v6 4/7] gpio: gpiolib: split child IRQ setup in hierarchical alloc
Date: Sat, 21 Mar 2026 07:51:43 +0100
Message-ID: <20260321065146.3918882-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260321065146.3918882-1-o.rempel@pengutronix.de>
References: <20260321065146.3918882-1-o.rempel@pengutronix.de>
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

Setting full child IRQ info before parent allocation can crash slow-bus
GPIO IRQ chips that proxy irq callbacks such as .irq_bus_lock to the
parent IRQ chip. At that point the parent IRQ is not allocated yet, so
parent->chip is still unset.

Moving the entire child descriptor setup after parent allocation avoids
that NULL dereference, but opens another failure window: if the hardware
interrupt is already pending, the child descriptor is still using
handle_bad_irq and the interrupt may storm before the descriptor is
fully configured.

Fix this by splitting the child IRQ initialization:
- install the top-level IRQ handler before parent allocation
- install the child chip and hwirq mapping after parent allocation
  succeeds

In hierarchical IRQ domains, installing the flow handler before the
child chip is assigned is valid as long as an outer chip is already
present, which allows pending interrupts to avoid handle_bad_irq during
allocation.

This avoids the early slow-bus dereference while also preventing pending
interrupts from hitting handle_bad_irq during allocation.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Fixes: fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Link: https://lore.kernel.org/all/abPqGvy5FqJ0a0ug@tom-desktop

---
changes v6:
- reword commit message
- add Tested-by: Tommaso Merciai ...
- set irq_set_chip_data(irq, gc) instead of irq_set_handler_data(irq, gc)
changes v5:
- move this patch back to this series
- split irq_domain_set_info(). Set the handler and data before parent
  allocation and set the chip and hardware IRQ info after parent
  allocation.
- previous version:
  https://lore.kernel.org/all/20260309134920.1918294-5-o.rempel@pengutronix.de/
---
 drivers/gpio/gpiolib.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9550500e1690..b506a6c945f7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1629,17 +1629,12 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	gpiochip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
 
 	/*
-	 * We set handle_bad_irq because the .set_type() should
-	 * always be invoked and set the right type of handler.
+	 * Install the top-level flow handler early so a pending interrupt does
+	 * not hit handle_bad_irq while the parent IRQ is being allocated. Defer
+	 * child chip and hwirq assignment until parent allocation has completed.
 	 */
-	irq_domain_set_info(d,
-			    irq,
-			    hwirq,
-			    gc->irq.chip,
-			    gc,
-			    girq->handler,
-			    NULL, NULL);
-	irq_set_probe(irq);
+	irq_set_chip_data(irq, gc);
+	irq_set_handler(irq, girq->handler);
 
 	/* This parent only handles asserted level IRQs */
 	ret = girq->populate_parent_alloc_arg(gc, &gpio_parent_fwspec,
@@ -1657,12 +1652,17 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
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

