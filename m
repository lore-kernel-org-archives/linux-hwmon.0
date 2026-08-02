Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD720D4F0;
	Sun,  2 Aug 2026 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674253; cv=pass; b=EodBkLLBAQKJzcozTHcRDa6wTtdlRjZsCky8nZ4DmOcwNgF1oCOARO3HYu+0wnuOoAm7Otcto6xyDqr8eJuCNuIcNFSK2fxK4ARyta3ew9LDOXWMjxivw6Zbr1NhKKiaF/O14d6yjPhwR2L51Nzqv7kB7AcQefP9rTmZgfw9riY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674253; c=relaxed/simple;
	bh=0zTRTRhEjy6CcKrNl7N5RAltEsSZuRxN6uJ/gzXhibY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxYVemEJd/ocHIS++QG07aMiEnbqImDaUXXK9Z7Cbf8ItC4LKUmQC3EX1t3ZUl1QFwU8BWvW2ie9OMQX0oGmdzyhU0R6FGHWFtMDiVU0JcNxRvlN2JUiZx+wRpzqALBzvpSdXWA66uGkwCKIaJQr+7epyFYH5pp7Hmxx6lB4FRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=BoHymGqF; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="BoHymGqF"
ARC-Seal: i=1; a=rsa-sha256; t=1785674226; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=VcTMZ3ZEu+lw2IAHbnHGVqat9b7k3Nzt6uQf97pXlc8nPbwFTfGUXGDYX5aoh6wMEzRNJfPgbakv4nVdejsU3mCixA269smfHiR+KUcA+UnsMXrP83VfzUEPmkbMKKtWyGGHGPH1qhWGY/ykHJy0BwJfOCV/AWyg4HiRaDsPINg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785674226; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TmcmCQOKGpvlAIzgzgGfSzGaFbnT6w9tK9lbKo2jeS4=; 
	b=f8TLPwcLdH0GE7W1tJRvw/AN28jWCahTdP7feVGW+3flC89xT7bKOkDCkT/147PgbW7LEwkgojxHCWQpLv5W29qEMaAjaM0US2zu2uZLL60ldgxB+d9LRbNjNOpYuQD9avejaBPuzIHBbHHdMKF6GTV+ZqD/jKmOlNu26witFgM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785674226;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TmcmCQOKGpvlAIzgzgGfSzGaFbnT6w9tK9lbKo2jeS4=;
	b=BoHymGqF7JsVN+zvMkfA7QFBxXvqoIZOYCHK8rg56NKM5jjFwwALFIoYyOiuMGA7
	WGva3FMkglzSCNGJqWVe/xyB9js4Wb4Xhzi03iItI0w4lL+0CopC7lgW6w80c0nVLGL
	ayJPGvZhGVE3WKa53Qs/ax08TDbUyCKDqP4Ax2Pw=
Received: by mx.zoho.eu with SMTPS id 17856742226936.1607663385623255;
	Sun, 2 Aug 2026 14:37:02 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (corsair-psu) serialize debugfs access against hwmon
Date: Sun,  2 Aug 2026 12:36:53 +0000
Message-ID: <20260802123653.19532-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
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
---
This is the fix Guenter asked for in the May thread, written the way he
suggested there. Wilken's patch used a driver private mutex around
corsairpsu_request(); that thread stalled and the race is still present.

Wilken, does this cover the chained command case you were worried about?
As far as I can tell it does: the whole select-rail plus read sequence
now runs under the same lock the hwmon core takes around ->read, so a
debugfs reader cannot land in the middle of one. If you had a case in
mind that this misses, I would rather hear it than guess.

I have no Corsair PSU, so this is reasoned from the code rather than
measured on hardware. What I did check:

  - hwmon_lock() takes hwdev->lock, and the hwmon core takes the same
    mutex around ->read and ->write, so this really does serialize the
    two entry points
  - the lock therefore cannot go into corsairpsu_request(), the sysfs
    path would deadlock on itself
  - probe registers the hwmon device before creating the debugfs files
    and remove tears them down in the opposite order, so priv->hwmon_dev
    is always valid inside a debugfs read

Prior discussion:
  https://lore.kernel.org/all/agR9YW7hGTJ_l7ms@monster.localdomain/

 drivers/hwmon/corsair-psu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index ce958cdaef58..24100519cd83 100644
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
@@ -730,6 +732,8 @@ static int ocpmode_show(struct seq_file *seqf, void *unused)
 	 * getting of the value itself can also fail during this. Because of this every other value
 	 * than OCP_MULTI_RAIL can be considered as "single rail".
 	 */
+	guard(hwmon_lock)(priv->hwmon_dev);
+
 	ret = corsairpsu_get_value(priv, PSU_CMD_OCPMODE, 0, &val);
 	if (ret < 0)
 		seq_puts(seqf, "N/A\n");

base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
-- 
2.55.0

