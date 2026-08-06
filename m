Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E41430783;
	Thu,  6 Aug 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026158; cv=pass; b=BgVsNFhElRlFgBrwK7qYKP92DuuRh/HqLok6Mz2uMRg9Pq/pvEg7gR5zg+f8YYyFia/2KV+Y39hiTQE8mUrDAQWr0K0Dudn8hkIHgHQ9KQ9aTaZOZtPk908HtoOno67q8jHbYqdBz+YQDrFLwpFDkJ/pbK6LkeAnem+qcQxIvBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026158; c=relaxed/simple;
	bh=hEml5iiDIlHIauaR4g003F9Q7iuaWa0UJuKvPQAyF2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5/0cCNZv7QYjoGYMykSve34jBL1XefqSNSctRHKNnIg4MZibfJBu4/uFWskfgW9F7mpmsXnToDrRbmyMJ1jyKpRViJ33+oYiS7cYEp0Ny2iLN4Y0s8bgNqgbt3RiBUEmhZNGXpkbEOv7Ps55fieQLJsTUeDj/xHW5l2gL5230M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=onndHntM; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="onndHntM"
ARC-Seal: i=1; a=rsa-sha256; t=1786026123; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Ly4fxLvQ3EPeqCU4JynBVNNq2dNR855pL/tClGMIWA9v3cZKWzkqbOX/Q6zMfr7Ob/326h3XlTr8VKrlhrFdivYvyK/EIWTB/eoCzZs1aSMRQGee5r8yZFQPGZU1tcXfkBDM+IwoXbf4rYmngrmfVtGKEAp276YNdyixi1iRjcQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1786026123; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pZhnljWS2AXmZbaiObmoA5u+OvcbSU7JBif+WEeWF24=; 
	b=AtSxzfiFf6MOF9EjwzdVlAB5gUV8f7hi1x9nXMGD4RN40B9zD1WWW/003903lJuPrBDL5Ne+SLpMjuuaeGJWjkJO1QZy7HJE/oXcpGiOG3x4TZQCXXQ95H0Ka0oUojPluWUAyuVKwEolhMSLZB6T3OlTQyNz+Cv4a75xUpqwFa8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786026123;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pZhnljWS2AXmZbaiObmoA5u+OvcbSU7JBif+WEeWF24=;
	b=onndHntMQsddr9LGE9+mR+f/kWVKELdWlTCqLx9sdOid6cGADco3+zjZbqoNyYWt
	LvWeQ4kgyY+X2O1SPGcTEi9gOevov1cE8AyKtwgHVeIccYYQpn5a0qkyP7WfSUTiQeS
	7EKsWSkyixB5RX+dFFuKJ6ynAY8z/CEohQtp/mD0=
Received: by mx.zoho.eu with SMTPS id 1786026121215690.6811476033618;
	Thu, 6 Aug 2026 16:22:01 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (corsair-psu) serialize debugfs access against hwmon
Date: Thu,  6 Aug 2026 14:21:39 +0000
Message-ID: <20260806142139.168611-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802123653.19532-1-ali@iusegentoo.com>
References: <20260802123653.19532-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

corsairpsu_request() sends a rail select command and then the actual
read as two separate transfers, both going through the single shared
cmd_buffer and wait_completion in corsairpsu_usb_cmd(). The hwmon core
serializes its own callers, but the debugfs files call
corsairpsu_get_value() directly and never take that lock, so a debugfs
read can land between another reader's rail select and its value read.

The result is a value from the wrong rail reported as the right one,
because corsairpsu_usb_cmd() only checks the command echo and both
transfers echo the command it expects. It can also make a caller consume
the reply meant for the other one, since raw_event() writes into the
shared buffer and completes whoever happens to be waiting.

Locking was dropped in commit 4207069edbf0 ("hwmon: (corsair-psu) Rely
on subsystem locking") on the grounds that the subsystem serializes for
us, which holds for sysfs but not for these files. Take
the same lock in the debugfs paths that issue commands, using the guard
added in commit d1e720c7328e ("hwmon: Support guard() and scoped_guard
for subsystem locks"), as suggested in [1].

The lock cannot go into corsairpsu_request() itself: the hwmon core
already holds it across ->read, so every sysfs read would deadlock.
vendor_show() and product_show() only print strings cached during probe
and issue no command, and corsairpsu_get_criticals() and
corsairpsu_check_cmd_support() run before either interface is
registered, so none of them need it.

[1] https://lore.kernel.org/all/5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net/

Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
Tested-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
---
v2: move the guard in ocpmode_show() above the comment, as asked for in
    the test report. No other change.

Test report, with the runs before and after the change:
  https://lore.kernel.org/all/20260806161028.42218ebd@posteo.net/

v1: https://lore.kernel.org/all/20260802123653.19532-1-ali@iusegentoo.com/

 drivers/hwmon/corsair-psu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index ce958cdaef58..033166db6bc4 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -664,6 +664,8 @@ static void print_uptime(struct seq_file *seqf, u8 cmd)
 	long val;
 	int ret;
 
+	guard(hwmon_lock)(priv->hwmon_dev);
+
 	ret = corsairpsu_get_value(priv, cmd, 0, &val);
 	if (ret < 0) {
 		seq_puts(seqf, "N/A\n");
@@ -723,6 +725,8 @@ static int ocpmode_show(struct seq_file *seqf, void *unused)
 	long val;
 	int ret;
 
+	guard(hwmon_lock)(priv->hwmon_dev);
+
 	/*
 	 * The rail mode is switchable on the fly. The RAW interface can be used for this. But it
 	 * will not be included here, because I consider it somewhat dangerous for the health of the

base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
-- 
2.55.0

