Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793260091;
	b=vBtE9YZuVyShyi6qSmrKaOumXK9TQZ7glbGw8mZ11yGSHDA9sVwfcXy+Isr+76mkUn4H
	 jFGkl5emROpJPidwpNtTMXZiElVQUe4w+e+5nL8T5yrG2h8t6yBjDfngRmXjYj8WX6bfE
	 Ots85cV26BP6npnzxWgWeKTO/Oht4E5wGbBvwIQV50wsLCYrq6vjkP8D5w11fMyHD4fBV
	 6Ygmdx3YnEkTsEaAZ5poELHe5zgI0FYqMAZfiMgeTI2SOeuoP7yCYD6Hbe+v1z7MtDjSV
	 zaHH5wxfHv1xBAauoCNIPC+GJQsem/yBFv/96gfY7ZOmiERhVq7var7IJu79Won5YyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260091;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kLPsObaT6f/PPOqYyCA0kMg08YEwAESLQry3ZVb28XY=;
	b=l8JeMmCJUAVKohtb1yFCTrTQKLVLLz81hyMkOQWBC13p3WaVcGEA2Bpi1oedmK/Jbe5Q
	 lMM8ihZUDSdY4r84OC5X3g7X6GyEbMApOGc2unsz6nAsXMYzhI2/Usbw5iJlCauNq2leI
	 nUbwT9a0d3C3ApkT3+T3oeki4Ns78VSdL0zrynOQHxqInKFSGVOxb1Yu68oeDWk7ZmjE3
	 iInOOy/03WfbjN1d/yfPyt6iedFJamvd64bY0Yyw/hPixgjzNNXMr0IQcY9uXgcfKG01B
	 DpTztPhypHd/Uo4zYucxeEhD3KlIghCLNnon/xRpBEJOfLFD24FXn+2UFHaEqwoF72Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nXGvRbc0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76382606A31D;
	Thu, 29 Oct 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nXGvRbc0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793260090;
	b=g8YN6WcNBE/WeUSixnomOIge6T+yjJcmw+EPPjh34EhOdgwQpWJQS2kLE6Y3QoHJfH2N
	 NBBY3EeTCyLsclfPJdcgoWDmN5vPJxyBdmIXHK2sNm7Wt9Wnp64VswfH8wxQXgq9T6heV
	 84kEDcAc7rec0EbBsgKT2GF16fzJ/K7+GKoIs7lupxwE3Rxd3u4hLUb2d3JiEIWC6K0tP
	 +Mr9NTwzfR4mTV1e2PkNjP1YlPnUv40fhQy6dV6L3Y2oQQVkdJwFP62sW9DnUpx2wn4YI
	 oX/6lVV/CPOP2kAlpH0qJE9hJZEjJr+BkWN6bCn80f28h0mJbYxIHdAOX+Wg4GTIt4w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793260090;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kLPsObaT6f/PPOqYyCA0kMg08YEwAESLQry3ZVb28XY=;
	b=ocLdFtbGOaVqmTwooG/HhkMAsN3qDUOhr8oI97lO/pSTfGPqFEfy8mK99CGul2GIG5B9
	 qo6EbiY3cNF+tYFW1AKzBca/Q7/oyZpYvV/sWaprs/tVwBQZ8dWa8DFPW+lE86BP7ofGw
	 aHRf76EG9EZ8LztvcFhC/zZ6mqyw+9wEGbK+y9lOG76bGwKi4CuOscGzqmfoNW6/ZM6PT
	 Mb24S+QfUfIA9aOdZWK9hJiMt5nld3rzdA4DxPQkrbB9jMYMaUknfER06LSow8Wy4zmQn
	 8CPUgV99zMtf7TP9QdmyBU+WnOWQgJ8AvrJ3Zg2NTUwrZSeG5q9RZdvWGX3pCGCzXAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 217E01F01829;
	Thu, 29 Oct 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793260090;
	bh=kLPsObaT6f/PPOqYyCA0kMg08YEwAESLQry3ZVb28XY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nXGvRbc0lQvqE8SMg05FrZECiXSMuoPggUsUNQ2k3RhR4SpD9gPnzCgNGat5lyUGU
	 9j5fIjUsMWX4OELOnDqqceKJu0BvHpwf0cZqMv+NHvWdrPos6ZoDTm8j1y5JM4CXI3
	 WkGLnWCQCMkA7lqKhf4RsEPIlorWuk6AtW58ZLbBFyQLuw1uXx6m0sdeGVjMVOhOhN
	 ZbD63SfPin0ZdKZd99RW6EqyxDYkrbF3sJPQcJCNPGJSxEbZ1EikoVBL3tXOXUzy6J
	 B6cHk99SbMDkO3Y4aXgme5oulxcLqzvDq3YhBKuMti0qJ2nhlKMzOlSL0hDuVKMLOB
	 wLEEvI0wG9bhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 88CBE4571A;
	Thu, 29 Oct 2026 07:48:08 +0000 (UTC)
