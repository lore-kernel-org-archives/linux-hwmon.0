Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939226;
	b=kljGnLe4bAtN2C7GvMJT06HKEXBIM2TEvy4sn+NwT+JjSA49xJT7t/a9D5Pax7s1RYng
	 ToUywvbisQPaSquhqCGDBux6ChvFFhyaJOe4dkIUKgHKS3wpElp8CFUPLzJ3IuZFyE22+
	 nQ74zLX/BvUxTPMz0W6t43Aph+oyU98nOrG9uS5A2rJT8QI6OHBDW+CPMGDX2oAADax/q
	 skpZijEEjS/BFOxsX4L/926bKA/8gxf/cjuRu3H7VpAltVhZ30Sd9frPAo3kKmoNH1Bgd
	 WJrihMbd0f8Z37Z05yJErXMjhqefRk72E8ws8FiH6/vxldYeXxseIh8O0MRZHP1/0jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IuYcK6POn3Fh+YsuRaRqnwwoF9K4vM06+qI0JevesZE=;
	b=eUIHrRjbBAXGmvlvmV4DrzSZBrGir8ZYP8jur3S8iM4iqzCf9j43q2FBOHyUNrgFC8Vx
	 4jVTtcCuEt7Vw0mYD1VL3V2O87819/YV2hYijxm9khkDxfXIITcpLBg51C7UcB5ssxakV
	 1dXvH33qu2nL5xCHlWLlWfJvdL9Sw+2UPpzqUHEC4r95sKU1BJp6mRKdGPxkgm4T+1y5Q
	 sUvfB4twxU+43EQ2k9z79iTvxYz2XolsW50SZJrA1rGZvvEXaydTTXIFja7md+ZsnzD1c
	 +xLvqv8/uS2zAB3rShFZMP6nvUpXk0fX2VJ6uUhVRLch6bmOQrBUQkfCDMSwM0Y9IcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wym1GRZk;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AAB606A33F
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34AAB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wym1GRZk
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4d26094beso254517b3.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 10:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939224; x=1795544024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IuYcK6POn3Fh+YsuRaRqnwwoF9K4vM06+qI0JevesZE=;
        b=Wym1GRZkc21wzLnSjY5QqM5geVgDbeODScfg36VVmBeUYBnGA5iLSeSjW8LZMbEc7/
         QKHXoR7WIv62SSCBm3cNymGA/nOujkDT/QBUk/xJY/bTQJhoYJ6xn98mUnbYr5o/b5LN
         xRJH9DmsvPU94PS1SoGU0SKR/CUmgT21/m1TatI2Pjgmkj66EIxFxQeEfm/AoKVN4lXY
         qOJfIRQ3ZDTulWpHxQApk49VeCZJbqpAoy7OC/xTQil44RJ9zXD8uV1xuILEx1gVUUFl
         l6qM4Bjyj459kwPSXj/4zP43Ldm4W0CV3XTP/vFsHpgy9IU8AQ1ItSGhU1LDhJFNDGQK
         ltyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939224; x=1795544024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IuYcK6POn3Fh+YsuRaRqnwwoF9K4vM06+qI0JevesZE=;
        b=aN+eGtuufrJhiNHAe832Fke9dJyKEtm/7lQJxRJcjmAq3yU8LMi0kn5ABInPsl9L8I
         2Wy1VcS3ESq4Z8AruRE8io4G1vDCw73ZWrSFMQrnt1SV8ZRAvsVf44kZDmo51pWX+3SX
         T4fY6mtNt9tMEijDGGS9ktLn7U9Zwr2NJtD0j6QFYt6527lSd9e20Ft9tsbtHDr2nAOW
         VD7l8XLlQoAY79Lb2Hm0/f0Z+v3AZUrBZtAlNXCgLRZUyaIwSafRu8PPGHTwzIkCpIez
         XaTxSDr0kFoQlaOLWxdDjIvb6Zb5guz4IWL+kIfmQxOHmx/N06TMDmIKMt4YGsomE9yS
         y7eA==
X-Forwarded-Encrypted: i=1; AL+hErH4jCDvypplgGYTBdk7O+OBexWc0K7Z+xNcawZQEwD/eNr/4bgqKfalyIdPzWORoljshJ8DuOH7H4dW0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ag4uTuRiNwcLhRSnjTplS7wHkvVcLL6bSEWy02ql63xzTh9fq
	L+faK5jaUgf4IeWCQQ+yYFQDdh67j1zQlc5u8ZXywLMb8stAJ7QwSLMd
