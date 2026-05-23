Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE082D73A1
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 05:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779513089; cv=none; b=DVQ4SOws5wCrcpVqyBvB+Yp1OfBEKKUVPzNiqSGeHog2QiwQBoNnj3CqDAthUaabiQVLI1Toh/UGcJq1LyKy48JwVwL7OxKm/pZQDLN8sdZFp/+vgdHGT73PFY/vPIZVa2Yxwk72omXt+SLPA7ej80uTUzJ/GhhLk1798m0sEok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779513089; c=relaxed/simple;
	bh=Nu6W8k5XOMh2AJzVorqKOmSvKAncLNWlkoLvaNf337Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LoXvGkwlY5SMBPpqjcIjPEpCyocnEJ3+WKAVe2NfLb8uw4rtPpGdlJ5fgeiEJWZSutgyi8ChNJSoBPw0lPdkHsFUuw/VlTfjndUqUdjAxLJ75r9xO5kGopWlXcGTBMUFAguwmMPAgWKOSlEvspuouRM8/C8PO85o5SsHU/uTIL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXfm/n3V; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXfm/n3V"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba4efedbeaso59843575ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 22:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779513087; x=1780117887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OQ36cdauGD0igpnQwY9ngpIaWyW9GdP1S4Xkn70B54k=;
        b=hXfm/n3VoHyVwqsdTSnVKb+RuAeyEei/DlEtxtN8CCWMx3pj2HedM2gqgUwMaryj6E
         urkIV2UUG0ktdBS+To5Or7oX1KhkLGRukQiLVJ06WM+0F/1/kyPhUygfLic+179rEb2w
         bd5lACupf+UuqN/W105C1iCkewcfXJ3wjwleqWhTqCKIQZtm9HO3MLL0Y55AgJNvBi71
         KR4nxeiqhzsCCnu/LlSTfXm9zPKofxNNhdKPrvVh0IBd2kYmlw7gkfKVdmbRFHk2gnCW
         kmX6hzLft6KXIJk8qttQmsgnX9jXTAfollIhJV+WV5aJ3nvWvPp8lghC2oxL8gdjcH3Y
         1+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779513087; x=1780117887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQ36cdauGD0igpnQwY9ngpIaWyW9GdP1S4Xkn70B54k=;
        b=anN0hWJ8hChl64SQEHu3BZbI2COfS+uuRlh8UPOgfN4D0rQRh2/H23Lm5XCWYLnh37
         vS49ovc+3pjqlLrTWlbXycunWtt5OKQsppOuOwk2Gjn7jUS4iS45b94NWipq9aPU68vl
         40Oa2nmAdnetin4pP/7UtzNvuFeDE21WX6TnZN0kV4ihdT8lnmCTJs/FdUDoFAbzidVq
         O41rDR5xvlKj5xtC3hm4SPEJtLlQfeqCebdpj2UpcMXYF3u45qDd5KKdsMdJlKGnEvD3
         aREbOmOfZQaj3/5Byg1ENDg8TvQ0dIW6ibucvwEQ8lo61fEFVAK5K+lUZhGqQkSHCysT
         D+LQ==
X-Gm-Message-State: AOJu0YynazLoAdmo07/nOZFik+8b+3NVLglI1D79Pin+elaTozHdWysp
	axCIMun6hVkG/PBlJO0ySjMDQHSUYrlFvzwwQxbKhwyAHf9I9uJ8pL9X
X-Gm-Gg: Acq92OHFv9DIfbQr2kIeDa6UpUw7PXwXGDcgzV2h+dJPN45k3uM5sZ0DZkxb/+gMJWJ
	xH7E21NGZhklhkACRgW1fd407x1SdULPohX2YmTDEK0xR30ApyzSkcA2gycCoNj7YQPhjHgm2Vt
	7Tq/8my2pXeI88rA37qT2AUGl4iT7MkjDibFDD+uBslzYwFutNvD4vlcKge8miNCXQiIEG2EHyS
	E0UqV20bqcygnDwjhUzq3vM/EzqxHGj0wLEH/+qp/AZcOmYz5uESH3g62jIH6tqOOw+aQmRh0u3
	xXZfKmR5xcNDgNy7HEsKqwKcDt4VEdRfLzm+MHxXmwRwiFGEQ6hOPIipuRJIX7CNfQHrSoIcMtD
	9LcUhlqliYt3dMyxsSHxRHzIDUyx8+1phWzVgW7I9G/pnxjzkSKBoxg8xkLSpII+R9mT/K0d6bQ
	BhxClPx8xIWm8BfhLWMrchv1D/iscfTR5mBDrmYsdLw6sK+QZAMyg1xoCImgocNXIIzg6pblxd+
	d2WTqu68dAfYzeKL4ewnNhTCw1jcfXBaZgsFjb0WH1y0y+gYK1MsLc2HEwFLDA/QIYu
X-Received: by 2002:a17:902:d4c3:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2beb065ba47mr67303165ad.21.1779513086848;
        Fri, 22 May 2026 22:11:26 -0700 (PDT)
Received: from ERIC039ERIC (123-192-112-211.dynamic.kbronet.com.tw. [123.192.112.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3c92sm34935585ad.42.2026.05.22.22.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:11:26 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] hwmon: (fschmd) avoid client->dev dereference in watchdog_release
Date: Sat, 23 May 2026 13:10:53 +0800
Message-ID: <20260523051117.9400-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fschmd_remove() can detach the i2c client while the watchdog device
is still open.

If watchdog_release() later takes the unexpected-close path, it calls
watchdog_trigger() and then logs the event with dev_crit() using
data->client->dev. However, the client may already have been cleared
by the remove path.

watchdog_trigger() already checks whether data->client is still valid
and returns -ENODEV if the client is gone. Use its return value to
decide whether to emit the message, and log with watchdog_name instead
of dereferencing data->client->dev.

This avoids relying on a device pointer that may no longer be valid
during release after device removal.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 drivers/hwmon/fschmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
index 1211fa2259e5..d1e7fc72e81f 100644
--- a/drivers/hwmon/fschmd.c
+++ b/drivers/hwmon/fschmd.c
@@ -834,9 +834,9 @@ static int watchdog_release(struct inode *inode, struct file *filp)
 		watchdog_stop(data);
 		data->watchdog_expect_close = 0;
 	} else {
-		watchdog_trigger(data);
-		dev_crit(&data->client->dev,
-			"unexpected close, not stopping watchdog!\n");
+		if (!watchdog_trigger(data))
+			pr_crit("%s: unexpected close, not stopping watchdog!\n",
+				data->watchdog_name);
 	}
 
 	clear_bit(0, &data->watchdog_is_open);
-- 
2.53.0