From: Remy Demangeot via B4 Relay <devnull+remy.demangeot.net@kernel.org>
Date: Thu, 29 Oct 2026 08:48:02 +0100
Subject: [PATCH v2 1/2] ACPI: EC: allow drivers to create a polled EC
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
Message-Id: <20261029-m9e-ec2-v2-1-e9c4e2ba8415@demangeot.net>
References: <20261029-m9e-ec2-v2-0-e9c4e2ba8415@demangeot.net>
In-Reply-To: <20261029-m9e-ec2-v2-0-e9c4e2ba8415@demangeot.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Eugene Shalygin <eugene.shalygin@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Remy Demangeot <remy@demangeot.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793260087; l=5632;
 i=remy@demangeot.net; s=20261015; h=from:subject:message-id;
 bh=/cs87yafgZ1YRaT6jFA1fah9Em8PNXk59oRg4Wxln8U=;
 b=SJGYtPngqwrsMY4JTdkpDFBhIAECWlUUIsYKw5585DN4UsoU7Fx7Mt6Jv/SYCNPECjwUwVhtG
 gquoTchcIAhBHpIF/H8nWPTyU1qNGX4VmBFZIFINuLY0Cz6BTD7ifuf
X-Developer-Key: i=remy@demangeot.net; a=ed25519;
 pk=h/s5N2ZlgZ0m+8FpMhSaCNJt0jvb9whRBAdJwpC+VAo=
X-Endpoint-Received: by B4 Relay for remy@demangeot.net/20261015 with
 auth_id=1194
X-Original-From: Remy Demangeot <remy@demangeot.net>
Reply-To: remy@demangeot.net
Content-Transfer-Encoding: 7bit

From: Remy Demangeot <remy@demangeot.net>

Some boards have a second embedded controller that uses the standard EC
protocol but is not described in the ACPI tables. For example, the ASUS
ROG MAXIMUS IX EXTREME has one at I/O ports 0x68/0x6c that holds the
water temperature sensors. Its DSDT has no EC device for it: only a WMI
method writes to these ports directly.

Add acpi_ec_create_polled() and acpi_ec_destroy_polled() so that a
driver can create a struct acpi_ec for such a controller, and
acpi_ec_read_byte() and acpi_ec_write_byte() to access it. The EC is
used in busy polling mode, like the boot EC before its GPE handler is
installed: no GPE, no IRQ, no query events and no address space handler.

An EC with neither a GPE nor an IRQ must not touch any interrupt when
its events are masked or unmasked, so check ec->irq there too.

Signed-off-by: Remy Demangeot <remy@demangeot.net>
---
 drivers/acpi/ec.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/acpi.h |  8 +++++
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/ec.c b/drivers/acpi/ec.c
index a89f10256dbb85768b86a2a970c75a7d8e3814fa..48e83e84cfdb64c28adedcb77fce29affc956e4c 100644
--- a/drivers/acpi/ec.c
+++ b/drivers/acpi/ec.c
@@ -401,7 +401,7 @@ static void acpi_ec_mask_events(struct acpi_ec *ec)
 	if (!test_bit(EC_FLAGS_EVENTS_MASKED, &ec->flags)) {
 		if (ec->gpe >= 0)
 			acpi_ec_disable_gpe(ec, false);
-		else
+		else if (ec->irq >= 0)
 			disable_irq_nosync(ec->irq);
 
 		ec_dbg_drv("Polling enabled");
@@ -415,7 +415,7 @@ static void acpi_ec_unmask_events(struct acpi_ec *ec)
 		clear_bit(EC_FLAGS_EVENTS_MASKED, &ec->flags);
 		if (ec->gpe >= 0)
 			acpi_ec_enable_gpe(ec, false);
-		else
+		else if (ec->irq >= 0)
 			enable_irq(ec->irq);
 
 		ec_dbg_drv("Polling disabled");
@@ -934,6 +934,34 @@ int ec_write(u8 addr, u8 val)
 }
 EXPORT_SYMBOL(ec_write);
 