X-Gm-Gg: AZFdTZfM6Ht1XlsBIWR+VKeOjVKHL22f1765A+tD0d1RLEimGnnY+qIjXwu2DoM19DO
	KjtT5E7byxbd4L9HcvwkifswfrexpfrxY9JJcyIdvEJAfzAIcp+KFYiEmX8X6tRMZPR+SjtPHot
	FUecGKY5ZHAh3Uu6Et+rc4To+2AKY694pwCyRB9Hs2Bf8CKhM4tLnwWp4xB355OhWck9x4AGK9c
	cb4DXMmdhXAyCb6axOnrkSpX3JNLZYokbhQzDrQKAKIowdRrRcf7DevwDfTenPAc3K/0wfROnze
	oP3Qbc725779qz57D4xKDCQOt8JmEY3zN571w+AXoZYEQh5/xLIu10tU289bZbEN7hh3ECLqdLl
	isRD+LL7sJabUtUHbIMpQJxs1Aqa2eyp8wQY6AOVS6Hwyxm9L223/5gLQA6ZJRy8rTr8LjVxd2H
	YTnwhKpuw/GnsaFsm5OCYPHk8dvqqIwC8pXhnRr4Rlay9uN8UQYjQ6Fafy3s9xZS4FB/oVwZz6P
	6A4Ia5K70Tmz/fODvVJSSA5JfJ/bQRY6HOWnQ4UjCc1zQGFud9Xpip7n6ilf+SDOHcneGjE3nE1
	bm/osrLIG3AWXh22qjcaFlXwvwXbR3lTSz6t7ej8HHtUJgmTZQqBelnuXkkGC6/qpvnKV7UymxV
	UUonVvDqDXkO++Rk8RijxukxTY9+cgvwdaBiJrPbFH1QFlgcVwXq55r8FhzR/1O1Yuu4hsZ50M+
	0IaRWY/6yarBOLe8K0qA==
X-Received: by 2002:a05:690c:6205:b0:8b1:60a1:cd3c with SMTP id 00721157ae682-8b4fed431e4mr442717b3.41.1794939224207;
        Tue, 17 Nov 2026 10:13:44 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe0f80f1sm2669347b3.33.2026.11.17.10.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:43 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:34 -0500
Subject: [PATCH v3 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
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
Message-Id: <20261117-marvel-env-v3-7-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6655; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=+P2pTQt9/bKPVo47kcpEHymbU8gDtXJK4HPYzUH7m8w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPS495XFuGzV11U1771MTLM1Nl7Yrd3O8GliWS/Xz
 Q6TLyEdHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHONsT0jw60TO3TPHK
 tt2hH34CSH7/1Hx11fn83mlZkpv0iz9EfBopmMDJOeaU1LOX04TNjwb8iiuT9negvsl04tS9H/W
 vyXI1JsGQMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The firmware reports each change of a sensor's state as a system event
machine check. On one, reread every node from a workqueue and notify
userspace of each alarm attribute whose value changed. The notifier runs
in machine check context, so it only queues an irq_work, which queues
the work. The work takes the hwmon device lock to serialize the refresh
with the sysfs callbacks.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/hwmon/marvel-env.rst |  4 ++
 drivers/hwmon/Kconfig              |  1 +
 drivers/hwmon/marvel-env.c         | 89 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/marvel-env.rst
index 02d5241749bc..4123c44fd2c1 100644
--- a/Documentation/hwmon/marvel-env.rst
+++ b/Documentation/hwmon/marvel-env.rst
@@ -26,6 +26,10 @@ cabinet and drawer numbers.
 A refresh keeps the boot CPU in the console with interrupts disabled for up
 to 300 ms per unit, so a unit is refreshed at most once every 10 seconds.
 
+The firmware also reports every change of state as a system event machine
+check. When one arrives, the driver refreshes all units and notifies
+userspace through the alarm attributes.
+
 Sysfs entries
 -------------
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index c0ce5591c82d..99c5d84c8752 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
 config SENSORS_MARVEL_ENV
 	tristate "Marvel (EV7) AlphaServer environmental sensors"
 	depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_ADDRESS)
