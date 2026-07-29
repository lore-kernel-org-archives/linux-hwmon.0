Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF93642901F;
	Wed, 29 Jul 2026 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361917; cv=none; b=oH1+JHszAUSOTMtooMcfy3RRRqvQ8pzsSZE2YGxJf5Ke9kgN5XU8gPEBwb+qjFjE+JEflYm5w+rL5QppWHAZTibBuOuCDP+nfn3CshbA9UwUqPrsyGL5OmYCrLwK7wxqYL+wD9jHbRLQX2rNrGlRfKErCwyFk9Ax+ZnV+Kmp3yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361917; c=relaxed/simple;
	bh=t0ItoJkP5AOJbes4r2DojGybHwF3JitBeCkE794Jdvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyRREkyHCntYvkRgVdvFWsBYdTHGYri/Y7JoaHjGx9XjHdYP+ha0WMwiHUcDXRFpYiwo0Gc3epA58iSGf3P8AaJp+k8/mde1y7O4g+zQ6Tp+tzARWcz6Lk5lBIuWSro3yU47lt0DvSIAaZIWQ2fGtRStpfqH2SPVM6ZVZuyhMVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKNpgXyB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKNpgXyB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4EA8C2BCB3;
	Wed, 29 Jul 2026 21:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785361915;
	bh=t0ItoJkP5AOJbes4r2DojGybHwF3JitBeCkE794Jdvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QKNpgXyBDJ26pJ0tG60BH14UN5GfLJkSkOaa0/yHoISRuOyjLYbn/edVu1XTdWQJy
	 7MqAV2lXdorSYxyIrxzSOkcemjuIc+FVBKGqYPxYKym9o0MlM6KnMEnTFRkRgm4OJq
	 +X3yf73AvZZ2CVZrhSHcQcyhc+byaKi3bXrKvjd0CKWIa0UViY5RzHhJIEVxaUxBz7
	 SnKTeOedrVf/R8f+EfSAYbyfhgHSkqHWc0uRXJ1ktSU1E0SgsME7rnUJSIIOlKriYL
	 1tsisjUeHXX4v1ep0Tu85yRojXgpnEWDaIF+TmySFK2c7q4tli3SLrW7izqHOseMJO
	 fDtzClnls7c7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FCCC54F51;
	Wed, 29 Jul 2026 21:51:55 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 29 Jul 2026 23:51:43 +0200
Subject: [PATCH v6 1/4] hwmon: (pmbus/core) export
 pmbus_check_and_notify_faults()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mpq8646_v0-v6-1-98848151cdb4@free.fr>
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
In-Reply-To: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785361913; l=2454;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=5jcbiv8ttuTHSkeFOtZkPoUuH9LONtMGA1eeXSbtKBk=;
 b=7xUVCOm0uozbujreA12Tz3bZRH0iInaifglvQsqS0HLgsqeqD0ggzV2ioVQkskk+VkrEcNcHn
 BEyCUPCIeRSDtjLNCBPRCeAPpkX9FlK6jDVyattocaTjS+G01Bwwxvc
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Factor of pmbus_fault_handler() into an exported helper so
drivers can notify sequence from a polling work item on boards
for which the chip's SMBALERT# pin is not wired to the
CPU. The interrupt handler becomes a thin wrapper.

Like the SMBALERT# path, the helper notifies and then clears the
latched faults unconditionally, so a polling caller inherits exactly
the interrupt semantics.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/hwmon/pmbus/pmbus.h      |  1 +
 drivers/hwmon/pmbus/pmbus_core.c | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 23e3eda58870..1504d8b9e34c 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -560,6 +560,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
 int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 			   u8 mask, u8 value);
 void pmbus_clear_faults(struct i2c_client *client);
+void pmbus_check_and_notify_faults(struct i2c_client *client);
 bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
 bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
 int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3143b9e0316c..c52052b30bc8 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3437,10 +3437,9 @@ static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg,
 	return ret;
 }
 
-static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
+void pmbus_check_and_notify_faults(struct i2c_client *client)
 {
-	struct pmbus_data *data = pdata;
-	struct i2c_client *client = to_i2c_client(data->dev);
+	struct pmbus_data *data = i2c_get_clientdata(client);
 	int i, status, event;
 
 	guard(pmbus_lock)(client);
@@ -3453,6 +3452,15 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 	}
 
 	pmbus_clear_faults(client);
+}
+EXPORT_SYMBOL_NS_GPL(pmbus_check_and_notify_faults, "PMBUS");
+
+static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
+{
+	struct pmbus_data *data = pdata;
+	struct i2c_client *client = to_i2c_client(data->dev);
+
+	pmbus_check_and_notify_faults(client);
 
 	return IRQ_HANDLED;
 }

-- 
2.43.0