+/**
+ * acpi_ec_read_byte - read a register of a given EC
+ * @ec: the EC, e.g. from acpi_ec_create_polled()
+ * @addr: register address
+ * @val: where to store the value
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int acpi_ec_read_byte(struct acpi_ec *ec, u8 addr, u8 *val)
+{
+	return acpi_ec_read(ec, addr, val);
+}
+EXPORT_SYMBOL_GPL(acpi_ec_read_byte);
+
+/**
+ * acpi_ec_write_byte - write a register of a given EC
+ * @ec: the EC, e.g. from acpi_ec_create_polled()
+ * @addr: register address
+ * @val: value to write
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int acpi_ec_write_byte(struct acpi_ec *ec, u8 addr, u8 val)
+{
+	return acpi_ec_write(ec, addr, val);
+}
+EXPORT_SYMBOL_GPL(acpi_ec_write_byte);
+
 int ec_transaction(u8 command,
 		   const u8 *wdata, unsigned wdata_len,
 		   u8 *rdata, unsigned rdata_len)
@@ -1436,6 +1464,63 @@ static struct acpi_ec *acpi_ec_alloc(void)
 	return ec;
 }
 
+/**
+ * acpi_ec_create_polled - create an EC that is not described by ACPI
+ * @command_addr: I/O port of the command/status register
+ * @data_addr: I/O port of the data register
+ * @name: name used to request the I/O ports
+ *
+ * Some boards have additional embedded controllers that use the standard
+ * EC protocol but are not described in the ACPI tables. This creates a
+ * struct acpi_ec for such a controller, to be used with acpi_ec_read_byte()
+ * and acpi_ec_write_byte(). It only works in busy polling mode: no GPE, no
+ * IRQ, no query events and no address space handler.
+ *
+ * Return: the new EC, or an ERR_PTR() on failure.
+ */
+struct acpi_ec *acpi_ec_create_polled(unsigned long command_addr,
+				      unsigned long data_addr,
+				      const char *name)
+{
+	struct acpi_ec *ec;
+
+	if (!request_region(data_addr, 1, name))
+		return ERR_PTR(-EBUSY);
+	if (!request_region(command_addr, 1, name)) {
+		release_region(data_addr, 1);
+		return ERR_PTR(-EBUSY);
+	}
+
+	ec = acpi_ec_alloc();
+	if (!ec) {
+		release_region(command_addr, 1);
+		release_region(data_addr, 1);
+		return ERR_PTR(-ENOMEM);
+	}
+	ec->command_addr = command_addr;
+	ec->data_addr = data_addr;
+	acpi_ec_start(ec, false);
+
+	return ec;
+}
+EXPORT_SYMBOL_GPL(acpi_ec_create_polled);
+
+/**
+ * acpi_ec_destroy_polled - destroy an EC created by acpi_ec_create_polled()
+ * @ec: the EC to destroy, may be NULL or an ERR_PTR()
+ */
+void acpi_ec_destroy_polled(struct acpi_ec *ec)
+{
+	if (IS_ERR_OR_NULL(ec))
+		return;
+
+	acpi_ec_stop(ec, false);
+	release_region(ec->command_addr, 1);
+	release_region(ec->data_addr, 1);
+	kfree(ec);
+}
+EXPORT_SYMBOL_GPL(acpi_ec_destroy_polled);
+
 static acpi_status
 acpi_ec_register_query_methods(acpi_handle handle, u32 level,
 			       void *context, void **return_value)
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index ddacac81209473cfc5fc83047a0de91c07ceb7b5..d657a94aed5dd90c2ba0c8c2784c7a0cb0fb3bc2 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -432,6 +432,14 @@ extern int ec_transaction(u8 command,
                           u8 *rdata, unsigned rdata_len);
 extern acpi_handle ec_get_handle(void);
 
+struct acpi_ec;
+struct acpi_ec *acpi_ec_create_polled(unsigned long command_addr,
+				      unsigned long data_addr,
+				      const char *name);
+void acpi_ec_destroy_polled(struct acpi_ec *ec);
+int acpi_ec_read_byte(struct acpi_ec *ec, u8 addr, u8 *val);
+int acpi_ec_write_byte(struct acpi_ec *ec, u8 addr, u8 val);
+
 extern bool acpi_is_pnp_device(struct acpi_device *);
 
 #if defined(CONFIG_ACPI_WMI) || defined(CONFIG_ACPI_WMI_MODULE)

-- 
2.47.3