+	select IRQ_WORK
 	help
 	  If you say yes here you get support for the temperature, fan,
 	  voltage and power supply sensors of Marvel AlphaServers (the
diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
index 25c0ecef8e1d..622760e7ee7c 100644
--- a/drivers/hwmon/marvel-env.c
+++ b/drivers/hwmon/marvel-env.c
@@ -17,12 +17,15 @@
  */
 
 #include <linux/hwmon.h>
+#include <linux/irq_work.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #include <asm/gct.h>
 #include <asm/marvel_env.h>
@@ -97,16 +100,21 @@ struct marvel_env_chan {
 	unsigned int pkt;		/* packet offset in the node */
 	bool ps;			/* power supply, as an in channel */
 	bool present;			/* known when the driver loaded */
+	u32 alarms;			/* alarm attributes last reported */
 	char label[32];
 };
 
 struct marvel_env_data {
 	struct device *dev;
+	struct device *hwmon;
 	struct marvel_env_node *nodes;
 	unsigned int nr_nodes, max_nodes;
 	struct marvel_env_chan *chans[hwmon_max];
 	unsigned int nr_chans[hwmon_max], max_chans[hwmon_max];
 	bool multi_drawer;		/* label with cabinet and drawer */
+	struct irq_work irq_work;
+	struct work_struct work;
+	struct notifier_block nb;
 };
 
 static const char * const pe_names[] = {
@@ -293,6 +301,7 @@ static void marvel_env_add_chan(struct marvel_env_data *data,
 	c->ps = ps;
 	status = marvel_env_status(type, c);
 	c->present = env_status_valid(status);
+	c->alarms = marvel_env_alarms(type, c, status);
 
 	if (data->multi_drawer)
 		len = scnprintf(c->label, sizeof(c->label), "Cab%u Dra%u ",
@@ -498,6 +507,72 @@ static u32 marvel_env_config(enum hwmon_sensor_types type,
 	}
 }
 
+/* Reread everything after a system event and report changed alarms. */
+static void marvel_env_event_work(struct work_struct *work)
+{
+	struct marvel_env_data *data =
+		container_of(work, struct marvel_env_data, work);
+	unsigned int i, k;
+
+	guard(hwmon_lock)(data->hwmon);
+
+	for (i = 0; i < data->nr_nodes; i++) {
+		data->nodes[i].valid = false;
+		marvel_env_refresh(data, &data->nodes[i]);
+	}
+
+	for (k = 0; k < ARRAY_SIZE(marvel_env_types); k++) {
+		enum hwmon_sensor_types type = marvel_env_types[k];
+
+		for (i = 0; i < data->nr_chans[type]; i++) {
+			struct marvel_env_chan *c = &data->chans[type][i];
+			unsigned long changed;
+			unsigned int attr;
+			u8 status;
+			u32 alarms;
+
+			if (!c->present)
+				continue;
+			status = marvel_env_status(type, c);
+			if (!env_status_valid(status))
+				continue;
+			alarms = marvel_env_alarms(type, c, status);
+			changed = alarms ^ c->alarms;
+			c->alarms = alarms;
+			for_each_set_bit(attr, &changed, 32)
+				hwmon_notify_event(data->hwmon, type, attr, i);
+		}
+	}
+}
+
+static void marvel_env_irq_work(struct irq_work *irq_work)
+{
+	struct marvel_env_data *data =
+		container_of(irq_work, struct marvel_env_data, irq_work);
+
+	schedule_work(&data->work);
+}
+
+/* Runs in machine check context, so only queue the irq_work. */
+static int marvel_env_event(struct notifier_block *nb, unsigned long action,
+			    void *unused)
+{
+	struct marvel_env_data *data =
+		container_of(nb, struct marvel_env_data, nb);
+
+	irq_work_queue(&data->irq_work);
+	return NOTIFY_OK;
+}
+
+static void marvel_env_unregister(void *arg)
+{
+	struct marvel_env_data *data = arg;
+
+	atomic_notifier_chain_unregister(&marvel_env_notifier, &data->nb);
+	irq_work_sync(&data->irq_work);
+	cancel_work_sync(&data->work);
+}
+
 static int marvel_env_probe(struct platform_device *pdev)
 {
 	u32 *config[hwmon_max] = { };
@@ -505,7 +580,6 @@ static int marvel_env_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **info;
 	struct marvel_env_data *data;
 	struct hwmon_chip_info *chip;
-	struct device *hwmon;
 	unsigned int i, k, nr_info = 0;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -579,9 +653,16 @@ static int marvel_env_probe(struct platform_device *pdev)
 	chip->ops = &marvel_env_ops;
 	chip->info = info;
 
-	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data, chip,
-						     NULL);
-	return PTR_ERR_OR_ZERO(hwmon);
+	data->hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data,
+							   chip, NULL);
+	if (IS_ERR(data->hwmon))
+		return PTR_ERR(data->hwmon);
+
+	init_irq_work(&data->irq_work, marvel_env_irq_work);
+	INIT_WORK(&data->work, marvel_env_event_work);
+	data->nb.notifier_call = marvel_env_event;
+	atomic_notifier_chain_register(&marvel_env_notifier, &data->nb);
+	return devm_add_action_or_reset(dev, marvel_env_unregister, data);
 }
 
 static struct platform_driver marvel_env_driver = {

-- 
2.56.1

